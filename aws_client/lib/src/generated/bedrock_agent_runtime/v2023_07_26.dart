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

/// Contains APIs related to model invocation and querying of knowledge bases.
class BedrockAgentRuntime {
  final _s.RestJsonProtocol _protocol;
  BedrockAgentRuntime({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'bedrock-agent-runtime',
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

  /// Retrieves the flow definition snapshot used for a flow execution. The
  /// snapshot represents the flow metadata and definition as it existed at the
  /// time the execution was started. Note that even if the flow is edited after
  /// an execution starts, the snapshot connected to the execution remains
  /// unchanged.
  /// <note>
  /// Flow executions is in preview release for Amazon Bedrock and is subject to
  /// change.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [executionIdentifier] :
  /// The unique identifier of the flow execution.
  ///
  /// Parameter [flowAliasIdentifier] :
  /// The unique identifier of the flow alias used for the flow execution.
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow.
  Future<GetExecutionFlowSnapshotResponse> getExecutionFlowSnapshot({
    required String executionIdentifier,
    required String flowAliasIdentifier,
    required String flowIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/flows/${Uri.encodeComponent(flowIdentifier)}/aliases/${Uri.encodeComponent(flowAliasIdentifier)}/executions/${Uri.encodeComponent(executionIdentifier)}/flowsnapshot',
      exceptionFnMap: _exceptionFns,
    );
    return GetExecutionFlowSnapshotResponse.fromJson(response);
  }

  /// Retrieves details about a specific flow execution, including its status,
  /// start and end times, and any errors that occurred during execution.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [executionIdentifier] :
  /// The unique identifier of the flow execution to retrieve.
  ///
  /// Parameter [flowAliasIdentifier] :
  /// The unique identifier of the flow alias used for the execution.
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow.
  Future<GetFlowExecutionResponse> getFlowExecution({
    required String executionIdentifier,
    required String flowAliasIdentifier,
    required String flowIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/flows/${Uri.encodeComponent(flowIdentifier)}/aliases/${Uri.encodeComponent(flowAliasIdentifier)}/executions/${Uri.encodeComponent(executionIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFlowExecutionResponse.fromJson(response);
  }

  /// Lists events that occurred during a flow execution. Events provide
  /// detailed information about the execution progress, including node inputs
  /// and outputs, flow inputs and outputs, condition results, and failure
  /// events.
  /// <note>
  /// Flow executions is in preview release for Amazon Bedrock and is subject to
  /// change.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [eventType] :
  /// The type of events to retrieve. Specify <code>Node</code> for node-level
  /// events or <code>Flow</code> for flow-level events.
  ///
  /// Parameter [executionIdentifier] :
  /// The unique identifier of the flow execution.
  ///
  /// Parameter [flowAliasIdentifier] :
  /// The unique identifier of the flow alias used for the execution.
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of events to return in a single response. If more
  /// events exist than the specified maxResults value, a token is included in
  /// the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// A token to retrieve the next set of results. This value is returned in the
  /// response if more results are available.
  Future<ListFlowExecutionEventsResponse> listFlowExecutionEvents({
    required FlowExecutionEventType eventType,
    required String executionIdentifier,
    required String flowAliasIdentifier,
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
      'eventType': [eventType.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/flows/${Uri.encodeComponent(flowIdentifier)}/aliases/${Uri.encodeComponent(flowAliasIdentifier)}/executions/${Uri.encodeComponent(executionIdentifier)}/events',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFlowExecutionEventsResponse.fromJson(response);
  }

  /// Lists all executions of a flow. Results can be paginated and include
  /// summary information about each execution, such as status, start and end
  /// times, and the execution's Amazon Resource Name (ARN).
  /// <note>
  /// Flow executions is in preview release for Amazon Bedrock and is subject to
  /// change.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow to list executions for.
  ///
  /// Parameter [flowAliasIdentifier] :
  /// The unique identifier of the flow alias to list executions for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of flow executions to return in a single response. If
  /// more executions exist than the specified <code>maxResults</code> value, a
  /// token is included in the response so that the remaining results can be
  /// retrieved.
  ///
  /// Parameter [nextToken] :
  /// A token to retrieve the next set of results. This value is returned in the
  /// response if more results are available.
  Future<ListFlowExecutionsResponse> listFlowExecutions({
    required String flowIdentifier,
    String? flowAliasIdentifier,
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
      if (flowAliasIdentifier != null)
        'flowAliasIdentifier': [flowAliasIdentifier],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/flows/${Uri.encodeComponent(flowIdentifier)}/executions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFlowExecutionsResponse.fromJson(response);
  }

  /// Starts an execution of an Amazon Bedrock flow. Unlike flows that run until
  /// completion or time out after five minutes, flow executions let you run
  /// flows asynchronously for longer durations. Flow executions also yield
  /// control so that your application can perform other tasks.
  ///
  /// This operation returns an Amazon Resource Name (ARN) that you can use to
  /// track and manage your flow execution.
  /// <note>
  /// Flow executions is in preview release for Amazon Bedrock and is subject to
  /// change.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadGatewayException].
  /// May throw [ConflictException].
  /// May throw [DependencyFailedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [flowAliasIdentifier] :
  /// The unique identifier of the flow alias to use for the flow execution.
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow to execute.
  ///
  /// Parameter [inputs] :
  /// The input data required for the flow execution. This must match the input
  /// schema defined in the flow.
  ///
  /// Parameter [flowExecutionName] :
  /// The unique name for the flow execution. If you don't provide one, a
  /// system-generated name is used.
  ///
  /// Parameter [modelPerformanceConfiguration] :
  /// The performance settings for the foundation model used in the flow
  /// execution.
  Future<StartFlowExecutionResponse> startFlowExecution({
    required String flowAliasIdentifier,
    required String flowIdentifier,
    required List<FlowInput> inputs,
    String? flowExecutionName,
    ModelPerformanceConfiguration? modelPerformanceConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'inputs': inputs,
      if (flowExecutionName != null) 'flowExecutionName': flowExecutionName,
      if (modelPerformanceConfiguration != null)
        'modelPerformanceConfiguration': modelPerformanceConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/flows/${Uri.encodeComponent(flowIdentifier)}/aliases/${Uri.encodeComponent(flowAliasIdentifier)}/executions',
      exceptionFnMap: _exceptionFns,
    );
    return StartFlowExecutionResponse.fromJson(response);
  }

  /// Stops an Amazon Bedrock flow's execution. This operation prevents further
  /// processing of the flow and changes the execution status to
  /// <code>Aborted</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadGatewayException].
  /// May throw [ConflictException].
  /// May throw [DependencyFailedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [executionIdentifier] :
  /// The unique identifier of the flow execution to stop.
  ///
  /// Parameter [flowAliasIdentifier] :
  /// The unique identifier of the flow alias used for the execution.
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow.
  Future<StopFlowExecutionResponse> stopFlowExecution({
    required String executionIdentifier,
    required String flowAliasIdentifier,
    required String flowIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/flows/${Uri.encodeComponent(flowIdentifier)}/aliases/${Uri.encodeComponent(flowAliasIdentifier)}/executions/${Uri.encodeComponent(executionIdentifier)}/stop',
      exceptionFnMap: _exceptionFns,
    );
    return StopFlowExecutionResponse.fromJson(response);
  }

  /// Invokes an alias of a flow to run the inputs that you specify and return
  /// the output of each node as a stream. If there's an error, the error is
  /// returned. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-test.html">Test
  /// a flow in Amazon Bedrock</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  /// <note>
  /// The CLI doesn't support streaming operations in Amazon Bedrock, including
  /// <code>InvokeFlow</code>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadGatewayException].
  /// May throw [ConflictException].
  /// May throw [DependencyFailedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [flowAliasIdentifier] :
  /// The unique identifier of the flow alias.
  ///
  /// Parameter [flowIdentifier] :
  /// The unique identifier of the flow.
  ///
  /// Parameter [inputs] :
  /// A list of objects, each containing information about an input into the
  /// flow.
  ///
  /// Parameter [enableTrace] :
  /// Specifies whether to return the trace for the flow or not. Traces track
  /// inputs and outputs for nodes in the flow. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-trace.html">Track
  /// each step in your prompt flow by viewing its trace in Amazon Bedrock</a>.
  ///
  /// Parameter [executionId] :
  /// The unique identifier for the current flow execution. If you don't provide
  /// a value, Amazon Bedrock creates the identifier for you.
  ///
  /// Parameter [modelPerformanceConfiguration] :
  /// Model performance settings for the request.
  Future<InvokeFlowResponse> invokeFlow({
    required String flowAliasIdentifier,
    required String flowIdentifier,
    required List<FlowInput> inputs,
    bool? enableTrace,
    String? executionId,
    ModelPerformanceConfiguration? modelPerformanceConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'inputs': inputs,
      if (enableTrace != null) 'enableTrace': enableTrace,
      if (executionId != null) 'executionId': executionId,
      if (modelPerformanceConfiguration != null)
        'modelPerformanceConfiguration': modelPerformanceConfiguration,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/flows/${Uri.encodeComponent(flowIdentifier)}/aliases/${Uri.encodeComponent(flowAliasIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return InvokeFlowResponse(
      responseStream: FlowResponseStream.fromJson($json),
      executionId: _s.extractHeaderStringValue(
          response.headers, 'x-amz-bedrock-flow-execution-id'),
    );
  }

  /// Generates an SQL query from a natural language query. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-generate-query.html">Generate
  /// a query for structured data</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadGatewayException].
  /// May throw [ConflictException].
  /// May throw [DependencyFailedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [queryGenerationInput] :
  /// Specifies information about a natural language query to transform into
  /// SQL.
  ///
  /// Parameter [transformationConfiguration] :
  /// Specifies configurations for transforming the natural language query into
  /// SQL.
  Future<GenerateQueryResponse> generateQuery({
    required QueryGenerationInput queryGenerationInput,
    required TransformationConfiguration transformationConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'queryGenerationInput': queryGenerationInput,
      'transformationConfiguration': transformationConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/generateQuery',
      exceptionFnMap: _exceptionFns,
    );
    return GenerateQueryResponse.fromJson(response);
  }

  /// <note> </note>
  /// Sends a prompt for the agent to process and respond to. Note the following
  /// fields for the request:
  ///
  /// <ul>
  /// <li>
  /// To continue the same conversation with an agent, use the same
  /// <code>sessionId</code> value in the request.
  /// </li>
  /// <li>
  /// To activate trace enablement, turn <code>enableTrace</code> to
  /// <code>true</code>. Trace enablement helps you follow the agent's reasoning
  /// process that led it to the information it processed, the actions it took,
  /// and the final result it yielded. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-test.html#trace-events">Trace
  /// enablement</a>.
  /// </li>
  /// <li>
  /// End a conversation by setting <code>endSession</code> to
  /// <code>true</code>.
  /// </li>
  /// <li>
  /// In the <code>sessionState</code> object, you can include attributes for
  /// the session or prompt or, if you configured an action group to return
  /// control, results from invocation of the action group.
  /// </li>
  /// </ul>
  /// The response contains both <b>chunk</b> and <b>trace</b> attributes.
  ///
  /// The final response is returned in the <code>bytes</code> field of the
  /// <code>chunk</code> object. The <code>InvokeAgent</code> returns one chunk
  /// for the entire interaction.
  ///
  /// <ul>
  /// <li>
  /// The <code>attribution</code> object contains citations for parts of the
  /// response.
  /// </li>
  /// <li>
  /// If you set <code>enableTrace</code> to <code>true</code> in the request,
  /// you can trace the agent's steps and reasoning process that led it to the
  /// response.
  /// </li>
  /// <li>
  /// If the action predicted was configured to return control, the response
  /// returns parameters for the action, elicited from the user, in the
  /// <code>returnControl</code> field.
  /// </li>
  /// <li>
  /// Errors are also surfaced in the response.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadGatewayException].
  /// May throw [ConflictException].
  /// May throw [DependencyFailedException].
  /// May throw [InternalServerException].
  /// May throw [ModelNotReadyException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentAliasId] :
  /// The alias of the agent to use.
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent to use.
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the session. Use the same value across requests
  /// to continue the same conversation.
  ///
  /// Parameter [bedrockModelConfigurations] :
  /// Model performance settings for the request.
  ///
  /// Parameter [enableTrace] :
  /// Specifies whether to turn on the trace or not to track the agent's
  /// reasoning process. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-test.html#trace-events">Trace
  /// enablement</a>.
  ///
  /// Parameter [endSession] :
  /// Specifies whether to end the session with the agent or not.
  ///
  /// Parameter [inputText] :
  /// The prompt text to send the agent.
  /// <note>
  /// If you include <code>returnControlInvocationResults</code> in the
  /// <code>sessionState</code> field, the <code>inputText</code> field will be
  /// ignored.
  /// </note>
  ///
  /// Parameter [memoryId] :
  /// The unique identifier of the agent memory.
  ///
  /// Parameter [promptCreationConfigurations] :
  /// Specifies parameters that control how the service populates the agent
  /// prompt for an <code>InvokeAgent</code> request. You can control which
  /// aspects of previous invocations in the same agent session the service uses
  /// to populate the agent prompt. This gives you more granular control over
  /// the contextual history that is used to process the current request.
  ///
  /// Parameter [sessionState] :
  /// Contains parameters that specify various attributes of the session. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-session-state.html">Control
  /// session context</a>.
  /// <note>
  /// If you include <code>returnControlInvocationResults</code> in the
  /// <code>sessionState</code> field, the <code>inputText</code> field will be
  /// ignored.
  /// </note>
  ///
  /// Parameter [sourceArn] :
  /// The ARN of the resource making the request.
  ///
  /// Parameter [streamingConfigurations] :
  /// Specifies the configurations for streaming.
  /// <note>
  /// To use agent streaming, you need permissions to perform the
  /// <code>bedrock:InvokeModelWithResponseStream</code> action.
  /// </note>
  Future<InvokeAgentResponse> invokeAgent({
    required String agentAliasId,
    required String agentId,
    required String sessionId,
    BedrockModelConfigurations? bedrockModelConfigurations,
    bool? enableTrace,
    bool? endSession,
    String? inputText,
    String? memoryId,
    PromptCreationConfigurations? promptCreationConfigurations,
    SessionState? sessionState,
    String? sourceArn,
    StreamingConfigurations? streamingConfigurations,
  }) async {
    final headers = <String, String>{
      if (sourceArn != null) 'x-amz-source-arn': sourceArn.toString(),
    };
    final $payload = <String, dynamic>{
      if (bedrockModelConfigurations != null)
        'bedrockModelConfigurations': bedrockModelConfigurations,
      if (enableTrace != null) 'enableTrace': enableTrace,
      if (endSession != null) 'endSession': endSession,
      if (inputText != null) 'inputText': inputText,
      if (memoryId != null) 'memoryId': memoryId,
      if (promptCreationConfigurations != null)
        'promptCreationConfigurations': promptCreationConfigurations,
      if (sessionState != null) 'sessionState': sessionState,
      if (streamingConfigurations != null)
        'streamingConfigurations': streamingConfigurations,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentAliases/${Uri.encodeComponent(agentAliasId)}/sessions/${Uri.encodeComponent(sessionId)}/text',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return InvokeAgentResponse(
      completion: ResponseStream.fromJson($json),
      contentType: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-bedrock-agent-content-type')!,
      sessionId: _s.extractHeaderStringValue(
          response.headers, 'x-amz-bedrock-agent-session-id')!,
      memoryId: _s.extractHeaderStringValue(
          response.headers, 'x-amz-bedrock-agent-memory-id'),
    );
  }

  /// Invokes an inline Amazon Bedrock agent using the configurations you
  /// provide with the request.
  ///
  /// <ul>
  /// <li>
  /// Specify the following fields for security purposes.
  ///
  /// <ul>
  /// <li>
  /// (Optional) <code>customerEncryptionKeyArn</code> – The Amazon Resource
  /// Name (ARN) of a KMS key to encrypt the creation of the agent.
  /// </li>
  /// <li>
  /// (Optional) <code>idleSessionTTLinSeconds</code> – Specify the number of
  /// seconds for which the agent should maintain session information. After
  /// this time expires, the subsequent <code>InvokeInlineAgent</code> request
  /// begins a new session.
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
  /// The agent instructions will not be honored if your agent has only one
  /// knowledge base, uses default prompts, has no action group, and user input
  /// is disabled.
  /// </li>
  /// </ul> <note> </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadGatewayException].
  /// May throw [ConflictException].
  /// May throw [DependencyFailedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [foundationModel] :
  /// The <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-ids.html#model-ids-arns">model
  /// identifier (ID)</a> of the model to use for orchestration by the inline
  /// agent. For example, <code>meta.llama3-1-70b-instruct-v1:0</code>.
  ///
  /// Parameter [instruction] :
  /// The instructions that tell the inline agent what it should do and how it
  /// should interact with users.
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the session. Use the same value across requests
  /// to continue the same conversation.
  ///
  /// Parameter [actionGroups] :
  /// A list of action groups with each action group defining the action the
  /// inline agent needs to carry out.
  ///
  /// Parameter [agentCollaboration] :
  /// Defines how the inline collaborator agent handles information across
  /// multiple collaborator agents to coordinate a final response. The inline
  /// collaborator agent can also be the supervisor.
  ///
  /// Parameter [agentName] :
  /// The name for the agent.
  ///
  /// Parameter [bedrockModelConfigurations] :
  /// Model settings for the request.
  ///
  /// Parameter [collaboratorConfigurations] :
  /// Settings for an inline agent collaborator called with <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeInlineAgent.html">InvokeInlineAgent</a>.
  ///
  /// Parameter [collaborators] :
  /// List of collaborator inline agents.
  ///
  /// Parameter [customOrchestration] :
  /// Contains details of the custom orchestration configured for the agent.
  ///
  /// Parameter [customerEncryptionKeyArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Web Services KMS key to use
  /// to encrypt your inline agent.
  ///
  /// Parameter [enableTrace] :
  /// Specifies whether to turn on the trace or not to track the agent's
  /// reasoning process. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/trace-events.html">Using
  /// trace</a>.
  ///
  /// Parameter [endSession] :
  /// Specifies whether to end the session with the inline agent or not.
  ///
  /// Parameter [guardrailConfiguration] :
  /// The <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails.html">guardrails</a>
  /// to assign to the inline agent.
  ///
  /// Parameter [idleSessionTTLInSeconds] :
  /// The number of seconds for which the inline agent should maintain session
  /// information. After this time expires, the subsequent
  /// <code>InvokeInlineAgent</code> request begins a new session.
  ///
  /// A user interaction remains active for the amount of time specified. If no
  /// conversation occurs during this time, the session expires and the data
  /// provided before the timeout is deleted.
  ///
  /// Parameter [inlineSessionState] :
  /// Parameters that specify the various attributes of a sessions. You can
  /// include attributes for the session or prompt or, if you configured an
  /// action group to return control, results from invocation of the action
  /// group. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-session-state.html">Control
  /// session context</a>.
  /// <note>
  /// If you include <code>returnControlInvocationResults</code> in the
  /// <code>sessionState</code> field, the <code>inputText</code> field will be
  /// ignored.
  /// </note>
  ///
  /// Parameter [inputText] :
  /// The prompt text to send to the agent.
  /// <note>
  /// If you include <code>returnControlInvocationResults</code> in the
  /// <code>sessionState</code> field, the <code>inputText</code> field will be
  /// ignored.
  /// </note>
  ///
  /// Parameter [knowledgeBases] :
  /// Contains information of the knowledge bases to associate with.
  ///
  /// Parameter [orchestrationType] :
  /// Specifies the type of orchestration strategy for the agent. This is set to
  /// DEFAULT orchestration type, by default.
  ///
  /// Parameter [promptCreationConfigurations] :
  /// Specifies parameters that control how the service populates the agent
  /// prompt for an <code>InvokeInlineAgent</code> request. You can control
  /// which aspects of previous invocations in the same agent session the
  /// service uses to populate the agent prompt. This gives you more granular
  /// control over the contextual history that is used to process the current
  /// request.
  ///
  /// Parameter [promptOverrideConfiguration] :
  /// Configurations for advanced prompts used to override the default prompts
  /// to enhance the accuracy of the inline agent.
  ///
  /// Parameter [streamingConfigurations] :
  /// Specifies the configurations for streaming.
  /// <note>
  /// To use agent streaming, you need permissions to perform the
  /// <code>bedrock:InvokeModelWithResponseStream</code> action.
  /// </note>
  Future<InvokeInlineAgentResponse> invokeInlineAgent({
    required String foundationModel,
    required String instruction,
    required String sessionId,
    List<AgentActionGroup>? actionGroups,
    AgentCollaboration? agentCollaboration,
    String? agentName,
    InlineBedrockModelConfigurations? bedrockModelConfigurations,
    List<CollaboratorConfiguration>? collaboratorConfigurations,
    List<Collaborator>? collaborators,
    CustomOrchestration? customOrchestration,
    String? customerEncryptionKeyArn,
    bool? enableTrace,
    bool? endSession,
    GuardrailConfigurationWithArn? guardrailConfiguration,
    int? idleSessionTTLInSeconds,
    InlineSessionState? inlineSessionState,
    String? inputText,
    List<KnowledgeBase>? knowledgeBases,
    OrchestrationType? orchestrationType,
    PromptCreationConfigurations? promptCreationConfigurations,
    PromptOverrideConfiguration? promptOverrideConfiguration,
    StreamingConfigurations? streamingConfigurations,
  }) async {
    _s.validateNumRange(
      'idleSessionTTLInSeconds',
      idleSessionTTLInSeconds,
      60,
      3600,
    );
    final $payload = <String, dynamic>{
      'foundationModel': foundationModel,
      'instruction': instruction,
      if (actionGroups != null) 'actionGroups': actionGroups,
      if (agentCollaboration != null)
        'agentCollaboration': agentCollaboration.value,
      if (agentName != null) 'agentName': agentName,
      if (bedrockModelConfigurations != null)
        'bedrockModelConfigurations': bedrockModelConfigurations,
      if (collaboratorConfigurations != null)
        'collaboratorConfigurations': collaboratorConfigurations,
      if (collaborators != null) 'collaborators': collaborators,
      if (customOrchestration != null)
        'customOrchestration': customOrchestration,
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
      if (enableTrace != null) 'enableTrace': enableTrace,
      if (endSession != null) 'endSession': endSession,
      if (guardrailConfiguration != null)
        'guardrailConfiguration': guardrailConfiguration,
      if (idleSessionTTLInSeconds != null)
        'idleSessionTTLInSeconds': idleSessionTTLInSeconds,
      if (inlineSessionState != null) 'inlineSessionState': inlineSessionState,
      if (inputText != null) 'inputText': inputText,
      if (knowledgeBases != null) 'knowledgeBases': knowledgeBases,
      if (orchestrationType != null)
        'orchestrationType': orchestrationType.value,
      if (promptCreationConfigurations != null)
        'promptCreationConfigurations': promptCreationConfigurations,
      if (promptOverrideConfiguration != null)
        'promptOverrideConfiguration': promptOverrideConfiguration,
      if (streamingConfigurations != null)
        'streamingConfigurations': streamingConfigurations,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/agents/${Uri.encodeComponent(sessionId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return InvokeInlineAgentResponse(
      completion: InlineAgentResponseStream.fromJson($json),
      contentType: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-bedrock-agent-content-type')!,
      sessionId: _s.extractHeaderStringValue(
          response.headers, 'x-amz-bedrock-agent-session-id')!,
    );
  }

  /// Deletes memory from the specified memory identifier.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadGatewayException].
  /// May throw [ConflictException].
  /// May throw [DependencyFailedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentAliasId] :
  /// The unique identifier of an alias of an agent.
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent to which the alias belongs.
  ///
  /// Parameter [memoryId] :
  /// The unique identifier of the memory.
  ///
  /// Parameter [sessionId] :
  /// The unique session identifier of the memory.
  Future<void> deleteAgentMemory({
    required String agentAliasId,
    required String agentId,
    String? memoryId,
    String? sessionId,
  }) async {
    final $query = <String, List<String>>{
      if (memoryId != null) 'memoryId': [memoryId],
      if (sessionId != null) 'sessionId': [sessionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentAliases/${Uri.encodeComponent(agentAliasId)}/memories',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets the sessions stored in the memory of the agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadGatewayException].
  /// May throw [ConflictException].
  /// May throw [DependencyFailedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentAliasId] :
  /// The unique identifier of an alias of an agent.
  ///
  /// Parameter [agentId] :
  /// The unique identifier of the agent to which the alias belongs.
  ///
  /// Parameter [memoryId] :
  /// The unique identifier of the memory.
  ///
  /// Parameter [memoryType] :
  /// The type of memory.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of items to return in the response. If the total number
  /// of results is greater than this value, use the token returned in the
  /// response in the <code>nextToken</code> field when making another request
  /// to return the next batch of results.
  ///
  /// Parameter [nextToken] :
  /// If the total number of results is greater than the maxItems value provided
  /// in the request, enter the token returned in the <code>nextToken</code>
  /// field in the response in this field to return the next batch of results.
  Future<GetAgentMemoryResponse> getAgentMemory({
    required String agentAliasId,
    required String agentId,
    required String memoryId,
    required MemoryType memoryType,
    int? maxItems,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'memoryId': [memoryId],
      'memoryType': [memoryType.value],
      if (maxItems != null) 'maxItems': [maxItems.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentAliases/${Uri.encodeComponent(agentAliasId)}/memories',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetAgentMemoryResponse.fromJson(response);
  }

  /// Optimizes a prompt for the task that you specify. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-optimize.html">Optimize
  /// a prompt</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadGatewayException].
  /// May throw [DependencyFailedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [input] :
  /// Contains the prompt to optimize.
  ///
  /// Parameter [targetModelId] :
  /// The unique identifier of the model that you want to optimize the prompt
  /// for.
  Future<OptimizePromptResponse> optimizePrompt({
    required InputPrompt input,
    required String targetModelId,
  }) async {
    final $payload = <String, dynamic>{
      'input': input,
      'targetModelId': targetModelId,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/optimize-prompt',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return OptimizePromptResponse(
      optimizedPrompt: OptimizedPromptStream.fromJson($json),
    );
  }

  /// Reranks the relevance of sources based on queries. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/rerank.html">Improve
  /// the relevance of query responses with a reranker model</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadGatewayException].
  /// May throw [ConflictException].
  /// May throw [DependencyFailedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [queries] :
  /// An array of objects, each of which contains information about a query to
  /// submit to the reranker model.
  ///
  /// Parameter [rerankingConfiguration] :
  /// Contains configurations for reranking.
  ///
  /// Parameter [sources] :
  /// An array of objects, each of which contains information about the sources
  /// to rerank.
  ///
  /// Parameter [nextToken] :
  /// If the total number of results was greater than could fit in a response, a
  /// token is returned in the <code>nextToken</code> field. You can enter that
  /// token in this field to return the next batch of results.
  Future<RerankResponse> rerank({
    required List<RerankQuery> queries,
    required RerankingConfiguration rerankingConfiguration,
    required List<RerankSource> sources,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'queries': queries,
      'rerankingConfiguration': rerankingConfiguration,
      'sources': sources,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/rerank',
      exceptionFnMap: _exceptionFns,
    );
    return RerankResponse.fromJson(response);
  }

  /// Queries a knowledge base and generates responses based on the retrieved
  /// results and using the specified foundation model or <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/cross-region-inference.html">inference
  /// profile</a>. The response only cites sources that are relevant to the
  /// query.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadGatewayException].
  /// May throw [ConflictException].
  /// May throw [DependencyFailedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [input] :
  /// Contains the query to be made to the knowledge base.
  ///
  /// Parameter [retrieveAndGenerateConfiguration] :
  /// Contains configurations for the knowledge base query and retrieval
  /// process. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-test-config.html">Query
  /// configurations</a>.
  ///
  /// Parameter [sessionConfiguration] :
  /// Contains details about the session with the knowledge base.
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the session. When you first make a
  /// <code>RetrieveAndGenerate</code> request, Amazon Bedrock automatically
  /// generates this value. You must reuse this value for all subsequent
  /// requests in the same conversational session. This value allows Amazon
  /// Bedrock to maintain context and knowledge from previous interactions. You
  /// can't explicitly set the <code>sessionId</code> yourself.
  Future<RetrieveAndGenerateResponse> retrieveAndGenerate({
    required RetrieveAndGenerateInput input,
    RetrieveAndGenerateConfiguration? retrieveAndGenerateConfiguration,
    RetrieveAndGenerateSessionConfiguration? sessionConfiguration,
    String? sessionId,
  }) async {
    final $payload = <String, dynamic>{
      'input': input,
      if (retrieveAndGenerateConfiguration != null)
        'retrieveAndGenerateConfiguration': retrieveAndGenerateConfiguration,
      if (sessionConfiguration != null)
        'sessionConfiguration': sessionConfiguration,
      if (sessionId != null) 'sessionId': sessionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/retrieveAndGenerate',
      exceptionFnMap: _exceptionFns,
    );
    return RetrieveAndGenerateResponse.fromJson(response);
  }

  /// Queries a knowledge base and generates responses based on the retrieved
  /// results, with output in streaming format.
  /// <note>
  /// The CLI doesn't support streaming operations in Amazon Bedrock, including
  /// <code>InvokeModelWithResponseStream</code>.
  /// </note>
  /// This operation requires permission for the <code>
  /// bedrock:RetrieveAndGenerate</code> action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadGatewayException].
  /// May throw [ConflictException].
  /// May throw [DependencyFailedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [input] :
  /// Contains the query to be made to the knowledge base.
  ///
  /// Parameter [retrieveAndGenerateConfiguration] :
  /// Contains configurations for the knowledge base query and retrieval
  /// process. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-test-config.html">Query
  /// configurations</a>.
  ///
  /// Parameter [sessionConfiguration] :
  /// Contains details about the session with the knowledge base.
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the session. When you first make a
  /// <code>RetrieveAndGenerate</code> request, Amazon Bedrock automatically
  /// generates this value. You must reuse this value for all subsequent
  /// requests in the same conversational session. This value allows Amazon
  /// Bedrock to maintain context and knowledge from previous interactions. You
  /// can't explicitly set the <code>sessionId</code> yourself.
  Future<RetrieveAndGenerateStreamResponse> retrieveAndGenerateStream({
    required RetrieveAndGenerateInput input,
    RetrieveAndGenerateConfiguration? retrieveAndGenerateConfiguration,
    RetrieveAndGenerateSessionConfiguration? sessionConfiguration,
    String? sessionId,
  }) async {
    final $payload = <String, dynamic>{
      'input': input,
      if (retrieveAndGenerateConfiguration != null)
        'retrieveAndGenerateConfiguration': retrieveAndGenerateConfiguration,
      if (sessionConfiguration != null)
        'sessionConfiguration': sessionConfiguration,
      if (sessionId != null) 'sessionId': sessionId,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/retrieveAndGenerateStream',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return RetrieveAndGenerateStreamResponse(
      stream: RetrieveAndGenerateStreamResponseOutput.fromJson($json),
      sessionId: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-bedrock-knowledge-base-session-id')!,
    );
  }

  /// Queries a knowledge base and retrieves information from it.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadGatewayException].
  /// May throw [ConflictException].
  /// May throw [DependencyFailedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base to query.
  ///
  /// Parameter [retrievalQuery] :
  /// Contains the query to send the knowledge base.
  ///
  /// Parameter [guardrailConfiguration] :
  /// Guardrail settings.
  ///
  /// Parameter [nextToken] :
  /// If there are more results than can fit in the response, the response
  /// returns a <code>nextToken</code>. Use this token in the
  /// <code>nextToken</code> field of another request to retrieve the next batch
  /// of results.
  ///
  /// Parameter [retrievalConfiguration] :
  /// Contains configurations for the knowledge base query and retrieval
  /// process. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-test-config.html">Query
  /// configurations</a>.
  Future<RetrieveResponse> retrieve({
    required String knowledgeBaseId,
    required KnowledgeBaseQuery retrievalQuery,
    GuardrailConfiguration? guardrailConfiguration,
    String? nextToken,
    KnowledgeBaseRetrievalConfiguration? retrievalConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'retrievalQuery': retrievalQuery,
      if (guardrailConfiguration != null)
        'guardrailConfiguration': guardrailConfiguration,
      if (nextToken != null) 'nextToken': nextToken,
      if (retrievalConfiguration != null)
        'retrievalConfiguration': retrievalConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/knowledgebases/${Uri.encodeComponent(knowledgeBaseId)}/retrieve',
      exceptionFnMap: _exceptionFns,
    );
    return RetrieveResponse.fromJson(response);
  }

  /// Creates a session to temporarily store conversations for generative AI
  /// (GenAI) applications built with open-source frameworks such as LangGraph
  /// and LlamaIndex. Sessions enable you to save the state of conversations at
  /// checkpoints, with the added security and infrastructure of Amazon Web
  /// Services. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/sessions.html">Store
  /// and retrieve conversation history and context with Amazon Bedrock
  /// sessions</a>.
  ///
  /// By default, Amazon Bedrock uses Amazon Web Services-managed keys for
  /// session encryption, including session metadata, or you can use your own
  /// KMS key. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/session-encryption.html">Amazon
  /// Bedrock session encryption</a>.
  /// <note>
  /// You use a session to store state and conversation history for generative
  /// AI applications built with open-source frameworks. For Amazon Bedrock
  /// Agents, the service automatically manages conversation context and
  /// associates them with the agent-specific sessionId you specify in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html">InvokeAgent</a>
  /// API operation.
  /// </note>
  /// Related APIs:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_ListSessions.html">ListSessions</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_GetSession.html">GetSession</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_EndSession.html">EndSession</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_DeleteSession.html">DeleteSession</a>
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
  /// Parameter [encryptionKeyArn] :
  /// The Amazon Resource Name (ARN) of the KMS key to use to encrypt the
  /// session data. The user or role creating the session must have permission
  /// to use the key. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/session-encryption.html">Amazon
  /// Bedrock session encryption</a>.
  ///
  /// Parameter [sessionMetadata] :
  /// A map of key-value pairs containing attributes to be persisted across the
  /// session. For example, the user's ID, their language preference, and the
  /// type of device they are using.
  ///
  /// Parameter [tags] :
  /// Specify the key-value pairs for the tags that you want to attach to the
  /// session.
  Future<CreateSessionResponse> createSession({
    String? encryptionKeyArn,
    Map<String, String>? sessionMetadata,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (encryptionKeyArn != null) 'encryptionKeyArn': encryptionKeyArn,
      if (sessionMetadata != null) 'sessionMetadata': sessionMetadata,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/sessions/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSessionResponse.fromJson(response);
  }

  /// Retrieves details about a specific session. For more information about
  /// sessions, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/sessions.html">Store
  /// and retrieve conversation history and context with Amazon Bedrock
  /// sessions</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sessionIdentifier] :
  /// A unique identifier for the session to retrieve. You can specify either
  /// the session's <code>sessionId</code> or its Amazon Resource Name (ARN).
  Future<GetSessionResponse> getSession({
    required String sessionIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sessions/${Uri.encodeComponent(sessionIdentifier)}/',
      exceptionFnMap: _exceptionFns,
    );
    return GetSessionResponse.fromJson(response);
  }

  /// Updates the metadata or encryption settings of a session. For more
  /// information about sessions, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/sessions.html">Store
  /// and retrieve conversation history and context with Amazon Bedrock
  /// sessions</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sessionIdentifier] :
  /// The unique identifier of the session to modify. You can specify either the
  /// session's <code>sessionId</code> or its Amazon Resource Name (ARN).
  ///
  /// Parameter [sessionMetadata] :
  /// A map of key-value pairs containing attributes to be persisted across the
  /// session. For example the user's ID, their language preference, and the
  /// type of device they are using.
  Future<UpdateSessionResponse> updateSession({
    required String sessionIdentifier,
    Map<String, String>? sessionMetadata,
  }) async {
    final $payload = <String, dynamic>{
      if (sessionMetadata != null) 'sessionMetadata': sessionMetadata,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/sessions/${Uri.encodeComponent(sessionIdentifier)}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSessionResponse.fromJson(response);
  }

  /// Deletes a session that you ended. You can't delete a session with an
  /// <code>ACTIVE</code> status. To delete an active session, you must first
  /// end it with the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_EndSession.html">EndSession</a>
  /// API operation. For more information about sessions, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/sessions.html">Store
  /// and retrieve conversation history and context with Amazon Bedrock
  /// sessions</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sessionIdentifier] :
  /// The unique identifier for the session to be deleted. You can specify
  /// either the session's <code>sessionId</code> or its Amazon Resource Name
  /// (ARN).
  Future<void> deleteSession({
    required String sessionIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/sessions/${Uri.encodeComponent(sessionIdentifier)}/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all sessions in your Amazon Web Services account. For more
  /// information about sessions, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/sessions.html">Store
  /// and retrieve conversation history and context with Amazon Bedrock
  /// sessions</a>.
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
  Future<ListSessionsResponse> listSessions({
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
      method: 'POST',
      requestUri: '/sessions/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSessionsResponse.fromJson(response);
  }

  /// Ends the session. After you end a session, you can still access its
  /// content but you can’t add to it. To delete the session and it's content,
  /// you use the DeleteSession API operation. For more information about
  /// sessions, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/sessions.html">Store
  /// and retrieve conversation history and context with Amazon Bedrock
  /// sessions</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sessionIdentifier] :
  /// The unique identifier for the session to end. You can specify either the
  /// session's <code>sessionId</code> or its Amazon Resource Name (ARN).
  Future<EndSessionResponse> endSession({
    required String sessionIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PATCH',
      requestUri: '/sessions/${Uri.encodeComponent(sessionIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return EndSessionResponse.fromJson(response);
  }

  /// Creates a new invocation within a session. An invocation groups the
  /// related invocation steps that store the content from a conversation. For
  /// more information about sessions, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/sessions.html">Store
  /// and retrieve conversation history and context with Amazon Bedrock
  /// sessions</a>.
  ///
  /// Related APIs
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_ListInvocations.html">ListInvocations</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_ListSessions.html">ListSessions</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_GetSession.html">GetSession</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sessionIdentifier] :
  /// The unique identifier for the associated session for the invocation. You
  /// can specify either the session's <code>sessionId</code> or its Amazon
  /// Resource Name (ARN).
  ///
  /// Parameter [description] :
  /// A description for the interactions in the invocation. For example, "User
  /// asking about weather in Seattle".
  ///
  /// Parameter [invocationId] :
  /// A unique identifier for the invocation in UUID format.
  Future<CreateInvocationResponse> createInvocation({
    required String sessionIdentifier,
    String? description,
    String? invocationId,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (invocationId != null) 'invocationId': invocationId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/sessions/${Uri.encodeComponent(sessionIdentifier)}/invocations/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateInvocationResponse.fromJson(response);
  }

  /// Lists all invocations associated with a specific session. For more
  /// information about sessions, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/sessions.html">Store
  /// and retrieve conversation history and context with Amazon Bedrock
  /// sessions</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sessionIdentifier] :
  /// The unique identifier for the session to list invocations for. You can
  /// specify either the session's <code>sessionId</code> or its Amazon Resource
  /// Name (ARN).
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
  Future<ListInvocationsResponse> listInvocations({
    required String sessionIdentifier,
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
      method: 'POST',
      requestUri:
          '/sessions/${Uri.encodeComponent(sessionIdentifier)}/invocations/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInvocationsResponse.fromJson(response);
  }

  /// Add an invocation step to an invocation in a session. An invocation step
  /// stores fine-grained state checkpoints, including text and images, for each
  /// interaction. For more information about sessions, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/sessions.html">Store
  /// and retrieve conversation history and context with Amazon Bedrock
  /// sessions</a>.
  ///
  /// Related APIs:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_GetInvocationStep.html">GetInvocationStep</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_ListInvocationSteps.html">ListInvocationSteps</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_ListInvocations.html">ListInvocations</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_ListInvocations.html">ListSessions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [invocationIdentifier] :
  /// The unique identifier (in UUID format) of the invocation to add the
  /// invocation step to.
  ///
  /// Parameter [invocationStepTime] :
  /// The timestamp for when the invocation step occurred.
  ///
  /// Parameter [payload] :
  /// The payload for the invocation step, including text and images for the
  /// interaction.
  ///
  /// Parameter [sessionIdentifier] :
  /// The unique identifier for the session to add the invocation step to. You
  /// can specify either the session's <code>sessionId</code> or its Amazon
  /// Resource Name (ARN).
  ///
  /// Parameter [invocationStepId] :
  /// The unique identifier of the invocation step in UUID format.
  Future<PutInvocationStepResponse> putInvocationStep({
    required String invocationIdentifier,
    required DateTime invocationStepTime,
    required InvocationStepPayload payload,
    required String sessionIdentifier,
    String? invocationStepId,
  }) async {
    final $payload = <String, dynamic>{
      'invocationIdentifier': invocationIdentifier,
      'invocationStepTime': iso8601ToJson(invocationStepTime),
      'payload': payload,
      if (invocationStepId != null) 'invocationStepId': invocationStepId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/sessions/${Uri.encodeComponent(sessionIdentifier)}/invocationSteps/',
      exceptionFnMap: _exceptionFns,
    );
    return PutInvocationStepResponse.fromJson(response);
  }

  /// Retrieves the details of a specific invocation step within an invocation
  /// in a session. For more information about sessions, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/sessions.html">Store
  /// and retrieve conversation history and context with Amazon Bedrock
  /// sessions</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [invocationIdentifier] :
  /// The unique identifier for the invocation in UUID format.
  ///
  /// Parameter [invocationStepId] :
  /// The unique identifier (in UUID format) for the specific invocation step to
  /// retrieve.
  ///
  /// Parameter [sessionIdentifier] :
  /// The unique identifier for the invocation step's associated session. You
  /// can specify either the session's <code>sessionId</code> or its Amazon
  /// Resource Name (ARN).
  Future<GetInvocationStepResponse> getInvocationStep({
    required String invocationIdentifier,
    required String invocationStepId,
    required String sessionIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'invocationIdentifier': invocationIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sessions/${Uri.encodeComponent(sessionIdentifier)}/invocationSteps/${Uri.encodeComponent(invocationStepId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetInvocationStepResponse.fromJson(response);
  }

  /// Lists all invocation steps associated with a session and optionally, an
  /// invocation within the session. For more information about sessions, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/sessions.html">Store
  /// and retrieve conversation history and context with Amazon Bedrock
  /// sessions</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sessionIdentifier] :
  /// The unique identifier for the session associated with the invocation
  /// steps. You can specify either the session's <code>sessionId</code> or its
  /// Amazon Resource Name (ARN).
  ///
  /// Parameter [invocationIdentifier] :
  /// The unique identifier (in UUID format) for the invocation to list
  /// invocation steps for.
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
  Future<ListInvocationStepsResponse> listInvocationSteps({
    required String sessionIdentifier,
    String? invocationIdentifier,
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
    final $payload = <String, dynamic>{
      if (invocationIdentifier != null)
        'invocationIdentifier': invocationIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sessions/${Uri.encodeComponent(sessionIdentifier)}/invocationSteps/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInvocationStepsResponse.fromJson(response);
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
}

class GetExecutionFlowSnapshotResponse {
  /// The flow definition used for the flow execution, including the nodes,
  /// connections, and configuration at the time when the execution started.
  ///
  /// The definition returns as a string that follows the structure of a <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_FlowDefinition.html">FlowDefinition</a>
  /// object.
  final String definition;

  /// The Amazon Resource Name (ARN) of the IAM service role that's used by the
  /// flow execution.
  final String executionRoleArn;

  /// The unique identifier of the flow alias used for the flow execution.
  final String flowAliasIdentifier;

  /// The unique identifier of the flow.
  final String flowIdentifier;

  /// The version of the flow used for the flow execution.
  final String flowVersion;

  /// The Amazon Resource Name (ARN) of the customer managed KMS key that's used
  /// to encrypt the flow snapshot.
  final String? customerEncryptionKeyArn;

  GetExecutionFlowSnapshotResponse({
    required this.definition,
    required this.executionRoleArn,
    required this.flowAliasIdentifier,
    required this.flowIdentifier,
    required this.flowVersion,
    this.customerEncryptionKeyArn,
  });

  factory GetExecutionFlowSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return GetExecutionFlowSnapshotResponse(
      definition: (json['definition'] as String?) ?? '',
      executionRoleArn: (json['executionRoleArn'] as String?) ?? '',
      flowAliasIdentifier: (json['flowAliasIdentifier'] as String?) ?? '',
      flowIdentifier: (json['flowIdentifier'] as String?) ?? '',
      flowVersion: (json['flowVersion'] as String?) ?? '',
      customerEncryptionKeyArn: json['customerEncryptionKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final executionRoleArn = this.executionRoleArn;
    final flowAliasIdentifier = this.flowAliasIdentifier;
    final flowIdentifier = this.flowIdentifier;
    final flowVersion = this.flowVersion;
    final customerEncryptionKeyArn = this.customerEncryptionKeyArn;
    return {
      'definition': definition,
      'executionRoleArn': executionRoleArn,
      'flowAliasIdentifier': flowAliasIdentifier,
      'flowIdentifier': flowIdentifier,
      'flowVersion': flowVersion,
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
    };
  }
}

/// The request is denied because of missing access permissions. Check your
/// permissions and retry your request.
class AccessDeniedException implements _s.AwsException {
  final String? message;

  AccessDeniedException({
    this.message,
  });

  factory AccessDeniedException.fromJson(Map<String, dynamic> json) {
    return AccessDeniedException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// An internal server error occurred. Retry your request.
class InternalServerException implements _s.AwsException {
  final String? message;

  /// The reason for the exception. If the reason is
  /// <code>BEDROCK_MODEL_INVOCATION_SERVICE_UNAVAILABLE</code>, the model
  /// invocation service is unavailable. Retry your request.
  final String? reason;

  InternalServerException({
    this.message,
    this.reason,
  });

  factory InternalServerException.fromJson(Map<String, dynamic> json) {
    return InternalServerException(
      message: json['message'] as String?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final reason = this.reason;
    return {
      if (message != null) 'message': message,
      if (reason != null) 'reason': reason,
    };
  }
}

/// The specified resource Amazon Resource Name (ARN) was not found. Check the
/// Amazon Resource Name (ARN) and try your request again.
class ResourceNotFoundException implements _s.AwsException {
  final String? message;

  ResourceNotFoundException({
    this.message,
  });

  factory ResourceNotFoundException.fromJson(Map<String, dynamic> json) {
    return ResourceNotFoundException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// The number of requests exceeds the limit. Resubmit your request later.
class ThrottlingException implements _s.AwsException {
  final String? message;

  ThrottlingException({
    this.message,
  });

  factory ThrottlingException.fromJson(Map<String, dynamic> json) {
    return ThrottlingException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// Input validation failed. Check your request parameters and retry the
/// request.
class ValidationException implements _s.AwsException {
  final String? message;

  ValidationException({
    this.message,
  });

  factory ValidationException.fromJson(Map<String, dynamic> json) {
    return ValidationException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

class GetFlowExecutionResponse {
  /// The Amazon Resource Name (ARN) that uniquely identifies the flow execution.
  final String executionArn;

  /// The unique identifier of the flow alias used for the execution.
  final String flowAliasIdentifier;

  /// The unique identifier of the flow.
  final String flowIdentifier;

  /// The version of the flow used for the execution.
  final String flowVersion;

  /// The timestamp when the flow execution started.
  final DateTime startedAt;

  /// The current status of the flow execution.
  ///
  /// Flow executions time out after 24 hours.
  final FlowExecutionStatus status;

  /// The timestamp when the flow execution ended. This field is only populated
  /// when the execution has completed, failed, timed out, or been aborted.
  final DateTime? endedAt;

  /// A list of errors that occurred during the flow execution. Each error
  /// includes an error code, message, and the node where the error occurred, if
  /// applicable.
  final List<FlowExecutionError>? errors;

  GetFlowExecutionResponse({
    required this.executionArn,
    required this.flowAliasIdentifier,
    required this.flowIdentifier,
    required this.flowVersion,
    required this.startedAt,
    required this.status,
    this.endedAt,
    this.errors,
  });

  factory GetFlowExecutionResponse.fromJson(Map<String, dynamic> json) {
    return GetFlowExecutionResponse(
      executionArn: (json['executionArn'] as String?) ?? '',
      flowAliasIdentifier: (json['flowAliasIdentifier'] as String?) ?? '',
      flowIdentifier: (json['flowIdentifier'] as String?) ?? '',
      flowVersion: (json['flowVersion'] as String?) ?? '',
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] ?? 0),
      status: FlowExecutionStatus.fromString((json['status'] as String?) ?? ''),
      endedAt: timeStampFromJson(json['endedAt']),
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map((e) => FlowExecutionError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final executionArn = this.executionArn;
    final flowAliasIdentifier = this.flowAliasIdentifier;
    final flowIdentifier = this.flowIdentifier;
    final flowVersion = this.flowVersion;
    final startedAt = this.startedAt;
    final status = this.status;
    final endedAt = this.endedAt;
    final errors = this.errors;
    return {
      'executionArn': executionArn,
      'flowAliasIdentifier': flowAliasIdentifier,
      'flowIdentifier': flowIdentifier,
      'flowVersion': flowVersion,
      'startedAt': iso8601ToJson(startedAt),
      'status': status.value,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (errors != null) 'errors': errors,
    };
  }
}

class ListFlowExecutionEventsResponse {
  /// A list of events that occurred during the flow execution. Events can include
  /// node inputs and outputs, flow inputs and outputs, condition results, and
  /// failure events.
  final List<FlowExecutionEvent> flowExecutionEvents;

  /// A token to retrieve the next set of results. This value is returned if more
  /// results are available.
  final String? nextToken;

  ListFlowExecutionEventsResponse({
    required this.flowExecutionEvents,
    this.nextToken,
  });

  factory ListFlowExecutionEventsResponse.fromJson(Map<String, dynamic> json) {
    return ListFlowExecutionEventsResponse(
      flowExecutionEvents: ((json['flowExecutionEvents'] as List?) ?? const [])
          .nonNulls
          .map((e) => FlowExecutionEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flowExecutionEvents = this.flowExecutionEvents;
    final nextToken = this.nextToken;
    return {
      'flowExecutionEvents': flowExecutionEvents,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFlowExecutionsResponse {
  /// A list of flow execution summaries. Each summary includes the execution ARN,
  /// flow identifier, flow alias identifier, flow version, status, and
  /// timestamps.
  final List<FlowExecutionSummary> flowExecutionSummaries;

  /// A token to retrieve the next set of results. This value is returned if more
  /// results are available.
  final String? nextToken;

  ListFlowExecutionsResponse({
    required this.flowExecutionSummaries,
    this.nextToken,
  });

  factory ListFlowExecutionsResponse.fromJson(Map<String, dynamic> json) {
    return ListFlowExecutionsResponse(
      flowExecutionSummaries: ((json['flowExecutionSummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => FlowExecutionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flowExecutionSummaries = this.flowExecutionSummaries;
    final nextToken = this.nextToken;
    return {
      'flowExecutionSummaries': flowExecutionSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class StartFlowExecutionResponse {
  /// The Amazon Resource Name (ARN) that uniquely identifies the flow execution.
  final String? executionArn;

  StartFlowExecutionResponse({
    this.executionArn,
  });

  factory StartFlowExecutionResponse.fromJson(Map<String, dynamic> json) {
    return StartFlowExecutionResponse(
      executionArn: json['executionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionArn = this.executionArn;
    return {
      if (executionArn != null) 'executionArn': executionArn,
    };
  }
}

/// There was an issue with a dependency due to a server issue. Retry your
/// request.
class BadGatewayException implements _s.AwsException {
  final String? message;

  /// The name of the dependency that caused the issue, such as Amazon Bedrock,
  /// Lambda, or STS.
  final String? resourceName;

  BadGatewayException({
    this.message,
    this.resourceName,
  });

  factory BadGatewayException.fromJson(Map<String, dynamic> json) {
    return BadGatewayException(
      message: json['message'] as String?,
      resourceName: json['resourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final resourceName = this.resourceName;
    return {
      if (message != null) 'message': message,
      if (resourceName != null) 'resourceName': resourceName,
    };
  }
}

/// There was a conflict performing an operation. Resolve the conflict and retry
/// your request.
class ConflictException implements _s.AwsException {
  final String? message;

  ConflictException({
    this.message,
  });

  factory ConflictException.fromJson(Map<String, dynamic> json) {
    return ConflictException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// There was an issue with a dependency. Check the resource configurations and
/// retry the request.
class DependencyFailedException implements _s.AwsException {
  final String? message;

  /// The name of the dependency that caused the issue, such as Amazon Bedrock,
  /// Lambda, or STS.
  final String? resourceName;

  DependencyFailedException({
    this.message,
    this.resourceName,
  });

  factory DependencyFailedException.fromJson(Map<String, dynamic> json) {
    return DependencyFailedException(
      message: json['message'] as String?,
      resourceName: json['resourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final resourceName = this.resourceName;
    return {
      if (message != null) 'message': message,
      if (resourceName != null) 'resourceName': resourceName,
    };
  }
}

/// The number of requests exceeds the service quota. Resubmit your request
/// later.
class ServiceQuotaExceededException implements _s.AwsException {
  final String? message;

  ServiceQuotaExceededException({
    this.message,
  });

  factory ServiceQuotaExceededException.fromJson(Map<String, dynamic> json) {
    return ServiceQuotaExceededException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

class StopFlowExecutionResponse {
  /// The updated status of the flow execution after the stop request. This will
  /// typically be ABORTED if the execution was successfully stopped.
  final FlowExecutionStatus status;

  /// The Amazon Resource Name (ARN) that uniquely identifies the flow execution
  /// that was stopped.
  final String? executionArn;

  StopFlowExecutionResponse({
    required this.status,
    this.executionArn,
  });

  factory StopFlowExecutionResponse.fromJson(Map<String, dynamic> json) {
    return StopFlowExecutionResponse(
      status: FlowExecutionStatus.fromString((json['status'] as String?) ?? ''),
      executionArn: json['executionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final executionArn = this.executionArn;
    return {
      'status': status.value,
      if (executionArn != null) 'executionArn': executionArn,
    };
  }
}

class InvokeFlowResponse {
  /// The output of the flow, returned as a stream. If there's an error, the error
  /// is returned.
  final FlowResponseStream responseStream;

  /// The unique identifier for the current flow execution.
  final String? executionId;

  InvokeFlowResponse({
    required this.responseStream,
    this.executionId,
  });

  Map<String, dynamic> toJson() {
    final responseStream = this.responseStream;
    final executionId = this.executionId;
    return {
      'responseStream': responseStream,
    };
  }
}

class GenerateQueryResponse {
  /// A list of objects, each of which defines a generated query that can
  /// correspond to the natural language queries.
  final List<GeneratedQuery>? queries;

  GenerateQueryResponse({
    this.queries,
  });

  factory GenerateQueryResponse.fromJson(Map<String, dynamic> json) {
    return GenerateQueryResponse(
      queries: (json['queries'] as List?)
          ?.nonNulls
          .map((e) => GeneratedQuery.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final queries = this.queries;
    return {
      if (queries != null) 'queries': queries,
    };
  }
}

class InvokeAgentResponse {
  /// The agent's response to the user prompt.
  final ResponseStream completion;

  /// The MIME type of the input data in the request. The default value is
  /// <code>application/json</code>.
  final String contentType;

  /// The unique identifier of the session with the agent.
  final String sessionId;

  /// The unique identifier of the agent memory.
  final String? memoryId;

  InvokeAgentResponse({
    required this.completion,
    required this.contentType,
    required this.sessionId,
    this.memoryId,
  });

  Map<String, dynamic> toJson() {
    final completion = this.completion;
    final contentType = this.contentType;
    final sessionId = this.sessionId;
    final memoryId = this.memoryId;
    return {
      'completion': completion,
    };
  }
}

/// The model specified in the request is not ready to serve inference requests.
/// The AWS SDK will automatically retry the operation up to 5 times. For
/// information about configuring automatic retries, see <a
/// href="https://docs.aws.amazon.com/sdkref/latest/guide/feature-retry-behavior.html">Retry
/// behavior</a> in the <i>AWS SDKs and Tools</i> reference guide.
class ModelNotReadyException implements _s.AwsException {
  final String? message;

  ModelNotReadyException({
    this.message,
  });

  factory ModelNotReadyException.fromJson(Map<String, dynamic> json) {
    return ModelNotReadyException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

class InvokeInlineAgentResponse {
  /// The inline agent's response to the user prompt.
  final InlineAgentResponseStream completion;

  /// The MIME type of the input data in the request. The default value is
  /// application/json.
  final String contentType;

  /// The unique identifier of the session with the agent.
  final String sessionId;

  InvokeInlineAgentResponse({
    required this.completion,
    required this.contentType,
    required this.sessionId,
  });

  Map<String, dynamic> toJson() {
    final completion = this.completion;
    final contentType = this.contentType;
    final sessionId = this.sessionId;
    return {
      'completion': completion,
    };
  }
}

class DeleteAgentMemoryResponse {
  DeleteAgentMemoryResponse();

  factory DeleteAgentMemoryResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAgentMemoryResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetAgentMemoryResponse {
  /// Contains details of the sessions stored in the memory
  final List<Memory>? memoryContents;

  /// If the total number of results is greater than the maxItems value provided
  /// in the request, use this token when making another request in the
  /// <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  GetAgentMemoryResponse({
    this.memoryContents,
    this.nextToken,
  });

  factory GetAgentMemoryResponse.fromJson(Map<String, dynamic> json) {
    return GetAgentMemoryResponse(
      memoryContents: (json['memoryContents'] as List?)
          ?.nonNulls
          .map((e) => Memory.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final memoryContents = this.memoryContents;
    final nextToken = this.nextToken;
    return {
      if (memoryContents != null) 'memoryContents': memoryContents,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class OptimizePromptResponse {
  /// The prompt after being optimized for the task.
  final OptimizedPromptStream optimizedPrompt;

  OptimizePromptResponse({
    required this.optimizedPrompt,
  });

  Map<String, dynamic> toJson() {
    final optimizedPrompt = this.optimizedPrompt;
    return {
      'optimizedPrompt': optimizedPrompt,
    };
  }
}

class RerankResponse {
  /// An array of objects, each of which contains information about the results of
  /// reranking.
  final List<RerankResult> results;

  /// If the total number of results is greater than can fit in the response, use
  /// this token in the <code>nextToken</code> field when making another request
  /// to return the next batch of results.
  final String? nextToken;

  RerankResponse({
    required this.results,
    this.nextToken,
  });

  factory RerankResponse.fromJson(Map<String, dynamic> json) {
    return RerankResponse(
      results: ((json['results'] as List?) ?? const [])
          .nonNulls
          .map((e) => RerankResult.fromJson(e as Map<String, dynamic>))
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

class RetrieveAndGenerateResponse {
  /// Contains the response generated from querying the knowledge base.
  final RetrieveAndGenerateOutput output;

  /// The unique identifier of the session. When you first make a
  /// <code>RetrieveAndGenerate</code> request, Amazon Bedrock automatically
  /// generates this value. You must reuse this value for all subsequent requests
  /// in the same conversational session. This value allows Amazon Bedrock to
  /// maintain context and knowledge from previous interactions. You can't
  /// explicitly set the <code>sessionId</code> yourself.
  final String sessionId;

  /// A list of segments of the generated response that are based on sources in
  /// the knowledge base, alongside information about the sources.
  final List<Citation>? citations;

  /// Specifies if there is a guardrail intervention in the response.
  final GuadrailAction? guardrailAction;

  RetrieveAndGenerateResponse({
    required this.output,
    required this.sessionId,
    this.citations,
    this.guardrailAction,
  });

  factory RetrieveAndGenerateResponse.fromJson(Map<String, dynamic> json) {
    return RetrieveAndGenerateResponse(
      output: RetrieveAndGenerateOutput.fromJson(
          (json['output'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      sessionId: (json['sessionId'] as String?) ?? '',
      citations: (json['citations'] as List?)
          ?.nonNulls
          .map((e) => Citation.fromJson(e as Map<String, dynamic>))
          .toList(),
      guardrailAction:
          (json['guardrailAction'] as String?)?.let(GuadrailAction.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final output = this.output;
    final sessionId = this.sessionId;
    final citations = this.citations;
    final guardrailAction = this.guardrailAction;
    return {
      'output': output,
      'sessionId': sessionId,
      if (citations != null) 'citations': citations,
      if (guardrailAction != null) 'guardrailAction': guardrailAction.value,
    };
  }
}

class RetrieveAndGenerateStreamResponse {
  /// The session ID.
  final String sessionId;

  /// A stream of events from the model.
  final RetrieveAndGenerateStreamResponseOutput stream;

  RetrieveAndGenerateStreamResponse({
    required this.sessionId,
    required this.stream,
  });

  Map<String, dynamic> toJson() {
    final sessionId = this.sessionId;
    final stream = this.stream;
    return {
      'stream': stream,
    };
  }
}

class RetrieveResponse {
  /// A list of results from querying the knowledge base.
  final List<KnowledgeBaseRetrievalResult> retrievalResults;

  /// Specifies if there is a guardrail intervention in the response.
  final GuadrailAction? guardrailAction;

  /// If there are more results than can fit in the response, the response returns
  /// a <code>nextToken</code>. Use this token in the <code>nextToken</code> field
  /// of another request to retrieve the next batch of results.
  final String? nextToken;

  RetrieveResponse({
    required this.retrievalResults,
    this.guardrailAction,
    this.nextToken,
  });

  factory RetrieveResponse.fromJson(Map<String, dynamic> json) {
    return RetrieveResponse(
      retrievalResults: ((json['retrievalResults'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              KnowledgeBaseRetrievalResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      guardrailAction:
          (json['guardrailAction'] as String?)?.let(GuadrailAction.fromString),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final retrievalResults = this.retrievalResults;
    final guardrailAction = this.guardrailAction;
    final nextToken = this.nextToken;
    return {
      'retrievalResults': retrievalResults,
      if (guardrailAction != null) 'guardrailAction': guardrailAction.value,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateSessionResponse {
  /// The timestamp for when the session was created.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the created session.
  final String sessionArn;

  /// The unique identifier for the session.
  final String sessionId;

  /// The current status of the session.
  final SessionStatus sessionStatus;

  CreateSessionResponse({
    required this.createdAt,
    required this.sessionArn,
    required this.sessionId,
    required this.sessionStatus,
  });

  factory CreateSessionResponse.fromJson(Map<String, dynamic> json) {
    return CreateSessionResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      sessionArn: (json['sessionArn'] as String?) ?? '',
      sessionId: (json['sessionId'] as String?) ?? '',
      sessionStatus:
          SessionStatus.fromString((json['sessionStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final sessionArn = this.sessionArn;
    final sessionId = this.sessionId;
    final sessionStatus = this.sessionStatus;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'sessionArn': sessionArn,
      'sessionId': sessionId,
      'sessionStatus': sessionStatus.value,
    };
  }
}

class GetSessionResponse {
  /// The timestamp for when the session was created.
  final DateTime createdAt;

  /// The timestamp for when the session was last modified.
  final DateTime lastUpdatedAt;

  /// The Amazon Resource Name (ARN) of the session.
  final String sessionArn;

  /// The unique identifier for the session in UUID format.
  final String sessionId;

  /// The current status of the session.
  final SessionStatus sessionStatus;

  /// The Amazon Resource Name (ARN) of the Key Management Service key used to
  /// encrypt the session data. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/session-encryption.html">Amazon
  /// Bedrock session encryption</a>.
  final String? encryptionKeyArn;

  /// A map of key-value pairs containing attributes persisted across the session.
  final Map<String, String>? sessionMetadata;

  GetSessionResponse({
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.sessionArn,
    required this.sessionId,
    required this.sessionStatus,
    this.encryptionKeyArn,
    this.sessionMetadata,
  });

  factory GetSessionResponse.fromJson(Map<String, dynamic> json) {
    return GetSessionResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      lastUpdatedAt: nonNullableTimeStampFromJson(json['lastUpdatedAt'] ?? 0),
      sessionArn: (json['sessionArn'] as String?) ?? '',
      sessionId: (json['sessionId'] as String?) ?? '',
      sessionStatus:
          SessionStatus.fromString((json['sessionStatus'] as String?) ?? ''),
      encryptionKeyArn: json['encryptionKeyArn'] as String?,
      sessionMetadata: (json['sessionMetadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final sessionArn = this.sessionArn;
    final sessionId = this.sessionId;
    final sessionStatus = this.sessionStatus;
    final encryptionKeyArn = this.encryptionKeyArn;
    final sessionMetadata = this.sessionMetadata;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      'sessionArn': sessionArn,
      'sessionId': sessionId,
      'sessionStatus': sessionStatus.value,
      if (encryptionKeyArn != null) 'encryptionKeyArn': encryptionKeyArn,
      if (sessionMetadata != null) 'sessionMetadata': sessionMetadata,
    };
  }
}

class UpdateSessionResponse {
  /// The timestamp for when the session was created.
  final DateTime createdAt;

  /// The timestamp for when the session was last modified.
  final DateTime lastUpdatedAt;

  /// The Amazon Resource Name (ARN) of the session that was updated.
  final String sessionArn;

  /// The unique identifier of the session you updated.
  final String sessionId;

  /// The status of the session you updated.
  final SessionStatus sessionStatus;

  UpdateSessionResponse({
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.sessionArn,
    required this.sessionId,
    required this.sessionStatus,
  });

  factory UpdateSessionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSessionResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      lastUpdatedAt: nonNullableTimeStampFromJson(json['lastUpdatedAt'] ?? 0),
      sessionArn: (json['sessionArn'] as String?) ?? '',
      sessionId: (json['sessionId'] as String?) ?? '',
      sessionStatus:
          SessionStatus.fromString((json['sessionStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final sessionArn = this.sessionArn;
    final sessionId = this.sessionId;
    final sessionStatus = this.sessionStatus;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      'sessionArn': sessionArn,
      'sessionId': sessionId,
      'sessionStatus': sessionStatus.value,
    };
  }
}

class DeleteSessionResponse {
  DeleteSessionResponse();

  factory DeleteSessionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSessionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListSessionsResponse {
  /// A list of summaries for each session in your Amazon Web Services account.
  final List<SessionSummary> sessionSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListSessionsResponse({
    required this.sessionSummaries,
    this.nextToken,
  });

  factory ListSessionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSessionsResponse(
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

class EndSessionResponse {
  /// The Amazon Resource Name (ARN) of the session you ended.
  final String sessionArn;

  /// The unique identifier of the session you ended.
  final String sessionId;

  /// The current status of the session you ended.
  final SessionStatus sessionStatus;

  EndSessionResponse({
    required this.sessionArn,
    required this.sessionId,
    required this.sessionStatus,
  });

  factory EndSessionResponse.fromJson(Map<String, dynamic> json) {
    return EndSessionResponse(
      sessionArn: (json['sessionArn'] as String?) ?? '',
      sessionId: (json['sessionId'] as String?) ?? '',
      sessionStatus:
          SessionStatus.fromString((json['sessionStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final sessionArn = this.sessionArn;
    final sessionId = this.sessionId;
    final sessionStatus = this.sessionStatus;
    return {
      'sessionArn': sessionArn,
      'sessionId': sessionId,
      'sessionStatus': sessionStatus.value,
    };
  }
}

class CreateInvocationResponse {
  /// The timestamp for when the invocation was created.
  final DateTime createdAt;

  /// The unique identifier for the invocation.
  final String invocationId;

  /// The unique identifier for the session associated with the invocation.
  final String sessionId;

  CreateInvocationResponse({
    required this.createdAt,
    required this.invocationId,
    required this.sessionId,
  });

  factory CreateInvocationResponse.fromJson(Map<String, dynamic> json) {
    return CreateInvocationResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      invocationId: (json['invocationId'] as String?) ?? '',
      sessionId: (json['sessionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final invocationId = this.invocationId;
    final sessionId = this.sessionId;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'invocationId': invocationId,
      'sessionId': sessionId,
    };
  }
}

class ListInvocationsResponse {
  /// A list of invocation summaries associated with the session.
  final List<InvocationSummary> invocationSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListInvocationsResponse({
    required this.invocationSummaries,
    this.nextToken,
  });

  factory ListInvocationsResponse.fromJson(Map<String, dynamic> json) {
    return ListInvocationsResponse(
      invocationSummaries: ((json['invocationSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => InvocationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final invocationSummaries = this.invocationSummaries;
    final nextToken = this.nextToken;
    return {
      'invocationSummaries': invocationSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class PutInvocationStepResponse {
  /// The unique identifier of the invocation step in UUID format.
  final String invocationStepId;

  PutInvocationStepResponse({
    required this.invocationStepId,
  });

  factory PutInvocationStepResponse.fromJson(Map<String, dynamic> json) {
    return PutInvocationStepResponse(
      invocationStepId: (json['invocationStepId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final invocationStepId = this.invocationStepId;
    return {
      'invocationStepId': invocationStepId,
    };
  }
}

class GetInvocationStepResponse {
  /// The complete details of the requested invocation step.
  final InvocationStep invocationStep;

  GetInvocationStepResponse({
    required this.invocationStep,
  });

  factory GetInvocationStepResponse.fromJson(Map<String, dynamic> json) {
    return GetInvocationStepResponse(
      invocationStep: InvocationStep.fromJson(
          (json['invocationStep'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final invocationStep = this.invocationStep;
    return {
      'invocationStep': invocationStep,
    };
  }
}

class ListInvocationStepsResponse {
  /// A list of summaries for each invocation step associated with a session and
  /// if you specified it, an invocation within the session.
  final List<InvocationStepSummary> invocationStepSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListInvocationStepsResponse({
    required this.invocationStepSummaries,
    this.nextToken,
  });

  factory ListInvocationStepsResponse.fromJson(Map<String, dynamic> json) {
    return ListInvocationStepsResponse(
      invocationStepSummaries: ((json['invocationStepSummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => InvocationStepSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final invocationStepSummaries = this.invocationStepSummaries;
    final nextToken = this.nextToken;
    return {
      'invocationStepSummaries': invocationStepSummaries,
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

/// Contains details about an invocation step within an invocation in a session.
/// For more information about sessions, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/sessions.html">Store
/// and retrieve conversation history and context with Amazon Bedrock
/// sessions</a>.
class InvocationStepSummary {
  /// A unique identifier for the invocation in UUID format.
  final String invocationId;

  /// The unique identifier (in UUID format) for the invocation step.
  final String invocationStepId;

  /// The timestamp for when the invocation step was created.
  final DateTime invocationStepTime;

  /// The unique identifier for the session associated with the invocation step.
  final String sessionId;

  InvocationStepSummary({
    required this.invocationId,
    required this.invocationStepId,
    required this.invocationStepTime,
    required this.sessionId,
  });

  factory InvocationStepSummary.fromJson(Map<String, dynamic> json) {
    return InvocationStepSummary(
      invocationId: (json['invocationId'] as String?) ?? '',
      invocationStepId: (json['invocationStepId'] as String?) ?? '',
      invocationStepTime:
          nonNullableTimeStampFromJson(json['invocationStepTime'] ?? 0),
      sessionId: (json['sessionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final invocationId = this.invocationId;
    final invocationStepId = this.invocationStepId;
    final invocationStepTime = this.invocationStepTime;
    final sessionId = this.sessionId;
    return {
      'invocationId': invocationId,
      'invocationStepId': invocationStepId,
      'invocationStepTime': iso8601ToJson(invocationStepTime),
      'sessionId': sessionId,
    };
  }
}

/// Stores fine-grained state checkpoints, including text and images, for each
/// interaction in an invocation in a session. For more information about
/// sessions, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/sessions.html">Store
/// and retrieve conversation history and context with Amazon Bedrock
/// sessions</a>.
class InvocationStep {
  /// The unique identifier (in UUID format) for the invocation that includes the
  /// invocation step.
  final String invocationId;

  /// The unique identifier (in UUID format) for the invocation step.
  final String invocationStepId;

  /// The timestamp for when the invocation step was created.
  final DateTime invocationStepTime;

  /// Payload content, such as text and images, for the invocation step.
  final InvocationStepPayload payload;

  /// The unique identifier of the session containing the invocation step.
  final String sessionId;

  InvocationStep({
    required this.invocationId,
    required this.invocationStepId,
    required this.invocationStepTime,
    required this.payload,
    required this.sessionId,
  });

  factory InvocationStep.fromJson(Map<String, dynamic> json) {
    return InvocationStep(
      invocationId: (json['invocationId'] as String?) ?? '',
      invocationStepId: (json['invocationStepId'] as String?) ?? '',
      invocationStepTime:
          nonNullableTimeStampFromJson(json['invocationStepTime'] ?? 0),
      payload: InvocationStepPayload.fromJson(
          (json['payload'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      sessionId: (json['sessionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final invocationId = this.invocationId;
    final invocationStepId = this.invocationStepId;
    final invocationStepTime = this.invocationStepTime;
    final payload = this.payload;
    final sessionId = this.sessionId;
    return {
      'invocationId': invocationId,
      'invocationStepId': invocationStepId,
      'invocationStepTime': iso8601ToJson(invocationStepTime),
      'payload': payload,
      'sessionId': sessionId,
    };
  }
}

/// Payload content, such as text and images, for the invocation step.
class InvocationStepPayload {
  /// The content for the invocation step.
  final List<BedrockSessionContentBlock>? contentBlocks;

  InvocationStepPayload({
    this.contentBlocks,
  });

  factory InvocationStepPayload.fromJson(Map<String, dynamic> json) {
    return InvocationStepPayload(
      contentBlocks: (json['contentBlocks'] as List?)
          ?.nonNulls
          .map((e) =>
              BedrockSessionContentBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final contentBlocks = this.contentBlocks;
    return {
      if (contentBlocks != null) 'contentBlocks': contentBlocks,
    };
  }
}

/// A block of content that you pass to, or receive from, a Amazon Bedrock
/// session in an invocation step. You pass the content to a session in the
/// <code>payLoad</code> of the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_PutInvocationStep.html">PutInvocationStep</a>
/// API operation. You retrieve the content with the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_GetInvocationStep.html">GetInvocationStep</a>
/// API operation.
///
/// For more information about sessions, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/sessions.html">Store
/// and retrieve conversation history and context with Amazon Bedrock
/// sessions</a>.
class BedrockSessionContentBlock {
  /// The image in the invocation step.
  final ImageBlock? image;

  /// The text in the invocation step.
  final String? text;

  BedrockSessionContentBlock({
    this.image,
    this.text,
  });

  factory BedrockSessionContentBlock.fromJson(Map<String, dynamic> json) {
    return BedrockSessionContentBlock(
      image: json['image'] != null
          ? ImageBlock.fromJson(json['image'] as Map<String, dynamic>)
          : null,
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final image = this.image;
    final text = this.text;
    return {
      if (image != null) 'image': image,
      if (text != null) 'text': text,
    };
  }
}

/// Image content for an invocation step.
class ImageBlock {
  /// The format of the image.
  final ImageFormat format;

  /// The source for the image.
  final ImageSource source;

  ImageBlock({
    required this.format,
    required this.source,
  });

  factory ImageBlock.fromJson(Map<String, dynamic> json) {
    return ImageBlock(
      format: ImageFormat.fromString((json['format'] as String?) ?? ''),
      source: ImageSource.fromJson((json['source'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final source = this.source;
    return {
      'format': format.value,
      'source': source,
    };
  }
}

class ImageFormat {
  static const png = ImageFormat._('png');
  static const jpeg = ImageFormat._('jpeg');
  static const gif = ImageFormat._('gif');
  static const webp = ImageFormat._('webp');

  final String value;

  const ImageFormat._(this.value);

  static const values = [png, jpeg, gif, webp];

  static ImageFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ImageFormat._(value));

  @override
  bool operator ==(other) => other is ImageFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The source for an image.
class ImageSource {
  /// The raw image bytes for the image. If you use an Amazon Web Services SDK,
  /// you don't need to encode the image bytes in base64.
  final Uint8List? bytes;

  /// The path to the Amazon S3 bucket where the image is stored.
  final S3Location? s3Location;

  ImageSource({
    this.bytes,
    this.s3Location,
  });

  factory ImageSource.fromJson(Map<String, dynamic> json) {
    return ImageSource(
      bytes: _s.decodeNullableUint8List(json['bytes'] as String?),
      s3Location: json['s3Location'] != null
          ? S3Location.fromJson(json['s3Location'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bytes = this.bytes;
    final s3Location = this.s3Location;
    return {
      if (bytes != null) 'bytes': base64Encode(bytes),
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

/// Information about the Amazon S3 bucket where the image is stored.
class S3Location {
  /// The path to the Amazon S3 bucket where the image is stored.
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

/// Contains details about an invocation in a session. For more information
/// about sessions, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/sessions.html">Store
/// and retrieve conversation history and context with Amazon Bedrock
/// sessions</a>.
class InvocationSummary {
  /// The timestamp for when the invocation was created.
  final DateTime createdAt;

  /// A unique identifier for the invocation in UUID format.
  final String invocationId;

  /// The unique identifier for the session associated with the invocation.
  final String sessionId;

  InvocationSummary({
    required this.createdAt,
    required this.invocationId,
    required this.sessionId,
  });

  factory InvocationSummary.fromJson(Map<String, dynamic> json) {
    return InvocationSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      invocationId: (json['invocationId'] as String?) ?? '',
      sessionId: (json['sessionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final invocationId = this.invocationId;
    final sessionId = this.sessionId;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'invocationId': invocationId,
      'sessionId': sessionId,
    };
  }
}

class SessionStatus {
  static const active = SessionStatus._('ACTIVE');
  static const expired = SessionStatus._('EXPIRED');
  static const ended = SessionStatus._('ENDED');

  final String value;

  const SessionStatus._(this.value);

  static const values = [active, expired, ended];

  static SessionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SessionStatus._(value));

  @override
  bool operator ==(other) => other is SessionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about a session. For more information about sessions, see
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/sessions.html">Store
/// and retrieve conversation history and context with Amazon Bedrock
/// sessions</a>.
class SessionSummary {
  /// The timestamp for when the session was created.
  final DateTime createdAt;

  /// The timestamp for when the session was last modified.
  final DateTime lastUpdatedAt;

  /// The Amazon Resource Name (ARN) of the session.
  final String sessionArn;

  /// The unique identifier for the session.
  final String sessionId;

  /// The current status of the session.
  final SessionStatus sessionStatus;

  SessionSummary({
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.sessionArn,
    required this.sessionId,
    required this.sessionStatus,
  });

  factory SessionSummary.fromJson(Map<String, dynamic> json) {
    return SessionSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      lastUpdatedAt: nonNullableTimeStampFromJson(json['lastUpdatedAt'] ?? 0),
      sessionArn: (json['sessionArn'] as String?) ?? '',
      sessionId: (json['sessionId'] as String?) ?? '',
      sessionStatus:
          SessionStatus.fromString((json['sessionStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final sessionArn = this.sessionArn;
    final sessionId = this.sessionId;
    final sessionStatus = this.sessionStatus;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      'sessionArn': sessionArn,
      'sessionId': sessionId,
      'sessionStatus': sessionStatus.value,
    };
  }
}

class GuadrailAction {
  static const intervened = GuadrailAction._('INTERVENED');
  static const none = GuadrailAction._('NONE');

  final String value;

  const GuadrailAction._(this.value);

  static const values = [intervened, none];

  static GuadrailAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuadrailAction._(value));

  @override
  bool operator ==(other) => other is GuadrailAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about a result from querying the knowledge base.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_Retrieve.html#API_agent-runtime_Retrieve_ResponseSyntax">Retrieve
/// response</a> – in the <code>retrievalResults</code> field
/// </li>
/// </ul>
class KnowledgeBaseRetrievalResult {
  /// Contains information about the content of the chunk.
  final RetrievalResultContent content;

  /// Contains information about the location of the data source.
  final RetrievalResultLocation? location;

  /// Contains metadata attributes and their values for the file in the data
  /// source. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-ds.html#kb-ds-metadata">Metadata
  /// and filtering</a>.
  final Map<String, Object>? metadata;

  /// The level of relevance of the result to the query.
  final double? score;

  KnowledgeBaseRetrievalResult({
    required this.content,
    this.location,
    this.metadata,
    this.score,
  });

  factory KnowledgeBaseRetrievalResult.fromJson(Map<String, dynamic> json) {
    return KnowledgeBaseRetrievalResult(
      content: RetrievalResultContent.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      location: json['location'] != null
          ? RetrievalResultLocation.fromJson(
              json['location'] as Map<String, dynamic>)
          : null,
      metadata: (json['metadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as Object)),
      score: json['score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final location = this.location;
    final metadata = this.metadata;
    final score = this.score;
    return {
      'content': content,
      if (location != null) 'location': location,
      if (metadata != null) 'metadata': metadata,
      if (score != null) 'score': score,
    };
  }
}

/// Contains information about a chunk of text from a data source in the
/// knowledge base. If the result is from a structured data source, the cell in
/// the database and the type of the value is also identified.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_Retrieve.html#API_agent-runtime_Retrieve_ResponseSyntax">Retrieve
/// response</a> – in the <code>content</code> field
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html#API_agent-runtime_RetrieveAndGenerate_ResponseSyntax">RetrieveAndGenerate
/// response</a> – in the <code>content</code> field
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_ResponseSyntax">InvokeAgent
/// response</a> – in the <code>content</code> field
/// </li>
/// </ul>
class RetrievalResultContent {
  /// Audio segment information when the retrieval result contains audio content.
  final AudioSegment? audio;

  /// A data URI with base64-encoded content from the data source. The URI is in
  /// the following format: returned in the following format:
  /// <code>data:image/jpeg;base64,${base64-encoded string}</code>.
  final String? byteContent;

  /// Specifies information about the rows with the cells to return in retrieval.
  final List<RetrievalResultContentColumn>? row;

  /// The cited text from the data source.
  final String? text;

  /// The type of content in the retrieval result.
  final RetrievalResultContentType? type;

  /// Video segment information when the retrieval result contains video content.
  final VideoSegment? video;

  RetrievalResultContent({
    this.audio,
    this.byteContent,
    this.row,
    this.text,
    this.type,
    this.video,
  });

  factory RetrievalResultContent.fromJson(Map<String, dynamic> json) {
    return RetrievalResultContent(
      audio: json['audio'] != null
          ? AudioSegment.fromJson(json['audio'] as Map<String, dynamic>)
          : null,
      byteContent: json['byteContent'] as String?,
      row: (json['row'] as List?)
          ?.nonNulls
          .map((e) =>
              RetrievalResultContentColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      text: json['text'] as String?,
      type:
          (json['type'] as String?)?.let(RetrievalResultContentType.fromString),
      video: json['video'] != null
          ? VideoSegment.fromJson(json['video'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audio = this.audio;
    final byteContent = this.byteContent;
    final row = this.row;
    final text = this.text;
    final type = this.type;
    final video = this.video;
    return {
      if (audio != null) 'audio': audio,
      if (byteContent != null) 'byteContent': byteContent,
      if (row != null) 'row': row,
      if (text != null) 'text': text,
      if (type != null) 'type': type.value,
      if (video != null) 'video': video,
    };
  }
}

/// Contains information about the data source location.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_Retrieve.html#API_agent-runtime_Retrieve_ResponseSyntax">Retrieve
/// response</a> – in the <code>location</code> field
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html#API_agent-runtime_RetrieveAndGenerate_ResponseSyntax">RetrieveAndGenerate
/// response</a> – in the <code>location</code> field
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_ResponseSyntax">InvokeAgent
/// response</a> – in the <code>location</code> field
/// </li>
/// </ul>
class RetrievalResultLocation {
  /// The type of data source location.
  final RetrievalResultLocationType type;

  /// The Confluence data source location.
  final RetrievalResultConfluenceLocation? confluenceLocation;

  /// Specifies the location of a document in a custom data source.
  final RetrievalResultCustomDocumentLocation? customDocumentLocation;

  /// The location of a document in Amazon Kendra.
  final RetrievalResultKendraDocumentLocation? kendraDocumentLocation;

  /// The S3 data source location.
  final RetrievalResultS3Location? s3Location;

  /// The Salesforce data source location.
  final RetrievalResultSalesforceLocation? salesforceLocation;

  /// The SharePoint data source location.
  final RetrievalResultSharePointLocation? sharePointLocation;

  /// Specifies information about the SQL query used to retrieve the result.
  final RetrievalResultSqlLocation? sqlLocation;

  /// The web URL/URLs data source location.
  final RetrievalResultWebLocation? webLocation;

  RetrievalResultLocation({
    required this.type,
    this.confluenceLocation,
    this.customDocumentLocation,
    this.kendraDocumentLocation,
    this.s3Location,
    this.salesforceLocation,
    this.sharePointLocation,
    this.sqlLocation,
    this.webLocation,
  });

  factory RetrievalResultLocation.fromJson(Map<String, dynamic> json) {
    return RetrievalResultLocation(
      type: RetrievalResultLocationType.fromString(
          (json['type'] as String?) ?? ''),
      confluenceLocation: json['confluenceLocation'] != null
          ? RetrievalResultConfluenceLocation.fromJson(
              json['confluenceLocation'] as Map<String, dynamic>)
          : null,
      customDocumentLocation: json['customDocumentLocation'] != null
          ? RetrievalResultCustomDocumentLocation.fromJson(
              json['customDocumentLocation'] as Map<String, dynamic>)
          : null,
      kendraDocumentLocation: json['kendraDocumentLocation'] != null
          ? RetrievalResultKendraDocumentLocation.fromJson(
              json['kendraDocumentLocation'] as Map<String, dynamic>)
          : null,
      s3Location: json['s3Location'] != null
          ? RetrievalResultS3Location.fromJson(
              json['s3Location'] as Map<String, dynamic>)
          : null,
      salesforceLocation: json['salesforceLocation'] != null
          ? RetrievalResultSalesforceLocation.fromJson(
              json['salesforceLocation'] as Map<String, dynamic>)
          : null,
      sharePointLocation: json['sharePointLocation'] != null
          ? RetrievalResultSharePointLocation.fromJson(
              json['sharePointLocation'] as Map<String, dynamic>)
          : null,
      sqlLocation: json['sqlLocation'] != null
          ? RetrievalResultSqlLocation.fromJson(
              json['sqlLocation'] as Map<String, dynamic>)
          : null,
      webLocation: json['webLocation'] != null
          ? RetrievalResultWebLocation.fromJson(
              json['webLocation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final confluenceLocation = this.confluenceLocation;
    final customDocumentLocation = this.customDocumentLocation;
    final kendraDocumentLocation = this.kendraDocumentLocation;
    final s3Location = this.s3Location;
    final salesforceLocation = this.salesforceLocation;
    final sharePointLocation = this.sharePointLocation;
    final sqlLocation = this.sqlLocation;
    final webLocation = this.webLocation;
    return {
      'type': type.value,
      if (confluenceLocation != null) 'confluenceLocation': confluenceLocation,
      if (customDocumentLocation != null)
        'customDocumentLocation': customDocumentLocation,
      if (kendraDocumentLocation != null)
        'kendraDocumentLocation': kendraDocumentLocation,
      if (s3Location != null) 's3Location': s3Location,
      if (salesforceLocation != null) 'salesforceLocation': salesforceLocation,
      if (sharePointLocation != null) 'sharePointLocation': sharePointLocation,
      if (sqlLocation != null) 'sqlLocation': sqlLocation,
      if (webLocation != null) 'webLocation': webLocation,
    };
  }
}

class RetrievalResultLocationType {
  static const s3 = RetrievalResultLocationType._('S3');
  static const web = RetrievalResultLocationType._('WEB');
  static const confluence = RetrievalResultLocationType._('CONFLUENCE');
  static const salesforce = RetrievalResultLocationType._('SALESFORCE');
  static const sharepoint = RetrievalResultLocationType._('SHAREPOINT');
  static const custom = RetrievalResultLocationType._('CUSTOM');
  static const kendra = RetrievalResultLocationType._('KENDRA');
  static const sql = RetrievalResultLocationType._('SQL');

  final String value;

  const RetrievalResultLocationType._(this.value);

  static const values = [
    s3,
    web,
    confluence,
    salesforce,
    sharepoint,
    custom,
    kendra,
    sql
  ];

  static RetrievalResultLocationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RetrievalResultLocationType._(value));

  @override
  bool operator ==(other) =>
      other is RetrievalResultLocationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The S3 data source location.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_Retrieve.html#API_agent-runtime_Retrieve_ResponseSyntax">Retrieve
/// response</a> – in the <code>s3Location</code> field
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html#API_agent-runtime_RetrieveAndGenerate_ResponseSyntax">RetrieveAndGenerate
/// response</a> – in the <code>s3Location</code> field
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_ResponseSyntax">InvokeAgent
/// response</a> – in the <code>s3Location</code> field
/// </li>
/// </ul>
class RetrievalResultS3Location {
  /// The S3 URI for the data source location.
  final String? uri;

  RetrievalResultS3Location({
    this.uri,
  });

  factory RetrievalResultS3Location.fromJson(Map<String, dynamic> json) {
    return RetrievalResultS3Location(
      uri: json['uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    return {
      if (uri != null) 'uri': uri,
    };
  }
}

/// The web URL/URLs data source location.
class RetrievalResultWebLocation {
  /// The web URL/URLs for the data source location.
  final String? url;

  RetrievalResultWebLocation({
    this.url,
  });

  factory RetrievalResultWebLocation.fromJson(Map<String, dynamic> json) {
    return RetrievalResultWebLocation(
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

/// The Confluence data source location.
class RetrievalResultConfluenceLocation {
  /// The Confluence host URL for the data source location.
  final String? url;

  RetrievalResultConfluenceLocation({
    this.url,
  });

  factory RetrievalResultConfluenceLocation.fromJson(
      Map<String, dynamic> json) {
    return RetrievalResultConfluenceLocation(
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

/// The Salesforce data source location.
class RetrievalResultSalesforceLocation {
  /// The Salesforce host URL for the data source location.
  final String? url;

  RetrievalResultSalesforceLocation({
    this.url,
  });

  factory RetrievalResultSalesforceLocation.fromJson(
      Map<String, dynamic> json) {
    return RetrievalResultSalesforceLocation(
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

/// The SharePoint data source location.
class RetrievalResultSharePointLocation {
  /// The SharePoint site URL for the data source location.
  final String? url;

  RetrievalResultSharePointLocation({
    this.url,
  });

  factory RetrievalResultSharePointLocation.fromJson(
      Map<String, dynamic> json) {
    return RetrievalResultSharePointLocation(
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

/// Contains information about the location of a document in a custom data
/// source.
class RetrievalResultCustomDocumentLocation {
  /// The ID of the document.
  final String? id;

  RetrievalResultCustomDocumentLocation({
    this.id,
  });

  factory RetrievalResultCustomDocumentLocation.fromJson(
      Map<String, dynamic> json) {
    return RetrievalResultCustomDocumentLocation(
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'id': id,
    };
  }
}

/// The location of a result in Amazon Kendra.
class RetrievalResultKendraDocumentLocation {
  /// The document's uri.
  final String? uri;

  RetrievalResultKendraDocumentLocation({
    this.uri,
  });

  factory RetrievalResultKendraDocumentLocation.fromJson(
      Map<String, dynamic> json) {
    return RetrievalResultKendraDocumentLocation(
      uri: json['uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    return {
      if (uri != null) 'uri': uri,
    };
  }
}

/// Contains information about the SQL query used to retrieve the result.
class RetrievalResultSqlLocation {
  /// The SQL query used to retrieve the result.
  final String? query;

  RetrievalResultSqlLocation({
    this.query,
  });

  factory RetrievalResultSqlLocation.fromJson(Map<String, dynamic> json) {
    return RetrievalResultSqlLocation(
      query: json['query'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final query = this.query;
    return {
      if (query != null) 'query': query,
    };
  }
}

class RetrievalResultContentType {
  static const text = RetrievalResultContentType._('TEXT');
  static const image = RetrievalResultContentType._('IMAGE');
  static const row = RetrievalResultContentType._('ROW');
  static const audio = RetrievalResultContentType._('AUDIO');
  static const video = RetrievalResultContentType._('VIDEO');

  final String value;

  const RetrievalResultContentType._(this.value);

  static const values = [text, image, row, audio, video];

  static RetrievalResultContentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RetrievalResultContentType._(value));

  @override
  bool operator ==(other) =>
      other is RetrievalResultContentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about a video segment retrieved from a knowledge base,
/// including its location and summary.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_Retrieve.html#API_agent-runtime_Retrieve_ResponseSyntax">Retrieve
/// response</a> – in the <code>video</code> field
/// </li>
/// </ul>
class VideoSegment {
  /// The S3 URI where this specific video segment is stored in the multimodal
  /// storage destination.
  final String s3Uri;

  /// A text summary describing the content of the video segment.
  final String? summary;

  VideoSegment({
    required this.s3Uri,
    this.summary,
  });

  factory VideoSegment.fromJson(Map<String, dynamic> json) {
    return VideoSegment(
      s3Uri: (json['s3Uri'] as String?) ?? '',
      summary: json['summary'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final summary = this.summary;
    return {
      's3Uri': s3Uri,
      if (summary != null) 'summary': summary,
    };
  }
}

/// Contains information about an audio segment retrieved from a knowledge base,
/// including its location and transcription.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_Retrieve.html#API_agent-runtime_Retrieve_ResponseSyntax">Retrieve
/// response</a> – in the <code>audio</code> field
/// </li>
/// </ul>
class AudioSegment {
  /// The S3 URI where this specific audio segment is stored in the multimodal
  /// storage destination.
  final String s3Uri;

  /// The text transcription of the audio segment content.
  final String? transcription;

  AudioSegment({
    required this.s3Uri,
    this.transcription,
  });

  factory AudioSegment.fromJson(Map<String, dynamic> json) {
    return AudioSegment(
      s3Uri: (json['s3Uri'] as String?) ?? '',
      transcription: json['transcription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final transcription = this.transcription;
    return {
      's3Uri': s3Uri,
      if (transcription != null) 'transcription': transcription,
    };
  }
}

/// Contains information about a column with a cell to return in retrieval.
class RetrievalResultContentColumn {
  /// The name of the column.
  final String? columnName;

  /// The value in the column.
  final String? columnValue;

  /// The data type of the value.
  final RetrievalResultContentColumnType? type;

  RetrievalResultContentColumn({
    this.columnName,
    this.columnValue,
    this.type,
  });

  factory RetrievalResultContentColumn.fromJson(Map<String, dynamic> json) {
    return RetrievalResultContentColumn(
      columnName: json['columnName'] as String?,
      columnValue: json['columnValue'] as String?,
      type: (json['type'] as String?)
          ?.let(RetrievalResultContentColumnType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final columnName = this.columnName;
    final columnValue = this.columnValue;
    final type = this.type;
    return {
      if (columnName != null) 'columnName': columnName,
      if (columnValue != null) 'columnValue': columnValue,
      if (type != null) 'type': type.value,
    };
  }
}

class RetrievalResultContentColumnType {
  static const blob = RetrievalResultContentColumnType._('BLOB');
  static const boolean = RetrievalResultContentColumnType._('BOOLEAN');
  static const $double = RetrievalResultContentColumnType._('DOUBLE');
  static const $null = RetrievalResultContentColumnType._('NULL');
  static const long = RetrievalResultContentColumnType._('LONG');
  static const string = RetrievalResultContentColumnType._('STRING');

  final String value;

  const RetrievalResultContentColumnType._(this.value);

  static const values = [blob, boolean, $double, $null, long, string];

  static RetrievalResultContentColumnType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RetrievalResultContentColumnType._(value));

  @override
  bool operator ==(other) =>
      other is RetrievalResultContentColumnType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the query made to the knowledge base.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_Retrieve.html#API_agent-runtime_Retrieve_RequestSyntax">Retrieve
/// request</a> – in the <code>retrievalQuery</code> field
/// </li>
/// </ul>
class KnowledgeBaseQuery {
  /// An image to include in the knowledge base query for multimodal retrieval.
  final InputImage? image;

  /// The text of the query made to the knowledge base.
  final String? text;

  /// The type of query being performed.
  final KnowledgeBaseQueryType? type;

  KnowledgeBaseQuery({
    this.image,
    this.text,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final image = this.image;
    final text = this.text;
    final type = this.type;
    return {
      if (image != null) 'image': image,
      if (text != null) 'text': text,
      if (type != null) 'type': type.value,
    };
  }
}

/// Contains configurations for knowledge base query. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-test-config.html">Query
/// configurations</a>.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_Retrieve.html#API_agent-runtime_Retrieve_RequestSyntax">Retrieve
/// request</a> – in the <code>retrievalConfiguration</code> field
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html#API_agent-runtime_RetrieveAndGenerate_RequestSyntax">RetrieveAndGenerate
/// request</a> – in the <code>retrievalConfiguration</code> field
/// </li>
/// </ul>
class KnowledgeBaseRetrievalConfiguration {
  /// Contains details about how the results from the vector search should be
  /// returned. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-test-config.html">Query
  /// configurations</a>.
  final KnowledgeBaseVectorSearchConfiguration vectorSearchConfiguration;

  KnowledgeBaseRetrievalConfiguration({
    required this.vectorSearchConfiguration,
  });

  Map<String, dynamic> toJson() {
    final vectorSearchConfiguration = this.vectorSearchConfiguration;
    return {
      'vectorSearchConfiguration': vectorSearchConfiguration,
    };
  }
}

/// The configuration details for the guardrail.
class GuardrailConfiguration {
  /// The unique identifier for the guardrail.
  final String guardrailId;

  /// The version of the guardrail.
  final String guardrailVersion;

  GuardrailConfiguration({
    required this.guardrailId,
    required this.guardrailVersion,
  });

  Map<String, dynamic> toJson() {
    final guardrailId = this.guardrailId;
    final guardrailVersion = this.guardrailVersion;
    return {
      'guardrailId': guardrailId,
      'guardrailVersion': guardrailVersion,
    };
  }
}

/// Configurations for how to perform the search query and return results. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-test-config.html">Query
/// configurations</a>.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_Retrieve.html#API_agent-runtime_Retrieve_RequestSyntax">Retrieve
/// request</a> – in the <code>vectorSearchConfiguration</code> field
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html#API_agent-runtime_RetrieveAndGenerate_RequestSyntax">RetrieveAndGenerate
/// request</a> – in the <code>vectorSearchConfiguration</code> field
/// </li>
/// </ul>
class KnowledgeBaseVectorSearchConfiguration {
  /// Specifies the filters to use on the metadata in the knowledge base data
  /// sources before returning results. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-test-config.html">Query
  /// configurations</a>.
  final RetrievalFilter? filter;

  /// Settings for implicit filtering.
  final ImplicitFilterConfiguration? implicitFilterConfiguration;

  /// The number of source chunks to retrieve.
  final int? numberOfResults;

  /// By default, Amazon Bedrock decides a search strategy for you. If you're
  /// using an Amazon OpenSearch Serverless vector store that contains a
  /// filterable text field, you can specify whether to query the knowledge base
  /// with a <code>HYBRID</code> search using both vector embeddings and raw text,
  /// or <code>SEMANTIC</code> search using only vector embeddings. For other
  /// vector store configurations, only <code>SEMANTIC</code> search is available.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-test.html">Test
  /// a knowledge base</a>.
  final SearchType? overrideSearchType;

  /// Contains configurations for reranking the retrieved results. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/rerank.html">Improve
  /// the relevance of query responses with a reranker model</a>.
  final VectorSearchRerankingConfiguration? rerankingConfiguration;

  KnowledgeBaseVectorSearchConfiguration({
    this.filter,
    this.implicitFilterConfiguration,
    this.numberOfResults,
    this.overrideSearchType,
    this.rerankingConfiguration,
  });

  Map<String, dynamic> toJson() {
    final filter = this.filter;
    final implicitFilterConfiguration = this.implicitFilterConfiguration;
    final numberOfResults = this.numberOfResults;
    final overrideSearchType = this.overrideSearchType;
    final rerankingConfiguration = this.rerankingConfiguration;
    return {
      if (filter != null) 'filter': filter,
      if (implicitFilterConfiguration != null)
        'implicitFilterConfiguration': implicitFilterConfiguration,
      if (numberOfResults != null) 'numberOfResults': numberOfResults,
      if (overrideSearchType != null)
        'overrideSearchType': overrideSearchType.value,
      if (rerankingConfiguration != null)
        'rerankingConfiguration': rerankingConfiguration,
    };
  }
}

class SearchType {
  static const hybrid = SearchType._('HYBRID');
  static const semantic = SearchType._('SEMANTIC');

  final String value;

  const SearchType._(this.value);

  static const values = [hybrid, semantic];

  static SearchType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SearchType._(value));

  @override
  bool operator ==(other) => other is SearchType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the filters to use on the metadata attributes in the knowledge
/// base data sources before returning results. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-test-config.html">Query
/// configurations</a>. See the examples below to see how to use these filters.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_Retrieve.html#API_agent-runtime_Retrieve_RequestSyntax">Retrieve
/// request</a> – in the <code>filter</code> field
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html#API_agent-runtime_RetrieveAndGenerate_RequestSyntax">RetrieveAndGenerate
/// request</a> – in the <code>filter</code> field
/// </li>
/// </ul>
class RetrievalFilter {
  /// Knowledge base data sources are returned if their metadata attributes
  /// fulfill all the filter conditions inside this list.
  final List<RetrievalFilter>? andAll;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the <code>key</code> and whose value matches
  /// the <code>value</code> in this object.
  ///
  /// The following example would return data sources with an <code>animal</code>
  /// attribute whose value is <code>cat</code>:
  ///
  /// <code>"equals": { "key": "animal", "value": "cat" }</code>
  final FilterAttribute? equals;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the <code>key</code> and whose value is greater
  /// than the <code>value</code> in this object.
  ///
  /// The following example would return data sources with an <code>year</code>
  /// attribute whose value is greater than <code>1989</code>:
  ///
  /// <code>"greaterThan": { "key": "year", "value": 1989 }</code>
  final FilterAttribute? greaterThan;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the <code>key</code> and whose value is greater
  /// than or equal to the <code>value</code> in this object.
  ///
  /// The following example would return data sources with an <code>year</code>
  /// attribute whose value is greater than or equal to <code>1989</code>:
  ///
  /// <code>"greaterThanOrEquals": { "key": "year", "value": 1989 }</code>
  final FilterAttribute? greaterThanOrEquals;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the <code>key</code> and whose value is in the
  /// list specified in the <code>value</code> in this object.
  ///
  /// The following example would return data sources with an <code>animal</code>
  /// attribute that is either <code>cat</code> or <code>dog</code>:
  ///
  /// <code>"in": { "key": "animal", "value": ["cat", "dog"] }</code>
  final FilterAttribute? inValue;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the <code>key</code> and whose value is less
  /// than the <code>value</code> in this object.
  ///
  /// The following example would return data sources with an <code>year</code>
  /// attribute whose value is less than to <code>1989</code>.
  ///
  /// <code>"lessThan": { "key": "year", "value": 1989 }</code>
  final FilterAttribute? lessThan;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the <code>key</code> and whose value is less
  /// than or equal to the <code>value</code> in this object.
  ///
  /// The following example would return data sources with an <code>year</code>
  /// attribute whose value is less than or equal to <code>1989</code>.
  ///
  /// <code>"lessThanOrEquals": { "key": "year", "value": 1989 }</code>
  final FilterAttribute? lessThanOrEquals;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the <code>key</code> and whose value is a list
  /// that contains the <code>value</code> as one of its members.
  ///
  /// The following example would return data sources with an <code>animals</code>
  /// attribute that is a list containing a <code>cat</code> member (for example
  /// <code>["dog", "cat"]</code>).
  ///
  /// <code>"listContains": { "key": "animals", "value": "cat" }</code>
  final FilterAttribute? listContains;

  /// Knowledge base data sources are returned when:
  ///
  /// <ul>
  /// <li>
  /// It contains a metadata attribute whose name matches the <code>key</code> and
  /// whose value doesn't match the <code>value</code> in this object.
  /// </li>
  /// <li>
  /// The key is not present in the document.
  /// </li>
  /// </ul>
  /// The following example would return data sources that don't contain an
  /// <code>animal</code> attribute whose value is <code>cat</code>.
  ///
  /// <code>"notEquals": { "key": "animal", "value": "cat" }</code>
  final FilterAttribute? notEquals;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the <code>key</code> and whose value isn't in
  /// the list specified in the <code>value</code> in this object.
  ///
  /// The following example would return data sources whose <code>animal</code>
  /// attribute is neither <code>cat</code> nor <code>dog</code>.
  ///
  /// <code>"notIn": { "key": "animal", "value": ["cat", "dog"] }</code>
  final FilterAttribute? notIn;

  /// Knowledge base data sources are returned if their metadata attributes
  /// fulfill at least one of the filter conditions inside this list.
  final List<RetrievalFilter>? orAll;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the <code>key</code> and whose value starts
  /// with the <code>value</code> in this object. This filter is currently only
  /// supported for Amazon OpenSearch Serverless vector stores.
  ///
  /// The following example would return data sources with an <code>animal</code>
  /// attribute starts with <code>ca</code> (for example, <code>cat</code> or
  /// <code>camel</code>).
  ///
  /// <code>"startsWith": { "key": "animal", "value": "ca" }</code>
  final FilterAttribute? startsWith;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the <code>key</code> and whose value is one of
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// A string that contains the <code>value</code> as a substring. The following
  /// example would return data sources with an <code>animal</code> attribute that
  /// contains the substring <code>at</code> (for example <code>cat</code>).
  ///
  /// <code>"stringContains": { "key": "animal", "value": "at" }</code>
  /// </li>
  /// <li>
  /// A list with a member that contains the <code>value</code> as a substring.
  /// The following example would return data sources with an <code>animals</code>
  /// attribute that is a list containing a member that contains the substring
  /// <code>at</code> (for example <code>["dog", "cat"]</code>).
  ///
  /// <code>"stringContains": { "key": "animals", "value": "at" }</code>
  /// </li>
  /// </ul>
  final FilterAttribute? stringContains;

  RetrievalFilter({
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

/// Contains configurations for reranking the retrieved results.
class VectorSearchRerankingConfiguration {
  /// The type of reranker model.
  final VectorSearchRerankingConfigurationType type;

  /// Contains configurations for an Amazon Bedrock reranker model.
  final VectorSearchBedrockRerankingConfiguration?
      bedrockRerankingConfiguration;

  VectorSearchRerankingConfiguration({
    required this.type,
    this.bedrockRerankingConfiguration,
  });

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

/// Settings for implicit filtering, where a model generates a metadata filter
/// based on the prompt.
class ImplicitFilterConfiguration {
  /// Metadata that can be used in a filter.
  final List<MetadataAttributeSchema> metadataAttributes;

  /// The model that generates the filter.
  final String modelArn;

  ImplicitFilterConfiguration({
    required this.metadataAttributes,
    required this.modelArn,
  });

  Map<String, dynamic> toJson() {
    final metadataAttributes = this.metadataAttributes;
    final modelArn = this.modelArn;
    return {
      'metadataAttributes': metadataAttributes,
      'modelArn': modelArn,
    };
  }
}

/// Details about a metadata attribute.
class MetadataAttributeSchema {
  /// The attribute's description.
  final String description;

  /// The attribute's key.
  final String key;

  /// The attribute's type.
  final AttributeType type;

  MetadataAttributeSchema({
    required this.description,
    required this.key,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final description = this.description;
    final key = this.key;
    final type = this.type;
    return {
      'description': description,
      'key': key,
      'type': type.value,
    };
  }
}

class AttributeType {
  static const string = AttributeType._('STRING');
  static const number = AttributeType._('NUMBER');
  static const boolean = AttributeType._('BOOLEAN');
  static const stringList = AttributeType._('STRING_LIST');

  final String value;

  const AttributeType._(this.value);

  static const values = [string, number, boolean, stringList];

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

/// Contains configurations for reranking with an Amazon Bedrock reranker model.
class VectorSearchBedrockRerankingConfiguration {
  /// Contains configurations for the reranker model.
  final VectorSearchBedrockRerankingModelConfiguration modelConfiguration;

  /// Contains configurations for the metadata to use in reranking.
  final MetadataConfigurationForReranking? metadataConfiguration;

  /// The number of results to return after reranking.
  final int? numberOfRerankedResults;

  VectorSearchBedrockRerankingConfiguration({
    required this.modelConfiguration,
    this.metadataConfiguration,
    this.numberOfRerankedResults,
  });

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

/// Contains configurations for an Amazon Bedrock reranker model.
class VectorSearchBedrockRerankingModelConfiguration {
  /// The ARN of the reranker model to use.
  final String modelArn;

  /// A JSON object whose keys are request fields for the model and whose values
  /// are values for those fields.
  final Map<String, Object>? additionalModelRequestFields;

  VectorSearchBedrockRerankingModelConfiguration({
    required this.modelArn,
    this.additionalModelRequestFields,
  });

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

/// Contains configurations for the metadata to use in reranking.
class MetadataConfigurationForReranking {
  /// Specifies whether to consider all metadata when reranking, or only the
  /// metadata that you select. If you specify <code>SELECTIVE</code>, include the
  /// <code>selectiveModeConfiguration</code> field.
  final RerankingMetadataSelectionMode selectionMode;

  /// Contains configurations for the metadata fields to include or exclude when
  /// considering reranking.
  final RerankingMetadataSelectiveModeConfiguration? selectiveModeConfiguration;

  MetadataConfigurationForReranking({
    required this.selectionMode,
    this.selectiveModeConfiguration,
  });

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

/// Contains configurations for the metadata fields to include or exclude when
/// considering reranking. If you include the <code>fieldsToExclude</code>
/// field, the reranker ignores all the metadata fields that you specify. If you
/// include the <code>fieldsToInclude</code> field, the reranker uses only the
/// metadata fields that you specify and ignores all others. You can include
/// only one of these fields.
class RerankingMetadataSelectiveModeConfiguration {
  /// An array of objects, each of which specifies a metadata field to exclude
  /// from consideration when reranking.
  final List<FieldForReranking>? fieldsToExclude;

  /// An array of objects, each of which specifies a metadata field to include in
  /// consideration when reranking. The remaining metadata fields are ignored.
  final List<FieldForReranking>? fieldsToInclude;

  RerankingMetadataSelectiveModeConfiguration({
    this.fieldsToExclude,
    this.fieldsToInclude,
  });

  Map<String, dynamic> toJson() {
    final fieldsToExclude = this.fieldsToExclude;
    final fieldsToInclude = this.fieldsToInclude;
    return {
      if (fieldsToExclude != null) 'fieldsToExclude': fieldsToExclude,
      if (fieldsToInclude != null) 'fieldsToInclude': fieldsToInclude,
    };
  }
}

/// Contains information for a metadata field to include in or exclude from
/// consideration when reranking.
class FieldForReranking {
  /// The name of a metadata field to include in or exclude from consideration
  /// when reranking.
  final String fieldName;

  FieldForReranking({
    required this.fieldName,
  });

  Map<String, dynamic> toJson() {
    final fieldName = this.fieldName;
    return {
      'fieldName': fieldName,
    };
  }
}

/// Specifies the name that the metadata attribute must match and the value to
/// which to compare the value of the metadata attribute. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-test-config.html">Query
/// configurations</a>.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html#API_agent-runtime_RetrieveAndGenerate_RequestSyntax">RetrieveAndGenerate
/// request</a>
/// </li>
/// </ul>
class FilterAttribute {
  /// The name that the metadata attribute must match.
  final String key;

  /// The value to whcih to compare the value of the metadata attribute.
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

class KnowledgeBaseQueryType {
  static const text = KnowledgeBaseQueryType._('TEXT');
  static const image = KnowledgeBaseQueryType._('IMAGE');

  final String value;

  const KnowledgeBaseQueryType._(this.value);

  static const values = [text, image];

  static KnowledgeBaseQueryType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KnowledgeBaseQueryType._(value));

  @override
  bool operator ==(other) =>
      other is KnowledgeBaseQueryType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the image data for multimodal knowledge base queries, including
/// format and content.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_Retrieve.html#API_agent-runtime_Retrieve_RequestSyntax">Retrieve
/// request</a> – in the <code>image</code> field
/// </li>
/// </ul>
class InputImage {
  /// The format of the input image. Supported formats include png, gif, jpeg, and
  /// webp.
  final InputImageFormat format;

  /// The base64-encoded image data for inline image content. Maximum size is 5MB.
  final Uint8List inlineContent;

  InputImage({
    required this.format,
    required this.inlineContent,
  });

  Map<String, dynamic> toJson() {
    final format = this.format;
    final inlineContent = this.inlineContent;
    return {
      'format': format.value,
      'inlineContent': base64Encode(inlineContent),
    };
  }
}

class InputImageFormat {
  static const png = InputImageFormat._('png');
  static const jpeg = InputImageFormat._('jpeg');
  static const gif = InputImageFormat._('gif');
  static const webp = InputImageFormat._('webp');

  final String value;

  const InputImageFormat._(this.value);

  static const values = [png, jpeg, gif, webp];

  static InputImageFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InputImageFormat._(value));

  @override
  bool operator ==(other) => other is InputImageFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A retrieve and generate stream response output.
class RetrieveAndGenerateStreamResponseOutput {
  /// The request is denied because you do not have sufficient permissions to
  /// perform the requested action. For troubleshooting this error, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/troubleshooting-api-error-codes.html#ts-access-denied">AccessDeniedException</a>
  /// in the Amazon Bedrock User Guide.
  final AccessDeniedException? accessDeniedException;

  /// The request failed due to a bad gateway error.
  final BadGatewayException? badGatewayException;

  /// A citation event.
  final CitationEvent? citation;

  /// Error occurred because of a conflict while performing an operation.
  final ConflictException? conflictException;

  /// The request failed due to a dependency error.
  final DependencyFailedException? dependencyFailedException;

  /// A guardrail event.
  final GuardrailEvent? guardrail;

  /// An internal server error occurred. Retry your request.
  final InternalServerException? internalServerException;

  /// An output event.
  final RetrieveAndGenerateOutputEvent? output;

  /// The specified resource ARN was not found. For troubleshooting this error,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/troubleshooting-api-error-codes.html#ts-resource-not-found">ResourceNotFound</a>
  /// in the Amazon Bedrock User Guide.
  final ResourceNotFoundException? resourceNotFoundException;

  /// Your request exceeds the service quota for your account. You can view your
  /// quotas at <a
  /// href="https://docs.aws.amazon.com/servicequotas/latest/userguide/gs-request-quota.html">Viewing
  /// service quotas</a>. You can resubmit your request later.
  final ServiceQuotaExceededException? serviceQuotaExceededException;

  /// Your request was denied due to exceeding the account quotas for <i>Amazon
  /// Bedrock</i>. For troubleshooting this error, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/troubleshooting-api-error-codes.html#ts-throttling-exception">ThrottlingException</a>
  /// in the Amazon Bedrock User Guide.
  final ThrottlingException? throttlingException;

  /// The input fails to satisfy the constraints specified by <i>Amazon
  /// Bedrock</i>. For troubleshooting this error, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/troubleshooting-api-error-codes.html#ts-validation-error">ValidationError</a>
  /// in the Amazon Bedrock User Guide.
  final ValidationException? validationException;

  RetrieveAndGenerateStreamResponseOutput({
    this.accessDeniedException,
    this.badGatewayException,
    this.citation,
    this.conflictException,
    this.dependencyFailedException,
    this.guardrail,
    this.internalServerException,
    this.output,
    this.resourceNotFoundException,
    this.serviceQuotaExceededException,
    this.throttlingException,
    this.validationException,
  });

  factory RetrieveAndGenerateStreamResponseOutput.fromJson(
      Map<String, dynamic> json) {
    return RetrieveAndGenerateStreamResponseOutput(
      accessDeniedException: json['accessDeniedException'] != null
          ? AccessDeniedException.fromJson(
              json['accessDeniedException'] as Map<String, dynamic>)
          : null,
      badGatewayException: json['badGatewayException'] != null
          ? BadGatewayException.fromJson(
              json['badGatewayException'] as Map<String, dynamic>)
          : null,
      citation: json['citation'] != null
          ? CitationEvent.fromJson(json['citation'] as Map<String, dynamic>)
          : null,
      conflictException: json['conflictException'] != null
          ? ConflictException.fromJson(
              json['conflictException'] as Map<String, dynamic>)
          : null,
      dependencyFailedException: json['dependencyFailedException'] != null
          ? DependencyFailedException.fromJson(
              json['dependencyFailedException'] as Map<String, dynamic>)
          : null,
      guardrail: json['guardrail'] != null
          ? GuardrailEvent.fromJson(json['guardrail'] as Map<String, dynamic>)
          : null,
      internalServerException: json['internalServerException'] != null
          ? InternalServerException.fromJson(
              json['internalServerException'] as Map<String, dynamic>)
          : null,
      output: json['output'] != null
          ? RetrieveAndGenerateOutputEvent.fromJson(
              json['output'] as Map<String, dynamic>)
          : null,
      resourceNotFoundException: json['resourceNotFoundException'] != null
          ? ResourceNotFoundException.fromJson(
              json['resourceNotFoundException'] as Map<String, dynamic>)
          : null,
      serviceQuotaExceededException:
          json['serviceQuotaExceededException'] != null
              ? ServiceQuotaExceededException.fromJson(
                  json['serviceQuotaExceededException'] as Map<String, dynamic>)
              : null,
      throttlingException: json['throttlingException'] != null
          ? ThrottlingException.fromJson(
              json['throttlingException'] as Map<String, dynamic>)
          : null,
      validationException: json['validationException'] != null
          ? ValidationException.fromJson(
              json['validationException'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessDeniedException = this.accessDeniedException;
    final badGatewayException = this.badGatewayException;
    final citation = this.citation;
    final conflictException = this.conflictException;
    final dependencyFailedException = this.dependencyFailedException;
    final guardrail = this.guardrail;
    final internalServerException = this.internalServerException;
    final output = this.output;
    final resourceNotFoundException = this.resourceNotFoundException;
    final serviceQuotaExceededException = this.serviceQuotaExceededException;
    final throttlingException = this.throttlingException;
    final validationException = this.validationException;
    return {
      if (accessDeniedException != null)
        'accessDeniedException': accessDeniedException,
      if (badGatewayException != null)
        'badGatewayException': badGatewayException,
      if (citation != null) 'citation': citation,
      if (conflictException != null) 'conflictException': conflictException,
      if (dependencyFailedException != null)
        'dependencyFailedException': dependencyFailedException,
      if (guardrail != null) 'guardrail': guardrail,
      if (internalServerException != null)
        'internalServerException': internalServerException,
      if (output != null) 'output': output,
      if (resourceNotFoundException != null)
        'resourceNotFoundException': resourceNotFoundException,
      if (serviceQuotaExceededException != null)
        'serviceQuotaExceededException': serviceQuotaExceededException,
      if (throttlingException != null)
        'throttlingException': throttlingException,
      if (validationException != null)
        'validationException': validationException,
    };
  }
}

/// A retrieve and generate output event.
class RetrieveAndGenerateOutputEvent {
  /// A text response.
  final String text;

  RetrieveAndGenerateOutputEvent({
    required this.text,
  });

  factory RetrieveAndGenerateOutputEvent.fromJson(Map<String, dynamic> json) {
    return RetrieveAndGenerateOutputEvent(
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

/// A citation event.
class CitationEvent {
  /// The citation.
  final Citation? citation;

  /// The generated response to the citation event.
  final GeneratedResponsePart? generatedResponsePart;

  /// The retrieved references of the citation event.
  final List<RetrievedReference>? retrievedReferences;

  CitationEvent({
    this.citation,
    this.generatedResponsePart,
    this.retrievedReferences,
  });

  factory CitationEvent.fromJson(Map<String, dynamic> json) {
    return CitationEvent(
      citation: json['citation'] != null
          ? Citation.fromJson(json['citation'] as Map<String, dynamic>)
          : null,
      generatedResponsePart: json['generatedResponsePart'] != null
          ? GeneratedResponsePart.fromJson(
              json['generatedResponsePart'] as Map<String, dynamic>)
          : null,
      retrievedReferences: (json['retrievedReferences'] as List?)
          ?.nonNulls
          .map((e) => RetrievedReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final citation = this.citation;
    final generatedResponsePart = this.generatedResponsePart;
    final retrievedReferences = this.retrievedReferences;
    return {
      if (citation != null) 'citation': citation,
      if (generatedResponsePart != null)
        'generatedResponsePart': generatedResponsePart,
      if (retrievedReferences != null)
        'retrievedReferences': retrievedReferences,
    };
  }
}

/// A guardrail event.
class GuardrailEvent {
  /// The guardrail action.
  final GuadrailAction? action;

  GuardrailEvent({
    this.action,
  });

  factory GuardrailEvent.fromJson(Map<String, dynamic> json) {
    return GuardrailEvent(
      action: (json['action'] as String?)?.let(GuadrailAction.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    return {
      if (action != null) 'action': action.value,
    };
  }
}

/// An object containing a segment of the generated response that is based on a
/// source in the knowledge base, alongside information about the source.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_ResponseSyntax">InvokeAgent
/// response</a> – in the <code>citations</code> field
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html#API_agent-runtime_RetrieveAndGenerate_ResponseSyntax">RetrieveAndGenerate
/// response</a> – in the <code>citations</code> field
/// </li>
/// </ul>
class Citation {
  /// Contains the generated response and metadata
  final GeneratedResponsePart? generatedResponsePart;

  /// Contains metadata about the sources cited for the generated response.
  final List<RetrievedReference>? retrievedReferences;

  Citation({
    this.generatedResponsePart,
    this.retrievedReferences,
  });

  factory Citation.fromJson(Map<String, dynamic> json) {
    return Citation(
      generatedResponsePart: json['generatedResponsePart'] != null
          ? GeneratedResponsePart.fromJson(
              json['generatedResponsePart'] as Map<String, dynamic>)
          : null,
      retrievedReferences: (json['retrievedReferences'] as List?)
          ?.nonNulls
          .map((e) => RetrievedReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final generatedResponsePart = this.generatedResponsePart;
    final retrievedReferences = this.retrievedReferences;
    return {
      if (generatedResponsePart != null)
        'generatedResponsePart': generatedResponsePart,
      if (retrievedReferences != null)
        'retrievedReferences': retrievedReferences,
    };
  }
}

/// Contains metadata about a part of the generated response that is accompanied
/// by a citation.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_ResponseSyntax">InvokeAgent
/// response</a> – in the <code>generatedResponsePart</code> field
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html#API_agent-runtime_RetrieveAndGenerate_ResponseSyntax">RetrieveAndGenerate
/// response</a> – in the <code>generatedResponsePart</code> field
/// </li>
/// </ul>
class GeneratedResponsePart {
  /// Contains metadata about a textual part of the generated response that is
  /// accompanied by a citation.
  final TextResponsePart? textResponsePart;

  GeneratedResponsePart({
    this.textResponsePart,
  });

  factory GeneratedResponsePart.fromJson(Map<String, dynamic> json) {
    return GeneratedResponsePart(
      textResponsePart: json['textResponsePart'] != null
          ? TextResponsePart.fromJson(
              json['textResponsePart'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final textResponsePart = this.textResponsePart;
    return {
      if (textResponsePart != null) 'textResponsePart': textResponsePart,
    };
  }
}

/// Contains metadata about a source cited for the generated response.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html#API_agent-runtime_RetrieveAndGenerate_ResponseSyntax">RetrieveAndGenerate
/// response</a> – in the <code>retrievedReferences</code> field
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_ResponseSyntax">InvokeAgent
/// response</a> – in the <code>retrievedReferences</code> field
/// </li>
/// </ul>
class RetrievedReference {
  /// Contains the cited text from the data source.
  final RetrievalResultContent? content;

  /// Contains information about the location of the data source.
  final RetrievalResultLocation? location;

  /// Contains metadata attributes and their values for the file in the data
  /// source. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-ds.html#kb-ds-metadata">Metadata
  /// and filtering</a>.
  final Map<String, Object>? metadata;

  RetrievedReference({
    this.content,
    this.location,
    this.metadata,
  });

  factory RetrievedReference.fromJson(Map<String, dynamic> json) {
    return RetrievedReference(
      content: json['content'] != null
          ? RetrievalResultContent.fromJson(
              json['content'] as Map<String, dynamic>)
          : null,
      location: json['location'] != null
          ? RetrievalResultLocation.fromJson(
              json['location'] as Map<String, dynamic>)
          : null,
      metadata: (json['metadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as Object)),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final location = this.location;
    final metadata = this.metadata;
    return {
      if (content != null) 'content': content,
      if (location != null) 'location': location,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

/// Contains the part of the generated text that contains a citation, alongside
/// where it begins and ends.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html#API_agent-runtime_RetrieveAndGenerate_ResponseSyntax">RetrieveAndGenerate
/// response</a> – in the <code>textResponsePart</code> field
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_ResponseSyntax">InvokeAgent
/// response</a> – in the <code>textResponsePart</code> field
/// </li>
/// </ul>
class TextResponsePart {
  /// Contains information about where the text with a citation begins and ends in
  /// the generated output.
  final Span? span;

  /// The part of the generated text that contains a citation.
  final String? text;

  TextResponsePart({
    this.span,
    this.text,
  });

  factory TextResponsePart.fromJson(Map<String, dynamic> json) {
    return TextResponsePart(
      span: json['span'] != null
          ? Span.fromJson(json['span'] as Map<String, dynamic>)
          : null,
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final span = this.span;
    final text = this.text;
    return {
      if (span != null) 'span': span,
      if (text != null) 'text': text,
    };
  }
}

/// Contains information about where the text with a citation begins and ends in
/// the generated output.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html#API_agent-runtime_RetrieveAndGenerate_ResponseSyntax">RetrieveAndGenerate
/// response</a> – in the <code>span</code> field
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_ResponseSyntax">InvokeAgent
/// response</a> – in the <code>span</code> field
/// </li>
/// </ul>
class Span {
  /// Where the text with a citation ends in the generated output.
  final int? end;

  /// Where the text with a citation starts in the generated output.
  final int? start;

  Span({
    this.end,
    this.start,
  });

  factory Span.fromJson(Map<String, dynamic> json) {
    return Span(
      end: json['end'] as int?,
      start: json['start'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final end = this.end;
    final start = this.start;
    return {
      if (end != null) 'end': end,
      if (start != null) 'start': start,
    };
  }
}

/// Contains the query made to the knowledge base.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html#API_agent-runtime_RetrieveAndGenerate_RequestSyntax">RetrieveAndGenerate
/// request</a> – in the <code>input</code> field
/// </li>
/// </ul>
class RetrieveAndGenerateInput {
  /// The query made to the knowledge base, in characters.
  final String text;

  RetrieveAndGenerateInput({
    required this.text,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      'text': text,
    };
  }
}

/// Contains details about the resource being queried.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html#API_agent-runtime_RetrieveAndGenerate_RequestSyntax">RetrieveAndGenerate
/// request</a> – in the <code>retrieveAndGenerateConfiguration</code> field
/// </li>
/// </ul>
class RetrieveAndGenerateConfiguration {
  /// The type of resource that contains your data for retrieving information and
  /// generating responses.
  /// <note>
  /// If you choose to use <code>EXTERNAL_SOURCES</code>, then currently only
  /// Anthropic Claude 3 Sonnet models for knowledge bases are supported.
  /// </note>
  final RetrieveAndGenerateType type;

  /// The configuration for the external source wrapper object in the
  /// <code>retrieveAndGenerate</code> function.
  final ExternalSourcesRetrieveAndGenerateConfiguration?
      externalSourcesConfiguration;

  /// Contains details about the knowledge base for retrieving information and
  /// generating responses.
  final KnowledgeBaseRetrieveAndGenerateConfiguration?
      knowledgeBaseConfiguration;

  RetrieveAndGenerateConfiguration({
    required this.type,
    this.externalSourcesConfiguration,
    this.knowledgeBaseConfiguration,
  });

  Map<String, dynamic> toJson() {
    final type = this.type;
    final externalSourcesConfiguration = this.externalSourcesConfiguration;
    final knowledgeBaseConfiguration = this.knowledgeBaseConfiguration;
    return {
      'type': type.value,
      if (externalSourcesConfiguration != null)
        'externalSourcesConfiguration': externalSourcesConfiguration,
      if (knowledgeBaseConfiguration != null)
        'knowledgeBaseConfiguration': knowledgeBaseConfiguration,
    };
  }
}

/// Contains configuration about the session with the knowledge base.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html#API_agent-runtime_RetrieveAndGenerate_RequestSyntax">RetrieveAndGenerate
/// request</a> – in the <code>sessionConfiguration</code> field
/// </li>
/// </ul>
class RetrieveAndGenerateSessionConfiguration {
  /// The ARN of the KMS key encrypting the session.
  final String kmsKeyArn;

  RetrieveAndGenerateSessionConfiguration({
    required this.kmsKeyArn,
  });

  Map<String, dynamic> toJson() {
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'kmsKeyArn': kmsKeyArn,
    };
  }
}

class RetrieveAndGenerateType {
  static const knowledgeBase = RetrieveAndGenerateType._('KNOWLEDGE_BASE');
  static const externalSources = RetrieveAndGenerateType._('EXTERNAL_SOURCES');

  final String value;

  const RetrieveAndGenerateType._(this.value);

  static const values = [knowledgeBase, externalSources];

  static RetrieveAndGenerateType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RetrieveAndGenerateType._(value));

  @override
  bool operator ==(other) =>
      other is RetrieveAndGenerateType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about the resource being queried.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_Retrieve.html#API_agent-runtime_Retrieve_RequestSyntax">Retrieve
/// request</a> – in the <code>knowledgeBaseConfiguration</code> field
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html#API_agent-runtime_RetrieveAndGenerate_RequestSyntax">RetrieveAndGenerate
/// request</a> – in the <code>knowledgeBaseConfiguration</code> field
/// </li>
/// </ul>
class KnowledgeBaseRetrieveAndGenerateConfiguration {
  /// The unique identifier of the knowledge base that is queried.
  final String knowledgeBaseId;

  /// The ARN of the foundation model or <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/cross-region-inference.html">inference
  /// profile</a> used to generate a response.
  final String modelArn;

  /// Contains configurations for response generation based on the knowledge base
  /// query results.
  final GenerationConfiguration? generationConfiguration;

  /// Settings for how the model processes the prompt prior to retrieval and
  /// generation.
  final OrchestrationConfiguration? orchestrationConfiguration;

  /// Contains configurations for how to retrieve and return the knowledge base
  /// query.
  final KnowledgeBaseRetrievalConfiguration? retrievalConfiguration;

  KnowledgeBaseRetrieveAndGenerateConfiguration({
    required this.knowledgeBaseId,
    required this.modelArn,
    this.generationConfiguration,
    this.orchestrationConfiguration,
    this.retrievalConfiguration,
  });

  Map<String, dynamic> toJson() {
    final knowledgeBaseId = this.knowledgeBaseId;
    final modelArn = this.modelArn;
    final generationConfiguration = this.generationConfiguration;
    final orchestrationConfiguration = this.orchestrationConfiguration;
    final retrievalConfiguration = this.retrievalConfiguration;
    return {
      'knowledgeBaseId': knowledgeBaseId,
      'modelArn': modelArn,
      if (generationConfiguration != null)
        'generationConfiguration': generationConfiguration,
      if (orchestrationConfiguration != null)
        'orchestrationConfiguration': orchestrationConfiguration,
      if (retrievalConfiguration != null)
        'retrievalConfiguration': retrievalConfiguration,
    };
  }
}

/// The configurations of the external source wrapper object in the
/// <code>retrieveAndGenerate</code> function.
class ExternalSourcesRetrieveAndGenerateConfiguration {
  /// The model Amazon Resource Name (ARN) for the external source wrapper object
  /// in the <code>retrieveAndGenerate</code> function.
  final String modelArn;

  /// The document for the external source wrapper object in the
  /// <code>retrieveAndGenerate</code> function.
  final List<ExternalSource> sources;

  /// The prompt used with the external source wrapper object with the
  /// <code>retrieveAndGenerate</code> function.
  final ExternalSourcesGenerationConfiguration? generationConfiguration;

  ExternalSourcesRetrieveAndGenerateConfiguration({
    required this.modelArn,
    required this.sources,
    this.generationConfiguration,
  });

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    final sources = this.sources;
    final generationConfiguration = this.generationConfiguration;
    return {
      'modelArn': modelArn,
      'sources': sources,
      if (generationConfiguration != null)
        'generationConfiguration': generationConfiguration,
    };
  }
}

/// Contains the generation configuration of the external source wrapper object.
class ExternalSourcesGenerationConfiguration {
  /// Additional model parameters and their corresponding values not included in
  /// the textInferenceConfig structure for an external source. Takes in custom
  /// model parameters specific to the language model being used.
  final Map<String, Object>? additionalModelRequestFields;

  /// The configuration details for the guardrail.
  final GuardrailConfiguration? guardrailConfiguration;

  /// Configuration settings for inference when using RetrieveAndGenerate to
  /// generate responses while using an external source.
  final InferenceConfig? inferenceConfig;

  /// The latency configuration for the model.
  final PerformanceConfiguration? performanceConfig;

  /// Contain the textPromptTemplate string for the external source wrapper
  /// object.
  final PromptTemplate? promptTemplate;

  ExternalSourcesGenerationConfiguration({
    this.additionalModelRequestFields,
    this.guardrailConfiguration,
    this.inferenceConfig,
    this.performanceConfig,
    this.promptTemplate,
  });

  Map<String, dynamic> toJson() {
    final additionalModelRequestFields = this.additionalModelRequestFields;
    final guardrailConfiguration = this.guardrailConfiguration;
    final inferenceConfig = this.inferenceConfig;
    final performanceConfig = this.performanceConfig;
    final promptTemplate = this.promptTemplate;
    return {
      if (additionalModelRequestFields != null)
        'additionalModelRequestFields': additionalModelRequestFields,
      if (guardrailConfiguration != null)
        'guardrailConfiguration': guardrailConfiguration,
      if (inferenceConfig != null) 'inferenceConfig': inferenceConfig,
      if (performanceConfig != null) 'performanceConfig': performanceConfig,
      if (promptTemplate != null) 'promptTemplate': promptTemplate,
    };
  }
}

/// Contains the template for the prompt that's sent to the model for response
/// generation. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-test-config.html#kb-test-config-sysprompt">Knowledge
/// base prompt templates</a>.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html#API_agent-runtime_RetrieveAndGenerate_RequestSyntax">RetrieveAndGenerate
/// request</a> – in the <code>filter</code> field
/// </li>
/// </ul>
class PromptTemplate {
  /// The template for the prompt that's sent to the model for response
  /// generation. You can include prompt placeholders, which become replaced
  /// before the prompt is sent to the model to provide instructions and context
  /// to the model. In addition, you can include XML tags to delineate meaningful
  /// sections of the prompt template.
  ///
  /// For more information, see the following resources:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-test-config.html#kb-test-config-sysprompt">Knowledge
  /// base prompt templates</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.claude.com/en/docs/build-with-claude/prompt-engineering/use-xml-tags">Use
  /// XML tags with Anthropic Claude models</a>
  /// </li>
  /// </ul>
  final String? textPromptTemplate;

  PromptTemplate({
    this.textPromptTemplate,
  });

  Map<String, dynamic> toJson() {
    final textPromptTemplate = this.textPromptTemplate;
    return {
      if (textPromptTemplate != null) 'textPromptTemplate': textPromptTemplate,
    };
  }
}

/// The configuration for inference settings when generating responses using
/// RetrieveAndGenerate.
class InferenceConfig {
  /// Configuration settings specific to text generation while generating
  /// responses using RetrieveAndGenerate.
  final TextInferenceConfig? textInferenceConfig;

  InferenceConfig({
    this.textInferenceConfig,
  });

  Map<String, dynamic> toJson() {
    final textInferenceConfig = this.textInferenceConfig;
    return {
      if (textInferenceConfig != null)
        'textInferenceConfig': textInferenceConfig,
    };
  }
}

/// Performance settings for a model.
class PerformanceConfiguration {
  /// To use a latency-optimized version of the model, set to
  /// <code>optimized</code>.
  final PerformanceConfigLatency? latency;

  PerformanceConfiguration({
    this.latency,
  });

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

/// Configuration settings for text generation using a language model via the
/// RetrieveAndGenerate operation. Includes parameters like temperature, top-p,
/// maximum token count, and stop sequences.
/// <note>
/// The valid range of <code>maxTokens</code> depends on the accepted values for
/// your chosen model's inference parameters. To see the inference parameters
/// for your model, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
/// parameters for foundation models.</a>
/// </note>
class TextInferenceConfig {
  /// The maximum number of tokens to generate in the output text. Do not use the
  /// minimum of 0 or the maximum of 65536. The limit values described here are
  /// arbitary values, for actual values consult the limits defined by your
  /// specific model.
  final int? maxTokens;

  /// A list of sequences of characters that, if generated, will cause the model
  /// to stop generating further tokens. Do not use a minimum length of 1 or a
  /// maximum length of 1000. The limit values described here are arbitary values,
  /// for actual values consult the limits defined by your specific model.
  final List<String>? stopSequences;

  /// Controls the random-ness of text generated by the language model,
  /// influencing how much the model sticks to the most predictable next words
  /// versus exploring more surprising options. A lower temperature value (e.g.
  /// 0.2 or 0.3) makes model outputs more deterministic or predictable, while a
  /// higher temperature (e.g. 0.8 or 0.9) makes the outputs more creative or
  /// unpredictable.
  final double? temperature;

  /// A probability distribution threshold which controls what the model considers
  /// for the set of possible next tokens. The model will only consider the top p%
  /// of the probability distribution when generating the next token.
  final double? topP;

  TextInferenceConfig({
    this.maxTokens,
    this.stopSequences,
    this.temperature,
    this.topP,
  });

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

/// The unique external source of the content contained in the wrapper object.
class ExternalSource {
  /// The source type of the external source wrapper object.
  final ExternalSourceType sourceType;

  /// The identifier, contentType, and data of the external source wrapper object.
  final ByteContentDoc? byteContent;

  /// The S3 location of the external source wrapper object.
  final S3ObjectDoc? s3Location;

  ExternalSource({
    required this.sourceType,
    this.byteContent,
    this.s3Location,
  });

  Map<String, dynamic> toJson() {
    final sourceType = this.sourceType;
    final byteContent = this.byteContent;
    final s3Location = this.s3Location;
    return {
      'sourceType': sourceType.value,
      if (byteContent != null) 'byteContent': byteContent,
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

class ExternalSourceType {
  static const s3 = ExternalSourceType._('S3');
  static const byteContent = ExternalSourceType._('BYTE_CONTENT');

  final String value;

  const ExternalSourceType._(this.value);

  static const values = [s3, byteContent];

  static ExternalSourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExternalSourceType._(value));

  @override
  bool operator ==(other) =>
      other is ExternalSourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The unique wrapper object of the document from the S3 location.
class S3ObjectDoc {
  /// The file location of the S3 wrapper object.
  final String uri;

  S3ObjectDoc({
    required this.uri,
  });

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    return {
      'uri': uri,
    };
  }
}

/// This property contains the document to chat with, along with its attributes.
class ByteContentDoc {
  /// The MIME type of the document contained in the wrapper object.
  final String contentType;

  /// The byte value of the file to upload, encoded as a Base-64 string.
  final Uint8List data;

  /// The file name of the document contained in the wrapper object.
  final String identifier;

  ByteContentDoc({
    required this.contentType,
    required this.data,
    required this.identifier,
  });

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final data = this.data;
    final identifier = this.identifier;
    return {
      'contentType': contentType,
      'data': base64Encode(data),
      'identifier': identifier,
    };
  }
}

/// Contains configurations for response generation based on the knowledge base
/// query results.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html#API_agent-runtime_RetrieveAndGenerate_RequestSyntax">RetrieveAndGenerate
/// request</a>
/// </li>
/// </ul>
class GenerationConfiguration {
  /// Additional model parameters and corresponding values not included in the
  /// textInferenceConfig structure for a knowledge base. This allows users to
  /// provide custom model parameters specific to the language model being used.
  final Map<String, Object>? additionalModelRequestFields;

  /// The configuration details for the guardrail.
  final GuardrailConfiguration? guardrailConfiguration;

  /// Configuration settings for inference when using RetrieveAndGenerate to
  /// generate responses while using a knowledge base as a source.
  final InferenceConfig? inferenceConfig;

  /// The latency configuration for the model.
  final PerformanceConfiguration? performanceConfig;

  /// Contains the template for the prompt that's sent to the model for response
  /// generation. Generation prompts must include the
  /// <code>$search_results$</code> variable. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-placeholders.html">Use
  /// placeholder variables</a> in the user guide.
  final PromptTemplate? promptTemplate;

  GenerationConfiguration({
    this.additionalModelRequestFields,
    this.guardrailConfiguration,
    this.inferenceConfig,
    this.performanceConfig,
    this.promptTemplate,
  });

  Map<String, dynamic> toJson() {
    final additionalModelRequestFields = this.additionalModelRequestFields;
    final guardrailConfiguration = this.guardrailConfiguration;
    final inferenceConfig = this.inferenceConfig;
    final performanceConfig = this.performanceConfig;
    final promptTemplate = this.promptTemplate;
    return {
      if (additionalModelRequestFields != null)
        'additionalModelRequestFields': additionalModelRequestFields,
      if (guardrailConfiguration != null)
        'guardrailConfiguration': guardrailConfiguration,
      if (inferenceConfig != null) 'inferenceConfig': inferenceConfig,
      if (performanceConfig != null) 'performanceConfig': performanceConfig,
      if (promptTemplate != null) 'promptTemplate': promptTemplate,
    };
  }
}

/// Settings for how the model processes the prompt prior to retrieval and
/// generation.
class OrchestrationConfiguration {
  /// Additional model parameters and corresponding values not included in the
  /// textInferenceConfig structure for a knowledge base. This allows users to
  /// provide custom model parameters specific to the language model being used.
  final Map<String, Object>? additionalModelRequestFields;

  /// Configuration settings for inference when using RetrieveAndGenerate to
  /// generate responses while using a knowledge base as a source.
  final InferenceConfig? inferenceConfig;

  /// The latency configuration for the model.
  final PerformanceConfiguration? performanceConfig;

  /// Contains the template for the prompt that's sent to the model. Orchestration
  /// prompts must include the <code>$conversation_history$</code> and
  /// <code>$output_format_instructions$</code> variables. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-placeholders.html">Use
  /// placeholder variables</a> in the user guide.
  final PromptTemplate? promptTemplate;

  /// To split up the prompt and retrieve multiple sources, set the transformation
  /// type to <code>QUERY_DECOMPOSITION</code>.
  final QueryTransformationConfiguration? queryTransformationConfiguration;

  OrchestrationConfiguration({
    this.additionalModelRequestFields,
    this.inferenceConfig,
    this.performanceConfig,
    this.promptTemplate,
    this.queryTransformationConfiguration,
  });

  Map<String, dynamic> toJson() {
    final additionalModelRequestFields = this.additionalModelRequestFields;
    final inferenceConfig = this.inferenceConfig;
    final performanceConfig = this.performanceConfig;
    final promptTemplate = this.promptTemplate;
    final queryTransformationConfiguration =
        this.queryTransformationConfiguration;
    return {
      if (additionalModelRequestFields != null)
        'additionalModelRequestFields': additionalModelRequestFields,
      if (inferenceConfig != null) 'inferenceConfig': inferenceConfig,
      if (performanceConfig != null) 'performanceConfig': performanceConfig,
      if (promptTemplate != null) 'promptTemplate': promptTemplate,
      if (queryTransformationConfiguration != null)
        'queryTransformationConfiguration': queryTransformationConfiguration,
    };
  }
}

/// To split up the prompt and retrieve multiple sources, set the transformation
/// type to <code>QUERY_DECOMPOSITION</code>.
class QueryTransformationConfiguration {
  /// The type of transformation to apply to the prompt.
  final QueryTransformationType type;

  QueryTransformationConfiguration({
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'type': type.value,
    };
  }
}

class QueryTransformationType {
  static const queryDecomposition =
      QueryTransformationType._('QUERY_DECOMPOSITION');

  final String value;

  const QueryTransformationType._(this.value);

  static const values = [queryDecomposition];

  static QueryTransformationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QueryTransformationType._(value));

  @override
  bool operator ==(other) =>
      other is QueryTransformationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the response generated from querying the knowledge base.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_RetrieveAndGenerate.html#API_agent-runtime_RetrieveAndGenerate_ResponseSyntax">RetrieveAndGenerate
/// response</a> – in the <code>output</code> field
/// </li>
/// </ul>
class RetrieveAndGenerateOutput {
  /// The response generated from querying the knowledge base.
  final String text;

  RetrieveAndGenerateOutput({
    required this.text,
  });

  factory RetrieveAndGenerateOutput.fromJson(Map<String, dynamic> json) {
    return RetrieveAndGenerateOutput(
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

/// Contains information about a document that was reranked.
class RerankResult {
  /// The original index of the document from the input sources array.
  final int index;

  /// The relevance score of the document.
  final double relevanceScore;

  /// Contains information about the document.
  final RerankDocument? document;

  RerankResult({
    required this.index,
    required this.relevanceScore,
    this.document,
  });

  factory RerankResult.fromJson(Map<String, dynamic> json) {
    return RerankResult(
      index: (json['index'] as int?) ?? 0,
      relevanceScore: (json['relevanceScore'] as double?) ?? 0,
      document: json['document'] != null
          ? RerankDocument.fromJson(json['document'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final index = this.index;
    final relevanceScore = this.relevanceScore;
    final document = this.document;
    return {
      'index': index,
      'relevanceScore': relevanceScore,
      if (document != null) 'document': document,
    };
  }
}

/// Contains information about a document to rerank. Choose the
/// <code>type</code> to define and include the field that corresponds to the
/// type.
class RerankDocument {
  /// The type of document to rerank.
  final RerankDocumentType type;

  /// Contains a JSON document to rerank.
  final Document? jsonDocument;

  /// Contains information about a text document to rerank.
  final RerankTextDocument? textDocument;

  RerankDocument({
    required this.type,
    this.jsonDocument,
    this.textDocument,
  });

  factory RerankDocument.fromJson(Map<String, dynamic> json) {
    return RerankDocument(
      type: RerankDocumentType.fromString((json['type'] as String?) ?? ''),
      jsonDocument: json['jsonDocument'] != null
          ? Document.fromJson(json['jsonDocument'] as Map<String, dynamic>)
          : null,
      textDocument: json['textDocument'] != null
          ? RerankTextDocument.fromJson(
              json['textDocument'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final jsonDocument = this.jsonDocument;
    final textDocument = this.textDocument;
    return {
      'type': type.value,
      if (jsonDocument != null) 'jsonDocument': jsonDocument,
      if (textDocument != null) 'textDocument': textDocument,
    };
  }
}

class RerankDocumentType {
  static const text = RerankDocumentType._('TEXT');
  static const json = RerankDocumentType._('JSON');

  final String value;

  const RerankDocumentType._(this.value);

  static const values = [text, json];

  static RerankDocumentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RerankDocumentType._(value));

  @override
  bool operator ==(other) =>
      other is RerankDocumentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about a text document to rerank.
class RerankTextDocument {
  /// The text of the document.
  final String? text;

  RerankTextDocument({
    this.text,
  });

  factory RerankTextDocument.fromJson(Map<String, dynamic> json) {
    return RerankTextDocument(
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

/// Contains configurations for reranking.
class RerankingConfiguration {
  /// Contains configurations for an Amazon Bedrock reranker.
  final BedrockRerankingConfiguration bedrockRerankingConfiguration;

  /// The type of reranker that the configurations apply to.
  final RerankingConfigurationType type;

  RerankingConfiguration({
    required this.bedrockRerankingConfiguration,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final bedrockRerankingConfiguration = this.bedrockRerankingConfiguration;
    final type = this.type;
    return {
      'bedrockRerankingConfiguration': bedrockRerankingConfiguration,
      'type': type.value,
    };
  }
}

class RerankingConfigurationType {
  static const bedrockRerankingModel =
      RerankingConfigurationType._('BEDROCK_RERANKING_MODEL');

  final String value;

  const RerankingConfigurationType._(this.value);

  static const values = [bedrockRerankingModel];

  static RerankingConfigurationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RerankingConfigurationType._(value));

  @override
  bool operator ==(other) =>
      other is RerankingConfigurationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains configurations for an Amazon Bedrock reranker model.
class BedrockRerankingConfiguration {
  /// Contains configurations for a reranker model.
  final BedrockRerankingModelConfiguration modelConfiguration;

  /// The number of results to return after reranking.
  final int? numberOfResults;

  BedrockRerankingConfiguration({
    required this.modelConfiguration,
    this.numberOfResults,
  });

  Map<String, dynamic> toJson() {
    final modelConfiguration = this.modelConfiguration;
    final numberOfResults = this.numberOfResults;
    return {
      'modelConfiguration': modelConfiguration,
      if (numberOfResults != null) 'numberOfResults': numberOfResults,
    };
  }
}

/// Contains configurations for a reranker model.
class BedrockRerankingModelConfiguration {
  /// The ARN of the reranker model.
  final String modelArn;

  /// A JSON object whose keys are request fields for the model and whose values
  /// are values for those fields.
  final Map<String, Object>? additionalModelRequestFields;

  BedrockRerankingModelConfiguration({
    required this.modelArn,
    this.additionalModelRequestFields,
  });

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

/// Contains information about a source for reranking.
class RerankSource {
  /// Contains an inline definition of a source for reranking.
  final RerankDocument inlineDocumentSource;

  /// The type of the source.
  final RerankSourceType type;

  RerankSource({
    required this.inlineDocumentSource,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final inlineDocumentSource = this.inlineDocumentSource;
    final type = this.type;
    return {
      'inlineDocumentSource': inlineDocumentSource,
      'type': type.value,
    };
  }
}

class RerankSourceType {
  static const inline = RerankSourceType._('INLINE');

  final String value;

  const RerankSourceType._(this.value);

  static const values = [inline];

  static RerankSourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RerankSourceType._(value));

  @override
  bool operator ==(other) => other is RerankSourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about a query to submit to the reranker model.
class RerankQuery {
  /// Contains information about a text query.
  final RerankTextDocument textQuery;

  /// The type of the query.
  final RerankQueryContentType type;

  RerankQuery({
    required this.textQuery,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final textQuery = this.textQuery;
    final type = this.type;
    return {
      'textQuery': textQuery,
      'type': type.value,
    };
  }
}

class RerankQueryContentType {
  static const text = RerankQueryContentType._('TEXT');

  final String value;

  const RerankQueryContentType._(this.value);

  static const values = [text];

  static RerankQueryContentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RerankQueryContentType._(value));

  @override
  bool operator ==(other) =>
      other is RerankQueryContentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The stream containing events in the prompt optimization process.
class OptimizedPromptStream {
  /// The request is denied because of missing access permissions. Check your
  /// permissions and retry your request.
  final AccessDeniedException? accessDeniedException;

  /// An event in which the prompt was analyzed in preparation for optimization.
  final AnalyzePromptEvent? analyzePromptEvent;

  /// There was an issue with a dependency due to a server issue. Retry your
  /// request.
  final BadGatewayException? badGatewayException;

  /// There was an issue with a dependency. Check the resource configurations and
  /// retry the request.
  final DependencyFailedException? dependencyFailedException;

  /// An internal server error occurred. Retry your request.
  final InternalServerException? internalServerException;

  /// An event in which the prompt was optimized.
  final OptimizedPromptEvent? optimizedPromptEvent;

  /// Your request was throttled because of service-wide limitations. Resubmit
  /// your request later or in a different region. You can also purchase <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prov-throughput.html">Provisioned
  /// Throughput</a> to increase the rate or number of tokens you can process.
  final ThrottlingException? throttlingException;

  /// Input validation failed. Check your request parameters and retry the
  /// request.
  final ValidationException? validationException;

  OptimizedPromptStream({
    this.accessDeniedException,
    this.analyzePromptEvent,
    this.badGatewayException,
    this.dependencyFailedException,
    this.internalServerException,
    this.optimizedPromptEvent,
    this.throttlingException,
    this.validationException,
  });

  factory OptimizedPromptStream.fromJson(Map<String, dynamic> json) {
    return OptimizedPromptStream(
      accessDeniedException: json['accessDeniedException'] != null
          ? AccessDeniedException.fromJson(
              json['accessDeniedException'] as Map<String, dynamic>)
          : null,
      analyzePromptEvent: json['analyzePromptEvent'] != null
          ? AnalyzePromptEvent.fromJson(
              json['analyzePromptEvent'] as Map<String, dynamic>)
          : null,
      badGatewayException: json['badGatewayException'] != null
          ? BadGatewayException.fromJson(
              json['badGatewayException'] as Map<String, dynamic>)
          : null,
      dependencyFailedException: json['dependencyFailedException'] != null
          ? DependencyFailedException.fromJson(
              json['dependencyFailedException'] as Map<String, dynamic>)
          : null,
      internalServerException: json['internalServerException'] != null
          ? InternalServerException.fromJson(
              json['internalServerException'] as Map<String, dynamic>)
          : null,
      optimizedPromptEvent: json['optimizedPromptEvent'] != null
          ? OptimizedPromptEvent.fromJson(
              json['optimizedPromptEvent'] as Map<String, dynamic>)
          : null,
      throttlingException: json['throttlingException'] != null
          ? ThrottlingException.fromJson(
              json['throttlingException'] as Map<String, dynamic>)
          : null,
      validationException: json['validationException'] != null
          ? ValidationException.fromJson(
              json['validationException'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessDeniedException = this.accessDeniedException;
    final analyzePromptEvent = this.analyzePromptEvent;
    final badGatewayException = this.badGatewayException;
    final dependencyFailedException = this.dependencyFailedException;
    final internalServerException = this.internalServerException;
    final optimizedPromptEvent = this.optimizedPromptEvent;
    final throttlingException = this.throttlingException;
    final validationException = this.validationException;
    return {
      if (accessDeniedException != null)
        'accessDeniedException': accessDeniedException,
      if (analyzePromptEvent != null) 'analyzePromptEvent': analyzePromptEvent,
      if (badGatewayException != null)
        'badGatewayException': badGatewayException,
      if (dependencyFailedException != null)
        'dependencyFailedException': dependencyFailedException,
      if (internalServerException != null)
        'internalServerException': internalServerException,
      if (optimizedPromptEvent != null)
        'optimizedPromptEvent': optimizedPromptEvent,
      if (throttlingException != null)
        'throttlingException': throttlingException,
      if (validationException != null)
        'validationException': validationException,
    };
  }
}

/// An event in which the prompt was optimized.
class OptimizedPromptEvent {
  /// Contains information about the optimized prompt.
  final OptimizedPrompt? optimizedPrompt;

  OptimizedPromptEvent({
    this.optimizedPrompt,
  });

  factory OptimizedPromptEvent.fromJson(Map<String, dynamic> json) {
    return OptimizedPromptEvent(
      optimizedPrompt: json['optimizedPrompt'] != null
          ? OptimizedPrompt.fromJson(
              json['optimizedPrompt'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final optimizedPrompt = this.optimizedPrompt;
    return {
      if (optimizedPrompt != null) 'optimizedPrompt': optimizedPrompt,
    };
  }
}

/// An event in which the prompt was analyzed in preparation for optimization.
class AnalyzePromptEvent {
  /// A message describing the analysis of the prompt.
  final String? message;

  AnalyzePromptEvent({
    this.message,
  });

  factory AnalyzePromptEvent.fromJson(Map<String, dynamic> json) {
    return AnalyzePromptEvent(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// Contains information about the optimized prompt.
class OptimizedPrompt {
  /// Contains information about the text in the prompt that was optimized.
  final TextPrompt? textPrompt;

  OptimizedPrompt({
    this.textPrompt,
  });

  factory OptimizedPrompt.fromJson(Map<String, dynamic> json) {
    return OptimizedPrompt(
      textPrompt: json['textPrompt'] != null
          ? TextPrompt.fromJson(json['textPrompt'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final textPrompt = this.textPrompt;
    return {
      if (textPrompt != null) 'textPrompt': textPrompt,
    };
  }
}

/// Contains information about the text prompt to optimize.
class TextPrompt {
  /// The text in the text prompt to optimize.
  final String text;

  TextPrompt({
    required this.text,
  });

  factory TextPrompt.fromJson(Map<String, dynamic> json) {
    return TextPrompt(
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

/// Contains information about the prompt to optimize.
class InputPrompt {
  /// Contains information about the text prompt to optimize.
  final TextPrompt? textPrompt;

  InputPrompt({
    this.textPrompt,
  });

  Map<String, dynamic> toJson() {
    final textPrompt = this.textPrompt;
    return {
      if (textPrompt != null) 'textPrompt': textPrompt,
    };
  }
}

/// Contains sessions summaries.
class Memory {
  /// Contains summary of a session.
  final MemorySessionSummary? sessionSummary;

  Memory({
    this.sessionSummary,
  });

  factory Memory.fromJson(Map<String, dynamic> json) {
    return Memory(
      sessionSummary: json['sessionSummary'] != null
          ? MemorySessionSummary.fromJson(
              json['sessionSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionSummary = this.sessionSummary;
    return {
      if (sessionSummary != null) 'sessionSummary': sessionSummary,
    };
  }
}

/// Contains details of a session summary.
class MemorySessionSummary {
  /// The unique identifier of the memory where the session summary is stored.
  final String? memoryId;

  /// The time when the memory duration for the session is set to end.
  final DateTime? sessionExpiryTime;

  /// The identifier for this session.
  final String? sessionId;

  /// The start time for this session.
  final DateTime? sessionStartTime;

  /// The summarized text for this session.
  final String? summaryText;

  MemorySessionSummary({
    this.memoryId,
    this.sessionExpiryTime,
    this.sessionId,
    this.sessionStartTime,
    this.summaryText,
  });

  factory MemorySessionSummary.fromJson(Map<String, dynamic> json) {
    return MemorySessionSummary(
      memoryId: json['memoryId'] as String?,
      sessionExpiryTime: timeStampFromJson(json['sessionExpiryTime']),
      sessionId: json['sessionId'] as String?,
      sessionStartTime: timeStampFromJson(json['sessionStartTime']),
      summaryText: json['summaryText'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final memoryId = this.memoryId;
    final sessionExpiryTime = this.sessionExpiryTime;
    final sessionId = this.sessionId;
    final sessionStartTime = this.sessionStartTime;
    final summaryText = this.summaryText;
    return {
      if (memoryId != null) 'memoryId': memoryId,
      if (sessionExpiryTime != null)
        'sessionExpiryTime': iso8601ToJson(sessionExpiryTime),
      if (sessionId != null) 'sessionId': sessionId,
      if (sessionStartTime != null)
        'sessionStartTime': iso8601ToJson(sessionStartTime),
      if (summaryText != null) 'summaryText': summaryText,
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

/// The response from invoking the agent and associated citations and trace
/// information.
class InlineAgentResponseStream {
  /// The request is denied because of missing access permissions. Check your
  /// permissions and retry your request.
  final AccessDeniedException? accessDeniedException;

  /// There was an issue with a dependency due to a server issue. Retry your
  /// request.
  final BadGatewayException? badGatewayException;

  /// Contains a part of an agent response and citations for it.
  final InlineAgentPayloadPart? chunk;

  /// There was a conflict performing an operation. Resolve the conflict and retry
  /// your request.
  final ConflictException? conflictException;

  /// There was an issue with a dependency. Check the resource configurations and
  /// retry the request.
  final DependencyFailedException? dependencyFailedException;

  /// Contains intermediate response for code interpreter if any files have been
  /// generated.
  final InlineAgentFilePart? files;

  /// An internal server error occurred. Retry your request.
  final InternalServerException? internalServerException;

  /// The specified resource Amazon Resource Name (ARN) was not found. Check the
  /// Amazon Resource Name (ARN) and try your request again.
  final ResourceNotFoundException? resourceNotFoundException;

  /// Contains the parameters and information that the agent elicited from the
  /// customer to carry out an action. This information is returned to the system
  /// and can be used in your own setup for fulfilling the action.
  final InlineAgentReturnControlPayload? returnControl;

  /// The number of requests exceeds the service quota. Resubmit your request
  /// later.
  final ServiceQuotaExceededException? serviceQuotaExceededException;

  /// The number of requests exceeds the limit. Resubmit your request later.
  final ThrottlingException? throttlingException;

  /// Contains information about the agent and session, alongside the agent's
  /// reasoning process and results from calling actions and querying knowledge
  /// bases and metadata about the trace. You can use the trace to understand how
  /// the agent arrived at the response it provided the customer. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/trace-events.html">Trace
  /// events</a>.
  final InlineAgentTracePart? trace;

  /// Input validation failed. Check your request parameters and retry the
  /// request.
  final ValidationException? validationException;

  InlineAgentResponseStream({
    this.accessDeniedException,
    this.badGatewayException,
    this.chunk,
    this.conflictException,
    this.dependencyFailedException,
    this.files,
    this.internalServerException,
    this.resourceNotFoundException,
    this.returnControl,
    this.serviceQuotaExceededException,
    this.throttlingException,
    this.trace,
    this.validationException,
  });

  factory InlineAgentResponseStream.fromJson(Map<String, dynamic> json) {
    return InlineAgentResponseStream(
      accessDeniedException: json['accessDeniedException'] != null
          ? AccessDeniedException.fromJson(
              json['accessDeniedException'] as Map<String, dynamic>)
          : null,
      badGatewayException: json['badGatewayException'] != null
          ? BadGatewayException.fromJson(
              json['badGatewayException'] as Map<String, dynamic>)
          : null,
      chunk: json['chunk'] != null
          ? InlineAgentPayloadPart.fromJson(
              json['chunk'] as Map<String, dynamic>)
          : null,
      conflictException: json['conflictException'] != null
          ? ConflictException.fromJson(
              json['conflictException'] as Map<String, dynamic>)
          : null,
      dependencyFailedException: json['dependencyFailedException'] != null
          ? DependencyFailedException.fromJson(
              json['dependencyFailedException'] as Map<String, dynamic>)
          : null,
      files: json['files'] != null
          ? InlineAgentFilePart.fromJson(json['files'] as Map<String, dynamic>)
          : null,
      internalServerException: json['internalServerException'] != null
          ? InternalServerException.fromJson(
              json['internalServerException'] as Map<String, dynamic>)
          : null,
      resourceNotFoundException: json['resourceNotFoundException'] != null
          ? ResourceNotFoundException.fromJson(
              json['resourceNotFoundException'] as Map<String, dynamic>)
          : null,
      returnControl: json['returnControl'] != null
          ? InlineAgentReturnControlPayload.fromJson(
              json['returnControl'] as Map<String, dynamic>)
          : null,
      serviceQuotaExceededException:
          json['serviceQuotaExceededException'] != null
              ? ServiceQuotaExceededException.fromJson(
                  json['serviceQuotaExceededException'] as Map<String, dynamic>)
              : null,
      throttlingException: json['throttlingException'] != null
          ? ThrottlingException.fromJson(
              json['throttlingException'] as Map<String, dynamic>)
          : null,
      trace: json['trace'] != null
          ? InlineAgentTracePart.fromJson(json['trace'] as Map<String, dynamic>)
          : null,
      validationException: json['validationException'] != null
          ? ValidationException.fromJson(
              json['validationException'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessDeniedException = this.accessDeniedException;
    final badGatewayException = this.badGatewayException;
    final chunk = this.chunk;
    final conflictException = this.conflictException;
    final dependencyFailedException = this.dependencyFailedException;
    final files = this.files;
    final internalServerException = this.internalServerException;
    final resourceNotFoundException = this.resourceNotFoundException;
    final returnControl = this.returnControl;
    final serviceQuotaExceededException = this.serviceQuotaExceededException;
    final throttlingException = this.throttlingException;
    final trace = this.trace;
    final validationException = this.validationException;
    return {
      if (accessDeniedException != null)
        'accessDeniedException': accessDeniedException,
      if (badGatewayException != null)
        'badGatewayException': badGatewayException,
      if (chunk != null) 'chunk': chunk,
      if (conflictException != null) 'conflictException': conflictException,
      if (dependencyFailedException != null)
        'dependencyFailedException': dependencyFailedException,
      if (files != null) 'files': files,
      if (internalServerException != null)
        'internalServerException': internalServerException,
      if (resourceNotFoundException != null)
        'resourceNotFoundException': resourceNotFoundException,
      if (returnControl != null) 'returnControl': returnControl,
      if (serviceQuotaExceededException != null)
        'serviceQuotaExceededException': serviceQuotaExceededException,
      if (throttlingException != null)
        'throttlingException': throttlingException,
      if (trace != null) 'trace': trace,
      if (validationException != null)
        'validationException': validationException,
    };
  }
}

/// Contains a part of an agent response and citations for it.
class InlineAgentPayloadPart {
  /// Contains citations for a part of an agent response.
  final Attribution? attribution;

  /// A part of the agent response in bytes.
  final Uint8List? bytes;

  InlineAgentPayloadPart({
    this.attribution,
    this.bytes,
  });

  factory InlineAgentPayloadPart.fromJson(Map<String, dynamic> json) {
    return InlineAgentPayloadPart(
      attribution: json['attribution'] != null
          ? Attribution.fromJson(json['attribution'] as Map<String, dynamic>)
          : null,
      bytes: _s.decodeNullableUint8List(json['bytes'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final attribution = this.attribution;
    final bytes = this.bytes;
    return {
      if (attribution != null) 'attribution': attribution,
      if (bytes != null) 'bytes': base64Encode(bytes),
    };
  }
}

/// Contains information about the agent and session, alongside the agent's
/// reasoning process and results from calling API actions and querying
/// knowledge bases and metadata about the trace. You can use the trace to
/// understand how the agent arrived at the response it provided the customer.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-test.html#trace-enablement">Trace
/// enablement</a>.
class InlineAgentTracePart {
  /// The caller chain for the trace part.
  final List<Caller>? callerChain;

  /// The collaborator name for the trace part.
  final String? collaboratorName;

  /// The time that trace occurred.
  final DateTime? eventTime;

  /// The unique identifier of the session with the agent.
  final String? sessionId;

  /// Contains one part of the agent's reasoning process and results from calling
  /// API actions and querying knowledge bases. You can use the trace to
  /// understand how the agent arrived at the response it provided the customer.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-test.html#trace-enablement">Trace
  /// enablement</a>.
  final Trace? trace;

  InlineAgentTracePart({
    this.callerChain,
    this.collaboratorName,
    this.eventTime,
    this.sessionId,
    this.trace,
  });

  factory InlineAgentTracePart.fromJson(Map<String, dynamic> json) {
    return InlineAgentTracePart(
      callerChain: (json['callerChain'] as List?)
          ?.nonNulls
          .map((e) => Caller.fromJson(e as Map<String, dynamic>))
          .toList(),
      collaboratorName: json['collaboratorName'] as String?,
      eventTime: timeStampFromJson(json['eventTime']),
      sessionId: json['sessionId'] as String?,
      trace: json['trace'] != null
          ? Trace.fromJson(json['trace'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final callerChain = this.callerChain;
    final collaboratorName = this.collaboratorName;
    final eventTime = this.eventTime;
    final sessionId = this.sessionId;
    final trace = this.trace;
    return {
      if (callerChain != null) 'callerChain': callerChain,
      if (collaboratorName != null) 'collaboratorName': collaboratorName,
      if (eventTime != null) 'eventTime': iso8601ToJson(eventTime),
      if (sessionId != null) 'sessionId': sessionId,
      if (trace != null) 'trace': trace,
    };
  }
}

/// Contains information to return from the action group that the agent has
/// predicted to invoke.
///
/// This data type is used in the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_ResponseSyntax">InvokeAgent
/// response</a> API operation.
class InlineAgentReturnControlPayload {
  /// The identifier of the action group invocation.
  final String? invocationId;

  /// A list of objects that contain information about the parameters and inputs
  /// that need to be sent into the API operation or function, based on what the
  /// agent determines from its session with the user.
  final List<InvocationInputMember>? invocationInputs;

  InlineAgentReturnControlPayload({
    this.invocationId,
    this.invocationInputs,
  });

  factory InlineAgentReturnControlPayload.fromJson(Map<String, dynamic> json) {
    return InlineAgentReturnControlPayload(
      invocationId: json['invocationId'] as String?,
      invocationInputs: (json['invocationInputs'] as List?)
          ?.nonNulls
          .map((e) => InvocationInputMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final invocationId = this.invocationId;
    final invocationInputs = this.invocationInputs;
    return {
      if (invocationId != null) 'invocationId': invocationId,
      if (invocationInputs != null) 'invocationInputs': invocationInputs,
    };
  }
}

/// Contains intermediate response for code interpreter if any files have been
/// generated.
class InlineAgentFilePart {
  /// Files containing intermediate response for the user.
  final List<OutputFile>? files;

  InlineAgentFilePart({
    this.files,
  });

  factory InlineAgentFilePart.fromJson(Map<String, dynamic> json) {
    return InlineAgentFilePart(
      files: (json['files'] as List?)
          ?.nonNulls
          .map((e) => OutputFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final files = this.files;
    return {
      if (files != null) 'files': files,
    };
  }
}

/// Contains details of the response from code interpreter.
class OutputFile {
  /// The byte count of files that contains response from code interpreter.
  final Uint8List? bytes;

  /// The name of the file containing response from code interpreter.
  final String? name;

  /// The type of file that contains response from the code interpreter.
  final String? type;

  OutputFile({
    this.bytes,
    this.name,
    this.type,
  });

  factory OutputFile.fromJson(Map<String, dynamic> json) {
    return OutputFile(
      bytes: _s.decodeNullableUint8List(json['bytes'] as String?),
      name: json['name'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bytes = this.bytes;
    final name = this.name;
    final type = this.type;
    return {
      if (bytes != null) 'bytes': base64Encode(bytes),
      if (name != null) 'name': name,
      if (type != null) 'type': type,
    };
  }
}

/// Contains details about the API operation or function that the agent predicts
/// should be called.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// In the <code>returnControl</code> field of the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_ResponseSyntax">InvokeAgent
/// response</a>
/// </li>
/// </ul>
class InvocationInputMember {
  /// Contains information about the API operation that the agent predicts should
  /// be called.
  final ApiInvocationInput? apiInvocationInput;

  /// Contains information about the function that the agent predicts should be
  /// called.
  final FunctionInvocationInput? functionInvocationInput;

  InvocationInputMember({
    this.apiInvocationInput,
    this.functionInvocationInput,
  });

  factory InvocationInputMember.fromJson(Map<String, dynamic> json) {
    return InvocationInputMember(
      apiInvocationInput: json['apiInvocationInput'] != null
          ? ApiInvocationInput.fromJson(
              json['apiInvocationInput'] as Map<String, dynamic>)
          : null,
      functionInvocationInput: json['functionInvocationInput'] != null
          ? FunctionInvocationInput.fromJson(
              json['functionInvocationInput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final apiInvocationInput = this.apiInvocationInput;
    final functionInvocationInput = this.functionInvocationInput;
    return {
      if (apiInvocationInput != null) 'apiInvocationInput': apiInvocationInput,
      if (functionInvocationInput != null)
        'functionInvocationInput': functionInvocationInput,
    };
  }
}

/// Contains information about the API operation that the agent predicts should
/// be called.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// In the <code>returnControl</code> field of the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_ResponseSyntax">InvokeAgent
/// response</a>
/// </li>
/// </ul>
class ApiInvocationInput {
  /// The action group that the API operation belongs to.
  final String actionGroup;

  /// Contains information about the API operation to invoke.
  final ActionInvocationType? actionInvocationType;

  /// The agent's ID.
  final String? agentId;

  /// The path to the API operation.
  final String? apiPath;

  /// The agent collaborator's name.
  final String? collaboratorName;

  /// The HTTP method of the API operation.
  final String? httpMethod;

  /// The parameters to provide for the API request, as the agent elicited from
  /// the user.
  final List<ApiParameter>? parameters;

  /// The request body to provide for the API request, as the agent elicited from
  /// the user.
  final ApiRequestBody? requestBody;

  ApiInvocationInput({
    required this.actionGroup,
    this.actionInvocationType,
    this.agentId,
    this.apiPath,
    this.collaboratorName,
    this.httpMethod,
    this.parameters,
    this.requestBody,
  });

  factory ApiInvocationInput.fromJson(Map<String, dynamic> json) {
    return ApiInvocationInput(
      actionGroup: (json['actionGroup'] as String?) ?? '',
      actionInvocationType: (json['actionInvocationType'] as String?)
          ?.let(ActionInvocationType.fromString),
      agentId: json['agentId'] as String?,
      apiPath: json['apiPath'] as String?,
      collaboratorName: json['collaboratorName'] as String?,
      httpMethod: json['httpMethod'] as String?,
      parameters: (json['parameters'] as List?)
          ?.nonNulls
          .map((e) => ApiParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestBody: json['requestBody'] != null
          ? ApiRequestBody.fromJson(json['requestBody'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionGroup = this.actionGroup;
    final actionInvocationType = this.actionInvocationType;
    final agentId = this.agentId;
    final apiPath = this.apiPath;
    final collaboratorName = this.collaboratorName;
    final httpMethod = this.httpMethod;
    final parameters = this.parameters;
    final requestBody = this.requestBody;
    return {
      'actionGroup': actionGroup,
      if (actionInvocationType != null)
        'actionInvocationType': actionInvocationType.value,
      if (agentId != null) 'agentId': agentId,
      if (apiPath != null) 'apiPath': apiPath,
      if (collaboratorName != null) 'collaboratorName': collaboratorName,
      if (httpMethod != null) 'httpMethod': httpMethod,
      if (parameters != null) 'parameters': parameters,
      if (requestBody != null) 'requestBody': requestBody,
    };
  }
}

/// Contains information about the function that the agent predicts should be
/// called.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// In the <code>returnControl</code> field of the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_ResponseSyntax">InvokeAgent
/// response</a>
/// </li>
/// </ul>
class FunctionInvocationInput {
  /// The action group that the function belongs to.
  final String actionGroup;

  /// Contains information about the function to invoke,
  final ActionInvocationType? actionInvocationType;

  /// The agent's ID.
  final String? agentId;

  /// The collaborator's name.
  final String? collaboratorName;

  /// The name of the function.
  final String? function;

  /// A list of parameters of the function.
  final List<FunctionParameter>? parameters;

  FunctionInvocationInput({
    required this.actionGroup,
    this.actionInvocationType,
    this.agentId,
    this.collaboratorName,
    this.function,
    this.parameters,
  });

  factory FunctionInvocationInput.fromJson(Map<String, dynamic> json) {
    return FunctionInvocationInput(
      actionGroup: (json['actionGroup'] as String?) ?? '',
      actionInvocationType: (json['actionInvocationType'] as String?)
          ?.let(ActionInvocationType.fromString),
      agentId: json['agentId'] as String?,
      collaboratorName: json['collaboratorName'] as String?,
      function: json['function'] as String?,
      parameters: (json['parameters'] as List?)
          ?.nonNulls
          .map((e) => FunctionParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final actionGroup = this.actionGroup;
    final actionInvocationType = this.actionInvocationType;
    final agentId = this.agentId;
    final collaboratorName = this.collaboratorName;
    final function = this.function;
    final parameters = this.parameters;
    return {
      'actionGroup': actionGroup,
      if (actionInvocationType != null)
        'actionInvocationType': actionInvocationType.value,
      if (agentId != null) 'agentId': agentId,
      if (collaboratorName != null) 'collaboratorName': collaboratorName,
      if (function != null) 'function': function,
      if (parameters != null) 'parameters': parameters,
    };
  }
}

class ActionInvocationType {
  static const result = ActionInvocationType._('RESULT');
  static const userConfirmation = ActionInvocationType._('USER_CONFIRMATION');
  static const userConfirmationAndResult =
      ActionInvocationType._('USER_CONFIRMATION_AND_RESULT');

  final String value;

  const ActionInvocationType._(this.value);

  static const values = [result, userConfirmation, userConfirmationAndResult];

  static ActionInvocationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ActionInvocationType._(value));

  @override
  bool operator ==(other) =>
      other is ActionInvocationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about a parameter of the function.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// In the <code>returnControl</code> field of the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_ResponseSyntax">InvokeAgent
/// response</a>
/// </li>
/// </ul>
class FunctionParameter {
  /// The name of the parameter.
  final String? name;

  /// The data type of the parameter.
  final String? type;

  /// The value of the parameter.
  final String? value;

  FunctionParameter({
    this.name,
    this.type,
    this.value,
  });

  factory FunctionParameter.fromJson(Map<String, dynamic> json) {
    return FunctionParameter(
      name: json['name'] as String?,
      type: json['type'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final value = this.value;
    return {
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (value != null) 'value': value,
    };
  }
}

/// The request body to provide for the API request, as the agent elicited from
/// the user.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_ResponseSyntax">InvokeAgent
/// response</a>
/// </li>
/// </ul>
class ApiRequestBody {
  /// The content of the request body. The key of the object in this field is a
  /// media type defining the format of the request body.
  final Map<String, PropertyParameters>? content;

  ApiRequestBody({
    this.content,
  });

  factory ApiRequestBody.fromJson(Map<String, dynamic> json) {
    return ApiRequestBody(
      content: (json['content'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, PropertyParameters.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    return {
      if (content != null) 'content': content,
    };
  }
}

/// Contains the parameters in the request body.
class PropertyParameters {
  /// A list of parameters in the request body.
  final List<Parameter>? properties;

  PropertyParameters({
    this.properties,
  });

  factory PropertyParameters.fromJson(Map<String, dynamic> json) {
    return PropertyParameters(
      properties: (json['properties'] as List?)
          ?.nonNulls
          .map((e) => Parameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final properties = this.properties;
    return {
      if (properties != null) 'properties': properties,
    };
  }
}

/// A parameter for the API request or function.
class Parameter {
  /// The name of the parameter.
  final String? name;

  /// The type of the parameter.
  final String? type;

  /// The value of the parameter.
  final String? value;

  Parameter({
    this.name,
    this.type,
    this.value,
  });

  factory Parameter.fromJson(Map<String, dynamic> json) {
    return Parameter(
      name: json['name'] as String?,
      type: json['type'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final value = this.value;
    return {
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (value != null) 'value': value,
    };
  }
}

/// Information about a parameter to provide to the API request.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_ResponseSyntax">InvokeAgent
/// response</a>
/// </li>
/// </ul>
class ApiParameter {
  /// The name of the parameter.
  final String? name;

  /// The data type for the parameter.
  final String? type;

  /// The value of the parameter.
  final String? value;

  ApiParameter({
    this.name,
    this.type,
    this.value,
  });

  factory ApiParameter.fromJson(Map<String, dynamic> json) {
    return ApiParameter(
      name: json['name'] as String?,
      type: json['type'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final value = this.value;
    return {
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (value != null) 'value': value,
    };
  }
}

/// Contains one part of the agent's reasoning process and results from calling
/// API actions and querying knowledge bases. You can use the trace to
/// understand how the agent arrived at the response it provided the customer.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-test.html#trace-enablement">Trace
/// enablement</a>.
class Trace {
  /// Details about the custom orchestration step in which the agent determines
  /// the order in which actions are executed.
  final CustomOrchestrationTrace? customOrchestrationTrace;

  /// Contains information about the failure of the interaction.
  final FailureTrace? failureTrace;

  /// The trace details for a trace defined in the Guardrail filter.
  final GuardrailTrace? guardrailTrace;

  /// Details about the orchestration step, in which the agent determines the
  /// order in which actions are executed and which knowledge bases are retrieved.
  final OrchestrationTrace? orchestrationTrace;

  /// Details about the post-processing step, in which the agent shapes the
  /// response..
  final PostProcessingTrace? postProcessingTrace;

  /// Details about the pre-processing step, in which the agent contextualizes and
  /// categorizes user inputs.
  final PreProcessingTrace? preProcessingTrace;

  /// A routing classifier's trace.
  final RoutingClassifierTrace? routingClassifierTrace;

  Trace({
    this.customOrchestrationTrace,
    this.failureTrace,
    this.guardrailTrace,
    this.orchestrationTrace,
    this.postProcessingTrace,
    this.preProcessingTrace,
    this.routingClassifierTrace,
  });

  factory Trace.fromJson(Map<String, dynamic> json) {
    return Trace(
      customOrchestrationTrace: json['customOrchestrationTrace'] != null
          ? CustomOrchestrationTrace.fromJson(
              json['customOrchestrationTrace'] as Map<String, dynamic>)
          : null,
      failureTrace: json['failureTrace'] != null
          ? FailureTrace.fromJson(json['failureTrace'] as Map<String, dynamic>)
          : null,
      guardrailTrace: json['guardrailTrace'] != null
          ? GuardrailTrace.fromJson(
              json['guardrailTrace'] as Map<String, dynamic>)
          : null,
      orchestrationTrace: json['orchestrationTrace'] != null
          ? OrchestrationTrace.fromJson(
              json['orchestrationTrace'] as Map<String, dynamic>)
          : null,
      postProcessingTrace: json['postProcessingTrace'] != null
          ? PostProcessingTrace.fromJson(
              json['postProcessingTrace'] as Map<String, dynamic>)
          : null,
      preProcessingTrace: json['preProcessingTrace'] != null
          ? PreProcessingTrace.fromJson(
              json['preProcessingTrace'] as Map<String, dynamic>)
          : null,
      routingClassifierTrace: json['routingClassifierTrace'] != null
          ? RoutingClassifierTrace.fromJson(
              json['routingClassifierTrace'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customOrchestrationTrace = this.customOrchestrationTrace;
    final failureTrace = this.failureTrace;
    final guardrailTrace = this.guardrailTrace;
    final orchestrationTrace = this.orchestrationTrace;
    final postProcessingTrace = this.postProcessingTrace;
    final preProcessingTrace = this.preProcessingTrace;
    final routingClassifierTrace = this.routingClassifierTrace;
    return {
      if (customOrchestrationTrace != null)
        'customOrchestrationTrace': customOrchestrationTrace,
      if (failureTrace != null) 'failureTrace': failureTrace,
      if (guardrailTrace != null) 'guardrailTrace': guardrailTrace,
      if (orchestrationTrace != null) 'orchestrationTrace': orchestrationTrace,
      if (postProcessingTrace != null)
        'postProcessingTrace': postProcessingTrace,
      if (preProcessingTrace != null) 'preProcessingTrace': preProcessingTrace,
      if (routingClassifierTrace != null)
        'routingClassifierTrace': routingClassifierTrace,
    };
  }
}

/// Details about a caller.
class Caller {
  /// The caller's agent alias ARN.
  final String? agentAliasArn;

  Caller({
    this.agentAliasArn,
  });

  factory Caller.fromJson(Map<String, dynamic> json) {
    return Caller(
      agentAliasArn: json['agentAliasArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentAliasArn = this.agentAliasArn;
    return {
      if (agentAliasArn != null) 'agentAliasArn': agentAliasArn,
    };
  }
}

/// The trace details used in the Guardrail.
class GuardrailTrace {
  /// The trace action details used with the Guardrail.
  final GuardrailAction? action;

  /// The details of the input assessments used in the Guardrail Trace.
  final List<GuardrailAssessment>? inputAssessments;

  /// Contains information about the Guardrail output.
  final Metadata? metadata;

  /// The details of the output assessments used in the Guardrail Trace.
  final List<GuardrailAssessment>? outputAssessments;

  /// The details of the trace Id used in the Guardrail Trace.
  final String? traceId;

  GuardrailTrace({
    this.action,
    this.inputAssessments,
    this.metadata,
    this.outputAssessments,
    this.traceId,
  });

  factory GuardrailTrace.fromJson(Map<String, dynamic> json) {
    return GuardrailTrace(
      action: (json['action'] as String?)?.let(GuardrailAction.fromString),
      inputAssessments: (json['inputAssessments'] as List?)
          ?.nonNulls
          .map((e) => GuardrailAssessment.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] != null
          ? Metadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
      outputAssessments: (json['outputAssessments'] as List?)
          ?.nonNulls
          .map((e) => GuardrailAssessment.fromJson(e as Map<String, dynamic>))
          .toList(),
      traceId: json['traceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final inputAssessments = this.inputAssessments;
    final metadata = this.metadata;
    final outputAssessments = this.outputAssessments;
    final traceId = this.traceId;
    return {
      if (action != null) 'action': action.value,
      if (inputAssessments != null) 'inputAssessments': inputAssessments,
      if (metadata != null) 'metadata': metadata,
      if (outputAssessments != null) 'outputAssessments': outputAssessments,
      if (traceId != null) 'traceId': traceId,
    };
  }
}

/// Details about the pre-processing step, in which the agent contextualizes and
/// categorizes user inputs.
class PreProcessingTrace {
  /// The input for the pre-processing step.
  ///
  /// <ul>
  /// <li>
  /// The <code>type</code> is <code>PRE_PROCESSING</code>.
  /// </li>
  /// <li>
  /// The <code>text</code> contains the prompt.
  /// </li>
  /// <li>
  /// The <code>inferenceConfiguration</code>, <code>parserMode</code>, and
  /// <code>overrideLambda</code> values are set in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_PromptOverrideConfiguration.html">PromptOverrideConfiguration</a>
  /// object that was set when the agent was created or updated.
  /// </li>
  /// </ul>
  final ModelInvocationInput? modelInvocationInput;

  /// The foundation model output from the pre-processing step.
  final PreProcessingModelInvocationOutput? modelInvocationOutput;

  PreProcessingTrace({
    this.modelInvocationInput,
    this.modelInvocationOutput,
  });

  factory PreProcessingTrace.fromJson(Map<String, dynamic> json) {
    return PreProcessingTrace(
      modelInvocationInput: json['modelInvocationInput'] != null
          ? ModelInvocationInput.fromJson(
              json['modelInvocationInput'] as Map<String, dynamic>)
          : null,
      modelInvocationOutput: json['modelInvocationOutput'] != null
          ? PreProcessingModelInvocationOutput.fromJson(
              json['modelInvocationOutput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final modelInvocationInput = this.modelInvocationInput;
    final modelInvocationOutput = this.modelInvocationOutput;
    return {
      if (modelInvocationInput != null)
        'modelInvocationInput': modelInvocationInput,
      if (modelInvocationOutput != null)
        'modelInvocationOutput': modelInvocationOutput,
    };
  }
}

/// Details about the orchestration step, in which the agent determines the
/// order in which actions are executed and which knowledge bases are retrieved.
class OrchestrationTrace {
  /// Contains information pertaining to the action group or knowledge base that
  /// is being invoked.
  final InvocationInput? invocationInput;

  /// The input for the orchestration step.
  ///
  /// <ul>
  /// <li>
  /// The <code>type</code> is <code>ORCHESTRATION</code>.
  /// </li>
  /// <li>
  /// The <code>text</code> contains the prompt.
  /// </li>
  /// <li>
  /// The <code>inferenceConfiguration</code>, <code>parserMode</code>, and
  /// <code>overrideLambda</code> values are set in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_PromptOverrideConfiguration.html">PromptOverrideConfiguration</a>
  /// object that was set when the agent was created or updated.
  /// </li>
  /// </ul>
  final ModelInvocationInput? modelInvocationInput;

  /// Contains information pertaining to the output from the foundation model that
  /// is being invoked.
  final OrchestrationModelInvocationOutput? modelInvocationOutput;

  /// Details about the observation (the output of the action group Lambda or
  /// knowledge base) made by the agent.
  final Observation? observation;

  /// Details about the reasoning, based on the input, that the agent uses to
  /// justify carrying out an action group or getting information from a knowledge
  /// base.
  final Rationale? rationale;

  OrchestrationTrace({
    this.invocationInput,
    this.modelInvocationInput,
    this.modelInvocationOutput,
    this.observation,
    this.rationale,
  });

  factory OrchestrationTrace.fromJson(Map<String, dynamic> json) {
    return OrchestrationTrace(
      invocationInput: json['invocationInput'] != null
          ? InvocationInput.fromJson(
              json['invocationInput'] as Map<String, dynamic>)
          : null,
      modelInvocationInput: json['modelInvocationInput'] != null
          ? ModelInvocationInput.fromJson(
              json['modelInvocationInput'] as Map<String, dynamic>)
          : null,
      modelInvocationOutput: json['modelInvocationOutput'] != null
          ? OrchestrationModelInvocationOutput.fromJson(
              json['modelInvocationOutput'] as Map<String, dynamic>)
          : null,
      observation: json['observation'] != null
          ? Observation.fromJson(json['observation'] as Map<String, dynamic>)
          : null,
      rationale: json['rationale'] != null
          ? Rationale.fromJson(json['rationale'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final invocationInput = this.invocationInput;
    final modelInvocationInput = this.modelInvocationInput;
    final modelInvocationOutput = this.modelInvocationOutput;
    final observation = this.observation;
    final rationale = this.rationale;
    return {
      if (invocationInput != null) 'invocationInput': invocationInput,
      if (modelInvocationInput != null)
        'modelInvocationInput': modelInvocationInput,
      if (modelInvocationOutput != null)
        'modelInvocationOutput': modelInvocationOutput,
      if (observation != null) 'observation': observation,
      if (rationale != null) 'rationale': rationale,
    };
  }
}

/// Details about the post-processing step, in which the agent shapes the
/// response.
class PostProcessingTrace {
  /// The input for the post-processing step.
  ///
  /// <ul>
  /// <li>
  /// The <code>type</code> is <code>POST_PROCESSING</code>.
  /// </li>
  /// <li>
  /// The <code>text</code> contains the prompt.
  /// </li>
  /// <li>
  /// The <code>inferenceConfiguration</code>, <code>parserMode</code>, and
  /// <code>overrideLambda</code> values are set in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_PromptOverrideConfiguration.html">PromptOverrideConfiguration</a>
  /// object that was set when the agent was created or updated.
  /// </li>
  /// </ul>
  final ModelInvocationInput? modelInvocationInput;

  /// The foundation model output from the post-processing step.
  final PostProcessingModelInvocationOutput? modelInvocationOutput;

  PostProcessingTrace({
    this.modelInvocationInput,
    this.modelInvocationOutput,
  });

  factory PostProcessingTrace.fromJson(Map<String, dynamic> json) {
    return PostProcessingTrace(
      modelInvocationInput: json['modelInvocationInput'] != null
          ? ModelInvocationInput.fromJson(
              json['modelInvocationInput'] as Map<String, dynamic>)
          : null,
      modelInvocationOutput: json['modelInvocationOutput'] != null
          ? PostProcessingModelInvocationOutput.fromJson(
              json['modelInvocationOutput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final modelInvocationInput = this.modelInvocationInput;
    final modelInvocationOutput = this.modelInvocationOutput;
    return {
      if (modelInvocationInput != null)
        'modelInvocationInput': modelInvocationInput,
      if (modelInvocationOutput != null)
        'modelInvocationOutput': modelInvocationOutput,
    };
  }
}

/// A trace for a routing classifier.
class RoutingClassifierTrace {
  /// The classifier's invocation input.
  final InvocationInput? invocationInput;

  /// The classifier's model invocation input.
  final ModelInvocationInput? modelInvocationInput;

  /// The classifier's model invocation output.
  final RoutingClassifierModelInvocationOutput? modelInvocationOutput;

  /// The classifier's observation.
  final Observation? observation;

  RoutingClassifierTrace({
    this.invocationInput,
    this.modelInvocationInput,
    this.modelInvocationOutput,
    this.observation,
  });

  factory RoutingClassifierTrace.fromJson(Map<String, dynamic> json) {
    return RoutingClassifierTrace(
      invocationInput: json['invocationInput'] != null
          ? InvocationInput.fromJson(
              json['invocationInput'] as Map<String, dynamic>)
          : null,
      modelInvocationInput: json['modelInvocationInput'] != null
          ? ModelInvocationInput.fromJson(
              json['modelInvocationInput'] as Map<String, dynamic>)
          : null,
      modelInvocationOutput: json['modelInvocationOutput'] != null
          ? RoutingClassifierModelInvocationOutput.fromJson(
              json['modelInvocationOutput'] as Map<String, dynamic>)
          : null,
      observation: json['observation'] != null
          ? Observation.fromJson(json['observation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final invocationInput = this.invocationInput;
    final modelInvocationInput = this.modelInvocationInput;
    final modelInvocationOutput = this.modelInvocationOutput;
    final observation = this.observation;
    return {
      if (invocationInput != null) 'invocationInput': invocationInput,
      if (modelInvocationInput != null)
        'modelInvocationInput': modelInvocationInput,
      if (modelInvocationOutput != null)
        'modelInvocationOutput': modelInvocationOutput,
      if (observation != null) 'observation': observation,
    };
  }
}

/// Contains information about the failure of the interaction.
class FailureTrace {
  /// The failure code for the trace.
  final int? failureCode;

  /// The reason the interaction failed.
  final String? failureReason;

  /// Information about the failure that occurred.
  final Metadata? metadata;

  /// The unique identifier of the trace.
  final String? traceId;

  FailureTrace({
    this.failureCode,
    this.failureReason,
    this.metadata,
    this.traceId,
  });

  factory FailureTrace.fromJson(Map<String, dynamic> json) {
    return FailureTrace(
      failureCode: json['failureCode'] as int?,
      failureReason: json['failureReason'] as String?,
      metadata: json['metadata'] != null
          ? Metadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
      traceId: json['traceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final metadata = this.metadata;
    final traceId = this.traceId;
    return {
      if (failureCode != null) 'failureCode': failureCode,
      if (failureReason != null) 'failureReason': failureReason,
      if (metadata != null) 'metadata': metadata,
      if (traceId != null) 'traceId': traceId,
    };
  }
}

/// The trace behavior for the custom orchestration.
class CustomOrchestrationTrace {
  /// The event details used with the custom orchestration.
  final CustomOrchestrationTraceEvent? event;

  /// The unique identifier of the trace.
  final String? traceId;

  CustomOrchestrationTrace({
    this.event,
    this.traceId,
  });

  factory CustomOrchestrationTrace.fromJson(Map<String, dynamic> json) {
    return CustomOrchestrationTrace(
      event: json['event'] != null
          ? CustomOrchestrationTraceEvent.fromJson(
              json['event'] as Map<String, dynamic>)
          : null,
      traceId: json['traceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final event = this.event;
    final traceId = this.traceId;
    return {
      if (event != null) 'event': event,
      if (traceId != null) 'traceId': traceId,
    };
  }
}

/// The event in the custom orchestration sequence. Events are the responses
/// which the custom orchestration Lambda function sends as response to the
/// agent.
class CustomOrchestrationTraceEvent {
  /// The text that prompted the event at this step.
  final String? text;

  CustomOrchestrationTraceEvent({
    this.text,
  });

  factory CustomOrchestrationTraceEvent.fromJson(Map<String, dynamic> json) {
    return CustomOrchestrationTraceEvent(
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

/// Provides information about the execution process for different types of
/// invocations, such as model invocation, knowledge base invocation, agent
/// collaborator invocation, guardrail invocation, and code interpreter
/// Invocation.
class Metadata {
  /// A unique identifier associated with the downstream invocation. This ID can
  /// be used for tracing, debugging, and identifying specific invocations in
  /// customer logs or systems.
  final String? clientRequestId;

  /// In the final response, <code>endTime</code> is the end time of the agent
  /// invocation operation.
  final DateTime? endTime;

  /// The total time it took for the agent to complete execution. This field is
  /// only set for the final response.
  final int? operationTotalTimeMs;

  /// In the final response, <code>startTime</code> is the start time of the agent
  /// invocation operation.
  final DateTime? startTime;

  /// The total execution time for the specific invocation being processed (model,
  /// knowledge base, guardrail, agent collaborator, or code interpreter). It
  /// represents how long the individual invocation took.
  final int? totalTimeMs;

  /// Specific to model invocation and contains details about the usage of a
  /// foundation model.
  final Usage? usage;

  Metadata({
    this.clientRequestId,
    this.endTime,
    this.operationTotalTimeMs,
    this.startTime,
    this.totalTimeMs,
    this.usage,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      clientRequestId: json['clientRequestId'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      operationTotalTimeMs: json['operationTotalTimeMs'] as int?,
      startTime: timeStampFromJson(json['startTime']),
      totalTimeMs: json['totalTimeMs'] as int?,
      usage: json['usage'] != null
          ? Usage.fromJson(json['usage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientRequestId = this.clientRequestId;
    final endTime = this.endTime;
    final operationTotalTimeMs = this.operationTotalTimeMs;
    final startTime = this.startTime;
    final totalTimeMs = this.totalTimeMs;
    final usage = this.usage;
    return {
      if (clientRequestId != null) 'clientRequestId': clientRequestId,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (operationTotalTimeMs != null)
        'operationTotalTimeMs': operationTotalTimeMs,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (totalTimeMs != null) 'totalTimeMs': totalTimeMs,
      if (usage != null) 'usage': usage,
    };
  }
}

/// Contains information of the usage of the foundation model.
class Usage {
  /// Contains information about the input tokens from the foundation model usage.
  final int? inputTokens;

  /// Contains information about the output tokens from the foundation model
  /// usage.
  final int? outputTokens;

  Usage({
    this.inputTokens,
    this.outputTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) {
    return Usage(
      inputTokens: json['inputTokens'] as int?,
      outputTokens: json['outputTokens'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputTokens = this.inputTokens;
    final outputTokens = this.outputTokens;
    return {
      if (inputTokens != null) 'inputTokens': inputTokens,
      if (outputTokens != null) 'outputTokens': outputTokens,
    };
  }
}

/// Contains information pertaining to the action group or knowledge base that
/// is being invoked.
class InvocationInput {
  /// Contains information about the action group to be invoked.
  final ActionGroupInvocationInput? actionGroupInvocationInput;

  /// The collaborator's invocation input.
  final AgentCollaboratorInvocationInput? agentCollaboratorInvocationInput;

  /// Contains information about the code interpreter to be invoked.
  final CodeInterpreterInvocationInput? codeInterpreterInvocationInput;

  /// Specifies whether the agent is invoking an action group or a knowledge base.
  final InvocationType? invocationType;

  /// Contains details about the knowledge base to look up and the query to be
  /// made.
  final KnowledgeBaseLookupInput? knowledgeBaseLookupInput;

  /// The unique identifier of the trace.
  final String? traceId;

  InvocationInput({
    this.actionGroupInvocationInput,
    this.agentCollaboratorInvocationInput,
    this.codeInterpreterInvocationInput,
    this.invocationType,
    this.knowledgeBaseLookupInput,
    this.traceId,
  });

  factory InvocationInput.fromJson(Map<String, dynamic> json) {
    return InvocationInput(
      actionGroupInvocationInput: json['actionGroupInvocationInput'] != null
          ? ActionGroupInvocationInput.fromJson(
              json['actionGroupInvocationInput'] as Map<String, dynamic>)
          : null,
      agentCollaboratorInvocationInput:
          json['agentCollaboratorInvocationInput'] != null
              ? AgentCollaboratorInvocationInput.fromJson(
                  json['agentCollaboratorInvocationInput']
                      as Map<String, dynamic>)
              : null,
      codeInterpreterInvocationInput: json['codeInterpreterInvocationInput'] !=
              null
          ? CodeInterpreterInvocationInput.fromJson(
              json['codeInterpreterInvocationInput'] as Map<String, dynamic>)
          : null,
      invocationType:
          (json['invocationType'] as String?)?.let(InvocationType.fromString),
      knowledgeBaseLookupInput: json['knowledgeBaseLookupInput'] != null
          ? KnowledgeBaseLookupInput.fromJson(
              json['knowledgeBaseLookupInput'] as Map<String, dynamic>)
          : null,
      traceId: json['traceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionGroupInvocationInput = this.actionGroupInvocationInput;
    final agentCollaboratorInvocationInput =
        this.agentCollaboratorInvocationInput;
    final codeInterpreterInvocationInput = this.codeInterpreterInvocationInput;
    final invocationType = this.invocationType;
    final knowledgeBaseLookupInput = this.knowledgeBaseLookupInput;
    final traceId = this.traceId;
    return {
      if (actionGroupInvocationInput != null)
        'actionGroupInvocationInput': actionGroupInvocationInput,
      if (agentCollaboratorInvocationInput != null)
        'agentCollaboratorInvocationInput': agentCollaboratorInvocationInput,
      if (codeInterpreterInvocationInput != null)
        'codeInterpreterInvocationInput': codeInterpreterInvocationInput,
      if (invocationType != null) 'invocationType': invocationType.value,
      if (knowledgeBaseLookupInput != null)
        'knowledgeBaseLookupInput': knowledgeBaseLookupInput,
      if (traceId != null) 'traceId': traceId,
    };
  }
}

/// Contains the result or output of an action group or knowledge base, or the
/// response to the user.
class Observation {
  /// Contains the JSON-formatted string returned by the API invoked by the action
  /// group.
  final ActionGroupInvocationOutput? actionGroupInvocationOutput;

  /// A collaborator's invocation output.
  final AgentCollaboratorInvocationOutput? agentCollaboratorInvocationOutput;

  /// Contains the JSON-formatted string returned by the API invoked by the code
  /// interpreter.
  final CodeInterpreterInvocationOutput? codeInterpreterInvocationOutput;

  /// Contains details about the response to the user.
  final FinalResponse? finalResponse;

  /// Contains details about the results from looking up the knowledge base.
  final KnowledgeBaseLookupOutput? knowledgeBaseLookupOutput;

  /// Contains details about the response to reprompt the input.
  final RepromptResponse? repromptResponse;

  /// The unique identifier of the trace.
  final String? traceId;

  /// Specifies what kind of information the agent returns in the observation. The
  /// following values are possible.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTION_GROUP</code> – The agent returns the result of an action group.
  /// </li>
  /// <li>
  /// <code>KNOWLEDGE_BASE</code> – The agent returns information from a knowledge
  /// base.
  /// </li>
  /// <li>
  /// <code>FINISH</code> – The agent returns a final response to the user with no
  /// follow-up.
  /// </li>
  /// <li>
  /// <code>ASK_USER</code> – The agent asks the user a question.
  /// </li>
  /// <li>
  /// <code>REPROMPT</code> – The agent prompts the user again for the same
  /// information.
  /// </li>
  /// </ul>
  final Type? type;

  Observation({
    this.actionGroupInvocationOutput,
    this.agentCollaboratorInvocationOutput,
    this.codeInterpreterInvocationOutput,
    this.finalResponse,
    this.knowledgeBaseLookupOutput,
    this.repromptResponse,
    this.traceId,
    this.type,
  });

  factory Observation.fromJson(Map<String, dynamic> json) {
    return Observation(
      actionGroupInvocationOutput: json['actionGroupInvocationOutput'] != null
          ? ActionGroupInvocationOutput.fromJson(
              json['actionGroupInvocationOutput'] as Map<String, dynamic>)
          : null,
      agentCollaboratorInvocationOutput:
          json['agentCollaboratorInvocationOutput'] != null
              ? AgentCollaboratorInvocationOutput.fromJson(
                  json['agentCollaboratorInvocationOutput']
                      as Map<String, dynamic>)
              : null,
      codeInterpreterInvocationOutput:
          json['codeInterpreterInvocationOutput'] != null
              ? CodeInterpreterInvocationOutput.fromJson(
                  json['codeInterpreterInvocationOutput']
                      as Map<String, dynamic>)
              : null,
      finalResponse: json['finalResponse'] != null
          ? FinalResponse.fromJson(
              json['finalResponse'] as Map<String, dynamic>)
          : null,
      knowledgeBaseLookupOutput: json['knowledgeBaseLookupOutput'] != null
          ? KnowledgeBaseLookupOutput.fromJson(
              json['knowledgeBaseLookupOutput'] as Map<String, dynamic>)
          : null,
      repromptResponse: json['repromptResponse'] != null
          ? RepromptResponse.fromJson(
              json['repromptResponse'] as Map<String, dynamic>)
          : null,
      traceId: json['traceId'] as String?,
      type: (json['type'] as String?)?.let(Type.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final actionGroupInvocationOutput = this.actionGroupInvocationOutput;
    final agentCollaboratorInvocationOutput =
        this.agentCollaboratorInvocationOutput;
    final codeInterpreterInvocationOutput =
        this.codeInterpreterInvocationOutput;
    final finalResponse = this.finalResponse;
    final knowledgeBaseLookupOutput = this.knowledgeBaseLookupOutput;
    final repromptResponse = this.repromptResponse;
    final traceId = this.traceId;
    final type = this.type;
    return {
      if (actionGroupInvocationOutput != null)
        'actionGroupInvocationOutput': actionGroupInvocationOutput,
      if (agentCollaboratorInvocationOutput != null)
        'agentCollaboratorInvocationOutput': agentCollaboratorInvocationOutput,
      if (codeInterpreterInvocationOutput != null)
        'codeInterpreterInvocationOutput': codeInterpreterInvocationOutput,
      if (finalResponse != null) 'finalResponse': finalResponse,
      if (knowledgeBaseLookupOutput != null)
        'knowledgeBaseLookupOutput': knowledgeBaseLookupOutput,
      if (repromptResponse != null) 'repromptResponse': repromptResponse,
      if (traceId != null) 'traceId': traceId,
      if (type != null) 'type': type.value,
    };
  }
}

/// The input for the pre-processing step.
///
/// <ul>
/// <li>
/// The <code>type</code> matches the agent step.
/// </li>
/// <li>
/// The <code>text</code> contains the prompt.
/// </li>
/// <li>
/// The <code>inferenceConfiguration</code>, <code>parserMode</code>, and
/// <code>overrideLambda</code> values are set in the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_PromptOverrideConfiguration.html">PromptOverrideConfiguration</a>
/// object that was set when the agent was created or updated.
/// </li>
/// </ul>
class ModelInvocationInput {
  /// The identifier of a foundation model.
  final String? foundationModel;

  /// Specifications about the inference parameters that were provided alongside
  /// the prompt. These are specified in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_PromptOverrideConfiguration.html">PromptOverrideConfiguration</a>
  /// object that was set when the agent was created or updated. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
  /// parameters for foundation models</a>.
  final InferenceConfiguration? inferenceConfiguration;

  /// The ARN of the Lambda function to use when parsing the raw foundation model
  /// output in parts of the agent sequence.
  final String? overrideLambda;

  /// Specifies whether to override the default parser Lambda function when
  /// parsing the raw foundation model output in the part of the agent sequence
  /// defined by the <code>promptType</code>.
  final CreationMode? parserMode;

  /// Specifies whether the default prompt template was <code>OVERRIDDEN</code>.
  /// If it was, the <code>basePromptTemplate</code> that was set in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_PromptOverrideConfiguration.html">PromptOverrideConfiguration</a>
  /// object when the agent was created or updated is used instead.
  final CreationMode? promptCreationMode;

  /// The text that prompted the agent at this step.
  final String? text;

  /// The unique identifier of the trace.
  final String? traceId;

  /// The step in the agent sequence.
  final PromptType? type;

  ModelInvocationInput({
    this.foundationModel,
    this.inferenceConfiguration,
    this.overrideLambda,
    this.parserMode,
    this.promptCreationMode,
    this.text,
    this.traceId,
    this.type,
  });

  factory ModelInvocationInput.fromJson(Map<String, dynamic> json) {
    return ModelInvocationInput(
      foundationModel: json['foundationModel'] as String?,
      inferenceConfiguration: json['inferenceConfiguration'] != null
          ? InferenceConfiguration.fromJson(
              json['inferenceConfiguration'] as Map<String, dynamic>)
          : null,
      overrideLambda: json['overrideLambda'] as String?,
      parserMode: (json['parserMode'] as String?)?.let(CreationMode.fromString),
      promptCreationMode:
          (json['promptCreationMode'] as String?)?.let(CreationMode.fromString),
      text: json['text'] as String?,
      traceId: json['traceId'] as String?,
      type: (json['type'] as String?)?.let(PromptType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final foundationModel = this.foundationModel;
    final inferenceConfiguration = this.inferenceConfiguration;
    final overrideLambda = this.overrideLambda;
    final parserMode = this.parserMode;
    final promptCreationMode = this.promptCreationMode;
    final text = this.text;
    final traceId = this.traceId;
    final type = this.type;
    return {
      if (foundationModel != null) 'foundationModel': foundationModel,
      if (inferenceConfiguration != null)
        'inferenceConfiguration': inferenceConfiguration,
      if (overrideLambda != null) 'overrideLambda': overrideLambda,
      if (parserMode != null) 'parserMode': parserMode.value,
      if (promptCreationMode != null)
        'promptCreationMode': promptCreationMode.value,
      if (text != null) 'text': text,
      if (traceId != null) 'traceId': traceId,
      if (type != null) 'type': type.value,
    };
  }
}

/// Invocation output from a routing classifier model.
class RoutingClassifierModelInvocationOutput {
  /// The invocation's metadata.
  final Metadata? metadata;

  /// The invocation's raw response.
  final RawResponse? rawResponse;

  /// The invocation's trace ID.
  final String? traceId;

  RoutingClassifierModelInvocationOutput({
    this.metadata,
    this.rawResponse,
    this.traceId,
  });

  factory RoutingClassifierModelInvocationOutput.fromJson(
      Map<String, dynamic> json) {
    return RoutingClassifierModelInvocationOutput(
      metadata: json['metadata'] != null
          ? Metadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
      rawResponse: json['rawResponse'] != null
          ? RawResponse.fromJson(json['rawResponse'] as Map<String, dynamic>)
          : null,
      traceId: json['traceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final rawResponse = this.rawResponse;
    final traceId = this.traceId;
    return {
      if (metadata != null) 'metadata': metadata,
      if (rawResponse != null) 'rawResponse': rawResponse,
      if (traceId != null) 'traceId': traceId,
    };
  }
}

/// Contains the raw output from the foundation model.
class RawResponse {
  /// The foundation model's raw output content.
  final String? content;

  RawResponse({
    this.content,
  });

  factory RawResponse.fromJson(Map<String, dynamic> json) {
    return RawResponse(
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

class PromptType {
  static const preProcessing = PromptType._('PRE_PROCESSING');
  static const orchestration = PromptType._('ORCHESTRATION');
  static const knowledgeBaseResponseGeneration =
      PromptType._('KNOWLEDGE_BASE_RESPONSE_GENERATION');
  static const postProcessing = PromptType._('POST_PROCESSING');
  static const routingClassifier = PromptType._('ROUTING_CLASSIFIER');

  final String value;

  const PromptType._(this.value);

  static const values = [
    preProcessing,
    orchestration,
    knowledgeBaseResponseGeneration,
    postProcessing,
    routingClassifier
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

/// Specifications about the inference parameters that were provided alongside
/// the prompt. These are specified in the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent_PromptOverrideConfiguration.html">PromptOverrideConfiguration</a>
/// object that was set when the agent was created or updated. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
/// parameters for foundation models</a>.
class InferenceConfiguration {
  /// The maximum number of tokens allowed in the generated response.
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

class Type {
  static const actionGroup = Type._('ACTION_GROUP');
  static const agentCollaborator = Type._('AGENT_COLLABORATOR');
  static const knowledgeBase = Type._('KNOWLEDGE_BASE');
  static const finish = Type._('FINISH');
  static const askUser = Type._('ASK_USER');
  static const reprompt = Type._('REPROMPT');

  final String value;

  const Type._(this.value);

  static const values = [
    actionGroup,
    agentCollaborator,
    knowledgeBase,
    finish,
    askUser,
    reprompt
  ];

  static Type fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Type._(value));

  @override
  bool operator ==(other) => other is Type && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the JSON-formatted string returned by the API invoked by the action
/// group.
class ActionGroupInvocationOutput {
  /// Contains information about the action group output.
  final Metadata? metadata;

  /// The JSON-formatted string returned by the API invoked by the action group.
  final String? text;

  ActionGroupInvocationOutput({
    this.metadata,
    this.text,
  });

  factory ActionGroupInvocationOutput.fromJson(Map<String, dynamic> json) {
    return ActionGroupInvocationOutput(
      metadata: json['metadata'] != null
          ? Metadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final text = this.text;
    return {
      if (metadata != null) 'metadata': metadata,
      if (text != null) 'text': text,
    };
  }
}

/// Output from an agent collaborator.
class AgentCollaboratorInvocationOutput {
  /// The output's agent collaborator alias ARN.
  final String? agentCollaboratorAliasArn;

  /// The output's agent collaborator name.
  final String? agentCollaboratorName;

  /// Contains information about the output from the agent collaborator.
  final Metadata? metadata;

  /// The output's output.
  final AgentCollaboratorOutputPayload? output;

  AgentCollaboratorInvocationOutput({
    this.agentCollaboratorAliasArn,
    this.agentCollaboratorName,
    this.metadata,
    this.output,
  });

  factory AgentCollaboratorInvocationOutput.fromJson(
      Map<String, dynamic> json) {
    return AgentCollaboratorInvocationOutput(
      agentCollaboratorAliasArn: json['agentCollaboratorAliasArn'] as String?,
      agentCollaboratorName: json['agentCollaboratorName'] as String?,
      metadata: json['metadata'] != null
          ? Metadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
      output: json['output'] != null
          ? AgentCollaboratorOutputPayload.fromJson(
              json['output'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agentCollaboratorAliasArn = this.agentCollaboratorAliasArn;
    final agentCollaboratorName = this.agentCollaboratorName;
    final metadata = this.metadata;
    final output = this.output;
    return {
      if (agentCollaboratorAliasArn != null)
        'agentCollaboratorAliasArn': agentCollaboratorAliasArn,
      if (agentCollaboratorName != null)
        'agentCollaboratorName': agentCollaboratorName,
      if (metadata != null) 'metadata': metadata,
      if (output != null) 'output': output,
    };
  }
}

/// Contains details about the results from looking up the knowledge base.
class KnowledgeBaseLookupOutput {
  /// Contains information about the knowledge base output.
  final Metadata? metadata;

  /// Contains metadata about the sources cited for the generated response.
  final List<RetrievedReference>? retrievedReferences;

  KnowledgeBaseLookupOutput({
    this.metadata,
    this.retrievedReferences,
  });

  factory KnowledgeBaseLookupOutput.fromJson(Map<String, dynamic> json) {
    return KnowledgeBaseLookupOutput(
      metadata: json['metadata'] != null
          ? Metadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
      retrievedReferences: (json['retrievedReferences'] as List?)
          ?.nonNulls
          .map((e) => RetrievedReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final retrievedReferences = this.retrievedReferences;
    return {
      if (metadata != null) 'metadata': metadata,
      if (retrievedReferences != null)
        'retrievedReferences': retrievedReferences,
    };
  }
}

/// Contains details about the response to the user.
class FinalResponse {
  /// Contains information about the invoke agent operation.
  final Metadata? metadata;

  /// The text in the response to the user.
  final String? text;

  FinalResponse({
    this.metadata,
    this.text,
  });

  factory FinalResponse.fromJson(Map<String, dynamic> json) {
    return FinalResponse(
      metadata: json['metadata'] != null
          ? Metadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final text = this.text;
    return {
      if (metadata != null) 'metadata': metadata,
      if (text != null) 'text': text,
    };
  }
}

/// Contains details about the agent's response to reprompt the input.
class RepromptResponse {
  /// Specifies what output is prompting the agent to reprompt the input.
  final Source? source;

  /// The text reprompting the input.
  final String? text;

  RepromptResponse({
    this.source,
    this.text,
  });

  factory RepromptResponse.fromJson(Map<String, dynamic> json) {
    return RepromptResponse(
      source: (json['source'] as String?)?.let(Source.fromString),
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    final text = this.text;
    return {
      if (source != null) 'source': source.value,
      if (text != null) 'text': text,
    };
  }
}

/// Contains the JSON-formatted string returned by the API invoked by the code
/// interpreter.
class CodeInterpreterInvocationOutput {
  /// Contains the error returned from code execution.
  final String? executionError;

  /// Contains the successful output returned from code execution
  final String? executionOutput;

  /// Indicates if the execution of the code timed out.
  final bool? executionTimeout;

  /// Contains output files, if generated by code execution.
  final List<String>? files;

  /// Contains information about the output from the code interpreter.
  final Metadata? metadata;

  CodeInterpreterInvocationOutput({
    this.executionError,
    this.executionOutput,
    this.executionTimeout,
    this.files,
    this.metadata,
  });

  factory CodeInterpreterInvocationOutput.fromJson(Map<String, dynamic> json) {
    return CodeInterpreterInvocationOutput(
      executionError: json['executionError'] as String?,
      executionOutput: json['executionOutput'] as String?,
      executionTimeout: json['executionTimeout'] as bool?,
      files:
          (json['files'] as List?)?.nonNulls.map((e) => e as String).toList(),
      metadata: json['metadata'] != null
          ? Metadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final executionError = this.executionError;
    final executionOutput = this.executionOutput;
    final executionTimeout = this.executionTimeout;
    final files = this.files;
    final metadata = this.metadata;
    return {
      if (executionError != null) 'executionError': executionError,
      if (executionOutput != null) 'executionOutput': executionOutput,
      if (executionTimeout != null) 'executionTimeout': executionTimeout,
      if (files != null) 'files': files,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

class Source {
  static const actionGroup = Source._('ACTION_GROUP');
  static const knowledgeBase = Source._('KNOWLEDGE_BASE');
  static const parser = Source._('PARSER');

  final String value;

  const Source._(this.value);

  static const values = [actionGroup, knowledgeBase, parser];

  static Source fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Source._(value));

  @override
  bool operator ==(other) => other is Source && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Output from an agent collaborator. The output can be text or an action
/// invocation result.
class AgentCollaboratorOutputPayload {
  /// An action invocation result.
  final ReturnControlPayload? returnControlPayload;

  /// Text output.
  final String? text;

  /// The type of output.
  final PayloadType? type;

  AgentCollaboratorOutputPayload({
    this.returnControlPayload,
    this.text,
    this.type,
  });

  factory AgentCollaboratorOutputPayload.fromJson(Map<String, dynamic> json) {
    return AgentCollaboratorOutputPayload(
      returnControlPayload: json['returnControlPayload'] != null
          ? ReturnControlPayload.fromJson(
              json['returnControlPayload'] as Map<String, dynamic>)
          : null,
      text: json['text'] as String?,
      type: (json['type'] as String?)?.let(PayloadType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final returnControlPayload = this.returnControlPayload;
    final text = this.text;
    final type = this.type;
    return {
      if (returnControlPayload != null)
        'returnControlPayload': returnControlPayload,
      if (text != null) 'text': text,
      if (type != null) 'type': type.value,
    };
  }
}

class PayloadType {
  static const text = PayloadType._('TEXT');
  static const returnControl = PayloadType._('RETURN_CONTROL');

  final String value;

  const PayloadType._(this.value);

  static const values = [text, returnControl];

  static PayloadType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PayloadType._(value));

  @override
  bool operator ==(other) => other is PayloadType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information to return from the action group that the agent has
/// predicted to invoke.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_ResponseSyntax">InvokeAgent
/// response</a>
/// </li>
/// </ul>
class ReturnControlPayload {
  /// The identifier of the action group invocation.
  final String? invocationId;

  /// A list of objects that contain information about the parameters and inputs
  /// that need to be sent into the API operation or function, based on what the
  /// agent determines from its session with the user.
  final List<InvocationInputMember>? invocationInputs;

  ReturnControlPayload({
    this.invocationId,
    this.invocationInputs,
  });

  factory ReturnControlPayload.fromJson(Map<String, dynamic> json) {
    return ReturnControlPayload(
      invocationId: json['invocationId'] as String?,
      invocationInputs: (json['invocationInputs'] as List?)
          ?.nonNulls
          .map((e) => InvocationInputMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final invocationId = this.invocationId;
    final invocationInputs = this.invocationInputs;
    return {
      if (invocationId != null) 'invocationId': invocationId,
      if (invocationInputs != null) 'invocationInputs': invocationInputs,
    };
  }
}

class InvocationType {
  static const actionGroup = InvocationType._('ACTION_GROUP');
  static const knowledgeBase = InvocationType._('KNOWLEDGE_BASE');
  static const finish = InvocationType._('FINISH');
  static const actionGroupCodeInterpreter =
      InvocationType._('ACTION_GROUP_CODE_INTERPRETER');
  static const agentCollaborator = InvocationType._('AGENT_COLLABORATOR');

  final String value;

  const InvocationType._(this.value);

  static const values = [
    actionGroup,
    knowledgeBase,
    finish,
    actionGroupCodeInterpreter,
    agentCollaborator
  ];

  static InvocationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InvocationType._(value));

  @override
  bool operator ==(other) => other is InvocationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about the action group being invoked. For more
/// information about the possible structures, see the InvocationInput tab in <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/trace-orchestration.html">OrchestrationTrace</a>
/// in the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
/// Bedrock User Guide</a>.
class ActionGroupInvocationInput {
  /// The name of the action group.
  final String? actionGroupName;

  /// The path to the API to call, based off the action group.
  final String? apiPath;

  /// How fulfillment of the action is handled. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/action-handle.html">Handling
  /// fulfillment of the action</a>.
  final ExecutionType? executionType;

  /// The function in the action group to call.
  final String? function;

  /// The unique identifier of the invocation. Only returned if the
  /// <code>executionType</code> is <code>RETURN_CONTROL</code>.
  final String? invocationId;

  /// The parameters in the Lambda input event.
  final List<Parameter>? parameters;

  /// The parameters in the request body for the Lambda input event.
  final RequestBody? requestBody;

  /// The API method being used, based off the action group.
  final String? verb;

  ActionGroupInvocationInput({
    this.actionGroupName,
    this.apiPath,
    this.executionType,
    this.function,
    this.invocationId,
    this.parameters,
    this.requestBody,
    this.verb,
  });

  factory ActionGroupInvocationInput.fromJson(Map<String, dynamic> json) {
    return ActionGroupInvocationInput(
      actionGroupName: json['actionGroupName'] as String?,
      apiPath: json['apiPath'] as String?,
      executionType:
          (json['executionType'] as String?)?.let(ExecutionType.fromString),
      function: json['function'] as String?,
      invocationId: json['invocationId'] as String?,
      parameters: (json['parameters'] as List?)
          ?.nonNulls
          .map((e) => Parameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestBody: json['requestBody'] != null
          ? RequestBody.fromJson(json['requestBody'] as Map<String, dynamic>)
          : null,
      verb: json['verb'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionGroupName = this.actionGroupName;
    final apiPath = this.apiPath;
    final executionType = this.executionType;
    final function = this.function;
    final invocationId = this.invocationId;
    final parameters = this.parameters;
    final requestBody = this.requestBody;
    final verb = this.verb;
    return {
      if (actionGroupName != null) 'actionGroupName': actionGroupName,
      if (apiPath != null) 'apiPath': apiPath,
      if (executionType != null) 'executionType': executionType.value,
      if (function != null) 'function': function,
      if (invocationId != null) 'invocationId': invocationId,
      if (parameters != null) 'parameters': parameters,
      if (requestBody != null) 'requestBody': requestBody,
      if (verb != null) 'verb': verb,
    };
  }
}

/// Contains details about the knowledge base to look up and the query to be
/// made.
class KnowledgeBaseLookupInput {
  /// The unique identifier of the knowledge base to look up.
  final String? knowledgeBaseId;

  /// The query made to the knowledge base.
  final String? text;

  KnowledgeBaseLookupInput({
    this.knowledgeBaseId,
    this.text,
  });

  factory KnowledgeBaseLookupInput.fromJson(Map<String, dynamic> json) {
    return KnowledgeBaseLookupInput(
      knowledgeBaseId: json['knowledgeBaseId'] as String?,
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBaseId = this.knowledgeBaseId;
    final text = this.text;
    return {
      if (knowledgeBaseId != null) 'knowledgeBaseId': knowledgeBaseId,
      if (text != null) 'text': text,
    };
  }
}

/// Contains information about the code interpreter being invoked.
class CodeInterpreterInvocationInput {
  /// The code for the code interpreter to use.
  final String? code;

  /// Files that are uploaded for code interpreter to use.
  final List<String>? files;

  CodeInterpreterInvocationInput({
    this.code,
    this.files,
  });

  factory CodeInterpreterInvocationInput.fromJson(Map<String, dynamic> json) {
    return CodeInterpreterInvocationInput(
      code: json['code'] as String?,
      files:
          (json['files'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final files = this.files;
    return {
      if (code != null) 'code': code,
      if (files != null) 'files': files,
    };
  }
}

/// An agent collaborator invocation input.
class AgentCollaboratorInvocationInput {
  /// The collaborator's alias ARN.
  final String? agentCollaboratorAliasArn;

  /// The collaborator's name.
  final String? agentCollaboratorName;

  /// Text or action invocation result input for the collaborator.
  final AgentCollaboratorInputPayload? input;

  AgentCollaboratorInvocationInput({
    this.agentCollaboratorAliasArn,
    this.agentCollaboratorName,
    this.input,
  });

  factory AgentCollaboratorInvocationInput.fromJson(Map<String, dynamic> json) {
    return AgentCollaboratorInvocationInput(
      agentCollaboratorAliasArn: json['agentCollaboratorAliasArn'] as String?,
      agentCollaboratorName: json['agentCollaboratorName'] as String?,
      input: json['input'] != null
          ? AgentCollaboratorInputPayload.fromJson(
              json['input'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agentCollaboratorAliasArn = this.agentCollaboratorAliasArn;
    final agentCollaboratorName = this.agentCollaboratorName;
    final input = this.input;
    return {
      if (agentCollaboratorAliasArn != null)
        'agentCollaboratorAliasArn': agentCollaboratorAliasArn,
      if (agentCollaboratorName != null)
        'agentCollaboratorName': agentCollaboratorName,
      if (input != null) 'input': input,
    };
  }
}

/// Input for an agent collaborator. The input can be text or an action
/// invocation result.
class AgentCollaboratorInputPayload {
  /// An action invocation result.
  final ReturnControlResults? returnControlResults;

  /// Input text.
  final String? text;

  /// The input type.
  final PayloadType? type;

  AgentCollaboratorInputPayload({
    this.returnControlResults,
    this.text,
    this.type,
  });

  factory AgentCollaboratorInputPayload.fromJson(Map<String, dynamic> json) {
    return AgentCollaboratorInputPayload(
      returnControlResults: json['returnControlResults'] != null
          ? ReturnControlResults.fromJson(
              json['returnControlResults'] as Map<String, dynamic>)
          : null,
      text: json['text'] as String?,
      type: (json['type'] as String?)?.let(PayloadType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final returnControlResults = this.returnControlResults;
    final text = this.text;
    final type = this.type;
    return {
      if (returnControlResults != null)
        'returnControlResults': returnControlResults,
      if (text != null) 'text': text,
      if (type != null) 'type': type.value,
    };
  }
}

/// An action invocation result.
class ReturnControlResults {
  /// The action's invocation ID.
  final String? invocationId;

  /// The action invocation result.
  final List<InvocationResultMember>? returnControlInvocationResults;

  ReturnControlResults({
    this.invocationId,
    this.returnControlInvocationResults,
  });

  factory ReturnControlResults.fromJson(Map<String, dynamic> json) {
    return ReturnControlResults(
      invocationId: json['invocationId'] as String?,
      returnControlInvocationResults: (json['returnControlInvocationResults']
              as List?)
          ?.nonNulls
          .map(
              (e) => InvocationResultMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final invocationId = this.invocationId;
    final returnControlInvocationResults = this.returnControlInvocationResults;
    return {
      if (invocationId != null) 'invocationId': invocationId,
      if (returnControlInvocationResults != null)
        'returnControlInvocationResults': returnControlInvocationResults,
    };
  }
}

/// A result from the invocation of an action. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-returncontrol.html">Return
/// control to the agent developer</a> and <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-session-state.html">Control
/// session context</a>.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_RequestSyntax">InvokeAgent
/// request</a>
/// </li>
/// </ul>
class InvocationResultMember {
  /// The result from the API response from the action group invocation.
  final ApiResult? apiResult;

  /// The result from the function from the action group invocation.
  final FunctionResult? functionResult;

  InvocationResultMember({
    this.apiResult,
    this.functionResult,
  });

  factory InvocationResultMember.fromJson(Map<String, dynamic> json) {
    return InvocationResultMember(
      apiResult: json['apiResult'] != null
          ? ApiResult.fromJson(json['apiResult'] as Map<String, dynamic>)
          : null,
      functionResult: json['functionResult'] != null
          ? FunctionResult.fromJson(
              json['functionResult'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final apiResult = this.apiResult;
    final functionResult = this.functionResult;
    return {
      if (apiResult != null) 'apiResult': apiResult,
      if (functionResult != null) 'functionResult': functionResult,
    };
  }
}

/// Contains information about the API operation that was called from the action
/// group and the response body that was returned.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// In the <code>returnControlInvocationResults</code> of the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_RequestSyntax">InvokeAgent
/// request</a>
/// </li>
/// </ul>
class ApiResult {
  /// The action group that the API operation belongs to.
  final String actionGroup;

  /// The agent's ID.
  final String? agentId;

  /// The path to the API operation.
  final String? apiPath;

  /// Controls the API operations or functions to invoke based on the user
  /// confirmation.
  final ConfirmationState? confirmationState;

  /// The HTTP method for the API operation.
  final String? httpMethod;

  /// http status code from API execution response (for example: 200, 400, 500).
  final int? httpStatusCode;

  /// The response body from the API operation. The key of the object is the
  /// content type (currently, only <code>TEXT</code> is supported). The response
  /// may be returned directly or from the Lambda function.
  final Map<String, ContentBody>? responseBody;

  /// Controls the final response state returned to end user when API/Function
  /// execution failed. When this state is FAILURE, the request would fail with
  /// dependency failure exception. When this state is REPROMPT, the API/function
  /// response will be sent to model for re-prompt
  final ResponseState? responseState;

  ApiResult({
    required this.actionGroup,
    this.agentId,
    this.apiPath,
    this.confirmationState,
    this.httpMethod,
    this.httpStatusCode,
    this.responseBody,
    this.responseState,
  });

  factory ApiResult.fromJson(Map<String, dynamic> json) {
    return ApiResult(
      actionGroup: (json['actionGroup'] as String?) ?? '',
      agentId: json['agentId'] as String?,
      apiPath: json['apiPath'] as String?,
      confirmationState: (json['confirmationState'] as String?)
          ?.let(ConfirmationState.fromString),
      httpMethod: json['httpMethod'] as String?,
      httpStatusCode: json['httpStatusCode'] as int?,
      responseBody: (json['responseBody'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, ContentBody.fromJson(e as Map<String, dynamic>))),
      responseState:
          (json['responseState'] as String?)?.let(ResponseState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final actionGroup = this.actionGroup;
    final agentId = this.agentId;
    final apiPath = this.apiPath;
    final confirmationState = this.confirmationState;
    final httpMethod = this.httpMethod;
    final httpStatusCode = this.httpStatusCode;
    final responseBody = this.responseBody;
    final responseState = this.responseState;
    return {
      'actionGroup': actionGroup,
      if (agentId != null) 'agentId': agentId,
      if (apiPath != null) 'apiPath': apiPath,
      if (confirmationState != null)
        'confirmationState': confirmationState.value,
      if (httpMethod != null) 'httpMethod': httpMethod,
      if (httpStatusCode != null) 'httpStatusCode': httpStatusCode,
      if (responseBody != null) 'responseBody': responseBody,
      if (responseState != null) 'responseState': responseState.value,
    };
  }
}

/// Contains information about the function that was called from the action
/// group and the response that was returned.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// In the <code>returnControlInvocationResults</code> of the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_RequestSyntax">InvokeAgent
/// request</a>
/// </li>
/// </ul>
class FunctionResult {
  /// The action group that the function belongs to.
  final String actionGroup;

  /// The agent's ID.
  final String? agentId;

  /// Contains the user confirmation information about the function that was
  /// called.
  final ConfirmationState? confirmationState;

  /// The name of the function that was called.
  final String? function;

  /// The response from the function call using the parameters. The response might
  /// be returned directly or from the Lambda function. Specify <code>TEXT</code>
  /// or <code>IMAGES</code>. The key of the object is the content type. You can
  /// only specify one type. If you specify <code>IMAGES</code>, you can specify
  /// only one image. You can specify images only when the function in the
  /// <code>returnControlInvocationResults</code> is a computer use action. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agent-computer-use.html">Configure
  /// an Amazon Bedrock Agent to complete tasks with computer use tools</a>.
  final Map<String, ContentBody>? responseBody;

  /// Controls the final response state returned to end user when API/Function
  /// execution failed. When this state is FAILURE, the request would fail with
  /// dependency failure exception. When this state is REPROMPT, the API/function
  /// response will be sent to model for re-prompt
  final ResponseState? responseState;

  FunctionResult({
    required this.actionGroup,
    this.agentId,
    this.confirmationState,
    this.function,
    this.responseBody,
    this.responseState,
  });

  factory FunctionResult.fromJson(Map<String, dynamic> json) {
    return FunctionResult(
      actionGroup: (json['actionGroup'] as String?) ?? '',
      agentId: json['agentId'] as String?,
      confirmationState: (json['confirmationState'] as String?)
          ?.let(ConfirmationState.fromString),
      function: json['function'] as String?,
      responseBody: (json['responseBody'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, ContentBody.fromJson(e as Map<String, dynamic>))),
      responseState:
          (json['responseState'] as String?)?.let(ResponseState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final actionGroup = this.actionGroup;
    final agentId = this.agentId;
    final confirmationState = this.confirmationState;
    final function = this.function;
    final responseBody = this.responseBody;
    final responseState = this.responseState;
    return {
      'actionGroup': actionGroup,
      if (agentId != null) 'agentId': agentId,
      if (confirmationState != null)
        'confirmationState': confirmationState.value,
      if (function != null) 'function': function,
      if (responseBody != null) 'responseBody': responseBody,
      if (responseState != null) 'responseState': responseState.value,
    };
  }
}

class ConfirmationState {
  static const confirm = ConfirmationState._('CONFIRM');
  static const deny = ConfirmationState._('DENY');

  final String value;

  const ConfirmationState._(this.value);

  static const values = [confirm, deny];

  static ConfirmationState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfirmationState._(value));

  @override
  bool operator ==(other) => other is ConfirmationState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ResponseState {
  static const failure = ResponseState._('FAILURE');
  static const reprompt = ResponseState._('REPROMPT');

  final String value;

  const ResponseState._(this.value);

  static const values = [failure, reprompt];

  static ResponseState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResponseState._(value));

  @override
  bool operator ==(other) => other is ResponseState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the body of the API response.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// In the <code>returnControlInvocationResults</code> field of the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html#API_agent-runtime_InvokeAgent_RequestSyntax">InvokeAgent
/// request</a>
/// </li>
/// </ul>
class ContentBody {
  /// The body of the API response.
  final String? body;

  /// Lists details, including format and source, for the image in the response
  /// from the function call. You can specify only one image and the function in
  /// the <code>returnControlInvocationResults</code> must be a computer use
  /// action. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agent-computer-use.html">Configure
  /// an Amazon Bedrock Agent to complete tasks with computer use tools</a>.
  final List<ImageInput>? images;

  ContentBody({
    this.body,
    this.images,
  });

  factory ContentBody.fromJson(Map<String, dynamic> json) {
    return ContentBody(
      body: json['body'] as String?,
      images: (json['images'] as List?)
          ?.nonNulls
          .map((e) => ImageInput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final body = this.body;
    final images = this.images;
    return {
      if (body != null) 'body': body,
      if (images != null) 'images': images,
    };
  }
}

/// Details about an image in the result from a function in the action group
/// invocation. You can specify images only when the function is a computer use
/// action. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agent-computer-use.html">Configure
/// an Amazon Bedrock Agent to complete tasks with computer use tools</a>.
class ImageInput {
  /// The type of image in the result.
  final ImageInputFormat format;

  /// The source of the image in the result.
  final ImageInputSource source;

  ImageInput({
    required this.format,
    required this.source,
  });

  factory ImageInput.fromJson(Map<String, dynamic> json) {
    return ImageInput(
      format: ImageInputFormat.fromString((json['format'] as String?) ?? ''),
      source: ImageInputSource.fromJson(
          (json['source'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final source = this.source;
    return {
      'format': format.value,
      'source': source,
    };
  }
}

class ImageInputFormat {
  static const png = ImageInputFormat._('png');
  static const jpeg = ImageInputFormat._('jpeg');
  static const gif = ImageInputFormat._('gif');
  static const webp = ImageInputFormat._('webp');

  final String value;

  const ImageInputFormat._(this.value);

  static const values = [png, jpeg, gif, webp];

  static ImageInputFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImageInputFormat._(value));

  @override
  bool operator ==(other) => other is ImageInputFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the source of an input image in the result from a function in
/// the action group invocation.
class ImageInputSource {
  /// The raw image bytes for the image. If you use an Amazon Web Services SDK,
  /// you don't need to encode the image bytes in base64.
  final Uint8List? bytes;

  ImageInputSource({
    this.bytes,
  });

  factory ImageInputSource.fromJson(Map<String, dynamic> json) {
    return ImageInputSource(
      bytes: _s.decodeNullableUint8List(json['bytes'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final bytes = this.bytes;
    return {
      if (bytes != null) 'bytes': base64Encode(bytes),
    };
  }
}

/// The parameters in the API request body.
class RequestBody {
  /// The content in the request body.
  final Map<String, List<Parameter>>? content;

  RequestBody({
    this.content,
  });

  factory RequestBody.fromJson(Map<String, dynamic> json) {
    return RequestBody(
      content: (json['content'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              (e as List)
                  .nonNulls
                  .map((e) => Parameter.fromJson(e as Map<String, dynamic>))
                  .toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    return {
      if (content != null) 'content': content,
    };
  }
}

class ExecutionType {
  static const lambda = ExecutionType._('LAMBDA');
  static const returnControl = ExecutionType._('RETURN_CONTROL');

  final String value;

  const ExecutionType._(this.value);

  static const values = [lambda, returnControl];

  static ExecutionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExecutionType._(value));

  @override
  bool operator ==(other) => other is ExecutionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The foundation model output from the post-processing step.
class PostProcessingModelInvocationOutput {
  /// Contains information about the foundation model output from the
  /// post-processing step.
  final Metadata? metadata;

  /// Details about the response from the Lambda parsing of the output of the
  /// post-processing step.
  final PostProcessingParsedResponse? parsedResponse;

  /// Details of the raw response from the foundation model output.
  final RawResponse? rawResponse;

  /// Contains content about the reasoning that the model made during the
  /// post-processing step.
  final ReasoningContentBlock? reasoningContent;

  /// The unique identifier of the trace.
  final String? traceId;

  PostProcessingModelInvocationOutput({
    this.metadata,
    this.parsedResponse,
    this.rawResponse,
    this.reasoningContent,
    this.traceId,
  });

  factory PostProcessingModelInvocationOutput.fromJson(
      Map<String, dynamic> json) {
    return PostProcessingModelInvocationOutput(
      metadata: json['metadata'] != null
          ? Metadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
      parsedResponse: json['parsedResponse'] != null
          ? PostProcessingParsedResponse.fromJson(
              json['parsedResponse'] as Map<String, dynamic>)
          : null,
      rawResponse: json['rawResponse'] != null
          ? RawResponse.fromJson(json['rawResponse'] as Map<String, dynamic>)
          : null,
      reasoningContent: json['reasoningContent'] != null
          ? ReasoningContentBlock.fromJson(
              json['reasoningContent'] as Map<String, dynamic>)
          : null,
      traceId: json['traceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final parsedResponse = this.parsedResponse;
    final rawResponse = this.rawResponse;
    final reasoningContent = this.reasoningContent;
    final traceId = this.traceId;
    return {
      if (metadata != null) 'metadata': metadata,
      if (parsedResponse != null) 'parsedResponse': parsedResponse,
      if (rawResponse != null) 'rawResponse': rawResponse,
      if (reasoningContent != null) 'reasoningContent': reasoningContent,
      if (traceId != null) 'traceId': traceId,
    };
  }
}

/// Details about the response from the Lambda parsing of the output from the
/// post-processing step.
class PostProcessingParsedResponse {
  /// The text returned by the parser.
  final String? text;

  PostProcessingParsedResponse({
    this.text,
  });

  factory PostProcessingParsedResponse.fromJson(Map<String, dynamic> json) {
    return PostProcessingParsedResponse(
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

/// Contains content regarding the reasoning that the foundation model made with
/// respect to the content in the content block. Reasoning refers to a Chain of
/// Thought (CoT) that the model generates to enhance the accuracy of its final
/// response.
class ReasoningContentBlock {
  /// Contains information about the reasoning that the model used to return the
  /// content in the content block.
  final ReasoningTextBlock? reasoningText;

  /// The content in the reasoning that was encrypted by the model provider for
  /// trust and safety reasons.
  final Uint8List? redactedContent;

  ReasoningContentBlock({
    this.reasoningText,
    this.redactedContent,
  });

  factory ReasoningContentBlock.fromJson(Map<String, dynamic> json) {
    return ReasoningContentBlock(
      reasoningText: json['reasoningText'] != null
          ? ReasoningTextBlock.fromJson(
              json['reasoningText'] as Map<String, dynamic>)
          : null,
      redactedContent:
          _s.decodeNullableUint8List(json['redactedContent'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final reasoningText = this.reasoningText;
    final redactedContent = this.redactedContent;
    return {
      if (reasoningText != null) 'reasoningText': reasoningText,
      if (redactedContent != null)
        'redactedContent': base64Encode(redactedContent),
    };
  }
}

/// Contains information about the reasoning that the model used to return the
/// content in the content block.
class ReasoningTextBlock {
  /// Text describing the reasoning that the model used to return the content in
  /// the content block.
  final String text;

  /// A hash of all the messages in the conversation to ensure that the content in
  /// the reasoning text block isn't tampered with. You must submit the signature
  /// in subsequent <code>Converse</code> requests, in addition to the previous
  /// messages. If the previous messages are tampered with, the response throws an
  /// error.
  final String? signature;

  ReasoningTextBlock({
    required this.text,
    this.signature,
  });

  factory ReasoningTextBlock.fromJson(Map<String, dynamic> json) {
    return ReasoningTextBlock(
      text: (json['text'] as String?) ?? '',
      signature: json['signature'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final signature = this.signature;
    return {
      'text': text,
      if (signature != null) 'signature': signature,
    };
  }
}

/// Contains the reasoning, based on the input, that the agent uses to justify
/// carrying out an action group or getting information from a knowledge base.
class Rationale {
  /// The reasoning or thought process of the agent, based on the input.
  final String? text;

  /// The unique identifier of the trace step.
  final String? traceId;

  Rationale({
    this.text,
    this.traceId,
  });

  factory Rationale.fromJson(Map<String, dynamic> json) {
    return Rationale(
      text: json['text'] as String?,
      traceId: json['traceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final traceId = this.traceId;
    return {
      if (text != null) 'text': text,
      if (traceId != null) 'traceId': traceId,
    };
  }
}

/// The foundation model output from the orchestration step.
class OrchestrationModelInvocationOutput {
  /// Contains information about the foundation model output from the
  /// orchestration step.
  final Metadata? metadata;

  /// Contains details of the raw response from the foundation model output.
  final RawResponse? rawResponse;

  /// Contains content about the reasoning that the model made during the
  /// orchestration step.
  final ReasoningContentBlock? reasoningContent;

  /// The unique identifier of the trace.
  final String? traceId;

  OrchestrationModelInvocationOutput({
    this.metadata,
    this.rawResponse,
    this.reasoningContent,
    this.traceId,
  });

  factory OrchestrationModelInvocationOutput.fromJson(
      Map<String, dynamic> json) {
    return OrchestrationModelInvocationOutput(
      metadata: json['metadata'] != null
          ? Metadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
      rawResponse: json['rawResponse'] != null
          ? RawResponse.fromJson(json['rawResponse'] as Map<String, dynamic>)
          : null,
      reasoningContent: json['reasoningContent'] != null
          ? ReasoningContentBlock.fromJson(
              json['reasoningContent'] as Map<String, dynamic>)
          : null,
      traceId: json['traceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final rawResponse = this.rawResponse;
    final reasoningContent = this.reasoningContent;
    final traceId = this.traceId;
    return {
      if (metadata != null) 'metadata': metadata,
      if (rawResponse != null) 'rawResponse': rawResponse,
      if (reasoningContent != null) 'reasoningContent': reasoningContent,
      if (traceId != null) 'traceId': traceId,
    };
  }
}

/// The foundation model output from the pre-processing step.
class PreProcessingModelInvocationOutput {
  /// Contains information about the foundation model output from the
  /// pre-processing step.
  final Metadata? metadata;

  /// Details about the response from the Lambda parsing of the output of the
  /// pre-processing step.
  final PreProcessingParsedResponse? parsedResponse;

  /// Details of the raw response from the foundation model output.
  final RawResponse? rawResponse;

  /// Contains content about the reasoning that the model made during the
  /// pre-processing step.
  final ReasoningContentBlock? reasoningContent;

  /// The unique identifier of the trace.
  final String? traceId;

  PreProcessingModelInvocationOutput({
    this.metadata,
    this.parsedResponse,
    this.rawResponse,
    this.reasoningContent,
    this.traceId,
  });

  factory PreProcessingModelInvocationOutput.fromJson(
      Map<String, dynamic> json) {
    return PreProcessingModelInvocationOutput(
      metadata: json['metadata'] != null
          ? Metadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
      parsedResponse: json['parsedResponse'] != null
          ? PreProcessingParsedResponse.fromJson(
              json['parsedResponse'] as Map<String, dynamic>)
          : null,
      rawResponse: json['rawResponse'] != null
          ? RawResponse.fromJson(json['rawResponse'] as Map<String, dynamic>)
          : null,
      reasoningContent: json['reasoningContent'] != null
          ? ReasoningContentBlock.fromJson(
              json['reasoningContent'] as Map<String, dynamic>)
          : null,
      traceId: json['traceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final parsedResponse = this.parsedResponse;
    final rawResponse = this.rawResponse;
    final reasoningContent = this.reasoningContent;
    final traceId = this.traceId;
    return {
      if (metadata != null) 'metadata': metadata,
      if (parsedResponse != null) 'parsedResponse': parsedResponse,
      if (rawResponse != null) 'rawResponse': rawResponse,
      if (reasoningContent != null) 'reasoningContent': reasoningContent,
      if (traceId != null) 'traceId': traceId,
    };
  }
}

/// Details about the response from the Lambda parsing of the output from the
/// pre-processing step.
class PreProcessingParsedResponse {
  /// Whether the user input is valid or not. If <code>false</code>, the agent
  /// doesn't proceed to orchestration.
  final bool? isValid;

  /// The text returned by the parsing of the pre-processing step, explaining the
  /// steps that the agent plans to take in orchestration, if the user input is
  /// valid.
  final String? rationale;

  PreProcessingParsedResponse({
    this.isValid,
    this.rationale,
  });

  factory PreProcessingParsedResponse.fromJson(Map<String, dynamic> json) {
    return PreProcessingParsedResponse(
      isValid: json['isValid'] as bool?,
      rationale: json['rationale'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isValid = this.isValid;
    final rationale = this.rationale;
    return {
      if (isValid != null) 'isValid': isValid,
      if (rationale != null) 'rationale': rationale,
    };
  }
}

class GuardrailAction {
  static const intervened = GuardrailAction._('INTERVENED');
  static const none = GuardrailAction._('NONE');

  final String value;

  const GuardrailAction._(this.value);

  static const values = [intervened, none];

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

/// Assessment details of the content analyzed by Guardrails.
class GuardrailAssessment {
  /// Content policy details of the Guardrail.
  final GuardrailContentPolicyAssessment? contentPolicy;

  /// Sensitive Information policy details of Guardrail.
  final GuardrailSensitiveInformationPolicyAssessment?
      sensitiveInformationPolicy;

  /// Topic policy details of the Guardrail.
  final GuardrailTopicPolicyAssessment? topicPolicy;

  /// Word policy details of the Guardrail.
  final GuardrailWordPolicyAssessment? wordPolicy;

  GuardrailAssessment({
    this.contentPolicy,
    this.sensitiveInformationPolicy,
    this.topicPolicy,
    this.wordPolicy,
  });

  factory GuardrailAssessment.fromJson(Map<String, dynamic> json) {
    return GuardrailAssessment(
      contentPolicy: json['contentPolicy'] != null
          ? GuardrailContentPolicyAssessment.fromJson(
              json['contentPolicy'] as Map<String, dynamic>)
          : null,
      sensitiveInformationPolicy: json['sensitiveInformationPolicy'] != null
          ? GuardrailSensitiveInformationPolicyAssessment.fromJson(
              json['sensitiveInformationPolicy'] as Map<String, dynamic>)
          : null,
      topicPolicy: json['topicPolicy'] != null
          ? GuardrailTopicPolicyAssessment.fromJson(
              json['topicPolicy'] as Map<String, dynamic>)
          : null,
      wordPolicy: json['wordPolicy'] != null
          ? GuardrailWordPolicyAssessment.fromJson(
              json['wordPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contentPolicy = this.contentPolicy;
    final sensitiveInformationPolicy = this.sensitiveInformationPolicy;
    final topicPolicy = this.topicPolicy;
    final wordPolicy = this.wordPolicy;
    return {
      if (contentPolicy != null) 'contentPolicy': contentPolicy,
      if (sensitiveInformationPolicy != null)
        'sensitiveInformationPolicy': sensitiveInformationPolicy,
      if (topicPolicy != null) 'topicPolicy': topicPolicy,
      if (wordPolicy != null) 'wordPolicy': wordPolicy,
    };
  }
}

/// The details of the policy assessment used in the Guardrail.
class GuardrailTopicPolicyAssessment {
  /// The topic details of the policy assessment used in the Guardrail.
  final List<GuardrailTopic>? topics;

  GuardrailTopicPolicyAssessment({
    this.topics,
  });

  factory GuardrailTopicPolicyAssessment.fromJson(Map<String, dynamic> json) {
    return GuardrailTopicPolicyAssessment(
      topics: (json['topics'] as List?)
          ?.nonNulls
          .map((e) => GuardrailTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final topics = this.topics;
    return {
      if (topics != null) 'topics': topics,
    };
  }
}

/// The details of the policy assessment in the Guardrails filter.
class GuardrailContentPolicyAssessment {
  /// The filter details of the policy assessment used in the Guardrails filter.
  final List<GuardrailContentFilter>? filters;

  GuardrailContentPolicyAssessment({
    this.filters,
  });

  factory GuardrailContentPolicyAssessment.fromJson(Map<String, dynamic> json) {
    return GuardrailContentPolicyAssessment(
      filters: (json['filters'] as List?)
          ?.nonNulls
          .map(
              (e) => GuardrailContentFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    return {
      if (filters != null) 'filters': filters,
    };
  }
}

/// The assessment details for words defined in the Guardrail filter.
class GuardrailWordPolicyAssessment {
  /// The custom word details for words defined in the Guardrail filter.
  final List<GuardrailCustomWord>? customWords;

  /// The managed word lists for words defined in the Guardrail filter.
  final List<GuardrailManagedWord>? managedWordLists;

  GuardrailWordPolicyAssessment({
    this.customWords,
    this.managedWordLists,
  });

  factory GuardrailWordPolicyAssessment.fromJson(Map<String, dynamic> json) {
    return GuardrailWordPolicyAssessment(
      customWords: (json['customWords'] as List?)
          ?.nonNulls
          .map((e) => GuardrailCustomWord.fromJson(e as Map<String, dynamic>))
          .toList(),
      managedWordLists: (json['managedWordLists'] as List?)
          ?.nonNulls
          .map((e) => GuardrailManagedWord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final customWords = this.customWords;
    final managedWordLists = this.managedWordLists;
    return {
      if (customWords != null) 'customWords': customWords,
      if (managedWordLists != null) 'managedWordLists': managedWordLists,
    };
  }
}

/// The details of the sensitive policy assessment used in the Guardrail.
class GuardrailSensitiveInformationPolicyAssessment {
  /// The details of the PII entities used in the sensitive policy assessment for
  /// the Guardrail.
  final List<GuardrailPiiEntityFilter>? piiEntities;

  /// The details of the regexes used in the sensitive policy assessment for the
  /// Guardrail.
  final List<GuardrailRegexFilter>? regexes;

  GuardrailSensitiveInformationPolicyAssessment({
    this.piiEntities,
    this.regexes,
  });

  factory GuardrailSensitiveInformationPolicyAssessment.fromJson(
      Map<String, dynamic> json) {
    return GuardrailSensitiveInformationPolicyAssessment(
      piiEntities: (json['piiEntities'] as List?)
          ?.nonNulls
          .map((e) =>
              GuardrailPiiEntityFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      regexes: (json['regexes'] as List?)
          ?.nonNulls
          .map((e) => GuardrailRegexFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final piiEntities = this.piiEntities;
    final regexes = this.regexes;
    return {
      if (piiEntities != null) 'piiEntities': piiEntities,
      if (regexes != null) 'regexes': regexes,
    };
  }
}

/// The details for the regex filter used in the Guardrail.
class GuardrailRegexFilter {
  /// The action details for the regex filter used in the Guardrail.
  final GuardrailSensitiveInformationPolicyAction? action;

  /// The match details for the regex filter used in the Guardrail.
  final String? match;

  /// The name details for the regex filter used in the Guardrail.
  final String? name;

  /// The regex details for the regex filter used in the Guardrail.
  final String? regex;

  GuardrailRegexFilter({
    this.action,
    this.match,
    this.name,
    this.regex,
  });

  factory GuardrailRegexFilter.fromJson(Map<String, dynamic> json) {
    return GuardrailRegexFilter(
      action: (json['action'] as String?)
          ?.let(GuardrailSensitiveInformationPolicyAction.fromString),
      match: json['match'] as String?,
      name: json['name'] as String?,
      regex: json['regex'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final match = this.match;
    final name = this.name;
    final regex = this.regex;
    return {
      if (action != null) 'action': action.value,
      if (match != null) 'match': match,
      if (name != null) 'name': name,
      if (regex != null) 'regex': regex,
    };
  }
}

class GuardrailSensitiveInformationPolicyAction {
  static const blocked = GuardrailSensitiveInformationPolicyAction._('BLOCKED');
  static const anonymized =
      GuardrailSensitiveInformationPolicyAction._('ANONYMIZED');

  final String value;

  const GuardrailSensitiveInformationPolicyAction._(this.value);

  static const values = [blocked, anonymized];

  static GuardrailSensitiveInformationPolicyAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailSensitiveInformationPolicyAction._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailSensitiveInformationPolicyAction &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Guardrail filter to identify and remove personally identifiable
/// information (PII).
class GuardrailPiiEntityFilter {
  /// The action of the Guardrail filter to identify and remove PII.
  final GuardrailSensitiveInformationPolicyAction? action;

  /// The match to settings in the Guardrail filter to identify and remove PII.
  final String? match;

  /// The type of PII the Guardrail filter has identified and removed.
  final GuardrailPiiEntityType? type;

  GuardrailPiiEntityFilter({
    this.action,
    this.match,
    this.type,
  });

  factory GuardrailPiiEntityFilter.fromJson(Map<String, dynamic> json) {
    return GuardrailPiiEntityFilter(
      action: (json['action'] as String?)
          ?.let(GuardrailSensitiveInformationPolicyAction.fromString),
      match: json['match'] as String?,
      type: (json['type'] as String?)?.let(GuardrailPiiEntityType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final match = this.match;
    final type = this.type;
    return {
      if (action != null) 'action': action.value,
      if (match != null) 'match': match,
      if (type != null) 'type': type.value,
    };
  }
}

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

/// The managed word details for the filter in the Guardrail.
class GuardrailManagedWord {
  /// The action details for the managed word filter in the Guardrail.
  final GuardrailWordPolicyAction? action;

  /// The match details for the managed word filter in the Guardrail.
  final String? match;

  /// The type details for the managed word filter in the Guardrail.
  final GuardrailManagedWordType? type;

  GuardrailManagedWord({
    this.action,
    this.match,
    this.type,
  });

  factory GuardrailManagedWord.fromJson(Map<String, dynamic> json) {
    return GuardrailManagedWord(
      action: (json['action'] as String?)
          ?.let(GuardrailWordPolicyAction.fromString),
      match: json['match'] as String?,
      type: (json['type'] as String?)?.let(GuardrailManagedWordType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final match = this.match;
    final type = this.type;
    return {
      if (action != null) 'action': action.value,
      if (match != null) 'match': match,
      if (type != null) 'type': type.value,
    };
  }
}

class GuardrailManagedWordType {
  static const profanity = GuardrailManagedWordType._('PROFANITY');

  final String value;

  const GuardrailManagedWordType._(this.value);

  static const values = [profanity];

  static GuardrailManagedWordType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailManagedWordType._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailManagedWordType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class GuardrailWordPolicyAction {
  static const blocked = GuardrailWordPolicyAction._('BLOCKED');

  final String value;

  const GuardrailWordPolicyAction._(this.value);

  static const values = [blocked];

  static GuardrailWordPolicyAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailWordPolicyAction._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailWordPolicyAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The custom word details for the filter in the Guardrail.
class GuardrailCustomWord {
  /// The action details for the custom word filter in the Guardrail.
  final GuardrailWordPolicyAction? action;

  /// The match details for the custom word filter in the Guardrail.
  final String? match;

  GuardrailCustomWord({
    this.action,
    this.match,
  });

  factory GuardrailCustomWord.fromJson(Map<String, dynamic> json) {
    return GuardrailCustomWord(
      action: (json['action'] as String?)
          ?.let(GuardrailWordPolicyAction.fromString),
      match: json['match'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final match = this.match;
    return {
      if (action != null) 'action': action.value,
      if (match != null) 'match': match,
    };
  }
}

/// Details of the content filter used in the Guardrail.
class GuardrailContentFilter {
  /// The action placed on the content by the Guardrail filter.
  final GuardrailContentPolicyAction? action;

  /// The confidence level regarding the content detected in the filter by the
  /// Guardrail.
  final GuardrailContentFilterConfidence? confidence;

  /// The type of content detected in the filter by the Guardrail.
  final GuardrailContentFilterType? type;

  GuardrailContentFilter({
    this.action,
    this.confidence,
    this.type,
  });

  factory GuardrailContentFilter.fromJson(Map<String, dynamic> json) {
    return GuardrailContentFilter(
      action: (json['action'] as String?)
          ?.let(GuardrailContentPolicyAction.fromString),
      confidence: (json['confidence'] as String?)
          ?.let(GuardrailContentFilterConfidence.fromString),
      type:
          (json['type'] as String?)?.let(GuardrailContentFilterType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final confidence = this.confidence;
    final type = this.type;
    return {
      if (action != null) 'action': action.value,
      if (confidence != null) 'confidence': confidence.value,
      if (type != null) 'type': type.value,
    };
  }
}

class GuardrailContentFilterType {
  static const insults = GuardrailContentFilterType._('INSULTS');
  static const hate = GuardrailContentFilterType._('HATE');
  static const sexual = GuardrailContentFilterType._('SEXUAL');
  static const violence = GuardrailContentFilterType._('VIOLENCE');
  static const misconduct = GuardrailContentFilterType._('MISCONDUCT');
  static const promptAttack = GuardrailContentFilterType._('PROMPT_ATTACK');

  final String value;

  const GuardrailContentFilterType._(this.value);

  static const values = [
    insults,
    hate,
    sexual,
    violence,
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

class GuardrailContentFilterConfidence {
  static const none = GuardrailContentFilterConfidence._('NONE');
  static const low = GuardrailContentFilterConfidence._('LOW');
  static const medium = GuardrailContentFilterConfidence._('MEDIUM');
  static const high = GuardrailContentFilterConfidence._('HIGH');

  final String value;

  const GuardrailContentFilterConfidence._(this.value);

  static const values = [none, low, medium, high];

  static GuardrailContentFilterConfidence fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailContentFilterConfidence._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailContentFilterConfidence && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class GuardrailContentPolicyAction {
  static const blocked = GuardrailContentPolicyAction._('BLOCKED');

  final String value;

  const GuardrailContentPolicyAction._(this.value);

  static const values = [blocked];

  static GuardrailContentPolicyAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailContentPolicyAction._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailContentPolicyAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details for a specific topic defined in the Guardrail.
class GuardrailTopic {
  /// The action details on a specific topic in the Guardrail.
  final GuardrailTopicPolicyAction? action;

  /// The name details on a specific topic in the Guardrail.
  final String? name;

  /// The type details on a specific topic in the Guardrail.
  final GuardrailTopicType? type;

  GuardrailTopic({
    this.action,
    this.name,
    this.type,
  });

  factory GuardrailTopic.fromJson(Map<String, dynamic> json) {
    return GuardrailTopic(
      action: (json['action'] as String?)
          ?.let(GuardrailTopicPolicyAction.fromString),
      name: json['name'] as String?,
      type: (json['type'] as String?)?.let(GuardrailTopicType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final name = this.name;
    final type = this.type;
    return {
      if (action != null) 'action': action.value,
      if (name != null) 'name': name,
      if (type != null) 'type': type.value,
    };
  }
}

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

class GuardrailTopicPolicyAction {
  static const blocked = GuardrailTopicPolicyAction._('BLOCKED');

  final String value;

  const GuardrailTopicPolicyAction._(this.value);

  static const values = [blocked];

  static GuardrailTopicPolicyAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailTopicPolicyAction._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailTopicPolicyAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains citations for a part of an agent response.
class Attribution {
  /// A list of citations and related information for a part of an agent response.
  final List<Citation>? citations;

  Attribution({
    this.citations,
  });

  factory Attribution.fromJson(Map<String, dynamic> json) {
    return Attribution(
      citations: (json['citations'] as List?)
          ?.nonNulls
          .map((e) => Citation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final citations = this.citations;
    return {
      if (citations != null) 'citations': citations,
    };
  }
}

/// The configuration details for the guardrail.
class GuardrailConfigurationWithArn {
  /// The unique identifier for the guardrail.
  final String guardrailIdentifier;

  /// The version of the guardrail.
  final String guardrailVersion;

  GuardrailConfigurationWithArn({
    required this.guardrailIdentifier,
    required this.guardrailVersion,
  });

  Map<String, dynamic> toJson() {
    final guardrailIdentifier = this.guardrailIdentifier;
    final guardrailVersion = this.guardrailVersion;
    return {
      'guardrailIdentifier': guardrailIdentifier,
      'guardrailVersion': guardrailVersion,
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

  Map<String, dynamic> toJson() {
    final promptConfigurations = this.promptConfigurations;
    final overrideLambda = this.overrideLambda;
    return {
      'promptConfigurations': promptConfigurations,
      if (overrideLambda != null) 'overrideLambda': overrideLambda,
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

/// Configurations for streaming.
class StreamingConfigurations {
  /// The guardrail interval to apply as response is generated. By default, the
  /// guardrail interval is set to 50 characters. If a larger interval is
  /// specified, the response will be generated in larger chunks with fewer
  /// <code>ApplyGuardrail</code> calls. The following examples show the response
  /// generated for <i>Hello, I am an agent</i> input string.
  ///
  /// <b>Example response in chunks: Interval set to 3 characters</b>
  ///
  /// <code>'Hel', 'lo, ','I am', ' an', ' Age', 'nt'</code>
  ///
  /// Each chunk has at least 3 characters except for the last chunk
  ///
  /// <b>Example response in chunks: Interval set to 20 or more characters</b>
  ///
  /// <code>Hello, I am an Agent</code>
  final int? applyGuardrailInterval;

  /// Specifies whether to enable streaming for the final response. This is set to
  /// <code>false</code> by default.
  final bool? streamFinalResponse;

  StreamingConfigurations({
    this.applyGuardrailInterval,
    this.streamFinalResponse,
  });

  Map<String, dynamic> toJson() {
    final applyGuardrailInterval = this.applyGuardrailInterval;
    final streamFinalResponse = this.streamFinalResponse;
    return {
      if (applyGuardrailInterval != null)
        'applyGuardrailInterval': applyGuardrailInterval,
      if (streamFinalResponse != null)
        'streamFinalResponse': streamFinalResponse,
    };
  }
}

/// Specifies parameters that control how the service populates the agent prompt
/// for an <code>InvokeAgent</code> or <code>InvokeInlineAgent</code> request.
/// You can control which aspects of previous invocations in the same agent
/// session the service uses to populate the agent prompt. This gives you more
/// granular control over the contextual history that is used to process the
/// current request.
class PromptCreationConfigurations {
  /// If <code>true</code>, the service removes any content between
  /// <code>&lt;thinking&gt;</code> tags from previous conversations in an agent
  /// session. The service will only remove content from already processed turns.
  /// This helps you remove content which might not be useful for current and
  /// subsequent invocations. This can reduce the input token count and
  /// potentially save costs. The default value is <code>false</code>.
  final bool? excludePreviousThinkingSteps;

  /// The number of previous conversations from the ongoing agent session to
  /// include in the conversation history of the agent prompt, during the current
  /// invocation. This gives you more granular control over the context that the
  /// model is made aware of, and helps the model remove older context which is no
  /// longer useful during the ongoing agent session.
  final int? previousConversationTurnsToInclude;

  PromptCreationConfigurations({
    this.excludePreviousThinkingSteps,
    this.previousConversationTurnsToInclude,
  });

  Map<String, dynamic> toJson() {
    final excludePreviousThinkingSteps = this.excludePreviousThinkingSteps;
    final previousConversationTurnsToInclude =
        this.previousConversationTurnsToInclude;
    return {
      if (excludePreviousThinkingSteps != null)
        'excludePreviousThinkingSteps': excludePreviousThinkingSteps,
      if (previousConversationTurnsToInclude != null)
        'previousConversationTurnsToInclude':
            previousConversationTurnsToInclude,
    };
  }
}

/// Contains parameters that specify various attributes that persist across a
/// session or prompt. You can define session state attributes as key-value
/// pairs when writing a <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-lambda.html">Lambda
/// function</a> for an action group or pass them when making an
/// <code>InvokeInlineAgent</code> request. Use session state attributes to
/// control and provide conversational context for your inline agent and to help
/// customize your agent's behavior. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-session-state.html">Control
/// session context</a>
class InlineSessionState {
  /// Contains the conversation history that persist across sessions.
  final ConversationHistory? conversationHistory;

  /// Contains information about the files used by code interpreter.
  final List<InputFile>? files;

  /// The identifier of the invocation of an action. This value must match the
  /// <code>invocationId</code> returned in the <code>InvokeInlineAgent</code>
  /// response for the action whose results are provided in the
  /// <code>returnControlInvocationResults</code> field. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-returncontrol.html">Return
  /// control to the agent developer</a>.
  final String? invocationId;

  /// Contains attributes that persist across a session and the values of those
  /// attributes.
  final Map<String, String>? promptSessionAttributes;

  /// Contains information about the results from the action group invocation. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-returncontrol.html">Return
  /// control to the agent developer</a>.
  /// <note>
  /// If you include this field in the <code>sessionState</code> field, the
  /// <code>inputText</code> field will be ignored.
  /// </note>
  final List<InvocationResultMember>? returnControlInvocationResults;

  /// Contains attributes that persist across a session and the values of those
  /// attributes.
  final Map<String, String>? sessionAttributes;

  InlineSessionState({
    this.conversationHistory,
    this.files,
    this.invocationId,
    this.promptSessionAttributes,
    this.returnControlInvocationResults,
    this.sessionAttributes,
  });

  Map<String, dynamic> toJson() {
    final conversationHistory = this.conversationHistory;
    final files = this.files;
    final invocationId = this.invocationId;
    final promptSessionAttributes = this.promptSessionAttributes;
    final returnControlInvocationResults = this.returnControlInvocationResults;
    final sessionAttributes = this.sessionAttributes;
    return {
      if (conversationHistory != null)
        'conversationHistory': conversationHistory,
      if (files != null) 'files': files,
      if (invocationId != null) 'invocationId': invocationId,
      if (promptSessionAttributes != null)
        'promptSessionAttributes': promptSessionAttributes,
      if (returnControlInvocationResults != null)
        'returnControlInvocationResults': returnControlInvocationResults,
      if (sessionAttributes != null) 'sessionAttributes': sessionAttributes,
    };
  }
}

/// Settings for a model called with <a>InvokeInlineAgent</a>.
class InlineBedrockModelConfigurations {
  /// The latency configuration for the model.
  final PerformanceConfiguration? performanceConfig;

  InlineBedrockModelConfigurations({
    this.performanceConfig,
  });

  Map<String, dynamic> toJson() {
    final performanceConfig = this.performanceConfig;
    return {
      if (performanceConfig != null) 'performanceConfig': performanceConfig,
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

/// Contains details of the custom orchestration configured for the agent.
class CustomOrchestration {
  /// The structure of the executor invoking the actions in custom orchestration.
  final OrchestrationExecutor? executor;

  CustomOrchestration({
    this.executor,
  });

  Map<String, dynamic> toJson() {
    final executor = this.executor;
    return {
      if (executor != null) 'executor': executor,
    };
  }
}

/// The structure of the executor invoking the actions in custom orchestration.
class OrchestrationExecutor {
  /// The Amazon Resource Name (ARN) of the Lambda function containing the
  /// business logic that is carried out upon invoking the action.
  final String? lambda;

  OrchestrationExecutor({
    this.lambda,
  });

  Map<String, dynamic> toJson() {
    final lambda = this.lambda;
    return {
      if (lambda != null) 'lambda': lambda,
    };
  }
}

/// List of inline collaborators.
class Collaborator {
  /// The foundation model used by the inline collaborator agent.
  final String foundationModel;

  /// Instruction that tell the inline collaborator agent what it should do and
  /// how it should interact with users.
  final String instruction;

  /// List of action groups with each action group defining tasks the inline
  /// collaborator agent needs to carry out.
  final List<AgentActionGroup>? actionGroups;

  /// Defines how the inline supervisor agent handles information across multiple
  /// collaborator agents to coordinate a final response.
  final AgentCollaboration? agentCollaboration;

  /// Name of the inline collaborator agent which must be the same name as
  /// specified for <code>collaboratorName</code>.
  final String? agentName;

  /// Settings of the collaborator agent.
  final List<CollaboratorConfiguration>? collaboratorConfigurations;

  /// The Amazon Resource Name (ARN) of the AWS KMS key that encrypts the inline
  /// collaborator.
  final String? customerEncryptionKeyArn;

  /// Details of the guardwrail associated with the inline collaborator.
  final GuardrailConfigurationWithArn? guardrailConfiguration;

  /// The number of seconds for which the Amazon Bedrock keeps information about
  /// the user's conversation with the inline collaborator agent.
  ///
  /// A user interaction remains active for the amount of time specified. If no
  /// conversation occurs during this time, the session expires and Amazon Bedrock
  /// deletes any data provided before the timeout.
  final int? idleSessionTTLInSeconds;

  /// Knowledge base associated with the inline collaborator agent.
  final List<KnowledgeBase>? knowledgeBases;

  /// Contains configurations to override prompt templates in different parts of
  /// an inline collaborator sequence. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/advanced-prompts.html">Advanced
  /// prompts</a>.
  final PromptOverrideConfiguration? promptOverrideConfiguration;

  Collaborator({
    required this.foundationModel,
    required this.instruction,
    this.actionGroups,
    this.agentCollaboration,
    this.agentName,
    this.collaboratorConfigurations,
    this.customerEncryptionKeyArn,
    this.guardrailConfiguration,
    this.idleSessionTTLInSeconds,
    this.knowledgeBases,
    this.promptOverrideConfiguration,
  });

  Map<String, dynamic> toJson() {
    final foundationModel = this.foundationModel;
    final instruction = this.instruction;
    final actionGroups = this.actionGroups;
    final agentCollaboration = this.agentCollaboration;
    final agentName = this.agentName;
    final collaboratorConfigurations = this.collaboratorConfigurations;
    final customerEncryptionKeyArn = this.customerEncryptionKeyArn;
    final guardrailConfiguration = this.guardrailConfiguration;
    final idleSessionTTLInSeconds = this.idleSessionTTLInSeconds;
    final knowledgeBases = this.knowledgeBases;
    final promptOverrideConfiguration = this.promptOverrideConfiguration;
    return {
      'foundationModel': foundationModel,
      'instruction': instruction,
      if (actionGroups != null) 'actionGroups': actionGroups,
      if (agentCollaboration != null)
        'agentCollaboration': agentCollaboration.value,
      if (agentName != null) 'agentName': agentName,
      if (collaboratorConfigurations != null)
        'collaboratorConfigurations': collaboratorConfigurations,
      if (customerEncryptionKeyArn != null)
        'customerEncryptionKeyArn': customerEncryptionKeyArn,
      if (guardrailConfiguration != null)
        'guardrailConfiguration': guardrailConfiguration,
      if (idleSessionTTLInSeconds != null)
        'idleSessionTTLInSeconds': idleSessionTTLInSeconds,
      if (knowledgeBases != null) 'knowledgeBases': knowledgeBases,
      if (promptOverrideConfiguration != null)
        'promptOverrideConfiguration': promptOverrideConfiguration,
    };
  }
}

/// A conversation history.
class ConversationHistory {
  /// The conversation's messages.
  final List<Message>? messages;

  ConversationHistory({
    this.messages,
  });

  Map<String, dynamic> toJson() {
    final messages = this.messages;
    return {
      if (messages != null) 'messages': messages,
    };
  }
}

/// Details about a message.
class Message {
  /// The message's content.
  final List<ContentBlock> content;

  /// The message's role.
  final ConversationRole role;

  Message({
    required this.content,
    required this.role,
  });

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

/// A content block.
class ContentBlock {
  /// The block's text.
  final String? text;

  ContentBlock({
    this.text,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      if (text != null) 'text': text,
    };
  }
}

/// Contains details of the source files.
class InputFile {
  /// The name of the source file.
  final String name;

  /// Specifies where the files are located.
  final FileSource source;

  /// Specifies how the source files will be used by the code interpreter.
  final FileUseCase useCase;

  InputFile({
    required this.name,
    required this.source,
    required this.useCase,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final source = this.source;
    final useCase = this.useCase;
    return {
      'name': name,
      'source': source,
      'useCase': useCase.value,
    };
  }
}

/// The source file of the content contained in the wrapper object.
class FileSource {
  /// The source type of the files to attach.
  final FileSourceType sourceType;

  /// The data and the text of the attached files.
  final ByteContentFile? byteContent;

  /// The s3 location of the files to attach.
  final S3ObjectFile? s3Location;

  FileSource({
    required this.sourceType,
    this.byteContent,
    this.s3Location,
  });

  Map<String, dynamic> toJson() {
    final sourceType = this.sourceType;
    final byteContent = this.byteContent;
    final s3Location = this.s3Location;
    return {
      'sourceType': sourceType.value,
      if (byteContent != null) 'byteContent': byteContent,
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

class FileUseCase {
  static const codeInterpreter = FileUseCase._('CODE_INTERPRETER');
  static const chat = FileUseCase._('CHAT');

  final String value;

  const FileUseCase._(this.value);

  static const values = [codeInterpreter, chat];

  static FileUseCase fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FileUseCase._(value));

  @override
  bool operator ==(other) => other is FileUseCase && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class FileSourceType {
  static const s3 = FileSourceType._('S3');
  static const byteContent = FileSourceType._('BYTE_CONTENT');

  final String value;

  const FileSourceType._(this.value);

  static const values = [s3, byteContent];

  static FileSourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FileSourceType._(value));

  @override
  bool operator ==(other) => other is FileSourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details of the s3 object where the source file is located.
class S3ObjectFile {
  /// The uri of the s3 object.
  final String uri;

  S3ObjectFile({
    required this.uri,
  });

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    return {
      'uri': uri,
    };
  }
}

/// The property contains the file to chat with, along with its attributes.
class ByteContentFile {
  /// The raw bytes of the file to attach. The maximum size of all files that is
  /// attached is 10MB. You can attach a maximum of 5 files.
  final Uint8List data;

  /// The MIME type of data contained in the file used for chat.
  final String mediaType;

  ByteContentFile({
    required this.data,
    required this.mediaType,
  });

  Map<String, dynamic> toJson() {
    final data = this.data;
    final mediaType = this.mediaType;
    return {
      'data': base64Encode(data),
      'mediaType': mediaType,
    };
  }
}

/// Settings of an inline collaborator agent.
class CollaboratorConfiguration {
  /// Instructions that tell the inline collaborator agent what it should do and
  /// how it should interact with users.
  final String collaboratorInstruction;

  /// Name of the inline collaborator agent which must be the same name as
  /// specified for <code>agentName</code>.
  final String collaboratorName;

  /// The Amazon Resource Name (ARN) of the inline collaborator agent.
  final String? agentAliasArn;

  /// A relay conversation history for the inline collaborator agent.
  final RelayConversationHistory? relayConversationHistory;

  CollaboratorConfiguration({
    required this.collaboratorInstruction,
    required this.collaboratorName,
    this.agentAliasArn,
    this.relayConversationHistory,
  });

  Map<String, dynamic> toJson() {
    final collaboratorInstruction = this.collaboratorInstruction;
    final collaboratorName = this.collaboratorName;
    final agentAliasArn = this.agentAliasArn;
    final relayConversationHistory = this.relayConversationHistory;
    return {
      'collaboratorInstruction': collaboratorInstruction,
      'collaboratorName': collaboratorName,
      if (agentAliasArn != null) 'agentAliasArn': agentAliasArn,
      if (relayConversationHistory != null)
        'relayConversationHistory': relayConversationHistory.value,
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

  /// The foundation model to use.
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

  /// Specifies whether to allow the inline agent to carry out the step specified
  /// in the <code>promptType</code>. If you set this value to
  /// <code>DISABLED</code>, the agent skips that step. The default state for each
  /// <code>promptType</code> is as follows.
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
    this.additionalModelRequestFields,
    this.basePromptTemplate,
    this.foundationModel,
    this.inferenceConfiguration,
    this.parserMode,
    this.promptCreationMode,
    this.promptState,
    this.promptType,
  });

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

/// Details of the knowledge base associated withe inline agent.
class KnowledgeBase {
  /// The description of the knowledge base associated with the inline agent.
  final String description;

  /// The unique identifier for a knowledge base associated with the inline agent.
  final String knowledgeBaseId;

  /// The configurations to apply to the knowledge base during query. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-test-config.html">Query
  /// configurations</a>.
  final KnowledgeBaseRetrievalConfiguration? retrievalConfiguration;

  KnowledgeBase({
    required this.description,
    required this.knowledgeBaseId,
    this.retrievalConfiguration,
  });

  Map<String, dynamic> toJson() {
    final description = this.description;
    final knowledgeBaseId = this.knowledgeBaseId;
    final retrievalConfiguration = this.retrievalConfiguration;
    return {
      'description': description,
      'knowledgeBaseId': knowledgeBaseId,
      if (retrievalConfiguration != null)
        'retrievalConfiguration': retrievalConfiguration,
    };
  }
}

/// Contains details of the inline agent's action group.
class AgentActionGroup {
  /// The name of the action group.
  final String actionGroupName;

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

  /// A description of the action group.
  final String? description;

  /// Contains details about the function schema for the action group or the JSON
  /// or YAML-formatted payload defining the schema.
  final FunctionSchema? functionSchema;

  /// Specify a built-in or computer use action for this action group. If you
  /// specify a value, you must leave the <code>description</code>,
  /// <code>apiSchema</code>, and <code>actionGroupExecutor</code> fields empty
  /// for this action group.
  ///
  /// <ul>
  /// <li>
  /// To allow your agent to request the user for additional information when
  /// trying to complete a task, set this field to <code>AMAZON.UserInput</code>.
  /// </li>
  /// <li>
  /// To allow your agent to generate, run, and troubleshoot code when trying to
  /// complete a task, set this field to <code>AMAZON.CodeInterpreter</code>.
  /// </li>
  /// <li>
  /// To allow your agent to use an Anthropic computer use tool, specify one of
  /// the following values.
  /// <important>
  /// Computer use is a new Anthropic Claude model capability (in beta) available
  /// with Anthropic Claude 3.7 Sonnet and Claude 3.5 Sonnet v2 only. When
  /// operating computer use functionality, we recommend taking additional
  /// security precautions, such as executing computer actions in virtual
  /// environments with restricted data access and limited internet connectivity.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agent-computer-use.html">Configure
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
  /// <code>ANTHROPIC.Bash</code> - Gives the agent permission to run commands in
  /// a bash shell.
  /// </li>
  /// </ul> </li>
  /// </ul>
  final ActionGroupSignature? parentActionGroupSignature;

  /// The configuration settings for a computer use action.
  /// <important>
  /// Computer use is a new Anthropic Claude model capability (in beta) available
  /// with Claude 3.7 Sonnet and Claude 3.5 Sonnet v2 only. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agent-computer-use.html">Configure
  /// an Amazon Bedrock Agent to complete tasks with computer use tools</a>.
  /// </important>
  final Map<String, String>? parentActionGroupSignatureParams;

  AgentActionGroup({
    required this.actionGroupName,
    this.actionGroupExecutor,
    this.apiSchema,
    this.description,
    this.functionSchema,
    this.parentActionGroupSignature,
    this.parentActionGroupSignatureParams,
  });

  Map<String, dynamic> toJson() {
    final actionGroupName = this.actionGroupName;
    final actionGroupExecutor = this.actionGroupExecutor;
    final apiSchema = this.apiSchema;
    final description = this.description;
    final functionSchema = this.functionSchema;
    final parentActionGroupSignature = this.parentActionGroupSignature;
    final parentActionGroupSignatureParams =
        this.parentActionGroupSignatureParams;
    return {
      'actionGroupName': actionGroupName,
      if (actionGroupExecutor != null)
        'actionGroupExecutor': actionGroupExecutor,
      if (apiSchema != null) 'apiSchema': apiSchema,
      if (description != null) 'description': description,
      if (functionSchema != null) 'functionSchema': functionSchema,
      if (parentActionGroupSignature != null)
        'parentActionGroupSignature': parentActionGroupSignature.value,
      if (parentActionGroupSignatureParams != null)
        'parentActionGroupSignatureParams': parentActionGroupSignatureParams,
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
  /// <code>InvokeInlineAgent</code> response, specify
  /// <code>RETURN_CONTROL</code>.
  final CustomControlMethod? customControl;

  /// The Amazon Resource Name (ARN) of the Lambda function containing the
  /// business logic that is carried out upon invoking the action.
  final String? lambda;

  ActionGroupExecutor({
    this.customControl,
    this.lambda,
  });

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
/// payload field or you can upload it to an S3 bucket and specify the S3 bucket
/// location in the s3 field.
class APISchema {
  /// The JSON or YAML-formatted payload defining the OpenAPI schema for the
  /// action group.
  final String? payload;

  /// Contains details about the S3 object containing the OpenAPI schema for the
  /// action group.
  final S3Identifier? s3;

  APISchema({
    this.payload,
    this.s3,
  });

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final s3 = this.s3;
    return {
      if (payload != null) 'payload': payload,
      if (s3 != null) 's3': s3,
    };
  }
}

/// Contains details about the function schema for the action group or the JSON
/// or YAML-formatted payload defining the schema.
class FunctionSchema {
  /// A list of functions that each define an action in the action group.
  final List<FunctionDefinition>? functions;

  FunctionSchema({
    this.functions,
  });

  Map<String, dynamic> toJson() {
    final functions = this.functions;
    return {
      if (functions != null) 'functions': functions,
    };
  }
}

/// Defines parameters that the agent needs to invoke from the user to complete
/// the function. Corresponds to an action in an action group.
class FunctionDefinition {
  /// A name for the function.
  final String name;

  /// A description of the function and its purpose.
  final String? description;

  /// The parameters that the agent elicits from the user to fulfill the function.
  final Map<String, ParameterDetail>? parameters;

  /// Contains information if user confirmation is required to invoke the
  /// function.
  final RequireConfirmation? requireConfirmation;

  FunctionDefinition({
    required this.name,
    this.description,
    this.parameters,
    this.requireConfirmation,
  });

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
class ParameterDetail {
  /// The data type of the parameter.
  final ParameterType type;

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

class ParameterType {
  static const string = ParameterType._('string');
  static const number = ParameterType._('number');
  static const integer = ParameterType._('integer');
  static const boolean = ParameterType._('boolean');
  static const array = ParameterType._('array');

  final String value;

  const ParameterType._(this.value);

  static const values = [string, number, integer, boolean, array];

  static ParameterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ParameterType._(value));

  @override
  bool operator ==(other) => other is ParameterType && other.value == value;

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

/// The response from invoking the agent and associated citations and trace
/// information.
class ResponseStream {
  /// The request is denied because of missing access permissions. Check your
  /// permissions and retry your request.
  final AccessDeniedException? accessDeniedException;

  /// There was an issue with a dependency due to a server issue. Retry your
  /// request.
  final BadGatewayException? badGatewayException;

  /// Contains a part of an agent response and citations for it.
  final PayloadPart? chunk;

  /// There was a conflict performing an operation. Resolve the conflict and retry
  /// your request.
  final ConflictException? conflictException;

  /// There was an issue with a dependency. Check the resource configurations and
  /// retry the request.
  final DependencyFailedException? dependencyFailedException;

  /// Contains intermediate response for code interpreter if any files have been
  /// generated.
  final FilePart? files;

  /// An internal server error occurred. Retry your request.
  final InternalServerException? internalServerException;

  /// The model specified in the request is not ready to serve Inference requests.
  /// The AWS SDK will automatically retry the operation up to 5 times. For
  /// information about configuring automatic retries, see <a
  /// href="https://docs.aws.amazon.com/sdkref/latest/guide/feature-retry-behavior.html">Retry
  /// behavior</a> in the <i>AWS SDKs and Tools</i> reference guide.
  final ModelNotReadyException? modelNotReadyException;

  /// The specified resource Amazon Resource Name (ARN) was not found. Check the
  /// Amazon Resource Name (ARN) and try your request again.
  final ResourceNotFoundException? resourceNotFoundException;

  /// Contains the parameters and information that the agent elicited from the
  /// customer to carry out an action. This information is returned to the system
  /// and can be used in your own setup for fulfilling the action.
  final ReturnControlPayload? returnControl;

  /// The number of requests exceeds the service quota. Resubmit your request
  /// later.
  final ServiceQuotaExceededException? serviceQuotaExceededException;

  /// The number of requests exceeds the limit. Resubmit your request later.
  final ThrottlingException? throttlingException;

  /// Contains information about the agent and session, alongside the agent's
  /// reasoning process and results from calling actions and querying knowledge
  /// bases and metadata about the trace. You can use the trace to understand how
  /// the agent arrived at the response it provided the customer. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/trace-events.html">Trace
  /// events</a>.
  final TracePart? trace;

  /// Input validation failed. Check your request parameters and retry the
  /// request.
  final ValidationException? validationException;

  ResponseStream({
    this.accessDeniedException,
    this.badGatewayException,
    this.chunk,
    this.conflictException,
    this.dependencyFailedException,
    this.files,
    this.internalServerException,
    this.modelNotReadyException,
    this.resourceNotFoundException,
    this.returnControl,
    this.serviceQuotaExceededException,
    this.throttlingException,
    this.trace,
    this.validationException,
  });

  factory ResponseStream.fromJson(Map<String, dynamic> json) {
    return ResponseStream(
      accessDeniedException: json['accessDeniedException'] != null
          ? AccessDeniedException.fromJson(
              json['accessDeniedException'] as Map<String, dynamic>)
          : null,
      badGatewayException: json['badGatewayException'] != null
          ? BadGatewayException.fromJson(
              json['badGatewayException'] as Map<String, dynamic>)
          : null,
      chunk: json['chunk'] != null
          ? PayloadPart.fromJson(json['chunk'] as Map<String, dynamic>)
          : null,
      conflictException: json['conflictException'] != null
          ? ConflictException.fromJson(
              json['conflictException'] as Map<String, dynamic>)
          : null,
      dependencyFailedException: json['dependencyFailedException'] != null
          ? DependencyFailedException.fromJson(
              json['dependencyFailedException'] as Map<String, dynamic>)
          : null,
      files: json['files'] != null
          ? FilePart.fromJson(json['files'] as Map<String, dynamic>)
          : null,
      internalServerException: json['internalServerException'] != null
          ? InternalServerException.fromJson(
              json['internalServerException'] as Map<String, dynamic>)
          : null,
      modelNotReadyException: json['modelNotReadyException'] != null
          ? ModelNotReadyException.fromJson(
              json['modelNotReadyException'] as Map<String, dynamic>)
          : null,
      resourceNotFoundException: json['resourceNotFoundException'] != null
          ? ResourceNotFoundException.fromJson(
              json['resourceNotFoundException'] as Map<String, dynamic>)
          : null,
      returnControl: json['returnControl'] != null
          ? ReturnControlPayload.fromJson(
              json['returnControl'] as Map<String, dynamic>)
          : null,
      serviceQuotaExceededException:
          json['serviceQuotaExceededException'] != null
              ? ServiceQuotaExceededException.fromJson(
                  json['serviceQuotaExceededException'] as Map<String, dynamic>)
              : null,
      throttlingException: json['throttlingException'] != null
          ? ThrottlingException.fromJson(
              json['throttlingException'] as Map<String, dynamic>)
          : null,
      trace: json['trace'] != null
          ? TracePart.fromJson(json['trace'] as Map<String, dynamic>)
          : null,
      validationException: json['validationException'] != null
          ? ValidationException.fromJson(
              json['validationException'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessDeniedException = this.accessDeniedException;
    final badGatewayException = this.badGatewayException;
    final chunk = this.chunk;
    final conflictException = this.conflictException;
    final dependencyFailedException = this.dependencyFailedException;
    final files = this.files;
    final internalServerException = this.internalServerException;
    final modelNotReadyException = this.modelNotReadyException;
    final resourceNotFoundException = this.resourceNotFoundException;
    final returnControl = this.returnControl;
    final serviceQuotaExceededException = this.serviceQuotaExceededException;
    final throttlingException = this.throttlingException;
    final trace = this.trace;
    final validationException = this.validationException;
    return {
      if (accessDeniedException != null)
        'accessDeniedException': accessDeniedException,
      if (badGatewayException != null)
        'badGatewayException': badGatewayException,
      if (chunk != null) 'chunk': chunk,
      if (conflictException != null) 'conflictException': conflictException,
      if (dependencyFailedException != null)
        'dependencyFailedException': dependencyFailedException,
      if (files != null) 'files': files,
      if (internalServerException != null)
        'internalServerException': internalServerException,
      if (modelNotReadyException != null)
        'modelNotReadyException': modelNotReadyException,
      if (resourceNotFoundException != null)
        'resourceNotFoundException': resourceNotFoundException,
      if (returnControl != null) 'returnControl': returnControl,
      if (serviceQuotaExceededException != null)
        'serviceQuotaExceededException': serviceQuotaExceededException,
      if (throttlingException != null)
        'throttlingException': throttlingException,
      if (trace != null) 'trace': trace,
      if (validationException != null)
        'validationException': validationException,
    };
  }
}

/// Contains a part of an agent response and citations for it.
class PayloadPart {
  /// Contains citations for a part of an agent response.
  final Attribution? attribution;

  /// A part of the agent response in bytes.
  final Uint8List? bytes;

  PayloadPart({
    this.attribution,
    this.bytes,
  });

  factory PayloadPart.fromJson(Map<String, dynamic> json) {
    return PayloadPart(
      attribution: json['attribution'] != null
          ? Attribution.fromJson(json['attribution'] as Map<String, dynamic>)
          : null,
      bytes: _s.decodeNullableUint8List(json['bytes'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final attribution = this.attribution;
    final bytes = this.bytes;
    return {
      if (attribution != null) 'attribution': attribution,
      if (bytes != null) 'bytes': base64Encode(bytes),
    };
  }
}

/// Contains information about the agent and session, alongside the agent's
/// reasoning process and results from calling API actions and querying
/// knowledge bases and metadata about the trace. You can use the trace to
/// understand how the agent arrived at the response it provided the customer.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-test.html#trace-enablement">Trace
/// enablement</a>.
class TracePart {
  /// The unique identifier of the alias of the agent.
  final String? agentAliasId;

  /// The unique identifier of the agent.
  final String? agentId;

  /// The version of the agent.
  final String? agentVersion;

  /// The part's caller chain.
  final List<Caller>? callerChain;

  /// The part's collaborator name.
  final String? collaboratorName;

  /// The time of the trace.
  final DateTime? eventTime;

  /// The unique identifier of the session with the agent.
  final String? sessionId;

  /// Contains one part of the agent's reasoning process and results from calling
  /// API actions and querying knowledge bases. You can use the trace to
  /// understand how the agent arrived at the response it provided the customer.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-test.html#trace-enablement">Trace
  /// enablement</a>.
  final Trace? trace;

  TracePart({
    this.agentAliasId,
    this.agentId,
    this.agentVersion,
    this.callerChain,
    this.collaboratorName,
    this.eventTime,
    this.sessionId,
    this.trace,
  });

  factory TracePart.fromJson(Map<String, dynamic> json) {
    return TracePart(
      agentAliasId: json['agentAliasId'] as String?,
      agentId: json['agentId'] as String?,
      agentVersion: json['agentVersion'] as String?,
      callerChain: (json['callerChain'] as List?)
          ?.nonNulls
          .map((e) => Caller.fromJson(e as Map<String, dynamic>))
          .toList(),
      collaboratorName: json['collaboratorName'] as String?,
      eventTime: timeStampFromJson(json['eventTime']),
      sessionId: json['sessionId'] as String?,
      trace: json['trace'] != null
          ? Trace.fromJson(json['trace'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agentAliasId = this.agentAliasId;
    final agentId = this.agentId;
    final agentVersion = this.agentVersion;
    final callerChain = this.callerChain;
    final collaboratorName = this.collaboratorName;
    final eventTime = this.eventTime;
    final sessionId = this.sessionId;
    final trace = this.trace;
    return {
      if (agentAliasId != null) 'agentAliasId': agentAliasId,
      if (agentId != null) 'agentId': agentId,
      if (agentVersion != null) 'agentVersion': agentVersion,
      if (callerChain != null) 'callerChain': callerChain,
      if (collaboratorName != null) 'collaboratorName': collaboratorName,
      if (eventTime != null) 'eventTime': iso8601ToJson(eventTime),
      if (sessionId != null) 'sessionId': sessionId,
      if (trace != null) 'trace': trace,
    };
  }
}

/// Contains intermediate response for code interpreter if any files have been
/// generated.
class FilePart {
  /// Files containing intermediate response for the user.
  final List<OutputFile>? files;

  FilePart({
    this.files,
  });

  factory FilePart.fromJson(Map<String, dynamic> json) {
    return FilePart(
      files: (json['files'] as List?)
          ?.nonNulls
          .map((e) => OutputFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final files = this.files;
    return {
      if (files != null) 'files': files,
    };
  }
}

/// Contains parameters that specify various attributes that persist across a
/// session or prompt. You can define session state attributes as key-value
/// pairs when writing a <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-lambda.html">Lambda
/// function</a> for an action group or pass them when making an <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_InvokeAgent.html">InvokeAgent</a>
/// request. Use session state attributes to control and provide conversational
/// context for your agent and to help customize your agent's behavior. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-session-state.html">Control
/// session context</a>.
class SessionState {
  /// The state's conversation history.
  final ConversationHistory? conversationHistory;

  /// Contains information about the files used by code interpreter.
  final List<InputFile>? files;

  /// The identifier of the invocation of an action. This value must match the
  /// <code>invocationId</code> returned in the <code>InvokeAgent</code> response
  /// for the action whose results are provided in the
  /// <code>returnControlInvocationResults</code> field. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-returncontrol.html">Return
  /// control to the agent developer</a> and <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-session-state.html">Control
  /// session context</a>.
  final String? invocationId;

  /// An array of configurations, each of which applies to a knowledge base
  /// attached to the agent.
  final List<KnowledgeBaseConfiguration>? knowledgeBaseConfigurations;

  /// Contains attributes that persist across a prompt and the values of those
  /// attributes.
  ///
  /// <ul>
  /// <li>
  /// In orchestration prompt template, these attributes replace the
  /// $prompt_session_attributes$ placeholder variable. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-placeholders.html">Prompt
  /// template placeholder variables</a>.
  /// </li>
  /// <li>
  /// In <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-multi-agent-collaboration.html">multi-agent
  /// collaboration</a>, the <code>promptSessionAttributes</code> will only be
  /// used by supervisor agent when $prompt_session_attributes$ is present in
  /// prompt template.
  /// </li>
  /// </ul>
  final Map<String, String>? promptSessionAttributes;

  /// Contains information about the results from the action group invocation. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-returncontrol.html">Return
  /// control to the agent developer</a> and <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-session-state.html">Control
  /// session context</a>.
  /// <note>
  /// If you include this field, the <code>inputText</code> field will be ignored.
  /// </note>
  final List<InvocationResultMember>? returnControlInvocationResults;

  /// Contains attributes that persist across a session and the values of those
  /// attributes. If <code>sessionAttributes</code> are passed to a supervisor
  /// agent in <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-multi-agent-collaboration.html">multi-agent
  /// collaboration</a>, it will be forwarded to all agent collaborators.
  final Map<String, String>? sessionAttributes;

  SessionState({
    this.conversationHistory,
    this.files,
    this.invocationId,
    this.knowledgeBaseConfigurations,
    this.promptSessionAttributes,
    this.returnControlInvocationResults,
    this.sessionAttributes,
  });

  Map<String, dynamic> toJson() {
    final conversationHistory = this.conversationHistory;
    final files = this.files;
    final invocationId = this.invocationId;
    final knowledgeBaseConfigurations = this.knowledgeBaseConfigurations;
    final promptSessionAttributes = this.promptSessionAttributes;
    final returnControlInvocationResults = this.returnControlInvocationResults;
    final sessionAttributes = this.sessionAttributes;
    return {
      if (conversationHistory != null)
        'conversationHistory': conversationHistory,
      if (files != null) 'files': files,
      if (invocationId != null) 'invocationId': invocationId,
      if (knowledgeBaseConfigurations != null)
        'knowledgeBaseConfigurations': knowledgeBaseConfigurations,
      if (promptSessionAttributes != null)
        'promptSessionAttributes': promptSessionAttributes,
      if (returnControlInvocationResults != null)
        'returnControlInvocationResults': returnControlInvocationResults,
      if (sessionAttributes != null) 'sessionAttributes': sessionAttributes,
    };
  }
}

/// Settings for a model called with <a>InvokeAgent</a>.
class BedrockModelConfigurations {
  /// The performance configuration for the model.
  final PerformanceConfiguration? performanceConfig;

  BedrockModelConfigurations({
    this.performanceConfig,
  });

  Map<String, dynamic> toJson() {
    final performanceConfig = this.performanceConfig;
    return {
      if (performanceConfig != null) 'performanceConfig': performanceConfig,
    };
  }
}

/// Configurations to apply to a knowledge base attached to the agent during
/// query. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-session-state.html#session-state-kb">Knowledge
/// base retrieval configurations</a>.
class KnowledgeBaseConfiguration {
  /// The unique identifier for a knowledge base attached to the agent.
  final String knowledgeBaseId;

  /// The configurations to apply to the knowledge base during query. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-test-config.html">Query
  /// configurations</a>.
  final KnowledgeBaseRetrievalConfiguration retrievalConfiguration;

  KnowledgeBaseConfiguration({
    required this.knowledgeBaseId,
    required this.retrievalConfiguration,
  });

  Map<String, dynamic> toJson() {
    final knowledgeBaseId = this.knowledgeBaseId;
    final retrievalConfiguration = this.retrievalConfiguration;
    return {
      'knowledgeBaseId': knowledgeBaseId,
      'retrievalConfiguration': retrievalConfiguration,
    };
  }
}

/// Contains information about a query generated for a natural language query.
class GeneratedQuery {
  /// An SQL query that corresponds to the natural language query.
  final String? sql;

  /// The type of transformed query.
  final GeneratedQueryType? type;

  GeneratedQuery({
    this.sql,
    this.type,
  });

  factory GeneratedQuery.fromJson(Map<String, dynamic> json) {
    return GeneratedQuery(
      sql: json['sql'] as String?,
      type: (json['type'] as String?)?.let(GeneratedQueryType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final sql = this.sql;
    final type = this.type;
    return {
      if (sql != null) 'sql': sql,
      if (type != null) 'type': type.value,
    };
  }
}

class GeneratedQueryType {
  static const redshiftSql = GeneratedQueryType._('REDSHIFT_SQL');

  final String value;

  const GeneratedQueryType._(this.value);

  static const values = [redshiftSql];

  static GeneratedQueryType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GeneratedQueryType._(value));

  @override
  bool operator ==(other) =>
      other is GeneratedQueryType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about a natural language query to transform into SQL.
class QueryGenerationInput {
  /// The text of the query.
  final String text;

  /// The type of the query.
  final InputQueryType type;

  QueryGenerationInput({
    required this.text,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    final type = this.type;
    return {
      'text': text,
      'type': type.value,
    };
  }
}

/// Contains configurations for transforming the natural language query into
/// SQL.
class TransformationConfiguration {
  /// The mode of the transformation.
  final QueryTransformationMode mode;

  /// Specifies configurations for transforming text to SQL.
  final TextToSqlConfiguration? textToSqlConfiguration;

  TransformationConfiguration({
    required this.mode,
    this.textToSqlConfiguration,
  });

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    final textToSqlConfiguration = this.textToSqlConfiguration;
    return {
      'mode': mode.value,
      if (textToSqlConfiguration != null)
        'textToSqlConfiguration': textToSqlConfiguration,
    };
  }
}

class QueryTransformationMode {
  static const textToSql = QueryTransformationMode._('TEXT_TO_SQL');

  final String value;

  const QueryTransformationMode._(this.value);

  static const values = [textToSql];

  static QueryTransformationMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QueryTransformationMode._(value));

  @override
  bool operator ==(other) =>
      other is QueryTransformationMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains configurations for transforming text to SQL.
class TextToSqlConfiguration {
  /// The type of resource to use in transformation.
  final TextToSqlConfigurationType type;

  /// Specifies configurations for a knowledge base to use in transformation.
  final TextToSqlKnowledgeBaseConfiguration? knowledgeBaseConfiguration;

  TextToSqlConfiguration({
    required this.type,
    this.knowledgeBaseConfiguration,
  });

  Map<String, dynamic> toJson() {
    final type = this.type;
    final knowledgeBaseConfiguration = this.knowledgeBaseConfiguration;
    return {
      'type': type.value,
      if (knowledgeBaseConfiguration != null)
        'knowledgeBaseConfiguration': knowledgeBaseConfiguration,
    };
  }
}

class TextToSqlConfigurationType {
  static const knowledgeBase = TextToSqlConfigurationType._('KNOWLEDGE_BASE');

  final String value;

  const TextToSqlConfigurationType._(this.value);

  static const values = [knowledgeBase];

  static TextToSqlConfigurationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TextToSqlConfigurationType._(value));

  @override
  bool operator ==(other) =>
      other is TextToSqlConfigurationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains configurations for a knowledge base to use in transformation.
class TextToSqlKnowledgeBaseConfiguration {
  /// The ARN of the knowledge base
  final String knowledgeBaseArn;

  TextToSqlKnowledgeBaseConfiguration({
    required this.knowledgeBaseArn,
  });

  Map<String, dynamic> toJson() {
    final knowledgeBaseArn = this.knowledgeBaseArn;
    return {
      'knowledgeBaseArn': knowledgeBaseArn,
    };
  }
}

class InputQueryType {
  static const text = InputQueryType._('TEXT');

  final String value;

  const InputQueryType._(this.value);

  static const values = [text];

  static InputQueryType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InputQueryType._(value));

  @override
  bool operator ==(other) => other is InputQueryType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The output of the flow.
class FlowResponseStream {
  /// The request is denied because of missing access permissions. Check your
  /// permissions and retry your request.
  final AccessDeniedException? accessDeniedException;

  /// There was an issue with a dependency due to a server issue. Retry your
  /// request.
  final BadGatewayException? badGatewayException;

  /// There was a conflict performing an operation. Resolve the conflict and retry
  /// your request.
  final ConflictException? conflictException;

  /// There was an issue with a dependency. Check the resource configurations and
  /// retry the request.
  final DependencyFailedException? dependencyFailedException;

  /// Contains information about why the flow completed.
  final FlowCompletionEvent? flowCompletionEvent;

  /// The event stream containing the multi-turn input request information from
  /// the flow.
  final FlowMultiTurnInputRequestEvent? flowMultiTurnInputRequestEvent;

  /// Contains information about an output from flow invocation.
  final FlowOutputEvent? flowOutputEvent;

  /// Contains information about a trace, which tracks an input or output for a
  /// node in the flow.
  final FlowTraceEvent? flowTraceEvent;

  /// An internal server error occurred. Retry your request.
  final InternalServerException? internalServerException;

  /// The specified resource Amazon Resource Name (ARN) was not found. Check the
  /// Amazon Resource Name (ARN) and try your request again.
  final ResourceNotFoundException? resourceNotFoundException;

  /// The number of requests exceeds the service quota. Resubmit your request
  /// later.
  final ServiceQuotaExceededException? serviceQuotaExceededException;

  /// The number of requests exceeds the limit. Resubmit your request later.
  final ThrottlingException? throttlingException;

  /// Input validation failed. Check your request parameters and retry the
  /// request.
  final ValidationException? validationException;

  FlowResponseStream({
    this.accessDeniedException,
    this.badGatewayException,
    this.conflictException,
    this.dependencyFailedException,
    this.flowCompletionEvent,
    this.flowMultiTurnInputRequestEvent,
    this.flowOutputEvent,
    this.flowTraceEvent,
    this.internalServerException,
    this.resourceNotFoundException,
    this.serviceQuotaExceededException,
    this.throttlingException,
    this.validationException,
  });

  factory FlowResponseStream.fromJson(Map<String, dynamic> json) {
    return FlowResponseStream(
      accessDeniedException: json['accessDeniedException'] != null
          ? AccessDeniedException.fromJson(
              json['accessDeniedException'] as Map<String, dynamic>)
          : null,
      badGatewayException: json['badGatewayException'] != null
          ? BadGatewayException.fromJson(
              json['badGatewayException'] as Map<String, dynamic>)
          : null,
      conflictException: json['conflictException'] != null
          ? ConflictException.fromJson(
              json['conflictException'] as Map<String, dynamic>)
          : null,
      dependencyFailedException: json['dependencyFailedException'] != null
          ? DependencyFailedException.fromJson(
              json['dependencyFailedException'] as Map<String, dynamic>)
          : null,
      flowCompletionEvent: json['flowCompletionEvent'] != null
          ? FlowCompletionEvent.fromJson(
              json['flowCompletionEvent'] as Map<String, dynamic>)
          : null,
      flowMultiTurnInputRequestEvent: json['flowMultiTurnInputRequestEvent'] !=
              null
          ? FlowMultiTurnInputRequestEvent.fromJson(
              json['flowMultiTurnInputRequestEvent'] as Map<String, dynamic>)
          : null,
      flowOutputEvent: json['flowOutputEvent'] != null
          ? FlowOutputEvent.fromJson(
              json['flowOutputEvent'] as Map<String, dynamic>)
          : null,
      flowTraceEvent: json['flowTraceEvent'] != null
          ? FlowTraceEvent.fromJson(
              json['flowTraceEvent'] as Map<String, dynamic>)
          : null,
      internalServerException: json['internalServerException'] != null
          ? InternalServerException.fromJson(
              json['internalServerException'] as Map<String, dynamic>)
          : null,
      resourceNotFoundException: json['resourceNotFoundException'] != null
          ? ResourceNotFoundException.fromJson(
              json['resourceNotFoundException'] as Map<String, dynamic>)
          : null,
      serviceQuotaExceededException:
          json['serviceQuotaExceededException'] != null
              ? ServiceQuotaExceededException.fromJson(
                  json['serviceQuotaExceededException'] as Map<String, dynamic>)
              : null,
      throttlingException: json['throttlingException'] != null
          ? ThrottlingException.fromJson(
              json['throttlingException'] as Map<String, dynamic>)
          : null,
      validationException: json['validationException'] != null
          ? ValidationException.fromJson(
              json['validationException'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessDeniedException = this.accessDeniedException;
    final badGatewayException = this.badGatewayException;
    final conflictException = this.conflictException;
    final dependencyFailedException = this.dependencyFailedException;
    final flowCompletionEvent = this.flowCompletionEvent;
    final flowMultiTurnInputRequestEvent = this.flowMultiTurnInputRequestEvent;
    final flowOutputEvent = this.flowOutputEvent;
    final flowTraceEvent = this.flowTraceEvent;
    final internalServerException = this.internalServerException;
    final resourceNotFoundException = this.resourceNotFoundException;
    final serviceQuotaExceededException = this.serviceQuotaExceededException;
    final throttlingException = this.throttlingException;
    final validationException = this.validationException;
    return {
      if (accessDeniedException != null)
        'accessDeniedException': accessDeniedException,
      if (badGatewayException != null)
        'badGatewayException': badGatewayException,
      if (conflictException != null) 'conflictException': conflictException,
      if (dependencyFailedException != null)
        'dependencyFailedException': dependencyFailedException,
      if (flowCompletionEvent != null)
        'flowCompletionEvent': flowCompletionEvent,
      if (flowMultiTurnInputRequestEvent != null)
        'flowMultiTurnInputRequestEvent': flowMultiTurnInputRequestEvent,
      if (flowOutputEvent != null) 'flowOutputEvent': flowOutputEvent,
      if (flowTraceEvent != null) 'flowTraceEvent': flowTraceEvent,
      if (internalServerException != null)
        'internalServerException': internalServerException,
      if (resourceNotFoundException != null)
        'resourceNotFoundException': resourceNotFoundException,
      if (serviceQuotaExceededException != null)
        'serviceQuotaExceededException': serviceQuotaExceededException,
      if (throttlingException != null)
        'throttlingException': throttlingException,
      if (validationException != null)
        'validationException': validationException,
    };
  }
}

/// Contains information about an output from prompt flow invoction.
class FlowOutputEvent {
  /// The content in the output.
  final FlowOutputContent content;

  /// The name of the flow output node that the output is from.
  final String nodeName;

  /// The type of the node that the output is from.
  final NodeType nodeType;

  FlowOutputEvent({
    required this.content,
    required this.nodeName,
    required this.nodeType,
  });

  factory FlowOutputEvent.fromJson(Map<String, dynamic> json) {
    return FlowOutputEvent(
      content: FlowOutputContent.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      nodeName: (json['nodeName'] as String?) ?? '',
      nodeType: NodeType.fromString((json['nodeType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final nodeName = this.nodeName;
    final nodeType = this.nodeType;
    return {
      'content': content,
      'nodeName': nodeName,
      'nodeType': nodeType.value,
    };
  }
}

/// Contains information about why a flow completed.
class FlowCompletionEvent {
  /// The reason that the flow completed.
  final FlowCompletionReason completionReason;

  FlowCompletionEvent({
    required this.completionReason,
  });

  factory FlowCompletionEvent.fromJson(Map<String, dynamic> json) {
    return FlowCompletionEvent(
      completionReason: FlowCompletionReason.fromString(
          (json['completionReason'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final completionReason = this.completionReason;
    return {
      'completionReason': completionReason.value,
    };
  }
}

/// Contains information about a trace, which tracks an input or output for a
/// node in the flow. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-trace.html">Track
/// each step in your prompt flow by viewing its trace in Amazon Bedrock</a>.
class FlowTraceEvent {
  /// The trace object containing information about an input or output for a node
  /// in the flow.
  final FlowTrace trace;

  FlowTraceEvent({
    required this.trace,
  });

  factory FlowTraceEvent.fromJson(Map<String, dynamic> json) {
    return FlowTraceEvent(
      trace: FlowTrace.fromJson((json['trace'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final trace = this.trace;
    return {
      'trace': trace,
    };
  }
}

/// Response object from the flow multi-turn node requesting additional
/// information.
class FlowMultiTurnInputRequestEvent {
  /// The content payload containing the input request details for the multi-turn
  /// interaction.
  final FlowMultiTurnInputContent content;

  /// The name of the node in the flow that is requesting the input.
  final String nodeName;

  /// The type of the node in the flow that is requesting the input.
  final NodeType nodeType;

  FlowMultiTurnInputRequestEvent({
    required this.content,
    required this.nodeName,
    required this.nodeType,
  });

  factory FlowMultiTurnInputRequestEvent.fromJson(Map<String, dynamic> json) {
    return FlowMultiTurnInputRequestEvent(
      content: FlowMultiTurnInputContent.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      nodeName: (json['nodeName'] as String?) ?? '',
      nodeType: NodeType.fromString((json['nodeType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final nodeName = this.nodeName;
    final nodeType = this.nodeType;
    return {
      'content': content,
      'nodeName': nodeName,
      'nodeType': nodeType.value,
    };
  }
}

class NodeType {
  static const flowInputNode = NodeType._('FlowInputNode');
  static const flowOutputNode = NodeType._('FlowOutputNode');
  static const lambdaFunctionNode = NodeType._('LambdaFunctionNode');
  static const knowledgeBaseNode = NodeType._('KnowledgeBaseNode');
  static const promptNode = NodeType._('PromptNode');
  static const conditionNode = NodeType._('ConditionNode');
  static const lexNode = NodeType._('LexNode');

  final String value;

  const NodeType._(this.value);

  static const values = [
    flowInputNode,
    flowOutputNode,
    lambdaFunctionNode,
    knowledgeBaseNode,
    promptNode,
    conditionNode,
    lexNode
  ];

  static NodeType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => NodeType._(value));

  @override
  bool operator ==(other) => other is NodeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The content structure containing input information for multi-turn flow
/// interactions.
class FlowMultiTurnInputContent {
  /// The requested additional input to send back to the multi-turn flow node.
  final Document? document;

  FlowMultiTurnInputContent({
    this.document,
  });

  factory FlowMultiTurnInputContent.fromJson(Map<String, dynamic> json) {
    return FlowMultiTurnInputContent(
      document: json['document'] != null
          ? Document.fromJson(json['document'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final document = this.document;
    return {
      if (document != null) 'document': document,
    };
  }
}

/// Contains information about an input or output for a node in the flow. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-trace.html">Track
/// each step in your prompt flow by viewing its trace in Amazon Bedrock</a>.
class FlowTrace {
  /// Contains information about an output from a condition node.
  final FlowTraceConditionNodeResultEvent? conditionNodeResultTrace;

  /// Contains information about an action (operation) called by a node.
  final FlowTraceNodeActionEvent? nodeActionTrace;

  /// Contains information about an internal trace of a node.
  final FlowTraceDependencyEvent? nodeDependencyTrace;

  /// Contains information about the input into a node.
  final FlowTraceNodeInputEvent? nodeInputTrace;

  /// Contains information about the output from a node.
  final FlowTraceNodeOutputEvent? nodeOutputTrace;

  FlowTrace({
    this.conditionNodeResultTrace,
    this.nodeActionTrace,
    this.nodeDependencyTrace,
    this.nodeInputTrace,
    this.nodeOutputTrace,
  });

  factory FlowTrace.fromJson(Map<String, dynamic> json) {
    return FlowTrace(
      conditionNodeResultTrace: json['conditionNodeResultTrace'] != null
          ? FlowTraceConditionNodeResultEvent.fromJson(
              json['conditionNodeResultTrace'] as Map<String, dynamic>)
          : null,
      nodeActionTrace: json['nodeActionTrace'] != null
          ? FlowTraceNodeActionEvent.fromJson(
              json['nodeActionTrace'] as Map<String, dynamic>)
          : null,
      nodeDependencyTrace: json['nodeDependencyTrace'] != null
          ? FlowTraceDependencyEvent.fromJson(
              json['nodeDependencyTrace'] as Map<String, dynamic>)
          : null,
      nodeInputTrace: json['nodeInputTrace'] != null
          ? FlowTraceNodeInputEvent.fromJson(
              json['nodeInputTrace'] as Map<String, dynamic>)
          : null,
      nodeOutputTrace: json['nodeOutputTrace'] != null
          ? FlowTraceNodeOutputEvent.fromJson(
              json['nodeOutputTrace'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final conditionNodeResultTrace = this.conditionNodeResultTrace;
    final nodeActionTrace = this.nodeActionTrace;
    final nodeDependencyTrace = this.nodeDependencyTrace;
    final nodeInputTrace = this.nodeInputTrace;
    final nodeOutputTrace = this.nodeOutputTrace;
    return {
      if (conditionNodeResultTrace != null)
        'conditionNodeResultTrace': conditionNodeResultTrace,
      if (nodeActionTrace != null) 'nodeActionTrace': nodeActionTrace,
      if (nodeDependencyTrace != null)
        'nodeDependencyTrace': nodeDependencyTrace,
      if (nodeInputTrace != null) 'nodeInputTrace': nodeInputTrace,
      if (nodeOutputTrace != null) 'nodeOutputTrace': nodeOutputTrace,
    };
  }
}

/// Contains information about the input into a node. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-trace.html">Track
/// each step in your prompt flow by viewing its trace in Amazon Bedrock</a>.
class FlowTraceNodeInputEvent {
  /// An array of objects containing information about each field in the input.
  final List<FlowTraceNodeInputField> fields;

  /// The name of the node that received the input.
  final String nodeName;

  /// The date and time that the trace was returned.
  final DateTime timestamp;

  FlowTraceNodeInputEvent({
    required this.fields,
    required this.nodeName,
    required this.timestamp,
  });

  factory FlowTraceNodeInputEvent.fromJson(Map<String, dynamic> json) {
    return FlowTraceNodeInputEvent(
      fields: ((json['fields'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              FlowTraceNodeInputField.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodeName: (json['nodeName'] as String?) ?? '',
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    final nodeName = this.nodeName;
    final timestamp = this.timestamp;
    return {
      'fields': fields,
      'nodeName': nodeName,
      'timestamp': iso8601ToJson(timestamp),
    };
  }
}

/// Contains information about the output from a node. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-trace.html">Track
/// each step in your prompt flow by viewing its trace in Amazon Bedrock</a>.
class FlowTraceNodeOutputEvent {
  /// An array of objects containing information about each field in the output.
  final List<FlowTraceNodeOutputField> fields;

  /// The name of the node that yielded the output.
  final String nodeName;

  /// The date and time that the trace was returned.
  final DateTime timestamp;

  FlowTraceNodeOutputEvent({
    required this.fields,
    required this.nodeName,
    required this.timestamp,
  });

  factory FlowTraceNodeOutputEvent.fromJson(Map<String, dynamic> json) {
    return FlowTraceNodeOutputEvent(
      fields: ((json['fields'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              FlowTraceNodeOutputField.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodeName: (json['nodeName'] as String?) ?? '',
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    final nodeName = this.nodeName;
    final timestamp = this.timestamp;
    return {
      'fields': fields,
      'nodeName': nodeName,
      'timestamp': iso8601ToJson(timestamp),
    };
  }
}

/// Contains information about an output from a condition node. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-trace.html">Track
/// each step in your prompt flow by viewing its trace in Amazon Bedrock</a>.
class FlowTraceConditionNodeResultEvent {
  /// The name of the condition node.
  final String nodeName;

  /// An array of objects containing information about the conditions that were
  /// satisfied.
  final List<FlowTraceCondition> satisfiedConditions;

  /// The date and time that the trace was returned.
  final DateTime timestamp;

  FlowTraceConditionNodeResultEvent({
    required this.nodeName,
    required this.satisfiedConditions,
    required this.timestamp,
  });

  factory FlowTraceConditionNodeResultEvent.fromJson(
      Map<String, dynamic> json) {
    return FlowTraceConditionNodeResultEvent(
      nodeName: (json['nodeName'] as String?) ?? '',
      satisfiedConditions: ((json['satisfiedConditions'] as List?) ?? const [])
          .nonNulls
          .map((e) => FlowTraceCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final nodeName = this.nodeName;
    final satisfiedConditions = this.satisfiedConditions;
    final timestamp = this.timestamp;
    return {
      'nodeName': nodeName,
      'satisfiedConditions': satisfiedConditions,
      'timestamp': iso8601ToJson(timestamp),
    };
  }
}

/// Contains information about an action (operation) called by a node in an
/// Amazon Bedrock flow. The service generates action events for calls made by
/// prompt nodes, agent nodes, and Amazon Web Services Lambda nodes.
class FlowTraceNodeActionEvent {
  /// The name of the node that called the operation.
  final String nodeName;

  /// The name of the operation that the node called.
  final String operationName;

  /// The ID of the request that the node made to the operation.
  final String requestId;

  /// The name of the service that the node called.
  final String serviceName;

  /// The date and time that the operation was called.
  final DateTime timestamp;

  /// The request payload sent to the downstream service.
  final Document? operationRequest;

  /// The response payload received from the downstream service.
  final Document? operationResponse;

  FlowTraceNodeActionEvent({
    required this.nodeName,
    required this.operationName,
    required this.requestId,
    required this.serviceName,
    required this.timestamp,
    this.operationRequest,
    this.operationResponse,
  });

  factory FlowTraceNodeActionEvent.fromJson(Map<String, dynamic> json) {
    return FlowTraceNodeActionEvent(
      nodeName: (json['nodeName'] as String?) ?? '',
      operationName: (json['operationName'] as String?) ?? '',
      requestId: (json['requestId'] as String?) ?? '',
      serviceName: (json['serviceName'] as String?) ?? '',
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
      operationRequest: json['operationRequest'] != null
          ? Document.fromJson(json['operationRequest'] as Map<String, dynamic>)
          : null,
      operationResponse: json['operationResponse'] != null
          ? Document.fromJson(json['operationResponse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nodeName = this.nodeName;
    final operationName = this.operationName;
    final requestId = this.requestId;
    final serviceName = this.serviceName;
    final timestamp = this.timestamp;
    final operationRequest = this.operationRequest;
    final operationResponse = this.operationResponse;
    return {
      'nodeName': nodeName,
      'operationName': operationName,
      'requestId': requestId,
      'serviceName': serviceName,
      'timestamp': iso8601ToJson(timestamp),
      if (operationRequest != null) 'operationRequest': operationRequest,
      if (operationResponse != null) 'operationResponse': operationResponse,
    };
  }
}

/// Contains information about a dependency trace event in the flow.
class FlowTraceDependencyEvent {
  /// The name of the node that generated the dependency trace.
  final String nodeName;

  /// The date and time that the dependency trace was generated.
  final DateTime timestamp;

  /// The trace elements containing detailed information about the dependency.
  final TraceElements traceElements;

  FlowTraceDependencyEvent({
    required this.nodeName,
    required this.timestamp,
    required this.traceElements,
  });

  factory FlowTraceDependencyEvent.fromJson(Map<String, dynamic> json) {
    return FlowTraceDependencyEvent(
      nodeName: (json['nodeName'] as String?) ?? '',
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
      traceElements: TraceElements.fromJson(
          (json['traceElements'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final nodeName = this.nodeName;
    final timestamp = this.timestamp;
    final traceElements = this.traceElements;
    return {
      'nodeName': nodeName,
      'timestamp': iso8601ToJson(timestamp),
      'traceElements': traceElements,
    };
  }
}

/// Contains trace elements for flow execution tracking.
class TraceElements {
  /// Agent trace information for the flow execution.
  final List<TracePart>? agentTraces;

  TraceElements({
    this.agentTraces,
  });

  factory TraceElements.fromJson(Map<String, dynamic> json) {
    return TraceElements(
      agentTraces: (json['agentTraces'] as List?)
          ?.nonNulls
          .map((e) => TracePart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentTraces = this.agentTraces;
    return {
      if (agentTraces != null) 'agentTraces': agentTraces,
    };
  }
}

/// Contains information about a condition that was satisfied. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-trace.html">Track
/// each step in your prompt flow by viewing its trace in Amazon Bedrock</a>.
class FlowTraceCondition {
  /// The name of the condition.
  final String conditionName;

  FlowTraceCondition({
    required this.conditionName,
  });

  factory FlowTraceCondition.fromJson(Map<String, dynamic> json) {
    return FlowTraceCondition(
      conditionName: (json['conditionName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final conditionName = this.conditionName;
    return {
      'conditionName': conditionName,
    };
  }
}

/// Contains information about a field in the output from a node. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-trace.html">Track
/// each step in your prompt flow by viewing its trace in Amazon Bedrock</a>.
class FlowTraceNodeOutputField {
  /// The content of the node output.
  final FlowTraceNodeOutputContent content;

  /// The name of the node output.
  final String nodeOutputName;

  /// The next node that receives output data from this field.
  final List<FlowTraceNodeOutputNext>? next;

  /// The data type of the output field for compatibility validation.
  final FlowNodeIODataType? type;

  FlowTraceNodeOutputField({
    required this.content,
    required this.nodeOutputName,
    this.next,
    this.type,
  });

  factory FlowTraceNodeOutputField.fromJson(Map<String, dynamic> json) {
    return FlowTraceNodeOutputField(
      content: FlowTraceNodeOutputContent.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      nodeOutputName: (json['nodeOutputName'] as String?) ?? '',
      next: (json['next'] as List?)
          ?.nonNulls
          .map((e) =>
              FlowTraceNodeOutputNext.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['type'] as String?)?.let(FlowNodeIODataType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final nodeOutputName = this.nodeOutputName;
    final next = this.next;
    final type = this.type;
    return {
      'content': content,
      'nodeOutputName': nodeOutputName,
      if (next != null) 'next': next,
      if (type != null) 'type': type.value,
    };
  }
}

/// Contains the content of the node output. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-trace.html">Track
/// each step in your prompt flow by viewing its trace in Amazon Bedrock</a>.
class FlowTraceNodeOutputContent {
  /// The content of the node output.
  final Document? document;

  FlowTraceNodeOutputContent({
    this.document,
  });

  factory FlowTraceNodeOutputContent.fromJson(Map<String, dynamic> json) {
    return FlowTraceNodeOutputContent(
      document: json['document'] != null
          ? Document.fromJson(json['document'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final document = this.document;
    return {
      if (document != null) 'document': document,
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

/// Represents the next node that receives output data from a flow trace.
class FlowTraceNodeOutputNext {
  /// The name of the input field in the next node that receives the data.
  final String inputFieldName;

  /// The name of the next node that receives the output data.
  final String nodeName;

  FlowTraceNodeOutputNext({
    required this.inputFieldName,
    required this.nodeName,
  });

  factory FlowTraceNodeOutputNext.fromJson(Map<String, dynamic> json) {
    return FlowTraceNodeOutputNext(
      inputFieldName: (json['inputFieldName'] as String?) ?? '',
      nodeName: (json['nodeName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final inputFieldName = this.inputFieldName;
    final nodeName = this.nodeName;
    return {
      'inputFieldName': inputFieldName,
      'nodeName': nodeName,
    };
  }
}

/// Contains information about a field in the input into a node. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-trace.html">Track
/// each step in your prompt flow by viewing its trace in Amazon Bedrock</a>.
class FlowTraceNodeInputField {
  /// The content of the node input.
  final FlowTraceNodeInputContent content;

  /// The name of the node input.
  final String nodeInputName;

  /// The category of the input field.
  final FlowNodeInputCategory? category;

  /// The execution path through nested nodes like iterators and loops.
  final List<FlowTraceNodeInputExecutionChainItem>? executionChain;

  /// The source node that provides input data to this field.
  final FlowTraceNodeInputSource? source;

  /// The data type of the input field for compatibility validation.
  final FlowNodeIODataType? type;

  FlowTraceNodeInputField({
    required this.content,
    required this.nodeInputName,
    this.category,
    this.executionChain,
    this.source,
    this.type,
  });

  factory FlowTraceNodeInputField.fromJson(Map<String, dynamic> json) {
    return FlowTraceNodeInputField(
      content: FlowTraceNodeInputContent.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      nodeInputName: (json['nodeInputName'] as String?) ?? '',
      category:
          (json['category'] as String?)?.let(FlowNodeInputCategory.fromString),
      executionChain: (json['executionChain'] as List?)
          ?.nonNulls
          .map((e) => FlowTraceNodeInputExecutionChainItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      source: json['source'] != null
          ? FlowTraceNodeInputSource.fromJson(
              json['source'] as Map<String, dynamic>)
          : null,
      type: (json['type'] as String?)?.let(FlowNodeIODataType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final nodeInputName = this.nodeInputName;
    final category = this.category;
    final executionChain = this.executionChain;
    final source = this.source;
    final type = this.type;
    return {
      'content': content,
      'nodeInputName': nodeInputName,
      if (category != null) 'category': category.value,
      if (executionChain != null) 'executionChain': executionChain,
      if (source != null) 'source': source,
      if (type != null) 'type': type.value,
    };
  }
}

/// Contains the content of the node input. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/flows-trace.html">Track
/// each step in your prompt flow by viewing its trace in Amazon Bedrock</a>.
class FlowTraceNodeInputContent {
  /// The content of the node input.
  final Document? document;

  FlowTraceNodeInputContent({
    this.document,
  });

  factory FlowTraceNodeInputContent.fromJson(Map<String, dynamic> json) {
    return FlowTraceNodeInputContent(
      document: json['document'] != null
          ? Document.fromJson(json['document'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final document = this.document;
    return {
      if (document != null) 'document': document,
    };
  }
}

/// Represents the source of input data for a flow trace node field.
class FlowTraceNodeInputSource {
  /// The expression used to extract data from the source.
  final String expression;

  /// The name of the source node that provides the input data.
  final String nodeName;

  /// The name of the output field from the source node.
  final String outputFieldName;

  FlowTraceNodeInputSource({
    required this.expression,
    required this.nodeName,
    required this.outputFieldName,
  });

  factory FlowTraceNodeInputSource.fromJson(Map<String, dynamic> json) {
    return FlowTraceNodeInputSource(
      expression: (json['expression'] as String?) ?? '',
      nodeName: (json['nodeName'] as String?) ?? '',
      outputFieldName: (json['outputFieldName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final nodeName = this.nodeName;
    final outputFieldName = this.outputFieldName;
    return {
      'expression': expression,
      'nodeName': nodeName,
      'outputFieldName': outputFieldName,
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

/// Represents an item in the execution chain for flow trace node input
/// tracking.
class FlowTraceNodeInputExecutionChainItem {
  /// The name of the node in the execution chain.
  final String nodeName;

  /// The type of execution chain item. Supported values are Iterator and Loop.
  final FlowControlNodeType type;

  /// The index position of this item in the execution chain.
  final int? index;

  FlowTraceNodeInputExecutionChainItem({
    required this.nodeName,
    required this.type,
    this.index,
  });

  factory FlowTraceNodeInputExecutionChainItem.fromJson(
      Map<String, dynamic> json) {
    return FlowTraceNodeInputExecutionChainItem(
      nodeName: (json['nodeName'] as String?) ?? '',
      type: FlowControlNodeType.fromString((json['type'] as String?) ?? ''),
      index: json['index'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final nodeName = this.nodeName;
    final type = this.type;
    final index = this.index;
    return {
      'nodeName': nodeName,
      'type': type.value,
      if (index != null) 'index': index,
    };
  }
}

class FlowControlNodeType {
  static const iterator = FlowControlNodeType._('Iterator');
  static const loop = FlowControlNodeType._('Loop');

  final String value;

  const FlowControlNodeType._(this.value);

  static const values = [iterator, loop];

  static FlowControlNodeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FlowControlNodeType._(value));

  @override
  bool operator ==(other) =>
      other is FlowControlNodeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class FlowCompletionReason {
  static const success = FlowCompletionReason._('SUCCESS');
  static const inputRequired = FlowCompletionReason._('INPUT_REQUIRED');

  final String value;

  const FlowCompletionReason._(this.value);

  static const values = [success, inputRequired];

  static FlowCompletionReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FlowCompletionReason._(value));

  @override
  bool operator ==(other) =>
      other is FlowCompletionReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about the content in an output from prompt flow
/// invocation.
class FlowOutputContent {
  /// The content in the output.
  final Document? document;

  FlowOutputContent({
    this.document,
  });

  factory FlowOutputContent.fromJson(Map<String, dynamic> json) {
    return FlowOutputContent(
      document: json['document'] != null
          ? Document.fromJson(json['document'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final document = this.document;
    return {
      if (document != null) 'document': document,
    };
  }
}

/// The performance configuration for a model called with <a>InvokeFlow</a>.
class ModelPerformanceConfiguration {
  /// The latency configuration for the model.
  final PerformanceConfiguration? performanceConfig;

  ModelPerformanceConfiguration({
    this.performanceConfig,
  });

  Map<String, dynamic> toJson() {
    final performanceConfig = this.performanceConfig;
    return {
      if (performanceConfig != null) 'performanceConfig': performanceConfig,
    };
  }
}

/// Contains information about an input into the prompt flow and where to send
/// it.
class FlowInput {
  /// Contains information about an input into the prompt flow.
  final FlowInputContent content;

  /// The name of the flow input node that begins the prompt flow.
  final String nodeName;

  /// The name of the input from the flow input node.
  final String? nodeInputName;

  /// The name of the output from the flow input node that begins the prompt flow.
  final String? nodeOutputName;

  FlowInput({
    required this.content,
    required this.nodeName,
    this.nodeInputName,
    this.nodeOutputName,
  });

  Map<String, dynamic> toJson() {
    final content = this.content;
    final nodeName = this.nodeName;
    final nodeInputName = this.nodeInputName;
    final nodeOutputName = this.nodeOutputName;
    return {
      'content': content,
      'nodeName': nodeName,
      if (nodeInputName != null) 'nodeInputName': nodeInputName,
      if (nodeOutputName != null) 'nodeOutputName': nodeOutputName,
    };
  }
}

/// Contains information about an input into the flow.
class FlowInputContent {
  /// The input to send to the prompt flow input node.
  final Document? document;

  FlowInputContent({
    this.document,
  });

  Map<String, dynamic> toJson() {
    final document = this.document;
    return {
      if (document != null) 'document': document,
    };
  }
}

class FlowExecutionStatus {
  static const running = FlowExecutionStatus._('Running');
  static const succeeded = FlowExecutionStatus._('Succeeded');
  static const failed = FlowExecutionStatus._('Failed');
  static const timedOut = FlowExecutionStatus._('TimedOut');
  static const aborted = FlowExecutionStatus._('Aborted');

  final String value;

  const FlowExecutionStatus._(this.value);

  static const values = [running, succeeded, failed, timedOut, aborted];

  static FlowExecutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FlowExecutionStatus._(value));

  @override
  bool operator ==(other) =>
      other is FlowExecutionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains summary information about a flow execution, including its status,
/// timestamps, and identifiers.
/// <note>
/// Flow executions is in preview release for Amazon Bedrock and is subject to
/// change.
/// </note>
class FlowExecutionSummary {
  /// The timestamp when the flow execution was created.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) that uniquely identifies the flow execution.
  final String executionArn;

  /// The unique identifier of the flow alias used for the execution.
  final String flowAliasIdentifier;

  /// The unique identifier of the flow.
  final String flowIdentifier;

  /// The version of the flow used for the execution.
  final String flowVersion;

  /// The current status of the flow execution.
  ///
  /// Flow executions time out after 24 hours.
  final FlowExecutionStatus status;

  /// The timestamp when the flow execution ended. This field is only populated
  /// when the execution has completed, failed, timed out, or been aborted.
  final DateTime? endedAt;

  FlowExecutionSummary({
    required this.createdAt,
    required this.executionArn,
    required this.flowAliasIdentifier,
    required this.flowIdentifier,
    required this.flowVersion,
    required this.status,
    this.endedAt,
  });

  factory FlowExecutionSummary.fromJson(Map<String, dynamic> json) {
    return FlowExecutionSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      executionArn: (json['executionArn'] as String?) ?? '',
      flowAliasIdentifier: (json['flowAliasIdentifier'] as String?) ?? '',
      flowIdentifier: (json['flowIdentifier'] as String?) ?? '',
      flowVersion: (json['flowVersion'] as String?) ?? '',
      status: FlowExecutionStatus.fromString((json['status'] as String?) ?? ''),
      endedAt: timeStampFromJson(json['endedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final executionArn = this.executionArn;
    final flowAliasIdentifier = this.flowAliasIdentifier;
    final flowIdentifier = this.flowIdentifier;
    final flowVersion = this.flowVersion;
    final status = this.status;
    final endedAt = this.endedAt;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'executionArn': executionArn,
      'flowAliasIdentifier': flowAliasIdentifier,
      'flowIdentifier': flowIdentifier,
      'flowVersion': flowVersion,
      'status': status.value,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
    };
  }
}

/// Represents an event that occurred during an flow execution. This is a union
/// type that can contain one of several event types, such as node input and
/// output events; flow input and output events; condition node result events,
/// or failure events.
/// <note>
/// Flow executions is in preview release for Amazon Bedrock and is subject to
/// change.
/// </note>
class FlowExecutionEvent {
  /// Contains information about a condition evaluation result during the flow
  /// execution. This event is generated when a condition node in the flow
  /// evaluates its conditions.
  final ConditionResultEvent? conditionResultEvent;

  /// Contains information about a failure that occurred at the flow level during
  /// execution.
  final FlowFailureEvent? flowFailureEvent;

  /// Contains information about the inputs provided to the flow at the start of
  /// execution.
  final FlowExecutionInputEvent? flowInputEvent;

  /// Contains information about the outputs produced by the flow at the end of
  /// execution.
  final FlowExecutionOutputEvent? flowOutputEvent;

  /// Contains information about an action (operation) called by a node during
  /// execution.
  final NodeActionEvent? nodeActionEvent;

  /// Contains information about an internal trace of a specific node during
  /// execution.
  final NodeDependencyEvent? nodeDependencyEvent;

  /// Contains information about a failure that occurred at a specific node during
  /// execution.
  final NodeFailureEvent? nodeFailureEvent;

  /// Contains information about the inputs provided to a specific node during
  /// execution.
  final NodeInputEvent? nodeInputEvent;

  /// Contains information about the outputs produced by a specific node during
  /// execution.
  final NodeOutputEvent? nodeOutputEvent;

  FlowExecutionEvent({
    this.conditionResultEvent,
    this.flowFailureEvent,
    this.flowInputEvent,
    this.flowOutputEvent,
    this.nodeActionEvent,
    this.nodeDependencyEvent,
    this.nodeFailureEvent,
    this.nodeInputEvent,
    this.nodeOutputEvent,
  });

  factory FlowExecutionEvent.fromJson(Map<String, dynamic> json) {
    return FlowExecutionEvent(
      conditionResultEvent: json['conditionResultEvent'] != null
          ? ConditionResultEvent.fromJson(
              json['conditionResultEvent'] as Map<String, dynamic>)
          : null,
      flowFailureEvent: json['flowFailureEvent'] != null
          ? FlowFailureEvent.fromJson(
              json['flowFailureEvent'] as Map<String, dynamic>)
          : null,
      flowInputEvent: json['flowInputEvent'] != null
          ? FlowExecutionInputEvent.fromJson(
              json['flowInputEvent'] as Map<String, dynamic>)
          : null,
      flowOutputEvent: json['flowOutputEvent'] != null
          ? FlowExecutionOutputEvent.fromJson(
              json['flowOutputEvent'] as Map<String, dynamic>)
          : null,
      nodeActionEvent: json['nodeActionEvent'] != null
          ? NodeActionEvent.fromJson(
              json['nodeActionEvent'] as Map<String, dynamic>)
          : null,
      nodeDependencyEvent: json['nodeDependencyEvent'] != null
          ? NodeDependencyEvent.fromJson(
              json['nodeDependencyEvent'] as Map<String, dynamic>)
          : null,
      nodeFailureEvent: json['nodeFailureEvent'] != null
          ? NodeFailureEvent.fromJson(
              json['nodeFailureEvent'] as Map<String, dynamic>)
          : null,
      nodeInputEvent: json['nodeInputEvent'] != null
          ? NodeInputEvent.fromJson(
              json['nodeInputEvent'] as Map<String, dynamic>)
          : null,
      nodeOutputEvent: json['nodeOutputEvent'] != null
          ? NodeOutputEvent.fromJson(
              json['nodeOutputEvent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final conditionResultEvent = this.conditionResultEvent;
    final flowFailureEvent = this.flowFailureEvent;
    final flowInputEvent = this.flowInputEvent;
    final flowOutputEvent = this.flowOutputEvent;
    final nodeActionEvent = this.nodeActionEvent;
    final nodeDependencyEvent = this.nodeDependencyEvent;
    final nodeFailureEvent = this.nodeFailureEvent;
    final nodeInputEvent = this.nodeInputEvent;
    final nodeOutputEvent = this.nodeOutputEvent;
    return {
      if (conditionResultEvent != null)
        'conditionResultEvent': conditionResultEvent,
      if (flowFailureEvent != null) 'flowFailureEvent': flowFailureEvent,
      if (flowInputEvent != null) 'flowInputEvent': flowInputEvent,
      if (flowOutputEvent != null) 'flowOutputEvent': flowOutputEvent,
      if (nodeActionEvent != null) 'nodeActionEvent': nodeActionEvent,
      if (nodeDependencyEvent != null)
        'nodeDependencyEvent': nodeDependencyEvent,
      if (nodeFailureEvent != null) 'nodeFailureEvent': nodeFailureEvent,
      if (nodeInputEvent != null) 'nodeInputEvent': nodeInputEvent,
      if (nodeOutputEvent != null) 'nodeOutputEvent': nodeOutputEvent,
    };
  }
}

/// Contains information about the inputs provided to the flow at the start of a
/// flow execution.
/// <note>
/// Flow executions is in preview release for Amazon Bedrock and is subject to
/// change.
/// </note>
class FlowExecutionInputEvent {
  /// A list of input fields provided to the flow.
  final List<FlowInputField> fields;

  /// The name of the node that receives the inputs.
  final String nodeName;

  /// The timestamp when the inputs are provided.
  final DateTime timestamp;

  FlowExecutionInputEvent({
    required this.fields,
    required this.nodeName,
    required this.timestamp,
  });

  factory FlowExecutionInputEvent.fromJson(Map<String, dynamic> json) {
    return FlowExecutionInputEvent(
      fields: ((json['fields'] as List?) ?? const [])
          .nonNulls
          .map((e) => FlowInputField.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodeName: (json['nodeName'] as String?) ?? '',
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    final nodeName = this.nodeName;
    final timestamp = this.timestamp;
    return {
      'fields': fields,
      'nodeName': nodeName,
      'timestamp': iso8601ToJson(timestamp),
    };
  }
}

/// Contains information about the outputs produced by the flow during a flow
/// execution.
/// <note>
/// Flow executions is in preview release for Amazon Bedrock and is subject to
/// change.
/// </note>
class FlowExecutionOutputEvent {
  /// A list of output fields produced by the flow.
  final List<FlowOutputField> fields;

  /// The name of the node that produces the outputs.
  final String nodeName;

  /// The timestamp when the outputs are produced.
  final DateTime timestamp;

  FlowExecutionOutputEvent({
    required this.fields,
    required this.nodeName,
    required this.timestamp,
  });

  factory FlowExecutionOutputEvent.fromJson(Map<String, dynamic> json) {
    return FlowExecutionOutputEvent(
      fields: ((json['fields'] as List?) ?? const [])
          .nonNulls
          .map((e) => FlowOutputField.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodeName: (json['nodeName'] as String?) ?? '',
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    final nodeName = this.nodeName;
    final timestamp = this.timestamp;
    return {
      'fields': fields,
      'nodeName': nodeName,
      'timestamp': iso8601ToJson(timestamp),
    };
  }
}

/// Contains information about the inputs provided to a specific node during a
/// flow execution.
/// <note>
/// Flow executions is in preview release for Amazon Bedrock and is subject to
/// change.
/// </note>
class NodeInputEvent {
  /// A list of input fields provided to the node.
  final List<NodeInputField> fields;

  /// The name of the node that received the inputs.
  final String nodeName;

  /// The timestamp when the inputs were provided to the node.
  final DateTime timestamp;

  NodeInputEvent({
    required this.fields,
    required this.nodeName,
    required this.timestamp,
  });

  factory NodeInputEvent.fromJson(Map<String, dynamic> json) {
    return NodeInputEvent(
      fields: ((json['fields'] as List?) ?? const [])
          .nonNulls
          .map((e) => NodeInputField.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodeName: (json['nodeName'] as String?) ?? '',
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    final nodeName = this.nodeName;
    final timestamp = this.timestamp;
    return {
      'fields': fields,
      'nodeName': nodeName,
      'timestamp': iso8601ToJson(timestamp),
    };
  }
}

/// Contains information about the outputs produced by a specific node during a
/// flow execution.
/// <note>
/// Flow executions is in preview release for Amazon Bedrock and is subject to
/// change.
/// </note>
class NodeOutputEvent {
  /// A list of output fields produced by the node.
  final List<NodeOutputField> fields;

  /// The name of the node that produced the outputs.
  final String nodeName;

  /// The timestamp when the outputs were produced by the node.
  final DateTime timestamp;

  NodeOutputEvent({
    required this.fields,
    required this.nodeName,
    required this.timestamp,
  });

  factory NodeOutputEvent.fromJson(Map<String, dynamic> json) {
    return NodeOutputEvent(
      fields: ((json['fields'] as List?) ?? const [])
          .nonNulls
          .map((e) => NodeOutputField.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodeName: (json['nodeName'] as String?) ?? '',
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    final nodeName = this.nodeName;
    final timestamp = this.timestamp;
    return {
      'fields': fields,
      'nodeName': nodeName,
      'timestamp': iso8601ToJson(timestamp),
    };
  }
}

/// Contains information about a condition evaluation result during a flow
/// execution. This event is generated when a condition node in the flow
/// evaluates its conditions.
/// <note>
/// Flow executions is in preview release for Amazon Bedrock and is subject to
/// change.
/// </note>
class ConditionResultEvent {
  /// The name of the condition node that evaluated the conditions.
  final String nodeName;

  /// A list of conditions that were satisfied during the evaluation.
  final List<SatisfiedCondition> satisfiedConditions;

  /// The timestamp when the condition evaluation occurred.
  final DateTime timestamp;

  ConditionResultEvent({
    required this.nodeName,
    required this.satisfiedConditions,
    required this.timestamp,
  });

  factory ConditionResultEvent.fromJson(Map<String, dynamic> json) {
    return ConditionResultEvent(
      nodeName: (json['nodeName'] as String?) ?? '',
      satisfiedConditions: ((json['satisfiedConditions'] as List?) ?? const [])
          .nonNulls
          .map((e) => SatisfiedCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final nodeName = this.nodeName;
    final satisfiedConditions = this.satisfiedConditions;
    final timestamp = this.timestamp;
    return {
      'nodeName': nodeName,
      'satisfiedConditions': satisfiedConditions,
      'timestamp': iso8601ToJson(timestamp),
    };
  }
}

/// Contains information about a failure that occurred at a specific node during
/// a flow execution.
/// <note>
/// Flow executions is in preview release for Amazon Bedrock and is subject to
/// change.
/// </note>
class NodeFailureEvent {
  /// The error code that identifies the type of failure that occurred at the
  /// node.
  final NodeErrorCode errorCode;

  /// A descriptive message that provides details about the node failure.
  final String errorMessage;

  /// The name of the node where the failure occurred.
  final String nodeName;

  /// The timestamp when the node failure occurred.
  final DateTime timestamp;

  NodeFailureEvent({
    required this.errorCode,
    required this.errorMessage,
    required this.nodeName,
    required this.timestamp,
  });

  factory NodeFailureEvent.fromJson(Map<String, dynamic> json) {
    return NodeFailureEvent(
      errorCode: NodeErrorCode.fromString((json['errorCode'] as String?) ?? ''),
      errorMessage: (json['errorMessage'] as String?) ?? '',
      nodeName: (json['nodeName'] as String?) ?? '',
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final nodeName = this.nodeName;
    final timestamp = this.timestamp;
    return {
      'errorCode': errorCode.value,
      'errorMessage': errorMessage,
      'nodeName': nodeName,
      'timestamp': iso8601ToJson(timestamp),
    };
  }
}

/// Contains information about a failure that occurred at the flow level during
/// a flow execution.
/// <note>
/// Flow executions is in preview release for Amazon Bedrock and is subject to
/// change.
/// </note>
class FlowFailureEvent {
  /// The error code that identifies the type of failure that occurred.
  final FlowErrorCode errorCode;

  /// A descriptive message that provides details about the failure.
  final String errorMessage;

  /// The timestamp when the failure occurred.
  final DateTime timestamp;

  FlowFailureEvent({
    required this.errorCode,
    required this.errorMessage,
    required this.timestamp,
  });

  factory FlowFailureEvent.fromJson(Map<String, dynamic> json) {
    return FlowFailureEvent(
      errorCode: FlowErrorCode.fromString((json['errorCode'] as String?) ?? ''),
      errorMessage: (json['errorMessage'] as String?) ?? '',
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final timestamp = this.timestamp;
    return {
      'errorCode': errorCode.value,
      'errorMessage': errorMessage,
      'timestamp': iso8601ToJson(timestamp),
    };
  }
}

/// Contains information about an action (operation) called by a node during
/// execution.
class NodeActionEvent {
  /// The name of the node that called the operation.
  final String nodeName;

  /// The name of the operation that the node called.
  final String operationName;

  /// The ID of the request that the node made to the operation.
  final String requestId;

  /// The name of the service that the node called.
  final String serviceName;

  /// The date and time that the operation was called.
  final DateTime timestamp;

  /// The request payload sent to the downstream service.
  final Document? operationRequest;

  /// The response payload received from the downstream service.
  final Document? operationResponse;

  NodeActionEvent({
    required this.nodeName,
    required this.operationName,
    required this.requestId,
    required this.serviceName,
    required this.timestamp,
    this.operationRequest,
    this.operationResponse,
  });

  factory NodeActionEvent.fromJson(Map<String, dynamic> json) {
    return NodeActionEvent(
      nodeName: (json['nodeName'] as String?) ?? '',
      operationName: (json['operationName'] as String?) ?? '',
      requestId: (json['requestId'] as String?) ?? '',
      serviceName: (json['serviceName'] as String?) ?? '',
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
      operationRequest: json['operationRequest'] != null
          ? Document.fromJson(json['operationRequest'] as Map<String, dynamic>)
          : null,
      operationResponse: json['operationResponse'] != null
          ? Document.fromJson(json['operationResponse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nodeName = this.nodeName;
    final operationName = this.operationName;
    final requestId = this.requestId;
    final serviceName = this.serviceName;
    final timestamp = this.timestamp;
    final operationRequest = this.operationRequest;
    final operationResponse = this.operationResponse;
    return {
      'nodeName': nodeName,
      'operationName': operationName,
      'requestId': requestId,
      'serviceName': serviceName,
      'timestamp': iso8601ToJson(timestamp),
      if (operationRequest != null) 'operationRequest': operationRequest,
      if (operationResponse != null) 'operationResponse': operationResponse,
    };
  }
}

/// Contains information about an internal trace of a specific node during
/// execution.
class NodeDependencyEvent {
  /// The name of the node that generated the dependency trace.
  final String nodeName;

  /// The date and time that the dependency trace was generated.
  final DateTime timestamp;

  /// The trace elements containing detailed information about the node execution.
  final NodeTraceElements traceElements;

  NodeDependencyEvent({
    required this.nodeName,
    required this.timestamp,
    required this.traceElements,
  });

  factory NodeDependencyEvent.fromJson(Map<String, dynamic> json) {
    return NodeDependencyEvent(
      nodeName: (json['nodeName'] as String?) ?? '',
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
      traceElements: NodeTraceElements.fromJson(
          (json['traceElements'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final nodeName = this.nodeName;
    final timestamp = this.timestamp;
    final traceElements = this.traceElements;
    return {
      'nodeName': nodeName,
      'timestamp': iso8601ToJson(timestamp),
      'traceElements': traceElements,
    };
  }
}

/// Contains trace elements for node execution tracking.
class NodeTraceElements {
  /// Agent trace information for the node execution.
  final List<TracePart>? agentTraces;

  NodeTraceElements({
    this.agentTraces,
  });

  factory NodeTraceElements.fromJson(Map<String, dynamic> json) {
    return NodeTraceElements(
      agentTraces: (json['agentTraces'] as List?)
          ?.nonNulls
          .map((e) => TracePart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentTraces = this.agentTraces;
    return {
      if (agentTraces != null) 'agentTraces': agentTraces,
    };
  }
}

class FlowErrorCode {
  static const validation = FlowErrorCode._('VALIDATION');
  static const internalServer = FlowErrorCode._('INTERNAL_SERVER');
  static const nodeExecutionFailed = FlowErrorCode._('NODE_EXECUTION_FAILED');

  final String value;

  const FlowErrorCode._(this.value);

  static const values = [validation, internalServer, nodeExecutionFailed];

  static FlowErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FlowErrorCode._(value));

  @override
  bool operator ==(other) => other is FlowErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class NodeErrorCode {
  static const validation = NodeErrorCode._('VALIDATION');
  static const dependencyFailed = NodeErrorCode._('DEPENDENCY_FAILED');
  static const badGateway = NodeErrorCode._('BAD_GATEWAY');
  static const internalServer = NodeErrorCode._('INTERNAL_SERVER');

  final String value;

  const NodeErrorCode._(this.value);

  static const values = [
    validation,
    dependencyFailed,
    badGateway,
    internalServer
  ];

  static NodeErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NodeErrorCode._(value));

  @override
  bool operator ==(other) => other is NodeErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a condition that was satisfied during a condition node evaluation
/// in a flow execution.
/// <note>
/// Flow executions is in preview release for Amazon Bedrock and is subject to
/// change.
/// </note>
class SatisfiedCondition {
  /// The name of the condition that was satisfied.
  final String conditionName;

  SatisfiedCondition({
    required this.conditionName,
  });

  factory SatisfiedCondition.fromJson(Map<String, dynamic> json) {
    return SatisfiedCondition(
      conditionName: (json['conditionName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final conditionName = this.conditionName;
    return {
      'conditionName': conditionName,
    };
  }
}

/// Represents an output field produced by a node during a flow execution.
/// <note>
/// Flow executions is in preview release for Amazon Bedrock and is subject to
/// change.
/// </note>
class NodeOutputField {
  /// The content of the output field, which can contain text or structured data.
  final NodeExecutionContent content;

  /// The name of the output field as defined in the node's output schema.
  final String name;

  /// The next node that receives output data from this field.
  final List<NodeOutputNext>? next;

  /// The data type of the output field for compatibility validation.
  final FlowNodeIODataType? type;

  NodeOutputField({
    required this.content,
    required this.name,
    this.next,
    this.type,
  });

  factory NodeOutputField.fromJson(Map<String, dynamic> json) {
    return NodeOutputField(
      content: NodeExecutionContent.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      name: (json['name'] as String?) ?? '',
      next: (json['next'] as List?)
          ?.nonNulls
          .map((e) => NodeOutputNext.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['type'] as String?)?.let(FlowNodeIODataType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final name = this.name;
    final next = this.next;
    final type = this.type;
    return {
      'content': content,
      'name': name,
      if (next != null) 'next': next,
      if (type != null) 'type': type.value,
    };
  }
}

/// Contains the content of a flow node's input or output field for a flow
/// execution.
/// <note>
/// Flow executions is in preview release for Amazon Bedrock and is subject to
/// change.
/// </note>
class NodeExecutionContent {
  /// The document content of the field, which can contain text or structured
  /// data.
  final Document? document;

  NodeExecutionContent({
    this.document,
  });

  factory NodeExecutionContent.fromJson(Map<String, dynamic> json) {
    return NodeExecutionContent(
      document: json['document'] != null
          ? Document.fromJson(json['document'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final document = this.document;
    return {
      if (document != null) 'document': document,
    };
  }
}

/// Represents the next node that receives output data.
class NodeOutputNext {
  /// The name of the input field in the next node that receives the data.
  final String inputFieldName;

  /// The name of the next node that receives the output data.
  final String nodeName;

  NodeOutputNext({
    required this.inputFieldName,
    required this.nodeName,
  });

  factory NodeOutputNext.fromJson(Map<String, dynamic> json) {
    return NodeOutputNext(
      inputFieldName: (json['inputFieldName'] as String?) ?? '',
      nodeName: (json['nodeName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final inputFieldName = this.inputFieldName;
    final nodeName = this.nodeName;
    return {
      'inputFieldName': inputFieldName,
      'nodeName': nodeName,
    };
  }
}

/// Represents an input field provided to a node during a flow execution.
class NodeInputField {
  /// The content of the input field, which can contain text or structured data.
  final NodeExecutionContent content;

  /// The name of the input field as defined in the node's input schema.
  final String name;

  /// The category of the input field.
  final FlowNodeInputCategory? category;

  /// The execution path through nested nodes like iterators and loops.
  final List<NodeInputExecutionChainItem>? executionChain;

  /// The source node that provides input data to this field.
  final NodeInputSource? source;

  /// The data type of the input field for compatibility validation.
  final FlowNodeIODataType? type;

  NodeInputField({
    required this.content,
    required this.name,
    this.category,
    this.executionChain,
    this.source,
    this.type,
  });

  factory NodeInputField.fromJson(Map<String, dynamic> json) {
    return NodeInputField(
      content: NodeExecutionContent.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      name: (json['name'] as String?) ?? '',
      category:
          (json['category'] as String?)?.let(FlowNodeInputCategory.fromString),
      executionChain: (json['executionChain'] as List?)
          ?.nonNulls
          .map((e) =>
              NodeInputExecutionChainItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      source: json['source'] != null
          ? NodeInputSource.fromJson(json['source'] as Map<String, dynamic>)
          : null,
      type: (json['type'] as String?)?.let(FlowNodeIODataType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final name = this.name;
    final category = this.category;
    final executionChain = this.executionChain;
    final source = this.source;
    final type = this.type;
    return {
      'content': content,
      'name': name,
      if (category != null) 'category': category.value,
      if (executionChain != null) 'executionChain': executionChain,
      if (source != null) 'source': source,
      if (type != null) 'type': type.value,
    };
  }
}

/// Represents the source of input data for a node field.
class NodeInputSource {
  /// The expression used to extract data from the source.
  final String expression;

  /// The name of the source node that provides the input data.
  final String nodeName;

  /// The name of the output field from the source node.
  final String outputFieldName;

  NodeInputSource({
    required this.expression,
    required this.nodeName,
    required this.outputFieldName,
  });

  factory NodeInputSource.fromJson(Map<String, dynamic> json) {
    return NodeInputSource(
      expression: (json['expression'] as String?) ?? '',
      nodeName: (json['nodeName'] as String?) ?? '',
      outputFieldName: (json['outputFieldName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final nodeName = this.nodeName;
    final outputFieldName = this.outputFieldName;
    return {
      'expression': expression,
      'nodeName': nodeName,
      'outputFieldName': outputFieldName,
    };
  }
}

/// Represents an item in the execution chain for node input tracking.
class NodeInputExecutionChainItem {
  /// The name of the node in the execution chain.
  final String nodeName;

  /// The type of execution chain item. Supported values are Iterator and Loop.
  final FlowControlNodeType type;

  /// The index position of this item in the execution chain.
  final int? index;

  NodeInputExecutionChainItem({
    required this.nodeName,
    required this.type,
    this.index,
  });

  factory NodeInputExecutionChainItem.fromJson(Map<String, dynamic> json) {
    return NodeInputExecutionChainItem(
      nodeName: (json['nodeName'] as String?) ?? '',
      type: FlowControlNodeType.fromString((json['type'] as String?) ?? ''),
      index: json['index'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final nodeName = this.nodeName;
    final type = this.type;
    final index = this.index;
    return {
      'nodeName': nodeName,
      'type': type.value,
      if (index != null) 'index': index,
    };
  }
}

/// Represents an output field produced by a flow during a flow execution.
/// <note>
/// Flow executions is in preview release for Amazon Bedrock and is subject to
/// change.
/// </note>
class FlowOutputField {
  /// The content of the output field, which can contain text or structured data.
  final FlowExecutionContent content;

  /// The name of the output field as defined in the flow's output schema.
  final String name;

  FlowOutputField({
    required this.content,
    required this.name,
  });

  factory FlowOutputField.fromJson(Map<String, dynamic> json) {
    return FlowOutputField(
      content: FlowExecutionContent.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final name = this.name;
    return {
      'content': content,
      'name': name,
    };
  }
}

/// Contains the content of an flow execution input or output field.
/// <note>
/// Flow executions is in preview release for Amazon Bedrock and is subject to
/// change.
/// </note>
class FlowExecutionContent {
  /// The document content of the field, which can contain text or structured
  /// data.
  final Document? document;

  FlowExecutionContent({
    this.document,
  });

  factory FlowExecutionContent.fromJson(Map<String, dynamic> json) {
    return FlowExecutionContent(
      document: json['document'] != null
          ? Document.fromJson(json['document'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final document = this.document;
    return {
      if (document != null) 'document': document,
    };
  }
}

/// Represents an input field provided to a flow during a flow execution.
/// <note>
/// Flow executions is in preview release for Amazon Bedrock and is subject to
/// change.
/// </note>
class FlowInputField {
  /// The content of the input field, which can contain text or structured data.
  final FlowExecutionContent content;

  /// The name of the input field as defined in the flow's input schema.
  final String name;

  FlowInputField({
    required this.content,
    required this.name,
  });

  factory FlowInputField.fromJson(Map<String, dynamic> json) {
    return FlowInputField(
      content: FlowExecutionContent.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final name = this.name;
    return {
      'content': content,
      'name': name,
    };
  }
}

class FlowExecutionEventType {
  static const node = FlowExecutionEventType._('Node');
  static const flow = FlowExecutionEventType._('Flow');

  final String value;

  const FlowExecutionEventType._(this.value);

  static const values = [node, flow];

  static FlowExecutionEventType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FlowExecutionEventType._(value));

  @override
  bool operator ==(other) =>
      other is FlowExecutionEventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about an error that occurred during an flow execution.
/// <note>
/// Flow executions is in preview release for Amazon Bedrock and is subject to
/// change.
/// </note>
class FlowExecutionError {
  /// The error code for the type of error that occurred.
  final FlowExecutionErrorType? error;

  /// A descriptive message that provides details about the error.
  final String? message;

  /// The name of the node in the flow where the error occurred (if applicable).
  final String? nodeName;

  FlowExecutionError({
    this.error,
    this.message,
    this.nodeName,
  });

  factory FlowExecutionError.fromJson(Map<String, dynamic> json) {
    return FlowExecutionError(
      error: (json['error'] as String?)?.let(FlowExecutionErrorType.fromString),
      message: json['message'] as String?,
      nodeName: json['nodeName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final message = this.message;
    final nodeName = this.nodeName;
    return {
      if (error != null) 'error': error.value,
      if (message != null) 'message': message,
      if (nodeName != null) 'nodeName': nodeName,
    };
  }
}

class FlowExecutionErrorType {
  static const executionTimedOut =
      FlowExecutionErrorType._('ExecutionTimedOut');

  final String value;

  const FlowExecutionErrorType._(this.value);

  static const values = [executionTimedOut];

  static FlowExecutionErrorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FlowExecutionErrorType._(value));

  @override
  bool operator ==(other) =>
      other is FlowExecutionErrorType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(message: message),
  'BadGatewayException': (type, message) =>
      BadGatewayException(message: message),
  'ConflictException': (type, message) => ConflictException(message: message),
  'DependencyFailedException': (type, message) =>
      DependencyFailedException(message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(message: message),
  'ModelNotReadyException': (type, message) =>
      ModelNotReadyException(message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(message: message),
  'ValidationException': (type, message) =>
      ValidationException(message: message),
};
