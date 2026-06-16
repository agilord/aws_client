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
class BedrockAgent {
  final _s.RestJsonProtocol _protocol;
  BedrockAgent({
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

  /// Validates the definition of a flow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [definition] :
  /// The definition of a flow to validate.
  Future<ValidateFlowDefinitionResponse> validateFlowDefinition({
    required FlowDefinition definition,
  }) async {
    final $payload = <String, dynamic>{
      'definition': definition,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/flows/validate-definition',
      exceptionFnMap: _exceptionFns,
    );
    return ValidateFlowDefinitionResponse.fromJson(response);
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// Specify a built-in or computer use action for this action group. If you
  /// specify a value, you must leave the <code>description</code>,
  /// <code>apiSchema</code>, and <code>actionGroupExecutor</code> fields empty
  /// for this action group.
  ///
  /// <ul>
  /// <li>
  /// To allow your agent to request the user for additional information when
  /// trying to complete a task, set this field to
  /// <code>AMAZON.UserInput</code>.
  /// </li>
  /// <li>
  /// To allow your agent to generate, run, and troubleshoot code when trying to
  /// complete a task, set this field to <code>AMAZON.CodeInterpreter</code>.
  /// </li>
  /// <li>
  /// To allow your agent to use an Anthropic computer use tool, specify one of
  /// the following values.
  /// <important>
  /// Computer use is a new Anthropic Claude model capability (in beta)
  /// available with Anthropic Claude 3.7 Sonnet and Claude 3.5 Sonnet v2 only.
  /// When operating computer use functionality, we recommend taking additional
  /// security precautions, such as executing computer actions in virtual
  /// environments with restricted data access and limited internet
  /// connectivity. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-computer-use.html">Configure
  /// an Amazon Bedrock Agent to complete tasks with computer use tools</a>.
  /// </important>
  /// <ul>
  /// <li>
  /// <code>ANTHROPIC.Computer</code> - Gives the agent permission to use the
  /// mouse and keyboard and take screenshots.
  /// </li>
  /// <li>
  /// <code>ANTHROPIC.TextEditor</code> - Gives the agent permission to view,
  /// create and edit files.
  /// </li>
  /// <li>
  /// <code>ANTHROPIC.Bash</code> - Gives the agent permission to run commands
  /// in a bash shell.
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [parentActionGroupSignatureParams] :
  /// The configuration settings for a computer use action.
  /// <important>
  /// Computer use is a new Anthropic Claude model capability (in beta)
  /// available with Anthropic Claude 3.7 Sonnet and Claude 3.5 Sonnet v2 only.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-computer-use.html">Configure
  /// an Amazon Bedrock Agent to complete tasks with computer use tools</a>.
  /// </important>
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
    Map<String, String>? parentActionGroupSignatureParams,
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
      if (parentActionGroupSignatureParams != null)
        'parentActionGroupSignatureParams': parentActionGroupSignatureParams,
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

  /// Deletes an action group in an agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Gets information about an action group for an agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Lists the action groups for an agent and information about each one.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Updates the configuration for an action group for an agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// Update the built-in or computer use action for this action group. If you
  /// specify a value, you must leave the <code>description</code>,
  /// <code>apiSchema</code>, and <code>actionGroupExecutor</code> fields empty
  /// for this action group.
  ///
  /// <ul>
  /// <li>
  /// To allow your agent to request the user for additional information when
  /// trying to complete a task, set this field to
  /// <code>AMAZON.UserInput</code>.
  /// </li>
  /// <li>
  /// To allow your agent to generate, run, and troubleshoot code when trying to
  /// complete a task, set this field to <code>AMAZON.CodeInterpreter</code>.
  /// </li>
  /// <li>
  /// To allow your agent to use an Anthropic computer use tool, specify one of
  /// the following values.
  /// <important>
  /// Computer use is a new Anthropic Claude model capability (in beta)
  /// available with Anthropic Claude 3.7 Sonnet and Claude 3.5 Sonnet v2 only.
  /// When operating computer use functionality, we recommend taking additional
  /// security precautions, such as executing computer actions in virtual
  /// environments with restricted data access and limited internet
  /// connectivity. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-computer-use.html">Configure
  /// an Amazon Bedrock Agent to complete tasks with computer use tools</a>.
  /// </important>
  /// <ul>
  /// <li>
  /// <code>ANTHROPIC.Computer</code> - Gives the agent permission to use the
  /// mouse and keyboard and take screenshots.
  /// </li>
  /// <li>
  /// <code>ANTHROPIC.TextEditor</code> - Gives the agent permission to view,
  /// create and edit files.
  /// </li>
  /// <li>
  /// <code>ANTHROPIC.Bash</code> - Gives the agent permission to run commands
  /// in a bash shell.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// During orchestration, if your agent determines that it needs to invoke an
  /// API in an action group, but doesn't have enough information to complete
  /// the API request, it will invoke this action group instead and return an <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_Observation.html">Observation</a>
  /// reprompting the user for more information.
  ///
  /// Parameter [parentActionGroupSignatureParams] :
  /// The configuration settings for a computer use action.
  /// <important>
  /// Computer use is a new Anthropic Claude model capability (in beta)
  /// available with Claude 3.7 Sonnet and Claude 3.5 Sonnet v2 only. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-computer-use.html">Configure
  /// an Amazon Bedrock Agent to complete tasks with computer use tools</a>.
  /// </important>
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
    Map<String, String>? parentActionGroupSignatureParams,
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
      if (parentActionGroupSignatureParams != null)
        'parentActionGroupSignatureParams': parentActionGroupSignatureParams,
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

  /// Makes an agent a collaborator for another agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentDescriptor] :
  /// The alias of the collaborator agent.
  ///
  /// Parameter [agentId] :
  /// The agent's ID.
  ///
  /// Parameter [agentVersion] :
  /// An agent version.
  ///
  /// Parameter [collaborationInstruction] :
  /// Instruction for the collaborator.
  ///
  /// Parameter [collaboratorName] :
  /// A name for the collaborator.
  ///
  /// Parameter [clientToken] :
  /// A client token.
  ///
  /// Parameter [relayConversationHistory] :
  /// A relay conversation history for the collaborator.
  Future<AssociateAgentCollaboratorResponse> associateAgentCollaborator({
    required AgentDescriptor agentDescriptor,
    required String agentId,
    required String agentVersion,
    required String collaborationInstruction,
    required String collaboratorName,
    String? clientToken,
    RelayConversationHistory? relayConversationHistory,
  }) async {
    final $payload = <String, dynamic>{
      'agentDescriptor': agentDescriptor,
      'collaborationInstruction': collaborationInstruction,
      'collaboratorName': collaboratorName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (relayConversationHistory != null)
        'relayConversationHistory': relayConversationHistory.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentversions/${Uri.encodeComponent(agentVersion)}/agentcollaborators/',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateAgentCollaboratorResponse.fromJson(response);
  }

  /// Disassociates an agent collaborator.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentId] :
  /// An agent ID.
  ///
  /// Parameter [agentVersion] :
  /// The agent's version.
  ///
  /// Parameter [collaboratorId] :
  /// The collaborator's ID.
  Future<void> disassociateAgentCollaborator({
    required String agentId,
    required String agentVersion,
    required String collaboratorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentversions/${Uri.encodeComponent(agentVersion)}/agentcollaborators/${Uri.encodeComponent(collaboratorId)}/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves information about an agent's collaborator.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentId] :
  /// The agent's ID.
  ///
  /// Parameter [agentVersion] :
  /// The agent's version.
  ///
  /// Parameter [collaboratorId] :
  /// The collaborator's ID.
  Future<GetAgentCollaboratorResponse> getAgentCollaborator({
    required String agentId,
    required String agentVersion,
    required String collaboratorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentversions/${Uri.encodeComponent(agentVersion)}/agentcollaborators/${Uri.encodeComponent(collaboratorId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return GetAgentCollaboratorResponse.fromJson(response);
  }

  /// Retrieve a list of an agent's collaborators.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentId] :
  /// The agent's ID.
  ///
  /// Parameter [agentVersion] :
  /// The agent's version.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of agent collaborators to return in one page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListAgentCollaboratorsResponse> listAgentCollaborators({
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
          '/agents/${Uri.encodeComponent(agentId)}/agentversions/${Uri.encodeComponent(agentVersion)}/agentcollaborators/',
      exceptionFnMap: _exceptionFns,
    );
    return ListAgentCollaboratorsResponse.fromJson(response);
  }

  /// Updates an agent's collaborator.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentDescriptor] :
  /// An agent descriptor for the agent collaborator.
  ///
  /// Parameter [agentId] :
  /// The agent's ID.
  ///
  /// Parameter [agentVersion] :
  /// The agent's version.
  ///
  /// Parameter [collaborationInstruction] :
  /// Instruction for the collaborator.
  ///
  /// Parameter [collaboratorId] :
  /// The collaborator's ID.
  ///
  /// Parameter [collaboratorName] :
  /// The collaborator's name.
  ///
  /// Parameter [relayConversationHistory] :
  /// A relay conversation history for the collaborator.
  Future<UpdateAgentCollaboratorResponse> updateAgentCollaborator({
    required AgentDescriptor agentDescriptor,
    required String agentId,
    required String agentVersion,
    required String collaborationInstruction,
    required String collaboratorId,
    required String collaboratorName,
    RelayConversationHistory? relayConversationHistory,
  }) async {
    final $payload = <String, dynamic>{
      'agentDescriptor': agentDescriptor,
      'collaborationInstruction': collaborationInstruction,
      'collaboratorName': collaboratorName,
      if (relayConversationHistory != null)
        'relayConversationHistory': relayConversationHistory.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentversions/${Uri.encodeComponent(agentVersion)}/agentcollaborators/${Uri.encodeComponent(collaboratorId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAgentCollaboratorResponse.fromJson(response);
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentName] :
  /// A name for the agent that you create.
  ///
  /// Parameter [agentCollaboration] :
  /// The agent's collaboration role.
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
  /// Parameter [customOrchestration] :
  /// Contains details of the custom orchestration configured for the agent.
  ///
  /// Parameter [customerEncryptionKeyArn] :
  /// The Amazon Resource Name (ARN) of the KMS key with which to encrypt the
  /// agent.
  ///
  /// Parameter [description] :
  /// A description of the agent.
  ///
  /// Parameter [foundationModel] :
  /// The identifier for the model that you want to be used for orchestration by
  /// the agent you create.
  ///
  /// The <code>modelId</code> to provide depends on the type of model or
  /// throughput that you use:
  ///
  /// <ul>
  /// <li>
  /// If you use a base model, specify the model ID or its ARN. For a list of
  /// model IDs for base models, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-ids.html#model-ids-arns">Amazon
  /// Bedrock base model IDs (on-demand throughput)</a> in the Amazon Bedrock
  /// User Guide.
  /// </li>
  /// <li>
  /// If you use an inference profile, specify the inference profile ID or its
  /// ARN. For a list of inference profile IDs, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/cross-region-inference-support.html">Supported
  /// Regions and models for cross-region inference</a> in the Amazon Bedrock
  /// User Guide.
  /// </li>
  /// <li>
  /// If you use a provisioned model, specify the ARN of the Provisioned
  /// Throughput. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prov-thru-use.html">Run
  /// inference using a Provisioned Throughput</a> in the Amazon Bedrock User
  /// Guide.
  /// </li>
  /// <li>
  /// If you use a custom model, first purchase Provisioned Throughput for it.
  /// Then specify the ARN of the resulting provisioned model. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-use.html">Use
  /// a custom model in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  /// </li>
  /// <li>
  /// If you use an <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-import-model.html">imported
  /// model</a>, specify the ARN of the imported model. You can get the model
  /// ARN from a successful call to <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_CreateModelImportJob.html">CreateModelImportJob</a>
  /// or from the Imported models page in the Amazon Bedrock console.
  /// </li>
  /// </ul>
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
  /// Parameter [orchestrationType] :
  /// Specifies the type of orchestration strategy for the agent. This is set to
  /// <code>DEFAULT</code> orchestration type, by default.
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
    AgentCollaboration? agentCollaboration,
    String? agentResourceRoleArn,
    String? clientToken,
    CustomOrchestration? customOrchestration,
    String? customerEncryptionKeyArn,
    String? description,
    String? foundationModel,
    GuardrailConfiguration? guardrailConfiguration,
    int? idleSessionTTLInSeconds,
    String? instruction,
    MemoryConfiguration? memoryConfiguration,
    OrchestrationType? orchestrationType,
    PromptOverrideConfiguration? promptOverrideConfiguration,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'idleSessionTTLInSeconds',
      idleSessionTTLInSeconds,
      60,
      5400,
    );
    final $payload = <String, dynamic>{
      'agentName': agentName,
      if (agentCollaboration != null)
        'agentCollaboration': agentCollaboration.value,
      if (agentResourceRoleArn != null)
        'agentResourceRoleArn': agentResourceRoleArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (customOrchestration != null)
        'customOrchestration': customOrchestration,
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
      if (orchestrationType != null)
        'orchestrationType': orchestrationType.value,
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

  /// Deletes an agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Gets information about an agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Lists the agents belonging to an account and information about each agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Creates a <code>DRAFT</code> version of the agent that can be used for
  /// internal testing.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Updates the configuration of an agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// The identifier for the model that you want to be used for orchestration by
  /// the agent you create.
  ///
  /// The <code>modelId</code> to provide depends on the type of model or
  /// throughput that you use:
  ///
  /// <ul>
  /// <li>
  /// If you use a base model, specify the model ID or its ARN. For a list of
  /// model IDs for base models, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-ids.html#model-ids-arns">Amazon
  /// Bedrock base model IDs (on-demand throughput)</a> in the Amazon Bedrock
  /// User Guide.
  /// </li>
  /// <li>
  /// If you use an inference profile, specify the inference profile ID or its
  /// ARN. For a list of inference profile IDs, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/cross-region-inference-support.html">Supported
  /// Regions and models for cross-region inference</a> in the Amazon Bedrock
  /// User Guide.
  /// </li>
  /// <li>
  /// If you use a provisioned model, specify the ARN of the Provisioned
  /// Throughput. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prov-thru-use.html">Run
  /// inference using a Provisioned Throughput</a> in the Amazon Bedrock User
  /// Guide.
  /// </li>
  /// <li>
  /// If you use a custom model, first purchase Provisioned Throughput for it.
  /// Then specify the ARN of the resulting provisioned model. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-use.html">Use
  /// a custom model in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  /// </li>
  /// <li>
  /// If you use an <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-import-model.html">imported
  /// model</a>, specify the ARN of the imported model. You can get the model
  /// ARN from a successful call to <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_CreateModelImportJob.html">CreateModelImportJob</a>
  /// or from the Imported models page in the Amazon Bedrock console.
  /// </li>
  /// </ul>
  ///
  /// Parameter [agentCollaboration] :
  /// The agent's collaboration role.
  ///
  /// Parameter [customOrchestration] :
  /// Contains details of the custom orchestration configured for the agent.
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
  /// Parameter [orchestrationType] :
  /// Specifies the type of orchestration strategy for the agent. This is set to
  /// <code>DEFAULT</code> orchestration type, by default.
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
    AgentCollaboration? agentCollaboration,
    CustomOrchestration? customOrchestration,
    String? customerEncryptionKeyArn,
    String? description,
    GuardrailConfiguration? guardrailConfiguration,
    int? idleSessionTTLInSeconds,
    String? instruction,
    MemoryConfiguration? memoryConfiguration,
    OrchestrationType? orchestrationType,
    PromptOverrideConfiguration? promptOverrideConfiguration,
  }) async {
    _s.validateNumRange(
      'idleSessionTTLInSeconds',
      idleSessionTTLInSeconds,
      60,
      5400,
    );
    final $payload = <String, dynamic>{
      'agentName': agentName,
      'agentResourceRoleArn': agentResourceRoleArn,
      'foundationModel': foundationModel,
      if (agentCollaboration != null)
        'agentCollaboration': agentCollaboration.value,
      if (customOrchestration != null)
        'customOrchestration': customOrchestration,
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
      if (orchestrationType != null)
        'orchestrationType': orchestrationType.value,
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

  /// Creates an alias of an agent that can be used to deploy the agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Deletes an alias of an agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Gets information about an alias of an agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Lists the aliases of an agent and information about each one.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Updates configurations for an alias of an agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// Parameter [aliasInvocationState] :
  /// The invocation state for the agent alias. To pause the agent alias, set
  /// the value to <code>REJECT_INVOCATIONS</code>. To start the agent alias
  /// running again, set the value to <code>ACCEPT_INVOCATIONS</code>. Use the
  /// <code>GetAgentAlias</code>, or <code>ListAgentAliases</code>, operation to
  /// get the invocation state of an agent alias.
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
    AliasInvocationState? aliasInvocationState,
    String? description,
    List<AgentAliasRoutingConfigurationListItem>? routingConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'agentAliasName': agentAliasName,
      if (aliasInvocationState != null)
        'aliasInvocationState': aliasInvocationState.value,
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

  /// Connects a knowledge base to a data source. You specify the configuration
  /// for the specific data source service in the
  /// <code>dataSourceConfiguration</code> field.
  /// <important>
  /// You can't change the <code>chunkingConfiguration</code> after you create
  /// the data source connector.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Deletes a data source from a knowledge base.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Gets information about a data source.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataSourceId] :
  /// The unique identifier of the data source.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base for the data source.
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

  /// Lists the data sources in a knowledge base and information about each one.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Updates the configurations for a data source connector.
  /// <important>
  /// You can't change the <code>chunkingConfiguration</code> after you create
  /// the data source connector. Specify the existing
  /// <code>chunkingConfiguration</code>.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Creates a prompt flow that you can use to send an input through various
  /// steps to yield an output. Configure nodes, each of which corresponds to a
  /// step of the flow, and create connections between the nodes to create paths
  /// to different outputs. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-how-it-works.html">How
  /// it works</a> and <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-create.html">Create
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves information about a flow. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-manage.html">Manage
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Modifies a flow. Include both fields that you want to keep and fields that
  /// you want to change. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-how-it-works.html">How
  /// it works</a> and <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-create.html">Create
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Deletes a flow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Returns a list of flows and information about each flow. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-manage.html">Manage
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Prepares the <code>DRAFT</code> version of a flow so that it can be
  /// invoked. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-test.html">Test
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Creates an alias of a flow for deployment. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-deploy.html">Deploy
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// Parameter [concurrencyConfiguration] :
  /// The configuration that specifies how nodes in the flow are executed in
  /// parallel.
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
    FlowAliasConcurrencyConfiguration? concurrencyConfiguration,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'routingConfiguration': routingConfiguration,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (concurrencyConfiguration != null)
        'concurrencyConfiguration': concurrencyConfiguration,
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

  /// Retrieves information about a flow. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-deploy.html">Deploy
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Modifies the alias of a flow. Include both fields that you want to keep
  /// and ones that you want to change. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-deploy.html">Deploy
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// Parameter [concurrencyConfiguration] :
  /// The configuration that specifies how nodes in the flow are executed in
  /// parallel.
  ///
  /// Parameter [description] :
  /// A description for the alias.
  Future<UpdateFlowAliasResponse> updateFlowAlias({
    required String aliasIdentifier,
    required String flowIdentifier,
    required String name,
    required List<FlowAliasRoutingConfigurationListItem> routingConfiguration,
    FlowAliasConcurrencyConfiguration? concurrencyConfiguration,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'routingConfiguration': routingConfiguration,
      if (concurrencyConfiguration != null)
        'concurrencyConfiguration': concurrencyConfiguration,
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

  /// Deletes an alias of a flow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Returns a list of aliases for a flow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Creates a version of the flow that you can deploy. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-deploy.html">Deploy
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves information about a version of a flow. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-deploy.html">Deploy
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Deletes a version of a flow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Returns a list of information about each flow. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-deploy.html">Deploy
  /// a flow in Amazon Bedrock</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Gets information about a data ingestion job. Data sources are ingested
  /// into your knowledge base so that Large Language Models (LLMs) can use your
  /// data.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataSourceId] :
  /// The unique identifier of the data source for the data ingestion job you
  /// want to get information on.
  ///
  /// Parameter [ingestionJobId] :
  /// The unique identifier of the data ingestion job you want to get
  /// information on.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base for the data ingestion job you
  /// want to get information on.
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

  /// Lists the data ingestion jobs for a data source. The list also includes
  /// information about each job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataSourceId] :
  /// The unique identifier of the data source for the list of data ingestion
  /// jobs.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base for the list of data ingestion
  /// jobs.
  ///
  /// Parameter [filters] :
  /// Contains information about the filters for filtering the data.
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
  /// Contains details about how to sort the data.
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

  /// Begins a data ingestion job. Data sources are ingested into your knowledge
  /// base so that Large Language Models (LLMs) can use your data.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataSourceId] :
  /// The unique identifier of the data source you want to ingest into your
  /// knowledge base.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base for the data ingestion job.
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
  /// A description of the data ingestion job.
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

  /// Stops a currently running data ingestion job. You can send a
  /// <code>StartIngestionJob</code> request again to ingest the rest of your
  /// data when you are ready.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataSourceId] :
  /// The unique identifier of the data source for the data ingestion job you
  /// want to stop.
  ///
  /// Parameter [ingestionJobId] :
  /// The unique identifier of the data ingestion job you want to stop.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base for the data ingestion job you
  /// want to stop.
  Future<StopIngestionJobResponse> stopIngestionJob({
    required String dataSourceId,
    required String ingestionJobId,
    required String knowledgeBaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}/datasources/${Uri.encodeComponent(dataSourceId)}/ingestionjobs/${Uri.encodeComponent(ingestionJobId)}/stop',
      exceptionFnMap: _exceptionFns,
    );
    return StopIngestionJobResponse.fromJson(response);
  }

  /// Deletes documents from a data source and syncs the changes to the
  /// knowledge base that is connected to it. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-direct-ingestion.html">Ingest
  /// changes directly into a knowledge base</a> in the Amazon Bedrock User
  /// Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataSourceId] :
  /// The unique identifier of the data source that contains the documents.
  ///
  /// Parameter [documentIdentifiers] :
  /// A list of objects, each of which contains information to identify a
  /// document to delete.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base that is connected to the data
  /// source.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  Future<DeleteKnowledgeBaseDocumentsResponse> deleteKnowledgeBaseDocuments({
    required String dataSourceId,
    required List<DocumentIdentifier> documentIdentifiers,
    required String knowledgeBaseId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'documentIdentifiers': documentIdentifiers,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}/datasources/${Uri.encodeComponent(dataSourceId)}/documents/deleteDocuments',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteKnowledgeBaseDocumentsResponse.fromJson(response);
  }

  /// Retrieves specific documents from a data source that is connected to a
  /// knowledge base. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-direct-ingestion.html">Ingest
  /// changes directly into a knowledge base</a> in the Amazon Bedrock User
  /// Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataSourceId] :
  /// The unique identifier of the data source that contains the documents.
  ///
  /// Parameter [documentIdentifiers] :
  /// A list of objects, each of which contains information to identify a
  /// document for which to retrieve information.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base that is connected to the data
  /// source.
  Future<GetKnowledgeBaseDocumentsResponse> getKnowledgeBaseDocuments({
    required String dataSourceId,
    required List<DocumentIdentifier> documentIdentifiers,
    required String knowledgeBaseId,
  }) async {
    final $payload = <String, dynamic>{
      'documentIdentifiers': documentIdentifiers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}/datasources/${Uri.encodeComponent(dataSourceId)}/documents/getDocuments',
      exceptionFnMap: _exceptionFns,
    );
    return GetKnowledgeBaseDocumentsResponse.fromJson(response);
  }

  /// Ingests documents directly into the knowledge base that is connected to
  /// the data source. The <code>dataSourceType</code> specified in the content
  /// for each document must match the type of the data source that you specify
  /// in the header. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-direct-ingestion.html">Ingest
  /// changes directly into a knowledge base</a> in the Amazon Bedrock User
  /// Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataSourceId] :
  /// The unique identifier of the data source connected to the knowledge base
  /// that you're adding documents to.
  ///
  /// Parameter [documents] :
  /// A list of objects, each of which contains information about the documents
  /// to add.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base to ingest the documents into.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  Future<IngestKnowledgeBaseDocumentsResponse> ingestKnowledgeBaseDocuments({
    required String dataSourceId,
    required List<KnowledgeBaseDocument> documents,
    required String knowledgeBaseId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'documents': documents,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}/datasources/${Uri.encodeComponent(dataSourceId)}/documents',
      exceptionFnMap: _exceptionFns,
    );
    return IngestKnowledgeBaseDocumentsResponse.fromJson(response);
  }

  /// Retrieves all the documents contained in a data source that is connected
  /// to a knowledge base. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-direct-ingestion.html">Ingest
  /// changes directly into a knowledge base</a> in the Amazon Bedrock User
  /// Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataSourceId] :
  /// The unique identifier of the data source that contains the documents.
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base that is connected to the data
  /// source.
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
  Future<ListKnowledgeBaseDocumentsResponse> listKnowledgeBaseDocuments({
    required String dataSourceId,
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
          '/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}/datasources/${Uri.encodeComponent(dataSourceId)}/documents',
      exceptionFnMap: _exceptionFns,
    );
    return ListKnowledgeBaseDocumentsResponse.fromJson(response);
  }

  /// Associates a knowledge base with an agent. If a knowledge base is
  /// associated and its <code>indexState</code> is set to <code>Enabled</code>,
  /// the agent queries the knowledge base for information to augment its
  /// response to the user.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Creates a knowledge base. A knowledge base contains your data sources so
  /// that Large Language Models (LLMs) can use your data. To create a knowledge
  /// base, you must first set up your data sources and configure a supported
  /// vector store. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowlege-base-prereq.html">Set
  /// up a knowledge base</a>.
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// Parameter [storageConfiguration] :
  /// Contains details about the configuration of the vector database used for
  /// the knowledge base.
  ///
  /// Parameter [tags] :
  /// Specify the key-value pairs for the tags that you want to attach to your
  /// knowledge base in this object.
  Future<CreateKnowledgeBaseResponse> createKnowledgeBase({
    required KnowledgeBaseConfiguration knowledgeBaseConfiguration,
    required String name,
    required String roleArn,
    String? clientToken,
    String? description,
    StorageConfiguration? storageConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'knowledgeBaseConfiguration': knowledgeBaseConfiguration,
      'name': name,
      'roleArn': roleArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (storageConfiguration != null)
        'storageConfiguration': storageConfiguration,
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

  /// Deletes a knowledge base. Before deleting a knowledge base, you should
  /// disassociate the knowledge base from any agents that it is associated with
  /// by making a <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_DisassociateAgentKnowledgeBase.html">DisassociateAgentKnowledgeBase</a>
  /// request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Gets information about a knowledge base associated with an agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Gets information about a knowledge base.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base you want to get information
  /// on.
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

  /// Lists knowledge bases associated with an agent and information about each
  /// one.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Lists the knowledge bases in an account. The list also includesinformation
  /// about each knowledge base.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Updates the configuration for a knowledge base that has been associated
  /// with an agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// Parameter [description] :
  /// Specifies a new description for the knowledge base.
  ///
  /// Parameter [storageConfiguration] :
  /// Specifies the configuration for the vector store used for the knowledge
  /// base. You must use the same configuration as when the knowledge base was
  /// created.
  Future<UpdateKnowledgeBaseResponse> updateKnowledgeBase({
    required KnowledgeBaseConfiguration knowledgeBaseConfiguration,
    required String knowledgeBaseId,
    required String name,
    required String roleArn,
    String? description,
    StorageConfiguration? storageConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'knowledgeBaseConfiguration': knowledgeBaseConfiguration,
      'name': name,
      'roleArn': roleArn,
      if (description != null) 'description': description,
      if (storageConfiguration != null)
        'storageConfiguration': storageConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateKnowledgeBaseResponse.fromJson(response);
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves information about the working draft (<code>DRAFT</code> version)
  /// of a prompt or a version of it, depending on whether you include the
  /// <code>promptVersion</code> field or not. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-manage.html#prompt-management-view.html">View
  /// information about prompts using Prompt management</a> and <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-deploy.html#prompt-management-versions-view.html">View
  /// information about a version of your prompt</a> in the Amazon Bedrock User
  /// Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Modifies a prompt in your prompt library. Include both fields that you
  /// want to keep and fields that you want to replace. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management.html">Prompt
  /// management in Amazon Bedrock</a> and <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-manage.html#prompt-management-edit">Edit
  /// prompts in your prompt library</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Deletes a prompt or a version of it, depending on whether you include the
  /// <code>promptVersion</code> field or not. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-manage.html#prompt-management-delete.html">Delete
  /// prompts from the Prompt management tool</a> and <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-deploy.html#prompt-management-versions-delete.html">Delete
  /// a version of a prompt from the Prompt management tool</a> in the Amazon
  /// Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Returns either information about the working draft (<code>DRAFT</code>
  /// version) of each prompt in an account, or information about of all
  /// versions of a prompt, depending on whether you include the
  /// <code>promptIdentifier</code> field or not. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-manage.html#prompt-management-view.html">View
  /// information about prompts using Prompt management</a> in the Amazon
  /// Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Creates a static snapshot of your prompt that can be deployed to
  /// production. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-deploy.html">Deploy
  /// prompts using Prompt management by creating versions</a> in the Amazon
  /// Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// List all the tags for the resource you specify.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Associate tags with a resource. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Tagging
  /// resources</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Deletes a version of an agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Gets details about a version of an agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Lists the versions of an agent and information about each version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
}

class ValidateFlowDefinitionResponse {
  /// Contains an array of objects, each of which contains an error identified by
  /// validation.
  final List<FlowValidation> validations;

  ValidateFlowDefinitionResponse({
    required this.validations,
  });

  factory ValidateFlowDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return ValidateFlowDefinitionResponse(
      validations: ((json['validations'] as List?) ?? const [])
          .nonNulls
          .map((e) => FlowValidation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final validations = this.validations;
    return {
      'validations': validations,
    };
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
          (json['agentActionGroup'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agentActionGroup = this.agentActionGroup;
    return {
      'agentActionGroup': agentActionGroup,
    };
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

class GetAgentActionGroupResponse {
  /// Contains details about the action group.
  final AgentActionGroup agentActionGroup;

  GetAgentActionGroupResponse({
    required this.agentActionGroup,
  });

  factory GetAgentActionGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetAgentActionGroupResponse(
      agentActionGroup: AgentActionGroup.fromJson(
          (json['agentActionGroup'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agentActionGroup = this.agentActionGroup;
    return {
      'agentActionGroup': agentActionGroup,
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
      actionGroupSummaries: ((json['actionGroupSummaries'] as List?) ??
              const [])
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

class UpdateAgentActionGroupResponse {
  /// Contains details about the action group that was updated.
  final AgentActionGroup agentActionGroup;

  UpdateAgentActionGroupResponse({
    required this.agentActionGroup,
  });

  factory UpdateAgentActionGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAgentActionGroupResponse(
      agentActionGroup: AgentActionGroup.fromJson(
          (json['agentActionGroup'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agentActionGroup = this.agentActionGroup;
    return {
      'agentActionGroup': agentActionGroup,
    };
  }
}

class AssociateAgentCollaboratorResponse {
  /// Details about the collaborator.
  final AgentCollaborator agentCollaborator;

  AssociateAgentCollaboratorResponse({
    required this.agentCollaborator,
  });

  factory AssociateAgentCollaboratorResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateAgentCollaboratorResponse(
      agentCollaborator: AgentCollaborator.fromJson(
          (json['agentCollaborator'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agentCollaborator = this.agentCollaborator;
    return {
      'agentCollaborator': agentCollaborator,
    };
  }
}

class DisassociateAgentCollaboratorResponse {
  DisassociateAgentCollaboratorResponse();

  factory DisassociateAgentCollaboratorResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateAgentCollaboratorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetAgentCollaboratorResponse {
  /// Details about the collaborator.
  final AgentCollaborator agentCollaborator;

  GetAgentCollaboratorResponse({
    required this.agentCollaborator,
  });

  factory GetAgentCollaboratorResponse.fromJson(Map<String, dynamic> json) {
    return GetAgentCollaboratorResponse(
      agentCollaborator: AgentCollaborator.fromJson(
          (json['agentCollaborator'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agentCollaborator = this.agentCollaborator;
    return {
      'agentCollaborator': agentCollaborator,
    };
  }
}

class ListAgentCollaboratorsResponse {
  /// A list of collaborator summaries.
  final List<AgentCollaboratorSummary> agentCollaboratorSummaries;

  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  final String? nextToken;

  ListAgentCollaboratorsResponse({
    required this.agentCollaboratorSummaries,
    this.nextToken,
  });

  factory ListAgentCollaboratorsResponse.fromJson(Map<String, dynamic> json) {
    return ListAgentCollaboratorsResponse(
      agentCollaboratorSummaries:
          ((json['agentCollaboratorSummaries'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  AgentCollaboratorSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentCollaboratorSummaries = this.agentCollaboratorSummaries;
    final nextToken = this.nextToken;
    return {
      'agentCollaboratorSummaries': agentCollaboratorSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class UpdateAgentCollaboratorResponse {
  /// Details about the collaborator.
  final AgentCollaborator agentCollaborator;

  UpdateAgentCollaboratorResponse({
    required this.agentCollaborator,
  });

  factory UpdateAgentCollaboratorResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAgentCollaboratorResponse(
      agentCollaborator: AgentCollaborator.fromJson(
          (json['agentCollaborator'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agentCollaborator = this.agentCollaborator;
    return {
      'agentCollaborator': agentCollaborator,
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
      agent: Agent.fromJson((json['agent'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agent = this.agent;
    return {
      'agent': agent,
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
      agentId: (json['agentId'] as String?) ?? '',
      agentStatus:
          AgentStatus.fromString((json['agentStatus'] as String?) ?? ''),
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

class GetAgentResponse {
  /// Contains details about the agent.
  final Agent agent;

  GetAgentResponse({
    required this.agent,
  });

  factory GetAgentResponse.fromJson(Map<String, dynamic> json) {
    return GetAgentResponse(
      agent: Agent.fromJson((json['agent'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agent = this.agent;
    return {
      'agent': agent,
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
      agentSummaries: ((json['agentSummaries'] as List?) ?? const [])
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
      agentId: (json['agentId'] as String?) ?? '',
      agentStatus:
          AgentStatus.fromString((json['agentStatus'] as String?) ?? ''),
      agentVersion: (json['agentVersion'] as String?) ?? '',
      preparedAt: nonNullableTimeStampFromJson(json['preparedAt'] ?? 0),
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

class UpdateAgentResponse {
  /// Contains details about the agent that was updated.
  final Agent agent;

  UpdateAgentResponse({
    required this.agent,
  });

  factory UpdateAgentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAgentResponse(
      agent: Agent.fromJson((json['agent'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agent = this.agent;
    return {
      'agent': agent,
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
      agentAlias: AgentAlias.fromJson(
          (json['agentAlias'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agentAlias = this.agentAlias;
    return {
      'agentAlias': agentAlias,
    };
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
      agentAliasId: (json['agentAliasId'] as String?) ?? '',
      agentAliasStatus: AgentAliasStatus.fromString(
          (json['agentAliasStatus'] as String?) ?? ''),
      agentId: (json['agentId'] as String?) ?? '',
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

class GetAgentAliasResponse {
  /// Contains information about the alias.
  final AgentAlias agentAlias;

  GetAgentAliasResponse({
    required this.agentAlias,
  });

  factory GetAgentAliasResponse.fromJson(Map<String, dynamic> json) {
    return GetAgentAliasResponse(
      agentAlias: AgentAlias.fromJson(
          (json['agentAlias'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agentAlias = this.agentAlias;
    return {
      'agentAlias': agentAlias,
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
      agentAliasSummaries: ((json['agentAliasSummaries'] as List?) ?? const [])
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

class UpdateAgentAliasResponse {
  /// Contains details about the alias that was updated.
  final AgentAlias agentAlias;

  UpdateAgentAliasResponse({
    required this.agentAlias,
  });

  factory UpdateAgentAliasResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAgentAliasResponse(
      agentAlias: AgentAlias.fromJson(
          (json['agentAlias'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agentAlias = this.agentAlias;
    return {
      'agentAlias': agentAlias,
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
      dataSource: DataSource.fromJson(
          (json['dataSource'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    return {
      'dataSource': dataSource,
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
      dataSourceId: (json['dataSourceId'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      status: DataSourceStatus.fromString((json['status'] as String?) ?? ''),
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

class GetDataSourceResponse {
  /// Contains details about the data source.
  final DataSource dataSource;

  GetDataSourceResponse({
    required this.dataSource,
  });

  factory GetDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return GetDataSourceResponse(
      dataSource: DataSource.fromJson(
          (json['dataSource'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    return {
      'dataSource': dataSource,
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
      dataSourceSummaries: ((json['dataSourceSummaries'] as List?) ?? const [])
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

class UpdateDataSourceResponse {
  /// Contains details about the data source.
  final DataSource dataSource;

  UpdateDataSourceResponse({
    required this.dataSource,
  });

  factory UpdateDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDataSourceResponse(
      dataSource: DataSource.fromJson(
          (json['dataSource'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    return {
      'dataSource': dataSource,
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
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      executionRoleArn: (json['executionRoleArn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: FlowStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as String?) ?? '',
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
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      executionRoleArn: (json['executionRoleArn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: FlowStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as String?) ?? '',
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
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      executionRoleArn: (json['executionRoleArn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: FlowStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as String?) ?? '',
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

class DeleteFlowResponse {
  /// The unique identifier of the flow.
  final String id;

  DeleteFlowResponse({
    required this.id,
  });

  factory DeleteFlowResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFlowResponse(
      id: (json['id'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
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
      flowSummaries: ((json['flowSummaries'] as List?) ?? const [])
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
      id: (json['id'] as String?) ?? '',
      status: FlowStatus.fromString((json['status'] as String?) ?? ''),
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

  /// The configuration that specifies how nodes in the flow are executed in
  /// parallel.
  final FlowAliasConcurrencyConfiguration? concurrencyConfiguration;

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
    this.concurrencyConfiguration,
    this.description,
  });

  factory CreateFlowAliasResponse.fromJson(Map<String, dynamic> json) {
    return CreateFlowAliasResponse(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      flowId: (json['flowId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      routingConfiguration:
          ((json['routingConfiguration'] as List?) ?? const [])
              .nonNulls
              .map((e) => FlowAliasRoutingConfigurationListItem.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      concurrencyConfiguration: json['concurrencyConfiguration'] != null
          ? FlowAliasConcurrencyConfiguration.fromJson(
              json['concurrencyConfiguration'] as Map<String, dynamic>)
          : null,
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
    final concurrencyConfiguration = this.concurrencyConfiguration;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'flowId': flowId,
      'id': id,
      'name': name,
      'routingConfiguration': routingConfiguration,
      'updatedAt': iso8601ToJson(updatedAt),
      if (concurrencyConfiguration != null)
        'concurrencyConfiguration': concurrencyConfiguration,
      if (description != null) 'description': description,
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

  /// The configuration that specifies how nodes in the flow are executed in
  /// parallel.
  final FlowAliasConcurrencyConfiguration? concurrencyConfiguration;

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
    this.concurrencyConfiguration,
    this.description,
  });

  factory GetFlowAliasResponse.fromJson(Map<String, dynamic> json) {
    return GetFlowAliasResponse(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      flowId: (json['flowId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      routingConfiguration:
          ((json['routingConfiguration'] as List?) ?? const [])
              .nonNulls
              .map((e) => FlowAliasRoutingConfigurationListItem.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      concurrencyConfiguration: json['concurrencyConfiguration'] != null
          ? FlowAliasConcurrencyConfiguration.fromJson(
              json['concurrencyConfiguration'] as Map<String, dynamic>)
          : null,
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
    final concurrencyConfiguration = this.concurrencyConfiguration;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'flowId': flowId,
      'id': id,
      'name': name,
      'routingConfiguration': routingConfiguration,
      'updatedAt': iso8601ToJson(updatedAt),
      if (concurrencyConfiguration != null)
        'concurrencyConfiguration': concurrencyConfiguration,
      if (description != null) 'description': description,
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

  /// The configuration that specifies how nodes in the flow are executed in
  /// parallel.
  final FlowAliasConcurrencyConfiguration? concurrencyConfiguration;

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
    this.concurrencyConfiguration,
    this.description,
  });

  factory UpdateFlowAliasResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFlowAliasResponse(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      flowId: (json['flowId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      routingConfiguration:
          ((json['routingConfiguration'] as List?) ?? const [])
              .nonNulls
              .map((e) => FlowAliasRoutingConfigurationListItem.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      concurrencyConfiguration: json['concurrencyConfiguration'] != null
          ? FlowAliasConcurrencyConfiguration.fromJson(
              json['concurrencyConfiguration'] as Map<String, dynamic>)
          : null,
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
    final concurrencyConfiguration = this.concurrencyConfiguration;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'flowId': flowId,
      'id': id,
      'name': name,
      'routingConfiguration': routingConfiguration,
      'updatedAt': iso8601ToJson(updatedAt),
      if (concurrencyConfiguration != null)
        'concurrencyConfiguration': concurrencyConfiguration,
      if (description != null) 'description': description,
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
      flowId: (json['flowId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
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
      flowAliasSummaries: ((json['flowAliasSummaries'] as List?) ?? const [])
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
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      executionRoleArn: (json['executionRoleArn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: FlowStatus.fromString((json['status'] as String?) ?? ''),
      version: (json['version'] as String?) ?? '',
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
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      executionRoleArn: (json['executionRoleArn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: FlowStatus.fromString((json['status'] as String?) ?? ''),
      version: (json['version'] as String?) ?? '',
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
      id: (json['id'] as String?) ?? '',
      version: (json['version'] as String?) ?? '',
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
      flowVersionSummaries: ((json['flowVersionSummaries'] as List?) ??
              const [])
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

class GetIngestionJobResponse {
  /// Contains details about the data ingestion job.
  final IngestionJob ingestionJob;

  GetIngestionJobResponse({
    required this.ingestionJob,
  });

  factory GetIngestionJobResponse.fromJson(Map<String, dynamic> json) {
    return GetIngestionJobResponse(
      ingestionJob: IngestionJob.fromJson(
          (json['ingestionJob'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final ingestionJob = this.ingestionJob;
    return {
      'ingestionJob': ingestionJob,
    };
  }
}

class ListIngestionJobsResponse {
  /// A list of data ingestion jobs with information about each job.
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
      ingestionJobSummaries: ((json['ingestionJobSummaries'] as List?) ??
              const [])
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

class StartIngestionJobResponse {
  /// Contains information about the data ingestion job.
  final IngestionJob ingestionJob;

  StartIngestionJobResponse({
    required this.ingestionJob,
  });

  factory StartIngestionJobResponse.fromJson(Map<String, dynamic> json) {
    return StartIngestionJobResponse(
      ingestionJob: IngestionJob.fromJson(
          (json['ingestionJob'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final ingestionJob = this.ingestionJob;
    return {
      'ingestionJob': ingestionJob,
    };
  }
}

class StopIngestionJobResponse {
  /// Contains information about the stopped data ingestion job.
  final IngestionJob ingestionJob;

  StopIngestionJobResponse({
    required this.ingestionJob,
  });

  factory StopIngestionJobResponse.fromJson(Map<String, dynamic> json) {
    return StopIngestionJobResponse(
      ingestionJob: IngestionJob.fromJson(
          (json['ingestionJob'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final ingestionJob = this.ingestionJob;
    return {
      'ingestionJob': ingestionJob,
    };
  }
}

class DeleteKnowledgeBaseDocumentsResponse {
  /// A list of objects, each of which contains information about the documents
  /// that were deleted.
  final List<KnowledgeBaseDocumentDetail>? documentDetails;

  DeleteKnowledgeBaseDocumentsResponse({
    this.documentDetails,
  });

  factory DeleteKnowledgeBaseDocumentsResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteKnowledgeBaseDocumentsResponse(
      documentDetails: (json['documentDetails'] as List?)
          ?.nonNulls
          .map((e) =>
              KnowledgeBaseDocumentDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentDetails = this.documentDetails;
    return {
      if (documentDetails != null) 'documentDetails': documentDetails,
    };
  }
}

class GetKnowledgeBaseDocumentsResponse {
  /// A list of objects, each of which contains information about the documents
  /// that were retrieved.
  final List<KnowledgeBaseDocumentDetail>? documentDetails;

  GetKnowledgeBaseDocumentsResponse({
    this.documentDetails,
  });

  factory GetKnowledgeBaseDocumentsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetKnowledgeBaseDocumentsResponse(
      documentDetails: (json['documentDetails'] as List?)
          ?.nonNulls
          .map((e) =>
              KnowledgeBaseDocumentDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentDetails = this.documentDetails;
    return {
      if (documentDetails != null) 'documentDetails': documentDetails,
    };
  }
}

class IngestKnowledgeBaseDocumentsResponse {
  /// A list of objects, each of which contains information about the documents
  /// that were ingested.
  final List<KnowledgeBaseDocumentDetail>? documentDetails;

  IngestKnowledgeBaseDocumentsResponse({
    this.documentDetails,
  });

  factory IngestKnowledgeBaseDocumentsResponse.fromJson(
      Map<String, dynamic> json) {
    return IngestKnowledgeBaseDocumentsResponse(
      documentDetails: (json['documentDetails'] as List?)
          ?.nonNulls
          .map((e) =>
              KnowledgeBaseDocumentDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentDetails = this.documentDetails;
    return {
      if (documentDetails != null) 'documentDetails': documentDetails,
    };
  }
}

class ListKnowledgeBaseDocumentsResponse {
  /// A list of objects, each of which contains information about the documents
  /// that were retrieved.
  final List<KnowledgeBaseDocumentDetail> documentDetails;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListKnowledgeBaseDocumentsResponse({
    required this.documentDetails,
    this.nextToken,
  });

  factory ListKnowledgeBaseDocumentsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListKnowledgeBaseDocumentsResponse(
      documentDetails: ((json['documentDetails'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              KnowledgeBaseDocumentDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentDetails = this.documentDetails;
    final nextToken = this.nextToken;
    return {
      'documentDetails': documentDetails,
      if (nextToken != null) 'nextToken': nextToken,
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
          (json['agentKnowledgeBase'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agentKnowledgeBase = this.agentKnowledgeBase;
    return {
      'agentKnowledgeBase': agentKnowledgeBase,
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
      knowledgeBase: KnowledgeBase.fromJson(
          (json['knowledgeBase'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBase = this.knowledgeBase;
    return {
      'knowledgeBase': knowledgeBase,
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
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      status: KnowledgeBaseStatus.fromString((json['status'] as String?) ?? ''),
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

class GetAgentKnowledgeBaseResponse {
  /// Contains details about a knowledge base attached to an agent.
  final AgentKnowledgeBase agentKnowledgeBase;

  GetAgentKnowledgeBaseResponse({
    required this.agentKnowledgeBase,
  });

  factory GetAgentKnowledgeBaseResponse.fromJson(Map<String, dynamic> json) {
    return GetAgentKnowledgeBaseResponse(
      agentKnowledgeBase: AgentKnowledgeBase.fromJson(
          (json['agentKnowledgeBase'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agentKnowledgeBase = this.agentKnowledgeBase;
    return {
      'agentKnowledgeBase': agentKnowledgeBase,
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
      knowledgeBase: KnowledgeBase.fromJson(
          (json['knowledgeBase'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBase = this.knowledgeBase;
    return {
      'knowledgeBase': knowledgeBase,
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
      agentKnowledgeBaseSummaries:
          ((json['agentKnowledgeBaseSummaries'] as List?) ?? const [])
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

class ListKnowledgeBasesResponse {
  /// A list of knowledge bases with information about each knowledge base.
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
          (json['agentKnowledgeBase'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agentKnowledgeBase = this.agentKnowledgeBase;
    return {
      'agentKnowledgeBase': agentKnowledgeBase,
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
      knowledgeBase: KnowledgeBase.fromJson(
          (json['knowledgeBase'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as String?) ?? '',
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
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as String?) ?? '',
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
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as String?) ?? '',
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
      id: (json['id'] as String?) ?? '',
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
      promptSummaries: ((json['promptSummaries'] as List?) ?? const [])
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
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as String?) ?? '',
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
      agentId: (json['agentId'] as String?) ?? '',
      agentStatus:
          AgentStatus.fromString((json['agentStatus'] as String?) ?? ''),
      agentVersion: (json['agentVersion'] as String?) ?? '',
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

class GetAgentVersionResponse {
  /// Contains details about the version of the agent.
  final AgentVersion agentVersion;

  GetAgentVersionResponse({
    required this.agentVersion,
  });

  factory GetAgentVersionResponse.fromJson(Map<String, dynamic> json) {
    return GetAgentVersionResponse(
      agentVersion: AgentVersion.fromJson(
          (json['agentVersion'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agentVersion = this.agentVersion;
    return {
      'agentVersion': agentVersion,
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
      agentVersionSummaries: ((json['agentVersionSummaries'] as List?) ??
              const [])
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
      agentName: (json['agentName'] as String?) ?? '',
      agentStatus:
          AgentStatus.fromString((json['agentStatus'] as String?) ?? ''),
      agentVersion: (json['agentVersion'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
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

class AgentStatus {
  static const creating = AgentStatus._('CREATING');
  static const preparing = AgentStatus._('PREPARING');
  static const prepared = AgentStatus._('PREPARED');
  static const notPrepared = AgentStatus._('NOT_PREPARED');
  static const deleting = AgentStatus._('DELETING');
  static const failed = AgentStatus._('FAILED');
  static const versioning = AgentStatus._('VERSIONING');
  static const updating = AgentStatus._('UPDATING');

  final String value;

  const AgentStatus._(this.value);

  static const values = [
    creating,
    preparing,
    prepared,
    notPrepared,
    deleting,
    failed,
    versioning,
    updating
  ];

  static AgentStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AgentStatus._(value));

  @override
  bool operator ==(other) => other is AgentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about a guardrail associated with a resource.
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

  /// The agent's collaboration settings.
  final AgentCollaboration? agentCollaboration;

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
    this.agentCollaboration,
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
      agentArn: (json['agentArn'] as String?) ?? '',
      agentId: (json['agentId'] as String?) ?? '',
      agentName: (json['agentName'] as String?) ?? '',
      agentResourceRoleArn: (json['agentResourceRoleArn'] as String?) ?? '',
      agentStatus:
          AgentStatus.fromString((json['agentStatus'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      idleSessionTTLInSeconds: (json['idleSessionTTLInSeconds'] as int?) ?? 0,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as String?) ?? '',
      agentCollaboration: (json['agentCollaboration'] as String?)
          ?.let(AgentCollaboration.fromString),
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
    final agentCollaboration = this.agentCollaboration;
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
      if (agentCollaboration != null)
        'agentCollaboration': agentCollaboration.value,
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
  /// Lambda function in Amazon Bedrock Agents</a>.
  final String? overrideLambda;

  PromptOverrideConfiguration({
    required this.promptConfigurations,
    this.overrideLambda,
  });

  factory PromptOverrideConfiguration.fromJson(Map<String, dynamic> json) {
    return PromptOverrideConfiguration(
      promptConfigurations: ((json['promptConfigurations'] as List?) ??
              const [])
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

/// Details of the memory configuration.
class MemoryConfiguration {
  /// The type of memory that is stored.
  final List<MemoryType> enabledMemoryTypes;

  /// Contains the configuration for SESSION_SUMMARY memory type enabled for the
  /// agent.
  final SessionSummaryConfiguration? sessionSummaryConfiguration;

  /// The number of days the agent is configured to retain the conversational
  /// context.
  final int? storageDays;

  MemoryConfiguration({
    required this.enabledMemoryTypes,
    this.sessionSummaryConfiguration,
    this.storageDays,
  });

  factory MemoryConfiguration.fromJson(Map<String, dynamic> json) {
    return MemoryConfiguration(
      enabledMemoryTypes: ((json['enabledMemoryTypes'] as List?) ?? const [])
          .nonNulls
          .map((e) => MemoryType.fromString((e as String)))
          .toList(),
      sessionSummaryConfiguration: json['sessionSummaryConfiguration'] != null
          ? SessionSummaryConfiguration.fromJson(
              json['sessionSummaryConfiguration'] as Map<String, dynamic>)
          : null,
      storageDays: json['storageDays'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabledMemoryTypes = this.enabledMemoryTypes;
    final sessionSummaryConfiguration = this.sessionSummaryConfiguration;
    final storageDays = this.storageDays;
    return {
      'enabledMemoryTypes': enabledMemoryTypes.map((e) => e.value).toList(),
      if (sessionSummaryConfiguration != null)
        'sessionSummaryConfiguration': sessionSummaryConfiguration,
      if (storageDays != null) 'storageDays': storageDays,
    };
  }
}

class AgentCollaboration {
  static const supervisor = AgentCollaboration._('SUPERVISOR');
  static const supervisorRouter = AgentCollaboration._('SUPERVISOR_ROUTER');
  static const disabled = AgentCollaboration._('DISABLED');

  final String value;

  const AgentCollaboration._(this.value);

  static const values = [supervisor, supervisorRouter, disabled];

  static AgentCollaboration fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AgentCollaboration._(value));

  @override
  bool operator ==(other) =>
      other is AgentCollaboration && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for SESSION_SUMMARY memory type enabled for the agent.
class SessionSummaryConfiguration {
  /// Maximum number of recent session summaries to include in the agent's prompt
  /// context.
  final int? maxRecentSessions;

  SessionSummaryConfiguration({
    this.maxRecentSessions,
  });

  factory SessionSummaryConfiguration.fromJson(Map<String, dynamic> json) {
    return SessionSummaryConfiguration(
      maxRecentSessions: json['maxRecentSessions'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxRecentSessions = this.maxRecentSessions;
    return {
      if (maxRecentSessions != null) 'maxRecentSessions': maxRecentSessions,
    };
  }
}

class MemoryType {
  static const sessionSummary = MemoryType._('SESSION_SUMMARY');

  final String value;

  const MemoryType._(this.value);

  static const values = [sessionSummary];

  static MemoryType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MemoryType._(value));

  @override
  bool operator ==(other) => other is MemoryType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains configurations to override a prompt template in one part of an
/// agent sequence. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/advanced-prompts.html">Advanced
/// prompts</a>.
class PromptConfiguration {
  /// If the Converse or ConverseStream operations support the model,
  /// <code>additionalModelRequestFields</code> contains additional inference
  /// parameters, beyond the base set of inference parameters in the
  /// <code>inferenceConfiguration</code> field.
  ///
  /// For more information, see <i>Inference request parameters and response
  /// fields for foundation models</i> in the Amazon Bedrock user guide.
  final Document? additionalModelRequestFields;

  /// Defines the prompt template with which to replace the default prompt
  /// template. You can use placeholder variables in the base prompt template to
  /// customize the prompt. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-placeholders.html">Prompt
  /// template placeholder variables</a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/advanced-prompts-configure.html">Configure
  /// the prompt templates</a>.
  final String? basePromptTemplate;

  /// The agent's foundation model.
  final String? foundationModel;

  /// Contains inference parameters to use when the agent invokes a foundation
  /// model in the part of the agent sequence defined by the
  /// <code>promptType</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
  /// parameters for foundation models</a>.
  final InferenceConfiguration? inferenceConfiguration;

  /// Specifies whether to override the default parser Lambda function when
  /// parsing the raw foundation model output in the part of the agent sequence
  /// defined by the <code>promptType</code>. If you set the field as
  /// <code>OVERRIDDEN</code>, the <code>overrideLambda</code> field in the <a
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
  /// <code>PRE_PROCESSING</code> – <code>DISABLED</code>
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
    this.additionalModelRequestFields,
    this.basePromptTemplate,
    this.foundationModel,
    this.inferenceConfiguration,
    this.parserMode,
    this.promptCreationMode,
    this.promptState,
    this.promptType,
  });

  factory PromptConfiguration.fromJson(Map<String, dynamic> json) {
    return PromptConfiguration(
      additionalModelRequestFields: json['additionalModelRequestFields'] != null
          ? Document.fromJson(
              json['additionalModelRequestFields'] as Map<String, dynamic>)
          : null,
      basePromptTemplate: json['basePromptTemplate'] as String?,
      foundationModel: json['foundationModel'] as String?,
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
    final additionalModelRequestFields = this.additionalModelRequestFields;
    final basePromptTemplate = this.basePromptTemplate;
    final foundationModel = this.foundationModel;
    final inferenceConfiguration = this.inferenceConfiguration;
    final parserMode = this.parserMode;
    final promptCreationMode = this.promptCreationMode;
    final promptState = this.promptState;
    final promptType = this.promptType;
    return {
      if (additionalModelRequestFields != null)
        'additionalModelRequestFields': additionalModelRequestFields,
      if (basePromptTemplate != null) 'basePromptTemplate': basePromptTemplate,
      if (foundationModel != null) 'foundationModel': foundationModel,
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

class PromptType {
  static const preProcessing = PromptType._('PRE_PROCESSING');
  static const orchestration = PromptType._('ORCHESTRATION');
  static const postProcessing = PromptType._('POST_PROCESSING');
  static const knowledgeBaseResponseGeneration =
      PromptType._('KNOWLEDGE_BASE_RESPONSE_GENERATION');
  static const memorySummarization = PromptType._('MEMORY_SUMMARIZATION');

  final String value;

  const PromptType._(this.value);

  static const values = [
    preProcessing,
    orchestration,
    postProcessing,
    knowledgeBaseResponseGeneration,
    memorySummarization
  ];

  static PromptType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PromptType._(value));

  @override
  bool operator ==(other) => other is PromptType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class CreationMode {
  static const $default = CreationMode._('DEFAULT');
  static const overridden = CreationMode._('OVERRIDDEN');

  final String value;

  const CreationMode._(this.value);

  static const values = [$default, overridden];

  static CreationMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CreationMode._(value));

  @override
  bool operator ==(other) => other is CreationMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class PromptState {
  static const enabled = PromptState._('ENABLED');
  static const disabled = PromptState._('DISABLED');

  final String value;

  const PromptState._(this.value);

  static const values = [enabled, disabled];

  static PromptState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PromptState._(value));

  @override
  bool operator ==(other) => other is PromptState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
  /// set <code>topP</code> to 0.8, the model only selects the next token from the
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

/// Contains details about a variant of the prompt.
class PromptVariant {
  /// The name of the prompt variant.
  final String name;

  /// Contains configurations for the prompt template.
  final PromptTemplateConfiguration templateConfiguration;

  /// The type of prompt template to use.
  final PromptTemplateType templateType;

  /// Contains model-specific inference configurations that aren't in the
  /// <code>inferenceConfiguration</code> field. To see model-specific inference
  /// parameters, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
  /// request parameters and response fields for foundation models</a>.
  final Document? additionalModelRequestFields;

  /// Specifies a generative AI resource with which to use the prompt.
  final PromptGenAiResource? genAiResource;

  /// Contains inference configurations for the prompt variant.
  final PromptInferenceConfiguration? inferenceConfiguration;

  /// An array of objects, each containing a key-value pair that defines a
  /// metadata tag and value to attach to a prompt variant.
  final List<PromptMetadataEntry>? metadata;

  /// The unique identifier of the model or <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/cross-region-inference.html">inference
  /// profile</a> with which to run inference on the prompt.
  final String? modelId;

  PromptVariant({
    required this.name,
    required this.templateConfiguration,
    required this.templateType,
    this.additionalModelRequestFields,
    this.genAiResource,
    this.inferenceConfiguration,
    this.metadata,
    this.modelId,
  });

  factory PromptVariant.fromJson(Map<String, dynamic> json) {
    return PromptVariant(
      name: (json['name'] as String?) ?? '',
      templateConfiguration: PromptTemplateConfiguration.fromJson(
          (json['templateConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      templateType: PromptTemplateType.fromString(
          (json['templateType'] as String?) ?? ''),
      additionalModelRequestFields: json['additionalModelRequestFields'] != null
          ? Document.fromJson(
              json['additionalModelRequestFields'] as Map<String, dynamic>)
          : null,
      genAiResource: json['genAiResource'] != null
          ? PromptGenAiResource.fromJson(
              json['genAiResource'] as Map<String, dynamic>)
          : null,
      inferenceConfiguration: json['inferenceConfiguration'] != null
          ? PromptInferenceConfiguration.fromJson(
              json['inferenceConfiguration'] as Map<String, dynamic>)
          : null,
      metadata: (json['metadata'] as List?)
          ?.nonNulls
          .map((e) => PromptMetadataEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      modelId: json['modelId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final templateConfiguration = this.templateConfiguration;
    final templateType = this.templateType;
    final additionalModelRequestFields = this.additionalModelRequestFields;
    final genAiResource = this.genAiResource;
    final inferenceConfiguration = this.inferenceConfiguration;
    final metadata = this.metadata;
    final modelId = this.modelId;
    return {
      'name': name,
      'templateConfiguration': templateConfiguration,
      'templateType': templateType.value,
      if (additionalModelRequestFields != null)
        'additionalModelRequestFields': additionalModelRequestFields,
      if (genAiResource != null) 'genAiResource': genAiResource,
      if (inferenceConfiguration != null)
        'inferenceConfiguration': inferenceConfiguration,
      if (metadata != null) 'metadata': metadata,
      if (modelId != null) 'modelId': modelId,
    };
  }
}

class PromptTemplateType {
  static const text = PromptTemplateType._('TEXT');
  static const chat = PromptTemplateType._('CHAT');

  final String value;

  const PromptTemplateType._(this.value);

  static const values = [text, chat];

  static PromptTemplateType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PromptTemplateType._(value));

  @override
  bool operator ==(other) =>
      other is PromptTemplateType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the message for a prompt. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management.html">Construct
/// and store reusable prompts with Prompt management in Amazon Bedrock</a>.
class PromptTemplateConfiguration {
  /// Contains configurations to use the prompt in a conversational format.
  final ChatPromptTemplateConfiguration? chat;

  /// Contains configurations for the text in a message for a prompt.
  final TextPromptTemplateConfiguration? text;

  PromptTemplateConfiguration({
    this.chat,
    this.text,
  });

  factory PromptTemplateConfiguration.fromJson(Map<String, dynamic> json) {
    return PromptTemplateConfiguration(
      chat: json['chat'] != null
          ? ChatPromptTemplateConfiguration.fromJson(
              json['chat'] as Map<String, dynamic>)
          : null,
      text: json['text'] != null
          ? TextPromptTemplateConfiguration.fromJson(
              json['text'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final chat = this.chat;
    final text = this.text;
    return {
      if (chat != null) 'chat': chat,
      if (text != null) 'text': text,
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

/// Contains specifications for a generative AI resource with which to use the
/// prompt. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-create.html">Create
/// a prompt using Prompt management</a>.
class PromptGenAiResource {
  /// Specifies an Amazon Bedrock agent with which to use the prompt.
  final PromptAgentResource? agent;

  PromptGenAiResource({
    this.agent,
  });

  factory PromptGenAiResource.fromJson(Map<String, dynamic> json) {
    return PromptGenAiResource(
      agent: json['agent'] != null
          ? PromptAgentResource.fromJson(json['agent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agent = this.agent;
    return {
      if (agent != null) 'agent': agent,
    };
  }
}

/// Contains specifications for an Amazon Bedrock agent with which to use the
/// prompt. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-create.html">Create
/// a prompt using Prompt management</a> and <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents.html">Automate
/// tasks in your application using conversational agents</a>.
class PromptAgentResource {
  /// The ARN of the agent with which to use the prompt.
  final String agentIdentifier;

  PromptAgentResource({
    required this.agentIdentifier,
  });

  factory PromptAgentResource.fromJson(Map<String, dynamic> json) {
    return PromptAgentResource(
      agentIdentifier: (json['agentIdentifier'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final agentIdentifier = this.agentIdentifier;
    return {
      'agentIdentifier': agentIdentifier,
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

  /// The percentage of most-likely candidates that the model considers for the
  /// next token.
  final double? topP;

  PromptModelInferenceConfiguration({
    this.maxTokens,
    this.stopSequences,
    this.temperature,
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
      topP: json['topP'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxTokens = this.maxTokens;
    final stopSequences = this.stopSequences;
    final temperature = this.temperature;
    final topP = this.topP;
    return {
      if (maxTokens != null) 'maxTokens': maxTokens,
      if (stopSequences != null) 'stopSequences': stopSequences,
      if (temperature != null) 'temperature': temperature,
      if (topP != null) 'topP': topP,
    };
  }
}

/// Contains configurations for a text prompt template. To include a variable,
/// enclose a word in double curly braces as in <code>{{variable}}</code>.
class TextPromptTemplateConfiguration {
  /// The message for the prompt.
  final String text;

  /// A cache checkpoint within a template configuration.
  final CachePointBlock? cachePoint;

  /// An array of the variables in the prompt template.
  final List<PromptInputVariable>? inputVariables;

  TextPromptTemplateConfiguration({
    required this.text,
    this.cachePoint,
    this.inputVariables,
  });

  factory TextPromptTemplateConfiguration.fromJson(Map<String, dynamic> json) {
    return TextPromptTemplateConfiguration(
      text: (json['text'] as String?) ?? '',
      cachePoint: json['cachePoint'] != null
          ? CachePointBlock.fromJson(json['cachePoint'] as Map<String, dynamic>)
          : null,
      inputVariables: (json['inputVariables'] as List?)
          ?.nonNulls
          .map((e) => PromptInputVariable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final cachePoint = this.cachePoint;
    final inputVariables = this.inputVariables;
    return {
      'text': text,
      if (cachePoint != null) 'cachePoint': cachePoint,
      if (inputVariables != null) 'inputVariables': inputVariables,
    };
  }
}

/// Contains configurations to use a prompt in a conversational format. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-create.html">Create
/// a prompt using Prompt management</a>.
class ChatPromptTemplateConfiguration {
  /// Contains messages in the chat for the prompt.
  final List<Message> messages;

  /// An array of the variables in the prompt template.
  final List<PromptInputVariable>? inputVariables;

  /// Contains system prompts to provide context to the model or to describe how
  /// it should behave.
  final List<SystemContentBlock>? system;

  /// Configuration information for the tools that the model can use when
  /// generating a response.
  final ToolConfiguration? toolConfiguration;

  ChatPromptTemplateConfiguration({
    required this.messages,
    this.inputVariables,
    this.system,
    this.toolConfiguration,
  });

  factory ChatPromptTemplateConfiguration.fromJson(Map<String, dynamic> json) {
    return ChatPromptTemplateConfiguration(
      messages: ((json['messages'] as List?) ?? const [])
          .nonNulls
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      inputVariables: (json['inputVariables'] as List?)
          ?.nonNulls
          .map((e) => PromptInputVariable.fromJson(e as Map<String, dynamic>))
          .toList(),
      system: (json['system'] as List?)
          ?.nonNulls
          .map((e) => SystemContentBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      toolConfiguration: json['toolConfiguration'] != null
          ? ToolConfiguration.fromJson(
              json['toolConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final messages = this.messages;
    final inputVariables = this.inputVariables;
    final system = this.system;
    final toolConfiguration = this.toolConfiguration;
    return {
      'messages': messages,
      if (inputVariables != null) 'inputVariables': inputVariables,
      if (system != null) 'system': system,
      if (toolConfiguration != null) 'toolConfiguration': toolConfiguration,
    };
  }
}

/// Configuration information for the tools that the model can use when
/// generating a response. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Use
/// a tool to complete an Amazon Bedrock model response</a>.
class ToolConfiguration {
  /// An array of tools to pass to a model.
  final List<Tool> tools;

  /// Defines which tools the model should request when invoked.
  final ToolChoice? toolChoice;

  ToolConfiguration({
    required this.tools,
    this.toolChoice,
  });

  factory ToolConfiguration.fromJson(Map<String, dynamic> json) {
    return ToolConfiguration(
      tools: ((json['tools'] as List?) ?? const [])
          .nonNulls
          .map((e) => Tool.fromJson(e as Map<String, dynamic>))
          .toList(),
      toolChoice: json['toolChoice'] != null
          ? ToolChoice.fromJson(json['toolChoice'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tools = this.tools;
    final toolChoice = this.toolChoice;
    return {
      'tools': tools,
      if (toolChoice != null) 'toolChoice': toolChoice,
    };
  }
}

/// Defines which tools the model should request when invoked. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Use
/// a tool to complete an Amazon Bedrock model response</a>.
class ToolChoice {
  /// Defines tools, at least one of which must be requested by the model. No text
  /// is generated but the results of tool use are sent back to the model to help
  /// generate a response.
  final AnyToolChoice? any;

  /// Defines tools. The model automatically decides whether to call a tool or to
  /// generate text instead.
  final AutoToolChoice? auto;

  /// Defines a specific tool that the model must request. No text is generated
  /// but the results of tool use are sent back to the model to help generate a
  /// response.
  final SpecificToolChoice? tool;

  ToolChoice({
    this.any,
    this.auto,
    this.tool,
  });

  factory ToolChoice.fromJson(Map<String, dynamic> json) {
    return ToolChoice(
      any: json['any'] != null
          ? AnyToolChoice.fromJson(json['any'] as Map<String, dynamic>)
          : null,
      auto: json['auto'] != null
          ? AutoToolChoice.fromJson(json['auto'] as Map<String, dynamic>)
          : null,
      tool: json['tool'] != null
          ? SpecificToolChoice.fromJson(json['tool'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final any = this.any;
    final auto = this.auto;
    final tool = this.tool;
    return {
      if (any != null) 'any': any,
      if (auto != null) 'auto': auto,
      if (tool != null) 'tool': tool,
    };
  }
}

/// Defines tools. The model automatically decides whether to call a tool or to
/// generate text instead. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Use
/// a tool to complete an Amazon Bedrock model response</a>.
class AutoToolChoice {
  AutoToolChoice();

  factory AutoToolChoice.fromJson(Map<String, dynamic> _) {
    return AutoToolChoice();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Defines tools, at least one of which must be requested by the model. No text
/// is generated but the results of tool use are sent back to the model to help
/// generate a response. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Use
/// a tool to complete an Amazon Bedrock model response</a>.
class AnyToolChoice {
  AnyToolChoice();

  factory AnyToolChoice.fromJson(Map<String, dynamic> _) {
    return AnyToolChoice();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Defines a specific tool that the model must request. No text is generated
/// but the results of tool use are sent back to the model to help generate a
/// response. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Use
/// a tool to complete an Amazon Bedrock model response</a>.
class SpecificToolChoice {
  /// The name of the tool.
  final String name;

  SpecificToolChoice({
    required this.name,
  });

  factory SpecificToolChoice.fromJson(Map<String, dynamic> json) {
    return SpecificToolChoice(
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

/// Contains configurations for a tool that a model can use when generating a
/// response. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Use
/// a tool to complete an Amazon Bedrock model response</a>.
class Tool {
  /// Creates a cache checkpoint within a tool designation
  final CachePointBlock? cachePoint;

  /// The specification for the tool.
  final ToolSpecification? toolSpec;

  Tool({
    this.cachePoint,
    this.toolSpec,
  });

  factory Tool.fromJson(Map<String, dynamic> json) {
    return Tool(
      cachePoint: json['cachePoint'] != null
          ? CachePointBlock.fromJson(json['cachePoint'] as Map<String, dynamic>)
          : null,
      toolSpec: json['toolSpec'] != null
          ? ToolSpecification.fromJson(json['toolSpec'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cachePoint = this.cachePoint;
    final toolSpec = this.toolSpec;
    return {
      if (cachePoint != null) 'cachePoint': cachePoint,
      if (toolSpec != null) 'toolSpec': toolSpec,
    };
  }
}

/// Contains a specification for a tool. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Use
/// a tool to complete an Amazon Bedrock model response</a>.
class ToolSpecification {
  /// The input schema for the tool.
  final ToolInputSchema inputSchema;

  /// The name of the tool.
  final String name;

  /// The description of the tool.
  final String? description;

  /// Whether to enforce strict JSON schema adherence for the tool input
  final bool? strict;

  ToolSpecification({
    required this.inputSchema,
    required this.name,
    this.description,
    this.strict,
  });

  factory ToolSpecification.fromJson(Map<String, dynamic> json) {
    return ToolSpecification(
      inputSchema: ToolInputSchema.fromJson(
          (json['inputSchema'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      name: (json['name'] as String?) ?? '',
      description: json['description'] as String?,
      strict: json['strict'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputSchema = this.inputSchema;
    final name = this.name;
    final description = this.description;
    final strict = this.strict;
    return {
      'inputSchema': inputSchema,
      'name': name,
      if (description != null) 'description': description,
      if (strict != null) 'strict': strict,
    };
  }
}

/// Indicates where a cache checkpoint is located. All information before this
/// checkpoint is cached to be accessed on subsequent requests.
class CachePointBlock {
  /// Indicates that the CachePointBlock is of the default type
  final CachePointType type;

  CachePointBlock({
    required this.type,
  });

  factory CachePointBlock.fromJson(Map<String, dynamic> json) {
    return CachePointBlock(
      type: CachePointType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'type': type.value,
    };
  }
}

class CachePointType {
  static const $default = CachePointType._('default');

  final String value;

  const CachePointType._(this.value);

  static const values = [$default];

  static CachePointType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CachePointType._(value));

  @override
  bool operator ==(other) => other is CachePointType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The input schema for the tool. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Use
/// a tool to complete an Amazon Bedrock model response</a>.
class ToolInputSchema {
  /// A JSON object defining the input schema for the tool.
  final Document? json;

  ToolInputSchema({
    this.json,
  });

  factory ToolInputSchema.fromJson(Map<String, dynamic> json) {
    return ToolInputSchema(
      json: json['json'] != null
          ? Document.fromJson(json['json'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = this.json;
    return {
      if (json != null) 'json': json,
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

/// Contains a system prompt to provide context to the model or to describe how
/// it should behave. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-create.html">Create
/// a prompt using Prompt management</a>.
class SystemContentBlock {
  /// Creates a cache checkpoint within a tool designation
  final CachePointBlock? cachePoint;

  /// The text in the system prompt.
  final String? text;

  SystemContentBlock({
    this.cachePoint,
    this.text,
  });

  factory SystemContentBlock.fromJson(Map<String, dynamic> json) {
    return SystemContentBlock(
      cachePoint: json['cachePoint'] != null
          ? CachePointBlock.fromJson(json['cachePoint'] as Map<String, dynamic>)
          : null,
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cachePoint = this.cachePoint;
    final text = this.text;
    return {
      if (cachePoint != null) 'cachePoint': cachePoint,
      if (text != null) 'text': text,
    };
  }
}

/// A message input or response from a model. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-create.html">Create
/// a prompt using Prompt management</a>.
class Message {
  /// The content in the message.
  final List<ContentBlock> content;

  /// The role that the message belongs to.
  final ConversationRole role;

  Message({
    required this.content,
    required this.role,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      content: ((json['content'] as List?) ?? const [])
          .nonNulls
          .map((e) => ContentBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      role: ConversationRole.fromString((json['role'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final role = this.role;
    return {
      'content': content,
      'role': role.value,
    };
  }
}

class ConversationRole {
  static const user = ConversationRole._('user');
  static const assistant = ConversationRole._('assistant');

  final String value;

  const ConversationRole._(this.value);

  static const values = [user, assistant];

  static ConversationRole fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConversationRole._(value));

  @override
  bool operator ==(other) => other is ConversationRole && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the content for the message you pass to, or receive from a model.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-create.html">Create
/// a prompt using Prompt management</a>.
class ContentBlock {
  /// Creates a cache checkpoint within a message.
  final CachePointBlock? cachePoint;

  /// The text in the message.
  final String? text;

  ContentBlock({
    this.cachePoint,
    this.text,
  });

  factory ContentBlock.fromJson(Map<String, dynamic> json) {
    return ContentBlock(
      cachePoint: json['cachePoint'] != null
          ? CachePointBlock.fromJson(json['cachePoint'] as Map<String, dynamic>)
          : null,
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cachePoint = this.cachePoint;
    final text = this.text;
    return {
      if (cachePoint != null) 'cachePoint': cachePoint,
      if (text != null) 'text': text,
    };
  }
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
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as String?) ?? '',
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

/// Contains information about a knowledge base.
class KnowledgeBase {
  /// The time the knowledge base was created.
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

  /// The time the knowledge base was last updated.
  final DateTime updatedAt;

  /// The description of the knowledge base.
  final String? description;

  /// A list of reasons that the API operation on the knowledge base failed.
  final List<String>? failureReasons;

  /// Contains details about the storage configuration of the knowledge base.
  final StorageConfiguration? storageConfiguration;

  KnowledgeBase({
    required this.createdAt,
    required this.knowledgeBaseArn,
    required this.knowledgeBaseConfiguration,
    required this.knowledgeBaseId,
    required this.name,
    required this.roleArn,
    required this.status,
    required this.updatedAt,
    this.description,
    this.failureReasons,
    this.storageConfiguration,
  });

  factory KnowledgeBase.fromJson(Map<String, dynamic> json) {
    return KnowledgeBase(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      knowledgeBaseArn: (json['knowledgeBaseArn'] as String?) ?? '',
      knowledgeBaseConfiguration: KnowledgeBaseConfiguration.fromJson(
          (json['knowledgeBaseConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      status: KnowledgeBaseStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      failureReasons: (json['failureReasons'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      storageConfiguration: json['storageConfiguration'] != null
          ? StorageConfiguration.fromJson(
              json['storageConfiguration'] as Map<String, dynamic>)
          : null,
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
    final updatedAt = this.updatedAt;
    final description = this.description;
    final failureReasons = this.failureReasons;
    final storageConfiguration = this.storageConfiguration;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'knowledgeBaseArn': knowledgeBaseArn,
      'knowledgeBaseConfiguration': knowledgeBaseConfiguration,
      'knowledgeBaseId': knowledgeBaseId,
      'name': name,
      'roleArn': roleArn,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (failureReasons != null) 'failureReasons': failureReasons,
      if (storageConfiguration != null)
        'storageConfiguration': storageConfiguration,
    };
  }
}

/// Contains details about the vector embeddings configuration of the knowledge
/// base.
class KnowledgeBaseConfiguration {
  /// The type of data that the data source is converted into for the knowledge
  /// base.
  final KnowledgeBaseType type;

  /// Settings for an Amazon Kendra knowledge base.
  final KendraKnowledgeBaseConfiguration? kendraKnowledgeBaseConfiguration;

  /// Specifies configurations for a knowledge base connected to an SQL database.
  final SqlKnowledgeBaseConfiguration? sqlKnowledgeBaseConfiguration;

  /// Contains details about the model that's used to convert the data source into
  /// vector embeddings.
  final VectorKnowledgeBaseConfiguration? vectorKnowledgeBaseConfiguration;

  KnowledgeBaseConfiguration({
    required this.type,
    this.kendraKnowledgeBaseConfiguration,
    this.sqlKnowledgeBaseConfiguration,
    this.vectorKnowledgeBaseConfiguration,
  });

  factory KnowledgeBaseConfiguration.fromJson(Map<String, dynamic> json) {
    return KnowledgeBaseConfiguration(
      type: KnowledgeBaseType.fromString((json['type'] as String?) ?? ''),
      kendraKnowledgeBaseConfiguration:
          json['kendraKnowledgeBaseConfiguration'] != null
              ? KendraKnowledgeBaseConfiguration.fromJson(
                  json['kendraKnowledgeBaseConfiguration']
                      as Map<String, dynamic>)
              : null,
      sqlKnowledgeBaseConfiguration:
          json['sqlKnowledgeBaseConfiguration'] != null
              ? SqlKnowledgeBaseConfiguration.fromJson(
                  json['sqlKnowledgeBaseConfiguration'] as Map<String, dynamic>)
              : null,
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
    final kendraKnowledgeBaseConfiguration =
        this.kendraKnowledgeBaseConfiguration;
    final sqlKnowledgeBaseConfiguration = this.sqlKnowledgeBaseConfiguration;
    final vectorKnowledgeBaseConfiguration =
        this.vectorKnowledgeBaseConfiguration;
    return {
      'type': type.value,
      if (kendraKnowledgeBaseConfiguration != null)
        'kendraKnowledgeBaseConfiguration': kendraKnowledgeBaseConfiguration,
      if (sqlKnowledgeBaseConfiguration != null)
        'sqlKnowledgeBaseConfiguration': sqlKnowledgeBaseConfiguration,
      if (vectorKnowledgeBaseConfiguration != null)
        'vectorKnowledgeBaseConfiguration': vectorKnowledgeBaseConfiguration,
    };
  }
}

/// Contains the storage configuration of the knowledge base.
class StorageConfiguration {
  /// The vector store service in which the knowledge base is stored.
  final KnowledgeBaseStorageType type;

  /// Contains the storage configuration of the knowledge base in MongoDB Atlas.
  final MongoDbAtlasConfiguration? mongoDbAtlasConfiguration;

  /// Contains details about the Neptune Analytics configuration of the knowledge
  /// base in Amazon Neptune. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-setup-neptune.html">Create
  /// a vector index in Amazon Neptune Analytics.</a>.
  final NeptuneAnalyticsConfiguration? neptuneAnalyticsConfiguration;

  /// Contains details about the storage configuration of the knowledge base in
  /// OpenSearch Managed Cluster. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-setup-osm.html">Create
  /// a vector index in Amazon OpenSearch Service</a>.
  final OpenSearchManagedClusterConfiguration?
      opensearchManagedClusterConfiguration;

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

  /// The configuration settings for storing knowledge base data using S3 vectors.
  /// This includes vector index information and S3 bucket details for vector
  /// storage.
  final S3VectorsConfiguration? s3VectorsConfiguration;

  StorageConfiguration({
    required this.type,
    this.mongoDbAtlasConfiguration,
    this.neptuneAnalyticsConfiguration,
    this.opensearchManagedClusterConfiguration,
    this.opensearchServerlessConfiguration,
    this.pineconeConfiguration,
    this.rdsConfiguration,
    this.redisEnterpriseCloudConfiguration,
    this.s3VectorsConfiguration,
  });

  factory StorageConfiguration.fromJson(Map<String, dynamic> json) {
    return StorageConfiguration(
      type:
          KnowledgeBaseStorageType.fromString((json['type'] as String?) ?? ''),
      mongoDbAtlasConfiguration: json['mongoDbAtlasConfiguration'] != null
          ? MongoDbAtlasConfiguration.fromJson(
              json['mongoDbAtlasConfiguration'] as Map<String, dynamic>)
          : null,
      neptuneAnalyticsConfiguration:
          json['neptuneAnalyticsConfiguration'] != null
              ? NeptuneAnalyticsConfiguration.fromJson(
                  json['neptuneAnalyticsConfiguration'] as Map<String, dynamic>)
              : null,
      opensearchManagedClusterConfiguration:
          json['opensearchManagedClusterConfiguration'] != null
              ? OpenSearchManagedClusterConfiguration.fromJson(
                  json['opensearchManagedClusterConfiguration']
                      as Map<String, dynamic>)
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
      s3VectorsConfiguration: json['s3VectorsConfiguration'] != null
          ? S3VectorsConfiguration.fromJson(
              json['s3VectorsConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final mongoDbAtlasConfiguration = this.mongoDbAtlasConfiguration;
    final neptuneAnalyticsConfiguration = this.neptuneAnalyticsConfiguration;
    final opensearchManagedClusterConfiguration =
        this.opensearchManagedClusterConfiguration;
    final opensearchServerlessConfiguration =
        this.opensearchServerlessConfiguration;
    final pineconeConfiguration = this.pineconeConfiguration;
    final rdsConfiguration = this.rdsConfiguration;
    final redisEnterpriseCloudConfiguration =
        this.redisEnterpriseCloudConfiguration;
    final s3VectorsConfiguration = this.s3VectorsConfiguration;
    return {
      'type': type.value,
      if (mongoDbAtlasConfiguration != null)
        'mongoDbAtlasConfiguration': mongoDbAtlasConfiguration,
      if (neptuneAnalyticsConfiguration != null)
        'neptuneAnalyticsConfiguration': neptuneAnalyticsConfiguration,
      if (opensearchManagedClusterConfiguration != null)
        'opensearchManagedClusterConfiguration':
            opensearchManagedClusterConfiguration,
      if (opensearchServerlessConfiguration != null)
        'opensearchServerlessConfiguration': opensearchServerlessConfiguration,
      if (pineconeConfiguration != null)
        'pineconeConfiguration': pineconeConfiguration,
      if (rdsConfiguration != null) 'rdsConfiguration': rdsConfiguration,
      if (redisEnterpriseCloudConfiguration != null)
        'redisEnterpriseCloudConfiguration': redisEnterpriseCloudConfiguration,
      if (s3VectorsConfiguration != null)
        's3VectorsConfiguration': s3VectorsConfiguration,
    };
  }
}

class KnowledgeBaseStatus {
  static const creating = KnowledgeBaseStatus._('CREATING');
  static const active = KnowledgeBaseStatus._('ACTIVE');
  static const deleting = KnowledgeBaseStatus._('DELETING');
  static const updating = KnowledgeBaseStatus._('UPDATING');
  static const failed = KnowledgeBaseStatus._('FAILED');
  static const deleteUnsuccessful =
      KnowledgeBaseStatus._('DELETE_UNSUCCESSFUL');

  final String value;

  const KnowledgeBaseStatus._(this.value);

  static const values = [
    creating,
    active,
    deleting,
    updating,
    failed,
    deleteUnsuccessful
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

class KnowledgeBaseStorageType {
  static const opensearchServerless =
      KnowledgeBaseStorageType._('OPENSEARCH_SERVERLESS');
  static const pinecone = KnowledgeBaseStorageType._('PINECONE');
  static const redisEnterpriseCloud =
      KnowledgeBaseStorageType._('REDIS_ENTERPRISE_CLOUD');
  static const rds = KnowledgeBaseStorageType._('RDS');
  static const mongoDbAtlas = KnowledgeBaseStorageType._('MONGO_DB_ATLAS');
  static const neptuneAnalytics =
      KnowledgeBaseStorageType._('NEPTUNE_ANALYTICS');
  static const opensearchManagedCluster =
      KnowledgeBaseStorageType._('OPENSEARCH_MANAGED_CLUSTER');
  static const s3Vectors = KnowledgeBaseStorageType._('S3_VECTORS');

  final String value;

  const KnowledgeBaseStorageType._(this.value);

  static const values = [
    opensearchServerless,
    pinecone,
    redisEnterpriseCloud,
    rds,
    mongoDbAtlas,
    neptuneAnalytics,
    opensearchManagedCluster,
    s3Vectors
  ];

  static KnowledgeBaseStorageType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KnowledgeBaseStorageType._(value));

  @override
  bool operator ==(other) =>
      other is KnowledgeBaseStorageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      collectionArn: (json['collectionArn'] as String?) ?? '',
      fieldMapping: OpenSearchServerlessFieldMapping.fromJson(
          (json['fieldMapping'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      vectorIndexName: (json['vectorIndexName'] as String?) ?? '',
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

/// Contains details about the Managed Cluster configuration of the knowledge
/// base in Amazon OpenSearch Service. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-setup-osm.html">Create
/// a vector index in OpenSearch Managed Cluster</a>.
class OpenSearchManagedClusterConfiguration {
  /// The Amazon Resource Name (ARN) of the OpenSearch domain.
  final String domainArn;

  /// The endpoint URL the OpenSearch domain.
  final String domainEndpoint;

  /// Contains the names of the fields to which to map information about the
  /// vector store.
  final OpenSearchManagedClusterFieldMapping fieldMapping;

  /// The name of the vector store.
  final String vectorIndexName;

  OpenSearchManagedClusterConfiguration({
    required this.domainArn,
    required this.domainEndpoint,
    required this.fieldMapping,
    required this.vectorIndexName,
  });

  factory OpenSearchManagedClusterConfiguration.fromJson(
      Map<String, dynamic> json) {
    return OpenSearchManagedClusterConfiguration(
      domainArn: (json['domainArn'] as String?) ?? '',
      domainEndpoint: (json['domainEndpoint'] as String?) ?? '',
      fieldMapping: OpenSearchManagedClusterFieldMapping.fromJson(
          (json['fieldMapping'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      vectorIndexName: (json['vectorIndexName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final domainArn = this.domainArn;
    final domainEndpoint = this.domainEndpoint;
    final fieldMapping = this.fieldMapping;
    final vectorIndexName = this.vectorIndexName;
    return {
      'domainArn': domainArn,
      'domainEndpoint': domainEndpoint,
      'fieldMapping': fieldMapping,
      'vectorIndexName': vectorIndexName,
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
      connectionString: (json['connectionString'] as String?) ?? '',
      credentialsSecretArn: (json['credentialsSecretArn'] as String?) ?? '',
      fieldMapping: PineconeFieldMapping.fromJson(
          (json['fieldMapping'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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
      credentialsSecretArn: (json['credentialsSecretArn'] as String?) ?? '',
      endpoint: (json['endpoint'] as String?) ?? '',
      fieldMapping: RedisEnterpriseCloudFieldMapping.fromJson(
          (json['fieldMapping'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      vectorIndexName: (json['vectorIndexName'] as String?) ?? '',
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
      credentialsSecretArn: (json['credentialsSecretArn'] as String?) ?? '',
      databaseName: (json['databaseName'] as String?) ?? '',
      fieldMapping: RdsFieldMapping.fromJson(
          (json['fieldMapping'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      resourceArn: (json['resourceArn'] as String?) ?? '',
      tableName: (json['tableName'] as String?) ?? '',
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

  /// The name of the text search index in the MongoDB collection. This is
  /// required for using the hybrid search feature.
  final String? textIndexName;

  MongoDbAtlasConfiguration({
    required this.collectionName,
    required this.credentialsSecretArn,
    required this.databaseName,
    required this.endpoint,
    required this.fieldMapping,
    required this.vectorIndexName,
    this.endpointServiceName,
    this.textIndexName,
  });

  factory MongoDbAtlasConfiguration.fromJson(Map<String, dynamic> json) {
    return MongoDbAtlasConfiguration(
      collectionName: (json['collectionName'] as String?) ?? '',
      credentialsSecretArn: (json['credentialsSecretArn'] as String?) ?? '',
      databaseName: (json['databaseName'] as String?) ?? '',
      endpoint: (json['endpoint'] as String?) ?? '',
      fieldMapping: MongoDbAtlasFieldMapping.fromJson(
          (json['fieldMapping'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      vectorIndexName: (json['vectorIndexName'] as String?) ?? '',
      endpointServiceName: json['endpointServiceName'] as String?,
      textIndexName: json['textIndexName'] as String?,
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
    final textIndexName = this.textIndexName;
    return {
      'collectionName': collectionName,
      'credentialsSecretArn': credentialsSecretArn,
      'databaseName': databaseName,
      'endpoint': endpoint,
      'fieldMapping': fieldMapping,
      'vectorIndexName': vectorIndexName,
      if (endpointServiceName != null)
        'endpointServiceName': endpointServiceName,
      if (textIndexName != null) 'textIndexName': textIndexName,
    };
  }
}

/// Contains details about the storage configuration of the knowledge base in
/// Amazon Neptune Analytics. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-setup-neptune.html">Create
/// a vector index in Amazon Neptune Analytics</a>.
class NeptuneAnalyticsConfiguration {
  /// Contains the names of the fields to which to map information about the
  /// vector store.
  final NeptuneAnalyticsFieldMapping fieldMapping;

  /// The Amazon Resource Name (ARN) of the Neptune Analytics vector store.
  final String graphArn;

  NeptuneAnalyticsConfiguration({
    required this.fieldMapping,
    required this.graphArn,
  });

  factory NeptuneAnalyticsConfiguration.fromJson(Map<String, dynamic> json) {
    return NeptuneAnalyticsConfiguration(
      fieldMapping: NeptuneAnalyticsFieldMapping.fromJson(
          (json['fieldMapping'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      graphArn: (json['graphArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final fieldMapping = this.fieldMapping;
    final graphArn = this.graphArn;
    return {
      'fieldMapping': fieldMapping,
      'graphArn': graphArn,
    };
  }
}

/// Contains the storage configuration of the knowledge base for S3 vectors.
class S3VectorsConfiguration {
  /// The Amazon Resource Name (ARN) of the vector index used for the knowledge
  /// base. This ARN identifies the specific vector index resource within Amazon
  /// Bedrock.
  final String? indexArn;

  /// The name of the vector index used for the knowledge base. This name
  /// identifies the vector index within the Amazon Bedrock service.
  final String? indexName;

  /// The Amazon Resource Name (ARN) of the S3 bucket where vector embeddings are
  /// stored. This bucket contains the vector data used by the knowledge base.
  final String? vectorBucketArn;

  S3VectorsConfiguration({
    this.indexArn,
    this.indexName,
    this.vectorBucketArn,
  });

  factory S3VectorsConfiguration.fromJson(Map<String, dynamic> json) {
    return S3VectorsConfiguration(
      indexArn: json['indexArn'] as String?,
      indexName: json['indexName'] as String?,
      vectorBucketArn: json['vectorBucketArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final indexArn = this.indexArn;
    final indexName = this.indexName;
    final vectorBucketArn = this.vectorBucketArn;
    return {
      if (indexArn != null) 'indexArn': indexArn,
      if (indexName != null) 'indexName': indexName,
      if (vectorBucketArn != null) 'vectorBucketArn': vectorBucketArn,
    };
  }
}

/// Contains the names of the fields to which to map information about the
/// vector store.
class NeptuneAnalyticsFieldMapping {
  /// The name of the field in which Amazon Bedrock stores metadata about the
  /// vector store.
  final String metadataField;

  /// The name of the field in which Amazon Bedrock stores the raw text from your
  /// data. The text is split according to the chunking strategy you choose.
  final String textField;

  NeptuneAnalyticsFieldMapping({
    required this.metadataField,
    required this.textField,
  });

  factory NeptuneAnalyticsFieldMapping.fromJson(Map<String, dynamic> json) {
    return NeptuneAnalyticsFieldMapping(
      metadataField: (json['metadataField'] as String?) ?? '',
      textField: (json['textField'] as String?) ?? '',
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
      metadataField: (json['metadataField'] as String?) ?? '',
      textField: (json['textField'] as String?) ?? '',
      vectorField: (json['vectorField'] as String?) ?? '',
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

  /// Provide a name for the universal metadata field where Amazon Bedrock will
  /// store any custom metadata from your data source.
  final String? customMetadataField;

  RdsFieldMapping({
    required this.metadataField,
    required this.primaryKeyField,
    required this.textField,
    required this.vectorField,
    this.customMetadataField,
  });

  factory RdsFieldMapping.fromJson(Map<String, dynamic> json) {
    return RdsFieldMapping(
      metadataField: (json['metadataField'] as String?) ?? '',
      primaryKeyField: (json['primaryKeyField'] as String?) ?? '',
      textField: (json['textField'] as String?) ?? '',
      vectorField: (json['vectorField'] as String?) ?? '',
      customMetadataField: json['customMetadataField'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metadataField = this.metadataField;
    final primaryKeyField = this.primaryKeyField;
    final textField = this.textField;
    final vectorField = this.vectorField;
    final customMetadataField = this.customMetadataField;
    return {
      'metadataField': metadataField,
      'primaryKeyField': primaryKeyField,
      'textField': textField,
      'vectorField': vectorField,
      if (customMetadataField != null)
        'customMetadataField': customMetadataField,
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
      metadataField: (json['metadataField'] as String?) ?? '',
      textField: (json['textField'] as String?) ?? '',
      vectorField: (json['vectorField'] as String?) ?? '',
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
      metadataField: (json['metadataField'] as String?) ?? '',
      textField: (json['textField'] as String?) ?? '',
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

/// Contains the names of the fields to which to map information about the
/// vector store.
class OpenSearchManagedClusterFieldMapping {
  /// The name of the field in which Amazon Bedrock stores metadata about the
  /// vector store.
  final String metadataField;

  /// The name of the field in which Amazon Bedrock stores the raw text from your
  /// data. The text is split according to the chunking strategy you choose.
  final String textField;

  /// The name of the field in which Amazon Bedrock stores the vector embeddings
  /// for your data sources.
  final String vectorField;

  OpenSearchManagedClusterFieldMapping({
    required this.metadataField,
    required this.textField,
    required this.vectorField,
  });

  factory OpenSearchManagedClusterFieldMapping.fromJson(
      Map<String, dynamic> json) {
    return OpenSearchManagedClusterFieldMapping(
      metadataField: (json['metadataField'] as String?) ?? '',
      textField: (json['textField'] as String?) ?? '',
      vectorField: (json['vectorField'] as String?) ?? '',
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
      metadataField: (json['metadataField'] as String?) ?? '',
      textField: (json['textField'] as String?) ?? '',
      vectorField: (json['vectorField'] as String?) ?? '',
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

class KnowledgeBaseType {
  static const vector = KnowledgeBaseType._('VECTOR');
  static const kendra = KnowledgeBaseType._('KENDRA');
  static const sql = KnowledgeBaseType._('SQL');

  final String value;

  const KnowledgeBaseType._(this.value);

  static const values = [vector, kendra, sql];

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

/// Contains details about the model used to create vector embeddings for the
/// knowledge base.
class VectorKnowledgeBaseConfiguration {
  /// The Amazon Resource Name (ARN) of the model used to create vector embeddings
  /// for the knowledge base.
  final String embeddingModelArn;

  /// The embeddings model configuration details for the vector model used in
  /// Knowledge Base.
  final EmbeddingModelConfiguration? embeddingModelConfiguration;

  /// If you include multimodal data from your data source, use this object to
  /// specify configurations for the storage location of the images extracted from
  /// your documents. These images can be retrieved and returned to the end user.
  /// They can also be used in generation when using <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html">RetrieveAndGenerate</a>.
  final SupplementalDataStorageConfiguration?
      supplementalDataStorageConfiguration;

  VectorKnowledgeBaseConfiguration({
    required this.embeddingModelArn,
    this.embeddingModelConfiguration,
    this.supplementalDataStorageConfiguration,
  });

  factory VectorKnowledgeBaseConfiguration.fromJson(Map<String, dynamic> json) {
    return VectorKnowledgeBaseConfiguration(
      embeddingModelArn: (json['embeddingModelArn'] as String?) ?? '',
      embeddingModelConfiguration: json['embeddingModelConfiguration'] != null
          ? EmbeddingModelConfiguration.fromJson(
              json['embeddingModelConfiguration'] as Map<String, dynamic>)
          : null,
      supplementalDataStorageConfiguration:
          json['supplementalDataStorageConfiguration'] != null
              ? SupplementalDataStorageConfiguration.fromJson(
                  json['supplementalDataStorageConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final embeddingModelArn = this.embeddingModelArn;
    final embeddingModelConfiguration = this.embeddingModelConfiguration;
    final supplementalDataStorageConfiguration =
        this.supplementalDataStorageConfiguration;
    return {
      'embeddingModelArn': embeddingModelArn,
      if (embeddingModelConfiguration != null)
        'embeddingModelConfiguration': embeddingModelConfiguration,
      if (supplementalDataStorageConfiguration != null)
        'supplementalDataStorageConfiguration':
            supplementalDataStorageConfiguration,
    };
  }
}

/// Settings for an Amazon Kendra knowledge base.
class KendraKnowledgeBaseConfiguration {
  /// The ARN of the Amazon Kendra index.
  final String kendraIndexArn;

  KendraKnowledgeBaseConfiguration({
    required this.kendraIndexArn,
  });

  factory KendraKnowledgeBaseConfiguration.fromJson(Map<String, dynamic> json) {
    return KendraKnowledgeBaseConfiguration(
      kendraIndexArn: (json['kendraIndexArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final kendraIndexArn = this.kendraIndexArn;
    return {
      'kendraIndexArn': kendraIndexArn,
    };
  }
}

/// Contains configurations for a knowledge base connected to an SQL database.
/// Specify the SQL database type in the <code>type</code> field and include the
/// corresponding field. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-build-structured.html">Build
/// a knowledge base by connecting to a structured data source</a> in the Amazon
/// Bedrock User Guide.
class SqlKnowledgeBaseConfiguration {
  /// The type of SQL database to connect to the knowledge base.
  final QueryEngineType type;

  /// Specifies configurations for a knowledge base connected to an Amazon
  /// Redshift database.
  final RedshiftConfiguration? redshiftConfiguration;

  SqlKnowledgeBaseConfiguration({
    required this.type,
    this.redshiftConfiguration,
  });

  factory SqlKnowledgeBaseConfiguration.fromJson(Map<String, dynamic> json) {
    return SqlKnowledgeBaseConfiguration(
      type: QueryEngineType.fromString((json['type'] as String?) ?? ''),
      redshiftConfiguration: json['redshiftConfiguration'] != null
          ? RedshiftConfiguration.fromJson(
              json['redshiftConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final redshiftConfiguration = this.redshiftConfiguration;
    return {
      'type': type.value,
      if (redshiftConfiguration != null)
        'redshiftConfiguration': redshiftConfiguration,
    };
  }
}

class QueryEngineType {
  static const redshift = QueryEngineType._('REDSHIFT');

  final String value;

  const QueryEngineType._(this.value);

  static const values = [redshift];

  static QueryEngineType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QueryEngineType._(value));

  @override
  bool operator ==(other) => other is QueryEngineType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains configurations for an Amazon Redshift database. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-build-structured.html">Build
/// a knowledge base by connecting to a structured data source</a> in the Amazon
/// Bedrock User Guide.
class RedshiftConfiguration {
  /// Specifies configurations for an Amazon Redshift query engine.
  final RedshiftQueryEngineConfiguration queryEngineConfiguration;

  /// Specifies configurations for Amazon Redshift database storage.
  final List<RedshiftQueryEngineStorageConfiguration> storageConfigurations;

  /// Specifies configurations for generating queries.
  final QueryGenerationConfiguration? queryGenerationConfiguration;

  RedshiftConfiguration({
    required this.queryEngineConfiguration,
    required this.storageConfigurations,
    this.queryGenerationConfiguration,
  });

  factory RedshiftConfiguration.fromJson(Map<String, dynamic> json) {
    return RedshiftConfiguration(
      queryEngineConfiguration: RedshiftQueryEngineConfiguration.fromJson(
          (json['queryEngineConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      storageConfigurations:
          ((json['storageConfigurations'] as List?) ?? const [])
              .nonNulls
              .map((e) => RedshiftQueryEngineStorageConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      queryGenerationConfiguration: json['queryGenerationConfiguration'] != null
          ? QueryGenerationConfiguration.fromJson(
              json['queryGenerationConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final queryEngineConfiguration = this.queryEngineConfiguration;
    final storageConfigurations = this.storageConfigurations;
    final queryGenerationConfiguration = this.queryGenerationConfiguration;
    return {
      'queryEngineConfiguration': queryEngineConfiguration,
      'storageConfigurations': storageConfigurations,
      if (queryGenerationConfiguration != null)
        'queryGenerationConfiguration': queryGenerationConfiguration,
    };
  }
}

/// Contains configurations for an Amazon Redshift query engine. Specify the
/// type of query engine in <code>type</code> and include the corresponding
/// field. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-build-structured.html">Build
/// a knowledge base by connecting to a structured data source</a> in the Amazon
/// Bedrock User Guide.
class RedshiftQueryEngineConfiguration {
  /// The type of query engine.
  final RedshiftQueryEngineType type;

  /// Specifies configurations for a provisioned Amazon Redshift query engine.
  final RedshiftProvisionedConfiguration? provisionedConfiguration;

  /// Specifies configurations for a serverless Amazon Redshift query engine.
  final RedshiftServerlessConfiguration? serverlessConfiguration;

  RedshiftQueryEngineConfiguration({
    required this.type,
    this.provisionedConfiguration,
    this.serverlessConfiguration,
  });

  factory RedshiftQueryEngineConfiguration.fromJson(Map<String, dynamic> json) {
    return RedshiftQueryEngineConfiguration(
      type: RedshiftQueryEngineType.fromString((json['type'] as String?) ?? ''),
      provisionedConfiguration: json['provisionedConfiguration'] != null
          ? RedshiftProvisionedConfiguration.fromJson(
              json['provisionedConfiguration'] as Map<String, dynamic>)
          : null,
      serverlessConfiguration: json['serverlessConfiguration'] != null
          ? RedshiftServerlessConfiguration.fromJson(
              json['serverlessConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final provisionedConfiguration = this.provisionedConfiguration;
    final serverlessConfiguration = this.serverlessConfiguration;
    return {
      'type': type.value,
      if (provisionedConfiguration != null)
        'provisionedConfiguration': provisionedConfiguration,
      if (serverlessConfiguration != null)
        'serverlessConfiguration': serverlessConfiguration,
    };
  }
}

/// Contains configurations for query generation. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-build-structured.html">Build
/// a knowledge base by connecting to a structured data source</a> in the Amazon
/// Bedrock User Guide..
class QueryGenerationConfiguration {
  /// The time after which query generation will time out.
  final int? executionTimeoutSeconds;

  /// Specifies configurations for context to use during query generation.
  final QueryGenerationContext? generationContext;

  QueryGenerationConfiguration({
    this.executionTimeoutSeconds,
    this.generationContext,
  });

  factory QueryGenerationConfiguration.fromJson(Map<String, dynamic> json) {
    return QueryGenerationConfiguration(
      executionTimeoutSeconds: json['executionTimeoutSeconds'] as int?,
      generationContext: json['generationContext'] != null
          ? QueryGenerationContext.fromJson(
              json['generationContext'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final executionTimeoutSeconds = this.executionTimeoutSeconds;
    final generationContext = this.generationContext;
    return {
      if (executionTimeoutSeconds != null)
        'executionTimeoutSeconds': executionTimeoutSeconds,
      if (generationContext != null) 'generationContext': generationContext,
    };
  }
}

/// &gt;Contains configurations for context to use during query generation.
class QueryGenerationContext {
  /// An array of objects, each of which defines information about example queries
  /// to help the query engine generate appropriate SQL queries.
  final List<CuratedQuery>? curatedQueries;

  /// An array of objects, each of which defines information about a table in the
  /// database.
  final List<QueryGenerationTable>? tables;

  QueryGenerationContext({
    this.curatedQueries,
    this.tables,
  });

  factory QueryGenerationContext.fromJson(Map<String, dynamic> json) {
    return QueryGenerationContext(
      curatedQueries: (json['curatedQueries'] as List?)
          ?.nonNulls
          .map((e) => CuratedQuery.fromJson(e as Map<String, dynamic>))
          .toList(),
      tables: (json['tables'] as List?)
          ?.nonNulls
          .map((e) => QueryGenerationTable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final curatedQueries = this.curatedQueries;
    final tables = this.tables;
    return {
      if (curatedQueries != null) 'curatedQueries': curatedQueries,
      if (tables != null) 'tables': tables,
    };
  }
}

/// Contains configurations for a query, each of which defines information about
/// example queries to help the query engine generate appropriate SQL queries.
class CuratedQuery {
  /// An example natural language query.
  final String naturalLanguage;

  /// The SQL equivalent of the natural language query.
  final String sql;

  CuratedQuery({
    required this.naturalLanguage,
    required this.sql,
  });

  factory CuratedQuery.fromJson(Map<String, dynamic> json) {
    return CuratedQuery(
      naturalLanguage: (json['naturalLanguage'] as String?) ?? '',
      sql: (json['sql'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final naturalLanguage = this.naturalLanguage;
    final sql = this.sql;
    return {
      'naturalLanguage': naturalLanguage,
      'sql': sql,
    };
  }
}

/// Contains information about a table for the query engine to consider.
class QueryGenerationTable {
  /// The name of the table for which the other fields in this object apply.
  final String name;

  /// An array of objects, each of which defines information about a column in the
  /// table.
  final List<QueryGenerationColumn>? columns;

  /// A description of the table that helps the query engine understand the
  /// contents of the table.
  final String? description;

  /// Specifies whether to include or exclude the table during query generation.
  /// If you specify <code>EXCLUDE</code>, the table will be ignored. If you
  /// specify <code>INCLUDE</code>, all other tables will be ignored.
  final IncludeExclude? inclusion;

  QueryGenerationTable({
    required this.name,
    this.columns,
    this.description,
    this.inclusion,
  });

  factory QueryGenerationTable.fromJson(Map<String, dynamic> json) {
    return QueryGenerationTable(
      name: (json['name'] as String?) ?? '',
      columns: (json['columns'] as List?)
          ?.nonNulls
          .map((e) => QueryGenerationColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      inclusion: (json['inclusion'] as String?)?.let(IncludeExclude.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final columns = this.columns;
    final description = this.description;
    final inclusion = this.inclusion;
    return {
      'name': name,
      if (columns != null) 'columns': columns,
      if (description != null) 'description': description,
      if (inclusion != null) 'inclusion': inclusion.value,
    };
  }
}

class IncludeExclude {
  static const include = IncludeExclude._('INCLUDE');
  static const exclude = IncludeExclude._('EXCLUDE');

  final String value;

  const IncludeExclude._(this.value);

  static const values = [include, exclude];

  static IncludeExclude fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IncludeExclude._(value));

  @override
  bool operator ==(other) => other is IncludeExclude && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about a column in the current table for the query
/// engine to consider.
class QueryGenerationColumn {
  /// A description of the column that helps the query engine understand the
  /// contents of the column.
  final String? description;

  /// Specifies whether to include or exclude the column during query generation.
  /// If you specify <code>EXCLUDE</code>, the column will be ignored. If you
  /// specify <code>INCLUDE</code>, all other columns in the table will be
  /// ignored.
  final IncludeExclude? inclusion;

  /// The name of the column for which the other fields in this object apply.
  final String? name;

  QueryGenerationColumn({
    this.description,
    this.inclusion,
    this.name,
  });

  factory QueryGenerationColumn.fromJson(Map<String, dynamic> json) {
    return QueryGenerationColumn(
      description: json['description'] as String?,
      inclusion: (json['inclusion'] as String?)?.let(IncludeExclude.fromString),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final inclusion = this.inclusion;
    final name = this.name;
    return {
      if (description != null) 'description': description,
      if (inclusion != null) 'inclusion': inclusion.value,
      if (name != null) 'name': name,
    };
  }
}

class RedshiftQueryEngineType {
  static const serverless = RedshiftQueryEngineType._('SERVERLESS');
  static const provisioned = RedshiftQueryEngineType._('PROVISIONED');

  final String value;

  const RedshiftQueryEngineType._(this.value);

  static const values = [serverless, provisioned];

  static RedshiftQueryEngineType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RedshiftQueryEngineType._(value));

  @override
  bool operator ==(other) =>
      other is RedshiftQueryEngineType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains configurations for authentication to Amazon Redshift Serverless.
class RedshiftServerlessConfiguration {
  /// Specifies configurations for authentication to an Amazon Redshift
  /// provisioned data warehouse.
  final RedshiftServerlessAuthConfiguration authConfiguration;

  /// The ARN of the Amazon Redshift workgroup.
  final String workgroupArn;

  RedshiftServerlessConfiguration({
    required this.authConfiguration,
    required this.workgroupArn,
  });

  factory RedshiftServerlessConfiguration.fromJson(Map<String, dynamic> json) {
    return RedshiftServerlessConfiguration(
      authConfiguration: RedshiftServerlessAuthConfiguration.fromJson(
          (json['authConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      workgroupArn: (json['workgroupArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final authConfiguration = this.authConfiguration;
    final workgroupArn = this.workgroupArn;
    return {
      'authConfiguration': authConfiguration,
      'workgroupArn': workgroupArn,
    };
  }
}

/// Contains configurations for a provisioned Amazon Redshift query engine.
class RedshiftProvisionedConfiguration {
  /// Specifies configurations for authentication to Amazon Redshift.
  final RedshiftProvisionedAuthConfiguration authConfiguration;

  /// The ID of the Amazon Redshift cluster.
  final String clusterIdentifier;

  RedshiftProvisionedConfiguration({
    required this.authConfiguration,
    required this.clusterIdentifier,
  });

  factory RedshiftProvisionedConfiguration.fromJson(Map<String, dynamic> json) {
    return RedshiftProvisionedConfiguration(
      authConfiguration: RedshiftProvisionedAuthConfiguration.fromJson(
          (json['authConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      clusterIdentifier: (json['clusterIdentifier'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final authConfiguration = this.authConfiguration;
    final clusterIdentifier = this.clusterIdentifier;
    return {
      'authConfiguration': authConfiguration,
      'clusterIdentifier': clusterIdentifier,
    };
  }
}

/// Contains configurations for authentication to an Amazon Redshift provisioned
/// data warehouse. Specify the type of authentication to use in the
/// <code>type</code> field and include the corresponding field. If you specify
/// IAM authentication, you don't need to include another field.
class RedshiftProvisionedAuthConfiguration {
  /// The type of authentication to use.
  final RedshiftProvisionedAuthType type;

  /// The database username for authentication to an Amazon Redshift provisioned
  /// data warehouse.
  final String? databaseUser;

  /// The ARN of an Secrets Manager secret for authentication.
  final String? usernamePasswordSecretArn;

  RedshiftProvisionedAuthConfiguration({
    required this.type,
    this.databaseUser,
    this.usernamePasswordSecretArn,
  });

  factory RedshiftProvisionedAuthConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RedshiftProvisionedAuthConfiguration(
      type: RedshiftProvisionedAuthType.fromString(
          (json['type'] as String?) ?? ''),
      databaseUser: json['databaseUser'] as String?,
      usernamePasswordSecretArn: json['usernamePasswordSecretArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final databaseUser = this.databaseUser;
    final usernamePasswordSecretArn = this.usernamePasswordSecretArn;
    return {
      'type': type.value,
      if (databaseUser != null) 'databaseUser': databaseUser,
      if (usernamePasswordSecretArn != null)
        'usernamePasswordSecretArn': usernamePasswordSecretArn,
    };
  }
}

class RedshiftProvisionedAuthType {
  static const iam = RedshiftProvisionedAuthType._('IAM');
  static const usernamePassword =
      RedshiftProvisionedAuthType._('USERNAME_PASSWORD');
  static const username = RedshiftProvisionedAuthType._('USERNAME');

  final String value;

  const RedshiftProvisionedAuthType._(this.value);

  static const values = [iam, usernamePassword, username];

  static RedshiftProvisionedAuthType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RedshiftProvisionedAuthType._(value));

  @override
  bool operator ==(other) =>
      other is RedshiftProvisionedAuthType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies configurations for authentication to a Redshift Serverless.
/// Specify the type of authentication to use in the <code>type</code> field and
/// include the corresponding field. If you specify IAM authentication, you
/// don't need to include another field.
class RedshiftServerlessAuthConfiguration {
  /// The type of authentication to use.
  final RedshiftServerlessAuthType type;

  /// The ARN of an Secrets Manager secret for authentication.
  final String? usernamePasswordSecretArn;

  RedshiftServerlessAuthConfiguration({
    required this.type,
    this.usernamePasswordSecretArn,
  });

  factory RedshiftServerlessAuthConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RedshiftServerlessAuthConfiguration(
      type: RedshiftServerlessAuthType.fromString(
          (json['type'] as String?) ?? ''),
      usernamePasswordSecretArn: json['usernamePasswordSecretArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final usernamePasswordSecretArn = this.usernamePasswordSecretArn;
    return {
      'type': type.value,
      if (usernamePasswordSecretArn != null)
        'usernamePasswordSecretArn': usernamePasswordSecretArn,
    };
  }
}

class RedshiftServerlessAuthType {
  static const iam = RedshiftServerlessAuthType._('IAM');
  static const usernamePassword =
      RedshiftServerlessAuthType._('USERNAME_PASSWORD');

  final String value;

  const RedshiftServerlessAuthType._(this.value);

  static const values = [iam, usernamePassword];

  static RedshiftServerlessAuthType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RedshiftServerlessAuthType._(value));

  @override
  bool operator ==(other) =>
      other is RedshiftServerlessAuthType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains configurations for Amazon Redshift data storage. Specify the data
/// storage service to use in the <code>type</code> field and include the
/// corresponding field. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-build-structured.html">Build
/// a knowledge base by connecting to a structured data source</a> in the Amazon
/// Bedrock User Guide.
class RedshiftQueryEngineStorageConfiguration {
  /// The data storage service to use.
  final RedshiftQueryEngineStorageType type;

  /// Specifies configurations for storage in Glue Data Catalog.
  final RedshiftQueryEngineAwsDataCatalogStorageConfiguration?
      awsDataCatalogConfiguration;

  /// Specifies configurations for storage in Amazon Redshift.
  final RedshiftQueryEngineRedshiftStorageConfiguration? redshiftConfiguration;

  RedshiftQueryEngineStorageConfiguration({
    required this.type,
    this.awsDataCatalogConfiguration,
    this.redshiftConfiguration,
  });

  factory RedshiftQueryEngineStorageConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RedshiftQueryEngineStorageConfiguration(
      type: RedshiftQueryEngineStorageType.fromString(
          (json['type'] as String?) ?? ''),
      awsDataCatalogConfiguration: json['awsDataCatalogConfiguration'] != null
          ? RedshiftQueryEngineAwsDataCatalogStorageConfiguration.fromJson(
              json['awsDataCatalogConfiguration'] as Map<String, dynamic>)
          : null,
      redshiftConfiguration: json['redshiftConfiguration'] != null
          ? RedshiftQueryEngineRedshiftStorageConfiguration.fromJson(
              json['redshiftConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final awsDataCatalogConfiguration = this.awsDataCatalogConfiguration;
    final redshiftConfiguration = this.redshiftConfiguration;
    return {
      'type': type.value,
      if (awsDataCatalogConfiguration != null)
        'awsDataCatalogConfiguration': awsDataCatalogConfiguration,
      if (redshiftConfiguration != null)
        'redshiftConfiguration': redshiftConfiguration,
    };
  }
}

class RedshiftQueryEngineStorageType {
  static const redshift = RedshiftQueryEngineStorageType._('REDSHIFT');
  static const awsDataCatalog =
      RedshiftQueryEngineStorageType._('AWS_DATA_CATALOG');

  final String value;

  const RedshiftQueryEngineStorageType._(this.value);

  static const values = [redshift, awsDataCatalog];

  static RedshiftQueryEngineStorageType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RedshiftQueryEngineStorageType._(value));

  @override
  bool operator ==(other) =>
      other is RedshiftQueryEngineStorageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains configurations for storage in Glue Data Catalog.
class RedshiftQueryEngineAwsDataCatalogStorageConfiguration {
  /// A list of names of the tables to use.
  final List<String> tableNames;

  RedshiftQueryEngineAwsDataCatalogStorageConfiguration({
    required this.tableNames,
  });

  factory RedshiftQueryEngineAwsDataCatalogStorageConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RedshiftQueryEngineAwsDataCatalogStorageConfiguration(
      tableNames: ((json['tableNames'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tableNames = this.tableNames;
    return {
      'tableNames': tableNames,
    };
  }
}

/// Contains configurations for storage in Amazon Redshift.
class RedshiftQueryEngineRedshiftStorageConfiguration {
  /// The name of the Amazon Redshift database.
  final String databaseName;

  RedshiftQueryEngineRedshiftStorageConfiguration({
    required this.databaseName,
  });

  factory RedshiftQueryEngineRedshiftStorageConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RedshiftQueryEngineRedshiftStorageConfiguration(
      databaseName: (json['databaseName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    return {
      'databaseName': databaseName,
    };
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

/// Specifies configurations for the storage location of the images extracted
/// from multimodal documents in your data source. These images can be retrieved
/// and returned to the end user.
class SupplementalDataStorageConfiguration {
  /// A list of objects specifying storage locations for images extracted from
  /// multimodal documents in your data source.
  final List<SupplementalDataStorageLocation> storageLocations;

  SupplementalDataStorageConfiguration({
    required this.storageLocations,
  });

  factory SupplementalDataStorageConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SupplementalDataStorageConfiguration(
      storageLocations: ((json['storageLocations'] as List?) ?? const [])
          .nonNulls
          .map((e) => SupplementalDataStorageLocation.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final storageLocations = this.storageLocations;
    return {
      'storageLocations': storageLocations,
    };
  }
}

/// Contains information about a storage location for images extracted from
/// multimodal documents in your data source.
class SupplementalDataStorageLocation {
  /// Specifies the storage service used for this location.
  final SupplementalDataStorageLocationType type;

  /// Contains information about the Amazon S3 location for the extracted images.
  final S3Location? s3Location;

  SupplementalDataStorageLocation({
    required this.type,
    this.s3Location,
  });

  factory SupplementalDataStorageLocation.fromJson(Map<String, dynamic> json) {
    return SupplementalDataStorageLocation(
      type: SupplementalDataStorageLocationType.fromString(
          (json['type'] as String?) ?? ''),
      s3Location: json['s3Location'] != null
          ? S3Location.fromJson(json['s3Location'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final s3Location = this.s3Location;
    return {
      'type': type.value,
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

class SupplementalDataStorageLocationType {
  static const s3 = SupplementalDataStorageLocationType._('S3');

  final String value;

  const SupplementalDataStorageLocationType._(this.value);

  static const values = [s3];

  static SupplementalDataStorageLocationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SupplementalDataStorageLocationType._(value));

  @override
  bool operator ==(other) =>
      other is SupplementalDataStorageLocationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      uri: (json['uri'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    return {
      'uri': uri,
    };
  }
}

/// The vector configuration details for the Bedrock embeddings model.
class BedrockEmbeddingModelConfiguration {
  /// Configuration settings for processing audio content in multimodal knowledge
  /// bases.
  final List<AudioConfiguration>? audio;

  /// The dimensions details for the vector configuration used on the Bedrock
  /// embeddings model.
  final int? dimensions;

  /// The data type for the vectors when using a model to convert text into vector
  /// embeddings. The model must support the specified data type for vector
  /// embeddings. Floating-point (float32) is the default data type, and is
  /// supported by most models for vector embeddings. See <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-supported.html">Supported
  /// embeddings models</a> for information on the available models and their
  /// vector data types.
  final EmbeddingDataType? embeddingDataType;

  /// Configuration settings for processing video content in multimodal knowledge
  /// bases.
  final List<VideoConfiguration>? video;

  BedrockEmbeddingModelConfiguration({
    this.audio,
    this.dimensions,
    this.embeddingDataType,
    this.video,
  });

  factory BedrockEmbeddingModelConfiguration.fromJson(
      Map<String, dynamic> json) {
    return BedrockEmbeddingModelConfiguration(
      audio: (json['audio'] as List?)
          ?.nonNulls
          .map((e) => AudioConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      dimensions: json['dimensions'] as int?,
      embeddingDataType: (json['embeddingDataType'] as String?)
          ?.let(EmbeddingDataType.fromString),
      video: (json['video'] as List?)
          ?.nonNulls
          .map((e) => VideoConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final audio = this.audio;
    final dimensions = this.dimensions;
    final embeddingDataType = this.embeddingDataType;
    final video = this.video;
    return {
      if (audio != null) 'audio': audio,
      if (dimensions != null) 'dimensions': dimensions,
      if (embeddingDataType != null)
        'embeddingDataType': embeddingDataType.value,
      if (video != null) 'video': video,
    };
  }
}

/// Bedrock models embedding data type. Can be either float32 or binary.
class EmbeddingDataType {
  static const float32 = EmbeddingDataType._('FLOAT32');
  static const binary = EmbeddingDataType._('BINARY');

  final String value;

  const EmbeddingDataType._(this.value);

  static const values = [float32, binary];

  static EmbeddingDataType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EmbeddingDataType._(value));

  @override
  bool operator ==(other) => other is EmbeddingDataType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration settings for processing video content in multimodal knowledge
/// bases.
class VideoConfiguration {
  /// Configuration for segmenting video content during processing.
  final VideoSegmentationConfiguration segmentationConfiguration;

  VideoConfiguration({
    required this.segmentationConfiguration,
  });

  factory VideoConfiguration.fromJson(Map<String, dynamic> json) {
    return VideoConfiguration(
      segmentationConfiguration: VideoSegmentationConfiguration.fromJson(
          (json['segmentationConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final segmentationConfiguration = this.segmentationConfiguration;
    return {
      'segmentationConfiguration': segmentationConfiguration,
    };
  }
}

/// Configuration for segmenting video content during multimodal knowledge base
/// ingestion. Determines how video files are divided into chunks for
/// processing.
class VideoSegmentationConfiguration {
  /// The duration in seconds for each video segment. Video files will be divided
  /// into chunks of this length for processing.
  final int fixedLengthDuration;

  VideoSegmentationConfiguration({
    required this.fixedLengthDuration,
  });

  factory VideoSegmentationConfiguration.fromJson(Map<String, dynamic> json) {
    return VideoSegmentationConfiguration(
      fixedLengthDuration: (json['fixedLengthDuration'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final fixedLengthDuration = this.fixedLengthDuration;
    return {
      'fixedLengthDuration': fixedLengthDuration,
    };
  }
}

/// Configuration settings for processing audio content in multimodal knowledge
/// bases.
class AudioConfiguration {
  /// Configuration for segmenting audio content during processing.
  final AudioSegmentationConfiguration segmentationConfiguration;

  AudioConfiguration({
    required this.segmentationConfiguration,
  });

  factory AudioConfiguration.fromJson(Map<String, dynamic> json) {
    return AudioConfiguration(
      segmentationConfiguration: AudioSegmentationConfiguration.fromJson(
          (json['segmentationConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final segmentationConfiguration = this.segmentationConfiguration;
    return {
      'segmentationConfiguration': segmentationConfiguration,
    };
  }
}

/// Configuration for segmenting audio content during multimodal knowledge base
/// ingestion. Determines how audio files are divided into chunks for
/// processing.
class AudioSegmentationConfiguration {
  /// The duration in seconds for each audio segment. Audio files will be divided
  /// into chunks of this length for processing.
  final int fixedLengthDuration;

  AudioSegmentationConfiguration({
    required this.fixedLengthDuration,
  });

  factory AudioSegmentationConfiguration.fromJson(Map<String, dynamic> json) {
    return AudioSegmentationConfiguration(
      fixedLengthDuration: (json['fixedLengthDuration'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final fixedLengthDuration = this.fixedLengthDuration;
    return {
      'fixedLengthDuration': fixedLengthDuration,
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
      agentId: (json['agentId'] as String?) ?? '',
      agentVersion: (json['agentVersion'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      description: (json['description'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      knowledgeBaseState: KnowledgeBaseState.fromString(
          (json['knowledgeBaseState'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
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

class KnowledgeBaseState {
  static const enabled = KnowledgeBaseState._('ENABLED');
  static const disabled = KnowledgeBaseState._('DISABLED');

  final String value;

  const KnowledgeBaseState._(this.value);

  static const values = [enabled, disabled];

  static KnowledgeBaseState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KnowledgeBaseState._(value));

  @override
  bool operator ==(other) =>
      other is KnowledgeBaseState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about a knowledge base.
class KnowledgeBaseSummary {
  /// The unique identifier of the knowledge base.
  final String knowledgeBaseId;

  /// The name of the knowledge base.
  final String name;

  /// The status of the knowledge base.
  final KnowledgeBaseStatus status;

  /// The time the knowledge base was last updated.
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
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: KnowledgeBaseStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
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
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      knowledgeBaseState: KnowledgeBaseState.fromString(
          (json['knowledgeBaseState'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
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

/// Contains the details for a document that was ingested or deleted.
class KnowledgeBaseDocumentDetail {
  /// The identifier of the data source connected to the knowledge base that the
  /// document was ingested into or deleted from.
  final String dataSourceId;

  /// Contains information that identifies the document.
  final DocumentIdentifier identifier;

  /// The identifier of the knowledge base that the document was ingested into or
  /// deleted from.
  final String knowledgeBaseId;

  /// The ingestion status of the document. The following statuses are possible:
  ///
  /// <ul>
  /// <li>
  /// STARTING – You submitted the ingestion job containing the document.
  /// </li>
  /// <li>
  /// PENDING – The document is waiting to be ingested.
  /// </li>
  /// <li>
  /// IN_PROGRESS – The document is being ingested.
  /// </li>
  /// <li>
  /// INDEXED – The document was successfully indexed.
  /// </li>
  /// <li>
  /// PARTIALLY_INDEXED – The document was partially indexed.
  /// </li>
  /// <li>
  /// METADATA_PARTIALLY_INDEXED – You submitted metadata for an existing document
  /// and it was partially indexed.
  /// </li>
  /// <li>
  /// METADATA_UPDATE_FAILED – You submitted a metadata update for an existing
  /// document but it failed.
  /// </li>
  /// <li>
  /// FAILED – The document failed to be ingested.
  /// </li>
  /// <li>
  /// NOT_FOUND – The document wasn't found.
  /// </li>
  /// <li>
  /// IGNORED – The document was ignored during ingestion.
  /// </li>
  /// <li>
  /// DELETING – You submitted the delete job containing the document.
  /// </li>
  /// <li>
  /// DELETE_IN_PROGRESS – The document is being deleted.
  /// </li>
  /// </ul>
  final DocumentStatus status;

  /// The reason for the status. Appears alongside the status
  /// <code>IGNORED</code>.
  final String? statusReason;

  /// The date and time at which the document was last updated.
  final DateTime? updatedAt;

  KnowledgeBaseDocumentDetail({
    required this.dataSourceId,
    required this.identifier,
    required this.knowledgeBaseId,
    required this.status,
    this.statusReason,
    this.updatedAt,
  });

  factory KnowledgeBaseDocumentDetail.fromJson(Map<String, dynamic> json) {
    return KnowledgeBaseDocumentDetail(
      dataSourceId: (json['dataSourceId'] as String?) ?? '',
      identifier: DocumentIdentifier.fromJson(
          (json['identifier'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      status: DocumentStatus.fromString((json['status'] as String?) ?? ''),
      statusReason: json['statusReason'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceId = this.dataSourceId;
    final identifier = this.identifier;
    final knowledgeBaseId = this.knowledgeBaseId;
    final status = this.status;
    final statusReason = this.statusReason;
    final updatedAt = this.updatedAt;
    return {
      'dataSourceId': dataSourceId,
      'identifier': identifier,
      'knowledgeBaseId': knowledgeBaseId,
      'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class DocumentStatus {
  static const indexed = DocumentStatus._('INDEXED');
  static const partiallyIndexed = DocumentStatus._('PARTIALLY_INDEXED');
  static const pending = DocumentStatus._('PENDING');
  static const failed = DocumentStatus._('FAILED');
  static const metadataPartiallyIndexed =
      DocumentStatus._('METADATA_PARTIALLY_INDEXED');
  static const metadataUpdateFailed =
      DocumentStatus._('METADATA_UPDATE_FAILED');
  static const ignored = DocumentStatus._('IGNORED');
  static const notFound = DocumentStatus._('NOT_FOUND');
  static const starting = DocumentStatus._('STARTING');
  static const inProgress = DocumentStatus._('IN_PROGRESS');
  static const deleting = DocumentStatus._('DELETING');
  static const deleteInProgress = DocumentStatus._('DELETE_IN_PROGRESS');

  final String value;

  const DocumentStatus._(this.value);

  static const values = [
    indexed,
    partiallyIndexed,
    pending,
    failed,
    metadataPartiallyIndexed,
    metadataUpdateFailed,
    ignored,
    notFound,
    starting,
    inProgress,
    deleting,
    deleteInProgress
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

/// Contains information that identifies the document.
class DocumentIdentifier {
  /// The type of data source connected to the knowledge base that contains the
  /// document.
  final ContentDataSourceType dataSourceType;

  /// Contains information that identifies the document in a custom data source.
  final CustomDocumentIdentifier? custom;

  /// Contains information that identifies the document in an S3 data source.
  final S3Location? s3;

  DocumentIdentifier({
    required this.dataSourceType,
    this.custom,
    this.s3,
  });

  factory DocumentIdentifier.fromJson(Map<String, dynamic> json) {
    return DocumentIdentifier(
      dataSourceType: ContentDataSourceType.fromString(
          (json['dataSourceType'] as String?) ?? ''),
      custom: json['custom'] != null
          ? CustomDocumentIdentifier.fromJson(
              json['custom'] as Map<String, dynamic>)
          : null,
      s3: json['s3'] != null
          ? S3Location.fromJson(json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceType = this.dataSourceType;
    final custom = this.custom;
    final s3 = this.s3;
    return {
      'dataSourceType': dataSourceType.value,
      if (custom != null) 'custom': custom,
      if (s3 != null) 's3': s3,
    };
  }
}

class ContentDataSourceType {
  static const custom = ContentDataSourceType._('CUSTOM');
  static const s3 = ContentDataSourceType._('S3');

  final String value;

  const ContentDataSourceType._(this.value);

  static const values = [custom, s3];

  static ContentDataSourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ContentDataSourceType._(value));

  @override
  bool operator ==(other) =>
      other is ContentDataSourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about the identifier of the document to ingest into a
/// custom data source.
class CustomDocumentIdentifier {
  /// The identifier of the document to ingest into a custom data source.
  final String id;

  CustomDocumentIdentifier({
    required this.id,
  });

  factory CustomDocumentIdentifier.fromJson(Map<String, dynamic> json) {
    return CustomDocumentIdentifier(
      id: (json['id'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
    };
  }
}

/// Contains information about a document to ingest into a knowledge base and
/// metadata to associate with it.
class KnowledgeBaseDocument {
  /// Contains the content of the document.
  final DocumentContent content;

  /// Contains the metadata to associate with the document.
  final DocumentMetadata? metadata;

  KnowledgeBaseDocument({
    required this.content,
    this.metadata,
  });

  Map<String, dynamic> toJson() {
    final content = this.content;
    final metadata = this.metadata;
    return {
      'content': content,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

/// Contains information about the metadata associate with the content to ingest
/// into a knowledge base. Choose a <code>type</code> and include the field that
/// corresponds to it.
class DocumentMetadata {
  /// The type of the source source from which to add metadata.
  final MetadataSourceType type;

  /// An array of objects, each of which defines a metadata attribute to associate
  /// with the content to ingest. You define the attributes inline.
  final List<MetadataAttribute>? inlineAttributes;

  /// The Amazon S3 location of the file containing metadata to associate with the
  /// content to ingest.
  final CustomS3Location? s3Location;

  DocumentMetadata({
    required this.type,
    this.inlineAttributes,
    this.s3Location,
  });

  Map<String, dynamic> toJson() {
    final type = this.type;
    final inlineAttributes = this.inlineAttributes;
    final s3Location = this.s3Location;
    return {
      'type': type.value,
      if (inlineAttributes != null) 'inlineAttributes': inlineAttributes,
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

/// Contains information about the content of a document. Choose a
/// <code>dataSourceType</code> and include the field that corresponds to it.
class DocumentContent {
  /// The type of data source that is connected to the knowledge base to which to
  /// ingest this document.
  final ContentDataSourceType dataSourceType;

  /// Contains information about the content to ingest into a knowledge base
  /// connected to a custom data source.
  final CustomContent? custom;

  /// Contains information about the content to ingest into a knowledge base
  /// connected to an Amazon S3 data source
  final S3Content? s3;

  DocumentContent({
    required this.dataSourceType,
    this.custom,
    this.s3,
  });

  Map<String, dynamic> toJson() {
    final dataSourceType = this.dataSourceType;
    final custom = this.custom;
    final s3 = this.s3;
    return {
      'dataSourceType': dataSourceType.value,
      if (custom != null) 'custom': custom,
      if (s3 != null) 's3': s3,
    };
  }
}

/// Contains information about the content to ingest into a knowledge base
/// connected to a custom data source. Choose a <code>sourceType</code> and
/// include the field that corresponds to it.
class CustomContent {
  /// A unique identifier for the document.
  final CustomDocumentIdentifier customDocumentIdentifier;

  /// The source of the data to ingest.
  final CustomSourceType sourceType;

  /// Contains information about content defined inline to ingest into a knowledge
  /// base.
  final InlineContent? inlineContent;

  /// Contains information about the Amazon S3 location of the file from which to
  /// ingest data.
  final CustomS3Location? s3Location;

  CustomContent({
    required this.customDocumentIdentifier,
    required this.sourceType,
    this.inlineContent,
    this.s3Location,
  });

  Map<String, dynamic> toJson() {
    final customDocumentIdentifier = this.customDocumentIdentifier;
    final sourceType = this.sourceType;
    final inlineContent = this.inlineContent;
    final s3Location = this.s3Location;
    return {
      'customDocumentIdentifier': customDocumentIdentifier,
      'sourceType': sourceType.value,
      if (inlineContent != null) 'inlineContent': inlineContent,
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

/// Contains information about the content to ingest into a knowledge base
/// connected to an Amazon S3 data source.
class S3Content {
  /// The S3 location of the file containing the content to ingest.
  final S3Location s3Location;

  S3Content({
    required this.s3Location,
  });

  Map<String, dynamic> toJson() {
    final s3Location = this.s3Location;
    return {
      's3Location': s3Location,
    };
  }
}

class CustomSourceType {
  static const inLine = CustomSourceType._('IN_LINE');
  static const s3Location = CustomSourceType._('S3_LOCATION');

  final String value;

  const CustomSourceType._(this.value);

  static const values = [inLine, s3Location];

  static CustomSourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CustomSourceType._(value));

  @override
  bool operator ==(other) => other is CustomSourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about the Amazon S3 location of the file containing the
/// content to ingest into a knowledge base connected to a custom data source.
class CustomS3Location {
  /// The S3 URI of the file containing the content to ingest.
  final String uri;

  /// The identifier of the Amazon Web Services account that owns the S3 bucket
  /// containing the content to ingest.
  final String? bucketOwnerAccountId;

  CustomS3Location({
    required this.uri,
    this.bucketOwnerAccountId,
  });

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    final bucketOwnerAccountId = this.bucketOwnerAccountId;
    return {
      'uri': uri,
      if (bucketOwnerAccountId != null)
        'bucketOwnerAccountId': bucketOwnerAccountId,
    };
  }
}

/// Contains information about content defined inline to ingest into a data
/// source. Choose a <code>type</code> and include the field that corresponds to
/// it.
class InlineContent {
  /// The type of inline content to define.
  final InlineContentType type;

  /// Contains information about content defined inline in bytes.
  final ByteContentDoc? byteContent;

  /// Contains information about content defined inline in text.
  final TextContentDoc? textContent;

  InlineContent({
    required this.type,
    this.byteContent,
    this.textContent,
  });

  Map<String, dynamic> toJson() {
    final type = this.type;
    final byteContent = this.byteContent;
    final textContent = this.textContent;
    return {
      'type': type.value,
      if (byteContent != null) 'byteContent': byteContent,
      if (textContent != null) 'textContent': textContent,
    };
  }
}

class InlineContentType {
  static const byte = InlineContentType._('BYTE');
  static const text = InlineContentType._('TEXT');

  final String value;

  const InlineContentType._(this.value);

  static const values = [byte, text];

  static InlineContentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InlineContentType._(value));

  @override
  bool operator ==(other) => other is InlineContentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about content defined inline in bytes.
class ByteContentDoc {
  /// The base64-encoded string of the content.
  final Uint8List data;

  /// The MIME type of the content. For a list of MIME types, see <a
  /// href="https://www.iana.org/assignments/media-types/media-types.xhtml">Media
  /// Types</a>. The following MIME types are supported:
  ///
  /// <ul>
  /// <li>
  /// text/plain
  /// </li>
  /// <li>
  /// text/html
  /// </li>
  /// <li>
  /// text/csv
  /// </li>
  /// <li>
  /// text/vtt
  /// </li>
  /// <li>
  /// message/rfc822
  /// </li>
  /// <li>
  /// application/xhtml+xml
  /// </li>
  /// <li>
  /// application/pdf
  /// </li>
  /// <li>
  /// application/msword
  /// </li>
  /// <li>
  /// application/vnd.ms-word.document.macroenabled.12
  /// </li>
  /// <li>
  /// application/vnd.ms-word.template.macroenabled.12
  /// </li>
  /// <li>
  /// application/vnd.ms-excel
  /// </li>
  /// <li>
  /// application/vnd.ms-excel.addin.macroenabled.12
  /// </li>
  /// <li>
  /// application/vnd.ms-excel.sheet.macroenabled.12
  /// </li>
  /// <li>
  /// application/vnd.ms-excel.template.macroenabled.12
  /// </li>
  /// <li>
  /// application/vnd.ms-excel.sheet.binary.macroenabled.12
  /// </li>
  /// <li>
  /// application/vnd.ms-spreadsheetml
  /// </li>
  /// <li>
  /// application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
  /// </li>
  /// <li>
  /// application/vnd.openxmlformats-officedocument.spreadsheetml.template
  /// </li>
  /// <li>
  /// application/vnd.openxmlformats-officedocument.wordprocessingml.document
  /// </li>
  /// <li>
  /// application/vnd.openxmlformats-officedocument.wordprocessingml.template
  /// </li>
  /// </ul>
  final String mimeType;

  ByteContentDoc({
    required this.data,
    required this.mimeType,
  });

  Map<String, dynamic> toJson() {
    final data = this.data;
    final mimeType = this.mimeType;
    return {
      'data': base64Encode(data),
      'mimeType': mimeType,
    };
  }
}

/// Contains information about content defined inline in text.
class TextContentDoc {
  /// The text of the content.
  final String data;

  TextContentDoc({
    required this.data,
  });

  Map<String, dynamic> toJson() {
    final data = this.data;
    return {
      'data': data,
    };
  }
}

class MetadataSourceType {
  static const inLineAttribute = MetadataSourceType._('IN_LINE_ATTRIBUTE');
  static const s3Location = MetadataSourceType._('S3_LOCATION');

  final String value;

  const MetadataSourceType._(this.value);

  static const values = [inLineAttribute, s3Location];

  static MetadataSourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MetadataSourceType._(value));

  @override
  bool operator ==(other) =>
      other is MetadataSourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about a metadata attribute.
class MetadataAttribute {
  /// The key of the metadata attribute.
  final String key;

  /// Contains the value of the metadata attribute.
  final MetadataAttributeValue value;

  MetadataAttribute({
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

/// Contains the value of the metadata attribute. Choose a <code>type</code> and
/// include the field that corresponds to it.
class MetadataAttributeValue {
  /// The type of the metadata attribute.
  final MetadataValueType type;

  /// The value of the Boolean metadata attribute.
  final bool? booleanValue;

  /// The value of the numeric metadata attribute.
  final double? numberValue;

  /// An array of strings that define the value of the metadata attribute.
  final List<String>? stringListValue;

  /// The value of the string metadata attribute.
  final String? stringValue;

  MetadataAttributeValue({
    required this.type,
    this.booleanValue,
    this.numberValue,
    this.stringListValue,
    this.stringValue,
  });

  Map<String, dynamic> toJson() {
    final type = this.type;
    final booleanValue = this.booleanValue;
    final numberValue = this.numberValue;
    final stringListValue = this.stringListValue;
    final stringValue = this.stringValue;
    return {
      'type': type.value,
      if (booleanValue != null) 'booleanValue': booleanValue,
      if (numberValue != null) 'numberValue': numberValue,
      if (stringListValue != null) 'stringListValue': stringListValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

class MetadataValueType {
  static const boolean = MetadataValueType._('BOOLEAN');
  static const number = MetadataValueType._('NUMBER');
  static const string = MetadataValueType._('STRING');
  static const stringList = MetadataValueType._('STRING_LIST');

  final String value;

  const MetadataValueType._(this.value);

  static const values = [boolean, number, string, stringList];

  static MetadataValueType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MetadataValueType._(value));

  @override
  bool operator ==(other) => other is MetadataValueType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about a data ingestion job. Data sources are ingested into
/// a knowledge base so that Large Language Models (LLMs) can use your data.
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
  /// The unique identifier of the data source for the data ingestion job.
  final String dataSourceId;

  /// The unique identifier of the data ingestion job.
  final String ingestionJobId;

  /// The unique identifier of the knowledge for the data ingestion job.
  final String knowledgeBaseId;

  /// The time the data ingestion job started.
  ///
  /// If you stop a data ingestion job, the <code>startedAt</code> time is the
  /// time the job was started before the job was stopped.
  final DateTime startedAt;

  /// The status of the data ingestion job.
  final IngestionJobStatus status;

  /// The time the data ingestion job was last updated.
  ///
  /// If you stop a data ingestion job, the <code>updatedAt</code> time is the
  /// time the job was stopped.
  final DateTime updatedAt;

  /// The description of the data ingestion job.
  final String? description;

  /// A list of reasons that the data ingestion job failed.
  final List<String>? failureReasons;

  /// Contains statistics about the data ingestion job.
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
      dataSourceId: (json['dataSourceId'] as String?) ?? '',
      ingestionJobId: (json['ingestionJobId'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] ?? 0),
      status: IngestionJobStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
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

class IngestionJobStatus {
  static const starting = IngestionJobStatus._('STARTING');
  static const inProgress = IngestionJobStatus._('IN_PROGRESS');
  static const complete = IngestionJobStatus._('COMPLETE');
  static const failed = IngestionJobStatus._('FAILED');
  static const stopping = IngestionJobStatus._('STOPPING');
  static const stopped = IngestionJobStatus._('STOPPED');

  final String value;

  const IngestionJobStatus._(this.value);

  static const values = [
    starting,
    inProgress,
    complete,
    failed,
    stopping,
    stopped
  ];

  static IngestionJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IngestionJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is IngestionJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the statistics for the data ingestion job.
class IngestionJobStatistics {
  /// The number of source documents that were deleted.
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

/// Contains details about a data ingestion job.
class IngestionJobSummary {
  /// The unique identifier of the data source for the data ingestion job.
  final String dataSourceId;

  /// The unique identifier of the data ingestion job.
  final String ingestionJobId;

  /// The unique identifier of the knowledge base for the data ingestion job.
  final String knowledgeBaseId;

  /// The time the data ingestion job started.
  final DateTime startedAt;

  /// The status of the data ingestion job.
  final IngestionJobStatus status;

  /// The time the data ingestion job was last updated.
  final DateTime updatedAt;

  /// The description of the data ingestion job.
  final String? description;

  /// Contains statistics for the data ingestion job.
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
      dataSourceId: (json['dataSourceId'] as String?) ?? '',
      ingestionJobId: (json['ingestionJobId'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] ?? 0),
      status: IngestionJobStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
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

/// The parameters of sorting the data.
class IngestionJobSortBy {
  /// The name of field or attribute to apply sorting of data.
  final IngestionJobSortByAttribute attribute;

  /// The order for sorting the data.
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

class IngestionJobSortByAttribute {
  static const status = IngestionJobSortByAttribute._('STATUS');
  static const startedAt = IngestionJobSortByAttribute._('STARTED_AT');

  final String value;

  const IngestionJobSortByAttribute._(this.value);

  static const values = [status, startedAt];

  static IngestionJobSortByAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IngestionJobSortByAttribute._(value));

  @override
  bool operator ==(other) =>
      other is IngestionJobSortByAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SortOrder {
  static const ascending = SortOrder._('ASCENDING');
  static const descending = SortOrder._('DESCENDING');

  final String value;

  const SortOrder._(this.value);

  static const values = [ascending, descending];

  static SortOrder fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SortOrder._(value));

  @override
  bool operator ==(other) => other is SortOrder && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The definition of a filter to filter the data.
class IngestionJobFilter {
  /// The name of field or attribute to apply the filter.
  final IngestionJobFilterAttribute attribute;

  /// The operation to apply to the field or attribute.
  final IngestionJobFilterOperator operator;

  /// A list of values that belong to the field or attribute.
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

class IngestionJobFilterAttribute {
  static const status = IngestionJobFilterAttribute._('STATUS');

  final String value;

  const IngestionJobFilterAttribute._(this.value);

  static const values = [status];

  static IngestionJobFilterAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IngestionJobFilterAttribute._(value));

  @override
  bool operator ==(other) =>
      other is IngestionJobFilterAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class IngestionJobFilterOperator {
  static const eq = IngestionJobFilterOperator._('EQ');

  final String value;

  const IngestionJobFilterOperator._(this.value);

  static const values = [eq];

  static IngestionJobFilterOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IngestionJobFilterOperator._(value));

  @override
  bool operator ==(other) =>
      other is IngestionJobFilterOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      status: FlowStatus.fromString((json['status'] as String?) ?? ''),
      version: (json['version'] as String?) ?? '',
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

class FlowStatus {
  static const failed = FlowStatus._('Failed');
  static const prepared = FlowStatus._('Prepared');
  static const preparing = FlowStatus._('Preparing');
  static const notPrepared = FlowStatus._('NotPrepared');

  final String value;

  const FlowStatus._(this.value);

  static const values = [failed, prepared, preparing, notPrepared];

  static FlowStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FlowStatus._(value));

  @override
  bool operator ==(other) => other is FlowStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      name: (json['name'] as String?) ?? '',
      source: (json['source'] as String?) ?? '',
      target: (json['target'] as String?) ?? '',
      type: FlowConnectionType.fromString((json['type'] as String?) ?? ''),
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

class FlowConnectionType {
  static const data = FlowConnectionType._('Data');
  static const conditional = FlowConnectionType._('Conditional');

  final String value;

  const FlowConnectionType._(this.value);

  static const values = [data, conditional];

  static FlowConnectionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FlowConnectionType._(value));

  @override
  bool operator ==(other) =>
      other is FlowConnectionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      sourceOutput: (json['sourceOutput'] as String?) ?? '',
      targetInput: (json['targetInput'] as String?) ?? '',
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
      condition: (json['condition'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    return {
      'condition': condition,
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
      name: (json['name'] as String?) ?? '',
      type: FlowNodeType.fromString((json['type'] as String?) ?? ''),
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

class FlowNodeType {
  static const input = FlowNodeType._('Input');
  static const output = FlowNodeType._('Output');
  static const knowledgeBase = FlowNodeType._('KnowledgeBase');
  static const condition = FlowNodeType._('Condition');
  static const lex = FlowNodeType._('Lex');
  static const prompt = FlowNodeType._('Prompt');
  static const lambdaFunction = FlowNodeType._('LambdaFunction');
  static const storage = FlowNodeType._('Storage');
  static const agent = FlowNodeType._('Agent');
  static const retrieval = FlowNodeType._('Retrieval');
  static const iterator = FlowNodeType._('Iterator');
  static const collector = FlowNodeType._('Collector');
  static const inlineCode = FlowNodeType._('InlineCode');
  static const loop = FlowNodeType._('Loop');
  static const loopInput = FlowNodeType._('LoopInput');
  static const loopController = FlowNodeType._('LoopController');

  final String value;

  const FlowNodeType._(this.value);

  static const values = [
    input,
    output,
    knowledgeBase,
    condition,
    lex,
    prompt,
    lambdaFunction,
    storage,
    agent,
    retrieval,
    iterator,
    collector,
    inlineCode,
    loop,
    loopInput,
    loopController
  ];

  static FlowNodeType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FlowNodeType._(value));

  @override
  bool operator ==(other) => other is FlowNodeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains configurations for a node in your flow. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-nodes.html">Node
/// types in a flow</a> in the Amazon Bedrock User Guide.
class FlowNodeConfiguration {
  /// Contains configurations for an agent node in your flow. Invokes an alias of
  /// an agent and returns the response.
  final AgentFlowNodeConfiguration? agent;

  /// Contains configurations for a collector node in your flow. Collects an
  /// iteration of inputs and consolidates them into an array of outputs.
  final CollectorFlowNodeConfiguration? collector;

  /// Contains configurations for a condition node in your flow. Defines
  /// conditions that lead to different branches of the flow.
  final ConditionFlowNodeConfiguration? condition;

  /// Contains configurations for an inline code node in your flow. Inline code
  /// nodes let you write and execute code directly within your flow, enabling
  /// data transformations, custom logic, and integrations without needing an
  /// external Lambda function.
  final InlineCodeFlowNodeConfiguration? inlineCode;

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

  /// Contains configurations for a DoWhile loop in your flow.
  final LoopFlowNodeConfiguration? loop;

  /// Contains controller node configurations for a DoWhile loop in your flow.
  final LoopControllerFlowNodeConfiguration? loopController;

  /// Contains input node configurations for a DoWhile loop in your flow.
  final LoopInputFlowNodeConfiguration? loopInput;

  /// Contains configurations for an output flow node in your flow. The last node
  /// in the flow. <code>outputs</code> can't be specified for this node.
  final OutputFlowNodeConfiguration? output;

  /// Contains configurations for a prompt node in your flow. Runs a prompt and
  /// generates the model response as the output. You can use a prompt from Prompt
  /// management or you can configure one in this node.
  final PromptFlowNodeConfiguration? prompt;

  /// Contains configurations for a retrieval node in your flow. Retrieves data
  /// from an Amazon S3 location and returns it as the output.
  final RetrievalFlowNodeConfiguration? retrieval;

  /// Contains configurations for a storage node in your flow. Stores an input in
  /// an Amazon S3 location.
  final StorageFlowNodeConfiguration? storage;

  FlowNodeConfiguration({
    this.agent,
    this.collector,
    this.condition,
    this.inlineCode,
    this.input,
    this.iterator,
    this.knowledgeBase,
    this.lambdaFunction,
    this.lex,
    this.loop,
    this.loopController,
    this.loopInput,
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
      inlineCode: json['inlineCode'] != null
          ? InlineCodeFlowNodeConfiguration.fromJson(
              json['inlineCode'] as Map<String, dynamic>)
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
      loop: json['loop'] != null
          ? LoopFlowNodeConfiguration.fromJson(
              json['loop'] as Map<String, dynamic>)
          : null,
      loopController: json['loopController'] != null
          ? LoopControllerFlowNodeConfiguration.fromJson(
              json['loopController'] as Map<String, dynamic>)
          : null,
      loopInput: json['loopInput'] != null
          ? LoopInputFlowNodeConfiguration.fromJson(
              json['loopInput'] as Map<String, dynamic>)
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
    final inlineCode = this.inlineCode;
    final input = this.input;
    final iterator = this.iterator;
    final knowledgeBase = this.knowledgeBase;
    final lambdaFunction = this.lambdaFunction;
    final lex = this.lex;
    final loop = this.loop;
    final loopController = this.loopController;
    final loopInput = this.loopInput;
    final output = this.output;
    final prompt = this.prompt;
    final retrieval = this.retrieval;
    final storage = this.storage;
    return {
      if (agent != null) 'agent': agent,
      if (collector != null) 'collector': collector,
      if (condition != null) 'condition': condition,
      if (inlineCode != null) 'inlineCode': inlineCode,
      if (input != null) 'input': input,
      if (iterator != null) 'iterator': iterator,
      if (knowledgeBase != null) 'knowledgeBase': knowledgeBase,
      if (lambdaFunction != null) 'lambdaFunction': lambdaFunction,
      if (lex != null) 'lex': lex,
      if (loop != null) 'loop': loop,
      if (loopController != null) 'loopController': loopController,
      if (loopInput != null) 'loopInput': loopInput,
      if (output != null) 'output': output,
      if (prompt != null) 'prompt': prompt,
      if (retrieval != null) 'retrieval': retrieval,
      if (storage != null) 'storage': storage,
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
      name: (json['name'] as String?) ?? '',
      type: FlowNodeIODataType.fromString((json['type'] as String?) ?? ''),
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

class FlowNodeIODataType {
  static const string = FlowNodeIODataType._('String');
  static const number = FlowNodeIODataType._('Number');
  static const boolean = FlowNodeIODataType._('Boolean');
  static const object = FlowNodeIODataType._('Object');
  static const array = FlowNodeIODataType._('Array');

  final String value;

  const FlowNodeIODataType._(this.value);

  static const values = [string, number, boolean, object, array];

  static FlowNodeIODataType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FlowNodeIODataType._(value));

  @override
  bool operator ==(other) =>
      other is FlowNodeIODataType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains configurations for an input in an Amazon Bedrock Flows node.
class FlowNodeInput {
  /// An expression that formats the input for the node. For an explanation of how
  /// to create expressions, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-expressions.html">Expressions
  /// in Prompt flows in Amazon Bedrock</a>.
  final String expression;

  /// Specifies a name for the input that you can reference.
  final String name;

  /// Specifies the data type of the input. If the input doesn't match this type
  /// at runtime, a validation error will be thrown.
  final FlowNodeIODataType type;

  /// Specifies how input data flows between iterations in a DoWhile loop.
  ///
  /// <ul>
  /// <li>
  /// <code>LoopCondition</code> - Controls whether the loop continues by
  /// evaluating condition expressions against the input data. Use this category
  /// to define the condition that determines if the loop should continue.
  /// </li>
  /// <li>
  /// <code>ReturnValueToLoopStart</code> - Defines data to pass back to the start
  /// of the loop's next iteration. Use this category for variables that you want
  /// to update for each loop iteration.
  /// </li>
  /// <li>
  /// <code>ExitLoop</code> - Defines the value that's available once the loop
  /// ends. Use this category to expose loop results to nodes outside the loop.
  /// </li>
  /// </ul>
  final FlowNodeInputCategory? category;

  FlowNodeInput({
    required this.expression,
    required this.name,
    required this.type,
    this.category,
  });

  factory FlowNodeInput.fromJson(Map<String, dynamic> json) {
    return FlowNodeInput(
      expression: (json['expression'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      type: FlowNodeIODataType.fromString((json['type'] as String?) ?? ''),
      category:
          (json['category'] as String?)?.let(FlowNodeInputCategory.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final name = this.name;
    final type = this.type;
    final category = this.category;
    return {
      'expression': expression,
      'name': name,
      'type': type.value,
      if (category != null) 'category': category.value,
    };
  }
}

class FlowNodeInputCategory {
  static const loopCondition = FlowNodeInputCategory._('LoopCondition');
  static const returnValueToLoopStart =
      FlowNodeInputCategory._('ReturnValueToLoopStart');
  static const exitLoop = FlowNodeInputCategory._('ExitLoop');

  final String value;

  const FlowNodeInputCategory._(this.value);

  static const values = [loopCondition, returnValueToLoopStart, exitLoop];

  static FlowNodeInputCategory fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FlowNodeInputCategory._(value));

  @override
  bool operator ==(other) =>
      other is FlowNodeInputCategory && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

/// Contains configurations for a knowledge base node in a flow. This node takes
/// a query as the input and returns, as the output, the retrieved responses
/// directly (as an array) or a response generated based on the retrieved
/// responses. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-nodes.html">Node
/// types in a flow</a> in the Amazon Bedrock User Guide.
class KnowledgeBaseFlowNodeConfiguration {
  /// The unique identifier of the knowledge base to query.
  final String knowledgeBaseId;

  /// Contains configurations for a guardrail to apply during query and response
  /// generation for the knowledge base in this configuration.
  final GuardrailConfiguration? guardrailConfiguration;

  /// Contains inference configurations for the prompt.
  final PromptInferenceConfiguration? inferenceConfiguration;

  /// The unique identifier of the model or <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/cross-region-inference.html">inference
  /// profile</a> to use to generate a response from the query results. Omit this
  /// field if you want to return the retrieved results as an array.
  final String? modelId;

  /// The number of results to retrieve from the knowledge base.
  final int? numberOfResults;

  /// The configuration for orchestrating the retrieval and generation process in
  /// the knowledge base node.
  final KnowledgeBaseOrchestrationConfiguration? orchestrationConfiguration;

  /// A custom prompt template to use with the knowledge base for generating
  /// responses.
  final KnowledgeBasePromptTemplate? promptTemplate;

  /// The configuration for reranking the retrieved results from the knowledge
  /// base to improve relevance.
  final VectorSearchRerankingConfiguration? rerankingConfiguration;

  KnowledgeBaseFlowNodeConfiguration({
    required this.knowledgeBaseId,
    this.guardrailConfiguration,
    this.inferenceConfiguration,
    this.modelId,
    this.numberOfResults,
    this.orchestrationConfiguration,
    this.promptTemplate,
    this.rerankingConfiguration,
  });

  factory KnowledgeBaseFlowNodeConfiguration.fromJson(
      Map<String, dynamic> json) {
    return KnowledgeBaseFlowNodeConfiguration(
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      guardrailConfiguration: json['guardrailConfiguration'] != null
          ? GuardrailConfiguration.fromJson(
              json['guardrailConfiguration'] as Map<String, dynamic>)
          : null,
      inferenceConfiguration: json['inferenceConfiguration'] != null
          ? PromptInferenceConfiguration.fromJson(
              json['inferenceConfiguration'] as Map<String, dynamic>)
          : null,
      modelId: json['modelId'] as String?,
      numberOfResults: json['numberOfResults'] as int?,
      orchestrationConfiguration: json['orchestrationConfiguration'] != null
          ? KnowledgeBaseOrchestrationConfiguration.fromJson(
              json['orchestrationConfiguration'] as Map<String, dynamic>)
          : null,
      promptTemplate: json['promptTemplate'] != null
          ? KnowledgeBasePromptTemplate.fromJson(
              json['promptTemplate'] as Map<String, dynamic>)
          : null,
      rerankingConfiguration: json['rerankingConfiguration'] != null
          ? VectorSearchRerankingConfiguration.fromJson(
              json['rerankingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBaseId = this.knowledgeBaseId;
    final guardrailConfiguration = this.guardrailConfiguration;
    final inferenceConfiguration = this.inferenceConfiguration;
    final modelId = this.modelId;
    final numberOfResults = this.numberOfResults;
    final orchestrationConfiguration = this.orchestrationConfiguration;
    final promptTemplate = this.promptTemplate;
    final rerankingConfiguration = this.rerankingConfiguration;
    return {
      'knowledgeBaseId': knowledgeBaseId,
      if (guardrailConfiguration != null)
        'guardrailConfiguration': guardrailConfiguration,
      if (inferenceConfiguration != null)
        'inferenceConfiguration': inferenceConfiguration,
      if (modelId != null) 'modelId': modelId,
      if (numberOfResults != null) 'numberOfResults': numberOfResults,
      if (orchestrationConfiguration != null)
        'orchestrationConfiguration': orchestrationConfiguration,
      if (promptTemplate != null) 'promptTemplate': promptTemplate,
      if (rerankingConfiguration != null)
        'rerankingConfiguration': rerankingConfiguration,
    };
  }
}

/// Defines a condition node in your flow. You can specify conditions that
/// determine which node comes next in the flow. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-nodes.html">Node
/// types in a flow</a> in the Amazon Bedrock User Guide.
class ConditionFlowNodeConfiguration {
  /// An array of conditions. Each member contains the name of a condition and an
  /// expression that defines the condition.
  final List<FlowCondition> conditions;

  ConditionFlowNodeConfiguration({
    required this.conditions,
  });

  factory ConditionFlowNodeConfiguration.fromJson(Map<String, dynamic> json) {
    return ConditionFlowNodeConfiguration(
      conditions: ((json['conditions'] as List?) ?? const [])
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

/// Contains configurations for a Lex node in the flow. You specify a Amazon Lex
/// bot to invoke. This node takes an utterance as the input and returns as the
/// output the intent identified by the Amazon Lex bot. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-nodes.html">Node
/// types in a flow</a> in the Amazon Bedrock User Guide.
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
      botAliasArn: (json['botAliasArn'] as String?) ?? '',
      localeId: (json['localeId'] as String?) ?? '',
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

/// Contains configurations for a prompt node in the flow. You can use a prompt
/// from Prompt management or you can define one in this node. If the prompt
/// contains variables, the inputs into this node will fill in the variables.
/// The output from this node is the response generated by the model. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-nodes.html">Node
/// types in a flow</a> in the Amazon Bedrock User Guide.
class PromptFlowNodeConfiguration {
  /// Specifies whether the prompt is from Prompt management or defined inline.
  final PromptFlowNodeSourceConfiguration sourceConfiguration;

  /// Contains configurations for a guardrail to apply to the prompt in this node
  /// and the response generated from it.
  final GuardrailConfiguration? guardrailConfiguration;

  PromptFlowNodeConfiguration({
    required this.sourceConfiguration,
    this.guardrailConfiguration,
  });

  factory PromptFlowNodeConfiguration.fromJson(Map<String, dynamic> json) {
    return PromptFlowNodeConfiguration(
      sourceConfiguration: PromptFlowNodeSourceConfiguration.fromJson(
          (json['sourceConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      guardrailConfiguration: json['guardrailConfiguration'] != null
          ? GuardrailConfiguration.fromJson(
              json['guardrailConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceConfiguration = this.sourceConfiguration;
    final guardrailConfiguration = this.guardrailConfiguration;
    return {
      'sourceConfiguration': sourceConfiguration,
      if (guardrailConfiguration != null)
        'guardrailConfiguration': guardrailConfiguration,
    };
  }
}

/// Contains configurations for a Lambda function node in the flow. You specify
/// the Lambda function to invoke and the inputs into the function. The output
/// is the response that is defined in the Lambda function. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-nodes.html">Node
/// types in a flow</a> in the Amazon Bedrock User Guide.
class LambdaFunctionFlowNodeConfiguration {
  /// The Amazon Resource Name (ARN) of the Lambda function to invoke.
  final String lambdaArn;

  LambdaFunctionFlowNodeConfiguration({
    required this.lambdaArn,
  });

  factory LambdaFunctionFlowNodeConfiguration.fromJson(
      Map<String, dynamic> json) {
    return LambdaFunctionFlowNodeConfiguration(
      lambdaArn: (json['lambdaArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaArn = this.lambdaArn;
    return {
      'lambdaArn': lambdaArn,
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
          (json['serviceConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceConfiguration = this.serviceConfiguration;
    return {
      'serviceConfiguration': serviceConfiguration,
    };
  }
}

/// Defines an agent node in your flow. You specify the agent to invoke at this
/// point in the flow. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-nodes.html">Node
/// types in a flow</a> in the Amazon Bedrock User Guide.
class AgentFlowNodeConfiguration {
  /// The Amazon Resource Name (ARN) of the alias of the agent to invoke.
  final String agentAliasArn;

  AgentFlowNodeConfiguration({
    required this.agentAliasArn,
  });

  factory AgentFlowNodeConfiguration.fromJson(Map<String, dynamic> json) {
    return AgentFlowNodeConfiguration(
      agentAliasArn: (json['agentAliasArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final agentAliasArn = this.agentAliasArn;
    return {
      'agentAliasArn': agentAliasArn,
    };
  }
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
          (json['serviceConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceConfiguration = this.serviceConfiguration;
    return {
      'serviceConfiguration': serviceConfiguration,
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

/// Defines a collector node in your flow. This node takes an iteration of
/// inputs and consolidates them into an array in the output. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-nodes.html">Node
/// types in a flow</a> in the Amazon Bedrock User Guide.
class CollectorFlowNodeConfiguration {
  CollectorFlowNodeConfiguration();

  factory CollectorFlowNodeConfiguration.fromJson(Map<String, dynamic> _) {
    return CollectorFlowNodeConfiguration();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains configurations for an inline code node in your flow. Inline code
/// nodes let you write and execute code directly within your flow, enabling
/// data transformations, custom logic, and integrations without needing an
/// external Lambda function.
class InlineCodeFlowNodeConfiguration {
  /// The code that's executed in your inline code node. The code can access input
  /// data from previous nodes in the flow, perform operations on that data, and
  /// produce output that can be used by other nodes in your flow.
  ///
  /// The code must be valid in the programming <code>language</code> that you
  /// specify.
  final String code;

  /// The programming language used by your inline code node.
  ///
  /// The code must be valid in the programming <code>language</code> that you
  /// specify. Currently, only Python 3 (<code>Python_3</code>) is supported.
  final SupportedLanguages language;

  InlineCodeFlowNodeConfiguration({
    required this.code,
    required this.language,
  });

  factory InlineCodeFlowNodeConfiguration.fromJson(Map<String, dynamic> json) {
    return InlineCodeFlowNodeConfiguration(
      code: (json['code'] as String?) ?? '',
      language:
          SupportedLanguages.fromString((json['language'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final language = this.language;
    return {
      'code': code,
      'language': language.value,
    };
  }
}

/// Contains configurations for the nodes of a DoWhile loop in your flow.
///
/// A DoWhile loop is made up of the following nodes:
///
/// <ul>
/// <li>
/// <code>Loop</code> - The container node that holds the loop's flow
/// definition. This node encompasses the entire loop structure.
/// </li>
/// <li>
/// <code>LoopInput</code> - The entry point node for the loop. This node
/// receives inputs from nodes outside the loop and from previous loop
/// iterations.
/// </li>
/// <li>
/// Body nodes - The processing nodes that execute within each loop iteration.
/// These can be nodes for handling data in your flow, such as a prompt or
/// Lambda function nodes. Some node types aren't supported inside a DoWhile
/// loop body. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_LoopIncompatibleNodeTypeFlowValidationDetails.html">LoopIncompatibleNodeTypeFlowValidationDetails</a>.
/// </li>
/// <li>
/// <code>LoopController</code> - The node that evaluates whether the loop
/// should continue or exit based on a condition.
/// </li>
/// </ul>
/// These nodes work together to create a loop that runs at least once and
/// continues until a specified condition is met or a maximum number of
/// iterations is reached.
class LoopFlowNodeConfiguration {
  /// The definition of the DoWhile loop nodes and connections between nodes in
  /// the flow.
  final FlowDefinition definition;

  LoopFlowNodeConfiguration({
    required this.definition,
  });

  factory LoopFlowNodeConfiguration.fromJson(Map<String, dynamic> json) {
    return LoopFlowNodeConfiguration(
      definition: FlowDefinition.fromJson(
          (json['definition'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    return {
      'definition': definition,
    };
  }
}

/// Contains configurations for the input node of a DoWhile loop in the flow.
class LoopInputFlowNodeConfiguration {
  LoopInputFlowNodeConfiguration();

  factory LoopInputFlowNodeConfiguration.fromJson(Map<String, dynamic> _) {
    return LoopInputFlowNodeConfiguration();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains configurations for the controller node of a DoWhile loop in the
/// flow.
class LoopControllerFlowNodeConfiguration {
  /// Specifies the condition that determines when the flow exits the DoWhile
  /// loop. The loop executes until this condition evaluates to true.
  final FlowCondition continueCondition;

  /// Specifies the maximum number of times the DoWhile loop can iterate before
  /// the flow exits the loop.
  final int? maxIterations;

  LoopControllerFlowNodeConfiguration({
    required this.continueCondition,
    this.maxIterations,
  });

  factory LoopControllerFlowNodeConfiguration.fromJson(
      Map<String, dynamic> json) {
    return LoopControllerFlowNodeConfiguration(
      continueCondition: FlowCondition.fromJson(
          (json['continueCondition'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      maxIterations: json['maxIterations'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final continueCondition = this.continueCondition;
    final maxIterations = this.maxIterations;
    return {
      'continueCondition': continueCondition,
      if (maxIterations != null) 'maxIterations': maxIterations,
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
      name: (json['name'] as String?) ?? '',
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

class SupportedLanguages {
  static const python_3 = SupportedLanguages._('Python_3');

  final String value;

  const SupportedLanguages._(this.value);

  static const values = [python_3];

  static SupportedLanguages fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SupportedLanguages._(value));

  @override
  bool operator ==(other) =>
      other is SupportedLanguages && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      bucketName: (json['bucketName'] as String?) ?? '',
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
      bucketName: (json['bucketName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    return {
      'bucketName': bucketName,
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
      promptArn: (json['promptArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final promptArn = this.promptArn;
    return {
      'promptArn': promptArn,
    };
  }
}

/// Contains configurations for a prompt defined inline in the node.
class PromptFlowNodeInlineConfiguration {
  /// The unique identifier of the model or <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/cross-region-inference.html">inference
  /// profile</a> to run inference with.
  final String modelId;

  /// Contains a prompt and variables in the prompt that can be replaced with
  /// values at runtime.
  final PromptTemplateConfiguration templateConfiguration;

  /// The type of prompt template.
  final PromptTemplateType templateType;

  /// Additional fields to be included in the model request for the Prompt node.
  final Document? additionalModelRequestFields;

  /// Contains inference configurations for the prompt.
  final PromptInferenceConfiguration? inferenceConfiguration;

  PromptFlowNodeInlineConfiguration({
    required this.modelId,
    required this.templateConfiguration,
    required this.templateType,
    this.additionalModelRequestFields,
    this.inferenceConfiguration,
  });

  factory PromptFlowNodeInlineConfiguration.fromJson(
      Map<String, dynamic> json) {
    return PromptFlowNodeInlineConfiguration(
      modelId: (json['modelId'] as String?) ?? '',
      templateConfiguration: PromptTemplateConfiguration.fromJson(
          (json['templateConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      templateType: PromptTemplateType.fromString(
          (json['templateType'] as String?) ?? ''),
      additionalModelRequestFields: json['additionalModelRequestFields'] != null
          ? Document.fromJson(
              json['additionalModelRequestFields'] as Map<String, dynamic>)
          : null,
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
    final additionalModelRequestFields = this.additionalModelRequestFields;
    final inferenceConfiguration = this.inferenceConfiguration;
    return {
      'modelId': modelId,
      'templateConfiguration': templateConfiguration,
      'templateType': templateType.value,
      if (additionalModelRequestFields != null)
        'additionalModelRequestFields': additionalModelRequestFields,
      if (inferenceConfiguration != null)
        'inferenceConfiguration': inferenceConfiguration,
    };
  }
}

/// Defines a custom prompt template for orchestrating the retrieval and
/// generation process.
class KnowledgeBasePromptTemplate {
  /// The text of the prompt template.
  final String? textPromptTemplate;

  KnowledgeBasePromptTemplate({
    this.textPromptTemplate,
  });

  factory KnowledgeBasePromptTemplate.fromJson(Map<String, dynamic> json) {
    return KnowledgeBasePromptTemplate(
      textPromptTemplate: json['textPromptTemplate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final textPromptTemplate = this.textPromptTemplate;
    return {
      if (textPromptTemplate != null) 'textPromptTemplate': textPromptTemplate,
    };
  }
}

/// Specifies how retrieved results from a knowledge base are reranked to
/// improve relevance.
class VectorSearchRerankingConfiguration {
  /// Specifies the type of reranking model to use. Currently, the only supported
  /// value is <code>BEDROCK_RERANKING_MODEL</code>.
  final VectorSearchRerankingConfigurationType type;

  /// Specifies the configuration for using an Amazon Bedrock reranker model to
  /// rerank retrieved results.
  final VectorSearchBedrockRerankingConfiguration?
      bedrockRerankingConfiguration;

  VectorSearchRerankingConfiguration({
    required this.type,
    this.bedrockRerankingConfiguration,
  });

  factory VectorSearchRerankingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return VectorSearchRerankingConfiguration(
      type: VectorSearchRerankingConfigurationType.fromString(
          (json['type'] as String?) ?? ''),
      bedrockRerankingConfiguration:
          json['bedrockRerankingConfiguration'] != null
              ? VectorSearchBedrockRerankingConfiguration.fromJson(
                  json['bedrockRerankingConfiguration'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final bedrockRerankingConfiguration = this.bedrockRerankingConfiguration;
    return {
      'type': type.value,
      if (bedrockRerankingConfiguration != null)
        'bedrockRerankingConfiguration': bedrockRerankingConfiguration,
    };
  }
}

/// Configures how the knowledge base orchestrates the retrieval and generation
/// process, allowing for customization of prompts, inference parameters, and
/// performance settings.
class KnowledgeBaseOrchestrationConfiguration {
  /// The additional model-specific request parameters as key-value pairs to be
  /// included in the request to the foundation model.
  final Map<String, Object>? additionalModelRequestFields;

  /// Contains inference configurations for the prompt.
  final PromptInferenceConfiguration? inferenceConfig;

  /// The performance configuration options for the knowledge base retrieval and
  /// generation process.
  final PerformanceConfiguration? performanceConfig;

  /// A custom prompt template for orchestrating the retrieval and generation
  /// process.
  final KnowledgeBasePromptTemplate? promptTemplate;

  KnowledgeBaseOrchestrationConfiguration({
    this.additionalModelRequestFields,
    this.inferenceConfig,
    this.performanceConfig,
    this.promptTemplate,
  });

  factory KnowledgeBaseOrchestrationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return KnowledgeBaseOrchestrationConfiguration(
      additionalModelRequestFields:
          (json['additionalModelRequestFields'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as Object)),
      inferenceConfig: json['inferenceConfig'] != null
          ? PromptInferenceConfiguration.fromJson(
              json['inferenceConfig'] as Map<String, dynamic>)
          : null,
      performanceConfig: json['performanceConfig'] != null
          ? PerformanceConfiguration.fromJson(
              json['performanceConfig'] as Map<String, dynamic>)
          : null,
      promptTemplate: json['promptTemplate'] != null
          ? KnowledgeBasePromptTemplate.fromJson(
              json['promptTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalModelRequestFields = this.additionalModelRequestFields;
    final inferenceConfig = this.inferenceConfig;
    final performanceConfig = this.performanceConfig;
    final promptTemplate = this.promptTemplate;
    return {
      if (additionalModelRequestFields != null)
        'additionalModelRequestFields': additionalModelRequestFields,
      if (inferenceConfig != null) 'inferenceConfig': inferenceConfig,
      if (performanceConfig != null) 'performanceConfig': performanceConfig,
      if (promptTemplate != null) 'promptTemplate': promptTemplate,
    };
  }
}

/// The performance-related configuration options for the knowledge base
/// retrieval and generation process.
class PerformanceConfiguration {
  /// The latency optimization setting.
  final PerformanceConfigLatency? latency;

  PerformanceConfiguration({
    this.latency,
  });

  factory PerformanceConfiguration.fromJson(Map<String, dynamic> json) {
    return PerformanceConfiguration(
      latency: (json['latency'] as String?)
          ?.let(PerformanceConfigLatency.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final latency = this.latency;
    return {
      if (latency != null) 'latency': latency.value,
    };
  }
}

class PerformanceConfigLatency {
  static const standard = PerformanceConfigLatency._('standard');
  static const optimized = PerformanceConfigLatency._('optimized');

  final String value;

  const PerformanceConfigLatency._(this.value);

  static const values = [standard, optimized];

  static PerformanceConfigLatency fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PerformanceConfigLatency._(value));

  @override
  bool operator ==(other) =>
      other is PerformanceConfigLatency && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class VectorSearchRerankingConfigurationType {
  static const bedrockRerankingModel =
      VectorSearchRerankingConfigurationType._('BEDROCK_RERANKING_MODEL');

  final String value;

  const VectorSearchRerankingConfigurationType._(this.value);

  static const values = [bedrockRerankingModel];

  static VectorSearchRerankingConfigurationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VectorSearchRerankingConfigurationType._(value));

  @override
  bool operator ==(other) =>
      other is VectorSearchRerankingConfigurationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configures the Amazon Bedrock reranker model to improve the relevance of
/// retrieved results.
class VectorSearchBedrockRerankingConfiguration {
  /// Specifies the configuration for the Amazon Bedrock reranker model.
  final VectorSearchBedrockRerankingModelConfiguration modelConfiguration;

  /// Specifies how metadata fields should be handled during the reranking
  /// process.
  final MetadataConfigurationForReranking? metadataConfiguration;

  /// Specifies the number of results to return after reranking.
  final int? numberOfRerankedResults;

  VectorSearchBedrockRerankingConfiguration({
    required this.modelConfiguration,
    this.metadataConfiguration,
    this.numberOfRerankedResults,
  });

  factory VectorSearchBedrockRerankingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return VectorSearchBedrockRerankingConfiguration(
      modelConfiguration:
          VectorSearchBedrockRerankingModelConfiguration.fromJson(
              (json['modelConfiguration'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      metadataConfiguration: json['metadataConfiguration'] != null
          ? MetadataConfigurationForReranking.fromJson(
              json['metadataConfiguration'] as Map<String, dynamic>)
          : null,
      numberOfRerankedResults: json['numberOfRerankedResults'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelConfiguration = this.modelConfiguration;
    final metadataConfiguration = this.metadataConfiguration;
    final numberOfRerankedResults = this.numberOfRerankedResults;
    return {
      'modelConfiguration': modelConfiguration,
      if (metadataConfiguration != null)
        'metadataConfiguration': metadataConfiguration,
      if (numberOfRerankedResults != null)
        'numberOfRerankedResults': numberOfRerankedResults,
    };
  }
}

/// Configures the Amazon Bedrock model used for reranking retrieved results.
class VectorSearchBedrockRerankingModelConfiguration {
  /// The Amazon Resource Name (ARN) of the Amazon Bedrock reranker model.
  final String modelArn;

  /// Specifies additional model-specific request parameters as key-value pairs
  /// that are included in the request to the Amazon Bedrock reranker model.
  final Map<String, Object>? additionalModelRequestFields;

  VectorSearchBedrockRerankingModelConfiguration({
    required this.modelArn,
    this.additionalModelRequestFields,
  });

  factory VectorSearchBedrockRerankingModelConfiguration.fromJson(
      Map<String, dynamic> json) {
    return VectorSearchBedrockRerankingModelConfiguration(
      modelArn: (json['modelArn'] as String?) ?? '',
      additionalModelRequestFields:
          (json['additionalModelRequestFields'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as Object)),
    );
  }

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    final additionalModelRequestFields = this.additionalModelRequestFields;
    return {
      'modelArn': modelArn,
      if (additionalModelRequestFields != null)
        'additionalModelRequestFields': additionalModelRequestFields,
    };
  }
}

/// Specifies how metadata fields should be handled during the reranking
/// process.
class MetadataConfigurationForReranking {
  /// The mode for selecting metadata fields for reranking.
  final RerankingMetadataSelectionMode selectionMode;

  /// The configuration for selective metadata field inclusion or exclusion during
  /// reranking.
  final RerankingMetadataSelectiveModeConfiguration? selectiveModeConfiguration;

  MetadataConfigurationForReranking({
    required this.selectionMode,
    this.selectiveModeConfiguration,
  });

  factory MetadataConfigurationForReranking.fromJson(
      Map<String, dynamic> json) {
    return MetadataConfigurationForReranking(
      selectionMode: RerankingMetadataSelectionMode.fromString(
          (json['selectionMode'] as String?) ?? ''),
      selectiveModeConfiguration: json['selectiveModeConfiguration'] != null
          ? RerankingMetadataSelectiveModeConfiguration.fromJson(
              json['selectiveModeConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final selectionMode = this.selectionMode;
    final selectiveModeConfiguration = this.selectiveModeConfiguration;
    return {
      'selectionMode': selectionMode.value,
      if (selectiveModeConfiguration != null)
        'selectiveModeConfiguration': selectiveModeConfiguration,
    };
  }
}

class RerankingMetadataSelectionMode {
  static const selective = RerankingMetadataSelectionMode._('SELECTIVE');
  static const all = RerankingMetadataSelectionMode._('ALL');

  final String value;

  const RerankingMetadataSelectionMode._(this.value);

  static const values = [selective, all];

  static RerankingMetadataSelectionMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RerankingMetadataSelectionMode._(value));

  @override
  bool operator ==(other) =>
      other is RerankingMetadataSelectionMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configures the metadata fields to include or exclude during the reranking
/// process when using selective mode.
class RerankingMetadataSelectiveModeConfiguration {
  /// Specifies the metadata fields to exclude from the reranking process.
  final List<FieldForReranking>? fieldsToExclude;

  /// Specifies the metadata fields to include in the reranking process.
  final List<FieldForReranking>? fieldsToInclude;

  RerankingMetadataSelectiveModeConfiguration({
    this.fieldsToExclude,
    this.fieldsToInclude,
  });

  factory RerankingMetadataSelectiveModeConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RerankingMetadataSelectiveModeConfiguration(
      fieldsToExclude: (json['fieldsToExclude'] as List?)
          ?.nonNulls
          .map((e) => FieldForReranking.fromJson(e as Map<String, dynamic>))
          .toList(),
      fieldsToInclude: (json['fieldsToInclude'] as List?)
          ?.nonNulls
          .map((e) => FieldForReranking.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldsToExclude = this.fieldsToExclude;
    final fieldsToInclude = this.fieldsToInclude;
    return {
      if (fieldsToExclude != null) 'fieldsToExclude': fieldsToExclude,
      if (fieldsToInclude != null) 'fieldsToInclude': fieldsToInclude,
    };
  }
}

/// Specifies a metadata field to include or exclude during the reranking
/// process.
class FieldForReranking {
  /// The name of the metadata field to include or exclude during reranking.
  final String fieldName;

  FieldForReranking({
    required this.fieldName,
  });

  factory FieldForReranking.fromJson(Map<String, dynamic> json) {
    return FieldForReranking(
      fieldName: (json['fieldName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final fieldName = this.fieldName;
    return {
      'fieldName': fieldName,
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

  /// The configuration that specifies how nodes in the flow are executed
  /// concurrently.
  final FlowAliasConcurrencyConfiguration? concurrencyConfiguration;

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
    this.concurrencyConfiguration,
    this.description,
  });

  factory FlowAliasSummary.fromJson(Map<String, dynamic> json) {
    return FlowAliasSummary(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      flowId: (json['flowId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      routingConfiguration:
          ((json['routingConfiguration'] as List?) ?? const [])
              .nonNulls
              .map((e) => FlowAliasRoutingConfigurationListItem.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      concurrencyConfiguration: json['concurrencyConfiguration'] != null
          ? FlowAliasConcurrencyConfiguration.fromJson(
              json['concurrencyConfiguration'] as Map<String, dynamic>)
          : null,
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
    final concurrencyConfiguration = this.concurrencyConfiguration;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'flowId': flowId,
      'id': id,
      'name': name,
      'routingConfiguration': routingConfiguration,
      'updatedAt': iso8601ToJson(updatedAt),
      if (concurrencyConfiguration != null)
        'concurrencyConfiguration': concurrencyConfiguration,
      if (description != null) 'description': description,
    };
  }
}

/// Determines how multiple nodes in a flow can run in parallel. Running nodes
/// concurrently can improve your flow's performance.
class FlowAliasConcurrencyConfiguration {
  /// The type of concurrency to use for parallel node execution. Specify one of
  /// the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>Automatic</code> - Amazon Bedrock determines which nodes can be
  /// executed in parallel based on the flow definition and its dependencies.
  /// </li>
  /// <li>
  /// <code>Manual</code> - You specify which nodes can be executed in parallel.
  /// </li>
  /// </ul>
  final ConcurrencyType type;

  /// The maximum number of nodes that can be executed concurrently in the flow.
  final int? maxConcurrency;

  FlowAliasConcurrencyConfiguration({
    required this.type,
    this.maxConcurrency,
  });

  factory FlowAliasConcurrencyConfiguration.fromJson(
      Map<String, dynamic> json) {
    return FlowAliasConcurrencyConfiguration(
      type: ConcurrencyType.fromString((json['type'] as String?) ?? ''),
      maxConcurrency: json['maxConcurrency'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final maxConcurrency = this.maxConcurrency;
    return {
      'type': type.value,
      if (maxConcurrency != null) 'maxConcurrency': maxConcurrency,
    };
  }
}

class ConcurrencyType {
  static const automatic = ConcurrencyType._('Automatic');
  static const manual = ConcurrencyType._('Manual');

  final String value;

  const ConcurrencyType._(this.value);

  static const values = [automatic, manual];

  static ConcurrencyType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConcurrencyType._(value));

  @override
  bool operator ==(other) => other is ConcurrencyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: FlowStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as String?) ?? '',
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

  /// Specific details about the validation issue encountered in the flow.
  final FlowValidationDetails? details;

  /// The type of validation issue encountered in the flow.
  final FlowValidationType? type;

  FlowValidation({
    required this.message,
    required this.severity,
    this.details,
    this.type,
  });

  factory FlowValidation.fromJson(Map<String, dynamic> json) {
    return FlowValidation(
      message: (json['message'] as String?) ?? '',
      severity: FlowValidationSeverity.fromString(
          (json['severity'] as String?) ?? ''),
      details: json['details'] != null
          ? FlowValidationDetails.fromJson(
              json['details'] as Map<String, dynamic>)
          : null,
      type: (json['type'] as String?)?.let(FlowValidationType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final severity = this.severity;
    final details = this.details;
    final type = this.type;
    return {
      'message': message,
      'severity': severity.value,
      if (details != null) 'details': details,
      if (type != null) 'type': type.value,
    };
  }
}

class FlowValidationSeverity {
  static const warning = FlowValidationSeverity._('Warning');
  static const error = FlowValidationSeverity._('Error');

  final String value;

  const FlowValidationSeverity._(this.value);

  static const values = [warning, error];

  static FlowValidationSeverity fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FlowValidationSeverity._(value));

  @override
  bool operator ==(other) =>
      other is FlowValidationSeverity && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A union type containing various possible validation issues in the flow.
class FlowValidationDetails {
  /// Details about a cyclic connection in the flow.
  final CyclicConnectionFlowValidationDetails? cyclicConnection;

  /// Details about duplicate condition expressions in a node.
  final DuplicateConditionExpressionFlowValidationDetails?
      duplicateConditionExpression;

  /// Details about duplicate connections between nodes.
  final DuplicateConnectionsFlowValidationDetails? duplicateConnections;

  /// Details about incompatible data types in a connection.
  final IncompatibleConnectionDataTypeFlowValidationDetails?
      incompatibleConnectionDataType;

  /// Details about a flow that includes connections that violate loop boundary
  /// rules.
  final InvalidLoopBoundaryFlowValidationDetails? invalidLoopBoundary;

  /// Details about a flow that includes incompatible node types in a DoWhile
  /// loop.
  final LoopIncompatibleNodeTypeFlowValidationDetails? loopIncompatibleNodeType;

  /// Details about a malformed condition expression in a node.
  final MalformedConditionExpressionFlowValidationDetails?
      malformedConditionExpression;

  /// Details about a malformed input expression in a node.
  final MalformedNodeInputExpressionFlowValidationDetails?
      malformedNodeInputExpression;

  /// Details about mismatched input data types in a node.
  final MismatchedNodeInputTypeFlowValidationDetails? mismatchedNodeInputType;

  /// Details about mismatched output data types in a node.
  final MismatchedNodeOutputTypeFlowValidationDetails? mismatchedNodeOutputType;

  /// Details about missing configuration for a connection.
  final MissingConnectionConfigurationFlowValidationDetails?
      missingConnectionConfiguration;

  /// Details about a missing default condition in a conditional node.
  final MissingDefaultConditionFlowValidationDetails? missingDefaultCondition;

  /// Details about missing ending nodes in the flow.
  final MissingEndingNodesFlowValidationDetails? missingEndingNodes;

  /// Details about a flow that's missing a required <code>LoopController</code>
  /// node in a DoWhile loop.
  final MissingLoopControllerNodeFlowValidationDetails?
      missingLoopControllerNode;

  /// Details about a flow that's missing a required <code>LoopInput</code> node
  /// in a DoWhile loop.
  final MissingLoopInputNodeFlowValidationDetails? missingLoopInputNode;

  /// Details about missing configuration for a node.
  final MissingNodeConfigurationFlowValidationDetails? missingNodeConfiguration;

  /// Details about a missing required input in a node.
  final MissingNodeInputFlowValidationDetails? missingNodeInput;

  /// Details about a missing required output in a node.
  final MissingNodeOutputFlowValidationDetails? missingNodeOutput;

  /// Details about missing starting nodes in the flow.
  final MissingStartingNodesFlowValidationDetails? missingStartingNodes;

  /// Details about a flow that contains multiple <code>LoopController</code>
  /// nodes in a DoWhile loop.
  final MultipleLoopControllerNodesFlowValidationDetails?
      multipleLoopControllerNodes;

  /// Details about a flow that contains multiple <code>LoopInput</code> nodes in
  /// a DoWhile loop.
  final MultipleLoopInputNodesFlowValidationDetails? multipleLoopInputNodes;

  /// Details about multiple connections to a single node input.
  final MultipleNodeInputConnectionsFlowValidationDetails?
      multipleNodeInputConnections;

  /// Details about an unfulfilled node input with no valid connections.
  final UnfulfilledNodeInputFlowValidationDetails? unfulfilledNodeInput;

  /// Details about an unknown condition for a connection.
  final UnknownConnectionConditionFlowValidationDetails?
      unknownConnectionCondition;

  /// Details about an unknown source node for a connection.
  final UnknownConnectionSourceFlowValidationDetails? unknownConnectionSource;

  /// Details about an unknown source output for a connection.
  final UnknownConnectionSourceOutputFlowValidationDetails?
      unknownConnectionSourceOutput;

  /// Details about an unknown target node for a connection.
  final UnknownConnectionTargetFlowValidationDetails? unknownConnectionTarget;

  /// Details about an unknown target input for a connection.
  final UnknownConnectionTargetInputFlowValidationDetails?
      unknownConnectionTargetInput;

  /// Details about an unknown input for a node.
  final UnknownNodeInputFlowValidationDetails? unknownNodeInput;

  /// Details about an unknown output for a node.
  final UnknownNodeOutputFlowValidationDetails? unknownNodeOutput;

  /// Details about an unreachable node in the flow.
  final UnreachableNodeFlowValidationDetails? unreachableNode;

  /// Details about unsatisfied conditions for a connection.
  final UnsatisfiedConnectionConditionsFlowValidationDetails?
      unsatisfiedConnectionConditions;

  /// Details about an unspecified validation.
  final UnspecifiedFlowValidationDetails? unspecified;

  FlowValidationDetails({
    this.cyclicConnection,
    this.duplicateConditionExpression,
    this.duplicateConnections,
    this.incompatibleConnectionDataType,
    this.invalidLoopBoundary,
    this.loopIncompatibleNodeType,
    this.malformedConditionExpression,
    this.malformedNodeInputExpression,
    this.mismatchedNodeInputType,
    this.mismatchedNodeOutputType,
    this.missingConnectionConfiguration,
    this.missingDefaultCondition,
    this.missingEndingNodes,
    this.missingLoopControllerNode,
    this.missingLoopInputNode,
    this.missingNodeConfiguration,
    this.missingNodeInput,
    this.missingNodeOutput,
    this.missingStartingNodes,
    this.multipleLoopControllerNodes,
    this.multipleLoopInputNodes,
    this.multipleNodeInputConnections,
    this.unfulfilledNodeInput,
    this.unknownConnectionCondition,
    this.unknownConnectionSource,
    this.unknownConnectionSourceOutput,
    this.unknownConnectionTarget,
    this.unknownConnectionTargetInput,
    this.unknownNodeInput,
    this.unknownNodeOutput,
    this.unreachableNode,
    this.unsatisfiedConnectionConditions,
    this.unspecified,
  });

  factory FlowValidationDetails.fromJson(Map<String, dynamic> json) {
    return FlowValidationDetails(
      cyclicConnection: json['cyclicConnection'] != null
          ? CyclicConnectionFlowValidationDetails.fromJson(
              json['cyclicConnection'] as Map<String, dynamic>)
          : null,
      duplicateConditionExpression: json['duplicateConditionExpression'] != null
          ? DuplicateConditionExpressionFlowValidationDetails.fromJson(
              json['duplicateConditionExpression'] as Map<String, dynamic>)
          : null,
      duplicateConnections: json['duplicateConnections'] != null
          ? DuplicateConnectionsFlowValidationDetails.fromJson(
              json['duplicateConnections'] as Map<String, dynamic>)
          : null,
      incompatibleConnectionDataType: json['incompatibleConnectionDataType'] !=
              null
          ? IncompatibleConnectionDataTypeFlowValidationDetails.fromJson(
              json['incompatibleConnectionDataType'] as Map<String, dynamic>)
          : null,
      invalidLoopBoundary: json['invalidLoopBoundary'] != null
          ? InvalidLoopBoundaryFlowValidationDetails.fromJson(
              json['invalidLoopBoundary'] as Map<String, dynamic>)
          : null,
      loopIncompatibleNodeType: json['loopIncompatibleNodeType'] != null
          ? LoopIncompatibleNodeTypeFlowValidationDetails.fromJson(
              json['loopIncompatibleNodeType'] as Map<String, dynamic>)
          : null,
      malformedConditionExpression: json['malformedConditionExpression'] != null
          ? MalformedConditionExpressionFlowValidationDetails.fromJson(
              json['malformedConditionExpression'] as Map<String, dynamic>)
          : null,
      malformedNodeInputExpression: json['malformedNodeInputExpression'] != null
          ? MalformedNodeInputExpressionFlowValidationDetails.fromJson(
              json['malformedNodeInputExpression'] as Map<String, dynamic>)
          : null,
      mismatchedNodeInputType: json['mismatchedNodeInputType'] != null
          ? MismatchedNodeInputTypeFlowValidationDetails.fromJson(
              json['mismatchedNodeInputType'] as Map<String, dynamic>)
          : null,
      mismatchedNodeOutputType: json['mismatchedNodeOutputType'] != null
          ? MismatchedNodeOutputTypeFlowValidationDetails.fromJson(
              json['mismatchedNodeOutputType'] as Map<String, dynamic>)
          : null,
      missingConnectionConfiguration: json['missingConnectionConfiguration'] !=
              null
          ? MissingConnectionConfigurationFlowValidationDetails.fromJson(
              json['missingConnectionConfiguration'] as Map<String, dynamic>)
          : null,
      missingDefaultCondition: json['missingDefaultCondition'] != null
          ? MissingDefaultConditionFlowValidationDetails.fromJson(
              json['missingDefaultCondition'] as Map<String, dynamic>)
          : null,
      missingEndingNodes: json['missingEndingNodes'] != null
          ? MissingEndingNodesFlowValidationDetails.fromJson(
              json['missingEndingNodes'] as Map<String, dynamic>)
          : null,
      missingLoopControllerNode: json['missingLoopControllerNode'] != null
          ? MissingLoopControllerNodeFlowValidationDetails.fromJson(
              json['missingLoopControllerNode'] as Map<String, dynamic>)
          : null,
      missingLoopInputNode: json['missingLoopInputNode'] != null
          ? MissingLoopInputNodeFlowValidationDetails.fromJson(
              json['missingLoopInputNode'] as Map<String, dynamic>)
          : null,
      missingNodeConfiguration: json['missingNodeConfiguration'] != null
          ? MissingNodeConfigurationFlowValidationDetails.fromJson(
              json['missingNodeConfiguration'] as Map<String, dynamic>)
          : null,
      missingNodeInput: json['missingNodeInput'] != null
          ? MissingNodeInputFlowValidationDetails.fromJson(
              json['missingNodeInput'] as Map<String, dynamic>)
          : null,
      missingNodeOutput: json['missingNodeOutput'] != null
          ? MissingNodeOutputFlowValidationDetails.fromJson(
              json['missingNodeOutput'] as Map<String, dynamic>)
          : null,
      missingStartingNodes: json['missingStartingNodes'] != null
          ? MissingStartingNodesFlowValidationDetails.fromJson(
              json['missingStartingNodes'] as Map<String, dynamic>)
          : null,
      multipleLoopControllerNodes: json['multipleLoopControllerNodes'] != null
          ? MultipleLoopControllerNodesFlowValidationDetails.fromJson(
              json['multipleLoopControllerNodes'] as Map<String, dynamic>)
          : null,
      multipleLoopInputNodes: json['multipleLoopInputNodes'] != null
          ? MultipleLoopInputNodesFlowValidationDetails.fromJson(
              json['multipleLoopInputNodes'] as Map<String, dynamic>)
          : null,
      multipleNodeInputConnections: json['multipleNodeInputConnections'] != null
          ? MultipleNodeInputConnectionsFlowValidationDetails.fromJson(
              json['multipleNodeInputConnections'] as Map<String, dynamic>)
          : null,
      unfulfilledNodeInput: json['unfulfilledNodeInput'] != null
          ? UnfulfilledNodeInputFlowValidationDetails.fromJson(
              json['unfulfilledNodeInput'] as Map<String, dynamic>)
          : null,
      unknownConnectionCondition: json['unknownConnectionCondition'] != null
          ? UnknownConnectionConditionFlowValidationDetails.fromJson(
              json['unknownConnectionCondition'] as Map<String, dynamic>)
          : null,
      unknownConnectionSource: json['unknownConnectionSource'] != null
          ? UnknownConnectionSourceFlowValidationDetails.fromJson(
              json['unknownConnectionSource'] as Map<String, dynamic>)
          : null,
      unknownConnectionSourceOutput:
          json['unknownConnectionSourceOutput'] != null
              ? UnknownConnectionSourceOutputFlowValidationDetails.fromJson(
                  json['unknownConnectionSourceOutput'] as Map<String, dynamic>)
              : null,
      unknownConnectionTarget: json['unknownConnectionTarget'] != null
          ? UnknownConnectionTargetFlowValidationDetails.fromJson(
              json['unknownConnectionTarget'] as Map<String, dynamic>)
          : null,
      unknownConnectionTargetInput: json['unknownConnectionTargetInput'] != null
          ? UnknownConnectionTargetInputFlowValidationDetails.fromJson(
              json['unknownConnectionTargetInput'] as Map<String, dynamic>)
          : null,
      unknownNodeInput: json['unknownNodeInput'] != null
          ? UnknownNodeInputFlowValidationDetails.fromJson(
              json['unknownNodeInput'] as Map<String, dynamic>)
          : null,
      unknownNodeOutput: json['unknownNodeOutput'] != null
          ? UnknownNodeOutputFlowValidationDetails.fromJson(
              json['unknownNodeOutput'] as Map<String, dynamic>)
          : null,
      unreachableNode: json['unreachableNode'] != null
          ? UnreachableNodeFlowValidationDetails.fromJson(
              json['unreachableNode'] as Map<String, dynamic>)
          : null,
      unsatisfiedConnectionConditions:
          json['unsatisfiedConnectionConditions'] != null
              ? UnsatisfiedConnectionConditionsFlowValidationDetails.fromJson(
                  json['unsatisfiedConnectionConditions']
                      as Map<String, dynamic>)
              : null,
      unspecified: json['unspecified'] != null
          ? UnspecifiedFlowValidationDetails.fromJson(
              json['unspecified'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cyclicConnection = this.cyclicConnection;
    final duplicateConditionExpression = this.duplicateConditionExpression;
    final duplicateConnections = this.duplicateConnections;
    final incompatibleConnectionDataType = this.incompatibleConnectionDataType;
    final invalidLoopBoundary = this.invalidLoopBoundary;
    final loopIncompatibleNodeType = this.loopIncompatibleNodeType;
    final malformedConditionExpression = this.malformedConditionExpression;
    final malformedNodeInputExpression = this.malformedNodeInputExpression;
    final mismatchedNodeInputType = this.mismatchedNodeInputType;
    final mismatchedNodeOutputType = this.mismatchedNodeOutputType;
    final missingConnectionConfiguration = this.missingConnectionConfiguration;
    final missingDefaultCondition = this.missingDefaultCondition;
    final missingEndingNodes = this.missingEndingNodes;
    final missingLoopControllerNode = this.missingLoopControllerNode;
    final missingLoopInputNode = this.missingLoopInputNode;
    final missingNodeConfiguration = this.missingNodeConfiguration;
    final missingNodeInput = this.missingNodeInput;
    final missingNodeOutput = this.missingNodeOutput;
    final missingStartingNodes = this.missingStartingNodes;
    final multipleLoopControllerNodes = this.multipleLoopControllerNodes;
    final multipleLoopInputNodes = this.multipleLoopInputNodes;
    final multipleNodeInputConnections = this.multipleNodeInputConnections;
    final unfulfilledNodeInput = this.unfulfilledNodeInput;
    final unknownConnectionCondition = this.unknownConnectionCondition;
    final unknownConnectionSource = this.unknownConnectionSource;
    final unknownConnectionSourceOutput = this.unknownConnectionSourceOutput;
    final unknownConnectionTarget = this.unknownConnectionTarget;
    final unknownConnectionTargetInput = this.unknownConnectionTargetInput;
    final unknownNodeInput = this.unknownNodeInput;
    final unknownNodeOutput = this.unknownNodeOutput;
    final unreachableNode = this.unreachableNode;
    final unsatisfiedConnectionConditions =
        this.unsatisfiedConnectionConditions;
    final unspecified = this.unspecified;
    return {
      if (cyclicConnection != null) 'cyclicConnection': cyclicConnection,
      if (duplicateConditionExpression != null)
        'duplicateConditionExpression': duplicateConditionExpression,
      if (duplicateConnections != null)
        'duplicateConnections': duplicateConnections,
      if (incompatibleConnectionDataType != null)
        'incompatibleConnectionDataType': incompatibleConnectionDataType,
      if (invalidLoopBoundary != null)
        'invalidLoopBoundary': invalidLoopBoundary,
      if (loopIncompatibleNodeType != null)
        'loopIncompatibleNodeType': loopIncompatibleNodeType,
      if (malformedConditionExpression != null)
        'malformedConditionExpression': malformedConditionExpression,
      if (malformedNodeInputExpression != null)
        'malformedNodeInputExpression': malformedNodeInputExpression,
      if (mismatchedNodeInputType != null)
        'mismatchedNodeInputType': mismatchedNodeInputType,
      if (mismatchedNodeOutputType != null)
        'mismatchedNodeOutputType': mismatchedNodeOutputType,
      if (missingConnectionConfiguration != null)
        'missingConnectionConfiguration': missingConnectionConfiguration,
      if (missingDefaultCondition != null)
        'missingDefaultCondition': missingDefaultCondition,
      if (missingEndingNodes != null) 'missingEndingNodes': missingEndingNodes,
      if (missingLoopControllerNode != null)
        'missingLoopControllerNode': missingLoopControllerNode,
      if (missingLoopInputNode != null)
        'missingLoopInputNode': missingLoopInputNode,
      if (missingNodeConfiguration != null)
        'missingNodeConfiguration': missingNodeConfiguration,
      if (missingNodeInput != null) 'missingNodeInput': missingNodeInput,
      if (missingNodeOutput != null) 'missingNodeOutput': missingNodeOutput,
      if (missingStartingNodes != null)
        'missingStartingNodes': missingStartingNodes,
      if (multipleLoopControllerNodes != null)
        'multipleLoopControllerNodes': multipleLoopControllerNodes,
      if (multipleLoopInputNodes != null)
        'multipleLoopInputNodes': multipleLoopInputNodes,
      if (multipleNodeInputConnections != null)
        'multipleNodeInputConnections': multipleNodeInputConnections,
      if (unfulfilledNodeInput != null)
        'unfulfilledNodeInput': unfulfilledNodeInput,
      if (unknownConnectionCondition != null)
        'unknownConnectionCondition': unknownConnectionCondition,
      if (unknownConnectionSource != null)
        'unknownConnectionSource': unknownConnectionSource,
      if (unknownConnectionSourceOutput != null)
        'unknownConnectionSourceOutput': unknownConnectionSourceOutput,
      if (unknownConnectionTarget != null)
        'unknownConnectionTarget': unknownConnectionTarget,
      if (unknownConnectionTargetInput != null)
        'unknownConnectionTargetInput': unknownConnectionTargetInput,
      if (unknownNodeInput != null) 'unknownNodeInput': unknownNodeInput,
      if (unknownNodeOutput != null) 'unknownNodeOutput': unknownNodeOutput,
      if (unreachableNode != null) 'unreachableNode': unreachableNode,
      if (unsatisfiedConnectionConditions != null)
        'unsatisfiedConnectionConditions': unsatisfiedConnectionConditions,
      if (unspecified != null) 'unspecified': unspecified,
    };
  }
}

class FlowValidationType {
  static const cyclicConnection = FlowValidationType._('CyclicConnection');
  static const duplicateConnections =
      FlowValidationType._('DuplicateConnections');
  static const duplicateConditionExpression =
      FlowValidationType._('DuplicateConditionExpression');
  static const unreachableNode = FlowValidationType._('UnreachableNode');
  static const unknownConnectionSource =
      FlowValidationType._('UnknownConnectionSource');
  static const unknownConnectionSourceOutput =
      FlowValidationType._('UnknownConnectionSourceOutput');
  static const unknownConnectionTarget =
      FlowValidationType._('UnknownConnectionTarget');
  static const unknownConnectionTargetInput =
      FlowValidationType._('UnknownConnectionTargetInput');
  static const unknownConnectionCondition =
      FlowValidationType._('UnknownConnectionCondition');
  static const malformedConditionExpression =
      FlowValidationType._('MalformedConditionExpression');
  static const malformedNodeInputExpression =
      FlowValidationType._('MalformedNodeInputExpression');
  static const mismatchedNodeInputType =
      FlowValidationType._('MismatchedNodeInputType');
  static const mismatchedNodeOutputType =
      FlowValidationType._('MismatchedNodeOutputType');
  static const incompatibleConnectionDataType =
      FlowValidationType._('IncompatibleConnectionDataType');
  static const missingConnectionConfiguration =
      FlowValidationType._('MissingConnectionConfiguration');
  static const missingDefaultCondition =
      FlowValidationType._('MissingDefaultCondition');
  static const missingEndingNodes = FlowValidationType._('MissingEndingNodes');
  static const missingNodeConfiguration =
      FlowValidationType._('MissingNodeConfiguration');
  static const missingNodeInput = FlowValidationType._('MissingNodeInput');
  static const missingNodeOutput = FlowValidationType._('MissingNodeOutput');
  static const missingStartingNodes =
      FlowValidationType._('MissingStartingNodes');
  static const multipleNodeInputConnections =
      FlowValidationType._('MultipleNodeInputConnections');
  static const unfulfilledNodeInput =
      FlowValidationType._('UnfulfilledNodeInput');
  static const unsatisfiedConnectionConditions =
      FlowValidationType._('UnsatisfiedConnectionConditions');
  static const unspecified = FlowValidationType._('Unspecified');
  static const unknownNodeInput = FlowValidationType._('UnknownNodeInput');
  static const unknownNodeOutput = FlowValidationType._('UnknownNodeOutput');
  static const missingLoopInputNode =
      FlowValidationType._('MissingLoopInputNode');
  static const missingLoopControllerNode =
      FlowValidationType._('MissingLoopControllerNode');
  static const multipleLoopInputNodes =
      FlowValidationType._('MultipleLoopInputNodes');
  static const multipleLoopControllerNodes =
      FlowValidationType._('MultipleLoopControllerNodes');
  static const loopIncompatibleNodeType =
      FlowValidationType._('LoopIncompatibleNodeType');
  static const invalidLoopBoundary =
      FlowValidationType._('InvalidLoopBoundary');

  final String value;

  const FlowValidationType._(this.value);

  static const values = [
    cyclicConnection,
    duplicateConnections,
    duplicateConditionExpression,
    unreachableNode,
    unknownConnectionSource,
    unknownConnectionSourceOutput,
    unknownConnectionTarget,
    unknownConnectionTargetInput,
    unknownConnectionCondition,
    malformedConditionExpression,
    malformedNodeInputExpression,
    mismatchedNodeInputType,
    mismatchedNodeOutputType,
    incompatibleConnectionDataType,
    missingConnectionConfiguration,
    missingDefaultCondition,
    missingEndingNodes,
    missingNodeConfiguration,
    missingNodeInput,
    missingNodeOutput,
    missingStartingNodes,
    multipleNodeInputConnections,
    unfulfilledNodeInput,
    unsatisfiedConnectionConditions,
    unspecified,
    unknownNodeInput,
    unknownNodeOutput,
    missingLoopInputNode,
    missingLoopControllerNode,
    multipleLoopInputNodes,
    multipleLoopControllerNodes,
    loopIncompatibleNodeType,
    invalidLoopBoundary
  ];

  static FlowValidationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FlowValidationType._(value));

  @override
  bool operator ==(other) =>
      other is FlowValidationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about a cyclic connection detected in the flow.
class CyclicConnectionFlowValidationDetails {
  /// The name of the connection that causes the cycle in the flow.
  final String connection;

  CyclicConnectionFlowValidationDetails({
    required this.connection,
  });

  factory CyclicConnectionFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return CyclicConnectionFlowValidationDetails(
      connection: (json['connection'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      'connection': connection,
    };
  }
}

/// Details about duplicate connections found between two nodes in the flow.
class DuplicateConnectionsFlowValidationDetails {
  /// The name of the source node where the duplicate connection starts.
  final String source;

  /// The name of the target node where the duplicate connection ends.
  final String target;

  DuplicateConnectionsFlowValidationDetails({
    required this.source,
    required this.target,
  });

  factory DuplicateConnectionsFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return DuplicateConnectionsFlowValidationDetails(
      source: (json['source'] as String?) ?? '',
      target: (json['target'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    final target = this.target;
    return {
      'source': source,
      'target': target,
    };
  }
}

/// Details about duplicate condition expressions found in a condition node.
class DuplicateConditionExpressionFlowValidationDetails {
  /// The duplicated condition expression.
  final String expression;

  /// The name of the node containing the duplicate condition expressions.
  final String node;

  DuplicateConditionExpressionFlowValidationDetails({
    required this.expression,
    required this.node,
  });

  factory DuplicateConditionExpressionFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return DuplicateConditionExpressionFlowValidationDetails(
      expression: (json['expression'] as String?) ?? '',
      node: (json['node'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final node = this.node;
    return {
      'expression': expression,
      'node': node,
    };
  }
}

/// Details about an unreachable node in the flow. A node is unreachable when
/// there are no paths to it from any starting node.
class UnreachableNodeFlowValidationDetails {
  /// The name of the unreachable node.
  final String node;

  UnreachableNodeFlowValidationDetails({
    required this.node,
  });

  factory UnreachableNodeFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return UnreachableNodeFlowValidationDetails(
      node: (json['node'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final node = this.node;
    return {
      'node': node,
    };
  }
}

/// Details about an unknown source node for a connection.
class UnknownConnectionSourceFlowValidationDetails {
  /// The name of the connection with the unknown source.
  final String connection;

  UnknownConnectionSourceFlowValidationDetails({
    required this.connection,
  });

  factory UnknownConnectionSourceFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return UnknownConnectionSourceFlowValidationDetails(
      connection: (json['connection'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      'connection': connection,
    };
  }
}

/// Details about an unknown source output for a connection.
class UnknownConnectionSourceOutputFlowValidationDetails {
  /// The name of the connection with the unknown source output.
  final String connection;

  UnknownConnectionSourceOutputFlowValidationDetails({
    required this.connection,
  });

  factory UnknownConnectionSourceOutputFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return UnknownConnectionSourceOutputFlowValidationDetails(
      connection: (json['connection'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      'connection': connection,
    };
  }
}

/// Details about an unknown target node for a connection.
class UnknownConnectionTargetFlowValidationDetails {
  /// The name of the connection with the unknown target.
  final String connection;

  UnknownConnectionTargetFlowValidationDetails({
    required this.connection,
  });

  factory UnknownConnectionTargetFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return UnknownConnectionTargetFlowValidationDetails(
      connection: (json['connection'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      'connection': connection,
    };
  }
}

/// Details about an unknown target input for a connection.
class UnknownConnectionTargetInputFlowValidationDetails {
  /// The name of the connection with the unknown target input.
  final String connection;

  UnknownConnectionTargetInputFlowValidationDetails({
    required this.connection,
  });

  factory UnknownConnectionTargetInputFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return UnknownConnectionTargetInputFlowValidationDetails(
      connection: (json['connection'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      'connection': connection,
    };
  }
}

/// Details about an unknown condition for a connection.
class UnknownConnectionConditionFlowValidationDetails {
  /// The name of the connection with the unknown condition.
  final String connection;

  UnknownConnectionConditionFlowValidationDetails({
    required this.connection,
  });

  factory UnknownConnectionConditionFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return UnknownConnectionConditionFlowValidationDetails(
      connection: (json['connection'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      'connection': connection,
    };
  }
}

/// Details about a malformed condition expression in a node.
class MalformedConditionExpressionFlowValidationDetails {
  /// The error message describing why the condition expression is malformed.
  final String cause;

  /// The name of the malformed condition.
  final String condition;

  /// The name of the node containing the malformed condition expression.
  final String node;

  MalformedConditionExpressionFlowValidationDetails({
    required this.cause,
    required this.condition,
    required this.node,
  });

  factory MalformedConditionExpressionFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return MalformedConditionExpressionFlowValidationDetails(
      cause: (json['cause'] as String?) ?? '',
      condition: (json['condition'] as String?) ?? '',
      node: (json['node'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final cause = this.cause;
    final condition = this.condition;
    final node = this.node;
    return {
      'cause': cause,
      'condition': condition,
      'node': node,
    };
  }
}

/// Details about a malformed input expression in a node.
class MalformedNodeInputExpressionFlowValidationDetails {
  /// The error message describing why the input expression is malformed.
  final String cause;

  /// The name of the input with the malformed expression.
  final String input;

  /// The name of the node containing the malformed input expression.
  final String node;

  MalformedNodeInputExpressionFlowValidationDetails({
    required this.cause,
    required this.input,
    required this.node,
  });

  factory MalformedNodeInputExpressionFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return MalformedNodeInputExpressionFlowValidationDetails(
      cause: (json['cause'] as String?) ?? '',
      input: (json['input'] as String?) ?? '',
      node: (json['node'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final cause = this.cause;
    final input = this.input;
    final node = this.node;
    return {
      'cause': cause,
      'input': input,
      'node': node,
    };
  }
}

/// Details about mismatched input data types in a node.
class MismatchedNodeInputTypeFlowValidationDetails {
  /// The expected data type for the node input.
  final FlowNodeIODataType expectedType;

  /// The name of the input with the mismatched data type.
  final String input;

  /// The name of the node containing the input with the mismatched data type.
  final String node;

  MismatchedNodeInputTypeFlowValidationDetails({
    required this.expectedType,
    required this.input,
    required this.node,
  });

  factory MismatchedNodeInputTypeFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return MismatchedNodeInputTypeFlowValidationDetails(
      expectedType: FlowNodeIODataType.fromString(
          (json['expectedType'] as String?) ?? ''),
      input: (json['input'] as String?) ?? '',
      node: (json['node'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final expectedType = this.expectedType;
    final input = this.input;
    final node = this.node;
    return {
      'expectedType': expectedType.value,
      'input': input,
      'node': node,
    };
  }
}

/// Details about mismatched output data types in a node.
class MismatchedNodeOutputTypeFlowValidationDetails {
  /// The expected data type for the node output.
  final FlowNodeIODataType expectedType;

  /// The name of the node containing the output with the mismatched data type.
  final String node;

  /// The name of the output with the mismatched data type.
  final String output;

  MismatchedNodeOutputTypeFlowValidationDetails({
    required this.expectedType,
    required this.node,
    required this.output,
  });

  factory MismatchedNodeOutputTypeFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return MismatchedNodeOutputTypeFlowValidationDetails(
      expectedType: FlowNodeIODataType.fromString(
          (json['expectedType'] as String?) ?? ''),
      node: (json['node'] as String?) ?? '',
      output: (json['output'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final expectedType = this.expectedType;
    final node = this.node;
    final output = this.output;
    return {
      'expectedType': expectedType.value,
      'node': node,
      'output': output,
    };
  }
}

/// Details about incompatible data types in a connection between nodes.
class IncompatibleConnectionDataTypeFlowValidationDetails {
  /// The name of the connection with incompatible data types.
  final String connection;

  IncompatibleConnectionDataTypeFlowValidationDetails({
    required this.connection,
  });

  factory IncompatibleConnectionDataTypeFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return IncompatibleConnectionDataTypeFlowValidationDetails(
      connection: (json['connection'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      'connection': connection,
    };
  }
}

/// Details about a connection missing required configuration.
class MissingConnectionConfigurationFlowValidationDetails {
  /// The name of the connection missing configuration.
  final String connection;

  MissingConnectionConfigurationFlowValidationDetails({
    required this.connection,
  });

  factory MissingConnectionConfigurationFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return MissingConnectionConfigurationFlowValidationDetails(
      connection: (json['connection'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      'connection': connection,
    };
  }
}

/// Details about a missing default condition in a conditional node.
class MissingDefaultConditionFlowValidationDetails {
  /// The name of the node missing the default condition.
  final String node;

  MissingDefaultConditionFlowValidationDetails({
    required this.node,
  });

  factory MissingDefaultConditionFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return MissingDefaultConditionFlowValidationDetails(
      node: (json['node'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final node = this.node;
    return {
      'node': node,
    };
  }
}

/// Details about missing ending nodes (such as FlowOutputNode) in the flow.
class MissingEndingNodesFlowValidationDetails {
  MissingEndingNodesFlowValidationDetails();

  factory MissingEndingNodesFlowValidationDetails.fromJson(
      Map<String, dynamic> _) {
    return MissingEndingNodesFlowValidationDetails();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Details about a node missing a required configuration.
class MissingNodeConfigurationFlowValidationDetails {
  /// The name of the node missing a required configuration.
  final String node;

  MissingNodeConfigurationFlowValidationDetails({
    required this.node,
  });

  factory MissingNodeConfigurationFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return MissingNodeConfigurationFlowValidationDetails(
      node: (json['node'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final node = this.node;
    return {
      'node': node,
    };
  }
}

/// Details about a missing required input in a node.
class MissingNodeInputFlowValidationDetails {
  /// The name of the missing input.
  final String input;

  /// The name of the node missing the required input.
  final String node;

  MissingNodeInputFlowValidationDetails({
    required this.input,
    required this.node,
  });

  factory MissingNodeInputFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return MissingNodeInputFlowValidationDetails(
      input: (json['input'] as String?) ?? '',
      node: (json['node'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final input = this.input;
    final node = this.node;
    return {
      'input': input,
      'node': node,
    };
  }
}

/// Details about a missing required output in a node.
class MissingNodeOutputFlowValidationDetails {
  /// The name of the node missing the required output.
  final String node;

  /// The name of the missing output.
  final String output;

  MissingNodeOutputFlowValidationDetails({
    required this.node,
    required this.output,
  });

  factory MissingNodeOutputFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return MissingNodeOutputFlowValidationDetails(
      node: (json['node'] as String?) ?? '',
      output: (json['output'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final node = this.node;
    final output = this.output;
    return {
      'node': node,
      'output': output,
    };
  }
}

/// Details about missing starting nodes (such as FlowInputNode) in the flow.
class MissingStartingNodesFlowValidationDetails {
  MissingStartingNodesFlowValidationDetails();

  factory MissingStartingNodesFlowValidationDetails.fromJson(
      Map<String, dynamic> _) {
    return MissingStartingNodesFlowValidationDetails();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Details about multiple connections to a single node input.
class MultipleNodeInputConnectionsFlowValidationDetails {
  /// The name of the input with multiple connections to it.
  final String input;

  /// The name of the node containing the input with multiple connections.
  final String node;

  MultipleNodeInputConnectionsFlowValidationDetails({
    required this.input,
    required this.node,
  });

  factory MultipleNodeInputConnectionsFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return MultipleNodeInputConnectionsFlowValidationDetails(
      input: (json['input'] as String?) ?? '',
      node: (json['node'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final input = this.input;
    final node = this.node;
    return {
      'input': input,
      'node': node,
    };
  }
}

/// Details about an unfulfilled node input with no valid connections.
class UnfulfilledNodeInputFlowValidationDetails {
  /// The name of the unfulfilled input. An input is unfulfilled if there are no
  /// data connections to it.
  final String input;

  /// The name of the node containing the unfulfilled input.
  final String node;

  UnfulfilledNodeInputFlowValidationDetails({
    required this.input,
    required this.node,
  });

  factory UnfulfilledNodeInputFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return UnfulfilledNodeInputFlowValidationDetails(
      input: (json['input'] as String?) ?? '',
      node: (json['node'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final input = this.input;
    final node = this.node;
    return {
      'input': input,
      'node': node,
    };
  }
}

/// Details about unsatisfied conditions for a connection. A condition is
/// unsatisfied if it can never be true, for example two branches of condition
/// node cannot be simultaneously true.
class UnsatisfiedConnectionConditionsFlowValidationDetails {
  /// The name of the connection with unsatisfied conditions.
  final String connection;

  UnsatisfiedConnectionConditionsFlowValidationDetails({
    required this.connection,
  });

  factory UnsatisfiedConnectionConditionsFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return UnsatisfiedConnectionConditionsFlowValidationDetails(
      connection: (json['connection'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      'connection': connection,
    };
  }
}

/// Details about an unspecified validation that doesn't fit other categories.
class UnspecifiedFlowValidationDetails {
  UnspecifiedFlowValidationDetails();

  factory UnspecifiedFlowValidationDetails.fromJson(Map<String, dynamic> _) {
    return UnspecifiedFlowValidationDetails();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Details about an unknown input for a node.
class UnknownNodeInputFlowValidationDetails {
  /// The name of the node with the unknown input.
  final String input;

  /// The name of the unknown input.
  final String node;

  UnknownNodeInputFlowValidationDetails({
    required this.input,
    required this.node,
  });

  factory UnknownNodeInputFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return UnknownNodeInputFlowValidationDetails(
      input: (json['input'] as String?) ?? '',
      node: (json['node'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final input = this.input;
    final node = this.node;
    return {
      'input': input,
      'node': node,
    };
  }
}

/// Details about an unknown output for a node.
class UnknownNodeOutputFlowValidationDetails {
  /// The name of the node with the unknown output.
  final String node;

  /// The name of the unknown output.
  final String output;

  UnknownNodeOutputFlowValidationDetails({
    required this.node,
    required this.output,
  });

  factory UnknownNodeOutputFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return UnknownNodeOutputFlowValidationDetails(
      node: (json['node'] as String?) ?? '',
      output: (json['output'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final node = this.node;
    final output = this.output;
    return {
      'node': node,
      'output': output,
    };
  }
}

/// Details about a flow that's missing a required <code>LoopInput</code> node
/// in a DoWhile loop.
class MissingLoopInputNodeFlowValidationDetails {
  /// The DoWhile loop in a flow that's missing a required <code>LoopInput</code>
  /// node.
  final String loopNode;

  MissingLoopInputNodeFlowValidationDetails({
    required this.loopNode,
  });

  factory MissingLoopInputNodeFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return MissingLoopInputNodeFlowValidationDetails(
      loopNode: (json['loopNode'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final loopNode = this.loopNode;
    return {
      'loopNode': loopNode,
    };
  }
}

/// Details about a flow that's missing a required <code>LoopController</code>
/// node in a DoWhile loop.
class MissingLoopControllerNodeFlowValidationDetails {
  /// The DoWhile loop in a flow that's missing a required
  /// <code>LoopController</code> node.
  final String loopNode;

  MissingLoopControllerNodeFlowValidationDetails({
    required this.loopNode,
  });

  factory MissingLoopControllerNodeFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return MissingLoopControllerNodeFlowValidationDetails(
      loopNode: (json['loopNode'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final loopNode = this.loopNode;
    return {
      'loopNode': loopNode,
    };
  }
}

/// Details about a flow that contains multiple <code>LoopInput</code> nodes in
/// a DoWhile loop.
class MultipleLoopInputNodesFlowValidationDetails {
  /// The DoWhile loop in a flow that contains multiple <code>LoopInput</code>
  /// nodes.
  final String loopNode;

  MultipleLoopInputNodesFlowValidationDetails({
    required this.loopNode,
  });

  factory MultipleLoopInputNodesFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return MultipleLoopInputNodesFlowValidationDetails(
      loopNode: (json['loopNode'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final loopNode = this.loopNode;
    return {
      'loopNode': loopNode,
    };
  }
}

/// Details about a flow that contains multiple <code>LoopController</code>
/// nodes in a DoWhile loop.
class MultipleLoopControllerNodesFlowValidationDetails {
  /// The DoWhile loop in a flow that contains multiple
  /// <code>LoopController</code> nodes.
  final String loopNode;

  MultipleLoopControllerNodesFlowValidationDetails({
    required this.loopNode,
  });

  factory MultipleLoopControllerNodesFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return MultipleLoopControllerNodesFlowValidationDetails(
      loopNode: (json['loopNode'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final loopNode = this.loopNode;
    return {
      'loopNode': loopNode,
    };
  }
}

/// Details about a flow that contains an incompatible node in a DoWhile loop.
class LoopIncompatibleNodeTypeFlowValidationDetails {
  /// The node that's incompatible in the DoWhile loop.
  final String incompatibleNodeName;

  /// The node type of the incompatible node in the DoWhile loop. Some node types,
  /// like a condition node, aren't allowed in a DoWhile loop.
  final IncompatibleLoopNodeType incompatibleNodeType;

  /// The <code>Loop</code> container node that contains an incompatible node.
  final String node;

  LoopIncompatibleNodeTypeFlowValidationDetails({
    required this.incompatibleNodeName,
    required this.incompatibleNodeType,
    required this.node,
  });

  factory LoopIncompatibleNodeTypeFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return LoopIncompatibleNodeTypeFlowValidationDetails(
      incompatibleNodeName: (json['incompatibleNodeName'] as String?) ?? '',
      incompatibleNodeType: IncompatibleLoopNodeType.fromString(
          (json['incompatibleNodeType'] as String?) ?? ''),
      node: (json['node'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final incompatibleNodeName = this.incompatibleNodeName;
    final incompatibleNodeType = this.incompatibleNodeType;
    final node = this.node;
    return {
      'incompatibleNodeName': incompatibleNodeName,
      'incompatibleNodeType': incompatibleNodeType.value,
      'node': node,
    };
  }
}

/// Details about a flow that contains connections that violate loop boundary
/// rules.
class InvalidLoopBoundaryFlowValidationDetails {
  /// The name of the connection that violates loop boundary rules.
  final String connection;

  /// The source node of the connection that violates DoWhile loop boundary rules.
  final String source;

  /// The target node of the connection that violates DoWhile loop boundary rules.
  final String target;

  InvalidLoopBoundaryFlowValidationDetails({
    required this.connection,
    required this.source,
    required this.target,
  });

  factory InvalidLoopBoundaryFlowValidationDetails.fromJson(
      Map<String, dynamic> json) {
    return InvalidLoopBoundaryFlowValidationDetails(
      connection: (json['connection'] as String?) ?? '',
      source: (json['source'] as String?) ?? '',
      target: (json['target'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    final source = this.source;
    final target = this.target;
    return {
      'connection': connection,
      'source': source,
      'target': target,
    };
  }
}

class IncompatibleLoopNodeType {
  static const input = IncompatibleLoopNodeType._('Input');
  static const condition = IncompatibleLoopNodeType._('Condition');
  static const iterator = IncompatibleLoopNodeType._('Iterator');
  static const collector = IncompatibleLoopNodeType._('Collector');

  final String value;

  const IncompatibleLoopNodeType._(this.value);

  static const values = [input, condition, iterator, collector];

  static IncompatibleLoopNodeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IncompatibleLoopNodeType._(value));

  @override
  bool operator ==(other) =>
      other is IncompatibleLoopNodeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      dataSourceConfiguration: DataSourceConfiguration.fromJson(
          (json['dataSourceConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      dataSourceId: (json['dataSourceId'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: DataSourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
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

class DataSourceStatus {
  static const available = DataSourceStatus._('AVAILABLE');
  static const deleting = DataSourceStatus._('DELETING');
  static const deleteUnsuccessful = DataSourceStatus._('DELETE_UNSUCCESSFUL');

  final String value;

  const DataSourceStatus._(this.value);

  static const values = [available, deleting, deleteUnsuccessful];

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
      type: DataSourceType.fromString((json['type'] as String?) ?? ''),
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

/// Contains details about how to ingest the documents in a data source.
class VectorIngestionConfiguration {
  /// Details about how to chunk the documents in the data source. A <i>chunk</i>
  /// refers to an excerpt from a data source that is returned when the knowledge
  /// base that it belongs to is queried.
  final ChunkingConfiguration? chunkingConfiguration;

  /// The context enrichment configuration used for ingestion of the data into the
  /// vector store.
  final ContextEnrichmentConfiguration? contextEnrichmentConfiguration;

  /// A custom document transformer for parsed data source documents.
  final CustomTransformationConfiguration? customTransformationConfiguration;

  /// Configurations for a parser to use for parsing documents in your data
  /// source. If you exclude this field, the default parser will be used.
  final ParsingConfiguration? parsingConfiguration;

  VectorIngestionConfiguration({
    this.chunkingConfiguration,
    this.contextEnrichmentConfiguration,
    this.customTransformationConfiguration,
    this.parsingConfiguration,
  });

  factory VectorIngestionConfiguration.fromJson(Map<String, dynamic> json) {
    return VectorIngestionConfiguration(
      chunkingConfiguration: json['chunkingConfiguration'] != null
          ? ChunkingConfiguration.fromJson(
              json['chunkingConfiguration'] as Map<String, dynamic>)
          : null,
      contextEnrichmentConfiguration: json['contextEnrichmentConfiguration'] !=
              null
          ? ContextEnrichmentConfiguration.fromJson(
              json['contextEnrichmentConfiguration'] as Map<String, dynamic>)
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
    final contextEnrichmentConfiguration = this.contextEnrichmentConfiguration;
    final customTransformationConfiguration =
        this.customTransformationConfiguration;
    final parsingConfiguration = this.parsingConfiguration;
    return {
      if (chunkingConfiguration != null)
        'chunkingConfiguration': chunkingConfiguration,
      if (contextEnrichmentConfiguration != null)
        'contextEnrichmentConfiguration': contextEnrichmentConfiguration,
      if (customTransformationConfiguration != null)
        'customTransformationConfiguration': customTransformationConfiguration,
      if (parsingConfiguration != null)
        'parsingConfiguration': parsingConfiguration,
    };
  }
}

class DataDeletionPolicy {
  static const retain = DataDeletionPolicy._('RETAIN');
  static const delete = DataDeletionPolicy._('DELETE');

  final String value;

  const DataDeletionPolicy._(this.value);

  static const values = [retain, delete];

  static DataDeletionPolicy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataDeletionPolicy._(value));

  @override
  bool operator ==(other) =>
      other is DataDeletionPolicy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
          (json['intermediateStorage'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      transformations: ((json['transformations'] as List?) ?? const [])
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

/// Settings for parsing document contents. If you exclude this field, the
/// default parser converts the contents of each document into text before
/// splitting it into chunks. Specify the parsing strategy to use in the
/// <code>parsingStrategy</code> field and include the relevant configuration,
/// or omit it to use the Amazon Bedrock default parser. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-advanced-parsing.html">Parsing
/// options for your data source</a>.
/// <note>
/// If you specify <code>BEDROCK_DATA_AUTOMATION</code> or
/// <code>BEDROCK_FOUNDATION_MODEL</code> and it fails to parse a file, the
/// Amazon Bedrock default parser will be used instead.
/// </note>
class ParsingConfiguration {
  /// The parsing strategy for the data source.
  final ParsingStrategy parsingStrategy;

  /// If you specify <code>BEDROCK_DATA_AUTOMATION</code> as the parsing strategy
  /// for ingesting your data source, use this object to modify configurations for
  /// using the Amazon Bedrock Data Automation parser.
  final BedrockDataAutomationConfiguration? bedrockDataAutomationConfiguration;

  /// If you specify <code>BEDROCK_FOUNDATION_MODEL</code> as the parsing strategy
  /// for ingesting your data source, use this object to modify configurations for
  /// using a foundation model to parse documents.
  final BedrockFoundationModelConfiguration?
      bedrockFoundationModelConfiguration;

  ParsingConfiguration({
    required this.parsingStrategy,
    this.bedrockDataAutomationConfiguration,
    this.bedrockFoundationModelConfiguration,
  });

  factory ParsingConfiguration.fromJson(Map<String, dynamic> json) {
    return ParsingConfiguration(
      parsingStrategy: ParsingStrategy.fromString(
          (json['parsingStrategy'] as String?) ?? ''),
      bedrockDataAutomationConfiguration:
          json['bedrockDataAutomationConfiguration'] != null
              ? BedrockDataAutomationConfiguration.fromJson(
                  json['bedrockDataAutomationConfiguration']
                      as Map<String, dynamic>)
              : null,
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
    final bedrockDataAutomationConfiguration =
        this.bedrockDataAutomationConfiguration;
    final bedrockFoundationModelConfiguration =
        this.bedrockFoundationModelConfiguration;
    return {
      'parsingStrategy': parsingStrategy.value,
      if (bedrockDataAutomationConfiguration != null)
        'bedrockDataAutomationConfiguration':
            bedrockDataAutomationConfiguration,
      if (bedrockFoundationModelConfiguration != null)
        'bedrockFoundationModelConfiguration':
            bedrockFoundationModelConfiguration,
    };
  }
}

/// Context enrichment configuration is used to provide additional context to
/// the RAG application.
class ContextEnrichmentConfiguration {
  /// The method used for context enrichment. It must be Amazon Bedrock foundation
  /// models.
  final ContextEnrichmentType type;

  /// The configuration of the Amazon Bedrock foundation model used for context
  /// enrichment.
  final BedrockFoundationModelContextEnrichmentConfiguration?
      bedrockFoundationModelConfiguration;

  ContextEnrichmentConfiguration({
    required this.type,
    this.bedrockFoundationModelConfiguration,
  });

  factory ContextEnrichmentConfiguration.fromJson(Map<String, dynamic> json) {
    return ContextEnrichmentConfiguration(
      type: ContextEnrichmentType.fromString((json['type'] as String?) ?? ''),
      bedrockFoundationModelConfiguration:
          json['bedrockFoundationModelConfiguration'] != null
              ? BedrockFoundationModelContextEnrichmentConfiguration.fromJson(
                  json['bedrockFoundationModelConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final bedrockFoundationModelConfiguration =
        this.bedrockFoundationModelConfiguration;
    return {
      'type': type.value,
      if (bedrockFoundationModelConfiguration != null)
        'bedrockFoundationModelConfiguration':
            bedrockFoundationModelConfiguration,
    };
  }
}

class ContextEnrichmentType {
  static const bedrockFoundationModel =
      ContextEnrichmentType._('BEDROCK_FOUNDATION_MODEL');

  final String value;

  const ContextEnrichmentType._(this.value);

  static const values = [bedrockFoundationModel];

  static ContextEnrichmentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ContextEnrichmentType._(value));

  @override
  bool operator ==(other) =>
      other is ContextEnrichmentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Context enrichment configuration is used to provide additional context to
/// the RAG application using Amazon Bedrock foundation models.
class BedrockFoundationModelContextEnrichmentConfiguration {
  /// The enrichment stategy used to provide additional context. For example,
  /// Neptune GraphRAG uses Amazon Bedrock foundation models to perform chunk
  /// entity extraction.
  final EnrichmentStrategyConfiguration enrichmentStrategyConfiguration;

  /// The Amazon Resource Name (ARN) of the model used to create vector embeddings
  /// for the knowledge base.
  final String modelArn;

  BedrockFoundationModelContextEnrichmentConfiguration({
    required this.enrichmentStrategyConfiguration,
    required this.modelArn,
  });

  factory BedrockFoundationModelContextEnrichmentConfiguration.fromJson(
      Map<String, dynamic> json) {
    return BedrockFoundationModelContextEnrichmentConfiguration(
      enrichmentStrategyConfiguration: EnrichmentStrategyConfiguration.fromJson(
          (json['enrichmentStrategyConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      modelArn: (json['modelArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final enrichmentStrategyConfiguration =
        this.enrichmentStrategyConfiguration;
    final modelArn = this.modelArn;
    return {
      'enrichmentStrategyConfiguration': enrichmentStrategyConfiguration,
      'modelArn': modelArn,
    };
  }
}

/// The strategy used for performing context enrichment.
class EnrichmentStrategyConfiguration {
  /// The method used for the context enrichment strategy.
  final EnrichmentStrategyMethod method;

  EnrichmentStrategyConfiguration({
    required this.method,
  });

  factory EnrichmentStrategyConfiguration.fromJson(Map<String, dynamic> json) {
    return EnrichmentStrategyConfiguration(
      method: EnrichmentStrategyMethod.fromString(
          (json['method'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final method = this.method;
    return {
      'method': method.value,
    };
  }
}

class EnrichmentStrategyMethod {
  static const chunkEntityExtraction =
      EnrichmentStrategyMethod._('CHUNK_ENTITY_EXTRACTION');

  final String value;

  const EnrichmentStrategyMethod._(this.value);

  static const values = [chunkEntityExtraction];

  static EnrichmentStrategyMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EnrichmentStrategyMethod._(value));

  @override
  bool operator ==(other) =>
      other is EnrichmentStrategyMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ParsingStrategy {
  static const bedrockFoundationModel =
      ParsingStrategy._('BEDROCK_FOUNDATION_MODEL');
  static const bedrockDataAutomation =
      ParsingStrategy._('BEDROCK_DATA_AUTOMATION');

  final String value;

  const ParsingStrategy._(this.value);

  static const values = [bedrockFoundationModel, bedrockDataAutomation];

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
class BedrockFoundationModelConfiguration {
  /// The ARN of the foundation model to use for parsing.
  final String modelArn;

  /// Specifies whether to enable parsing of multimodal data, including both text
  /// and/or images.
  final ParsingModality? parsingModality;

  /// Instructions for interpreting the contents of a document.
  final ParsingPrompt? parsingPrompt;

  BedrockFoundationModelConfiguration({
    required this.modelArn,
    this.parsingModality,
    this.parsingPrompt,
  });

  factory BedrockFoundationModelConfiguration.fromJson(
      Map<String, dynamic> json) {
    return BedrockFoundationModelConfiguration(
      modelArn: (json['modelArn'] as String?) ?? '',
      parsingModality:
          (json['parsingModality'] as String?)?.let(ParsingModality.fromString),
      parsingPrompt: json['parsingPrompt'] != null
          ? ParsingPrompt.fromJson(
              json['parsingPrompt'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    final parsingModality = this.parsingModality;
    final parsingPrompt = this.parsingPrompt;
    return {
      'modelArn': modelArn,
      if (parsingModality != null) 'parsingModality': parsingModality.value,
      if (parsingPrompt != null) 'parsingPrompt': parsingPrompt,
    };
  }
}

/// Contains configurations for using Amazon Bedrock Data Automation as the
/// parser for ingesting your data sources.
class BedrockDataAutomationConfiguration {
  /// Specifies whether to enable parsing of multimodal data, including both text
  /// and/or images.
  final ParsingModality? parsingModality;

  BedrockDataAutomationConfiguration({
    this.parsingModality,
  });

  factory BedrockDataAutomationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return BedrockDataAutomationConfiguration(
      parsingModality:
          (json['parsingModality'] as String?)?.let(ParsingModality.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final parsingModality = this.parsingModality;
    return {
      if (parsingModality != null) 'parsingModality': parsingModality.value,
    };
  }
}

class ParsingModality {
  static const multimodal = ParsingModality._('MULTIMODAL');

  final String value;

  const ParsingModality._(this.value);

  static const values = [multimodal];

  static ParsingModality fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ParsingModality._(value));

  @override
  bool operator ==(other) => other is ParsingModality && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      s3Location: S3Location.fromJson(
          (json['s3Location'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Location = this.s3Location;
    return {
      's3Location': s3Location,
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
      stepToApply: StepType.fromString((json['stepToApply'] as String?) ?? ''),
      transformationFunction: TransformationFunction.fromJson(
          (json['transformationFunction'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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
              (json['transformationLambdaConfiguration']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
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

class StepType {
  static const postChunking = StepType._('POST_CHUNKING');

  final String value;

  const StepType._(this.value);

  static const values = [postChunking];

  static StepType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StepType._(value));

  @override
  bool operator ==(other) => other is StepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      lambdaArn: (json['lambdaArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaArn = this.lambdaArn;
    return {
      'lambdaArn': lambdaArn,
    };
  }
}

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

class DataSourceType {
  static const s3 = DataSourceType._('S3');
  static const web = DataSourceType._('WEB');
  static const confluence = DataSourceType._('CONFLUENCE');
  static const salesforce = DataSourceType._('SALESFORCE');
  static const sharepoint = DataSourceType._('SHAREPOINT');
  static const custom = DataSourceType._('CUSTOM');
  static const redshiftMetadata = DataSourceType._('REDSHIFT_METADATA');

  final String value;

  const DataSourceType._(this.value);

  static const values = [
    s3,
    web,
    confluence,
    salesforce,
    sharepoint,
    custom,
    redshiftMetadata
  ];

  static DataSourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataSourceType._(value));

  @override
  bool operator ==(other) => other is DataSourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      bucketArn: (json['bucketArn'] as String?) ?? '',
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
          (json['sourceConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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
          (json['sourceConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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
          (json['sourceConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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
          (json['sourceConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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
      authType:
          SharePointAuthType.fromString((json['authType'] as String?) ?? ''),
      credentialsSecretArn: (json['credentialsSecretArn'] as String?) ?? '',
      domain: (json['domain'] as String?) ?? '',
      hostType:
          SharePointHostType.fromString((json['hostType'] as String?) ?? ''),
      siteUrls: ((json['siteUrls'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
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
      type: CrawlFilterConfigurationType.fromString(
          (json['type'] as String?) ?? ''),
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

class CrawlFilterConfigurationType {
  static const pattern = CrawlFilterConfigurationType._('PATTERN');

  final String value;

  const CrawlFilterConfigurationType._(this.value);

  static const values = [pattern];

  static CrawlFilterConfigurationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CrawlFilterConfigurationType._(value));

  @override
  bool operator ==(other) =>
      other is CrawlFilterConfigurationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      filters: ((json['filters'] as List?) ?? const [])
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
      objectType: (json['objectType'] as String?) ?? '',
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

class SharePointHostType {
  static const online = SharePointHostType._('ONLINE');

  final String value;

  const SharePointHostType._(this.value);

  static const values = [online];

  static SharePointHostType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SharePointHostType._(value));

  @override
  bool operator ==(other) =>
      other is SharePointHostType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SharePointAuthType {
  static const oauth2ClientCredentials =
      SharePointAuthType._('OAUTH2_CLIENT_CREDENTIALS');
  static const oauth2SharepointAppOnlyClientCredentials =
      SharePointAuthType._('OAUTH2_SHAREPOINT_APP_ONLY_CLIENT_CREDENTIALS');

  final String value;

  const SharePointAuthType._(this.value);

  static const values = [
    oauth2ClientCredentials,
    oauth2SharepointAppOnlyClientCredentials
  ];

  static SharePointAuthType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SharePointAuthType._(value));

  @override
  bool operator ==(other) =>
      other is SharePointAuthType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      authType:
          SalesforceAuthType.fromString((json['authType'] as String?) ?? ''),
      credentialsSecretArn: (json['credentialsSecretArn'] as String?) ?? '',
      hostUrl: (json['hostUrl'] as String?) ?? '',
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

class SalesforceAuthType {
  static const oauth2ClientCredentials =
      SalesforceAuthType._('OAUTH2_CLIENT_CREDENTIALS');

  final String value;

  const SalesforceAuthType._(this.value);

  static const values = [oauth2ClientCredentials];

  static SalesforceAuthType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SalesforceAuthType._(value));

  @override
  bool operator ==(other) =>
      other is SalesforceAuthType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      authType:
          ConfluenceAuthType.fromString((json['authType'] as String?) ?? ''),
      credentialsSecretArn: (json['credentialsSecretArn'] as String?) ?? '',
      hostType:
          ConfluenceHostType.fromString((json['hostType'] as String?) ?? ''),
      hostUrl: (json['hostUrl'] as String?) ?? '',
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

class ConfluenceHostType {
  static const saas = ConfluenceHostType._('SAAS');

  final String value;

  const ConfluenceHostType._(this.value);

  static const values = [saas];

  static ConfluenceHostType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfluenceHostType._(value));

  @override
  bool operator ==(other) =>
      other is ConfluenceHostType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ConfluenceAuthType {
  static const basic = ConfluenceAuthType._('BASIC');
  static const oauth2ClientCredentials =
      ConfluenceAuthType._('OAUTH2_CLIENT_CREDENTIALS');

  final String value;

  const ConfluenceAuthType._(this.value);

  static const values = [basic, oauth2ClientCredentials];

  static ConfluenceAuthType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfluenceAuthType._(value));

  @override
  bool operator ==(other) =>
      other is ConfluenceAuthType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
          (json['urlConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final urlConfiguration = this.urlConfiguration;
    return {
      'urlConfiguration': urlConfiguration,
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

  /// Returns the user agent suffix for your web crawler.
  final String? userAgent;

  /// A string used for identifying the crawler or bot when it accesses a web
  /// server. The user agent header value consists of the <code>bedrockbot</code>,
  /// UUID, and a user agent suffix for your crawler (if one is provided). By
  /// default, it is set to <code>bedrockbot_UUID</code>. You can optionally
  /// append a custom suffix to <code>bedrockbot_UUID</code> to allowlist a
  /// specific user agent permitted to access your source URLs.
  final String? userAgentHeader;

  WebCrawlerConfiguration({
    this.crawlerLimits,
    this.exclusionFilters,
    this.inclusionFilters,
    this.scope,
    this.userAgent,
    this.userAgentHeader,
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
      userAgent: json['userAgent'] as String?,
      userAgentHeader: json['userAgentHeader'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final crawlerLimits = this.crawlerLimits;
    final exclusionFilters = this.exclusionFilters;
    final inclusionFilters = this.inclusionFilters;
    final scope = this.scope;
    final userAgent = this.userAgent;
    final userAgentHeader = this.userAgentHeader;
    return {
      if (crawlerLimits != null) 'crawlerLimits': crawlerLimits,
      if (exclusionFilters != null) 'exclusionFilters': exclusionFilters,
      if (inclusionFilters != null) 'inclusionFilters': inclusionFilters,
      if (scope != null) 'scope': scope.value,
      if (userAgent != null) 'userAgent': userAgent,
      if (userAgentHeader != null) 'userAgentHeader': userAgentHeader,
    };
  }
}

/// The rate limits for the URLs that you want to crawl. You should be
/// authorized to crawl the URLs.
class WebCrawlerLimits {
  /// The max number of web pages crawled from your source URLs, up to 25,000
  /// pages. If the web pages exceed this limit, the data source sync will fail
  /// and no web pages will be ingested.
  final int? maxPages;

  /// The max rate at which pages are crawled, up to 300 per minute per host.
  final int? rateLimit;

  WebCrawlerLimits({
    this.maxPages,
    this.rateLimit,
  });

  factory WebCrawlerLimits.fromJson(Map<String, dynamic> json) {
    return WebCrawlerLimits(
      maxPages: json['maxPages'] as int?,
      rateLimit: json['rateLimit'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxPages = this.maxPages;
    final rateLimit = this.rateLimit;
    return {
      if (maxPages != null) 'maxPages': maxPages,
      if (rateLimit != null) 'rateLimit': rateLimit,
    };
  }
}

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
      dataSourceId: (json['dataSourceId'] as String?) ?? '',
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: DataSourceStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
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
  /// <li>
  /// DISSOCIATED - The agent alias has no version associated with it.
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

  /// The invocation state for the agent alias. If the agent alias is running, the
  /// value is <code>ACCEPT_INVOCATIONS</code>. If the agent alias is paused, the
  /// value is <code>REJECT_INVOCATIONS</code>. Use the
  /// <code>UpdateAgentAlias</code> operation to change the invocation state.
  final AliasInvocationState? aliasInvocationState;

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
    this.aliasInvocationState,
    this.clientToken,
    this.description,
    this.failureReasons,
  });

  factory AgentAlias.fromJson(Map<String, dynamic> json) {
    return AgentAlias(
      agentAliasArn: (json['agentAliasArn'] as String?) ?? '',
      agentAliasId: (json['agentAliasId'] as String?) ?? '',
      agentAliasName: (json['agentAliasName'] as String?) ?? '',
      agentAliasStatus: AgentAliasStatus.fromString(
          (json['agentAliasStatus'] as String?) ?? ''),
      agentId: (json['agentId'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      routingConfiguration:
          ((json['routingConfiguration'] as List?) ?? const [])
              .nonNulls
              .map((e) => AgentAliasRoutingConfigurationListItem.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      agentAliasHistoryEvents: (json['agentAliasHistoryEvents'] as List?)
          ?.nonNulls
          .map(
              (e) => AgentAliasHistoryEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      aliasInvocationState: (json['aliasInvocationState'] as String?)
          ?.let(AliasInvocationState.fromString),
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
    final aliasInvocationState = this.aliasInvocationState;
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
      if (aliasInvocationState != null)
        'aliasInvocationState': aliasInvocationState.value,
      if (clientToken != null) 'clientToken': clientToken,
      if (description != null) 'description': description,
      if (failureReasons != null) 'failureReasons': failureReasons,
    };
  }
}

class AgentAliasStatus {
  static const creating = AgentAliasStatus._('CREATING');
  static const prepared = AgentAliasStatus._('PREPARED');
  static const failed = AgentAliasStatus._('FAILED');
  static const updating = AgentAliasStatus._('UPDATING');
  static const deleting = AgentAliasStatus._('DELETING');
  static const dissociated = AgentAliasStatus._('DISSOCIATED');

  final String value;

  const AgentAliasStatus._(this.value);

  static const values = [
    creating,
    prepared,
    failed,
    updating,
    deleting,
    dissociated
  ];

  static AgentAliasStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AgentAliasStatus._(value));

  @override
  bool operator ==(other) => other is AgentAliasStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Enum representing the invocation state of an agent alias
class AliasInvocationState {
  static const acceptInvocations = AliasInvocationState._('ACCEPT_INVOCATIONS');
  static const rejectInvocations = AliasInvocationState._('REJECT_INVOCATIONS');

  final String value;

  const AliasInvocationState._(this.value);

  static const values = [acceptInvocations, rejectInvocations];

  static AliasInvocationState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AliasInvocationState._(value));

  @override
  bool operator ==(other) =>
      other is AliasInvocationState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

  /// The invocation state for the agent alias. If the agent alias is running, the
  /// value is <code>ACCEPT_INVOCATIONS</code>. If the agent alias is paused, the
  /// value is <code>REJECT_INVOCATIONS</code>. Use the
  /// <code>UpdateAgentAlias</code> operation to change the invocation state.
  final AliasInvocationState? aliasInvocationState;

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
    this.aliasInvocationState,
    this.description,
    this.routingConfiguration,
  });

  factory AgentAliasSummary.fromJson(Map<String, dynamic> json) {
    return AgentAliasSummary(
      agentAliasId: (json['agentAliasId'] as String?) ?? '',
      agentAliasName: (json['agentAliasName'] as String?) ?? '',
      agentAliasStatus: AgentAliasStatus.fromString(
          (json['agentAliasStatus'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      aliasInvocationState: (json['aliasInvocationState'] as String?)
          ?.let(AliasInvocationState.fromString),
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
    final aliasInvocationState = this.aliasInvocationState;
    final description = this.description;
    final routingConfiguration = this.routingConfiguration;
    return {
      'agentAliasId': agentAliasId,
      'agentAliasName': agentAliasName,
      'agentAliasStatus': agentAliasStatus.value,
      'createdAt': iso8601ToJson(createdAt),
      'updatedAt': iso8601ToJson(updatedAt),
      if (aliasInvocationState != null)
        'aliasInvocationState': aliasInvocationState.value,
      if (description != null) 'description': description,
      if (routingConfiguration != null)
        'routingConfiguration': routingConfiguration,
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

  /// The agent's collaboration settings.
  final AgentCollaboration? agentCollaboration;

  /// A unique, case-sensitive identifier to ensure that the API request completes
  /// no more than one time. If this token matches a previous request, Amazon
  /// Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  final String? clientToken;

  /// Contains custom orchestration configurations for the agent.
  final CustomOrchestration? customOrchestration;

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

  /// Specifies the orchestration strategy for the agent.
  final OrchestrationType? orchestrationType;

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
    this.agentCollaboration,
    this.clientToken,
    this.customOrchestration,
    this.customerEncryptionKeyArn,
    this.description,
    this.failureReasons,
    this.foundationModel,
    this.guardrailConfiguration,
    this.instruction,
    this.memoryConfiguration,
    this.orchestrationType,
    this.preparedAt,
    this.promptOverrideConfiguration,
    this.recommendedActions,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      agentArn: (json['agentArn'] as String?) ?? '',
      agentId: (json['agentId'] as String?) ?? '',
      agentName: (json['agentName'] as String?) ?? '',
      agentResourceRoleArn: (json['agentResourceRoleArn'] as String?) ?? '',
      agentStatus:
          AgentStatus.fromString((json['agentStatus'] as String?) ?? ''),
      agentVersion: (json['agentVersion'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      idleSessionTTLInSeconds: (json['idleSessionTTLInSeconds'] as int?) ?? 0,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      agentCollaboration: (json['agentCollaboration'] as String?)
          ?.let(AgentCollaboration.fromString),
      clientToken: json['clientToken'] as String?,
      customOrchestration: json['customOrchestration'] != null
          ? CustomOrchestration.fromJson(
              json['customOrchestration'] as Map<String, dynamic>)
          : null,
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
      orchestrationType: (json['orchestrationType'] as String?)
          ?.let(OrchestrationType.fromString),
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
    final agentCollaboration = this.agentCollaboration;
    final clientToken = this.clientToken;
    final customOrchestration = this.customOrchestration;
    final customerEncryptionKeyArn = this.customerEncryptionKeyArn;
    final description = this.description;
    final failureReasons = this.failureReasons;
    final foundationModel = this.foundationModel;
    final guardrailConfiguration = this.guardrailConfiguration;
    final instruction = this.instruction;
    final memoryConfiguration = this.memoryConfiguration;
    final orchestrationType = this.orchestrationType;
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
      if (agentCollaboration != null)
        'agentCollaboration': agentCollaboration.value,
      if (clientToken != null) 'clientToken': clientToken,
      if (customOrchestration != null)
        'customOrchestration': customOrchestration,
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
      if (orchestrationType != null)
        'orchestrationType': orchestrationType.value,
      if (preparedAt != null) 'preparedAt': iso8601ToJson(preparedAt),
      if (promptOverrideConfiguration != null)
        'promptOverrideConfiguration': promptOverrideConfiguration,
      if (recommendedActions != null) 'recommendedActions': recommendedActions,
    };
  }
}

class OrchestrationType {
  static const $default = OrchestrationType._('DEFAULT');
  static const customOrchestration =
      OrchestrationType._('CUSTOM_ORCHESTRATION');

  final String value;

  const OrchestrationType._(this.value);

  static const values = [$default, customOrchestration];

  static OrchestrationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OrchestrationType._(value));

  @override
  bool operator ==(other) => other is OrchestrationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details of custom orchestration.
class CustomOrchestration {
  /// The structure of the executor invoking the actions in custom orchestration.
  final OrchestrationExecutor? executor;

  CustomOrchestration({
    this.executor,
  });

  factory CustomOrchestration.fromJson(Map<String, dynamic> json) {
    return CustomOrchestration(
      executor: json['executor'] != null
          ? OrchestrationExecutor.fromJson(
              json['executor'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final executor = this.executor;
    return {
      if (executor != null) 'executor': executor,
    };
  }
}

/// Contains details about the Lambda function containing the orchestration
/// logic carried out upon invoking the custom orchestration.
class OrchestrationExecutor {
  /// The Amazon Resource Name (ARN) of the Lambda function containing the
  /// business logic that is carried out upon invoking the action.
  final String? lambda;

  OrchestrationExecutor({
    this.lambda,
  });

  factory OrchestrationExecutor.fromJson(Map<String, dynamic> json) {
    return OrchestrationExecutor(
      lambda: json['lambda'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lambda = this.lambda;
    return {
      if (lambda != null) 'lambda': lambda,
    };
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
      agentId: (json['agentId'] as String?) ?? '',
      agentName: (json['agentName'] as String?) ?? '',
      agentStatus:
          AgentStatus.fromString((json['agentStatus'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
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

/// An agent collaborator.
class AgentCollaborator {
  /// The collaborator's agent descriptor.
  final AgentDescriptor agentDescriptor;

  /// The collaborator's agent ID.
  final String agentId;

  /// The collaborator's agent version.
  final String agentVersion;

  /// The collaborator's instructions.
  final String collaborationInstruction;

  /// The collaborator's collaborator ID.
  final String collaboratorId;

  /// The collaborator's collaborator name.
  final String collaboratorName;

  /// When the collaborator was created.
  final DateTime createdAt;

  /// When the collaborator was updated.
  final DateTime lastUpdatedAt;

  /// The collaborator's client token.
  final String? clientToken;

  /// The collaborator's relay conversation history.
  final RelayConversationHistory? relayConversationHistory;

  AgentCollaborator({
    required this.agentDescriptor,
    required this.agentId,
    required this.agentVersion,
    required this.collaborationInstruction,
    required this.collaboratorId,
    required this.collaboratorName,
    required this.createdAt,
    required this.lastUpdatedAt,
    this.clientToken,
    this.relayConversationHistory,
  });

  factory AgentCollaborator.fromJson(Map<String, dynamic> json) {
    return AgentCollaborator(
      agentDescriptor: AgentDescriptor.fromJson(
          (json['agentDescriptor'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      agentId: (json['agentId'] as String?) ?? '',
      agentVersion: (json['agentVersion'] as String?) ?? '',
      collaborationInstruction:
          (json['collaborationInstruction'] as String?) ?? '',
      collaboratorId: (json['collaboratorId'] as String?) ?? '',
      collaboratorName: (json['collaboratorName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      lastUpdatedAt: nonNullableTimeStampFromJson(json['lastUpdatedAt'] ?? 0),
      clientToken: json['clientToken'] as String?,
      relayConversationHistory: (json['relayConversationHistory'] as String?)
          ?.let(RelayConversationHistory.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final agentDescriptor = this.agentDescriptor;
    final agentId = this.agentId;
    final agentVersion = this.agentVersion;
    final collaborationInstruction = this.collaborationInstruction;
    final collaboratorId = this.collaboratorId;
    final collaboratorName = this.collaboratorName;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final clientToken = this.clientToken;
    final relayConversationHistory = this.relayConversationHistory;
    return {
      'agentDescriptor': agentDescriptor,
      'agentId': agentId,
      'agentVersion': agentVersion,
      'collaborationInstruction': collaborationInstruction,
      'collaboratorId': collaboratorId,
      'collaboratorName': collaboratorName,
      'createdAt': iso8601ToJson(createdAt),
      'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (clientToken != null) 'clientToken': clientToken,
      if (relayConversationHistory != null)
        'relayConversationHistory': relayConversationHistory.value,
    };
  }
}

/// An agent descriptor.
class AgentDescriptor {
  /// The agent's alias ARN.
  final String? aliasArn;

  AgentDescriptor({
    this.aliasArn,
  });

  factory AgentDescriptor.fromJson(Map<String, dynamic> json) {
    return AgentDescriptor(
      aliasArn: json['aliasArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aliasArn = this.aliasArn;
    return {
      if (aliasArn != null) 'aliasArn': aliasArn,
    };
  }
}

class RelayConversationHistory {
  static const toCollaborator = RelayConversationHistory._('TO_COLLABORATOR');
  static const disabled = RelayConversationHistory._('DISABLED');

  final String value;

  const RelayConversationHistory._(this.value);

  static const values = [toCollaborator, disabled];

  static RelayConversationHistory fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RelayConversationHistory._(value));

  @override
  bool operator ==(other) =>
      other is RelayConversationHistory && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An agent collaborator summary.
class AgentCollaboratorSummary {
  /// The collaborator's agent descriptor.
  final AgentDescriptor agentDescriptor;

  /// The collaborator's agent ID.
  final String agentId;

  /// The collaborator's agent version.
  final String agentVersion;

  /// The collaborator's collaboration instruction.
  final String collaborationInstruction;

  /// The collaborator's ID.
  final String collaboratorId;

  /// The collaborator's name.
  final String collaboratorName;

  /// When the collaborator was created.
  final DateTime createdAt;

  /// When the collaborator was last updated.
  final DateTime lastUpdatedAt;

  /// The collaborator's relay conversation history.
  final RelayConversationHistory relayConversationHistory;

  AgentCollaboratorSummary({
    required this.agentDescriptor,
    required this.agentId,
    required this.agentVersion,
    required this.collaborationInstruction,
    required this.collaboratorId,
    required this.collaboratorName,
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.relayConversationHistory,
  });

  factory AgentCollaboratorSummary.fromJson(Map<String, dynamic> json) {
    return AgentCollaboratorSummary(
      agentDescriptor: AgentDescriptor.fromJson(
          (json['agentDescriptor'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      agentId: (json['agentId'] as String?) ?? '',
      agentVersion: (json['agentVersion'] as String?) ?? '',
      collaborationInstruction:
          (json['collaborationInstruction'] as String?) ?? '',
      collaboratorId: (json['collaboratorId'] as String?) ?? '',
      collaboratorName: (json['collaboratorName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      lastUpdatedAt: nonNullableTimeStampFromJson(json['lastUpdatedAt'] ?? 0),
      relayConversationHistory: RelayConversationHistory.fromString(
          (json['relayConversationHistory'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final agentDescriptor = this.agentDescriptor;
    final agentId = this.agentId;
    final agentVersion = this.agentVersion;
    final collaborationInstruction = this.collaborationInstruction;
    final collaboratorId = this.collaboratorId;
    final collaboratorName = this.collaboratorName;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final relayConversationHistory = this.relayConversationHistory;
    return {
      'agentDescriptor': agentDescriptor,
      'agentId': agentId,
      'agentVersion': agentVersion,
      'collaborationInstruction': collaborationInstruction,
      'collaboratorId': collaboratorId,
      'collaboratorName': collaboratorName,
      'createdAt': iso8601ToJson(createdAt),
      'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      'relayConversationHistory': relayConversationHistory.value,
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

  /// The configuration settings for a computer use action.
  /// <important>
  /// Computer use is a new Anthropic Claude model capability (in beta) available
  /// with Claude 3.7 Sonnet and Claude 3.5 Sonnet v2 only. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-computer-use.html">Configure
  /// an Amazon Bedrock Agent to complete tasks with computer use tools</a>.
  /// </important>
  final Map<String, String>? parentActionGroupSignatureParams;

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
    this.parentActionGroupSignatureParams,
    this.parentActionSignature,
  });

  factory AgentActionGroup.fromJson(Map<String, dynamic> json) {
    return AgentActionGroup(
      actionGroupId: (json['actionGroupId'] as String?) ?? '',
      actionGroupName: (json['actionGroupName'] as String?) ?? '',
      actionGroupState: ActionGroupState.fromString(
          (json['actionGroupState'] as String?) ?? ''),
      agentId: (json['agentId'] as String?) ?? '',
      agentVersion: (json['agentVersion'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
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
      parentActionGroupSignatureParams:
          (json['parentActionGroupSignatureParams'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
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
    final parentActionGroupSignatureParams =
        this.parentActionGroupSignatureParams;
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
      if (parentActionGroupSignatureParams != null)
        'parentActionGroupSignatureParams': parentActionGroupSignatureParams,
      if (parentActionSignature != null)
        'parentActionSignature': parentActionSignature.value,
    };
  }
}

class ActionGroupSignature {
  static const amazonUserInput = ActionGroupSignature._('AMAZON.UserInput');
  static const amazonCodeInterpreter =
      ActionGroupSignature._('AMAZON.CodeInterpreter');
  static const anthropicComputer = ActionGroupSignature._('ANTHROPIC.Computer');
  static const anthropicBash = ActionGroupSignature._('ANTHROPIC.Bash');
  static const anthropicTextEditor =
      ActionGroupSignature._('ANTHROPIC.TextEditor');

  final String value;

  const ActionGroupSignature._(this.value);

  static const values = [
    amazonUserInput,
    amazonCodeInterpreter,
    anthropicComputer,
    anthropicBash,
    anthropicTextEditor
  ];

  static ActionGroupSignature fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ActionGroupSignature._(value));

  @override
  bool operator ==(other) =>
      other is ActionGroupSignature && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

class ActionGroupState {
  static const enabled = ActionGroupState._('ENABLED');
  static const disabled = ActionGroupState._('DISABLED');

  final String value;

  const ActionGroupState._(this.value);

  static const values = [enabled, disabled];

  static ActionGroupState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ActionGroupState._(value));

  @override
  bool operator ==(other) => other is ActionGroupState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      name: (json['name'] as String?) ?? '',
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

/// Whether the action requires user confirmation.
class RequireConfirmation {
  static const enabled = RequireConfirmation._('ENABLED');
  static const disabled = RequireConfirmation._('DISABLED');

  final String value;

  const RequireConfirmation._(this.value);

  static const values = [enabled, disabled];

  static RequireConfirmation fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RequireConfirmation._(value));

  @override
  bool operator ==(other) =>
      other is RequireConfirmation && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      type: Type.fromString((json['type'] as String?) ?? ''),
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

class Type {
  static const string = Type._('string');
  static const number = Type._('number');
  static const integer = Type._('integer');
  static const boolean = Type._('boolean');
  static const array = Type._('array');

  final String value;

  const Type._(this.value);

  static const values = [string, number, integer, boolean, array];

  static Type fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Type._(value));

  @override
  bool operator ==(other) => other is Type && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

class CustomControlMethod {
  static const returnControl = CustomControlMethod._('RETURN_CONTROL');

  final String value;

  const CustomControlMethod._(this.value);

  static const values = [returnControl];

  static CustomControlMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CustomControlMethod._(value));

  @override
  bool operator ==(other) =>
      other is CustomControlMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      actionGroupId: (json['actionGroupId'] as String?) ?? '',
      actionGroupName: (json['actionGroupName'] as String?) ?? '',
      actionGroupState: ActionGroupState.fromString(
          (json['actionGroupState'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
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

class Document {
  Document();

  factory Document.fromJson(Map<String, dynamic> _) {
    return Document();
  }

  Map<String, dynamic> toJson() {
    return {};
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
