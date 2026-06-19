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

/// Welcome to the Amazon Bedrock AgentCore Data Plane API reference. Data Plane
/// actions process and handle data or workloads within Amazon Web Services
/// services.
class BedrockAgentCore {
  final _s.RestJsonProtocol _protocol;
  BedrockAgentCore({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'bedrock-agentcore',
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

  /// Confirms the user authentication session for obtaining OAuth2.0 tokens for
  /// a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sessionUri] :
  /// Unique identifier for the user's authentication session for retrieving
  /// OAuth2 tokens. This ID tracks the authorization flow state across multiple
  /// requests and responses during the OAuth2 authentication process.
  ///
  /// Parameter [userIdentifier] :
  /// The OAuth2.0 token or user ID that was used to generate the workload
  /// access token used for initiating the user authorization flow to retrieve
  /// OAuth2.0 tokens.
  Future<void> completeResourceTokenAuth({
    required String sessionUri,
    required UserIdentifier userIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'sessionUri': sessionUri,
      'userIdentifier': userIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/identities/CompleteResourceTokenAuth',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the API key associated with an API key credential provider.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceCredentialProviderName] :
  /// The credential provider name for the resource from which you are
  /// retrieving the API key.
  ///
  /// Parameter [workloadIdentityToken] :
  /// The identity token of the workload from which you want to retrieve the API
  /// key.
  Future<GetResourceApiKeyResponse> getResourceApiKey({
    required String resourceCredentialProviderName,
    required String workloadIdentityToken,
  }) async {
    final $payload = <String, dynamic>{
      'resourceCredentialProviderName': resourceCredentialProviderName,
      'workloadIdentityToken': workloadIdentityToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/identities/api-key',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourceApiKeyResponse.fromJson(response);
  }

  /// Returns the OAuth 2.0 token of the provided resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [oauth2Flow] :
  /// The type of flow to be performed.
  ///
  /// Parameter [resourceCredentialProviderName] :
  /// The name of the resource's credential provider.
  ///
  /// Parameter [scopes] :
  /// The OAuth scopes being requested.
  ///
  /// Parameter [workloadIdentityToken] :
  /// The identity token of the workload from which you want to retrieve the
  /// OAuth2 token.
  ///
  /// Parameter [audiences] :
  /// The audiences to include in the token request. These are used to specify
  /// the intended recipients of the OAuth2 token.
  ///
  /// Parameter [customParameters] :
  /// A map of custom parameters to include in the authorization request to the
  /// resource credential provider. These parameters are in addition to the
  /// standard OAuth 2.0 flow parameters, and will not override them.
  ///
  /// Parameter [customState] :
  /// An opaque string that will be sent back to the callback URL provided in
  /// resourceOauth2ReturnUrl. This state should be used to protect the callback
  /// URL of your application against CSRF attacks by ensuring the response
  /// corresponds to the original request.
  ///
  /// Parameter [forceAuthentication] :
  /// Indicates whether to always initiate a new three-legged OAuth (3LO) flow,
  /// regardless of any existing session.
  ///
  /// Parameter [resourceOauth2ReturnUrl] :
  /// The callback URL to redirect to after the OAuth 2.0 token retrieval is
  /// complete. This URL must be one of the provided URLs configured for the
  /// workload identity.
  ///
  /// Parameter [resources] :
  /// The resources to include in the token request. These are used to specify
  /// the target resources for which the OAuth2 token is being requested.
  ///
  /// Parameter [sessionUri] :
  /// Unique identifier for the user's authentication session for retrieving
  /// OAuth2 tokens. This ID tracks the authorization flow state across multiple
  /// requests and responses during the OAuth2 authentication process.
  Future<GetResourceOauth2TokenResponse> getResourceOauth2Token({
    required Oauth2FlowType oauth2Flow,
    required String resourceCredentialProviderName,
    required List<String> scopes,
    required String workloadIdentityToken,
    List<String>? audiences,
    Map<String, String>? customParameters,
    String? customState,
    bool? forceAuthentication,
    String? resourceOauth2ReturnUrl,
    List<String>? resources,
    String? sessionUri,
  }) async {
    final $payload = <String, dynamic>{
      'oauth2Flow': oauth2Flow.value,
      'resourceCredentialProviderName': resourceCredentialProviderName,
      'scopes': scopes,
      'workloadIdentityToken': workloadIdentityToken,
      if (audiences != null) 'audiences': audiences,
      if (customParameters != null) 'customParameters': customParameters,
      if (customState != null) 'customState': customState,
      if (forceAuthentication != null)
        'forceAuthentication': forceAuthentication,
      if (resourceOauth2ReturnUrl != null)
        'resourceOauth2ReturnUrl': resourceOauth2ReturnUrl,
      if (resources != null) 'resources': resources,
      if (sessionUri != null) 'sessionUri': sessionUri,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/identities/oauth2/token',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourceOauth2TokenResponse.fromJson(response);
  }

  /// Generates authentication tokens for payment providers that use
  /// vendor-specific authentication mechanisms.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [paymentTokenRequest] :
  /// Vendor-specific token request input. Contains all request parameters in a
  /// type-safe, vendor-specific structure.
  ///
  /// Parameter [resourceCredentialProviderName] :
  /// Name of the payment credential provider to use.
  ///
  /// Parameter [workloadIdentityToken] :
  /// Workload access token for authorization.
  Future<GetResourcePaymentTokenResponse> getResourcePaymentToken({
    required PaymentTokenRequestInput paymentTokenRequest,
    required String resourceCredentialProviderName,
    required String workloadIdentityToken,
  }) async {
    final $payload = <String, dynamic>{
      'paymentTokenRequest': paymentTokenRequest,
      'resourceCredentialProviderName': resourceCredentialProviderName,
      'workloadIdentityToken': workloadIdentityToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/identities/payment/token',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourcePaymentTokenResponse.fromJson(response);
  }

  /// Obtains a workload access token for agentic workloads not acting on behalf
  /// of a user.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workloadName] :
  /// The unique identifier for the registered workload.
  Future<GetWorkloadAccessTokenResponse> getWorkloadAccessToken({
    required String workloadName,
  }) async {
    final $payload = <String, dynamic>{
      'workloadName': workloadName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/identities/GetWorkloadAccessToken',
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkloadAccessTokenResponse.fromJson(response);
  }

  /// Obtains a workload access token for agentic workloads acting on behalf of
  /// a user, using a JWT token.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [userToken] :
  /// The OAuth 2.0 token issued by the user's identity provider.
  ///
  /// Parameter [workloadName] :
  /// The unique identifier for the registered workload.
  Future<GetWorkloadAccessTokenForJWTResponse> getWorkloadAccessTokenForJWT({
    required String userToken,
    required String workloadName,
  }) async {
    final $payload = <String, dynamic>{
      'userToken': userToken,
      'workloadName': workloadName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/identities/GetWorkloadAccessTokenForJWT',
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkloadAccessTokenForJWTResponse.fromJson(response);
  }

  /// Obtains a workload access token for agentic workloads acting on behalf of
  /// a user, using the user's ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [userId] :
  /// The ID of the user for whom you are retrieving the access token.
  ///
  /// Parameter [workloadName] :
  /// The name of the workload from which you want to retrieve the access token.
  Future<GetWorkloadAccessTokenForUserIdResponse>
      getWorkloadAccessTokenForUserId({
    required String userId,
    required String workloadName,
  }) async {
    final $payload = <String, dynamic>{
      'userId': userId,
      'workloadName': workloadName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/identities/GetWorkloadAccessTokenForUserId',
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkloadAccessTokenForUserIdResponse.fromJson(response);
  }

  /// Executes code within an active code interpreter session in Amazon Bedrock
  /// AgentCore. This operation processes the provided code, runs it in a secure
  /// environment, and returns the execution results including output, errors,
  /// and generated visualizations.
  ///
  /// To execute code, you must specify the code interpreter identifier, session
  /// ID, and the code to run in the arguments parameter. The operation returns
  /// a stream containing the execution results, which can include text output,
  /// error messages, and data visualizations.
  ///
  /// This operation is subject to request rate limiting based on your account's
  /// service quotas.
  ///
  /// The following operations are related to
  /// <code>InvokeCodeInterpreter</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_StartCodeInterpreterSession.html">StartCodeInterpreterSession</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_GetCodeInterpreterSession.html">GetCodeInterpreterSession</a>
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
  /// Parameter [codeInterpreterIdentifier] :
  /// The unique identifier of the code interpreter associated with the session.
  /// This must match the identifier used when creating the session with
  /// <code>StartCodeInterpreterSession</code>.
  ///
  /// Parameter [name] :
  /// The name of the code interpreter to invoke.
  ///
  /// Parameter [arguments] :
  /// The arguments for the code interpreter. This includes the code to execute
  /// and any additional parameters such as the programming language, whether to
  /// clear the execution context, and other execution options. The structure of
  /// this parameter depends on the specific code interpreter being used.
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the code interpreter session to use. This must be
  /// an active session created with <code>StartCodeInterpreterSession</code>.
  /// If the session has expired or been stopped, the request will fail.
  ///
  /// Parameter [traceId] :
  /// The trace identifier for request tracking.
  ///
  /// Parameter [traceParent] :
  /// The parent trace information for distributed tracing.
  Future<InvokeCodeInterpreterResponse> invokeCodeInterpreter({
    required String codeInterpreterIdentifier,
    required ToolName name,
    ToolArguments? arguments,
    String? sessionId,
    String? traceId,
    String? traceParent,
  }) async {
    final headers = <String, String>{
      if (sessionId != null)
        'x-amzn-code-interpreter-session-id': sessionId.toString(),
      if (traceId != null) 'X-Amzn-Trace-Id': traceId.toString(),
      if (traceParent != null) 'traceparent': traceParent.toString(),
    };
    final $payload = <String, dynamic>{
      'name': name.value,
      if (arguments != null) 'arguments': arguments,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/code-interpreters/${Uri.encodeComponent(codeInterpreterIdentifier)}/tools/invoke',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return InvokeCodeInterpreterResponse(
      stream: CodeInterpreterStreamOutput.fromJson($json),
      sessionId: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-code-interpreter-session-id'),
    );
  }

  /// Operation to invoke a Harness.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RuntimeClientError].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [harnessArn] :
  /// The ARN of the harness to invoke.
  ///
  /// Parameter [messages] :
  /// The messages to send to the agent.
  ///
  /// Parameter [runtimeSessionId] :
  /// The session ID for the invocation. Use the same session ID across requests
  /// to continue a conversation.
  ///
  /// Parameter [actorId] :
  /// The actor ID for memory operations. Overrides the actor ID configured on
  /// the harness.
  ///
  /// Parameter [allowedTools] :
  /// The tools that the agent is allowed to use for this invocation. If
  /// specified, overrides the harness default.
  ///
  /// Parameter [maxIterations] :
  /// The maximum number of iterations the agent loop can execute. If specified,
  /// overrides the harness default.
  ///
  /// Parameter [maxTokens] :
  /// The maximum number of tokens the agent can generate per iteration. If
  /// specified, overrides the harness default.
  ///
  /// Parameter [model] :
  /// The model configuration to use for this invocation. If specified,
  /// overrides the harness default.
  ///
  /// Parameter [runtimeUserId] :
  /// An identifier for the end user making the request. This value is passed
  /// through to the runtime container.
  ///
  /// Parameter [skills] :
  /// The skills available to the agent for this invocation. If specified,
  /// overrides the harness default.
  ///
  /// Parameter [systemPrompt] :
  /// The system prompt to use for this invocation. If specified, overrides the
  /// harness default.
  ///
  /// Parameter [timeoutSeconds] :
  /// The maximum duration in seconds for the agent loop execution. If
  /// specified, overrides the harness default.
  ///
  /// Parameter [tools] :
  /// The tools available to the agent for this invocation. If specified,
  /// overrides the harness default.
  Future<InvokeHarnessResponse> invokeHarness({
    required String harnessArn,
    required List<HarnessMessage> messages,
    required String runtimeSessionId,
    String? actorId,
    List<String>? allowedTools,
    int? maxIterations,
    int? maxTokens,
    HarnessModelConfiguration? model,
    String? runtimeUserId,
    List<HarnessSkill>? skills,
    List<HarnessSystemContentBlock>? systemPrompt,
    int? timeoutSeconds,
    List<HarnessTool>? tools,
  }) async {
    final headers = <String, String>{
      'X-Amzn-Bedrock-AgentCore-Runtime-Session-Id':
          runtimeSessionId.toString(),
      if (runtimeUserId != null)
        'X-Amzn-Bedrock-AgentCore-Runtime-User-Id': runtimeUserId.toString(),
    };
    final $query = <String, List<String>>{
      'harnessArn': [harnessArn],
    };
    final $payload = <String, dynamic>{
      'messages': messages,
      if (actorId != null) 'actorId': actorId,
      if (allowedTools != null) 'allowedTools': allowedTools,
      if (maxIterations != null) 'maxIterations': maxIterations,
      if (maxTokens != null) 'maxTokens': maxTokens,
      if (model != null) 'model': model,
      if (skills != null) 'skills': skills,
      if (systemPrompt != null) 'systemPrompt': systemPrompt,
      if (timeoutSeconds != null) 'timeoutSeconds': timeoutSeconds,
      if (tools != null) 'tools': tools,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/harnesses/invoke',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return InvokeHarnessResponse(
      stream: InvokeHarnessStreamOutput.fromJson($json),
    );
  }

  /// Retrieves the A2A agent card associated with an AgentCore Runtime agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RuntimeClientError].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentRuntimeArn] :
  /// The ARN of the AgentCore Runtime agent for which you want to get the A2A
  /// agent card.
  ///
  /// Parameter [qualifier] :
  /// Optional qualifier to specify an agent alias, such as
  /// <code>prod</code>code&gt; or <code>dev</code>. If you don't provide a
  /// value, the DEFAULT alias is used.
  ///
  /// Parameter [runtimeSessionId] :
  /// The session ID that the AgentCore Runtime agent is using.
  Future<GetAgentCardResponse> getAgentCard({
    required String agentRuntimeArn,
    String? qualifier,
    String? runtimeSessionId,
  }) async {
    final headers = <String, String>{
      if (runtimeSessionId != null)
        'X-Amzn-Bedrock-AgentCore-Runtime-Session-Id':
            runtimeSessionId.toString(),
    };
    final $query = <String, List<String>>{
      if (qualifier != null) 'qualifier': [qualifier],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/runtimes/${Uri.encodeComponent(agentRuntimeArn)}/invocations/.well-known/agent-card.json',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetAgentCardResponse(
      agentCard: $json,
      runtimeSessionId: _s.extractHeaderStringValue(
          response.headers, 'X-Amzn-Bedrock-AgentCore-Runtime-Session-Id'),
      statusCode: response.statusCode,
    );
  }

  /// Sends a request to an agent or tool hosted in an Amazon Bedrock AgentCore
  /// Runtime and receives responses in real-time.
  ///
  /// To invoke an agent, you can specify either the AgentCore Runtime ARN or
  /// the agent ID with an account ID, and provide a payload containing your
  /// request. When you use the agent ID instead of the full ARN, you don't need
  /// to URL-encode the identifier. You can optionally specify a qualifier to
  /// target a specific endpoint of the agent.
  ///
  /// This operation supports streaming responses, allowing you to receive
  /// partial responses as they become available. We recommend using pagination
  /// to ensure that the operation returns quickly and successfully when
  /// processing large responses.
  ///
  /// For example code, see <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/runtime-invoke-agent.html">Invoke
  /// an AgentCore Runtime agent</a>.
  ///
  /// If you're integrating your agent with OAuth, you can't use the Amazon Web
  /// Services SDK to call <code>InvokeAgentRuntime</code>. Instead, make a
  /// HTTPS request to <code>InvokeAgentRuntime</code>. For an example, see <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/runtime-oauth.html">Authenticate
  /// and authorize with Inbound Auth and Outbound Auth</a>.
  ///
  /// To use this operation, you must have the
  /// <code>bedrock-agentcore:InvokeAgentRuntime</code> permission. If you are
  /// making a call to <code>InvokeAgentRuntime</code> on behalf of a user ID
  /// with the <code>X-Amzn-Bedrock-AgentCore-Runtime-User-Id</code> header, You
  /// require permissions to both actions
  /// (<code>bedrock-agentcore:InvokeAgentRuntime</code> and
  /// <code>bedrock-agentcore:InvokeAgentRuntimeForUser</code>).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RetryableConflictException].
  /// May throw [RuntimeClientError].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentRuntimeArn] :
  /// The identifier of the agent runtime to invoke. You can specify either the
  /// full Amazon Web Services Resource Name (ARN) or the agent ID. If you use
  /// the agent ID, you must also provide the <code>accountId</code> query
  /// parameter.
  ///
  /// Parameter [payload] :
  /// The input data to send to the agent runtime. The format of this data
  /// depends on the specific agent configuration and must match the specified
  /// content type. For most agents, this is a JSON object containing the user's
  /// request.
  ///
  /// Parameter [accept] :
  /// The desired MIME type for the response from the agent runtime. This tells
  /// the agent runtime what format to use for the response data. Common values
  /// include application/json for JSON data.
  ///
  /// Parameter [accountId] :
  /// The identifier of the Amazon Web Services account for the agent runtime
  /// resource. This parameter is required when you specify an agent ID instead
  /// of the full ARN for <code>agentRuntimeArn</code>.
  ///
  /// Parameter [baggage] :
  /// Additional context information for distributed tracing.
  ///
  /// Parameter [contentType] :
  /// The MIME type of the input data in the payload. This tells the agent
  /// runtime how to interpret the payload data. Common values include
  /// application/json for JSON data.
  ///
  /// Parameter [mcpProtocolVersion] :
  /// The version of the MCP protocol being used.
  ///
  /// Parameter [mcpSessionId] :
  /// The identifier of the MCP session.
  ///
  /// Parameter [qualifier] :
  /// The qualifier to use for the agent runtime. This is an endpoint name that
  /// points to a specific version. If not specified, Amazon Bedrock AgentCore
  /// uses the default endpoint of the agent runtime.
  ///
  /// Parameter [runtimeSessionId] :
  /// The identifier of the runtime session.
  ///
  /// Parameter [runtimeUserId] :
  /// The identifier of the runtime user.
  ///
  /// Parameter [traceId] :
  /// The trace identifier for request tracking.
  ///
  /// Parameter [traceParent] :
  /// The parent trace information for distributed tracing.
  ///
  /// Parameter [traceState] :
  /// The trace state information for distributed tracing.
  Future<InvokeAgentRuntimeResponse> invokeAgentRuntime({
    required String agentRuntimeArn,
    required Uint8List payload,
    String? accept,
    String? accountId,
    String? baggage,
    String? contentType,
    String? mcpProtocolVersion,
    String? mcpSessionId,
    String? qualifier,
    String? runtimeSessionId,
    String? runtimeUserId,
    String? traceId,
    String? traceParent,
    String? traceState,
  }) async {
    final headers = <String, String>{
      if (accept != null) 'Accept': accept.toString(),
      if (baggage != null) 'baggage': baggage.toString(),
      if (contentType != null) 'Content-Type': contentType.toString(),
      if (mcpProtocolVersion != null)
        'Mcp-Protocol-Version': mcpProtocolVersion.toString(),
      if (mcpSessionId != null) 'Mcp-Session-Id': mcpSessionId.toString(),
      if (runtimeSessionId != null)
        'X-Amzn-Bedrock-AgentCore-Runtime-Session-Id':
            runtimeSessionId.toString(),
      if (runtimeUserId != null)
        'X-Amzn-Bedrock-AgentCore-Runtime-User-Id': runtimeUserId.toString(),
      if (traceId != null) 'X-Amzn-Trace-Id': traceId.toString(),
      if (traceParent != null) 'traceparent': traceParent.toString(),
      if (traceState != null) 'tracestate': traceState.toString(),
    };
    final $query = <String, List<String>>{
      if (accountId != null) 'accountId': [accountId],
      if (qualifier != null) 'qualifier': [qualifier],
    };
    final response = await _protocol.sendRaw(
      payload: payload,
      method: 'POST',
      requestUri:
          '/runtimes/${Uri.encodeComponent(agentRuntimeArn)}/invocations',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return InvokeAgentRuntimeResponse(
      response: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type')!,
      baggage: _s.extractHeaderStringValue(response.headers, 'baggage'),
      mcpProtocolVersion:
          _s.extractHeaderStringValue(response.headers, 'Mcp-Protocol-Version'),
      mcpSessionId:
          _s.extractHeaderStringValue(response.headers, 'Mcp-Session-Id'),
      runtimeSessionId: _s.extractHeaderStringValue(
          response.headers, 'X-Amzn-Bedrock-AgentCore-Runtime-Session-Id'),
      traceId: _s.extractHeaderStringValue(response.headers, 'X-Amzn-Trace-Id'),
      traceParent: _s.extractHeaderStringValue(response.headers, 'traceparent'),
      traceState: _s.extractHeaderStringValue(response.headers, 'tracestate'),
      statusCode: response.statusCode,
    );
  }

  /// Executes a command in a runtime session container and streams the output
  /// back to the caller. This operation allows you to run shell commands within
  /// the agent runtime environment and receive real-time streaming responses
  /// including standard output and standard error.
  ///
  /// To invoke a command, you must specify the agent runtime ARN and a runtime
  /// session ID. The command execution supports streaming responses, allowing
  /// you to receive output as it becomes available through
  /// <code>contentStart</code>, <code>contentDelta</code>, and
  /// <code>contentStop</code> events.
  ///
  /// To use this operation, you must have the
  /// <code>bedrock-agentcore:InvokeAgentRuntimeCommand</code> permission.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RuntimeClientError].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentRuntimeArn] :
  /// The Amazon Resource Name (ARN) of the agent runtime on which to execute
  /// the command. This identifies the specific agent runtime environment where
  /// the command will run.
  ///
  /// Parameter [body] :
  /// The request body containing the command to execute and optional
  /// configuration parameters such as timeout settings.
  ///
  /// Parameter [accept] :
  /// The desired MIME type for the response from the agent runtime command.
  /// This tells the agent runtime what format to use for the response data.
  /// Common values include application/json for JSON data.
  ///
  /// Parameter [accountId] :
  /// The identifier of the Amazon Web Services account for the agent runtime
  /// resource. This parameter is required when you specify an agent ID instead
  /// of the full ARN for <code>agentRuntimeArn</code>.
  ///
  /// Parameter [baggage] :
  /// Additional context information for distributed tracing.
  ///
  /// Parameter [contentType] :
  /// The MIME type of the input data in the request payload. This tells the
  /// agent runtime how to interpret the payload data. Common values include
  /// application/json for JSON data.
  ///
  /// Parameter [qualifier] :
  /// The qualifier to use for the agent runtime. This is an endpoint name that
  /// points to a specific version. If not specified, Amazon Bedrock AgentCore
  /// uses the default endpoint of the agent runtime.
  ///
  /// Parameter [runtimeSessionId] :
  /// The unique identifier of the runtime session in which to execute the
  /// command. This session ID is used to maintain state and context across
  /// multiple command invocations.
  ///
  /// Parameter [traceId] :
  /// The trace identifier for request tracking.
  ///
  /// Parameter [traceParent] :
  /// The parent trace information for distributed tracing.
  ///
  /// Parameter [traceState] :
  /// The trace state information for distributed tracing.
  Future<InvokeAgentRuntimeCommandResponse> invokeAgentRuntimeCommand({
    required String agentRuntimeArn,
    required InvokeAgentRuntimeCommandRequestBody body,
    String? accept,
    String? accountId,
    String? baggage,
    String? contentType,
    String? qualifier,
    String? runtimeSessionId,
    String? traceId,
    String? traceParent,
    String? traceState,
  }) async {
    final headers = <String, String>{
      if (accept != null) 'Accept': accept.toString(),
      if (baggage != null) 'baggage': baggage.toString(),
      if (contentType != null) 'Content-Type': contentType.toString(),
      if (runtimeSessionId != null)
        'X-Amzn-Bedrock-AgentCore-Runtime-Session-Id':
            runtimeSessionId.toString(),
      if (traceId != null) 'X-Amzn-Trace-Id': traceId.toString(),
      if (traceParent != null) 'traceparent': traceParent.toString(),
      if (traceState != null) 'tracestate': traceState.toString(),
    };
    final $query = <String, List<String>>{
      if (accountId != null) 'accountId': [accountId],
      if (qualifier != null) 'qualifier': [qualifier],
    };
    final response = await _protocol.sendRaw(
      payload: body,
      method: 'POST',
      requestUri: '/runtimes/${Uri.encodeComponent(agentRuntimeArn)}/commands',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return InvokeAgentRuntimeCommandResponse(
      stream: InvokeAgentRuntimeCommandStreamOutput.fromJson($json),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type')!,
      baggage: _s.extractHeaderStringValue(response.headers, 'baggage'),
      runtimeSessionId: _s.extractHeaderStringValue(
          response.headers, 'X-Amzn-Bedrock-AgentCore-Runtime-Session-Id'),
      traceId: _s.extractHeaderStringValue(response.headers, 'X-Amzn-Trace-Id'),
      traceParent: _s.extractHeaderStringValue(response.headers, 'traceparent'),
      traceState: _s.extractHeaderStringValue(response.headers, 'tracestate'),
      statusCode: response.statusCode,
    );
  }

  /// Stops a session that is running in an running AgentCore Runtime agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RetryableConflictException].
  /// May throw [RuntimeClientError].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentRuntimeArn] :
  /// The ARN of the agent that contains the session that you want to stop.
  ///
  /// Parameter [runtimeSessionId] :
  /// The ID of the session that you want to stop.
  ///
  /// Parameter [clientToken] :
  /// Idempotent token used to identify the request. If you use the same token
  /// with multiple requests, the same response is returned. Use ClientToken to
  /// prevent the same request from being processed more than once.
  ///
  /// Parameter [qualifier] :
  /// Optional qualifier to specify an agent alias, such as
  /// <code>prod</code>code&gt; or <code>dev</code>. If you don't provide a
  /// value, the DEFAULT alias is used.
  Future<StopRuntimeSessionResponse> stopRuntimeSession({
    required String agentRuntimeArn,
    required String runtimeSessionId,
    String? clientToken,
    String? qualifier,
  }) async {
    final headers = <String, String>{
      'X-Amzn-Bedrock-AgentCore-Runtime-Session-Id':
          runtimeSessionId.toString(),
    };
    final $query = <String, List<String>>{
      if (qualifier != null) 'qualifier': [qualifier],
    };
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/runtimes/${Uri.encodeComponent(agentRuntimeArn)}/stopruntimesession',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return StopRuntimeSessionResponse(
      runtimeSessionId: _s.extractHeaderStringValue(
          response.headers, 'X-Amzn-Bedrock-AgentCore-Runtime-Session-Id'),
      statusCode: response.statusCode,
    );
  }

  /// Saves the current state of a browser session as a reusable profile in
  /// Amazon Bedrock AgentCore. A browser profile captures persistent browser
  /// data such as cookies and local storage from an active session, enabling
  /// you to reuse this data in future browser sessions.
  ///
  /// To save a browser session profile, you must specify the profile
  /// identifier, browser identifier, and session ID. The session must be active
  /// when saving the profile. Once saved, the profile can be used with the
  /// <code>StartBrowserSession</code> operation to initialize new sessions with
  /// the stored browser state.
  ///
  /// Browser profiles are useful for scenarios that require persistent
  /// authentication, maintaining user preferences across sessions, or
  /// continuing tasks that depend on previously stored browser data.
  ///
  /// The following operations are related to
  /// <code>SaveBrowserSessionProfile</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_StartBrowserSession.html">StartBrowserSession</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_GetBrowserSession.html">GetBrowserSession</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [browserIdentifier] :
  /// The unique identifier of the browser associated with the session from
  /// which to save the profile.
  ///
  /// Parameter [profileIdentifier] :
  /// The unique identifier for the browser profile. This identifier is used to
  /// reference the profile when starting new browser sessions. The identifier
  /// must follow the pattern of an alphanumeric name (up to 48 characters)
  /// followed by a hyphen and a 10-character alphanumeric suffix.
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the browser session from which to save the
  /// profile. The session must be active when saving the profile.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock AgentCore ignores the request, but does not return an
  /// error.
  ///
  /// Parameter [traceId] :
  /// The trace identifier for request tracking.
  ///
  /// Parameter [traceParent] :
  /// The parent trace information for distributed tracing.
  Future<SaveBrowserSessionProfileResponse> saveBrowserSessionProfile({
    required String browserIdentifier,
    required String profileIdentifier,
    required String sessionId,
    String? clientToken,
    String? traceId,
    String? traceParent,
  }) async {
    final headers = <String, String>{
      if (traceId != null) 'X-Amzn-Trace-Id': traceId.toString(),
      if (traceParent != null) 'traceparent': traceParent.toString(),
    };
    final $payload = <String, dynamic>{
      'browserIdentifier': browserIdentifier,
      'sessionId': sessionId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/browser-profiles/${Uri.encodeComponent(profileIdentifier)}/save',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return SaveBrowserSessionProfileResponse.fromJson(response);
  }

  /// Retrieves detailed information about a specific browser session in Amazon
  /// Bedrock AgentCore. This operation returns the session's configuration,
  /// current status, associated streams, and metadata.
  ///
  /// To get a browser session, you must specify both the browser identifier and
  /// the session ID. The response includes information about the session's
  /// viewport configuration, timeout settings, and stream endpoints.
  ///
  /// The following operations are related to <code>GetBrowserSession</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_StartBrowserSession.html">StartBrowserSession</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_ListBrowserSessions.html">ListBrowserSessions</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_StopBrowserSession.html">StopBrowserSession</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [browserIdentifier] :
  /// The unique identifier of the browser associated with the session.
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the browser session to retrieve.
  Future<GetBrowserSessionResponse> getBrowserSession({
    required String browserIdentifier,
    required String sessionId,
  }) async {
    final $query = <String, List<String>>{
      'sessionId': [sessionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/browsers/${Uri.encodeComponent(browserIdentifier)}/sessions/get',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetBrowserSessionResponse.fromJson(response);
  }

  /// Invokes an operating system-level action on a browser session in Amazon
  /// Bedrock AgentCore. This operation provides direct OS-level control over
  /// browser sessions, enabling mouse actions, keyboard input, and screenshots
  /// that the WebSocket-based Chrome DevTools Protocol (CDP) cannot handle —
  /// such as interacting with print dialogs, context menus, and JavaScript
  /// alerts.
  ///
  /// You send a request with exactly one action in the
  /// <code>BrowserAction</code> union, and receive a corresponding result in
  /// the <code>BrowserActionResult</code> union.
  ///
  /// The following operations are related to <code>InvokeBrowser</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_StartBrowserSession.html">StartBrowserSession</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_GetBrowserSession.html">GetBrowserSession</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_StopBrowserSession.html">StopBrowserSession</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [action] :
  /// The browser action to perform. Exactly one member of the
  /// <code>BrowserAction</code> union must be set per request.
  ///
  /// Parameter [browserIdentifier] :
  /// The unique identifier of the browser associated with the session. This
  /// must match the identifier used when creating the session with
  /// <code>StartBrowserSession</code>.
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the browser session on which to perform the
  /// action. This must be an active session created with
  /// <code>StartBrowserSession</code>.
  Future<InvokeBrowserResponse> invokeBrowser({
    required BrowserAction action,
    required String browserIdentifier,
    required String sessionId,
  }) async {
    final headers = <String, String>{
      'x-amzn-browser-session-id': sessionId.toString(),
    };
    final $payload = <String, dynamic>{
      'action': action,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/browsers/${Uri.encodeComponent(browserIdentifier)}/sessions/invoke',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return InvokeBrowserResponse(
      result: BrowserActionResult.fromJson(
          ($json['result'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      sessionId: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-browser-session-id')!,
    );
  }

  /// Retrieves a list of browser sessions in Amazon Bedrock AgentCore that
  /// match the specified criteria. This operation returns summary information
  /// about each session, including identifiers, status, and timestamps.
  ///
  /// You can filter the results by browser identifier and session status. The
  /// operation supports pagination to handle large result sets efficiently.
  ///
  /// We recommend using pagination to ensure that the operation returns quickly
  /// and successfully when retrieving large numbers of sessions.
  ///
  /// The following operations are related to <code>ListBrowserSessions</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_StartBrowserSession.html">StartBrowserSession</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_GetBrowserSession.html">GetBrowserSession</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [browserIdentifier] :
  /// The unique identifier of the browser to list sessions for. If specified,
  /// only sessions for this browser are returned. If not specified, sessions
  /// for all browsers are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. The default
  /// value is 10. Valid values range from 1 to 100. To retrieve the remaining
  /// results, make another call with the returned <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  /// If not specified, Amazon Bedrock AgentCore returns the first page of
  /// results.
  ///
  /// Parameter [status] :
  /// The status of the browser sessions to list. Valid values include ACTIVE,
  /// STOPPING, and STOPPED. If not specified, sessions with any status are
  /// returned.
  Future<ListBrowserSessionsResponse> listBrowserSessions({
    required String browserIdentifier,
    int? maxResults,
    String? nextToken,
    BrowserSessionStatus? status,
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
      if (status != null) 'status': status.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/browsers/${Uri.encodeComponent(browserIdentifier)}/sessions/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListBrowserSessionsResponse.fromJson(response);
  }

  /// Creates and initializes a browser session in Amazon Bedrock AgentCore. The
  /// session enables agents to navigate and interact with web content, extract
  /// information from websites, and perform web-based tasks as part of their
  /// response generation.
  ///
  /// To create a session, you must specify a browser identifier and a name. You
  /// can also configure the viewport dimensions to control the visible area of
  /// web content. The session remains active until it times out or you
  /// explicitly stop it using the <code>StopBrowserSession</code> operation.
  ///
  /// The following operations are related to <code>StartBrowserSession</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_GetBrowserSession.html">GetBrowserSession</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_UpdateBrowserStream.html">UpdateBrowserStream</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_SaveBrowserSessionProfile.html">SaveBrowserSessionProfile</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_StopBrowserSession.html">StopBrowserSession</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_InvokeBrowser.html">InvokeBrowser</a>
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
  /// Parameter [browserIdentifier] :
  /// The unique identifier of the browser to use for this session. This
  /// identifier specifies which browser environment to initialize for the
  /// session.
  ///
  /// Parameter [certificates] :
  /// A list of certificates to install in the browser session.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock AgentCore ignores the request, but does not return an
  /// error. This parameter helps prevent the creation of duplicate sessions if
  /// there are temporary network issues.
  ///
  /// Parameter [enterprisePolicies] :
  /// A list of files containing enterprise policies for the browser.
  ///
  /// Parameter [extensions] :
  /// A list of browser extensions to load into the browser session.
  ///
  /// Parameter [name] :
  /// The name of the browser session. This name helps you identify and manage
  /// the session. The name does not need to be unique.
  ///
  /// Parameter [profileConfiguration] :
  /// The browser profile configuration to use for this session. A browser
  /// profile contains persistent data such as cookies and local storage that
  /// can be reused across multiple browser sessions. If specified, the session
  /// initializes with the profile's stored data, enabling continuity for tasks
  /// that require authentication or personalized settings.
  ///
  /// Parameter [proxyConfiguration] :
  /// Optional proxy configuration for routing browser traffic through
  /// customer-specified proxy servers. When provided, enables HTTP Basic
  /// authentication via Amazon Web Services Secrets Manager and domain-based
  /// routing rules. Requires <code>secretsmanager:GetSecretValue</code> IAM
  /// permission for the specified secret ARNs.
  ///
  /// Parameter [sessionTimeoutSeconds] :
  /// The duration in seconds (time-to-live) after which the session
  /// automatically terminates, regardless of ongoing activity. Defaults to 3600
  /// seconds (1 hour). Recommended minimum: 60 seconds. Maximum allowed: 28,800
  /// seconds (8 hours).
  ///
  /// Parameter [traceId] :
  /// The trace identifier for request tracking.
  ///
  /// Parameter [traceParent] :
  /// The parent trace information for distributed tracing.
  ///
  /// Parameter [viewPort] :
  /// The dimensions of the browser viewport for this session. This determines
  /// the visible area of the web content and affects how web pages are
  /// rendered. If not specified, Amazon Bedrock AgentCore uses a default
  /// viewport size.
  Future<StartBrowserSessionResponse> startBrowserSession({
    required String browserIdentifier,
    List<Certificate>? certificates,
    String? clientToken,
    List<BrowserEnterprisePolicy>? enterprisePolicies,
    List<BrowserExtension>? extensions,
    String? name,
    BrowserProfileConfiguration? profileConfiguration,
    ProxyConfiguration? proxyConfiguration,
    int? sessionTimeoutSeconds,
    String? traceId,
    String? traceParent,
    ViewPort? viewPort,
  }) async {
    _s.validateNumRange(
      'sessionTimeoutSeconds',
      sessionTimeoutSeconds,
      1,
      28800,
    );
    final headers = <String, String>{
      if (traceId != null) 'X-Amzn-Trace-Id': traceId.toString(),
      if (traceParent != null) 'traceparent': traceParent.toString(),
    };
    final $payload = <String, dynamic>{
      if (certificates != null) 'certificates': certificates,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (enterprisePolicies != null) 'enterprisePolicies': enterprisePolicies,
      if (extensions != null) 'extensions': extensions,
      if (name != null) 'name': name,
      if (profileConfiguration != null)
        'profileConfiguration': profileConfiguration,
      if (proxyConfiguration != null) 'proxyConfiguration': proxyConfiguration,
      if (sessionTimeoutSeconds != null)
        'sessionTimeoutSeconds': sessionTimeoutSeconds,
      if (viewPort != null) 'viewPort': viewPort,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/browsers/${Uri.encodeComponent(browserIdentifier)}/sessions/start',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return StartBrowserSessionResponse.fromJson(response);
  }

  /// Terminates an active browser session in Amazon Bedrock AgentCore. This
  /// operation stops the session, releases associated resources, and makes the
  /// session unavailable for further use.
  ///
  /// To stop a browser session, you must specify both the browser identifier
  /// and the session ID. Once stopped, a session cannot be restarted; you must
  /// create a new session using <code>StartBrowserSession</code>.
  ///
  /// The following operations are related to <code>StopBrowserSession</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_StartBrowserSession.html">StartBrowserSession</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_GetBrowserSession.html">GetBrowserSession</a>
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
  /// Parameter [browserIdentifier] :
  /// The unique identifier of the browser associated with the session.
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the browser session to stop.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock AgentCore ignores the request, but does not return an
  /// error.
  ///
  /// Parameter [traceId] :
  /// The trace identifier for request tracking.
  ///
  /// Parameter [traceParent] :
  /// The parent trace information for distributed tracing.
  Future<StopBrowserSessionResponse> stopBrowserSession({
    required String browserIdentifier,
    required String sessionId,
    String? clientToken,
    String? traceId,
    String? traceParent,
  }) async {
    final headers = <String, String>{
      if (traceId != null) 'X-Amzn-Trace-Id': traceId.toString(),
      if (traceParent != null) 'traceparent': traceParent.toString(),
    };
    final $query = <String, List<String>>{
      'sessionId': [sessionId],
    };
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/browsers/${Uri.encodeComponent(browserIdentifier)}/sessions/stop',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return StopBrowserSessionResponse.fromJson(response);
  }

  /// Updates a browser stream. To use this operation, you must have permissions
  /// to perform the bedrock:UpdateBrowserStream action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [browserIdentifier] :
  /// The identifier of the browser.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the browser session.
  ///
  /// Parameter [streamUpdate] :
  /// The update to apply to the browser stream.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the operation completes
  /// no more than one time. If this token matches a previous request, Amazon
  /// Bedrock ignores the request, but does not return an error.
  Future<UpdateBrowserStreamResponse> updateBrowserStream({
    required String browserIdentifier,
    required String sessionId,
    required StreamUpdate streamUpdate,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      'sessionId': [sessionId],
    };
    final $payload = <String, dynamic>{
      'streamUpdate': streamUpdate,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/browsers/${Uri.encodeComponent(browserIdentifier)}/sessions/streams/update',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBrowserStreamResponse.fromJson(response);
  }

  /// Retrieves detailed information about a specific code interpreter session
  /// in Amazon Bedrock AgentCore. This operation returns the session's
  /// configuration, current status, and metadata.
  ///
  /// To get a code interpreter session, you must specify both the code
  /// interpreter identifier and the session ID. The response includes
  /// information about the session's timeout settings and current status.
  ///
  /// The following operations are related to
  /// <code>GetCodeInterpreterSession</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_StartCodeInterpreterSession.html">StartCodeInterpreterSession</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_ListCodeInterpreterSessions.html">ListCodeInterpreterSessions</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_StopCodeInterpreterSession.html">StopCodeInterpreterSession</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [codeInterpreterIdentifier] :
  /// The unique identifier of the code interpreter associated with the session.
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the code interpreter session to retrieve.
  Future<GetCodeInterpreterSessionResponse> getCodeInterpreterSession({
    required String codeInterpreterIdentifier,
    required String sessionId,
  }) async {
    final $query = <String, List<String>>{
      'sessionId': [sessionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/code-interpreters/${Uri.encodeComponent(codeInterpreterIdentifier)}/sessions/get',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetCodeInterpreterSessionResponse.fromJson(response);
  }

  /// Retrieves a list of code interpreter sessions in Amazon Bedrock AgentCore
  /// that match the specified criteria. This operation returns summary
  /// information about each session, including identifiers, status, and
  /// timestamps.
  ///
  /// You can filter the results by code interpreter identifier and session
  /// status. The operation supports pagination to handle large result sets
  /// efficiently.
  ///
  /// We recommend using pagination to ensure that the operation returns quickly
  /// and successfully when retrieving large numbers of sessions.
  ///
  /// The following operations are related to
  /// <code>ListCodeInterpreterSessions</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_StartCodeInterpreterSession.html">StartCodeInterpreterSession</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_GetCodeInterpreterSession.html">GetCodeInterpreterSession</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [codeInterpreterIdentifier] :
  /// The unique identifier of the code interpreter to list sessions for. If
  /// specified, only sessions for this code interpreter are returned. If not
  /// specified, sessions for all code interpreters are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. The default
  /// value is 10. Valid values range from 1 to 100. To retrieve the remaining
  /// results, make another call with the returned <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  /// If not specified, Amazon Bedrock AgentCore returns the first page of
  /// results.
  ///
  /// Parameter [status] :
  /// The status of the code interpreter sessions to list. Valid values include
  /// ACTIVE, STOPPING, and STOPPED. If not specified, sessions with any status
  /// are returned.
  Future<ListCodeInterpreterSessionsResponse> listCodeInterpreterSessions({
    required String codeInterpreterIdentifier,
    int? maxResults,
    String? nextToken,
    CodeInterpreterSessionStatus? status,
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
      if (status != null) 'status': status.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/code-interpreters/${Uri.encodeComponent(codeInterpreterIdentifier)}/sessions/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListCodeInterpreterSessionsResponse.fromJson(response);
  }

  /// Creates and initializes a code interpreter session in Amazon Bedrock
  /// AgentCore. The session enables agents to execute code as part of their
  /// response generation, supporting programming languages such as Python for
  /// data analysis, visualization, and computation tasks.
  ///
  /// To create a session, you must specify a code interpreter identifier and a
  /// name. The session remains active until it times out or you explicitly stop
  /// it using the <code>StopCodeInterpreterSession</code> operation.
  ///
  /// The following operations are related to
  /// <code>StartCodeInterpreterSession</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_InvokeCodeInterpreter.html">InvokeCodeInterpreter</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_GetCodeInterpreterSession.html">GetCodeInterpreterSession</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_StopCodeInterpreterSession.html">StopCodeInterpreterSession</a>
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
  /// Parameter [codeInterpreterIdentifier] :
  /// The unique identifier of the code interpreter to use for this session.
  /// This identifier specifies which code interpreter environment to initialize
  /// for the session.
  ///
  /// Parameter [certificates] :
  /// A list of certificates to install in the code interpreter session.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock AgentCore ignores the request, but does not return an
  /// error. This parameter helps prevent the creation of duplicate sessions if
  /// there are temporary network issues.
  ///
  /// Parameter [name] :
  /// The name of the code interpreter session. This name helps you identify and
  /// manage the session. The name does not need to be unique.
  ///
  /// Parameter [sessionTimeoutSeconds] :
  /// The duration in seconds (time-to-live) after which the session
  /// automatically terminates, regardless of ongoing activity. Defaults to 900
  /// seconds (15 minutes). Recommended minimum: 60 seconds. Maximum allowed:
  /// 28,800 seconds (8 hours).
  ///
  /// Parameter [traceId] :
  /// The trace identifier for request tracking.
  ///
  /// Parameter [traceParent] :
  /// The parent trace information for distributed tracing.
  Future<StartCodeInterpreterSessionResponse> startCodeInterpreterSession({
    required String codeInterpreterIdentifier,
    List<Certificate>? certificates,
    String? clientToken,
    String? name,
    int? sessionTimeoutSeconds,
    String? traceId,
    String? traceParent,
  }) async {
    _s.validateNumRange(
      'sessionTimeoutSeconds',
      sessionTimeoutSeconds,
      1,
      28800,
    );
    final headers = <String, String>{
      if (traceId != null) 'X-Amzn-Trace-Id': traceId.toString(),
      if (traceParent != null) 'traceparent': traceParent.toString(),
    };
    final $payload = <String, dynamic>{
      if (certificates != null) 'certificates': certificates,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (name != null) 'name': name,
      if (sessionTimeoutSeconds != null)
        'sessionTimeoutSeconds': sessionTimeoutSeconds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/code-interpreters/${Uri.encodeComponent(codeInterpreterIdentifier)}/sessions/start',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return StartCodeInterpreterSessionResponse.fromJson(response);
  }

  /// Terminates an active code interpreter session in Amazon Bedrock AgentCore.
  /// This operation stops the session, releases associated resources, and makes
  /// the session unavailable for further use.
  ///
  /// To stop a code interpreter session, you must specify both the code
  /// interpreter identifier and the session ID. Once stopped, a session cannot
  /// be restarted; you must create a new session using
  /// <code>StartCodeInterpreterSession</code>.
  ///
  /// The following operations are related to
  /// <code>StopCodeInterpreterSession</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_StartCodeInterpreterSession.html">StartCodeInterpreterSession</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/APIReference/API_GetCodeInterpreterSession.html">GetCodeInterpreterSession</a>
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
  /// Parameter [codeInterpreterIdentifier] :
  /// The unique identifier of the code interpreter associated with the session.
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the code interpreter session to stop.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock AgentCore ignores the request, but does not return an
  /// error.
  ///
  /// Parameter [traceId] :
  /// The trace identifier for request tracking.
  ///
  /// Parameter [traceParent] :
  /// The parent trace information for distributed tracing.
  Future<StopCodeInterpreterSessionResponse> stopCodeInterpreterSession({
    required String codeInterpreterIdentifier,
    required String sessionId,
    String? clientToken,
    String? traceId,
    String? traceParent,
  }) async {
    final headers = <String, String>{
      if (traceId != null) 'X-Amzn-Trace-Id': traceId.toString(),
      if (traceParent != null) 'traceparent': traceParent.toString(),
    };
    final $query = <String, List<String>>{
      'sessionId': [sessionId],
    };
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/code-interpreters/${Uri.encodeComponent(codeInterpreterIdentifier)}/sessions/stop',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return StopCodeInterpreterSessionResponse.fromJson(response);
  }

  /// Creates an A/B test for comparing agent configurations. A/B tests split
  /// traffic between a control variant and a treatment variant through a
  /// gateway, then evaluate performance using online evaluation configurations
  /// to determine which variant performs better.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [evaluationConfig] :
  /// The evaluation configuration specifying which online evaluation
  /// configurations to use for measuring variant performance.
  ///
  /// Parameter [gatewayArn] :
  /// The Amazon Resource Name (ARN) of the gateway to use for traffic
  /// splitting.
  ///
  /// Parameter [name] :
  /// The name of the A/B test. Must be unique within your account.
  ///
  /// Parameter [roleArn] :
  /// The IAM role ARN that grants permissions for the A/B test to access
  /// gateway and evaluation resources.
  ///
  /// Parameter [variants] :
  /// The list of variants for the A/B test. Must contain exactly two variants:
  /// a control (C) and a treatment (T1), each with a configuration bundle or
  /// target reference and a traffic weight.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// the service ignores the request, but does not return an error.
  ///
  /// Parameter [description] :
  /// The description of the A/B test.
  ///
  /// Parameter [enableOnCreate] :
  /// Whether to enable the A/B test immediately upon creation. If true, traffic
  /// splitting begins automatically.
  ///
  /// Parameter [gatewayFilter] :
  /// Optional filter to restrict which gateway target paths are included in the
  /// A/B test.
  Future<CreateABTestResponse> createABTest({
    required ABTestEvaluationConfig evaluationConfig,
    required String gatewayArn,
    required String name,
    required String roleArn,
    required List<Variant> variants,
    String? clientToken,
    String? description,
    bool? enableOnCreate,
    GatewayFilter? gatewayFilter,
  }) async {
    final $payload = <String, dynamic>{
      'evaluationConfig': evaluationConfig,
      'gatewayArn': gatewayArn,
      'name': name,
      'roleArn': roleArn,
      'variants': variants,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (enableOnCreate != null) 'enableOnCreate': enableOnCreate,
      if (gatewayFilter != null) 'gatewayFilter': gatewayFilter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ab-tests',
      exceptionFnMap: _exceptionFns,
    );
    return CreateABTestResponse.fromJson(response);
  }

  /// Deletes an A/B test and its associated gateway rules.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [abTestId] :
  /// The unique identifier of the A/B test to delete.
  Future<DeleteABTestResponse> deleteABTest({
    required String abTestId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/ab-tests/${Uri.encodeComponent(abTestId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteABTestResponse.fromJson(response);
  }

  /// Deletes a batch evaluation and its associated results.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [batchEvaluationId] :
  /// The unique identifier of the batch evaluation to delete.
  Future<DeleteBatchEvaluationResponse> deleteBatchEvaluation({
    required String batchEvaluationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/evaluations/batch-evaluate/${Uri.encodeComponent(batchEvaluationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteBatchEvaluationResponse.fromJson(response);
  }

  /// Deletes a recommendation and its associated results.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [recommendationId] :
  /// The unique identifier of the recommendation to delete.
  Future<DeleteRecommendationResponse> deleteRecommendation({
    required String recommendationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/recommendations/${Uri.encodeComponent(recommendationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteRecommendationResponse.fromJson(response);
  }

  /// Performs on-demand evaluation of agent traces using a specified evaluator.
  /// This synchronous API accepts traces in OpenTelemetry format and returns
  /// immediate scoring results with detailed explanations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DuplicateIdException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [evaluationInput] :
  /// The input data containing agent session spans to be evaluated. Includes a
  /// list of spans in OpenTelemetry format from supported frameworks like
  /// Strands (AgentCore Runtime) or LangGraph with OpenInference
  /// instrumentation.
  ///
  /// Parameter [evaluatorId] :
  /// The unique identifier of the evaluator to use for scoring. Can be a
  /// built-in evaluator (e.g., <code>Builtin.Helpfulness</code>,
  /// <code>Builtin.Correctness</code>) or a custom evaluator Id created through
  /// the control plane API.
  ///
  /// Parameter [evaluationReferenceInputs] :
  /// Ground truth data to compare against agent responses during evaluation.
  /// Allows to provide expected responses, assertions, and expected tool
  /// trajectories at different evaluation levels. Session-level reference
  /// inputs apply to the entire conversation, while trace-level reference
  /// inputs target specific request-response interactions identified by trace
  /// ID.
  ///
  /// Parameter [evaluationTarget] :
  /// The specific trace or span IDs to evaluate within the provided input.
  /// Allows targeting evaluation at different levels: individual tool calls,
  /// single request-response interactions (traces), or entire conversation
  /// sessions.
  Future<EvaluateResponse> evaluate({
    required EvaluationInput evaluationInput,
    required String evaluatorId,
    List<EvaluationReferenceInput>? evaluationReferenceInputs,
    EvaluationTarget? evaluationTarget,
  }) async {
    final $payload = <String, dynamic>{
      'evaluationInput': evaluationInput,
      if (evaluationReferenceInputs != null)
        'evaluationReferenceInputs': evaluationReferenceInputs,
      if (evaluationTarget != null) 'evaluationTarget': evaluationTarget,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/evaluations/evaluate/${Uri.encodeComponent(evaluatorId)}',
      exceptionFnMap: _exceptionFns,
    );
    return EvaluateResponse.fromJson(response);
  }

  /// Retrieves detailed information about an A/B test, including its
  /// configuration, status, and statistical results.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [abTestId] :
  /// The unique identifier of the A/B test to retrieve.
  Future<GetABTestResponse> getABTest({
    required String abTestId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ab-tests/${Uri.encodeComponent(abTestId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetABTestResponse.fromJson(response);
  }

  /// Retrieves detailed information about a batch evaluation, including its
  /// status, configuration, results, and any error details.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [batchEvaluationId] :
  /// The unique identifier of the batch evaluation to retrieve.
  Future<GetBatchEvaluationResponse> getBatchEvaluation({
    required String batchEvaluationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/evaluations/batch-evaluate/${Uri.encodeComponent(batchEvaluationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBatchEvaluationResponse.fromJson(response);
  }

  /// Retrieves detailed information about a recommendation, including its
  /// configuration, status, and results.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [recommendationId] :
  /// The unique identifier of the recommendation to retrieve.
  Future<GetRecommendationResponse> getRecommendation({
    required String recommendationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/recommendations/${Uri.encodeComponent(recommendationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRecommendationResponse.fromJson(response);
  }

  /// Lists all A/B tests in the account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
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
  Future<ListABTestsResponse> listABTests({
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
      requestUri: '/ab-tests',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListABTestsResponse.fromJson(response);
  }

  /// Lists all batch evaluations in the account, providing summary information
  /// about each evaluation's status and configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
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
  Future<ListBatchEvaluationsResponse> listBatchEvaluations({
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
      requestUri: '/evaluations/batch-evaluate',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBatchEvaluationsResponse.fromJson(response);
  }

  /// Lists all recommendations in the account, with optional filtering by
  /// status.
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
  ///
  /// Parameter [statusFilter] :
  /// Optional filter to return only recommendations with the specified status.
  Future<ListRecommendationsResponse> listRecommendations({
    int? maxResults,
    String? nextToken,
    RecommendationStatus? statusFilter,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (statusFilter != null) 'status': [statusFilter.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/recommendations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecommendationsResponse.fromJson(response);
  }

  /// Starts a batch evaluation job that evaluates agent performance across
  /// multiple sessions. Batch evaluations pull agent traces from CloudWatch
  /// Logs or an existing online evaluation configuration and run specified
  /// evaluators and insights against them.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [batchEvaluationName] :
  /// The name of the batch evaluation. Must be unique within your account.
  ///
  /// Parameter [dataSourceConfig] :
  /// The data source configuration that specifies where to pull agent session
  /// traces from for evaluation.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// the service ignores the request, but does not return an error.
  ///
  /// Parameter [description] :
  /// The description of the batch evaluation.
  ///
  /// Parameter [evaluationMetadata] :
  /// Optional metadata for the evaluation, including session-specific ground
  /// truth data and test scenario identifiers.
  ///
  /// Parameter [evaluators] :
  /// The list of evaluators to apply during the batch evaluation. Can include
  /// both built-in evaluators and custom evaluators. Maximum of 10 evaluators.
  Future<StartBatchEvaluationResponse> startBatchEvaluation({
    required String batchEvaluationName,
    required DataSourceConfig dataSourceConfig,
    String? clientToken,
    String? description,
    EvaluationMetadata? evaluationMetadata,
    List<Evaluator>? evaluators,
  }) async {
    final $payload = <String, dynamic>{
      'batchEvaluationName': batchEvaluationName,
      'dataSourceConfig': dataSourceConfig,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (evaluationMetadata != null) 'evaluationMetadata': evaluationMetadata,
      if (evaluators != null) 'evaluators': evaluators,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/evaluations/batch-evaluate',
      exceptionFnMap: _exceptionFns,
    );
    return StartBatchEvaluationResponse.fromJson(response);
  }

  /// Starts a recommendation job that analyzes agent traces and generates
  /// optimization suggestions for system prompts or tool descriptions to
  /// improve agent performance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the recommendation. Must be unique within your account.
  ///
  /// Parameter [recommendationConfig] :
  /// The configuration for the recommendation, including the input to optimize,
  /// agent traces to analyze, and evaluation settings.
  ///
  /// Parameter [type] :
  /// The type of recommendation to generate. Valid values are
  /// <code>SYSTEM_PROMPT_RECOMMENDATION</code> for system prompt optimization
  /// or <code>TOOL_DESCRIPTION_RECOMMENDATION</code> for tool description
  /// optimization.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// the service ignores the request, but does not return an error.
  ///
  /// Parameter [description] :
  /// The description of the recommendation.
  Future<StartRecommendationResponse> startRecommendation({
    required String name,
    required RecommendationConfig recommendationConfig,
    required RecommendationType type,
    String? clientToken,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'recommendationConfig': recommendationConfig,
      'type': type.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/recommendations',
      exceptionFnMap: _exceptionFns,
    );
    return StartRecommendationResponse.fromJson(response);
  }

  /// Stops a running batch evaluation. Sessions that have already been
  /// evaluated retain their results.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [batchEvaluationId] :
  /// The unique identifier of the batch evaluation to stop.
  Future<StopBatchEvaluationResponse> stopBatchEvaluation({
    required String batchEvaluationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/evaluations/batch-evaluate/${Uri.encodeComponent(batchEvaluationId)}/stop',
      exceptionFnMap: _exceptionFns,
    );
    return StopBatchEvaluationResponse.fromJson(response);
  }

  /// Updates an A/B test's configuration, including variants, traffic
  /// allocation, evaluation settings, or execution status.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [abTestId] :
  /// The unique identifier of the A/B test to update.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// the service ignores the request, but does not return an error.
  ///
  /// Parameter [description] :
  /// The updated description of the A/B test.
  ///
  /// Parameter [evaluationConfig] :
  /// The updated evaluation configuration.
  ///
  /// Parameter [executionStatus] :
  /// The updated execution status to enable or disable the A/B test.
  ///
  /// Parameter [gatewayFilter] :
  /// The updated gateway filter.
  ///
  /// Parameter [name] :
  /// The updated name of the A/B test.
  ///
  /// Parameter [roleArn] :
  /// The updated IAM role ARN.
  ///
  /// Parameter [variants] :
  /// The updated list of variants.
  Future<UpdateABTestResponse> updateABTest({
    required String abTestId,
    String? clientToken,
    String? description,
    ABTestEvaluationConfig? evaluationConfig,
    ABTestExecutionStatus? executionStatus,
    GatewayFilter? gatewayFilter,
    String? name,
    String? roleArn,
    List<Variant>? variants,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (evaluationConfig != null) 'evaluationConfig': evaluationConfig,
      if (executionStatus != null) 'executionStatus': executionStatus.value,
      if (gatewayFilter != null) 'gatewayFilter': gatewayFilter,
      if (name != null) 'name': name,
      if (roleArn != null) 'roleArn': roleArn,
      if (variants != null) 'variants': variants,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/ab-tests/${Uri.encodeComponent(abTestId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateABTestResponse.fromJson(response);
  }

  /// Creates multiple memory records in a single batch operation for the
  /// specified memory with custom content.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottledException].
  /// May throw [ValidationException].
  ///
  /// Parameter [memoryId] :
  /// The unique ID of the memory resource where records will be created.
  ///
  /// Parameter [records] :
  /// A list of memory record creation inputs to be processed in the batch
  /// operation.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotent processing of the
  /// batch request.
  Future<BatchCreateMemoryRecordsOutput> batchCreateMemoryRecords({
    required String memoryId,
    required List<MemoryRecordCreateInput> records,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'records': records,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memories/${Uri.encodeComponent(memoryId)}/memoryRecords/batchCreate',
      exceptionFnMap: _exceptionFns,
    );
    return BatchCreateMemoryRecordsOutput.fromJson(response);
  }

  /// Deletes multiple memory records in a single batch operation from the
  /// specified memory.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottledException].
  /// May throw [ValidationException].
  ///
  /// Parameter [memoryId] :
  /// The unique ID of the memory resource where records will be deleted.
  ///
  /// Parameter [records] :
  /// A list of memory record deletion inputs to be processed in the batch
  /// operation.
  Future<BatchDeleteMemoryRecordsOutput> batchDeleteMemoryRecords({
    required String memoryId,
    required List<MemoryRecordDeleteInput> records,
  }) async {
    final $payload = <String, dynamic>{
      'records': records,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memories/${Uri.encodeComponent(memoryId)}/memoryRecords/batchDelete',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteMemoryRecordsOutput.fromJson(response);
  }

  /// Updates multiple memory records with custom content in a single batch
  /// operation within the specified memory.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottledException].
  /// May throw [ValidationException].
  ///
  /// Parameter [memoryId] :
  /// The unique ID of the memory resource where records will be updated.
  ///
  /// Parameter [records] :
  /// A list of memory record update inputs to be processed in the batch
  /// operation.
  Future<BatchUpdateMemoryRecordsOutput> batchUpdateMemoryRecords({
    required String memoryId,
    required List<MemoryRecordUpdateInput> records,
  }) async {
    final $payload = <String, dynamic>{
      'records': records,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memories/${Uri.encodeComponent(memoryId)}/memoryRecords/batchUpdate',
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpdateMemoryRecordsOutput.fromJson(response);
  }

  /// Creates an event in an AgentCore Memory resource. Events represent
  /// interactions or activities that occur within a session and are associated
  /// with specific actors.
  ///
  /// To use this operation, you must have the
  /// <code>bedrock-agentcore:CreateEvent</code> permission.
  ///
  /// This operation is subject to request rate limiting.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RetryableConflictException].
  /// May throw [ServiceException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottledException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actorId] :
  /// The identifier of the actor associated with this event. An actor
  /// represents an entity that participates in sessions and generates events.
  ///
  /// Parameter [eventTimestamp] :
  /// The timestamp when the event occurred. If not specified, the current time
  /// is used.
  ///
  /// Parameter [memoryId] :
  /// The identifier of the AgentCore Memory resource in which to create the
  /// event.
  ///
  /// Parameter [payload] :
  /// The content payload of the event. This can include conversational data or
  /// binary content.
  ///
  /// Parameter [branch] :
  /// The branch information for this event. Branches allow for organizing
  /// events into different conversation threads or paths.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the operation completes
  /// no more than one time. If this token matches a previous request, AgentCore
  /// ignores the request, but does not return an error.
  ///
  /// Parameter [metadata] :
  /// The key-value metadata to attach to the event.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the session in which this event occurs. A session
  /// represents a sequence of related events.
  Future<CreateEventOutput> createEvent({
    required String actorId,
    required DateTime eventTimestamp,
    required String memoryId,
    required List<PayloadType> payload,
    Branch? branch,
    String? clientToken,
    Map<String, MetadataValue>? metadata,
    String? sessionId,
  }) async {
    final $payload = <String, dynamic>{
      'actorId': actorId,
      'eventTimestamp': unixTimestampToJson(eventTimestamp),
      'payload': payload,
      if (branch != null) 'branch': branch,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (metadata != null) 'metadata': metadata,
      if (sessionId != null) 'sessionId': sessionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/memories/${Uri.encodeComponent(memoryId)}/events',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEventOutput.fromJson(response);
  }

  /// Deletes an event from an AgentCore Memory resource. When you delete an
  /// event, it is permanently removed.
  ///
  /// To use this operation, you must have the
  /// <code>bedrock-agentcore:DeleteEvent</code> permission.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottledException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actorId] :
  /// The identifier of the actor associated with the event to delete.
  ///
  /// Parameter [eventId] :
  /// The identifier of the event to delete.
  ///
  /// Parameter [memoryId] :
  /// The identifier of the AgentCore Memory resource from which to delete the
  /// event.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the session containing the event to delete.
  Future<DeleteEventOutput> deleteEvent({
    required String actorId,
    required String eventId,
    required String memoryId,
    required String sessionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/memories/${Uri.encodeComponent(memoryId)}/actor/${Uri.encodeComponent(actorId)}/sessions/${Uri.encodeComponent(sessionId)}/events/${Uri.encodeComponent(eventId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteEventOutput.fromJson(response);
  }

  /// Deletes a memory record from an AgentCore Memory resource. When you delete
  /// a memory record, it is permanently removed.
  ///
  /// To use this operation, you must have the
  /// <code>bedrock-agentcore:DeleteMemoryRecord</code> permission.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottledException].
  /// May throw [ValidationException].
  ///
  /// Parameter [memoryId] :
  /// The identifier of the AgentCore Memory resource from which to delete the
  /// memory record.
  ///
  /// Parameter [memoryRecordId] :
  /// The identifier of the memory record to delete.
  Future<DeleteMemoryRecordOutput> deleteMemoryRecord({
    required String memoryId,
    required String memoryRecordId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/memories/${Uri.encodeComponent(memoryId)}/memoryRecords/${Uri.encodeComponent(memoryRecordId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteMemoryRecordOutput.fromJson(response);
  }

  /// Retrieves information about a specific event in an AgentCore Memory
  /// resource.
  ///
  /// To use this operation, you must have the
  /// <code>bedrock-agentcore:GetEvent</code> permission.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottledException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actorId] :
  /// The identifier of the actor associated with the event.
  ///
  /// Parameter [eventId] :
  /// The identifier of the event to retrieve.
  ///
  /// Parameter [memoryId] :
  /// The identifier of the AgentCore Memory resource containing the event.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the session containing the event.
  Future<GetEventOutput> getEvent({
    required String actorId,
    required String eventId,
    required String memoryId,
    required String sessionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memories/${Uri.encodeComponent(memoryId)}/actor/${Uri.encodeComponent(actorId)}/sessions/${Uri.encodeComponent(sessionId)}/events/${Uri.encodeComponent(eventId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEventOutput.fromJson(response);
  }

  /// Retrieves a specific memory record from an AgentCore Memory resource.
  ///
  /// To use this operation, you must have the
  /// <code>bedrock-agentcore:GetMemoryRecord</code> permission.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottledException].
  /// May throw [ValidationException].
  ///
  /// Parameter [memoryId] :
  /// The identifier of the AgentCore Memory resource containing the memory
  /// record.
  ///
  /// Parameter [memoryRecordId] :
  /// The identifier of the memory record to retrieve.
  Future<GetMemoryRecordOutput> getMemoryRecord({
    required String memoryId,
    required String memoryRecordId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memories/${Uri.encodeComponent(memoryId)}/memoryRecord/${Uri.encodeComponent(memoryRecordId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMemoryRecordOutput.fromJson(response);
  }

  /// Lists all actors in an AgentCore Memory resource. We recommend using
  /// pagination to ensure that the operation returns quickly and successfully.
  ///
  /// To use this operation, you must have the
  /// <code>bedrock-agentcore:ListActors</code> permission.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottledException].
  /// May throw [ValidationException].
  ///
  /// Parameter [memoryId] :
  /// The identifier of the AgentCore Memory resource for which to list actors.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. The default
  /// value is 20.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListActorsOutput> listActors({
    required String memoryId,
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
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/memories/${Uri.encodeComponent(memoryId)}/actors',
      exceptionFnMap: _exceptionFns,
    );
    return ListActorsOutput.fromJson(response);
  }

  /// Lists events in an AgentCore Memory resource based on specified criteria.
  /// We recommend using pagination to ensure that the operation returns quickly
  /// and successfully.
  ///
  /// To use this operation, you must have the
  /// <code>bedrock-agentcore:ListEvents</code> permission.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottledException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actorId] :
  /// The identifier of the actor for which to list events.
  ///
  /// Parameter [memoryId] :
  /// The identifier of the AgentCore Memory resource for which to list events.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the session for which to list events.
  ///
  /// Parameter [filter] :
  /// Filter criteria to apply when listing events.
  ///
  /// Parameter [includePayloads] :
  /// Specifies whether to include event payloads in the response. Set to true
  /// to include payloads, or false to exclude them.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. The default
  /// value is 20.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListEventsOutput> listEvents({
    required String actorId,
    required String memoryId,
    required String sessionId,
    FilterInput? filter,
    bool? includePayloads,
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
      if (filter != null) 'filter': filter,
      if (includePayloads != null) 'includePayloads': includePayloads,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memories/${Uri.encodeComponent(memoryId)}/actor/${Uri.encodeComponent(actorId)}/sessions/${Uri.encodeComponent(sessionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListEventsOutput.fromJson(response);
  }

  /// Lists all long-term memory extraction jobs that are eligible to be started
  /// with optional filtering.
  ///
  /// To use this operation, you must have the
  /// <code>bedrock-agentcore:ListMemoryExtractionJobs</code> permission.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottledException].
  /// May throw [ValidationException].
  ///
  /// Parameter [memoryId] :
  /// The unique identifier of the memory to list extraction jobs for.
  ///
  /// Parameter [filter] :
  /// Filter criteria to apply when listing extraction jobs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. The default
  /// value is 20.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListMemoryExtractionJobsOutput> listMemoryExtractionJobs({
    required String memoryId,
    ExtractionJobFilterInput? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/memories/${Uri.encodeComponent(memoryId)}/extractionJobs',
      exceptionFnMap: _exceptionFns,
    );
    return ListMemoryExtractionJobsOutput.fromJson(response);
  }

  /// Lists memory records in an AgentCore Memory resource based on specified
  /// criteria. We recommend using pagination to ensure that the operation
  /// returns quickly and successfully.
  ///
  /// To use this operation, you must have the
  /// <code>bedrock-agentcore:ListMemoryRecords</code> permission.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottledException].
  /// May throw [ValidationException].
  ///
  /// Parameter [memoryId] :
  /// The identifier of the AgentCore Memory resource for which to list memory
  /// records.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. The default
  /// value is 20.
  ///
  /// Parameter [memoryStrategyId] :
  /// The memory strategy identifier to filter memory records by. If specified,
  /// only memory records with this strategy ID are returned.
  ///
  /// Parameter [metadataFilters] :
  /// A list of metadata filter expressions to scope the returned memory
  /// records.
  ///
  /// Parameter [namespace] :
  /// The namespace prefix to filter memory records by. Returns all memory
  /// records in namespaces that start with the provided prefix. Either
  /// <code>namespace</code> or <code>namespacePath</code> is required.
  ///
  /// Parameter [namespacePath] :
  /// Use namespacePath for hierarchical retrievals. Return all memory records
  /// where namespace falls under the same parent hierarchy. Either
  /// <code>namespace</code> or <code>namespacePath</code> is required.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListMemoryRecordsOutput> listMemoryRecords({
    required String memoryId,
    int? maxResults,
    String? memoryStrategyId,
    List<MemoryMetadataFilterExpression>? metadataFilters,
    String? namespace,
    String? namespacePath,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (memoryStrategyId != null) 'memoryStrategyId': memoryStrategyId,
      if (metadataFilters != null) 'metadataFilters': metadataFilters,
      if (namespace != null) 'namespace': namespace,
      if (namespacePath != null) 'namespacePath': namespacePath,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/memories/${Uri.encodeComponent(memoryId)}/memoryRecords',
      exceptionFnMap: _exceptionFns,
    );
    return ListMemoryRecordsOutput.fromJson(response);
  }

  /// Lists sessions in an AgentCore Memory resource based on specified
  /// criteria. We recommend using pagination to ensure that the operation
  /// returns quickly and successfully.
  ///
  /// Empty sessions are automatically deleted after one day.
  ///
  /// To use this operation, you must have the
  /// <code>bedrock-agentcore:ListSessions</code> permission.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottledException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actorId] :
  /// The identifier of the actor for which to list sessions.
  ///
  /// Parameter [memoryId] :
  /// The identifier of the AgentCore Memory resource for which to list
  /// sessions.
  ///
  /// Parameter [filter] :
  /// Filter criteria to apply when listing sessions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. The default
  /// value is 20.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListSessionsOutput> listSessions({
    required String actorId,
    required String memoryId,
    SessionFilter? filter,
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
      if (filter != null) 'filter': filter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memories/${Uri.encodeComponent(memoryId)}/actor/${Uri.encodeComponent(actorId)}/sessions',
      exceptionFnMap: _exceptionFns,
    );
    return ListSessionsOutput.fromJson(response);
  }

  /// Searches for and retrieves memory records from an AgentCore Memory
  /// resource based on specified search criteria. We recommend using pagination
  /// to ensure that the operation returns quickly and successfully.
  ///
  /// To use this operation, you must have the
  /// <code>bedrock-agentcore:RetrieveMemoryRecords</code> permission.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottledException].
  /// May throw [ValidationException].
  ///
  /// Parameter [memoryId] :
  /// The identifier of the AgentCore Memory resource from which to retrieve
  /// memory records.
  ///
  /// Parameter [searchCriteria] :
  /// The search criteria to use for finding relevant memory records. This
  /// includes the search query, memory strategy ID, and other search
  /// parameters.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. The default
  /// value is 20.
  ///
  /// Parameter [namespace] :
  /// The namespace prefix to filter memory records by. Searches for memory
  /// records in namespaces that start with the provided prefix. Either
  /// <code>namespace</code> or <code>namespacePath</code> is required.
  ///
  /// Parameter [namespacePath] :
  /// Use namespacePath for hierarchical retrievals. Return all memory records
  /// where namespace falls under the same parent hierarchy. Either
  /// <code>namespace</code> or <code>namespacePath</code> is required.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<RetrieveMemoryRecordsOutput> retrieveMemoryRecords({
    required String memoryId,
    required SearchCriteria searchCriteria,
    int? maxResults,
    String? namespace,
    String? namespacePath,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'searchCriteria': searchCriteria,
      if (maxResults != null) 'maxResults': maxResults,
      if (namespace != null) 'namespace': namespace,
      if (namespacePath != null) 'namespacePath': namespacePath,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/memories/${Uri.encodeComponent(memoryId)}/retrieve',
      exceptionFnMap: _exceptionFns,
    );
    return RetrieveMemoryRecordsOutput.fromJson(response);
  }

  /// Starts a memory extraction job that processes events that failed
  /// extraction previously in an AgentCore Memory resource and produces
  /// structured memory records. When earlier extraction attempts have left
  /// events unprocessed, this job will pick up and extract those as well.
  ///
  /// To use this operation, you must have the
  /// <code>bedrock-agentcore:StartMemoryExtractionJob</code> permission.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottledException].
  /// May throw [ValidationException].
  ///
  /// Parameter [extractionJob] :
  /// Extraction job to start in this operation.
  ///
  /// Parameter [memoryId] :
  /// The unique identifier of the memory for which to start extraction jobs.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotent processing of the
  /// request.
  Future<StartMemoryExtractionJobOutput> startMemoryExtractionJob({
    required ExtractionJob extractionJob,
    required String memoryId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'extractionJob': extractionJob,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memories/${Uri.encodeComponent(memoryId)}/extractionJobs/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartMemoryExtractionJobOutput.fromJson(response);
  }

  /// Create a new payment instrument for a connector.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [paymentConnectorId] :
  /// The ID of the payment connector to use for this instrument.
  ///
  /// Parameter [paymentInstrumentDetails] :
  /// The details of the payment instrument.
  ///
  /// Parameter [paymentInstrumentType] :
  /// The type of payment instrument being created.
  ///
  /// Parameter [paymentManagerArn] :
  /// The ARN of the payment manager that owns this payment instrument.
  ///
  /// Parameter [agentName] :
  /// The agent name associated with this request, used for observability.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [userId] :
  /// The user ID associated with this payment instrument.
  Future<CreatePaymentInstrumentResponse> createPaymentInstrument({
    required String paymentConnectorId,
    required PaymentInstrumentDetails paymentInstrumentDetails,
    required PaymentInstrumentType paymentInstrumentType,
    required String paymentManagerArn,
    String? agentName,
    String? clientToken,
    String? userId,
  }) async {
    final headers = <String, String>{
      if (agentName != null)
        'X-Amzn-Bedrock-AgentCore-Payments-Agent-Name': agentName.toString(),
      if (userId != null)
        'X-Amzn-Bedrock-AgentCore-Payments-User-Id': userId.toString(),
    };
    final $payload = <String, dynamic>{
      'paymentConnectorId': paymentConnectorId,
      'paymentInstrumentDetails': paymentInstrumentDetails,
      'paymentInstrumentType': paymentInstrumentType.value,
      'paymentManagerArn': paymentManagerArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/payments/createPaymentInstrument',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreatePaymentInstrumentResponse.fromJson(response);
  }

  /// Get a payment instrument by ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [paymentInstrumentId] :
  /// The ID of the payment instrument to retrieve.
  ///
  /// Parameter [paymentManagerArn] :
  /// The ARN of the payment manager that owns this payment instrument.
  ///
  /// Parameter [agentName] :
  /// The agent name associated with this request, used for observability.
  ///
  /// Parameter [paymentConnectorId] :
  /// The ID of the payment connector.
  ///
  /// Parameter [userId] :
  /// The user ID associated with this payment instrument.
  Future<GetPaymentInstrumentResponse> getPaymentInstrument({
    required String paymentInstrumentId,
    required String paymentManagerArn,
    String? agentName,
    String? paymentConnectorId,
    String? userId,
  }) async {
    final headers = <String, String>{
      if (agentName != null)
        'X-Amzn-Bedrock-AgentCore-Payments-Agent-Name': agentName.toString(),
      if (userId != null)
        'X-Amzn-Bedrock-AgentCore-Payments-User-Id': userId.toString(),
    };
    final $payload = <String, dynamic>{
      'paymentInstrumentId': paymentInstrumentId,
      'paymentManagerArn': paymentManagerArn,
      if (paymentConnectorId != null) 'paymentConnectorId': paymentConnectorId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/payments/getPaymentInstrument',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetPaymentInstrumentResponse.fromJson(response);
  }

  /// Deletes a payment instrument. This is a soft delete operation that
  /// preserves the record for audit and compliance purposes.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [paymentConnectorId] :
  /// The payment connector ID. Must match the instrument's paymentConnectorId.
  ///
  /// Parameter [paymentInstrumentId] :
  /// The payment instrument ID to delete.
  ///
  /// Parameter [paymentManagerArn] :
  /// The payment manager ARN. Must match the instrument's paymentManagerArn.
  ///
  /// Parameter [userId] :
  /// The user ID making the delete request. Must match the instrument's userId.
  Future<DeletePaymentInstrumentResponse> deletePaymentInstrument({
    required String paymentConnectorId,
    required String paymentInstrumentId,
    required String paymentManagerArn,
    String? userId,
  }) async {
    final headers = <String, String>{
      if (userId != null)
        'X-Amzn-Bedrock-AgentCore-Payments-User-Id': userId.toString(),
    };
    final $payload = <String, dynamic>{
      'paymentConnectorId': paymentConnectorId,
      'paymentInstrumentId': paymentInstrumentId,
      'paymentManagerArn': paymentManagerArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/payments/deletePaymentInstrument',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DeletePaymentInstrumentResponse.fromJson(response);
  }

  /// List payment instruments for a manager.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [paymentManagerArn] :
  /// The ARN of the payment manager that owns the payment instruments.
  ///
  /// Parameter [agentName] :
  /// The agent name associated with this request, used for observability.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// Token for pagination to retrieve the next set of results.
  ///
  /// Parameter [paymentConnectorId] :
  /// The ID of the payment connector to filter by.
  ///
  /// Parameter [userId] :
  /// The user ID associated with the payment instruments.
  Future<ListPaymentInstrumentsResponse> listPaymentInstruments({
    required String paymentManagerArn,
    String? agentName,
    int? maxResults,
    String? nextToken,
    String? paymentConnectorId,
    String? userId,
  }) async {
    final headers = <String, String>{
      if (agentName != null)
        'X-Amzn-Bedrock-AgentCore-Payments-Agent-Name': agentName.toString(),
      if (userId != null)
        'X-Amzn-Bedrock-AgentCore-Payments-User-Id': userId.toString(),
    };
    final $payload = <String, dynamic>{
      'paymentManagerArn': paymentManagerArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (paymentConnectorId != null) 'paymentConnectorId': paymentConnectorId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/payments/listPaymentInstruments',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListPaymentInstrumentsResponse.fromJson(response);
  }

  /// Get the balance of a payment instrument.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [chain] :
  /// The specific blockchain chain to query balance on. Required because
  /// balances are chain-specific.
  ///
  /// Parameter [paymentConnectorId] :
  /// The ID of the payment connector associated with this instrument.
  ///
  /// Parameter [paymentInstrumentId] :
  /// The ID of the payment instrument to query balance for.
  ///
  /// Parameter [paymentManagerArn] :
  /// The ARN of the payment manager that owns this payment instrument.
  ///
  /// Parameter [token] :
  /// The token to query balance for. Only tokens supported for X402 payments
  /// are returned.
  ///
  /// Parameter [agentName] :
  /// The agent name associated with this request, used for observability.
  ///
  /// Parameter [userId] :
  /// The user ID associated with this payment instrument.
  Future<GetPaymentInstrumentBalanceResponse> getPaymentInstrumentBalance({
    required BlockchainChainId chain,
    required String paymentConnectorId,
    required String paymentInstrumentId,
    required String paymentManagerArn,
    required InstrumentBalanceToken token,
    String? agentName,
    String? userId,
  }) async {
    final headers = <String, String>{
      if (agentName != null)
        'X-Amzn-Bedrock-AgentCore-Payments-Agent-Name': agentName.toString(),
      if (userId != null)
        'X-Amzn-Bedrock-AgentCore-Payments-User-Id': userId.toString(),
    };
    final $payload = <String, dynamic>{
      'chain': chain.value,
      'paymentConnectorId': paymentConnectorId,
      'paymentInstrumentId': paymentInstrumentId,
      'paymentManagerArn': paymentManagerArn,
      'token': token.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/payments/getPaymentInstrumentBalance',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetPaymentInstrumentBalanceResponse.fromJson(response);
  }

  /// Create a new payment session.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [expiryTimeInMinutes] :
  /// The session expiry time in minutes. Must be between 15 and 480 minutes.
  ///
  /// Parameter [paymentManagerArn] :
  /// The ARN of the payment manager that owns this session.
  ///
  /// Parameter [agentName] :
  /// The agent name associated with this request, used for observability.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [limits] :
  /// The spending limits for this payment session.
  ///
  /// Parameter [userId] :
  /// The user ID associated with this payment session.
  Future<CreatePaymentSessionResponse> createPaymentSession({
    required int expiryTimeInMinutes,
    required String paymentManagerArn,
    String? agentName,
    String? clientToken,
    SessionLimits? limits,
    String? userId,
  }) async {
    final headers = <String, String>{
      if (agentName != null)
        'X-Amzn-Bedrock-AgentCore-Payments-Agent-Name': agentName.toString(),
      if (userId != null)
        'X-Amzn-Bedrock-AgentCore-Payments-User-Id': userId.toString(),
    };
    final $payload = <String, dynamic>{
      'expiryTimeInMinutes': expiryTimeInMinutes,
      'paymentManagerArn': paymentManagerArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (limits != null) 'limits': limits,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/payments/createPaymentSession',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreatePaymentSessionResponse.fromJson(response);
  }

  /// Get a payment session.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [paymentManagerArn] :
  /// The ARN of the payment manager that owns this session.
  ///
  /// Parameter [paymentSessionId] :
  /// The ID of the payment session to retrieve.
  ///
  /// Parameter [agentName] :
  /// The agent name associated with this request, used for observability.
  ///
  /// Parameter [userId] :
  /// The user ID associated with this payment session.
  Future<GetPaymentSessionResponse> getPaymentSession({
    required String paymentManagerArn,
    required String paymentSessionId,
    String? agentName,
    String? userId,
  }) async {
    final headers = <String, String>{
      if (agentName != null)
        'X-Amzn-Bedrock-AgentCore-Payments-Agent-Name': agentName.toString(),
      if (userId != null)
        'X-Amzn-Bedrock-AgentCore-Payments-User-Id': userId.toString(),
    };
    final $payload = <String, dynamic>{
      'paymentManagerArn': paymentManagerArn,
      'paymentSessionId': paymentSessionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/payments/getPaymentSession',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetPaymentSessionResponse.fromJson(response);
  }

  /// Deletes a payment session. This permanently removes the payment session
  /// record.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [paymentManagerArn] :
  /// The payment manager ARN. Must match the session's paymentManagerArn.
  ///
  /// Parameter [paymentSessionId] :
  /// The payment session ID to delete.
  ///
  /// Parameter [userId] :
  /// The user ID making the delete request. Must match the session's userId.
  Future<DeletePaymentSessionResponse> deletePaymentSession({
    required String paymentManagerArn,
    required String paymentSessionId,
    String? userId,
  }) async {
    final headers = <String, String>{
      if (userId != null)
        'X-Amzn-Bedrock-AgentCore-Payments-User-Id': userId.toString(),
    };
    final $payload = <String, dynamic>{
      'paymentManagerArn': paymentManagerArn,
      'paymentSessionId': paymentSessionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/payments/deletePaymentSession',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DeletePaymentSessionResponse.fromJson(response);
  }

  /// List payment sessions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [paymentManagerArn] :
  /// The ARN of the payment manager that owns the sessions.
  ///
  /// Parameter [agentName] :
  /// The agent name associated with this request, used for observability.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// Token for pagination to retrieve the next set of results.
  ///
  /// Parameter [userId] :
  /// The user ID associated with the payment sessions.
  Future<ListPaymentSessionsResponse> listPaymentSessions({
    required String paymentManagerArn,
    String? agentName,
    int? maxResults,
    String? nextToken,
    String? userId,
  }) async {
    final headers = <String, String>{
      if (agentName != null)
        'X-Amzn-Bedrock-AgentCore-Payments-Agent-Name': agentName.toString(),
      if (userId != null)
        'X-Amzn-Bedrock-AgentCore-Payments-User-Id': userId.toString(),
    };
    final $payload = <String, dynamic>{
      'paymentManagerArn': paymentManagerArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/payments/listPaymentSessions',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListPaymentSessionsResponse.fromJson(response);
  }

  /// Processes a payment using a payment instrument within a payment session.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [paymentInput] :
  /// The payment input details specific to the payment type.
  ///
  /// Parameter [paymentInstrumentId] :
  /// The ID of the payment instrument to use.
  ///
  /// Parameter [paymentManagerArn] :
  /// The ARN of the payment manager.
  ///
  /// Parameter [paymentSessionId] :
  /// The ID of the payment session.
  ///
  /// Parameter [paymentType] :
  /// The type of payment to process.
  ///
  /// Parameter [agentName] :
  /// The agent name associated with this request, used for observability.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [userId] :
  /// The user ID associated with this payment.
  Future<ProcessPaymentResponse> processPayment({
    required PaymentInput paymentInput,
    required String paymentInstrumentId,
    required String paymentManagerArn,
    required String paymentSessionId,
    required PaymentType paymentType,
    String? agentName,
    String? clientToken,
    String? userId,
  }) async {
    final headers = <String, String>{
      if (agentName != null)
        'X-Amzn-Bedrock-AgentCore-Payments-Agent-Name': agentName.toString(),
      if (userId != null)
        'X-Amzn-Bedrock-AgentCore-Payments-User-Id': userId.toString(),
    };
    final $payload = <String, dynamic>{
      'paymentInput': paymentInput,
      'paymentInstrumentId': paymentInstrumentId,
      'paymentManagerArn': paymentManagerArn,
      'paymentSessionId': paymentSessionId,
      'paymentType': paymentType.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/payments/processPayment',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ProcessPaymentResponse.fromJson(response);
  }

  /// Searches for registry records using semantic, lexical, or hybrid queries.
  /// Returns metadata for matching records ordered by relevance within the
  /// specified registry.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [registryIds] :
  /// The list of registry identifiers to search within. Currently, you can
  /// specify exactly one registry identifier. You can provide either the full
  /// Amazon Web Services Resource Name (ARN) or the 12-character alphanumeric
  /// registry ID.
  ///
  /// Parameter [searchQuery] :
  /// The search query to find matching registry records.
  ///
  /// Parameter [filters] :
  /// A metadata filter expression to narrow search results. Uses structured
  /// JSON operators including field-level operators (<code>$eq</code>,
  /// <code>$ne</code>, <code>$in</code>) and logical operators
  /// (<code>$and</code>, <code>$or</code>) on filterable fields
  /// (<code>name</code>, <code>descriptorType</code>, <code>version</code>).
  /// For example, to filter by descriptor type: <code>{"descriptorType":
  /// {"$eq": "MCP"}}</code>. To combine filters: <code>{"$and":
  /// \[{"descriptorType": {"$eq": "MCP"}}, {"name": {"$eq":
  /// "my-tool"}}\]}</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to return in a single call. Valid values are
  /// 1 through 20. The default value is 10.
  Future<SearchRegistryRecordsResponse> searchRegistryRecords({
    required List<String> registryIds,
    required String searchQuery,
    Object? filters,
    int? maxResults,
  }) async {
    final $payload = <String, dynamic>{
      'registryIds': registryIds,
      'searchQuery': searchQuery,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/registry-records/search',
      exceptionFnMap: _exceptionFns,
    );
    return SearchRegistryRecordsResponse.fromJson(response);
  }
}

/// @nodoc
class CompleteResourceTokenAuthResponse {
  CompleteResourceTokenAuthResponse();

  factory CompleteResourceTokenAuthResponse.fromJson(Map<String, dynamic> _) {
    return CompleteResourceTokenAuthResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The exception that occurs when you do not have sufficient permissions to
/// perform an action. Verify that your IAM policy includes the necessary
/// permissions for the operation you are trying to perform.
///
/// @nodoc
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

/// The exception that occurs when the service encounters an unexpected internal
/// error. This is a temporary condition that will resolve itself with retries.
/// We recommend implementing exponential backoff retry logic in your
/// application.
///
/// @nodoc
class InternalServerException implements _s.AwsException {
  final String? message;

  InternalServerException({
    this.message,
  });

  factory InternalServerException.fromJson(Map<String, dynamic> json) {
    return InternalServerException(
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

/// The exception that occurs when the specified resource does not exist. This
/// can happen when using an invalid identifier or when trying to access a
/// resource that has been deleted.
///
/// @nodoc
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

/// The exception that occurs when the request was denied due to request
/// throttling. This happens when you exceed the allowed request rate for an
/// operation. Reduce the frequency of requests or implement exponential backoff
/// retry logic in your application.
///
/// @nodoc
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

/// The exception that occurs when the input fails to satisfy the constraints
/// specified by the service. Check the error message for details about which
/// input parameter is invalid and correct your request.
///
/// @nodoc
class ValidationException implements _s.AwsException {
  final List<ValidationExceptionField>? fieldList;
  final String? message;
  final ValidationExceptionReason? reason;

  ValidationException({
    this.fieldList,
    this.message,
    this.reason,
  });

  factory ValidationException.fromJson(Map<String, dynamic> json) {
    return ValidationException(
      fieldList: (json['fieldList'] as List?)
          ?.nonNulls
          .map((e) =>
              ValidationExceptionField.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      reason: (json['reason'] as String?)
          ?.let(ValidationExceptionReason.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldList = this.fieldList;
    final message = this.message;
    final reason = this.reason;
    return {
      if (fieldList != null) 'fieldList': fieldList,
      if (message != null) 'message': message,
      if (reason != null) 'reason': reason.value,
    };
  }
}

/// @nodoc
class GetResourceApiKeyResponse {
  /// The API key associated with the resource requested.
  final String apiKey;

  GetResourceApiKeyResponse({
    required this.apiKey,
  });

  factory GetResourceApiKeyResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceApiKeyResponse(
      apiKey: (json['apiKey'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final apiKey = this.apiKey;
    return {
      'apiKey': apiKey,
    };
  }
}

/// @nodoc
class GetResourceOauth2TokenResponse {
  /// The OAuth 2.0 access token to use.
  final String? accessToken;

  /// The URL to initiate the authorization process, provided when the access
  /// token requires user authorization.
  final String? authorizationUrl;

  /// Status indicating whether the user's authorization session is in progress or
  /// has failed. This helps determine the next steps in the OAuth2 authentication
  /// flow.
  final SessionStatus? sessionStatus;

  /// Unique identifier for the user's authorization session for retrieving OAuth2
  /// tokens. This matches the sessionId from the request and can be used to track
  /// the session state.
  final String? sessionUri;

  GetResourceOauth2TokenResponse({
    this.accessToken,
    this.authorizationUrl,
    this.sessionStatus,
    this.sessionUri,
  });

  factory GetResourceOauth2TokenResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceOauth2TokenResponse(
      accessToken: json['accessToken'] as String?,
      authorizationUrl: json['authorizationUrl'] as String?,
      sessionStatus:
          (json['sessionStatus'] as String?)?.let(SessionStatus.fromString),
      sessionUri: json['sessionUri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessToken = this.accessToken;
    final authorizationUrl = this.authorizationUrl;
    final sessionStatus = this.sessionStatus;
    final sessionUri = this.sessionUri;
    return {
      if (accessToken != null) 'accessToken': accessToken,
      if (authorizationUrl != null) 'authorizationUrl': authorizationUrl,
      if (sessionStatus != null) 'sessionStatus': sessionStatus.value,
      if (sessionUri != null) 'sessionUri': sessionUri,
    };
  }
}

/// @nodoc
class GetResourcePaymentTokenResponse {
  /// Vendor-specific token response output. Contains all response data in a
  /// type-safe, vendor-specific structure.
  final PaymentTokenResponseOutput paymentTokenResponse;

  GetResourcePaymentTokenResponse({
    required this.paymentTokenResponse,
  });

  factory GetResourcePaymentTokenResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePaymentTokenResponse(
      paymentTokenResponse: PaymentTokenResponseOutput.fromJson(
          (json['paymentTokenResponse'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final paymentTokenResponse = this.paymentTokenResponse;
    return {
      'paymentTokenResponse': paymentTokenResponse,
    };
  }
}

/// @nodoc
class GetWorkloadAccessTokenResponse {
  /// An opaque token representing the identity of both the workload and the user.
  final String workloadAccessToken;

  GetWorkloadAccessTokenResponse({
    required this.workloadAccessToken,
  });

  factory GetWorkloadAccessTokenResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkloadAccessTokenResponse(
      workloadAccessToken: (json['workloadAccessToken'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final workloadAccessToken = this.workloadAccessToken;
    return {
      'workloadAccessToken': workloadAccessToken,
    };
  }
}

/// @nodoc
class GetWorkloadAccessTokenForJWTResponse {
  /// An opaque token representing the identity of both the workload and the user.
  final String workloadAccessToken;

  GetWorkloadAccessTokenForJWTResponse({
    required this.workloadAccessToken,
  });

  factory GetWorkloadAccessTokenForJWTResponse.fromJson(
      Map<String, dynamic> json) {
    return GetWorkloadAccessTokenForJWTResponse(
      workloadAccessToken: (json['workloadAccessToken'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final workloadAccessToken = this.workloadAccessToken;
    return {
      'workloadAccessToken': workloadAccessToken,
    };
  }
}

/// @nodoc
class GetWorkloadAccessTokenForUserIdResponse {
  /// The access token for the specified workload.
  final String workloadAccessToken;

  GetWorkloadAccessTokenForUserIdResponse({
    required this.workloadAccessToken,
  });

  factory GetWorkloadAccessTokenForUserIdResponse.fromJson(
      Map<String, dynamic> json) {
    return GetWorkloadAccessTokenForUserIdResponse(
      workloadAccessToken: (json['workloadAccessToken'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final workloadAccessToken = this.workloadAccessToken;
    return {
      'workloadAccessToken': workloadAccessToken,
    };
  }
}

/// @nodoc
class InvokeCodeInterpreterResponse {
  /// The stream containing the results of the code execution. This includes
  /// output, errors, and execution status.
  final CodeInterpreterStreamOutput stream;

  /// The identifier of the code interpreter session.
  final String? sessionId;

  InvokeCodeInterpreterResponse({
    required this.stream,
    this.sessionId,
  });

  Map<String, dynamic> toJson() {
    final stream = this.stream;
    final sessionId = this.sessionId;
    return {
      'stream': stream,
    };
  }
}

/// The exception that occurs when the request conflicts with the current state
/// of the resource. This can happen when trying to modify a resource that is
/// currently being modified by another request, or when trying to create a
/// resource that already exists.
///
/// @nodoc
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

/// The exception that occurs when the request would cause a service quota to be
/// exceeded. Review your service quotas and either reduce your request rate or
/// request a quota increase.
///
/// @nodoc
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

/// @nodoc
class InvokeHarnessResponse {
  /// The streaming output from the harness invocation.
  final InvokeHarnessStreamOutput stream;

  InvokeHarnessResponse({
    required this.stream,
  });

  Map<String, dynamic> toJson() {
    final stream = this.stream;
    return {
      'stream': stream,
    };
  }
}

/// The exception that occurs when there is an error in the runtime client. This
/// can happen due to network issues, invalid configuration, or other
/// client-side problems. Check the error message for specific details about the
/// error.
///
/// @nodoc
class RuntimeClientError implements _s.AwsException {
  final String? message;

  RuntimeClientError({
    this.message,
  });

  factory RuntimeClientError.fromJson(Map<String, dynamic> json) {
    return RuntimeClientError(
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

/// @nodoc
class GetAgentCardResponse {
  /// An agent card document that contains metadata and capabilities for an
  /// AgentCore Runtime agent.
  final Object agentCard;

  /// The ID of the session associated with the AgentCore Runtime agent.
  final String? runtimeSessionId;

  /// The status code of the request.
  final int? statusCode;

  GetAgentCardResponse({
    required this.agentCard,
    this.runtimeSessionId,
    this.statusCode,
  });

  Map<String, dynamic> toJson() {
    final agentCard = this.agentCard;
    final runtimeSessionId = this.runtimeSessionId;
    final statusCode = this.statusCode;
    return {
      'agentCard': agentCard,
    };
  }
}

/// @nodoc
class InvokeAgentRuntimeResponse {
  /// The MIME type of the response data. This indicates how to interpret the
  /// response data. Common values include application/json for JSON data.
  final String contentType;

  /// Additional context information for distributed tracing.
  final String? baggage;

  /// The version of the MCP protocol being used.
  final String? mcpProtocolVersion;

  /// The identifier of the MCP session.
  final String? mcpSessionId;

  /// The response data from the agent runtime. The format of this data depends on
  /// the specific agent configuration and the requested accept type. For most
  /// agents, this is a JSON object containing the agent's response to the user's
  /// request.
  final Uint8List? response;

  /// The identifier of the runtime session.
  final String? runtimeSessionId;

  /// The HTTP status code of the response. A status code of 200 indicates a
  /// successful operation. Other status codes indicate various error conditions.
  final int? statusCode;

  /// The trace identifier for request tracking.
  final String? traceId;

  /// The parent trace information for distributed tracing.
  final String? traceParent;

  /// The trace state information for distributed tracing.
  final String? traceState;

  InvokeAgentRuntimeResponse({
    required this.contentType,
    this.baggage,
    this.mcpProtocolVersion,
    this.mcpSessionId,
    this.response,
    this.runtimeSessionId,
    this.statusCode,
    this.traceId,
    this.traceParent,
    this.traceState,
  });

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final baggage = this.baggage;
    final mcpProtocolVersion = this.mcpProtocolVersion;
    final mcpSessionId = this.mcpSessionId;
    final response = this.response;
    final runtimeSessionId = this.runtimeSessionId;
    final statusCode = this.statusCode;
    final traceId = this.traceId;
    final traceParent = this.traceParent;
    final traceState = this.traceState;
    return {
      if (response != null) 'response': base64Encode(response),
    };
  }
}

/// Response for InvokeAgentRuntimeCommand operation.
///
/// @nodoc
class InvokeAgentRuntimeCommandResponse {
  /// The MIME type of the response data. This indicates how to interpret the
  /// response data. Common values include application/json for JSON data.
  final String contentType;

  /// The streaming output from the command execution. This stream contains events
  /// that provide real-time updates including standard output, standard error,
  /// and completion status.
  final InvokeAgentRuntimeCommandStreamOutput stream;

  /// Additional context information for distributed tracing.
  final String? baggage;

  /// The unique identifier of the runtime session in which the command was
  /// executed.
  final String? runtimeSessionId;

  /// The HTTP status code of the response. A status code of 200 indicates a
  /// successful operation. Other status codes indicate various error conditions.
  final int? statusCode;

  /// The trace identifier for request tracking.
  final String? traceId;

  /// The parent trace information for distributed tracing.
  final String? traceParent;

  /// The trace state information for distributed tracing.
  final String? traceState;

  InvokeAgentRuntimeCommandResponse({
    required this.contentType,
    required this.stream,
    this.baggage,
    this.runtimeSessionId,
    this.statusCode,
    this.traceId,
    this.traceParent,
    this.traceState,
  });

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final stream = this.stream;
    final baggage = this.baggage;
    final runtimeSessionId = this.runtimeSessionId;
    final statusCode = this.statusCode;
    final traceId = this.traceId;
    final traceParent = this.traceParent;
    final traceState = this.traceState;
    return {
      'stream': stream,
    };
  }
}

/// @nodoc
class StopRuntimeSessionResponse {
  /// The ID of the session that you requested to stop.
  final String? runtimeSessionId;

  /// The status code of the request to stop the session.
  final int? statusCode;

  StopRuntimeSessionResponse({
    this.runtimeSessionId,
    this.statusCode,
  });

  Map<String, dynamic> toJson() {
    final runtimeSessionId = this.runtimeSessionId;
    final statusCode = this.statusCode;
    return {};
  }
}

/// @nodoc
class SaveBrowserSessionProfileResponse {
  /// The unique identifier of the browser associated with the session from which
  /// the profile was saved.
  final String browserIdentifier;

  /// The timestamp when the browser profile was last updated. This value is in
  /// ISO 8601 format.
  final DateTime lastUpdatedAt;

  /// The unique identifier of the saved browser profile.
  final String profileIdentifier;

  /// The unique identifier of the browser session from which the profile was
  /// saved.
  final String sessionId;

  SaveBrowserSessionProfileResponse({
    required this.browserIdentifier,
    required this.lastUpdatedAt,
    required this.profileIdentifier,
    required this.sessionId,
  });

  factory SaveBrowserSessionProfileResponse.fromJson(
      Map<String, dynamic> json) {
    return SaveBrowserSessionProfileResponse(
      browserIdentifier: (json['browserIdentifier'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['lastUpdatedAt'] ?? 0),
      profileIdentifier: (json['profileIdentifier'] as String?) ?? '',
      sessionId: (json['sessionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final browserIdentifier = this.browserIdentifier;
    final lastUpdatedAt = this.lastUpdatedAt;
    final profileIdentifier = this.profileIdentifier;
    final sessionId = this.sessionId;
    return {
      'browserIdentifier': browserIdentifier,
      'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      'profileIdentifier': profileIdentifier,
      'sessionId': sessionId,
    };
  }
}

/// @nodoc
class GetBrowserSessionResponse {
  /// The identifier of the browser.
  final String browserIdentifier;

  /// The time at which the browser session was created.
  final DateTime createdAt;

  /// The identifier of the browser session.
  final String sessionId;

  /// The list of certificates installed in the browser session.
  final List<Certificate>? certificates;

  /// A list of files containing enterprise policies for the browser session.
  final List<BrowserEnterprisePolicy>? enterprisePolicies;

  /// The list of browser extensions that are configured in the browser session.
  final List<BrowserExtension>? extensions;

  /// The time at which the browser session was last updated.
  final DateTime? lastUpdatedAt;

  /// The name of the browser session.
  final String? name;

  /// The browser profile configuration associated with this session. Contains the
  /// profile identifier that links to persistent browser data such as cookies and
  /// local storage.
  final BrowserProfileConfiguration? profileConfiguration;

  /// The active proxy configuration for this browser session. This field is only
  /// present if proxy configuration was provided when the session was started
  /// using <code>StartBrowserSession</code>. The configuration includes proxy
  /// servers, domain bypass rules and the proxy authentication credentials.
  final ProxyConfiguration? proxyConfiguration;

  /// The artifact containing the session replay information.
  final String? sessionReplayArtifact;

  /// The timeout period for the browser session in seconds.
  final int? sessionTimeoutSeconds;

  /// The current status of the browser session. Possible values include ACTIVE,
  /// STOPPING, and STOPPED.
  final BrowserSessionStatus? status;

  /// The streams associated with this browser session. These include the
  /// automation stream and live view stream.
  final BrowserSessionStream? streams;
  final ViewPort? viewPort;

  GetBrowserSessionResponse({
    required this.browserIdentifier,
    required this.createdAt,
    required this.sessionId,
    this.certificates,
    this.enterprisePolicies,
    this.extensions,
    this.lastUpdatedAt,
    this.name,
    this.profileConfiguration,
    this.proxyConfiguration,
    this.sessionReplayArtifact,
    this.sessionTimeoutSeconds,
    this.status,
    this.streams,
    this.viewPort,
  });

  factory GetBrowserSessionResponse.fromJson(Map<String, dynamic> json) {
    return GetBrowserSessionResponse(
      browserIdentifier: (json['browserIdentifier'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      sessionId: (json['sessionId'] as String?) ?? '',
      certificates: (json['certificates'] as List?)
          ?.nonNulls
          .map((e) => Certificate.fromJson(e as Map<String, dynamic>))
          .toList(),
      enterprisePolicies: (json['enterprisePolicies'] as List?)
          ?.nonNulls
          .map((e) =>
              BrowserEnterprisePolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      extensions: (json['extensions'] as List?)
          ?.nonNulls
          .map((e) => BrowserExtension.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      profileConfiguration: json['profileConfiguration'] != null
          ? BrowserProfileConfiguration.fromJson(
              json['profileConfiguration'] as Map<String, dynamic>)
          : null,
      proxyConfiguration: json['proxyConfiguration'] != null
          ? ProxyConfiguration.fromJson(
              json['proxyConfiguration'] as Map<String, dynamic>)
          : null,
      sessionReplayArtifact: json['sessionReplayArtifact'] as String?,
      sessionTimeoutSeconds: json['sessionTimeoutSeconds'] as int?,
      status: (json['status'] as String?)?.let(BrowserSessionStatus.fromString),
      streams: json['streams'] != null
          ? BrowserSessionStream.fromJson(
              json['streams'] as Map<String, dynamic>)
          : null,
      viewPort: json['viewPort'] != null
          ? ViewPort.fromJson(json['viewPort'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final browserIdentifier = this.browserIdentifier;
    final createdAt = this.createdAt;
    final sessionId = this.sessionId;
    final certificates = this.certificates;
    final enterprisePolicies = this.enterprisePolicies;
    final extensions = this.extensions;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final profileConfiguration = this.profileConfiguration;
    final proxyConfiguration = this.proxyConfiguration;
    final sessionReplayArtifact = this.sessionReplayArtifact;
    final sessionTimeoutSeconds = this.sessionTimeoutSeconds;
    final status = this.status;
    final streams = this.streams;
    final viewPort = this.viewPort;
    return {
      'browserIdentifier': browserIdentifier,
      'createdAt': iso8601ToJson(createdAt),
      'sessionId': sessionId,
      if (certificates != null) 'certificates': certificates,
      if (enterprisePolicies != null) 'enterprisePolicies': enterprisePolicies,
      if (extensions != null) 'extensions': extensions,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (profileConfiguration != null)
        'profileConfiguration': profileConfiguration,
      if (proxyConfiguration != null) 'proxyConfiguration': proxyConfiguration,
      if (sessionReplayArtifact != null)
        'sessionReplayArtifact': sessionReplayArtifact,
      if (sessionTimeoutSeconds != null)
        'sessionTimeoutSeconds': sessionTimeoutSeconds,
      if (status != null) 'status': status.value,
      if (streams != null) 'streams': streams,
      if (viewPort != null) 'viewPort': viewPort,
    };
  }
}

/// Response for the InvokeBrowser operation.
///
/// @nodoc
class InvokeBrowserResponse {
  /// The result of the browser action. The member set in the result corresponds
  /// to the action that was performed.
  final BrowserActionResult result;

  /// The unique identifier of the browser session on which the action was
  /// performed.
  final String sessionId;

  InvokeBrowserResponse({
    required this.result,
    required this.sessionId,
  });

  Map<String, dynamic> toJson() {
    final result = this.result;
    final sessionId = this.sessionId;
    return {
      'result': result,
    };
  }
}

/// @nodoc
class ListBrowserSessionsResponse {
  /// The list of browser sessions that match the specified criteria.
  final List<BrowserSessionSummary> items;

  /// The token to use in a subsequent <code>ListBrowserSessions</code> request to
  /// get the next set of results.
  final String? nextToken;

  ListBrowserSessionsResponse({
    required this.items,
    this.nextToken,
  });

  factory ListBrowserSessionsResponse.fromJson(Map<String, dynamic> json) {
    return ListBrowserSessionsResponse(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) => BrowserSessionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class StartBrowserSessionResponse {
  /// The identifier of the browser.
  final String browserIdentifier;

  /// The timestamp when the browser session was created.
  final DateTime createdAt;

  /// The unique identifier of the created browser session.
  final String sessionId;

  /// The streams associated with this browser session. These include the
  /// automation stream and live view stream.
  final BrowserSessionStream? streams;

  StartBrowserSessionResponse({
    required this.browserIdentifier,
    required this.createdAt,
    required this.sessionId,
    this.streams,
  });

  factory StartBrowserSessionResponse.fromJson(Map<String, dynamic> json) {
    return StartBrowserSessionResponse(
      browserIdentifier: (json['browserIdentifier'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      sessionId: (json['sessionId'] as String?) ?? '',
      streams: json['streams'] != null
          ? BrowserSessionStream.fromJson(
              json['streams'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final browserIdentifier = this.browserIdentifier;
    final createdAt = this.createdAt;
    final sessionId = this.sessionId;
    final streams = this.streams;
    return {
      'browserIdentifier': browserIdentifier,
      'createdAt': iso8601ToJson(createdAt),
      'sessionId': sessionId,
      if (streams != null) 'streams': streams,
    };
  }
}

/// @nodoc
class StopBrowserSessionResponse {
  /// The identifier of the browser.
  final String browserIdentifier;

  /// The time at which the browser session was last updated.
  final DateTime lastUpdatedAt;

  /// The identifier of the browser session.
  final String sessionId;

  StopBrowserSessionResponse({
    required this.browserIdentifier,
    required this.lastUpdatedAt,
    required this.sessionId,
  });

  factory StopBrowserSessionResponse.fromJson(Map<String, dynamic> json) {
    return StopBrowserSessionResponse(
      browserIdentifier: (json['browserIdentifier'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['lastUpdatedAt'] ?? 0),
      sessionId: (json['sessionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final browserIdentifier = this.browserIdentifier;
    final lastUpdatedAt = this.lastUpdatedAt;
    final sessionId = this.sessionId;
    return {
      'browserIdentifier': browserIdentifier,
      'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      'sessionId': sessionId,
    };
  }
}

/// @nodoc
class UpdateBrowserStreamResponse {
  /// The identifier of the browser.
  final String browserIdentifier;

  /// The identifier of the browser session.
  final String sessionId;
  final BrowserSessionStream streams;

  /// The time at which the browser stream was updated.
  final DateTime updatedAt;

  UpdateBrowserStreamResponse({
    required this.browserIdentifier,
    required this.sessionId,
    required this.streams,
    required this.updatedAt,
  });

  factory UpdateBrowserStreamResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBrowserStreamResponse(
      browserIdentifier: (json['browserIdentifier'] as String?) ?? '',
      sessionId: (json['sessionId'] as String?) ?? '',
      streams: BrowserSessionStream.fromJson(
          (json['streams'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final browserIdentifier = this.browserIdentifier;
    final sessionId = this.sessionId;
    final streams = this.streams;
    final updatedAt = this.updatedAt;
    return {
      'browserIdentifier': browserIdentifier,
      'sessionId': sessionId,
      'streams': streams,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class GetCodeInterpreterSessionResponse {
  /// The identifier of the code interpreter.
  final String codeInterpreterIdentifier;

  /// The time at which the code interpreter session was created.
  final DateTime createdAt;

  /// The identifier of the code interpreter session.
  final String sessionId;

  /// The list of certificates installed in the code interpreter session.
  final List<Certificate>? certificates;

  /// The name of the code interpreter session.
  final String? name;

  /// The timeout period for the code interpreter session in seconds.
  final int? sessionTimeoutSeconds;

  /// The current status of the code interpreter session. Possible values include
  /// ACTIVE, STOPPING, and STOPPED.
  final CodeInterpreterSessionStatus? status;

  GetCodeInterpreterSessionResponse({
    required this.codeInterpreterIdentifier,
    required this.createdAt,
    required this.sessionId,
    this.certificates,
    this.name,
    this.sessionTimeoutSeconds,
    this.status,
  });

  factory GetCodeInterpreterSessionResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCodeInterpreterSessionResponse(
      codeInterpreterIdentifier:
          (json['codeInterpreterIdentifier'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      sessionId: (json['sessionId'] as String?) ?? '',
      certificates: (json['certificates'] as List?)
          ?.nonNulls
          .map((e) => Certificate.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      sessionTimeoutSeconds: json['sessionTimeoutSeconds'] as int?,
      status: (json['status'] as String?)
          ?.let(CodeInterpreterSessionStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final codeInterpreterIdentifier = this.codeInterpreterIdentifier;
    final createdAt = this.createdAt;
    final sessionId = this.sessionId;
    final certificates = this.certificates;
    final name = this.name;
    final sessionTimeoutSeconds = this.sessionTimeoutSeconds;
    final status = this.status;
    return {
      'codeInterpreterIdentifier': codeInterpreterIdentifier,
      'createdAt': iso8601ToJson(createdAt),
      'sessionId': sessionId,
      if (certificates != null) 'certificates': certificates,
      if (name != null) 'name': name,
      if (sessionTimeoutSeconds != null)
        'sessionTimeoutSeconds': sessionTimeoutSeconds,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class ListCodeInterpreterSessionsResponse {
  /// The list of code interpreter sessions that match the specified criteria.
  final List<CodeInterpreterSessionSummary> items;

  /// The token to use in a subsequent <code>ListCodeInterpreterSessions</code>
  /// request to get the next set of results.
  final String? nextToken;

  ListCodeInterpreterSessionsResponse({
    required this.items,
    this.nextToken,
  });

  factory ListCodeInterpreterSessionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCodeInterpreterSessionsResponse(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              CodeInterpreterSessionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class StartCodeInterpreterSessionResponse {
  /// The identifier of the code interpreter.
  final String codeInterpreterIdentifier;

  /// The time at which the code interpreter session was created.
  final DateTime createdAt;

  /// The unique identifier of the created code interpreter session.
  final String sessionId;

  StartCodeInterpreterSessionResponse({
    required this.codeInterpreterIdentifier,
    required this.createdAt,
    required this.sessionId,
  });

  factory StartCodeInterpreterSessionResponse.fromJson(
      Map<String, dynamic> json) {
    return StartCodeInterpreterSessionResponse(
      codeInterpreterIdentifier:
          (json['codeInterpreterIdentifier'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      sessionId: (json['sessionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final codeInterpreterIdentifier = this.codeInterpreterIdentifier;
    final createdAt = this.createdAt;
    final sessionId = this.sessionId;
    return {
      'codeInterpreterIdentifier': codeInterpreterIdentifier,
      'createdAt': iso8601ToJson(createdAt),
      'sessionId': sessionId,
    };
  }
}

/// @nodoc
class StopCodeInterpreterSessionResponse {
  /// The identifier of the code interpreter.
  final String codeInterpreterIdentifier;

  /// The timestamp when the code interpreter session was last updated.
  final DateTime lastUpdatedAt;

  /// The identifier of the code interpreter session.
  final String sessionId;

  StopCodeInterpreterSessionResponse({
    required this.codeInterpreterIdentifier,
    required this.lastUpdatedAt,
    required this.sessionId,
  });

  factory StopCodeInterpreterSessionResponse.fromJson(
      Map<String, dynamic> json) {
    return StopCodeInterpreterSessionResponse(
      codeInterpreterIdentifier:
          (json['codeInterpreterIdentifier'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['lastUpdatedAt'] ?? 0),
      sessionId: (json['sessionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final codeInterpreterIdentifier = this.codeInterpreterIdentifier;
    final lastUpdatedAt = this.lastUpdatedAt;
    final sessionId = this.sessionId;
    return {
      'codeInterpreterIdentifier': codeInterpreterIdentifier,
      'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      'sessionId': sessionId,
    };
  }
}

/// @nodoc
class CreateABTestResponse {
  /// The Amazon Resource Name (ARN) of the created A/B test.
  final String abTestArn;

  /// The unique identifier of the created A/B test.
  final String abTestId;

  /// The timestamp when the A/B test was created.
  final DateTime createdAt;

  /// The execution status indicating whether the A/B test is currently running.
  final ABTestExecutionStatus executionStatus;

  /// The status of the A/B test.
  final ABTestStatus status;

  /// The name of the A/B test.
  final String? name;

  CreateABTestResponse({
    required this.abTestArn,
    required this.abTestId,
    required this.createdAt,
    required this.executionStatus,
    required this.status,
    this.name,
  });

  factory CreateABTestResponse.fromJson(Map<String, dynamic> json) {
    return CreateABTestResponse(
      abTestArn: (json['abTestArn'] as String?) ?? '',
      abTestId: (json['abTestId'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      executionStatus: ABTestExecutionStatus.fromString(
          (json['executionStatus'] as String?) ?? ''),
      status: ABTestStatus.fromString((json['status'] as String?) ?? ''),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final abTestArn = this.abTestArn;
    final abTestId = this.abTestId;
    final createdAt = this.createdAt;
    final executionStatus = this.executionStatus;
    final status = this.status;
    final name = this.name;
    return {
      'abTestArn': abTestArn,
      'abTestId': abTestId,
      'createdAt': unixTimestampToJson(createdAt),
      'executionStatus': executionStatus.value,
      'status': status.value,
      if (name != null) 'name': name,
    };
  }
}

/// @nodoc
class DeleteABTestResponse {
  /// The Amazon Resource Name (ARN) of the deleted A/B test.
  final String abTestArn;

  /// The unique identifier of the deleted A/B test.
  final String abTestId;

  /// The status of the A/B test deletion operation.
  final ABTestStatus status;

  DeleteABTestResponse({
    required this.abTestArn,
    required this.abTestId,
    required this.status,
  });

  factory DeleteABTestResponse.fromJson(Map<String, dynamic> json) {
    return DeleteABTestResponse(
      abTestArn: (json['abTestArn'] as String?) ?? '',
      abTestId: (json['abTestId'] as String?) ?? '',
      status: ABTestStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final abTestArn = this.abTestArn;
    final abTestId = this.abTestId;
    final status = this.status;
    return {
      'abTestArn': abTestArn,
      'abTestId': abTestId,
      'status': status.value,
    };
  }
}

/// @nodoc
class DeleteBatchEvaluationResponse {
  /// The Amazon Resource Name (ARN) of the deleted batch evaluation.
  final String batchEvaluationArn;

  /// The unique identifier of the deleted batch evaluation.
  final String batchEvaluationId;

  /// The status of the batch evaluation deletion operation.
  final BatchEvaluationStatus status;

  DeleteBatchEvaluationResponse({
    required this.batchEvaluationArn,
    required this.batchEvaluationId,
    required this.status,
  });

  factory DeleteBatchEvaluationResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBatchEvaluationResponse(
      batchEvaluationArn: (json['batchEvaluationArn'] as String?) ?? '',
      batchEvaluationId: (json['batchEvaluationId'] as String?) ?? '',
      status:
          BatchEvaluationStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final batchEvaluationArn = this.batchEvaluationArn;
    final batchEvaluationId = this.batchEvaluationId;
    final status = this.status;
    return {
      'batchEvaluationArn': batchEvaluationArn,
      'batchEvaluationId': batchEvaluationId,
      'status': status.value,
    };
  }
}

/// @nodoc
class DeleteRecommendationResponse {
  /// The unique identifier of the deleted recommendation.
  final String recommendationId;

  /// The status of the recommendation deletion operation.
  final RecommendationStatus status;

  DeleteRecommendationResponse({
    required this.recommendationId,
    required this.status,
  });

  factory DeleteRecommendationResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRecommendationResponse(
      recommendationId: (json['recommendationId'] as String?) ?? '',
      status:
          RecommendationStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final recommendationId = this.recommendationId;
    final status = this.status;
    return {
      'recommendationId': recommendationId,
      'status': status.value,
    };
  }
}

/// @nodoc
class EvaluateResponse {
  /// The detailed evaluation results containing scores, explanations, and
  /// metadata. Includes the evaluator information, numerical or categorical
  /// ratings based on the evaluator's rating scale, and token usage statistics
  /// for the evaluation process.
  final List<EvaluationResultContent> evaluationResults;

  EvaluateResponse({
    required this.evaluationResults,
  });

  factory EvaluateResponse.fromJson(Map<String, dynamic> json) {
    return EvaluateResponse(
      evaluationResults: ((json['evaluationResults'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              EvaluationResultContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluationResults = this.evaluationResults;
    return {
      'evaluationResults': evaluationResults,
    };
  }
}

/// @nodoc
class GetABTestResponse {
  /// The Amazon Resource Name (ARN) of the A/B test.
  final String abTestArn;

  /// The unique identifier of the A/B test.
  final String abTestId;

  /// The timestamp when the A/B test was created.
  final DateTime createdAt;

  /// The evaluation configuration for measuring variant performance.
  final ABTestEvaluationConfig evaluationConfig;

  /// The execution status indicating whether the A/B test is currently running.
  final ABTestExecutionStatus executionStatus;

  /// The Amazon Resource Name (ARN) of the gateway used for traffic splitting.
  final String gatewayArn;

  /// The name of the A/B test.
  final String name;

  /// The current status of the A/B test.
  final ABTestStatus status;

  /// The timestamp when the A/B test was last updated.
  final DateTime updatedAt;

  /// The list of variants in the A/B test.
  final List<Variant> variants;

  /// The identifier of the current run of the A/B test.
  final String? currentRunId;

  /// The description of the A/B test.
  final String? description;

  /// The error details if the A/B test encountered failures.
  final List<String>? errorDetails;

  /// The gateway filter restricting which target paths are included.
  final GatewayFilter? gatewayFilter;

  /// The timestamp when the A/B test will automatically expire.
  final DateTime? maxDurationExpiresAt;

  /// The statistical results of the A/B test, including per-evaluator metrics and
  /// significance analysis.
  final ABTestResults? results;

  /// The IAM role ARN used by the A/B test.
  final String? roleArn;

  /// The timestamp when the A/B test was started.
  final DateTime? startedAt;

  /// The timestamp when the A/B test was stopped.
  final DateTime? stoppedAt;

  GetABTestResponse({
    required this.abTestArn,
    required this.abTestId,
    required this.createdAt,
    required this.evaluationConfig,
    required this.executionStatus,
    required this.gatewayArn,
    required this.name,
    required this.status,
    required this.updatedAt,
    required this.variants,
    this.currentRunId,
    this.description,
    this.errorDetails,
    this.gatewayFilter,
    this.maxDurationExpiresAt,
    this.results,
    this.roleArn,
    this.startedAt,
    this.stoppedAt,
  });

  factory GetABTestResponse.fromJson(Map<String, dynamic> json) {
    return GetABTestResponse(
      abTestArn: (json['abTestArn'] as String?) ?? '',
      abTestId: (json['abTestId'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      evaluationConfig: ABTestEvaluationConfig.fromJson(
          (json['evaluationConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      executionStatus: ABTestExecutionStatus.fromString(
          (json['executionStatus'] as String?) ?? ''),
      gatewayArn: (json['gatewayArn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: ABTestStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      variants: ((json['variants'] as List?) ?? const [])
          .nonNulls
          .map((e) => Variant.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentRunId: json['currentRunId'] as String?,
      description: json['description'] as String?,
      errorDetails: (json['errorDetails'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      gatewayFilter: json['gatewayFilter'] != null
          ? GatewayFilter.fromJson(
              json['gatewayFilter'] as Map<String, dynamic>)
          : null,
      maxDurationExpiresAt: timeStampFromJson(json['maxDurationExpiresAt']),
      results: json['results'] != null
          ? ABTestResults.fromJson(json['results'] as Map<String, dynamic>)
          : null,
      roleArn: json['roleArn'] as String?,
      startedAt: timeStampFromJson(json['startedAt']),
      stoppedAt: timeStampFromJson(json['stoppedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final abTestArn = this.abTestArn;
    final abTestId = this.abTestId;
    final createdAt = this.createdAt;
    final evaluationConfig = this.evaluationConfig;
    final executionStatus = this.executionStatus;
    final gatewayArn = this.gatewayArn;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final variants = this.variants;
    final currentRunId = this.currentRunId;
    final description = this.description;
    final errorDetails = this.errorDetails;
    final gatewayFilter = this.gatewayFilter;
    final maxDurationExpiresAt = this.maxDurationExpiresAt;
    final results = this.results;
    final roleArn = this.roleArn;
    final startedAt = this.startedAt;
    final stoppedAt = this.stoppedAt;
    return {
      'abTestArn': abTestArn,
      'abTestId': abTestId,
      'createdAt': unixTimestampToJson(createdAt),
      'evaluationConfig': evaluationConfig,
      'executionStatus': executionStatus.value,
      'gatewayArn': gatewayArn,
      'name': name,
      'status': status.value,
      'updatedAt': unixTimestampToJson(updatedAt),
      'variants': variants,
      if (currentRunId != null) 'currentRunId': currentRunId,
      if (description != null) 'description': description,
      if (errorDetails != null) 'errorDetails': errorDetails,
      if (gatewayFilter != null) 'gatewayFilter': gatewayFilter,
      if (maxDurationExpiresAt != null)
        'maxDurationExpiresAt': unixTimestampToJson(maxDurationExpiresAt),
      if (results != null) 'results': results,
      if (roleArn != null) 'roleArn': roleArn,
      if (startedAt != null) 'startedAt': unixTimestampToJson(startedAt),
      if (stoppedAt != null) 'stoppedAt': unixTimestampToJson(stoppedAt),
    };
  }
}

/// @nodoc
class GetBatchEvaluationResponse {
  /// The Amazon Resource Name (ARN) of the batch evaluation.
  final String batchEvaluationArn;

  /// The unique identifier of the batch evaluation.
  final String batchEvaluationId;

  /// The name of the batch evaluation.
  final String batchEvaluationName;

  /// The timestamp when the batch evaluation was created.
  final DateTime createdAt;

  /// The current status of the batch evaluation.
  final BatchEvaluationStatus status;

  /// The data source configuration specifying where agent traces are pulled from.
  final DataSourceConfig? dataSourceConfig;

  /// The description of the batch evaluation.
  final String? description;

  /// The error details if the batch evaluation encountered failures.
  final List<String>? errorDetails;

  /// The aggregated evaluation results, including session completion counts and
  /// evaluator score summaries.
  final EvaluationJobResults? evaluationResults;

  /// The list of evaluators applied during the batch evaluation.
  final List<Evaluator>? evaluators;

  /// The output configuration specifying where evaluation results are written.
  final OutputConfig? outputConfig;

  /// The timestamp when the batch evaluation was last updated.
  final DateTime? updatedAt;

  GetBatchEvaluationResponse({
    required this.batchEvaluationArn,
    required this.batchEvaluationId,
    required this.batchEvaluationName,
    required this.createdAt,
    required this.status,
    this.dataSourceConfig,
    this.description,
    this.errorDetails,
    this.evaluationResults,
    this.evaluators,
    this.outputConfig,
    this.updatedAt,
  });

  factory GetBatchEvaluationResponse.fromJson(Map<String, dynamic> json) {
    return GetBatchEvaluationResponse(
      batchEvaluationArn: (json['batchEvaluationArn'] as String?) ?? '',
      batchEvaluationId: (json['batchEvaluationId'] as String?) ?? '',
      batchEvaluationName: (json['batchEvaluationName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      status:
          BatchEvaluationStatus.fromString((json['status'] as String?) ?? ''),
      dataSourceConfig: json['dataSourceConfig'] != null
          ? DataSourceConfig.fromJson(
              json['dataSourceConfig'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      errorDetails: (json['errorDetails'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      evaluationResults: json['evaluationResults'] != null
          ? EvaluationJobResults.fromJson(
              json['evaluationResults'] as Map<String, dynamic>)
          : null,
      evaluators: (json['evaluators'] as List?)
          ?.nonNulls
          .map((e) => Evaluator.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputConfig: json['outputConfig'] != null
          ? OutputConfig.fromJson(json['outputConfig'] as Map<String, dynamic>)
          : null,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final batchEvaluationArn = this.batchEvaluationArn;
    final batchEvaluationId = this.batchEvaluationId;
    final batchEvaluationName = this.batchEvaluationName;
    final createdAt = this.createdAt;
    final status = this.status;
    final dataSourceConfig = this.dataSourceConfig;
    final description = this.description;
    final errorDetails = this.errorDetails;
    final evaluationResults = this.evaluationResults;
    final evaluators = this.evaluators;
    final outputConfig = this.outputConfig;
    final updatedAt = this.updatedAt;
    return {
      'batchEvaluationArn': batchEvaluationArn,
      'batchEvaluationId': batchEvaluationId,
      'batchEvaluationName': batchEvaluationName,
      'createdAt': iso8601ToJson(createdAt),
      'status': status.value,
      if (dataSourceConfig != null) 'dataSourceConfig': dataSourceConfig,
      if (description != null) 'description': description,
      if (errorDetails != null) 'errorDetails': errorDetails,
      if (evaluationResults != null) 'evaluationResults': evaluationResults,
      if (evaluators != null) 'evaluators': evaluators,
      if (outputConfig != null) 'outputConfig': outputConfig,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class GetRecommendationResponse {
  /// The timestamp when the recommendation was created.
  final DateTime createdAt;

  /// The name of the recommendation.
  final String name;

  /// The Amazon Resource Name (ARN) of the recommendation.
  final String recommendationArn;

  /// The configuration for the recommendation.
  final RecommendationConfig recommendationConfig;

  /// The unique identifier of the recommendation.
  final String recommendationId;

  /// The current status of the recommendation.
  final RecommendationStatus status;

  /// The type of recommendation.
  final RecommendationType type;

  /// The timestamp when the recommendation was last updated.
  final DateTime updatedAt;

  /// The description of the recommendation.
  final String? description;

  /// The result of the recommendation, containing the optimized system prompt or
  /// tool descriptions. Only present when the recommendation status is
  /// <code>COMPLETED</code>.
  final RecommendationResult? recommendationResult;

  GetRecommendationResponse({
    required this.createdAt,
    required this.name,
    required this.recommendationArn,
    required this.recommendationConfig,
    required this.recommendationId,
    required this.status,
    required this.type,
    required this.updatedAt,
    this.description,
    this.recommendationResult,
  });

  factory GetRecommendationResponse.fromJson(Map<String, dynamic> json) {
    return GetRecommendationResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      recommendationArn: (json['recommendationArn'] as String?) ?? '',
      recommendationConfig: RecommendationConfig.fromJson(
          (json['recommendationConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      recommendationId: (json['recommendationId'] as String?) ?? '',
      status:
          RecommendationStatus.fromString((json['status'] as String?) ?? ''),
      type: RecommendationType.fromString((json['type'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      recommendationResult: json['recommendationResult'] != null
          ? RecommendationResult.fromJson(
              json['recommendationResult'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final name = this.name;
    final recommendationArn = this.recommendationArn;
    final recommendationConfig = this.recommendationConfig;
    final recommendationId = this.recommendationId;
    final status = this.status;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final recommendationResult = this.recommendationResult;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'recommendationArn': recommendationArn,
      'recommendationConfig': recommendationConfig,
      'recommendationId': recommendationId,
      'status': status.value,
      'type': type.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (recommendationResult != null)
        'recommendationResult': recommendationResult,
    };
  }
}

/// @nodoc
class ListABTestsResponse {
  /// The list of A/B test summaries.
  final List<ABTestSummary> abTests;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListABTestsResponse({
    required this.abTests,
    this.nextToken,
  });

  factory ListABTestsResponse.fromJson(Map<String, dynamic> json) {
    return ListABTestsResponse(
      abTests: ((json['abTests'] as List?) ?? const [])
          .nonNulls
          .map((e) => ABTestSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final abTests = this.abTests;
    final nextToken = this.nextToken;
    return {
      'abTests': abTests,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListBatchEvaluationsResponse {
  /// The list of batch evaluation summaries.
  final List<BatchEvaluationSummary> batchEvaluations;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListBatchEvaluationsResponse({
    required this.batchEvaluations,
    this.nextToken,
  });

  factory ListBatchEvaluationsResponse.fromJson(Map<String, dynamic> json) {
    return ListBatchEvaluationsResponse(
      batchEvaluations: ((json['batchEvaluations'] as List?) ?? const [])
          .nonNulls
          .map(
              (e) => BatchEvaluationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchEvaluations = this.batchEvaluations;
    final nextToken = this.nextToken;
    return {
      'batchEvaluations': batchEvaluations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListRecommendationsResponse {
  /// The list of recommendation summaries.
  final List<RecommendationSummary> recommendationSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListRecommendationsResponse({
    required this.recommendationSummaries,
    this.nextToken,
  });

  factory ListRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    return ListRecommendationsResponse(
      recommendationSummaries: ((json['recommendationSummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => RecommendationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recommendationSummaries = this.recommendationSummaries;
    final nextToken = this.nextToken;
    return {
      'recommendationSummaries': recommendationSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class StartBatchEvaluationResponse {
  /// The Amazon Resource Name (ARN) of the created batch evaluation.
  final String batchEvaluationArn;

  /// The unique identifier of the created batch evaluation.
  final String batchEvaluationId;

  /// The name of the batch evaluation.
  final String batchEvaluationName;

  /// The timestamp when the batch evaluation was created.
  final DateTime createdAt;

  /// The status of the batch evaluation.
  final BatchEvaluationStatus status;

  /// The description of the batch evaluation.
  final String? description;

  /// The list of evaluators applied during the batch evaluation.
  final List<Evaluator>? evaluators;

  /// The output configuration specifying where evaluation results are written.
  final OutputConfig? outputConfig;

  StartBatchEvaluationResponse({
    required this.batchEvaluationArn,
    required this.batchEvaluationId,
    required this.batchEvaluationName,
    required this.createdAt,
    required this.status,
    this.description,
    this.evaluators,
    this.outputConfig,
  });

  factory StartBatchEvaluationResponse.fromJson(Map<String, dynamic> json) {
    return StartBatchEvaluationResponse(
      batchEvaluationArn: (json['batchEvaluationArn'] as String?) ?? '',
      batchEvaluationId: (json['batchEvaluationId'] as String?) ?? '',
      batchEvaluationName: (json['batchEvaluationName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      status:
          BatchEvaluationStatus.fromString((json['status'] as String?) ?? ''),
      description: json['description'] as String?,
      evaluators: (json['evaluators'] as List?)
          ?.nonNulls
          .map((e) => Evaluator.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputConfig: json['outputConfig'] != null
          ? OutputConfig.fromJson(json['outputConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final batchEvaluationArn = this.batchEvaluationArn;
    final batchEvaluationId = this.batchEvaluationId;
    final batchEvaluationName = this.batchEvaluationName;
    final createdAt = this.createdAt;
    final status = this.status;
    final description = this.description;
    final evaluators = this.evaluators;
    final outputConfig = this.outputConfig;
    return {
      'batchEvaluationArn': batchEvaluationArn,
      'batchEvaluationId': batchEvaluationId,
      'batchEvaluationName': batchEvaluationName,
      'createdAt': iso8601ToJson(createdAt),
      'status': status.value,
      if (description != null) 'description': description,
      if (evaluators != null) 'evaluators': evaluators,
      if (outputConfig != null) 'outputConfig': outputConfig,
    };
  }
}

/// @nodoc
class StartRecommendationResponse {
  /// The timestamp when the recommendation was created.
  final DateTime createdAt;

  /// The name of the recommendation.
  final String name;

  /// The Amazon Resource Name (ARN) of the created recommendation.
  final String recommendationArn;

  /// The configuration for the recommendation.
  final RecommendationConfig recommendationConfig;

  /// The unique identifier of the created recommendation.
  final String recommendationId;

  /// The status of the recommendation.
  final RecommendationStatus status;

  /// The type of recommendation.
  final RecommendationType type;

  /// The timestamp when the recommendation was last updated.
  final DateTime updatedAt;

  /// The description of the recommendation.
  final String? description;

  StartRecommendationResponse({
    required this.createdAt,
    required this.name,
    required this.recommendationArn,
    required this.recommendationConfig,
    required this.recommendationId,
    required this.status,
    required this.type,
    required this.updatedAt,
    this.description,
  });

  factory StartRecommendationResponse.fromJson(Map<String, dynamic> json) {
    return StartRecommendationResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      recommendationArn: (json['recommendationArn'] as String?) ?? '',
      recommendationConfig: RecommendationConfig.fromJson(
          (json['recommendationConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      recommendationId: (json['recommendationId'] as String?) ?? '',
      status:
          RecommendationStatus.fromString((json['status'] as String?) ?? ''),
      type: RecommendationType.fromString((json['type'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final name = this.name;
    final recommendationArn = this.recommendationArn;
    final recommendationConfig = this.recommendationConfig;
    final recommendationId = this.recommendationId;
    final status = this.status;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final description = this.description;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'recommendationArn': recommendationArn,
      'recommendationConfig': recommendationConfig,
      'recommendationId': recommendationId,
      'status': status.value,
      'type': type.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class StopBatchEvaluationResponse {
  /// The Amazon Resource Name (ARN) of the stopped batch evaluation.
  final String batchEvaluationArn;

  /// The unique identifier of the stopped batch evaluation.
  final String batchEvaluationId;

  /// The status of the batch evaluation after the stop request.
  final BatchEvaluationStatus status;

  /// The description of the batch evaluation.
  final String? description;

  StopBatchEvaluationResponse({
    required this.batchEvaluationArn,
    required this.batchEvaluationId,
    required this.status,
    this.description,
  });

  factory StopBatchEvaluationResponse.fromJson(Map<String, dynamic> json) {
    return StopBatchEvaluationResponse(
      batchEvaluationArn: (json['batchEvaluationArn'] as String?) ?? '',
      batchEvaluationId: (json['batchEvaluationId'] as String?) ?? '',
      status:
          BatchEvaluationStatus.fromString((json['status'] as String?) ?? ''),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchEvaluationArn = this.batchEvaluationArn;
    final batchEvaluationId = this.batchEvaluationId;
    final status = this.status;
    final description = this.description;
    return {
      'batchEvaluationArn': batchEvaluationArn,
      'batchEvaluationId': batchEvaluationId,
      'status': status.value,
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class UpdateABTestResponse {
  /// The Amazon Resource Name (ARN) of the updated A/B test.
  final String abTestArn;

  /// The unique identifier of the updated A/B test.
  final String abTestId;

  /// The execution status of the A/B test.
  final ABTestExecutionStatus executionStatus;

  /// The status of the A/B test.
  final ABTestStatus status;

  /// The timestamp when the A/B test was updated.
  final DateTime updatedAt;

  UpdateABTestResponse({
    required this.abTestArn,
    required this.abTestId,
    required this.executionStatus,
    required this.status,
    required this.updatedAt,
  });

  factory UpdateABTestResponse.fromJson(Map<String, dynamic> json) {
    return UpdateABTestResponse(
      abTestArn: (json['abTestArn'] as String?) ?? '',
      abTestId: (json['abTestId'] as String?) ?? '',
      executionStatus: ABTestExecutionStatus.fromString(
          (json['executionStatus'] as String?) ?? ''),
      status: ABTestStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final abTestArn = this.abTestArn;
    final abTestId = this.abTestId;
    final executionStatus = this.executionStatus;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      'abTestArn': abTestArn,
      'abTestId': abTestId,
      'executionStatus': executionStatus.value,
      'status': status.value,
      'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class BatchCreateMemoryRecordsOutput {
  /// A list of memory records that failed to be created, including error details
  /// for each failure.
  final List<MemoryRecordOutput> failedRecords;

  /// A list of memory records that were successfully created during the batch
  /// operation.
  final List<MemoryRecordOutput> successfulRecords;

  BatchCreateMemoryRecordsOutput({
    required this.failedRecords,
    required this.successfulRecords,
  });

  factory BatchCreateMemoryRecordsOutput.fromJson(Map<String, dynamic> json) {
    return BatchCreateMemoryRecordsOutput(
      failedRecords: ((json['failedRecords'] as List?) ?? const [])
          .nonNulls
          .map((e) => MemoryRecordOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      successfulRecords: ((json['successfulRecords'] as List?) ?? const [])
          .nonNulls
          .map((e) => MemoryRecordOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedRecords = this.failedRecords;
    final successfulRecords = this.successfulRecords;
    return {
      'failedRecords': failedRecords,
      'successfulRecords': successfulRecords,
    };
  }
}

/// @nodoc
class BatchDeleteMemoryRecordsOutput {
  /// A list of memory records that failed to be deleted, including error details
  /// for each failure.
  final List<MemoryRecordOutput> failedRecords;

  /// A list of memory records that were successfully deleted during the batch
  /// operation.
  final List<MemoryRecordOutput> successfulRecords;

  BatchDeleteMemoryRecordsOutput({
    required this.failedRecords,
    required this.successfulRecords,
  });

  factory BatchDeleteMemoryRecordsOutput.fromJson(Map<String, dynamic> json) {
    return BatchDeleteMemoryRecordsOutput(
      failedRecords: ((json['failedRecords'] as List?) ?? const [])
          .nonNulls
          .map((e) => MemoryRecordOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      successfulRecords: ((json['successfulRecords'] as List?) ?? const [])
          .nonNulls
          .map((e) => MemoryRecordOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedRecords = this.failedRecords;
    final successfulRecords = this.successfulRecords;
    return {
      'failedRecords': failedRecords,
      'successfulRecords': successfulRecords,
    };
  }
}

/// @nodoc
class BatchUpdateMemoryRecordsOutput {
  /// A list of memory records that failed to be updated, including error details
  /// for each failure.
  final List<MemoryRecordOutput> failedRecords;

  /// A list of memory records that were successfully updated during the batch
  /// operation.
  final List<MemoryRecordOutput> successfulRecords;

  BatchUpdateMemoryRecordsOutput({
    required this.failedRecords,
    required this.successfulRecords,
  });

  factory BatchUpdateMemoryRecordsOutput.fromJson(Map<String, dynamic> json) {
    return BatchUpdateMemoryRecordsOutput(
      failedRecords: ((json['failedRecords'] as List?) ?? const [])
          .nonNulls
          .map((e) => MemoryRecordOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      successfulRecords: ((json['successfulRecords'] as List?) ?? const [])
          .nonNulls
          .map((e) => MemoryRecordOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedRecords = this.failedRecords;
    final successfulRecords = this.successfulRecords;
    return {
      'failedRecords': failedRecords,
      'successfulRecords': successfulRecords,
    };
  }
}

/// @nodoc
class CreateEventOutput {
  /// The event that was created.
  final Event event;

  CreateEventOutput({
    required this.event,
  });

  factory CreateEventOutput.fromJson(Map<String, dynamic> json) {
    return CreateEventOutput(
      event: Event.fromJson((json['event'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final event = this.event;
    return {
      'event': event,
    };
  }
}

/// @nodoc
class DeleteEventOutput {
  /// The identifier of the event that was deleted.
  final String eventId;

  DeleteEventOutput({
    required this.eventId,
  });

  factory DeleteEventOutput.fromJson(Map<String, dynamic> json) {
    return DeleteEventOutput(
      eventId: (json['eventId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final eventId = this.eventId;
    return {
      'eventId': eventId,
    };
  }
}

/// @nodoc
class DeleteMemoryRecordOutput {
  /// The identifier of the memory record that was deleted.
  final String memoryRecordId;

  DeleteMemoryRecordOutput({
    required this.memoryRecordId,
  });

  factory DeleteMemoryRecordOutput.fromJson(Map<String, dynamic> json) {
    return DeleteMemoryRecordOutput(
      memoryRecordId: (json['memoryRecordId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final memoryRecordId = this.memoryRecordId;
    return {
      'memoryRecordId': memoryRecordId,
    };
  }
}

/// @nodoc
class GetEventOutput {
  /// The requested event information.
  final Event event;

  GetEventOutput({
    required this.event,
  });

  factory GetEventOutput.fromJson(Map<String, dynamic> json) {
    return GetEventOutput(
      event: Event.fromJson((json['event'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final event = this.event;
    return {
      'event': event,
    };
  }
}

/// @nodoc
class GetMemoryRecordOutput {
  /// The requested memory record.
  final MemoryRecord memoryRecord;

  GetMemoryRecordOutput({
    required this.memoryRecord,
  });

  factory GetMemoryRecordOutput.fromJson(Map<String, dynamic> json) {
    return GetMemoryRecordOutput(
      memoryRecord: MemoryRecord.fromJson(
          (json['memoryRecord'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final memoryRecord = this.memoryRecord;
    return {
      'memoryRecord': memoryRecord,
    };
  }
}

/// @nodoc
class ListActorsOutput {
  /// The list of actor summaries.
  final List<ActorSummary> actorSummaries;

  /// The token to use in a subsequent request to get the next set of results.
  /// This value is null when there are no more results to return.
  final String? nextToken;

  ListActorsOutput({
    required this.actorSummaries,
    this.nextToken,
  });

  factory ListActorsOutput.fromJson(Map<String, dynamic> json) {
    return ListActorsOutput(
      actorSummaries: ((json['actorSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ActorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actorSummaries = this.actorSummaries;
    final nextToken = this.nextToken;
    return {
      'actorSummaries': actorSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListEventsOutput {
  /// The list of events that match the specified criteria.
  final List<Event> events;

  /// The token to use in a subsequent request to get the next set of results.
  /// This value is null when there are no more results to return.
  final String? nextToken;

  ListEventsOutput({
    required this.events,
    this.nextToken,
  });

  factory ListEventsOutput.fromJson(Map<String, dynamic> json) {
    return ListEventsOutput(
      events: ((json['events'] as List?) ?? const [])
          .nonNulls
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextToken = this.nextToken;
    return {
      'events': events,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListMemoryExtractionJobsOutput {
  /// List of extraction job metadata matching the specified criteria.
  final List<ExtractionJobMetadata> jobs;

  /// Token to retrieve the next page of results, if available.
  final String? nextToken;

  ListMemoryExtractionJobsOutput({
    required this.jobs,
    this.nextToken,
  });

  factory ListMemoryExtractionJobsOutput.fromJson(Map<String, dynamic> json) {
    return ListMemoryExtractionJobsOutput(
      jobs: ((json['jobs'] as List?) ?? const [])
          .nonNulls
          .map((e) => ExtractionJobMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    final nextToken = this.nextToken;
    return {
      'jobs': jobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListMemoryRecordsOutput {
  /// The list of memory record summaries that match the specified criteria.
  final List<MemoryRecordSummary> memoryRecordSummaries;

  /// The token to use in a subsequent request to get the next set of results.
  /// This value is null when there are no more results to return.
  final String? nextToken;

  ListMemoryRecordsOutput({
    required this.memoryRecordSummaries,
    this.nextToken,
  });

  factory ListMemoryRecordsOutput.fromJson(Map<String, dynamic> json) {
    return ListMemoryRecordsOutput(
      memoryRecordSummaries: ((json['memoryRecordSummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => MemoryRecordSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final memoryRecordSummaries = this.memoryRecordSummaries;
    final nextToken = this.nextToken;
    return {
      'memoryRecordSummaries': memoryRecordSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListSessionsOutput {
  /// The list of session summaries that match the specified criteria.
  final List<SessionSummary> sessionSummaries;

  /// The token to use in a subsequent request to get the next set of results.
  /// This value is null when there are no more results to return.
  final String? nextToken;

  ListSessionsOutput({
    required this.sessionSummaries,
    this.nextToken,
  });

  factory ListSessionsOutput.fromJson(Map<String, dynamic> json) {
    return ListSessionsOutput(
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
class RetrieveMemoryRecordsOutput {
  /// The list of memory record summaries that match the search criteria, ordered
  /// by relevance.
  final List<MemoryRecordSummary> memoryRecordSummaries;

  /// The token to use in a subsequent request to get the next set of results.
  /// This value is null when there are no more results to return.
  final String? nextToken;

  RetrieveMemoryRecordsOutput({
    required this.memoryRecordSummaries,
    this.nextToken,
  });

  factory RetrieveMemoryRecordsOutput.fromJson(Map<String, dynamic> json) {
    return RetrieveMemoryRecordsOutput(
      memoryRecordSummaries: ((json['memoryRecordSummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => MemoryRecordSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final memoryRecordSummaries = this.memoryRecordSummaries;
    final nextToken = this.nextToken;
    return {
      'memoryRecordSummaries': memoryRecordSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class StartMemoryExtractionJobOutput {
  /// Extraction Job ID that was attempted to start.
  final String jobId;

  StartMemoryExtractionJobOutput({
    required this.jobId,
  });

  factory StartMemoryExtractionJobOutput.fromJson(Map<String, dynamic> json) {
    return StartMemoryExtractionJobOutput(
      jobId: (json['jobId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      'jobId': jobId,
    };
  }
}

/// Response structure for creating a payment instrument.
///
/// @nodoc
class CreatePaymentInstrumentResponse {
  /// The created payment instrument.
  final PaymentInstrument paymentInstrument;

  CreatePaymentInstrumentResponse({
    required this.paymentInstrument,
  });

  factory CreatePaymentInstrumentResponse.fromJson(Map<String, dynamic> json) {
    return CreatePaymentInstrumentResponse(
      paymentInstrument: PaymentInstrument.fromJson(
          (json['paymentInstrument'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final paymentInstrument = this.paymentInstrument;
    return {
      'paymentInstrument': paymentInstrument,
    };
  }
}

/// Response structure for getting a payment instrument.
///
/// @nodoc
class GetPaymentInstrumentResponse {
  /// The payment instrument details.
  final PaymentInstrument paymentInstrument;

  GetPaymentInstrumentResponse({
    required this.paymentInstrument,
  });

  factory GetPaymentInstrumentResponse.fromJson(Map<String, dynamic> json) {
    return GetPaymentInstrumentResponse(
      paymentInstrument: PaymentInstrument.fromJson(
          (json['paymentInstrument'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final paymentInstrument = this.paymentInstrument;
    return {
      'paymentInstrument': paymentInstrument,
    };
  }
}

/// Response structure for deleting a payment instrument.
///
/// @nodoc
class DeletePaymentInstrumentResponse {
  /// The status of the instrument after deletion. Always DELETED for successful
  /// soft delete.
  final PaymentInstrumentStatus status;

  DeletePaymentInstrumentResponse({
    required this.status,
  });

  factory DeletePaymentInstrumentResponse.fromJson(Map<String, dynamic> json) {
    return DeletePaymentInstrumentResponse(
      status:
          PaymentInstrumentStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.value,
    };
  }
}

/// Response structure for listing payment instruments.
///
/// @nodoc
class ListPaymentInstrumentsResponse {
  /// List of payment instrument summaries matching the request criteria.
  final List<PaymentInstrumentSummary> paymentInstruments;

  /// Token for pagination to retrieve the next set of results.
  final String? nextToken;

  ListPaymentInstrumentsResponse({
    required this.paymentInstruments,
    this.nextToken,
  });

  factory ListPaymentInstrumentsResponse.fromJson(Map<String, dynamic> json) {
    return ListPaymentInstrumentsResponse(
      paymentInstruments: ((json['paymentInstruments'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              PaymentInstrumentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final paymentInstruments = this.paymentInstruments;
    final nextToken = this.nextToken;
    return {
      'paymentInstruments': paymentInstruments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Response structure for getting payment instrument balance.
///
/// @nodoc
class GetPaymentInstrumentBalanceResponse {
  /// The ID of the payment instrument.
  final String paymentInstrumentId;

  /// The balance of the supported token on the requested chain.
  final TokenBalance tokenBalance;

  GetPaymentInstrumentBalanceResponse({
    required this.paymentInstrumentId,
    required this.tokenBalance,
  });

  factory GetPaymentInstrumentBalanceResponse.fromJson(
      Map<String, dynamic> json) {
    return GetPaymentInstrumentBalanceResponse(
      paymentInstrumentId: (json['paymentInstrumentId'] as String?) ?? '',
      tokenBalance: TokenBalance.fromJson(
          (json['tokenBalance'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final paymentInstrumentId = this.paymentInstrumentId;
    final tokenBalance = this.tokenBalance;
    return {
      'paymentInstrumentId': paymentInstrumentId,
      'tokenBalance': tokenBalance,
    };
  }
}

/// Response structure for creating a payment session.
///
/// @nodoc
class CreatePaymentSessionResponse {
  /// The created payment session.
  final PaymentSession paymentSession;

  CreatePaymentSessionResponse({
    required this.paymentSession,
  });

  factory CreatePaymentSessionResponse.fromJson(Map<String, dynamic> json) {
    return CreatePaymentSessionResponse(
      paymentSession: PaymentSession.fromJson(
          (json['paymentSession'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final paymentSession = this.paymentSession;
    return {
      'paymentSession': paymentSession,
    };
  }
}

/// Response structure for getting a payment session.
///
/// @nodoc
class GetPaymentSessionResponse {
  /// The payment session details.
  final PaymentSession paymentSession;

  GetPaymentSessionResponse({
    required this.paymentSession,
  });

  factory GetPaymentSessionResponse.fromJson(Map<String, dynamic> json) {
    return GetPaymentSessionResponse(
      paymentSession: PaymentSession.fromJson(
          (json['paymentSession'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final paymentSession = this.paymentSession;
    return {
      'paymentSession': paymentSession,
    };
  }
}

/// Response structure for deleting a payment session.
///
/// @nodoc
class DeletePaymentSessionResponse {
  /// The status of the deletion. Always DELETED for successful hard delete.
  final PaymentSessionStatus status;

  DeletePaymentSessionResponse({
    required this.status,
  });

  factory DeletePaymentSessionResponse.fromJson(Map<String, dynamic> json) {
    return DeletePaymentSessionResponse(
      status:
          PaymentSessionStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.value,
    };
  }
}

/// Response structure for listing payment sessions.
///
/// @nodoc
class ListPaymentSessionsResponse {
  /// List of payment session summaries matching the request criteria.
  final List<PaymentSessionSummary> paymentSessions;

  /// Token for pagination to retrieve the next set of results.
  final String? nextToken;

  ListPaymentSessionsResponse({
    required this.paymentSessions,
    this.nextToken,
  });

  factory ListPaymentSessionsResponse.fromJson(Map<String, dynamic> json) {
    return ListPaymentSessionsResponse(
      paymentSessions: ((json['paymentSessions'] as List?) ?? const [])
          .nonNulls
          .map((e) => PaymentSessionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final paymentSessions = this.paymentSessions;
    final nextToken = this.nextToken;
    return {
      'paymentSessions': paymentSessions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Response structure for processing a payment.
///
/// @nodoc
class ProcessPaymentResponse {
  /// The timestamp when the payment was created.
  final DateTime createdAt;

  /// The ID of the payment instrument used.
  final String paymentInstrumentId;

  /// The ARN of the payment manager.
  final String paymentManagerArn;

  /// The payment output details specific to the payment type.
  final PaymentOutput paymentOutput;

  /// The ID of the payment session used.
  final String paymentSessionId;

  /// The type of payment processed.
  final PaymentType paymentType;

  /// The unique identifier of the processed payment.
  final String processPaymentId;

  /// The status of the payment.
  final PaymentStatus status;

  /// The timestamp when the payment was last updated.
  final DateTime updatedAt;

  ProcessPaymentResponse({
    required this.createdAt,
    required this.paymentInstrumentId,
    required this.paymentManagerArn,
    required this.paymentOutput,
    required this.paymentSessionId,
    required this.paymentType,
    required this.processPaymentId,
    required this.status,
    required this.updatedAt,
  });

  factory ProcessPaymentResponse.fromJson(Map<String, dynamic> json) {
    return ProcessPaymentResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      paymentInstrumentId: (json['paymentInstrumentId'] as String?) ?? '',
      paymentManagerArn: (json['paymentManagerArn'] as String?) ?? '',
      paymentOutput: PaymentOutput.fromJson(
          (json['paymentOutput'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      paymentSessionId: (json['paymentSessionId'] as String?) ?? '',
      paymentType:
          PaymentType.fromString((json['paymentType'] as String?) ?? ''),
      processPaymentId: (json['processPaymentId'] as String?) ?? '',
      status: PaymentStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final paymentInstrumentId = this.paymentInstrumentId;
    final paymentManagerArn = this.paymentManagerArn;
    final paymentOutput = this.paymentOutput;
    final paymentSessionId = this.paymentSessionId;
    final paymentType = this.paymentType;
    final processPaymentId = this.processPaymentId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'paymentInstrumentId': paymentInstrumentId,
      'paymentManagerArn': paymentManagerArn,
      'paymentOutput': paymentOutput,
      'paymentSessionId': paymentSessionId,
      'paymentType': paymentType.value,
      'processPaymentId': processPaymentId,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class SearchRegistryRecordsResponse {
  /// The list of registry records that match the search query, ordered by
  /// relevance.
  final List<RegistryRecordSummary> registryRecords;

  SearchRegistryRecordsResponse({
    required this.registryRecords,
  });

  factory SearchRegistryRecordsResponse.fromJson(Map<String, dynamic> json) {
    return SearchRegistryRecordsResponse(
      registryRecords: ((json['registryRecords'] as List?) ?? const [])
          .nonNulls
          .map((e) => RegistryRecordSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final registryRecords = this.registryRecords;
    return {
      'registryRecords': registryRecords,
    };
  }
}

/// Summary information about a registry record.
///
/// @nodoc
class RegistryRecordSummary {
  /// The date and time when the registry record was created.
  final DateTime createdAt;

  /// The type of descriptor associated with this registry record.
  final DescriptorType descriptorType;

  /// The descriptor configurations for this registry record.
  final Descriptors descriptors;

  /// The name of the registry record.
  final String name;

  /// The Amazon Resource Name (ARN) of the registry record.
  final String recordArn;

  /// The unique identifier of the registry record.
  final String recordId;

  /// The Amazon Resource Name (ARN) of the registry that this record belongs to.
  final String registryArn;

  /// The current status of the registry record.
  final RegistryRecordStatus status;

  /// The date and time when the registry record was last updated.
  final DateTime updatedAt;

  /// The version of the registry record.
  final String version;

  /// A description of the registry record.
  final String? description;

  RegistryRecordSummary({
    required this.createdAt,
    required this.descriptorType,
    required this.descriptors,
    required this.name,
    required this.recordArn,
    required this.recordId,
    required this.registryArn,
    required this.status,
    required this.updatedAt,
    required this.version,
    this.description,
  });

  factory RegistryRecordSummary.fromJson(Map<String, dynamic> json) {
    return RegistryRecordSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      descriptorType:
          DescriptorType.fromString((json['descriptorType'] as String?) ?? ''),
      descriptors: Descriptors.fromJson(
          (json['descriptors'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      name: (json['name'] as String?) ?? '',
      recordArn: (json['recordArn'] as String?) ?? '',
      recordId: (json['recordId'] as String?) ?? '',
      registryArn: (json['registryArn'] as String?) ?? '',
      status:
          RegistryRecordStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as String?) ?? '',
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final descriptorType = this.descriptorType;
    final descriptors = this.descriptors;
    final name = this.name;
    final recordArn = this.recordArn;
    final recordId = this.recordId;
    final registryArn = this.registryArn;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final version = this.version;
    final description = this.description;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'descriptorType': descriptorType.value,
      'descriptors': descriptors,
      'name': name,
      'recordArn': recordArn,
      'recordId': recordId,
      'registryArn': registryArn,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (description != null) 'description': description,
    };
  }
}

/// The type of descriptor associated with a registry record.
///
/// @nodoc
class DescriptorType {
  static const mcp = DescriptorType._('MCP');
  static const a2a = DescriptorType._('A2A');
  static const custom = DescriptorType._('CUSTOM');
  static const agentSkills = DescriptorType._('AGENT_SKILLS');

  final String value;

  const DescriptorType._(this.value);

  static const values = [mcp, a2a, custom, agentSkills];

  static DescriptorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DescriptorType._(value));

  @override
  bool operator ==(other) => other is DescriptorType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the descriptor configuration for a registry record. Only the field
/// that matches the record's <code>descriptorType</code> is populated.
///
/// @nodoc
class Descriptors {
  /// The A2A (Agent-to-Agent) descriptor configuration. Populated when the
  /// record's <code>descriptorType</code> is <code>A2A</code>.
  final A2aDescriptor? a2a;

  /// The agent skills descriptor configuration. Populated when the record's
  /// <code>descriptorType</code> is <code>AGENT_SKILLS</code>.
  final AgentSkillsDescriptor? agentSkills;

  /// The custom descriptor configuration. Populated when the record's
  /// <code>descriptorType</code> is <code>CUSTOM</code>.
  final CustomDescriptor? custom;

  /// The MCP (Model Context Protocol) descriptor configuration. Populated when
  /// the record's <code>descriptorType</code> is <code>MCP</code>.
  final McpDescriptor? mcp;

  Descriptors({
    this.a2a,
    this.agentSkills,
    this.custom,
    this.mcp,
  });

  factory Descriptors.fromJson(Map<String, dynamic> json) {
    return Descriptors(
      a2a: json['a2a'] != null
          ? A2aDescriptor.fromJson(json['a2a'] as Map<String, dynamic>)
          : null,
      agentSkills: json['agentSkills'] != null
          ? AgentSkillsDescriptor.fromJson(
              json['agentSkills'] as Map<String, dynamic>)
          : null,
      custom: json['custom'] != null
          ? CustomDescriptor.fromJson(json['custom'] as Map<String, dynamic>)
          : null,
      mcp: json['mcp'] != null
          ? McpDescriptor.fromJson(json['mcp'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final a2a = this.a2a;
    final agentSkills = this.agentSkills;
    final custom = this.custom;
    final mcp = this.mcp;
    return {
      if (a2a != null) 'a2a': a2a,
      if (agentSkills != null) 'agentSkills': agentSkills,
      if (custom != null) 'custom': custom,
      if (mcp != null) 'mcp': mcp,
    };
  }
}

/// The status of a registry record in its lifecycle.
///
/// @nodoc
class RegistryRecordStatus {
  static const draft = RegistryRecordStatus._('DRAFT');
  static const pendingApproval = RegistryRecordStatus._('PENDING_APPROVAL');
  static const approved = RegistryRecordStatus._('APPROVED');
  static const rejected = RegistryRecordStatus._('REJECTED');
  static const deprecated = RegistryRecordStatus._('DEPRECATED');

  final String value;

  const RegistryRecordStatus._(this.value);

  static const values = [
    draft,
    pendingApproval,
    approved,
    rejected,
    deprecated
  ];

  static RegistryRecordStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistryRecordStatus._(value));

  @override
  bool operator ==(other) =>
      other is RegistryRecordStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The MCP (Model Context Protocol) descriptor configuration for a registry
/// record. Contains the server definition and tools definition.
///
/// @nodoc
class McpDescriptor {
  /// The MCP server definition that describes the server configuration.
  final ServerDefinition server;

  /// The MCP tools definition that describes the available tools.
  final ToolsDefinition tools;

  McpDescriptor({
    required this.server,
    required this.tools,
  });

  factory McpDescriptor.fromJson(Map<String, dynamic> json) {
    return McpDescriptor(
      server: ServerDefinition.fromJson(
          (json['server'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      tools: ToolsDefinition.fromJson(
          (json['tools'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final server = this.server;
    final tools = this.tools;
    return {
      'server': server,
      'tools': tools,
    };
  }
}

/// The A2A (Agent-to-Agent) descriptor configuration for a registry record.
///
/// @nodoc
class A2aDescriptor {
  /// The agent card definition that describes the agent's capabilities and
  /// interface.
  final AgentCardDefinition agentCard;

  A2aDescriptor({
    required this.agentCard,
  });

  factory A2aDescriptor.fromJson(Map<String, dynamic> json) {
    return A2aDescriptor(
      agentCard: AgentCardDefinition.fromJson(
          (json['agentCard'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agentCard = this.agentCard;
    return {
      'agentCard': agentCard,
    };
  }
}

/// A custom descriptor configuration for a registry record.
///
/// @nodoc
class CustomDescriptor {
  /// The inline content of the custom descriptor.
  final String? inlineContent;

  CustomDescriptor({
    this.inlineContent,
  });

  factory CustomDescriptor.fromJson(Map<String, dynamic> json) {
    return CustomDescriptor(
      inlineContent: json['inlineContent'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inlineContent = this.inlineContent;
    return {
      if (inlineContent != null) 'inlineContent': inlineContent,
    };
  }
}

/// The agent skills descriptor configuration for a registry record.
///
/// @nodoc
class AgentSkillsDescriptor {
  /// The skill description in markdown format.
  final SkillMdDefinition skillMd;

  /// The structured skill definition with a schema version and content.
  final SkillDefinition? skillDefinition;

  AgentSkillsDescriptor({
    required this.skillMd,
    this.skillDefinition,
  });

  factory AgentSkillsDescriptor.fromJson(Map<String, dynamic> json) {
    return AgentSkillsDescriptor(
      skillMd: SkillMdDefinition.fromJson(
          (json['skillMd'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      skillDefinition: json['skillDefinition'] != null
          ? SkillDefinition.fromJson(
              json['skillDefinition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final skillMd = this.skillMd;
    final skillDefinition = this.skillDefinition;
    return {
      'skillMd': skillMd,
      if (skillDefinition != null) 'skillDefinition': skillDefinition,
    };
  }
}

/// The skill markdown definition for agent skills descriptors.
///
/// @nodoc
class SkillMdDefinition {
  /// The inline markdown content of the skill definition.
  final String? inlineContent;

  SkillMdDefinition({
    this.inlineContent,
  });

  factory SkillMdDefinition.fromJson(Map<String, dynamic> json) {
    return SkillMdDefinition(
      inlineContent: json['inlineContent'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inlineContent = this.inlineContent;
    return {
      if (inlineContent != null) 'inlineContent': inlineContent,
    };
  }
}

/// The structured skill definition with a schema version and inline content.
///
/// @nodoc
class SkillDefinition {
  /// The inline content of the skill definition.
  final String? inlineContent;

  /// The schema version of the skill definition. If you don't specify a version,
  /// the service detects it automatically.
  final String? schemaVersion;

  SkillDefinition({
    this.inlineContent,
    this.schemaVersion,
  });

  factory SkillDefinition.fromJson(Map<String, dynamic> json) {
    return SkillDefinition(
      inlineContent: json['inlineContent'] as String?,
      schemaVersion: json['schemaVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inlineContent = this.inlineContent;
    final schemaVersion = this.schemaVersion;
    return {
      if (inlineContent != null) 'inlineContent': inlineContent,
      if (schemaVersion != null) 'schemaVersion': schemaVersion,
    };
  }
}

/// The agent card definition for A2A descriptors, including the schema version
/// and inline content that describes the agent's capabilities.
///
/// @nodoc
class AgentCardDefinition {
  /// The inline content of the agent card definition.
  final String? inlineContent;

  /// The schema version of the agent card definition.
  final String? schemaVersion;

  AgentCardDefinition({
    this.inlineContent,
    this.schemaVersion,
  });

  factory AgentCardDefinition.fromJson(Map<String, dynamic> json) {
    return AgentCardDefinition(
      inlineContent: json['inlineContent'] as String?,
      schemaVersion: json['schemaVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inlineContent = this.inlineContent;
    final schemaVersion = this.schemaVersion;
    return {
      if (inlineContent != null) 'inlineContent': inlineContent,
      if (schemaVersion != null) 'schemaVersion': schemaVersion,
    };
  }
}

/// The MCP server definition with a schema version and inline content. The
/// <code>schemaVersion</code> identifies the version of the MCP server
/// configuration schema.
///
/// @nodoc
class ServerDefinition {
  /// The inline content of the server definition.
  final String? inlineContent;

  /// The schema version of the MCP server configuration. The schema version
  /// identifies the format of the server definition content.
  final String? schemaVersion;

  ServerDefinition({
    this.inlineContent,
    this.schemaVersion,
  });

  factory ServerDefinition.fromJson(Map<String, dynamic> json) {
    return ServerDefinition(
      inlineContent: json['inlineContent'] as String?,
      schemaVersion: json['schemaVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inlineContent = this.inlineContent;
    final schemaVersion = this.schemaVersion;
    return {
      if (inlineContent != null) 'inlineContent': inlineContent,
      if (schemaVersion != null) 'schemaVersion': schemaVersion,
    };
  }
}

/// The MCP tools definition with a protocol version and inline content. The
/// <code>protocolVersion</code> identifies the MCP protocol version that the
/// tools conform to. This differs from <code>schemaVersion</code> in the server
/// definition, which identifies the server configuration schema format.
///
/// @nodoc
class ToolsDefinition {
  /// The inline content of the tools definition.
  final String? inlineContent;

  /// The MCP protocol version that the tools conform to. This differs from the
  /// <code>schemaVersion</code> field in the server definition, which identifies
  /// the server configuration schema format.
  final String? protocolVersion;

  ToolsDefinition({
    this.inlineContent,
    this.protocolVersion,
  });

  factory ToolsDefinition.fromJson(Map<String, dynamic> json) {
    return ToolsDefinition(
      inlineContent: json['inlineContent'] as String?,
      protocolVersion: json['protocolVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inlineContent = this.inlineContent;
    final protocolVersion = this.protocolVersion;
    return {
      if (inlineContent != null) 'inlineContent': inlineContent,
      if (protocolVersion != null) 'protocolVersion': protocolVersion,
    };
  }
}

/// Payment type enum.
///
/// @nodoc
class PaymentType {
  static const cryptoX402 = PaymentType._('CRYPTO_X402');

  final String value;

  const PaymentType._(this.value);

  static const values = [cryptoX402];

  static PaymentType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PaymentType._(value));

  @override
  bool operator ==(other) => other is PaymentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Transaction status enum.
///
/// @nodoc
class PaymentStatus {
  static const proofGenerated = PaymentStatus._('PROOF_GENERATED');

  final String value;

  const PaymentStatus._(this.value);

  static const values = [proofGenerated];

  static PaymentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PaymentStatus._(value));

  @override
  bool operator ==(other) => other is PaymentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The payment output details, which vary by payment type.
///
/// @nodoc
class PaymentOutput {
  /// Output from a crypto X402 payment.
  final CryptoX402PaymentOutput? cryptoX402;

  PaymentOutput({
    this.cryptoX402,
  });

  factory PaymentOutput.fromJson(Map<String, dynamic> json) {
    return PaymentOutput(
      cryptoX402: json['cryptoX402'] != null
          ? CryptoX402PaymentOutput.fromJson(
              json['cryptoX402'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cryptoX402 = this.cryptoX402;
    return {
      if (cryptoX402 != null) 'cryptoX402': cryptoX402,
    };
  }
}

/// The output from a crypto X402 payment.
///
/// @nodoc
class CryptoX402PaymentOutput {
  /// The X402 payment response payload.
  final Object payload;

  /// The version of the X402 protocol.
  final String version;

  CryptoX402PaymentOutput({
    required this.payload,
    required this.version,
  });

  factory CryptoX402PaymentOutput.fromJson(Map<String, dynamic> json) {
    return CryptoX402PaymentOutput(
      payload: json['payload'] as Object,
      version: (json['version'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final version = this.version;
    return {
      'payload': payload,
      'version': version,
    };
  }
}

/// The payment input details, which vary by payment type.
///
/// @nodoc
class PaymentInput {
  /// Input for a crypto X402 payment.
  final CryptoX402PaymentInput? cryptoX402;

  PaymentInput({
    this.cryptoX402,
  });

  Map<String, dynamic> toJson() {
    final cryptoX402 = this.cryptoX402;
    return {
      if (cryptoX402 != null) 'cryptoX402': cryptoX402,
    };
  }
}

/// The input for a crypto X402 payment.
///
/// @nodoc
class CryptoX402PaymentInput {
  /// The X402 payment payload.
  final Object payload;

  /// The version of the X402 protocol.
  final String version;

  CryptoX402PaymentInput({
    required this.payload,
    required this.version,
  });

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final version = this.version;
    return {
      'payload': payload,
      'version': version,
    };
  }
}

/// Summary information about a payment session.
///
/// @nodoc
class PaymentSessionSummary {
  /// The timestamp when the session was created.
  final DateTime createdAt;

  /// The session expiry time in minutes.
  final int expiryTimeInMinutes;

  /// The ARN of the payment manager that owns this session.
  final String paymentManagerArn;

  /// The unique identifier of the payment session.
  final String paymentSessionId;

  /// The timestamp when the session was last updated.
  final DateTime updatedAt;

  /// The user ID associated with this session.
  final String userId;

  PaymentSessionSummary({
    required this.createdAt,
    required this.expiryTimeInMinutes,
    required this.paymentManagerArn,
    required this.paymentSessionId,
    required this.updatedAt,
    required this.userId,
  });

  factory PaymentSessionSummary.fromJson(Map<String, dynamic> json) {
    return PaymentSessionSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      expiryTimeInMinutes: (json['expiryTimeInMinutes'] as int?) ?? 0,
      paymentManagerArn: (json['paymentManagerArn'] as String?) ?? '',
      paymentSessionId: (json['paymentSessionId'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      userId: (json['userId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final expiryTimeInMinutes = this.expiryTimeInMinutes;
    final paymentManagerArn = this.paymentManagerArn;
    final paymentSessionId = this.paymentSessionId;
    final updatedAt = this.updatedAt;
    final userId = this.userId;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'expiryTimeInMinutes': expiryTimeInMinutes,
      'paymentManagerArn': paymentManagerArn,
      'paymentSessionId': paymentSessionId,
      'updatedAt': iso8601ToJson(updatedAt),
      'userId': userId,
    };
  }
}

/// The status of a payment session.
///
/// @nodoc
class PaymentSessionStatus {
  static const active = PaymentSessionStatus._('ACTIVE');
  static const expired = PaymentSessionStatus._('EXPIRED');
  static const deleted = PaymentSessionStatus._('DELETED');

  final String value;

  const PaymentSessionStatus._(this.value);

  static const values = [active, expired, deleted];

  static PaymentSessionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PaymentSessionStatus._(value));

  @override
  bool operator ==(other) =>
      other is PaymentSessionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A payment session for managing payment transactions.
///
/// @nodoc
class PaymentSession {
  /// The timestamp when the session was created.
  final DateTime createdAt;

  /// The session expiry time in minutes.
  final int expiryTimeInMinutes;

  /// The ARN of the payment manager that owns this session.
  final String paymentManagerArn;

  /// The unique identifier of the payment session.
  final String paymentSessionId;

  /// The timestamp when the session was last updated.
  final DateTime updatedAt;

  /// The user ID associated with this session.
  final String userId;

  /// The current available spending limits.
  final AvailableLimits? availableLimits;

  /// The spending limits for the payment session.
  final SessionLimits? limits;

  PaymentSession({
    required this.createdAt,
    required this.expiryTimeInMinutes,
    required this.paymentManagerArn,
    required this.paymentSessionId,
    required this.updatedAt,
    required this.userId,
    this.availableLimits,
    this.limits,
  });

  factory PaymentSession.fromJson(Map<String, dynamic> json) {
    return PaymentSession(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      expiryTimeInMinutes: (json['expiryTimeInMinutes'] as int?) ?? 0,
      paymentManagerArn: (json['paymentManagerArn'] as String?) ?? '',
      paymentSessionId: (json['paymentSessionId'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      userId: (json['userId'] as String?) ?? '',
      availableLimits: json['availableLimits'] != null
          ? AvailableLimits.fromJson(
              json['availableLimits'] as Map<String, dynamic>)
          : null,
      limits: json['limits'] != null
          ? SessionLimits.fromJson(json['limits'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final expiryTimeInMinutes = this.expiryTimeInMinutes;
    final paymentManagerArn = this.paymentManagerArn;
    final paymentSessionId = this.paymentSessionId;
    final updatedAt = this.updatedAt;
    final userId = this.userId;
    final availableLimits = this.availableLimits;
    final limits = this.limits;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'expiryTimeInMinutes': expiryTimeInMinutes,
      'paymentManagerArn': paymentManagerArn,
      'paymentSessionId': paymentSessionId,
      'updatedAt': iso8601ToJson(updatedAt),
      'userId': userId,
      if (availableLimits != null) 'availableLimits': availableLimits,
      if (limits != null) 'limits': limits,
    };
  }
}

/// The spending limits configuration for a payment session.
///
/// @nodoc
class SessionLimits {
  /// The maximum amount that can be spent in the session.
  final Amount maxSpendAmount;

  SessionLimits({
    required this.maxSpendAmount,
  });

  factory SessionLimits.fromJson(Map<String, dynamic> json) {
    return SessionLimits(
      maxSpendAmount: Amount.fromJson(
          (json['maxSpendAmount'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final maxSpendAmount = this.maxSpendAmount;
    return {
      'maxSpendAmount': maxSpendAmount,
    };
  }
}

/// The available spending limits for a payment session.
///
/// @nodoc
class AvailableLimits {
  /// The remaining available amount that can be spent.
  final Amount? availableSpendAmount;

  /// The timestamp when the available limits were last updated.
  final DateTime? updatedAt;

  AvailableLimits({
    this.availableSpendAmount,
    this.updatedAt,
  });

  factory AvailableLimits.fromJson(Map<String, dynamic> json) {
    return AvailableLimits(
      availableSpendAmount: json['availableSpendAmount'] != null
          ? Amount.fromJson(
              json['availableSpendAmount'] as Map<String, dynamic>)
          : null,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final availableSpendAmount = this.availableSpendAmount;
    final updatedAt = this.updatedAt;
    return {
      if (availableSpendAmount != null)
        'availableSpendAmount': availableSpendAmount,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Represents a monetary amount with a currency.
///
/// @nodoc
class Amount {
  /// The currency code for the amount.
  final Currency currency;

  /// The numeric value of the amount.
  final String value;

  Amount({
    required this.currency,
    required this.value,
  });

  factory Amount.fromJson(Map<String, dynamic> json) {
    return Amount(
      currency: Currency.fromString((json['currency'] as String?) ?? ''),
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final currency = this.currency;
    final value = this.value;
    return {
      'currency': currency.value,
      'value': value,
    };
  }
}

/// Supported currency codes.
///
/// @nodoc
class Currency {
  static const usd = Currency._('USD');

  final String value;

  const Currency._(this.value);

  static const values = [usd];

  static Currency fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Currency._(value));

  @override
  bool operator ==(other) => other is Currency && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A single token balance entry.
///
/// @nodoc
class TokenBalance {
  /// Raw balance in the smallest denomination (e.g., USDC base units where 1 USDC
  /// = 1000000).
  final String amount;

  /// The specific blockchain chain.
  final BlockchainChainId chain;

  /// Number of decimal places for the token (e.g., 6 for USDC).
  final int decimals;

  /// The blockchain network family (ETHEREUM or SOLANA).
  final CryptoWalletNetwork network;

  /// The supported token for this balance.
  final InstrumentBalanceToken token;

  TokenBalance({
    required this.amount,
    required this.chain,
    required this.decimals,
    required this.network,
    required this.token,
  });

  factory TokenBalance.fromJson(Map<String, dynamic> json) {
    return TokenBalance(
      amount: (json['amount'] as String?) ?? '',
      chain: BlockchainChainId.fromString((json['chain'] as String?) ?? ''),
      decimals: (json['decimals'] as int?) ?? 0,
      network:
          CryptoWalletNetwork.fromString((json['network'] as String?) ?? ''),
      token:
          InstrumentBalanceToken.fromString((json['token'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final chain = this.chain;
    final decimals = this.decimals;
    final network = this.network;
    final token = this.token;
    return {
      'amount': amount,
      'chain': chain.value,
      'decimals': decimals,
      'network': network.value,
      'token': token.value,
    };
  }
}

/// Supported tokens for instrument balance queries. Only tokens supported for
/// X402 payments are returned.
///
/// @nodoc
class InstrumentBalanceToken {
  static const usdc = InstrumentBalanceToken._('USDC');

  final String value;

  const InstrumentBalanceToken._(this.value);

  static const values = [usdc];

  static InstrumentBalanceToken fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstrumentBalanceToken._(value));

  @override
  bool operator ==(other) =>
      other is InstrumentBalanceToken && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Supported blockchain networks for crypto wallets.
///
/// @nodoc
class CryptoWalletNetwork {
  static const ethereum = CryptoWalletNetwork._('ETHEREUM');
  static const solana = CryptoWalletNetwork._('SOLANA');

  final String value;

  const CryptoWalletNetwork._(this.value);

  static const values = [ethereum, solana];

  static CryptoWalletNetwork fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CryptoWalletNetwork._(value));

  @override
  bool operator ==(other) =>
      other is CryptoWalletNetwork && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Supported blockchain chain identifiers for balance queries. Each value maps
/// to a specific chain supported by the underlying providers (Privy, Coinbase).
///
/// @nodoc
class BlockchainChainId {
  static const base = BlockchainChainId._('BASE');
  static const baseSepolia = BlockchainChainId._('BASE_SEPOLIA');
  static const ethereum = BlockchainChainId._('ETHEREUM');
  static const solana = BlockchainChainId._('SOLANA');
  static const solanaDevnet = BlockchainChainId._('SOLANA_DEVNET');

  final String value;

  const BlockchainChainId._(this.value);

  static const values = [base, baseSepolia, ethereum, solana, solanaDevnet];

  static BlockchainChainId fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BlockchainChainId._(value));

  @override
  bool operator ==(other) => other is BlockchainChainId && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary of a payment instrument for list operations.
///
/// @nodoc
class PaymentInstrumentSummary {
  /// The timestamp when this payment instrument was created.
  final DateTime createdAt;

  /// The ID of the payment connector associated with this instrument.
  final String paymentConnectorId;

  /// The unique identifier for this payment instrument.
  final String paymentInstrumentId;

  /// The type of payment instrument (e.g., EMBEDDED_CRYPTO_WALLET).
  final PaymentInstrumentType paymentInstrumentType;

  /// The ARN of the payment manager that owns this payment instrument.
  final String paymentManagerArn;

  /// The current status of this payment instrument.
  final PaymentInstrumentStatus status;

  /// The timestamp when this payment instrument was last updated.
  final DateTime updatedAt;

  /// The user ID associated with this payment instrument.
  final String userId;

  PaymentInstrumentSummary({
    required this.createdAt,
    required this.paymentConnectorId,
    required this.paymentInstrumentId,
    required this.paymentInstrumentType,
    required this.paymentManagerArn,
    required this.status,
    required this.updatedAt,
    required this.userId,
  });

  factory PaymentInstrumentSummary.fromJson(Map<String, dynamic> json) {
    return PaymentInstrumentSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      paymentConnectorId: (json['paymentConnectorId'] as String?) ?? '',
      paymentInstrumentId: (json['paymentInstrumentId'] as String?) ?? '',
      paymentInstrumentType: PaymentInstrumentType.fromString(
          (json['paymentInstrumentType'] as String?) ?? ''),
      paymentManagerArn: (json['paymentManagerArn'] as String?) ?? '',
      status:
          PaymentInstrumentStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      userId: (json['userId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final paymentConnectorId = this.paymentConnectorId;
    final paymentInstrumentId = this.paymentInstrumentId;
    final paymentInstrumentType = this.paymentInstrumentType;
    final paymentManagerArn = this.paymentManagerArn;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final userId = this.userId;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'paymentConnectorId': paymentConnectorId,
      'paymentInstrumentId': paymentInstrumentId,
      'paymentInstrumentType': paymentInstrumentType.value,
      'paymentManagerArn': paymentManagerArn,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      'userId': userId,
    };
  }
}

/// The type of payment instrument.
///
/// @nodoc
class PaymentInstrumentType {
  static const embeddedCryptoWallet =
      PaymentInstrumentType._('EMBEDDED_CRYPTO_WALLET');

  final String value;

  const PaymentInstrumentType._(this.value);

  static const values = [embeddedCryptoWallet];

  static PaymentInstrumentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PaymentInstrumentType._(value));

  @override
  bool operator ==(other) =>
      other is PaymentInstrumentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The status of a payment instrument.
///
/// @nodoc
class PaymentInstrumentStatus {
  static const initiated = PaymentInstrumentStatus._('INITIATED');
  static const active = PaymentInstrumentStatus._('ACTIVE');
  static const failed = PaymentInstrumentStatus._('FAILED');
  static const deleted = PaymentInstrumentStatus._('DELETED');

  final String value;

  const PaymentInstrumentStatus._(this.value);

  static const values = [initiated, active, failed, deleted];

  static PaymentInstrumentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PaymentInstrumentStatus._(value));

  @override
  bool operator ==(other) =>
      other is PaymentInstrumentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a payment instrument.
///
/// @nodoc
class PaymentInstrument {
  /// The timestamp when this payment instrument was created.
  final DateTime createdAt;

  /// The ID of the payment connector associated with this instrument.
  final String paymentConnectorId;

  /// The details specific to the payment instrument type.
  final PaymentInstrumentDetails paymentInstrumentDetails;

  /// The unique identifier for this payment instrument.
  final String paymentInstrumentId;

  /// The type of payment instrument (e.g., EMBEDDED_CRYPTO_WALLET).
  final PaymentInstrumentType paymentInstrumentType;

  /// The ARN of the payment manager that owns this payment instrument.
  final String paymentManagerArn;

  /// The current status of this payment instrument.
  final PaymentInstrumentStatus status;

  /// The timestamp when this payment instrument was last updated.
  final DateTime updatedAt;

  /// The user ID associated with this payment instrument.
  final String userId;

  PaymentInstrument({
    required this.createdAt,
    required this.paymentConnectorId,
    required this.paymentInstrumentDetails,
    required this.paymentInstrumentId,
    required this.paymentInstrumentType,
    required this.paymentManagerArn,
    required this.status,
    required this.updatedAt,
    required this.userId,
  });

  factory PaymentInstrument.fromJson(Map<String, dynamic> json) {
    return PaymentInstrument(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      paymentConnectorId: (json['paymentConnectorId'] as String?) ?? '',
      paymentInstrumentDetails: PaymentInstrumentDetails.fromJson(
          (json['paymentInstrumentDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      paymentInstrumentId: (json['paymentInstrumentId'] as String?) ?? '',
      paymentInstrumentType: PaymentInstrumentType.fromString(
          (json['paymentInstrumentType'] as String?) ?? ''),
      paymentManagerArn: (json['paymentManagerArn'] as String?) ?? '',
      status:
          PaymentInstrumentStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      userId: (json['userId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final paymentConnectorId = this.paymentConnectorId;
    final paymentInstrumentDetails = this.paymentInstrumentDetails;
    final paymentInstrumentId = this.paymentInstrumentId;
    final paymentInstrumentType = this.paymentInstrumentType;
    final paymentManagerArn = this.paymentManagerArn;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final userId = this.userId;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'paymentConnectorId': paymentConnectorId,
      'paymentInstrumentDetails': paymentInstrumentDetails,
      'paymentInstrumentId': paymentInstrumentId,
      'paymentInstrumentType': paymentInstrumentType.value,
      'paymentManagerArn': paymentManagerArn,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      'userId': userId,
    };
  }
}

/// Details specific to the instrument type.
///
/// @nodoc
class PaymentInstrumentDetails {
  /// Embedded crypto wallet managed directly by end user.
  final EmbeddedCryptoWallet? embeddedCryptoWallet;

  PaymentInstrumentDetails({
    this.embeddedCryptoWallet,
  });

  factory PaymentInstrumentDetails.fromJson(Map<String, dynamic> json) {
    return PaymentInstrumentDetails(
      embeddedCryptoWallet: json['embeddedCryptoWallet'] != null
          ? EmbeddedCryptoWallet.fromJson(
              json['embeddedCryptoWallet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final embeddedCryptoWallet = this.embeddedCryptoWallet;
    return {
      if (embeddedCryptoWallet != null)
        'embeddedCryptoWallet': embeddedCryptoWallet,
    };
  }
}

/// Embedded crypto wallet instrument details.
///
/// @nodoc
class EmbeddedCryptoWallet {
  /// List of linked accounts linked to this wallet. Each represents a way the end
  /// user can authenticate to this wallet.
  final List<LinkedAccount> linkedAccounts;

  /// The blockchain network for this embedded crypto wallet. Supported networks:
  /// ETHEREUM, SOLANA.
  final CryptoWalletNetwork network;

  /// URL for the end user to complete a provider-specific action such as wallet
  /// linking or onboarding.
  final String? redirectUrl;

  /// The wallet address on the specified blockchain network.
  final String? walletAddress;

  EmbeddedCryptoWallet({
    required this.linkedAccounts,
    required this.network,
    this.redirectUrl,
    this.walletAddress,
  });

  factory EmbeddedCryptoWallet.fromJson(Map<String, dynamic> json) {
    return EmbeddedCryptoWallet(
      linkedAccounts: ((json['linkedAccounts'] as List?) ?? const [])
          .nonNulls
          .map((e) => LinkedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      network:
          CryptoWalletNetwork.fromString((json['network'] as String?) ?? ''),
      redirectUrl: json['redirectUrl'] as String?,
      walletAddress: json['walletAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final linkedAccounts = this.linkedAccounts;
    final network = this.network;
    final redirectUrl = this.redirectUrl;
    final walletAddress = this.walletAddress;
    return {
      'linkedAccounts': linkedAccounts,
      'network': network.value,
      if (redirectUrl != null) 'redirectUrl': redirectUrl,
      if (walletAddress != null) 'walletAddress': walletAddress,
    };
  }
}

/// Represents different linked accounts that can be linked to an embedded
/// wallet. Supports email, SMS, JWT, and OAuth2 approaches.
///
/// @nodoc
class LinkedAccount {
  /// Developer JWT linked account with key ID and subject.
  final LinkedAccountDeveloperJwt? developerJwt;

  /// Email-based linked account.
  final LinkedAccountEmail? email;

  /// OAuth2 provider linked account (Google, Apple, X, Telegram, GitHub).
  final LinkedAccountOAuth2? oAuth2;

  /// SMS-based linked account using phone number.
  final LinkedAccountSms? sms;

  LinkedAccount({
    this.developerJwt,
    this.email,
    this.oAuth2,
    this.sms,
  });

  factory LinkedAccount.fromJson(Map<String, dynamic> json) {
    return LinkedAccount(
      developerJwt: json['developerJwt'] != null
          ? LinkedAccountDeveloperJwt.fromJson(
              json['developerJwt'] as Map<String, dynamic>)
          : null,
      email: json['email'] != null
          ? LinkedAccountEmail.fromJson(json['email'] as Map<String, dynamic>)
          : null,
      oAuth2: json['oAuth2'] != null
          ? LinkedAccountOAuth2.fromJson(json['oAuth2'] as Map<String, dynamic>)
          : null,
      sms: json['sms'] != null
          ? LinkedAccountSms.fromJson(json['sms'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final developerJwt = this.developerJwt;
    final email = this.email;
    final oAuth2 = this.oAuth2;
    final sms = this.sms;
    return {
      if (developerJwt != null) 'developerJwt': developerJwt,
      if (email != null) 'email': email,
      if (oAuth2 != null) 'oAuth2': oAuth2,
      if (sms != null) 'sms': sms,
    };
  }
}

/// Linked account using an email address.
///
/// @nodoc
class LinkedAccountEmail {
  /// The email address used for the linked account. Must be a valid email format.
  final String emailAddress;

  LinkedAccountEmail({
    required this.emailAddress,
  });

  factory LinkedAccountEmail.fromJson(Map<String, dynamic> json) {
    return LinkedAccountEmail(
      emailAddress: (json['emailAddress'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final emailAddress = this.emailAddress;
    return {
      'emailAddress': emailAddress,
    };
  }
}

/// Linked account using a phone number in E.164 format.
///
/// @nodoc
class LinkedAccountSms {
  /// The phone number in E.164 format (e.g., +1234567890).
  final String phoneNumber;

  LinkedAccountSms({
    required this.phoneNumber,
  });

  factory LinkedAccountSms.fromJson(Map<String, dynamic> json) {
    return LinkedAccountSms(
      phoneNumber: (json['phoneNumber'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumber = this.phoneNumber;
    return {
      'phoneNumber': phoneNumber,
    };
  }
}

/// Authentication method using JWT with key ID and subject claims.
///
/// @nodoc
class LinkedAccountDeveloperJwt {
  /// The key ID (kid) from the JWT header. Identifies which key was used to sign
  /// the JWT.
  final String kid;

  /// The subject (sub) claim from the JWT payload. Identifies the principal that
  /// is the subject of the JWT.
  final String sub;

  LinkedAccountDeveloperJwt({
    required this.kid,
    required this.sub,
  });

  factory LinkedAccountDeveloperJwt.fromJson(Map<String, dynamic> json) {
    return LinkedAccountDeveloperJwt(
      kid: (json['kid'] as String?) ?? '',
      sub: (json['sub'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final kid = this.kid;
    final sub = this.sub;
    return {
      'kid': kid,
      'sub': sub,
    };
  }
}

/// Authentication method using OAuth2 providers. Supports Google, Apple, X,
/// Telegram, and GitHub providers.
///
/// @nodoc
class LinkedAccountOAuth2 {
  /// Apple OAuth2 authentication.
  final OAuth2Authentication? apple;

  /// GitHub OAuth2 authentication.
  final OAuth2Authentication? github;

  /// Google OAuth2 authentication.
  final OAuth2Authentication? google;

  /// Telegram OAuth2 authentication.
  final OAuth2Authentication? telegram;

  /// X (formerly Twitter) OAuth2 authentication.
  final OAuth2Authentication? x;

  LinkedAccountOAuth2({
    this.apple,
    this.github,
    this.google,
    this.telegram,
    this.x,
  });

  factory LinkedAccountOAuth2.fromJson(Map<String, dynamic> json) {
    return LinkedAccountOAuth2(
      apple: json['apple'] != null
          ? OAuth2Authentication.fromJson(json['apple'] as Map<String, dynamic>)
          : null,
      github: json['github'] != null
          ? OAuth2Authentication.fromJson(
              json['github'] as Map<String, dynamic>)
          : null,
      google: json['google'] != null
          ? OAuth2Authentication.fromJson(
              json['google'] as Map<String, dynamic>)
          : null,
      telegram: json['telegram'] != null
          ? OAuth2Authentication.fromJson(
              json['telegram'] as Map<String, dynamic>)
          : null,
      x: json['x'] != null
          ? OAuth2Authentication.fromJson(json['x'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final apple = this.apple;
    final github = this.github;
    final google = this.google;
    final telegram = this.telegram;
    final x = this.x;
    return {
      if (apple != null) 'apple': apple,
      if (github != null) 'github': github,
      if (google != null) 'google': google,
      if (telegram != null) 'telegram': telegram,
      if (x != null) 'x': x,
    };
  }
}

/// OAuth2 authentication information for third-party providers.
///
/// @nodoc
class OAuth2Authentication {
  /// The subject (sub) claim from the OAuth2 provider. Uniquely identifies the
  /// user at the provider.
  final String sub;

  /// The email address from the OAuth2 provider.
  final String? emailAddress;

  /// The user's name from the OAuth2 provider.
  final String? name;

  /// The username from the OAuth2 provider.
  final String? username;

  OAuth2Authentication({
    required this.sub,
    this.emailAddress,
    this.name,
    this.username,
  });

  factory OAuth2Authentication.fromJson(Map<String, dynamic> json) {
    return OAuth2Authentication(
      sub: (json['sub'] as String?) ?? '',
      emailAddress: json['emailAddress'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sub = this.sub;
    final emailAddress = this.emailAddress;
    final name = this.name;
    final username = this.username;
    return {
      'sub': sub,
      if (emailAddress != null) 'emailAddress': emailAddress,
      if (name != null) 'name': name,
      if (username != null) 'username': username,
    };
  }
}

/// Represents the metadata of a memory extraction job such as the message
/// identifiers that compose this job.
///
/// @nodoc
class ExtractionJob {
  /// The unique identifier of the extraction job.
  final String jobId;

  ExtractionJob({
    required this.jobId,
  });

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      'jobId': jobId,
    };
  }
}

/// Contains summary information about a memory record.
///
/// @nodoc
class MemoryRecordSummary {
  /// The content of the memory record.
  final MemoryContent content;

  /// The timestamp when the memory record was created.
  final DateTime createdAt;

  /// The unique identifier of the memory record.
  final String memoryRecordId;

  /// The identifier of the memory strategy associated with this record.
  final String memoryStrategyId;

  /// The namespaces associated with this memory record.
  final List<String> namespaces;

  /// A map of metadata key-value pairs associated with a memory record.
  final Map<String, MemoryRecordMetadataValue>? metadata;

  /// The relevance score of the memory record when returned as part of a search
  /// result. Higher values indicate greater relevance to the search query.
  final double? score;

  MemoryRecordSummary({
    required this.content,
    required this.createdAt,
    required this.memoryRecordId,
    required this.memoryStrategyId,
    required this.namespaces,
    this.metadata,
    this.score,
  });

  factory MemoryRecordSummary.fromJson(Map<String, dynamic> json) {
    return MemoryRecordSummary(
      content: MemoryContent.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      memoryRecordId: (json['memoryRecordId'] as String?) ?? '',
      memoryStrategyId: (json['memoryStrategyId'] as String?) ?? '',
      namespaces: ((json['namespaces'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k,
              MemoryRecordMetadataValue.fromJson(e as Map<String, dynamic>))),
      score: json['score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final createdAt = this.createdAt;
    final memoryRecordId = this.memoryRecordId;
    final memoryStrategyId = this.memoryStrategyId;
    final namespaces = this.namespaces;
    final metadata = this.metadata;
    final score = this.score;
    return {
      'content': content,
      'createdAt': unixTimestampToJson(createdAt),
      'memoryRecordId': memoryRecordId,
      'memoryStrategyId': memoryStrategyId,
      'namespaces': namespaces,
      if (metadata != null) 'metadata': metadata,
      if (score != null) 'score': score,
    };
  }
}

/// Contains the content of a memory record.
///
/// @nodoc
class MemoryContent {
  /// The text content of the memory record.
  final String? text;

  MemoryContent({
    this.text,
  });

  factory MemoryContent.fromJson(Map<String, dynamic> json) {
    return MemoryContent(
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

/// The value of a memory record metadata entry.
///
/// @nodoc
class MemoryRecordMetadataValue {
  /// A timestamp value in ISO 8601 UTC format.
  final DateTime? dateTimeValue;

  /// A numeric value.
  final double? numberValue;

  /// A list of string values.
  final List<String>? stringListValue;

  /// A string value.
  final String? stringValue;

  MemoryRecordMetadataValue({
    this.dateTimeValue,
    this.numberValue,
    this.stringListValue,
    this.stringValue,
  });

  factory MemoryRecordMetadataValue.fromJson(Map<String, dynamic> json) {
    return MemoryRecordMetadataValue(
      dateTimeValue: timeStampFromJson(json['dateTimeValue']),
      numberValue: json['numberValue'] as double?,
      stringListValue: (json['stringListValue'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dateTimeValue = this.dateTimeValue;
    final numberValue = this.numberValue;
    final stringListValue = this.stringListValue;
    final stringValue = this.stringValue;
    return {
      if (dateTimeValue != null)
        'dateTimeValue': unixTimestampToJson(dateTimeValue),
      if (numberValue != null) 'numberValue': numberValue,
      if (stringListValue != null) 'stringListValue': stringListValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

/// Contains search criteria for retrieving memory records.
///
/// @nodoc
class SearchCriteria {
  /// The search query to use for finding relevant memory records.
  final String searchQuery;

  /// The memory strategy identifier to filter memory records by.
  final String? memoryStrategyId;

  /// Filters to apply to metadata associated with a memory.
  final List<MemoryMetadataFilterExpression>? metadataFilters;

  /// The maximum number of top-scoring memory records to return. This value is
  /// used for semantic search ranking.
  final int? topK;

  SearchCriteria({
    required this.searchQuery,
    this.memoryStrategyId,
    this.metadataFilters,
    this.topK,
  });

  Map<String, dynamic> toJson() {
    final searchQuery = this.searchQuery;
    final memoryStrategyId = this.memoryStrategyId;
    final metadataFilters = this.metadataFilters;
    final topK = this.topK;
    return {
      'searchQuery': searchQuery,
      if (memoryStrategyId != null) 'memoryStrategyId': memoryStrategyId,
      if (metadataFilters != null) 'metadataFilters': metadataFilters,
      if (topK != null) 'topK': topK,
    };
  }
}

/// Filters to apply to metadata associated with a memory. Specify the metadata
/// key and value in the <code>left</code> and <code>right</code> fields and use
/// the <code>operator</code> field to define the relationship to match.
///
/// @nodoc
class MemoryMetadataFilterExpression {
  /// The metadata key to evaluate.
  final MemoryRecordLeftExpression left;

  /// The relationship between the metadata key and value to match when applying
  /// the metadata filter.
  final MemoryRecordOperatorType operator;

  /// The value to compare against. Required for all operators except EXISTS and
  /// NOT_EXISTS.
  final MemoryRecordRightExpression? right;

  MemoryMetadataFilterExpression({
    required this.left,
    required this.operator,
    this.right,
  });

  Map<String, dynamic> toJson() {
    final left = this.left;
    final operator = this.operator;
    final right = this.right;
    return {
      'left': left,
      'operator': operator.value,
      if (right != null) 'right': right,
    };
  }
}

/// The left-hand side of a memory record metadata filter expression.
///
/// @nodoc
class MemoryRecordLeftExpression {
  /// The metadata key to filter on.
  final String? metadataKey;

  MemoryRecordLeftExpression({
    this.metadataKey,
  });

  Map<String, dynamic> toJson() {
    final metadataKey = this.metadataKey;
    return {
      if (metadataKey != null) 'metadataKey': metadataKey,
    };
  }
}

/// @nodoc
class MemoryRecordOperatorType {
  static const equalsTo = MemoryRecordOperatorType._('EQUALS_TO');
  static const exists = MemoryRecordOperatorType._('EXISTS');
  static const notExists = MemoryRecordOperatorType._('NOT_EXISTS');
  static const before = MemoryRecordOperatorType._('BEFORE');
  static const after = MemoryRecordOperatorType._('AFTER');
  static const contains = MemoryRecordOperatorType._('CONTAINS');
  static const greaterThan = MemoryRecordOperatorType._('GREATER_THAN');
  static const greaterThanOrEquals =
      MemoryRecordOperatorType._('GREATER_THAN_OR_EQUALS');
  static const lessThan = MemoryRecordOperatorType._('LESS_THAN');
  static const lessThanOrEquals =
      MemoryRecordOperatorType._('LESS_THAN_OR_EQUALS');

  final String value;

  const MemoryRecordOperatorType._(this.value);

  static const values = [
    equalsTo,
    exists,
    notExists,
    before,
    after,
    contains,
    greaterThan,
    greaterThanOrEquals,
    lessThan,
    lessThanOrEquals
  ];

  static MemoryRecordOperatorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MemoryRecordOperatorType._(value));

  @override
  bool operator ==(other) =>
      other is MemoryRecordOperatorType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The right-hand side of a memory record metadata filter expression.
///
/// @nodoc
class MemoryRecordRightExpression {
  /// The metadata value to compare against.
  final MemoryRecordMetadataValue? metadataValue;

  MemoryRecordRightExpression({
    this.metadataValue,
  });

  Map<String, dynamic> toJson() {
    final metadataValue = this.metadataValue;
    return {
      if (metadataValue != null) 'metadataValue': metadataValue,
    };
  }
}

/// Contains summary information about a session in an AgentCore Memory
/// resource.
///
/// @nodoc
class SessionSummary {
  /// The identifier of the actor associated with the session.
  final String actorId;

  /// The timestamp when the session was created.
  final DateTime createdAt;

  /// The unique identifier of the session.
  final String sessionId;

  SessionSummary({
    required this.actorId,
    required this.createdAt,
    required this.sessionId,
  });

  factory SessionSummary.fromJson(Map<String, dynamic> json) {
    return SessionSummary(
      actorId: (json['actorId'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      sessionId: (json['sessionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final actorId = this.actorId;
    final createdAt = this.createdAt;
    final sessionId = this.sessionId;
    return {
      'actorId': actorId,
      'createdAt': unixTimestampToJson(createdAt),
      'sessionId': sessionId,
    };
  }
}

/// Contains filter criteria for listing sessions.
///
/// @nodoc
class SessionFilter {
  /// The event filter condition to apply. Use this to filter sessions based on
  /// event presence.
  final EventFilterCondition? eventFilter;

  SessionFilter({
    this.eventFilter,
  });

  Map<String, dynamic> toJson() {
    final eventFilter = this.eventFilter;
    return {
      if (eventFilter != null) 'eventFilter': eventFilter.value,
    };
  }
}

/// The condition to use for filtering sessions by events.
///
/// @nodoc
class EventFilterCondition {
  static const hasEvents = EventFilterCondition._('HAS_EVENTS');

  final String value;

  const EventFilterCondition._(this.value);

  static const values = [hasEvents];

  static EventFilterCondition fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EventFilterCondition._(value));

  @override
  bool operator ==(other) =>
      other is EventFilterCondition && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Metadata information associated with this extraction job.
///
/// @nodoc
class ExtractionJobMetadata {
  /// The unique identifier for the extraction job.
  final String jobID;

  /// The messages associated with the extraction job.
  final ExtractionJobMessages messages;

  /// The identifier of the actor for this extraction job.
  final String? actorId;

  /// The cause of failure, if the job did not complete successfully.
  final String? failureReason;

  /// The identifier of the session for this extraction job.
  final String? sessionId;

  /// The current status of the extraction job.
  final ExtractionJobStatus? status;

  /// The identifier of the memory strategy for this extraction job.
  final String? strategyId;

  ExtractionJobMetadata({
    required this.jobID,
    required this.messages,
    this.actorId,
    this.failureReason,
    this.sessionId,
    this.status,
    this.strategyId,
  });

  factory ExtractionJobMetadata.fromJson(Map<String, dynamic> json) {
    return ExtractionJobMetadata(
      jobID: (json['jobID'] as String?) ?? '',
      messages: ExtractionJobMessages.fromJson(
          (json['messages'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      actorId: json['actorId'] as String?,
      failureReason: json['failureReason'] as String?,
      sessionId: json['sessionId'] as String?,
      status: (json['status'] as String?)?.let(ExtractionJobStatus.fromString),
      strategyId: json['strategyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobID = this.jobID;
    final messages = this.messages;
    final actorId = this.actorId;
    final failureReason = this.failureReason;
    final sessionId = this.sessionId;
    final status = this.status;
    final strategyId = this.strategyId;
    return {
      'jobID': jobID,
      'messages': messages,
      if (actorId != null) 'actorId': actorId,
      if (failureReason != null) 'failureReason': failureReason,
      if (sessionId != null) 'sessionId': sessionId,
      if (status != null) 'status': status.value,
      if (strategyId != null) 'strategyId': strategyId,
    };
  }
}

/// The list of messages that compose this extraction job.
///
/// @nodoc
class ExtractionJobMessages {
  /// The list of messages that compose this extraction job.
  final List<MessageMetadata>? messagesList;

  ExtractionJobMessages({
    this.messagesList,
  });

  factory ExtractionJobMessages.fromJson(Map<String, dynamic> json) {
    return ExtractionJobMessages(
      messagesList: (json['messagesList'] as List?)
          ?.nonNulls
          .map((e) => MessageMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final messagesList = this.messagesList;
    return {
      if (messagesList != null) 'messagesList': messagesList,
    };
  }
}

/// @nodoc
class ExtractionJobStatus {
  static const failed = ExtractionJobStatus._('FAILED');

  final String value;

  const ExtractionJobStatus._(this.value);

  static const values = [failed];

  static ExtractionJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExtractionJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is ExtractionJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Metadata information associated with this message.
///
/// @nodoc
class MessageMetadata {
  /// The identifier of the event associated with this message.
  final String eventId;

  /// The position of this message within that event’s ordered list of messages.
  final int messageIndex;

  MessageMetadata({
    required this.eventId,
    required this.messageIndex,
  });

  factory MessageMetadata.fromJson(Map<String, dynamic> json) {
    return MessageMetadata(
      eventId: (json['eventId'] as String?) ?? '',
      messageIndex: (json['messageIndex'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final eventId = this.eventId;
    final messageIndex = this.messageIndex;
    return {
      'eventId': eventId,
      'messageIndex': messageIndex,
    };
  }
}

/// Filters for querying memory extraction jobs based on various criteria.
///
/// @nodoc
class ExtractionJobFilterInput {
  /// The identifier of the actor. If specified, only extraction jobs with this
  /// actor ID are returned.
  final String? actorId;

  /// The unique identifier of the session. If specified, only extraction jobs
  /// with this session ID are returned.
  final String? sessionId;

  /// The status of the extraction job. If specified, only extraction jobs with
  /// this status are returned.
  final ExtractionJobStatus? status;

  /// The memory strategy identifier to filter extraction jobs by. If specified,
  /// only extraction jobs with this strategy ID are returned.
  final String? strategyId;

  ExtractionJobFilterInput({
    this.actorId,
    this.sessionId,
    this.status,
    this.strategyId,
  });

  Map<String, dynamic> toJson() {
    final actorId = this.actorId;
    final sessionId = this.sessionId;
    final status = this.status;
    final strategyId = this.strategyId;
    return {
      if (actorId != null) 'actorId': actorId,
      if (sessionId != null) 'sessionId': sessionId,
      if (status != null) 'status': status.value,
      if (strategyId != null) 'strategyId': strategyId,
    };
  }
}

/// Contains information about an event in an AgentCore Memory resource.
///
/// @nodoc
class Event {
  /// The identifier of the actor associated with the event.
  final String actorId;

  /// The unique identifier of the event.
  final String eventId;

  /// The timestamp when the event occurred.
  final DateTime eventTimestamp;

  /// The identifier of the AgentCore Memory resource containing the event.
  final String memoryId;

  /// The content payload of the event.
  final List<PayloadType> payload;

  /// The identifier of the session containing the event.
  final String sessionId;

  /// The branch information for the event.
  final Branch? branch;

  /// Metadata associated with an event.
  final Map<String, MetadataValue>? metadata;

  Event({
    required this.actorId,
    required this.eventId,
    required this.eventTimestamp,
    required this.memoryId,
    required this.payload,
    required this.sessionId,
    this.branch,
    this.metadata,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      actorId: (json['actorId'] as String?) ?? '',
      eventId: (json['eventId'] as String?) ?? '',
      eventTimestamp: nonNullableTimeStampFromJson(json['eventTimestamp'] ?? 0),
      memoryId: (json['memoryId'] as String?) ?? '',
      payload: ((json['payload'] as List?) ?? const [])
          .nonNulls
          .map((e) => PayloadType.fromJson(e as Map<String, dynamic>))
          .toList(),
      sessionId: (json['sessionId'] as String?) ?? '',
      branch: json['branch'] != null
          ? Branch.fromJson(json['branch'] as Map<String, dynamic>)
          : null,
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, MetadataValue.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final actorId = this.actorId;
    final eventId = this.eventId;
    final eventTimestamp = this.eventTimestamp;
    final memoryId = this.memoryId;
    final payload = this.payload;
    final sessionId = this.sessionId;
    final branch = this.branch;
    final metadata = this.metadata;
    return {
      'actorId': actorId,
      'eventId': eventId,
      'eventTimestamp': unixTimestampToJson(eventTimestamp),
      'memoryId': memoryId,
      'payload': payload,
      'sessionId': sessionId,
      if (branch != null) 'branch': branch,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

/// Contains information about a branch in an AgentCore Memory resource.
/// Branches allow for organizing events into different conversation threads or
/// paths.
///
/// @nodoc
class Branch {
  /// The name of the branch.
  final String name;

  /// The identifier of the root event for this branch.
  final String? rootEventId;

  Branch({
    required this.name,
    this.rootEventId,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      name: (json['name'] as String?) ?? '',
      rootEventId: json['rootEventId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final rootEventId = this.rootEventId;
    return {
      'name': name,
      if (rootEventId != null) 'rootEventId': rootEventId,
    };
  }
}

/// Value associated with the <code>eventMetadata</code> key.
///
/// @nodoc
class MetadataValue {
  /// Value associated with the <code>eventMetadata</code> key.
  final String? stringValue;

  MetadataValue({
    this.stringValue,
  });

  factory MetadataValue.fromJson(Map<String, dynamic> json) {
    return MetadataValue(
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

/// Contains the payload content for an event.
///
/// @nodoc
class PayloadType {
  /// The binary content of the payload.
  final Object? blob;

  /// The conversational content of the payload.
  final Conversational? conversational;

  PayloadType({
    this.blob,
    this.conversational,
  });

  factory PayloadType.fromJson(Map<String, dynamic> json) {
    return PayloadType(
      blob: json['blob'],
      conversational: json['conversational'] != null
          ? Conversational.fromJson(
              json['conversational'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final conversational = this.conversational;
    return {
      if (blob != null) 'blob': blob,
      if (conversational != null) 'conversational': conversational,
    };
  }
}

/// Contains conversational content for an event payload.
///
/// @nodoc
class Conversational {
  /// The content of the conversation message.
  final Content content;

  /// The role of the participant in the conversation (for example, "user" or
  /// "assistant").
  final Role role;

  Conversational({
    required this.content,
    required this.role,
  });

  factory Conversational.fromJson(Map<String, dynamic> json) {
    return Conversational(
      content: Content.fromJson((json['content'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      role: Role.fromString((json['role'] as String?) ?? ''),
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

/// Contains the content of a memory item.
///
/// @nodoc
class Content {
  /// The text content of the memory item.
  final String? text;

  Content({
    this.text,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
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

/// @nodoc
class Role {
  static const assistant = Role._('ASSISTANT');
  static const user = Role._('USER');
  static const tool = Role._('TOOL');
  static const other = Role._('OTHER');

  final String value;

  const Role._(this.value);

  static const values = [assistant, user, tool, other];

  static Role fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Role._(value));

  @override
  bool operator ==(other) => other is Role && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains filter criteria for listing events.
///
/// @nodoc
class FilterInput {
  /// The branch filter criteria to apply when listing events.
  final BranchFilter? branch;

  /// Event metadata filter criteria to apply when retrieving events.
  final List<EventMetadataFilterExpression>? eventMetadata;

  FilterInput({
    this.branch,
    this.eventMetadata,
  });

  Map<String, dynamic> toJson() {
    final branch = this.branch;
    final eventMetadata = this.eventMetadata;
    return {
      if (branch != null) 'branch': branch,
      if (eventMetadata != null) 'eventMetadata': eventMetadata,
    };
  }
}

/// Contains filter criteria for branches when listing events.
///
/// @nodoc
class BranchFilter {
  /// The name of the branch to filter by.
  final String name;

  /// Specifies whether to include parent branches in the results. Set to true to
  /// include parent branches, or false to exclude them.
  final bool? includeParentBranches;

  BranchFilter({
    required this.name,
    this.includeParentBranches,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final includeParentBranches = this.includeParentBranches;
    return {
      'name': name,
      if (includeParentBranches != null)
        'includeParentBranches': includeParentBranches,
    };
  }
}

/// Filter expression for retrieving events based on metadata associated with an
/// event.
///
/// @nodoc
class EventMetadataFilterExpression {
  /// Left operand of the event metadata filter expression.
  final LeftExpression left;

  /// Operator applied to the event metadata filter expression.
  final OperatorType operator;

  /// Right operand of the event metadata filter expression.
  final RightExpression? right;

  EventMetadataFilterExpression({
    required this.left,
    required this.operator,
    this.right,
  });

  Map<String, dynamic> toJson() {
    final left = this.left;
    final operator = this.operator;
    final right = this.right;
    return {
      'left': left,
      'operator': operator.value,
      if (right != null) 'right': right,
    };
  }
}

/// Left expression of the event metadata filter.
///
/// @nodoc
class LeftExpression {
  /// Key associated with the metadata in an event.
  final String? metadataKey;

  LeftExpression({
    this.metadataKey,
  });

  Map<String, dynamic> toJson() {
    final metadataKey = this.metadataKey;
    return {
      if (metadataKey != null) 'metadataKey': metadataKey,
    };
  }
}

/// @nodoc
class OperatorType {
  static const equalsTo = OperatorType._('EQUALS_TO');
  static const exists = OperatorType._('EXISTS');
  static const notExists = OperatorType._('NOT_EXISTS');

  final String value;

  const OperatorType._(this.value);

  static const values = [equalsTo, exists, notExists];

  static OperatorType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OperatorType._(value));

  @override
  bool operator ==(other) => other is OperatorType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Right expression of the <code>eventMetadata</code>filter.
///
/// @nodoc
class RightExpression {
  /// Value associated with the key in <code>eventMetadata</code>.
  final MetadataValue? metadataValue;

  RightExpression({
    this.metadataValue,
  });

  Map<String, dynamic> toJson() {
    final metadataValue = this.metadataValue;
    return {
      if (metadataValue != null) 'metadataValue': metadataValue,
    };
  }
}

/// Contains summary information about an actor in an AgentCore Memory resource.
///
/// @nodoc
class ActorSummary {
  /// The unique identifier of the actor.
  final String actorId;

  ActorSummary({
    required this.actorId,
  });

  factory ActorSummary.fromJson(Map<String, dynamic> json) {
    return ActorSummary(
      actorId: (json['actorId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final actorId = this.actorId;
    return {
      'actorId': actorId,
    };
  }
}

/// Contains information about a memory record in an AgentCore Memory resource.
///
/// @nodoc
class MemoryRecord {
  /// The content of the memory record.
  final MemoryContent content;

  /// The timestamp when the memory record was created.
  final DateTime createdAt;

  /// The unique identifier of the memory record.
  final String memoryRecordId;

  /// The identifier of the memory strategy associated with this record.
  final String memoryStrategyId;

  /// The namespaces associated with this memory record. Namespaces help organize
  /// and categorize memory records.
  final List<String> namespaces;

  /// A map of metadata key-value pairs associated with a memory record.
  final Map<String, MemoryRecordMetadataValue>? metadata;

  MemoryRecord({
    required this.content,
    required this.createdAt,
    required this.memoryRecordId,
    required this.memoryStrategyId,
    required this.namespaces,
    this.metadata,
  });

  factory MemoryRecord.fromJson(Map<String, dynamic> json) {
    return MemoryRecord(
      content: MemoryContent.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      memoryRecordId: (json['memoryRecordId'] as String?) ?? '',
      memoryStrategyId: (json['memoryStrategyId'] as String?) ?? '',
      namespaces: ((json['namespaces'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k,
              MemoryRecordMetadataValue.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final createdAt = this.createdAt;
    final memoryRecordId = this.memoryRecordId;
    final memoryStrategyId = this.memoryStrategyId;
    final namespaces = this.namespaces;
    final metadata = this.metadata;
    return {
      'content': content,
      'createdAt': unixTimestampToJson(createdAt),
      'memoryRecordId': memoryRecordId,
      'memoryStrategyId': memoryStrategyId,
      'namespaces': namespaces,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

/// Output information returned after processing a memory record operation.
///
/// @nodoc
class MemoryRecordOutput {
  /// The unique ID associated to the memory record.
  final String memoryRecordId;

  /// The status of the memory record operation (e.g., SUCCEEDED, FAILED).
  final MemoryRecordStatus status;

  /// The error code returned when the memory record operation fails.
  final int? errorCode;

  /// A human-readable error message describing why the memory record operation
  /// failed.
  final String? errorMessage;

  /// The client-provided identifier that was used to track this record operation.
  final String? requestIdentifier;

  MemoryRecordOutput({
    required this.memoryRecordId,
    required this.status,
    this.errorCode,
    this.errorMessage,
    this.requestIdentifier,
  });

  factory MemoryRecordOutput.fromJson(Map<String, dynamic> json) {
    return MemoryRecordOutput(
      memoryRecordId: (json['memoryRecordId'] as String?) ?? '',
      status: MemoryRecordStatus.fromString((json['status'] as String?) ?? ''),
      errorCode: json['errorCode'] as int?,
      errorMessage: json['errorMessage'] as String?,
      requestIdentifier: json['requestIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final memoryRecordId = this.memoryRecordId;
    final status = this.status;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final requestIdentifier = this.requestIdentifier;
    return {
      'memoryRecordId': memoryRecordId,
      'status': status.value,
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (requestIdentifier != null) 'requestIdentifier': requestIdentifier,
    };
  }
}

/// @nodoc
class MemoryRecordStatus {
  static const succeeded = MemoryRecordStatus._('SUCCEEDED');
  static const failed = MemoryRecordStatus._('FAILED');

  final String value;

  const MemoryRecordStatus._(this.value);

  static const values = [succeeded, failed];

  static MemoryRecordStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MemoryRecordStatus._(value));

  @override
  bool operator ==(other) =>
      other is MemoryRecordStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Input structure to update an existing memory record.
///
/// @nodoc
class MemoryRecordUpdateInput {
  /// The unique ID of the memory record to be updated.
  final String memoryRecordId;

  /// Time at which the memory record was updated
  final DateTime timestamp;

  /// The content to be stored within the memory record.
  final MemoryContent? content;

  /// The updated ID of the memory strategy that defines how this memory record is
  /// grouped.
  final String? memoryStrategyId;

  /// Metadata key-value pairs to be stored with the memory record.
  final Map<String, MemoryRecordMetadataValue>? metadata;

  /// The updated list of namespace identifiers for categorizing the memory
  /// record.
  final List<String>? namespaces;

  MemoryRecordUpdateInput({
    required this.memoryRecordId,
    required this.timestamp,
    this.content,
    this.memoryStrategyId,
    this.metadata,
    this.namespaces,
  });

  Map<String, dynamic> toJson() {
    final memoryRecordId = this.memoryRecordId;
    final timestamp = this.timestamp;
    final content = this.content;
    final memoryStrategyId = this.memoryStrategyId;
    final metadata = this.metadata;
    final namespaces = this.namespaces;
    return {
      'memoryRecordId': memoryRecordId,
      'timestamp': unixTimestampToJson(timestamp),
      if (content != null) 'content': content,
      if (memoryStrategyId != null) 'memoryStrategyId': memoryStrategyId,
      if (metadata != null) 'metadata': metadata,
      if (namespaces != null) 'namespaces': namespaces,
    };
  }
}

/// Input structure to delete an existing memory record.
///
/// @nodoc
class MemoryRecordDeleteInput {
  /// The unique ID of the memory record to be deleted.
  final String memoryRecordId;

  MemoryRecordDeleteInput({
    required this.memoryRecordId,
  });

  Map<String, dynamic> toJson() {
    final memoryRecordId = this.memoryRecordId;
    return {
      'memoryRecordId': memoryRecordId,
    };
  }
}

/// Input structure to create a new memory record.
///
/// @nodoc
class MemoryRecordCreateInput {
  /// The content to be stored within the memory record.
  final MemoryContent content;

  /// A list of namespace identifiers that categorize or group the memory record.
  final List<String> namespaces;

  /// A client-provided identifier for tracking this specific record creation
  /// request.
  final String requestIdentifier;

  /// Time at which the memory record was created.
  final DateTime timestamp;

  /// The ID of the memory strategy that defines how this memory record is
  /// grouped.
  final String? memoryStrategyId;

  /// Metadata key-value pairs to be stored with the memory record.
  final Map<String, MemoryRecordMetadataValue>? metadata;

  MemoryRecordCreateInput({
    required this.content,
    required this.namespaces,
    required this.requestIdentifier,
    required this.timestamp,
    this.memoryStrategyId,
    this.metadata,
  });

  Map<String, dynamic> toJson() {
    final content = this.content;
    final namespaces = this.namespaces;
    final requestIdentifier = this.requestIdentifier;
    final timestamp = this.timestamp;
    final memoryStrategyId = this.memoryStrategyId;
    final metadata = this.metadata;
    return {
      'content': content,
      'namespaces': namespaces,
      'requestIdentifier': requestIdentifier,
      'timestamp': unixTimestampToJson(timestamp),
      if (memoryStrategyId != null) 'memoryStrategyId': memoryStrategyId,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

/// @nodoc
class ABTestStatus {
  static const creating = ABTestStatus._('CREATING');
  static const active = ABTestStatus._('ACTIVE');
  static const createFailed = ABTestStatus._('CREATE_FAILED');
  static const updating = ABTestStatus._('UPDATING');
  static const updateFailed = ABTestStatus._('UPDATE_FAILED');
  static const deleting = ABTestStatus._('DELETING');
  static const deleteFailed = ABTestStatus._('DELETE_FAILED');
  static const failed = ABTestStatus._('FAILED');

  final String value;

  const ABTestStatus._(this.value);

  static const values = [
    creating,
    active,
    createFailed,
    updating,
    updateFailed,
    deleting,
    deleteFailed,
    failed
  ];

  static ABTestStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ABTestStatus._(value));

  @override
  bool operator ==(other) => other is ABTestStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ABTestExecutionStatus {
  static const paused = ABTestExecutionStatus._('PAUSED');
  static const running = ABTestExecutionStatus._('RUNNING');
  static const stopped = ABTestExecutionStatus._('STOPPED');
  static const notStarted = ABTestExecutionStatus._('NOT_STARTED');

  final String value;

  const ABTestExecutionStatus._(this.value);

  static const values = [paused, running, stopped, notStarted];

  static ABTestExecutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ABTestExecutionStatus._(value));

  @override
  bool operator ==(other) =>
      other is ABTestExecutionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A filter to restrict which gateway target paths are included in the A/B
/// test.
///
/// @nodoc
class GatewayFilter {
  /// A list of target path patterns to include in the A/B test.
  final List<String>? targetPaths;

  GatewayFilter({
    this.targetPaths,
  });

  factory GatewayFilter.fromJson(Map<String, dynamic> json) {
    return GatewayFilter(
      targetPaths: (json['targetPaths'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final targetPaths = this.targetPaths;
    return {
      if (targetPaths != null) 'targetPaths': targetPaths,
    };
  }
}

/// The evaluation configuration for an A/B test, specifying which online
/// evaluation configurations to use for measuring variant performance.
///
/// @nodoc
class ABTestEvaluationConfig {
  /// The Amazon Resource Name (ARN) of a single online evaluation configuration
  /// to use for both variants.
  final String? onlineEvaluationConfigArn;

  /// Per-variant online evaluation configurations, allowing different evaluation
  /// settings for each variant.
  final List<PerVariantOnlineEvaluationConfig>?
      perVariantOnlineEvaluationConfig;

  ABTestEvaluationConfig({
    this.onlineEvaluationConfigArn,
    this.perVariantOnlineEvaluationConfig,
  });

  factory ABTestEvaluationConfig.fromJson(Map<String, dynamic> json) {
    return ABTestEvaluationConfig(
      onlineEvaluationConfigArn: json['onlineEvaluationConfigArn'] as String?,
      perVariantOnlineEvaluationConfig:
          (json['perVariantOnlineEvaluationConfig'] as List?)
              ?.nonNulls
              .map((e) => PerVariantOnlineEvaluationConfig.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final onlineEvaluationConfigArn = this.onlineEvaluationConfigArn;
    final perVariantOnlineEvaluationConfig =
        this.perVariantOnlineEvaluationConfig;
    return {
      if (onlineEvaluationConfigArn != null)
        'onlineEvaluationConfigArn': onlineEvaluationConfigArn,
      if (perVariantOnlineEvaluationConfig != null)
        'perVariantOnlineEvaluationConfig': perVariantOnlineEvaluationConfig,
    };
  }
}

/// An online evaluation configuration associated with a specific A/B test
/// variant.
///
/// @nodoc
class PerVariantOnlineEvaluationConfig {
  /// The name of the variant this evaluation configuration applies to.
  final String name;

  /// The Amazon Resource Name (ARN) of the online evaluation configuration for
  /// this variant.
  final String onlineEvaluationConfigArn;

  PerVariantOnlineEvaluationConfig({
    required this.name,
    required this.onlineEvaluationConfigArn,
  });

  factory PerVariantOnlineEvaluationConfig.fromJson(Map<String, dynamic> json) {
    return PerVariantOnlineEvaluationConfig(
      name: (json['name'] as String?) ?? '',
      onlineEvaluationConfigArn:
          (json['onlineEvaluationConfigArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final onlineEvaluationConfigArn = this.onlineEvaluationConfigArn;
    return {
      'name': name,
      'onlineEvaluationConfigArn': onlineEvaluationConfigArn,
    };
  }
}

/// A variant in an A/B test, representing either the control (C) or treatment
/// (T1) configuration.
///
/// @nodoc
class Variant {
  /// The name of the variant. Must be <code>C</code> for control or
  /// <code>T1</code> for treatment.
  final String name;

  /// The configuration for this variant, including the configuration bundle or
  /// target reference.
  final VariantConfiguration variantConfiguration;

  /// The percentage of traffic to route to this variant. Weights across all
  /// variants must sum to 100.
  final int weight;

  Variant({
    required this.name,
    required this.variantConfiguration,
    required this.weight,
  });

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      name: (json['name'] as String?) ?? '',
      variantConfiguration: VariantConfiguration.fromJson(
          (json['variantConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      weight: (json['weight'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final variantConfiguration = this.variantConfiguration;
    final weight = this.weight;
    return {
      'name': name,
      'variantConfiguration': variantConfiguration,
      'weight': weight,
    };
  }
}

/// The configuration for an A/B test variant.
///
/// @nodoc
class VariantConfiguration {
  /// A reference to a configuration bundle version to use for this variant.
  final ConfigurationBundleRef? configurationBundle;

  /// A reference to a gateway target to route traffic to for this variant.
  final TargetRef? target;

  VariantConfiguration({
    this.configurationBundle,
    this.target,
  });

  factory VariantConfiguration.fromJson(Map<String, dynamic> json) {
    return VariantConfiguration(
      configurationBundle: json['configurationBundle'] != null
          ? ConfigurationBundleRef.fromJson(
              json['configurationBundle'] as Map<String, dynamic>)
          : null,
      target: json['target'] != null
          ? TargetRef.fromJson(json['target'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationBundle = this.configurationBundle;
    final target = this.target;
    return {
      if (configurationBundle != null)
        'configurationBundle': configurationBundle,
      if (target != null) 'target': target,
    };
  }
}

/// A reference to a specific version of a configuration bundle.
///
/// @nodoc
class ConfigurationBundleRef {
  /// The Amazon Resource Name (ARN) of the configuration bundle.
  final String bundleArn;

  /// The version of the configuration bundle.
  final String bundleVersion;

  ConfigurationBundleRef({
    required this.bundleArn,
    required this.bundleVersion,
  });

  factory ConfigurationBundleRef.fromJson(Map<String, dynamic> json) {
    return ConfigurationBundleRef(
      bundleArn: (json['bundleArn'] as String?) ?? '',
      bundleVersion: (json['bundleVersion'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final bundleArn = this.bundleArn;
    final bundleVersion = this.bundleVersion;
    return {
      'bundleArn': bundleArn,
      'bundleVersion': bundleVersion,
    };
  }
}

/// A reference to a gateway target.
///
/// @nodoc
class TargetRef {
  /// The name of the gateway target.
  final String name;

  TargetRef({
    required this.name,
  });

  factory TargetRef.fromJson(Map<String, dynamic> json) {
    return TargetRef(
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

/// The lifecycle status of a batch evaluation job.
///
/// @nodoc
class BatchEvaluationStatus {
  static const pending = BatchEvaluationStatus._('PENDING');
  static const inProgress = BatchEvaluationStatus._('IN_PROGRESS');
  static const completed = BatchEvaluationStatus._('COMPLETED');
  static const completedWithErrors =
      BatchEvaluationStatus._('COMPLETED_WITH_ERRORS');
  static const failed = BatchEvaluationStatus._('FAILED');
  static const stopping = BatchEvaluationStatus._('STOPPING');
  static const stopped = BatchEvaluationStatus._('STOPPED');
  static const deleting = BatchEvaluationStatus._('DELETING');

  final String value;

  const BatchEvaluationStatus._(this.value);

  static const values = [
    pending,
    inProgress,
    completed,
    completedWithErrors,
    failed,
    stopping,
    stopped,
    deleting
  ];

  static BatchEvaluationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BatchEvaluationStatus._(value));

  @override
  bool operator ==(other) =>
      other is BatchEvaluationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The type of recommendation to generate.
///
/// @nodoc
class RecommendationType {
  static const systemPromptRecommendation =
      RecommendationType._('SYSTEM_PROMPT_RECOMMENDATION');
  static const toolDescriptionRecommendation =
      RecommendationType._('TOOL_DESCRIPTION_RECOMMENDATION');

  final String value;

  const RecommendationType._(this.value);

  static const values = [
    systemPromptRecommendation,
    toolDescriptionRecommendation
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

/// The configuration for a recommendation, varying by recommendation type.
///
/// @nodoc
class RecommendationConfig {
  /// The configuration for a system prompt recommendation.
  final SystemPromptRecommendationConfig? systemPromptRecommendationConfig;

  /// The configuration for a tool description recommendation.
  final ToolDescriptionRecommendationConfig?
      toolDescriptionRecommendationConfig;

  RecommendationConfig({
    this.systemPromptRecommendationConfig,
    this.toolDescriptionRecommendationConfig,
  });

  factory RecommendationConfig.fromJson(Map<String, dynamic> json) {
    return RecommendationConfig(
      systemPromptRecommendationConfig:
          json['systemPromptRecommendationConfig'] != null
              ? SystemPromptRecommendationConfig.fromJson(
                  json['systemPromptRecommendationConfig']
                      as Map<String, dynamic>)
              : null,
      toolDescriptionRecommendationConfig:
          json['toolDescriptionRecommendationConfig'] != null
              ? ToolDescriptionRecommendationConfig.fromJson(
                  json['toolDescriptionRecommendationConfig']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final systemPromptRecommendationConfig =
        this.systemPromptRecommendationConfig;
    final toolDescriptionRecommendationConfig =
        this.toolDescriptionRecommendationConfig;
    return {
      if (systemPromptRecommendationConfig != null)
        'systemPromptRecommendationConfig': systemPromptRecommendationConfig,
      if (toolDescriptionRecommendationConfig != null)
        'toolDescriptionRecommendationConfig':
            toolDescriptionRecommendationConfig,
    };
  }
}

/// The lifecycle status of a recommendation.
///
/// @nodoc
class RecommendationStatus {
  static const pending = RecommendationStatus._('PENDING');
  static const inProgress = RecommendationStatus._('IN_PROGRESS');
  static const completed = RecommendationStatus._('COMPLETED');
  static const failed = RecommendationStatus._('FAILED');
  static const deleting = RecommendationStatus._('DELETING');

  final String value;

  const RecommendationStatus._(this.value);

  static const values = [pending, inProgress, completed, failed, deleting];

  static RecommendationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecommendationStatus._(value));

  @override
  bool operator ==(other) =>
      other is RecommendationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for generating system prompt optimization recommendations.
///
/// @nodoc
class SystemPromptRecommendationConfig {
  /// The agent traces to analyze for generating recommendations.
  final AgentTracesConfig agentTraces;

  /// The evaluation configuration specifying which evaluator to use for assessing
  /// recommendation quality.
  final RecommendationEvaluationConfig evaluationConfig;

  /// The current system prompt to optimize.
  final SystemPromptConfig systemPrompt;

  SystemPromptRecommendationConfig({
    required this.agentTraces,
    required this.evaluationConfig,
    required this.systemPrompt,
  });

  factory SystemPromptRecommendationConfig.fromJson(Map<String, dynamic> json) {
    return SystemPromptRecommendationConfig(
      agentTraces: AgentTracesConfig.fromJson(
          (json['agentTraces'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      evaluationConfig: RecommendationEvaluationConfig.fromJson(
          (json['evaluationConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      systemPrompt: SystemPromptConfig.fromJson(
          (json['systemPrompt'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agentTraces = this.agentTraces;
    final evaluationConfig = this.evaluationConfig;
    final systemPrompt = this.systemPrompt;
    return {
      'agentTraces': agentTraces,
      'evaluationConfig': evaluationConfig,
      'systemPrompt': systemPrompt,
    };
  }
}

/// Configuration for generating tool description optimization recommendations.
///
/// @nodoc
class ToolDescriptionRecommendationConfig {
  /// The agent traces to analyze for generating tool description recommendations.
  final AgentTracesConfig agentTraces;

  /// The current tool descriptions to optimize.
  final ToolDescriptionSource toolDescription;

  ToolDescriptionRecommendationConfig({
    required this.agentTraces,
    required this.toolDescription,
  });

  factory ToolDescriptionRecommendationConfig.fromJson(
      Map<String, dynamic> json) {
    return ToolDescriptionRecommendationConfig(
      agentTraces: AgentTracesConfig.fromJson(
          (json['agentTraces'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      toolDescription: ToolDescriptionSource.fromJson(
          (json['toolDescription'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agentTraces = this.agentTraces;
    final toolDescription = this.toolDescription;
    return {
      'agentTraces': agentTraces,
      'toolDescription': toolDescription,
    };
  }
}

/// The source of tool descriptions, either inline text or from a configuration
/// bundle.
///
/// @nodoc
class ToolDescriptionSource {
  /// Tool descriptions sourced from a configuration bundle version.
  final ToolDescriptionConfigurationBundle? configurationBundle;

  /// Tool descriptions provided as inline text.
  final ToolDescriptionTextInput? toolDescriptionText;

  ToolDescriptionSource({
    this.configurationBundle,
    this.toolDescriptionText,
  });

  factory ToolDescriptionSource.fromJson(Map<String, dynamic> json) {
    return ToolDescriptionSource(
      configurationBundle: json['configurationBundle'] != null
          ? ToolDescriptionConfigurationBundle.fromJson(
              json['configurationBundle'] as Map<String, dynamic>)
          : null,
      toolDescriptionText: json['toolDescriptionText'] != null
          ? ToolDescriptionTextInput.fromJson(
              json['toolDescriptionText'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationBundle = this.configurationBundle;
    final toolDescriptionText = this.toolDescriptionText;
    return {
      if (configurationBundle != null)
        'configurationBundle': configurationBundle,
      if (toolDescriptionText != null)
        'toolDescriptionText': toolDescriptionText,
    };
  }
}

/// The configuration specifying where to read agent traces from for
/// recommendation analysis.
///
/// @nodoc
class AgentTracesConfig {
  /// Agent traces read from CloudWatch Logs.
  final CloudWatchLogsTraceConfig? cloudwatchLogs;

  /// Agent traces provided as inline session spans in OpenTelemetry format.
  final List<Object>? sessionSpans;

  AgentTracesConfig({
    this.cloudwatchLogs,
    this.sessionSpans,
  });

  factory AgentTracesConfig.fromJson(Map<String, dynamic> json) {
    return AgentTracesConfig(
      cloudwatchLogs: json['cloudwatchLogs'] != null
          ? CloudWatchLogsTraceConfig.fromJson(
              json['cloudwatchLogs'] as Map<String, dynamic>)
          : null,
      sessionSpans: (json['sessionSpans'] as List?)?.nonNulls.toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudwatchLogs = this.cloudwatchLogs;
    final sessionSpans = this.sessionSpans;
    return {
      if (cloudwatchLogs != null) 'cloudwatchLogs': cloudwatchLogs,
      if (sessionSpans != null) 'sessionSpans': sessionSpans,
    };
  }
}

/// Configuration for reading agent traces from CloudWatch Logs for
/// recommendation analysis.
///
/// @nodoc
class CloudWatchLogsTraceConfig {
  /// The end time of the time range to read traces from.
  final DateTime endTime;

  /// The list of CloudWatch log group ARNs to read agent traces from.
  final List<String> logGroupArns;

  /// The list of service names to filter traces within the specified log groups.
  final List<String> serviceNames;

  /// The start time of the time range to read traces from.
  final DateTime startTime;

  /// Optional rule configuration for filtering traces.
  final CloudWatchLogsRule? rule;

  CloudWatchLogsTraceConfig({
    required this.endTime,
    required this.logGroupArns,
    required this.serviceNames,
    required this.startTime,
    this.rule,
  });

  factory CloudWatchLogsTraceConfig.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogsTraceConfig(
      endTime: nonNullableTimeStampFromJson(json['endTime'] ?? 0),
      logGroupArns: ((json['logGroupArns'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      serviceNames: ((json['serviceNames'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      startTime: nonNullableTimeStampFromJson(json['startTime'] ?? 0),
      rule: json['rule'] != null
          ? CloudWatchLogsRule.fromJson(json['rule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final logGroupArns = this.logGroupArns;
    final serviceNames = this.serviceNames;
    final startTime = this.startTime;
    final rule = this.rule;
    return {
      'endTime': iso8601ToJson(endTime),
      'logGroupArns': logGroupArns,
      'serviceNames': serviceNames,
      'startTime': iso8601ToJson(startTime),
      if (rule != null) 'rule': rule,
    };
  }
}

/// A rule configuration for filtering agent traces from CloudWatch Logs.
///
/// @nodoc
class CloudWatchLogsRule {
  /// The list of filters to apply when reading agent traces.
  final List<CloudWatchLogsFilter>? filters;

  CloudWatchLogsRule({
    this.filters,
  });

  factory CloudWatchLogsRule.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogsRule(
      filters: (json['filters'] as List?)
          ?.nonNulls
          .map((e) => CloudWatchLogsFilter.fromJson(e as Map<String, dynamic>))
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

/// A filter for narrowing down agent traces from CloudWatch Logs based on
/// key-value comparisons.
///
/// @nodoc
class CloudWatchLogsFilter {
  /// The key or field name to filter on within the agent trace data.
  final String key;

  /// The comparison operator to use for filtering.
  final CloudWatchLogsFilterOperator operator;

  /// The value to compare against using the specified operator.
  final FilterValue value;

  CloudWatchLogsFilter({
    required this.key,
    required this.operator,
    required this.value,
  });

  factory CloudWatchLogsFilter.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogsFilter(
      key: (json['key'] as String?) ?? '',
      operator: CloudWatchLogsFilterOperator.fromString(
          (json['operator'] as String?) ?? ''),
      value: FilterValue.fromJson((json['value'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final operator = this.operator;
    final value = this.value;
    return {
      'key': key,
      'operator': operator.value,
      'value': value,
    };
  }
}

/// The comparison operator used to filter CloudWatch Logs entries.
///
/// @nodoc
class CloudWatchLogsFilterOperator {
  static const equals = CloudWatchLogsFilterOperator._('Equals');
  static const notEquals = CloudWatchLogsFilterOperator._('NotEquals');
  static const greaterThan = CloudWatchLogsFilterOperator._('GreaterThan');
  static const lessThan = CloudWatchLogsFilterOperator._('LessThan');
  static const greaterThanOrEqual =
      CloudWatchLogsFilterOperator._('GreaterThanOrEqual');
  static const lessThanOrEqual =
      CloudWatchLogsFilterOperator._('LessThanOrEqual');
  static const contains = CloudWatchLogsFilterOperator._('Contains');
  static const notContains = CloudWatchLogsFilterOperator._('NotContains');

  final String value;

  const CloudWatchLogsFilterOperator._(this.value);

  static const values = [
    equals,
    notEquals,
    greaterThan,
    lessThan,
    greaterThanOrEqual,
    lessThanOrEqual,
    contains,
    notContains
  ];

  static CloudWatchLogsFilterOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CloudWatchLogsFilterOperator._(value));

  @override
  bool operator ==(other) =>
      other is CloudWatchLogsFilterOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A value used in filter comparisons, supporting different data types.
///
/// @nodoc
class FilterValue {
  /// A boolean value for true/false filtering conditions.
  final bool? booleanValue;

  /// A numeric value for numerical filtering and comparisons.
  final double? doubleValue;

  /// A string value for text-based filtering.
  final String? stringValue;

  FilterValue({
    this.booleanValue,
    this.doubleValue,
    this.stringValue,
  });

  factory FilterValue.fromJson(Map<String, dynamic> json) {
    return FilterValue(
      booleanValue: json['booleanValue'] as bool?,
      doubleValue: json['doubleValue'] as double?,
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final booleanValue = this.booleanValue;
    final doubleValue = this.doubleValue;
    final stringValue = this.stringValue;
    return {
      if (booleanValue != null) 'booleanValue': booleanValue,
      if (doubleValue != null) 'doubleValue': doubleValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

/// Inline tool description input containing a list of tools.
///
/// @nodoc
class ToolDescriptionTextInput {
  /// The list of tool descriptions to optimize.
  final List<ToolDescriptionInput> tools;

  ToolDescriptionTextInput({
    required this.tools,
  });

  factory ToolDescriptionTextInput.fromJson(Map<String, dynamic> json) {
    return ToolDescriptionTextInput(
      tools: ((json['tools'] as List?) ?? const [])
          .nonNulls
          .map((e) => ToolDescriptionInput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tools = this.tools;
    return {
      'tools': tools,
    };
  }
}

/// Tool descriptions sourced from a configuration bundle version.
///
/// @nodoc
class ToolDescriptionConfigurationBundle {
  /// The Amazon Resource Name (ARN) of the configuration bundle.
  final String bundleArn;

  /// The list of tool entries mapping tool names to their JSON paths within the
  /// bundle.
  final List<ConfigurationBundleToolEntry> tools;

  /// The version identifier of the configuration bundle.
  final String versionId;

  ToolDescriptionConfigurationBundle({
    required this.bundleArn,
    required this.tools,
    required this.versionId,
  });

  factory ToolDescriptionConfigurationBundle.fromJson(
      Map<String, dynamic> json) {
    return ToolDescriptionConfigurationBundle(
      bundleArn: (json['bundleArn'] as String?) ?? '',
      tools: ((json['tools'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              ConfigurationBundleToolEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionId: (json['versionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final bundleArn = this.bundleArn;
    final tools = this.tools;
    final versionId = this.versionId;
    return {
      'bundleArn': bundleArn,
      'tools': tools,
      'versionId': versionId,
    };
  }
}

/// Maps a tool name to its JSON path within a configuration bundle.
///
/// @nodoc
class ConfigurationBundleToolEntry {
  /// The JSON path within the configuration bundle's components that contains the
  /// tool description.
  final String toolDescriptionJsonPath;

  /// The name of the tool.
  final String toolName;

  ConfigurationBundleToolEntry({
    required this.toolDescriptionJsonPath,
    required this.toolName,
  });

  factory ConfigurationBundleToolEntry.fromJson(Map<String, dynamic> json) {
    return ConfigurationBundleToolEntry(
      toolDescriptionJsonPath:
          (json['toolDescriptionJsonPath'] as String?) ?? '',
      toolName: (json['toolName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final toolDescriptionJsonPath = this.toolDescriptionJsonPath;
    final toolName = this.toolName;
    return {
      'toolDescriptionJsonPath': toolDescriptionJsonPath,
      'toolName': toolName,
    };
  }
}

/// A tool description input containing the tool name and its current
/// description.
///
/// @nodoc
class ToolDescriptionInput {
  /// The current description of the tool to optimize.
  final ToolDescriptionConfig toolDescription;

  /// The name of the tool.
  final String toolName;

  ToolDescriptionInput({
    required this.toolDescription,
    required this.toolName,
  });

  factory ToolDescriptionInput.fromJson(Map<String, dynamic> json) {
    return ToolDescriptionInput(
      toolDescription: ToolDescriptionConfig.fromJson(
          (json['toolDescription'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      toolName: (json['toolName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final toolDescription = this.toolDescription;
    final toolName = this.toolName;
    return {
      'toolDescription': toolDescription,
      'toolName': toolName,
    };
  }
}

/// The tool description content.
///
/// @nodoc
class ToolDescriptionConfig {
  /// The tool description as inline text.
  final String? text;

  ToolDescriptionConfig({
    this.text,
  });

  factory ToolDescriptionConfig.fromJson(Map<String, dynamic> json) {
    return ToolDescriptionConfig(
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

/// The system prompt input, either as inline text or from a configuration
/// bundle.
///
/// @nodoc
class SystemPromptConfig {
  /// The system prompt sourced from a configuration bundle version.
  final SystemPromptConfigurationBundle? configurationBundle;

  /// The system prompt text provided inline.
  final String? text;

  SystemPromptConfig({
    this.configurationBundle,
    this.text,
  });

  factory SystemPromptConfig.fromJson(Map<String, dynamic> json) {
    return SystemPromptConfig(
      configurationBundle: json['configurationBundle'] != null
          ? SystemPromptConfigurationBundle.fromJson(
              json['configurationBundle'] as Map<String, dynamic>)
          : null,
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationBundle = this.configurationBundle;
    final text = this.text;
    return {
      if (configurationBundle != null)
        'configurationBundle': configurationBundle,
      if (text != null) 'text': text,
    };
  }
}

/// The evaluation configuration for assessing recommendation quality.
///
/// @nodoc
class RecommendationEvaluationConfig {
  /// The list of evaluators to use for assessing recommendation quality.
  final List<RecommendationEvaluatorReference> evaluators;

  RecommendationEvaluationConfig({
    required this.evaluators,
  });

  factory RecommendationEvaluationConfig.fromJson(Map<String, dynamic> json) {
    return RecommendationEvaluationConfig(
      evaluators: ((json['evaluators'] as List?) ?? const [])
          .nonNulls
          .map((e) => RecommendationEvaluatorReference.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluators = this.evaluators;
    return {
      'evaluators': evaluators,
    };
  }
}

/// A reference to an evaluator used for recommendation assessment.
///
/// @nodoc
class RecommendationEvaluatorReference {
  /// The Amazon Resource Name (ARN) of the evaluator.
  final String evaluatorArn;

  RecommendationEvaluatorReference({
    required this.evaluatorArn,
  });

  factory RecommendationEvaluatorReference.fromJson(Map<String, dynamic> json) {
    return RecommendationEvaluatorReference(
      evaluatorArn: (json['evaluatorArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final evaluatorArn = this.evaluatorArn;
    return {
      'evaluatorArn': evaluatorArn,
    };
  }
}

/// A system prompt sourced from a configuration bundle version.
///
/// @nodoc
class SystemPromptConfigurationBundle {
  /// The Amazon Resource Name (ARN) of the configuration bundle.
  final String bundleArn;

  /// The JSON path within the configuration bundle that contains the system
  /// prompt.
  final String systemPromptJsonPath;

  /// The version identifier of the configuration bundle.
  final String versionId;

  SystemPromptConfigurationBundle({
    required this.bundleArn,
    required this.systemPromptJsonPath,
    required this.versionId,
  });

  factory SystemPromptConfigurationBundle.fromJson(Map<String, dynamic> json) {
    return SystemPromptConfigurationBundle(
      bundleArn: (json['bundleArn'] as String?) ?? '',
      systemPromptJsonPath: (json['systemPromptJsonPath'] as String?) ?? '',
      versionId: (json['versionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final bundleArn = this.bundleArn;
    final systemPromptJsonPath = this.systemPromptJsonPath;
    final versionId = this.versionId;
    return {
      'bundleArn': bundleArn,
      'systemPromptJsonPath': systemPromptJsonPath,
      'versionId': versionId,
    };
  }
}

/// Output destination configuration.
///
/// @nodoc
class OutputConfig {
  /// The CloudWatch Logs configuration for writing evaluation results.
  final CloudWatchOutputConfig? cloudWatchConfig;

  OutputConfig({
    this.cloudWatchConfig,
  });

  factory OutputConfig.fromJson(Map<String, dynamic> json) {
    return OutputConfig(
      cloudWatchConfig: json['cloudWatchConfig'] != null
          ? CloudWatchOutputConfig.fromJson(
              json['cloudWatchConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchConfig = this.cloudWatchConfig;
    return {
      if (cloudWatchConfig != null) 'cloudWatchConfig': cloudWatchConfig,
    };
  }
}

/// CloudWatch Logs destination for batch evaluation results.
///
/// @nodoc
class CloudWatchOutputConfig {
  /// The name of the CloudWatch log group where evaluation results will be
  /// written.
  final String logGroupName;

  /// The name of the CloudWatch log stream where evaluation results will be
  /// written.
  final String logStreamName;

  CloudWatchOutputConfig({
    required this.logGroupName,
    required this.logStreamName,
  });

  factory CloudWatchOutputConfig.fromJson(Map<String, dynamic> json) {
    return CloudWatchOutputConfig(
      logGroupName: (json['logGroupName'] as String?) ?? '',
      logStreamName: (json['logStreamName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupName = this.logGroupName;
    final logStreamName = this.logStreamName;
    return {
      'logGroupName': logGroupName,
      'logStreamName': logStreamName,
    };
  }
}

/// An evaluator to run against sessions.
///
/// @nodoc
class Evaluator {
  /// The unique identifier of the evaluator. Can reference built-in evaluators
  /// (e.g., <code>Builtin.Helpfulness</code>) or custom evaluators.
  final String evaluatorId;

  Evaluator({
    required this.evaluatorId,
  });

  factory Evaluator.fromJson(Map<String, dynamic> json) {
    return Evaluator(
      evaluatorId: (json['evaluatorId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final evaluatorId = this.evaluatorId;
    return {
      'evaluatorId': evaluatorId,
    };
  }
}

/// Configuration for the data source used in evaluation.
///
/// @nodoc
class DataSourceConfig {
  /// Configuration for pulling agent session traces from CloudWatch Logs.
  final CloudWatchLogsSource? cloudWatchLogs;

  DataSourceConfig({
    this.cloudWatchLogs,
  });

  factory DataSourceConfig.fromJson(Map<String, dynamic> json) {
    return DataSourceConfig(
      cloudWatchLogs: json['cloudWatchLogs'] != null
          ? CloudWatchLogsSource.fromJson(
              json['cloudWatchLogs'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogs = this.cloudWatchLogs;
    return {
      if (cloudWatchLogs != null) 'cloudWatchLogs': cloudWatchLogs,
    };
  }
}

/// Metadata for the evaluation, including session-specific ground truth data.
///
/// @nodoc
class EvaluationMetadata {
  /// A list of session metadata entries containing ground truth data and test
  /// scenario identifiers for specific sessions.
  final List<SessionMetadataShape>? sessionMetadata;

  EvaluationMetadata({
    this.sessionMetadata,
  });

  Map<String, dynamic> toJson() {
    final sessionMetadata = this.sessionMetadata;
    return {
      if (sessionMetadata != null) 'sessionMetadata': sessionMetadata,
    };
  }
}

/// Metadata for a specific session in a batch evaluation, including ground
/// truth data and test scenario identifiers.
///
/// @nodoc
class SessionMetadataShape {
  /// The unique identifier of the session this metadata applies to.
  final String sessionId;

  /// The ground truth data for this session, including expected responses and
  /// assertions.
  final GroundTruthSource? groundTruth;

  /// Additional key-value metadata associated with this session.
  final Map<String, String>? metadata;

  /// An optional test scenario identifier for categorizing and tracking
  /// evaluation results.
  final String? testScenarioId;

  SessionMetadataShape({
    required this.sessionId,
    this.groundTruth,
    this.metadata,
    this.testScenarioId,
  });

  Map<String, dynamic> toJson() {
    final sessionId = this.sessionId;
    final groundTruth = this.groundTruth;
    final metadata = this.metadata;
    final testScenarioId = this.testScenarioId;
    return {
      'sessionId': sessionId,
      if (groundTruth != null) 'groundTruth': groundTruth,
      if (metadata != null) 'metadata': metadata,
      if (testScenarioId != null) 'testScenarioId': testScenarioId,
    };
  }
}

/// Where to pull ground truth from.
///
/// @nodoc
class GroundTruthSource {
  /// Inline ground truth data provided directly in the request.
  final InlineGroundTruth? inline;

  GroundTruthSource({
    this.inline,
  });

  Map<String, dynamic> toJson() {
    final inline = this.inline;
    return {
      if (inline != null) 'inline': inline,
    };
  }
}

/// Inline ground truth data containing assertions, expected trajectories, and
/// per-turn expected responses.
///
/// @nodoc
class InlineGroundTruth {
  /// Assertions for evaluation, reuses common model EvaluationContentList.
  final List<EvaluationContent>? assertions;

  /// The expected tool call sequence for trajectory evaluation.
  final EvaluationExpectedTrajectory? expectedTrajectory;

  /// A list of per-turn ground truth data, each containing an input prompt and
  /// expected response.
  final List<GroundTruthTurn>? turns;

  InlineGroundTruth({
    this.assertions,
    this.expectedTrajectory,
    this.turns,
  });

  Map<String, dynamic> toJson() {
    final assertions = this.assertions;
    final expectedTrajectory = this.expectedTrajectory;
    final turns = this.turns;
    return {
      if (assertions != null) 'assertions': assertions,
      if (expectedTrajectory != null) 'expectedTrajectory': expectedTrajectory,
      if (turns != null) 'turns': turns,
    };
  }
}

/// The expected tool call trajectory for trajectory-based evaluation.
///
/// @nodoc
class EvaluationExpectedTrajectory {
  /// The list of tool names representing the expected tool call sequence.
  final List<String>? toolNames;

  EvaluationExpectedTrajectory({
    this.toolNames,
  });

  Map<String, dynamic> toJson() {
    final toolNames = this.toolNames;
    return {
      if (toolNames != null) 'toolNames': toolNames,
    };
  }
}

/// Ground truth data for a single conversation turn.
///
/// @nodoc
class GroundTruthTurn {
  /// The expected response for this conversation turn.
  final EvaluationContent? expectedResponse;

  /// The input for this conversation turn.
  final GroundTruthTurnInput? input;

  GroundTruthTurn({
    this.expectedResponse,
    this.input,
  });

  Map<String, dynamic> toJson() {
    final expectedResponse = this.expectedResponse;
    final input = this.input;
    return {
      if (expectedResponse != null) 'expectedResponse': expectedResponse,
      if (input != null) 'input': input,
    };
  }
}

/// The input for a ground truth conversation turn.
///
/// @nodoc
class GroundTruthTurnInput {
  /// The text prompt for this conversation turn.
  final String? prompt;

  GroundTruthTurnInput({
    this.prompt,
  });

  Map<String, dynamic> toJson() {
    final prompt = this.prompt;
    return {
      if (prompt != null) 'prompt': prompt,
    };
  }
}

/// A content block for ground truth data in evaluation reference inputs.
/// Supports text content for expected responses and assertions.
///
/// @nodoc
class EvaluationContent {
  /// The text content of the ground truth data. Used for expected response text
  /// and assertion statements.
  final String? text;

  EvaluationContent({
    this.text,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      if (text != null) 'text': text,
    };
  }
}

/// The configuration for reading agent traces from CloudWatch Logs.
///
/// @nodoc
class CloudWatchLogsSource {
  /// The list of CloudWatch log group names to read agent traces from. Maximum of
  /// 5 log groups.
  final List<String> logGroupNames;

  /// The list of agent service names to filter traces within the specified log
  /// groups.
  final List<String> serviceNames;

  /// Optional filter configuration to narrow down which sessions to evaluate.
  final CloudWatchFilterConfig? filterConfig;

  CloudWatchLogsSource({
    required this.logGroupNames,
    required this.serviceNames,
    this.filterConfig,
  });

  factory CloudWatchLogsSource.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogsSource(
      logGroupNames: ((json['logGroupNames'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      serviceNames: ((json['serviceNames'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      filterConfig: json['filterConfig'] != null
          ? CloudWatchFilterConfig.fromJson(
              json['filterConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupNames = this.logGroupNames;
    final serviceNames = this.serviceNames;
    final filterConfig = this.filterConfig;
    return {
      'logGroupNames': logGroupNames,
      'serviceNames': serviceNames,
      if (filterConfig != null) 'filterConfig': filterConfig,
    };
  }
}

/// Filter configuration for narrowing down CloudWatch Logs sessions for
/// evaluation.
///
/// @nodoc
class CloudWatchFilterConfig {
  /// A list of specific session IDs to evaluate. If specified, only these
  /// sessions are included in the evaluation.
  final List<String>? sessionIds;

  /// The time range filter for selecting sessions to evaluate.
  final SessionFilterConfig? timeRange;

  CloudWatchFilterConfig({
    this.sessionIds,
    this.timeRange,
  });

  factory CloudWatchFilterConfig.fromJson(Map<String, dynamic> json) {
    return CloudWatchFilterConfig(
      sessionIds: (json['sessionIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      timeRange: json['timeRange'] != null
          ? SessionFilterConfig.fromJson(
              json['timeRange'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionIds = this.sessionIds;
    final timeRange = this.timeRange;
    return {
      if (sessionIds != null) 'sessionIds': sessionIds,
      if (timeRange != null) 'timeRange': timeRange,
    };
  }
}

/// A time range filter for selecting sessions. Specifies the start and end
/// times to narrow down which sessions are included.
///
/// @nodoc
class SessionFilterConfig {
  /// The end time of the time range. Only sessions with activity before this
  /// timestamp are included.
  final DateTime? endTime;

  /// The start time of the time range. Only sessions with activity at or after
  /// this timestamp are included.
  final DateTime? startTime;

  SessionFilterConfig({
    this.endTime,
    this.startTime,
  });

  factory SessionFilterConfig.fromJson(Map<String, dynamic> json) {
    return SessionFilterConfig(
      endTime: timeStampFromJson(json['endTime']),
      startTime: timeStampFromJson(json['startTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
    };
  }
}

/// Summary information about a recommendation.
///
/// @nodoc
class RecommendationSummary {
  /// The timestamp when the recommendation was created.
  final DateTime createdAt;

  /// The name of the recommendation.
  final String name;

  /// The Amazon Resource Name (ARN) of the recommendation.
  final String recommendationArn;

  /// The unique identifier of the recommendation.
  final String recommendationId;

  /// The current status of the recommendation.
  final RecommendationStatus status;

  /// The type of recommendation.
  final RecommendationType type;

  /// The timestamp when the recommendation was last updated.
  final DateTime updatedAt;

  /// The description of the recommendation.
  final String? description;

  RecommendationSummary({
    required this.createdAt,
    required this.name,
    required this.recommendationArn,
    required this.recommendationId,
    required this.status,
    required this.type,
    required this.updatedAt,
    this.description,
  });

  factory RecommendationSummary.fromJson(Map<String, dynamic> json) {
    return RecommendationSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      recommendationArn: (json['recommendationArn'] as String?) ?? '',
      recommendationId: (json['recommendationId'] as String?) ?? '',
      status:
          RecommendationStatus.fromString((json['status'] as String?) ?? ''),
      type: RecommendationType.fromString((json['type'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final name = this.name;
    final recommendationArn = this.recommendationArn;
    final recommendationId = this.recommendationId;
    final status = this.status;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final description = this.description;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'recommendationArn': recommendationArn,
      'recommendationId': recommendationId,
      'status': status.value,
      'type': type.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
    };
  }
}

/// Summary representation for list responses.
///
/// @nodoc
class BatchEvaluationSummary {
  /// The Amazon Resource Name (ARN) of the batch evaluation.
  final String batchEvaluationArn;

  /// The unique identifier of the batch evaluation.
  final String batchEvaluationId;

  /// The name of the batch evaluation.
  final String batchEvaluationName;

  /// The timestamp when the batch evaluation was created.
  final DateTime createdAt;

  /// The current status of the batch evaluation.
  final BatchEvaluationStatus status;

  /// The description of the batch evaluation.
  final String? description;

  /// The error details if the batch evaluation encountered failures.
  final List<String>? errorDetails;

  /// The aggregated evaluation results.
  final EvaluationJobResults? evaluationResults;

  /// The list of evaluators applied during the batch evaluation.
  final List<Evaluator>? evaluators;

  /// The timestamp when the batch evaluation was last updated.
  final DateTime? updatedAt;

  BatchEvaluationSummary({
    required this.batchEvaluationArn,
    required this.batchEvaluationId,
    required this.batchEvaluationName,
    required this.createdAt,
    required this.status,
    this.description,
    this.errorDetails,
    this.evaluationResults,
    this.evaluators,
    this.updatedAt,
  });

  factory BatchEvaluationSummary.fromJson(Map<String, dynamic> json) {
    return BatchEvaluationSummary(
      batchEvaluationArn: (json['batchEvaluationArn'] as String?) ?? '',
      batchEvaluationId: (json['batchEvaluationId'] as String?) ?? '',
      batchEvaluationName: (json['batchEvaluationName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      status:
          BatchEvaluationStatus.fromString((json['status'] as String?) ?? ''),
      description: json['description'] as String?,
      errorDetails: (json['errorDetails'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      evaluationResults: json['evaluationResults'] != null
          ? EvaluationJobResults.fromJson(
              json['evaluationResults'] as Map<String, dynamic>)
          : null,
      evaluators: (json['evaluators'] as List?)
          ?.nonNulls
          .map((e) => Evaluator.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final batchEvaluationArn = this.batchEvaluationArn;
    final batchEvaluationId = this.batchEvaluationId;
    final batchEvaluationName = this.batchEvaluationName;
    final createdAt = this.createdAt;
    final status = this.status;
    final description = this.description;
    final errorDetails = this.errorDetails;
    final evaluationResults = this.evaluationResults;
    final evaluators = this.evaluators;
    final updatedAt = this.updatedAt;
    return {
      'batchEvaluationArn': batchEvaluationArn,
      'batchEvaluationId': batchEvaluationId,
      'batchEvaluationName': batchEvaluationName,
      'createdAt': iso8601ToJson(createdAt),
      'status': status.value,
      if (description != null) 'description': description,
      if (errorDetails != null) 'errorDetails': errorDetails,
      if (evaluationResults != null) 'evaluationResults': evaluationResults,
      if (evaluators != null) 'evaluators': evaluators,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Aggregated results from a batch evaluation, including session completion
/// counts and evaluator score summaries.
///
/// @nodoc
class EvaluationJobResults {
  /// A list of per-evaluator summary statistics.
  final List<EvaluatorSummary>? evaluatorSummaries;

  /// The number of sessions that have been successfully evaluated.
  final int? numberOfSessionsCompleted;

  /// The number of sessions that failed evaluation.
  final int? numberOfSessionsFailed;

  /// The number of sessions that were ignored during evaluation.
  final int? numberOfSessionsIgnored;

  /// The number of sessions currently being evaluated.
  final int? numberOfSessionsInProgress;

  /// The total number of sessions included in the batch evaluation.
  final int? totalNumberOfSessions;

  EvaluationJobResults({
    this.evaluatorSummaries,
    this.numberOfSessionsCompleted,
    this.numberOfSessionsFailed,
    this.numberOfSessionsIgnored,
    this.numberOfSessionsInProgress,
    this.totalNumberOfSessions,
  });

  factory EvaluationJobResults.fromJson(Map<String, dynamic> json) {
    return EvaluationJobResults(
      evaluatorSummaries: (json['evaluatorSummaries'] as List?)
          ?.nonNulls
          .map((e) => EvaluatorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberOfSessionsCompleted: json['numberOfSessionsCompleted'] as int?,
      numberOfSessionsFailed: json['numberOfSessionsFailed'] as int?,
      numberOfSessionsIgnored: json['numberOfSessionsIgnored'] as int?,
      numberOfSessionsInProgress: json['numberOfSessionsInProgress'] as int?,
      totalNumberOfSessions: json['totalNumberOfSessions'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final evaluatorSummaries = this.evaluatorSummaries;
    final numberOfSessionsCompleted = this.numberOfSessionsCompleted;
    final numberOfSessionsFailed = this.numberOfSessionsFailed;
    final numberOfSessionsIgnored = this.numberOfSessionsIgnored;
    final numberOfSessionsInProgress = this.numberOfSessionsInProgress;
    final totalNumberOfSessions = this.totalNumberOfSessions;
    return {
      if (evaluatorSummaries != null) 'evaluatorSummaries': evaluatorSummaries,
      if (numberOfSessionsCompleted != null)
        'numberOfSessionsCompleted': numberOfSessionsCompleted,
      if (numberOfSessionsFailed != null)
        'numberOfSessionsFailed': numberOfSessionsFailed,
      if (numberOfSessionsIgnored != null)
        'numberOfSessionsIgnored': numberOfSessionsIgnored,
      if (numberOfSessionsInProgress != null)
        'numberOfSessionsInProgress': numberOfSessionsInProgress,
      if (totalNumberOfSessions != null)
        'totalNumberOfSessions': totalNumberOfSessions,
    };
  }
}

/// Summary statistics for a single evaluator within a batch evaluation.
///
/// @nodoc
class EvaluatorSummary {
  /// The unique identifier of the evaluator.
  final String? evaluatorId;

  /// The aggregated statistics for this evaluator.
  final EvaluatorStatistics? statistics;

  /// The total number of sessions evaluated by this evaluator.
  final int? totalEvaluated;

  /// The total number of sessions that failed evaluation by this evaluator.
  final int? totalFailed;

  EvaluatorSummary({
    this.evaluatorId,
    this.statistics,
    this.totalEvaluated,
    this.totalFailed,
  });

  factory EvaluatorSummary.fromJson(Map<String, dynamic> json) {
    return EvaluatorSummary(
      evaluatorId: json['evaluatorId'] as String?,
      statistics: json['statistics'] != null
          ? EvaluatorStatistics.fromJson(
              json['statistics'] as Map<String, dynamic>)
          : null,
      totalEvaluated: json['totalEvaluated'] as int?,
      totalFailed: json['totalFailed'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final evaluatorId = this.evaluatorId;
    final statistics = this.statistics;
    final totalEvaluated = this.totalEvaluated;
    final totalFailed = this.totalFailed;
    return {
      if (evaluatorId != null) 'evaluatorId': evaluatorId,
      if (statistics != null) 'statistics': statistics,
      if (totalEvaluated != null) 'totalEvaluated': totalEvaluated,
      if (totalFailed != null) 'totalFailed': totalFailed,
    };
  }
}

/// Aggregated statistics for an evaluator.
///
/// @nodoc
class EvaluatorStatistics {
  /// The average score across all evaluated sessions for this evaluator.
  final double? averageScore;

  EvaluatorStatistics({
    this.averageScore,
  });

  factory EvaluatorStatistics.fromJson(Map<String, dynamic> json) {
    return EvaluatorStatistics(
      averageScore: json['averageScore'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final averageScore = this.averageScore;
    return {
      if (averageScore != null) 'averageScore': averageScore,
    };
  }
}

/// Summary information about an A/B test.
///
/// @nodoc
class ABTestSummary {
  /// The Amazon Resource Name (ARN) of the A/B test.
  final String abTestArn;

  /// The unique identifier of the A/B test.
  final String abTestId;

  /// The timestamp when the A/B test was created.
  final DateTime createdAt;

  /// The execution status of the A/B test.
  final ABTestExecutionStatus executionStatus;

  /// The name of the A/B test.
  final String name;

  /// The current status of the A/B test.
  final ABTestStatus status;

  /// The timestamp when the A/B test was last updated.
  final DateTime updatedAt;

  /// The description of the A/B test.
  final String? description;

  /// The Amazon Resource Name (ARN) of the gateway used for traffic splitting.
  final String? gatewayArn;

  ABTestSummary({
    required this.abTestArn,
    required this.abTestId,
    required this.createdAt,
    required this.executionStatus,
    required this.name,
    required this.status,
    required this.updatedAt,
    this.description,
    this.gatewayArn,
  });

  factory ABTestSummary.fromJson(Map<String, dynamic> json) {
    return ABTestSummary(
      abTestArn: (json['abTestArn'] as String?) ?? '',
      abTestId: (json['abTestId'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      executionStatus: ABTestExecutionStatus.fromString(
          (json['executionStatus'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      status: ABTestStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      gatewayArn: json['gatewayArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final abTestArn = this.abTestArn;
    final abTestId = this.abTestId;
    final createdAt = this.createdAt;
    final executionStatus = this.executionStatus;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final gatewayArn = this.gatewayArn;
    return {
      'abTestArn': abTestArn,
      'abTestId': abTestId,
      'createdAt': unixTimestampToJson(createdAt),
      'executionStatus': executionStatus.value,
      'name': name,
      'status': status.value,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (description != null) 'description': description,
      if (gatewayArn != null) 'gatewayArn': gatewayArn,
    };
  }
}

/// The result of a recommendation, containing the optimized output.
///
/// @nodoc
class RecommendationResult {
  /// The result of a system prompt recommendation.
  final SystemPromptRecommendationResult? systemPromptRecommendationResult;

  /// The result of a tool description recommendation.
  final ToolDescriptionRecommendationResult?
      toolDescriptionRecommendationResult;

  RecommendationResult({
    this.systemPromptRecommendationResult,
    this.toolDescriptionRecommendationResult,
  });

  factory RecommendationResult.fromJson(Map<String, dynamic> json) {
    return RecommendationResult(
      systemPromptRecommendationResult:
          json['systemPromptRecommendationResult'] != null
              ? SystemPromptRecommendationResult.fromJson(
                  json['systemPromptRecommendationResult']
                      as Map<String, dynamic>)
              : null,
      toolDescriptionRecommendationResult:
          json['toolDescriptionRecommendationResult'] != null
              ? ToolDescriptionRecommendationResult.fromJson(
                  json['toolDescriptionRecommendationResult']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final systemPromptRecommendationResult =
        this.systemPromptRecommendationResult;
    final toolDescriptionRecommendationResult =
        this.toolDescriptionRecommendationResult;
    return {
      if (systemPromptRecommendationResult != null)
        'systemPromptRecommendationResult': systemPromptRecommendationResult,
      if (toolDescriptionRecommendationResult != null)
        'toolDescriptionRecommendationResult':
            toolDescriptionRecommendationResult,
    };
  }
}

/// The result of a system prompt recommendation, containing the optimized
/// prompt.
///
/// @nodoc
class SystemPromptRecommendationResult {
  /// The configuration bundle containing the recommended system prompt, if the
  /// input was sourced from a configuration bundle.
  final RecommendationResultConfigurationBundle? configurationBundle;

  /// The error code if the recommendation failed.
  final String? errorCode;

  /// The error message if the recommendation failed.
  final String? errorMessage;

  /// The optimized system prompt text generated by the recommendation.
  final String? recommendedSystemPrompt;

  SystemPromptRecommendationResult({
    this.configurationBundle,
    this.errorCode,
    this.errorMessage,
    this.recommendedSystemPrompt,
  });

  factory SystemPromptRecommendationResult.fromJson(Map<String, dynamic> json) {
    return SystemPromptRecommendationResult(
      configurationBundle: json['configurationBundle'] != null
          ? RecommendationResultConfigurationBundle.fromJson(
              json['configurationBundle'] as Map<String, dynamic>)
          : null,
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      recommendedSystemPrompt: json['recommendedSystemPrompt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationBundle = this.configurationBundle;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final recommendedSystemPrompt = this.recommendedSystemPrompt;
    return {
      if (configurationBundle != null)
        'configurationBundle': configurationBundle,
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (recommendedSystemPrompt != null)
        'recommendedSystemPrompt': recommendedSystemPrompt,
    };
  }
}

/// The result of a tool description recommendation, containing optimized
/// descriptions.
///
/// @nodoc
class ToolDescriptionRecommendationResult {
  /// The configuration bundle containing the recommended tool descriptions, if
  /// the input was sourced from a configuration bundle.
  final RecommendationResultConfigurationBundle? configurationBundle;

  /// The error code if the recommendation failed.
  final String? errorCode;

  /// The error message if the recommendation failed.
  final String? errorMessage;

  /// The list of tools with their recommended descriptions.
  final List<ToolDescriptionOutput>? tools;

  ToolDescriptionRecommendationResult({
    this.configurationBundle,
    this.errorCode,
    this.errorMessage,
    this.tools,
  });

  factory ToolDescriptionRecommendationResult.fromJson(
      Map<String, dynamic> json) {
    return ToolDescriptionRecommendationResult(
      configurationBundle: json['configurationBundle'] != null
          ? RecommendationResultConfigurationBundle.fromJson(
              json['configurationBundle'] as Map<String, dynamic>)
          : null,
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      tools: (json['tools'] as List?)
          ?.nonNulls
          .map((e) => ToolDescriptionOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final configurationBundle = this.configurationBundle;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final tools = this.tools;
    return {
      if (configurationBundle != null)
        'configurationBundle': configurationBundle,
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (tools != null) 'tools': tools,
    };
  }
}

/// A configuration bundle reference in a recommendation result.
///
/// @nodoc
class RecommendationResultConfigurationBundle {
  /// The Amazon Resource Name (ARN) of the configuration bundle.
  final String bundleArn;

  /// The version identifier of the configuration bundle containing the
  /// recommendation.
  final String versionId;

  RecommendationResultConfigurationBundle({
    required this.bundleArn,
    required this.versionId,
  });

  factory RecommendationResultConfigurationBundle.fromJson(
      Map<String, dynamic> json) {
    return RecommendationResultConfigurationBundle(
      bundleArn: (json['bundleArn'] as String?) ?? '',
      versionId: (json['versionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final bundleArn = this.bundleArn;
    final versionId = this.versionId;
    return {
      'bundleArn': bundleArn,
      'versionId': versionId,
    };
  }
}

/// The output for a single tool description recommendation.
///
/// @nodoc
class ToolDescriptionOutput {
  /// The name of the tool.
  final String toolName;

  /// The optimized tool description text generated by the recommendation.
  final String? recommendedToolDescription;

  ToolDescriptionOutput({
    required this.toolName,
    this.recommendedToolDescription,
  });

  factory ToolDescriptionOutput.fromJson(Map<String, dynamic> json) {
    return ToolDescriptionOutput(
      toolName: (json['toolName'] as String?) ?? '',
      recommendedToolDescription: json['recommendedToolDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final toolName = this.toolName;
    final recommendedToolDescription = this.recommendedToolDescription;
    return {
      'toolName': toolName,
      if (recommendedToolDescription != null)
        'recommendedToolDescription': recommendedToolDescription,
    };
  }
}

/// The statistical results of an A/B test.
///
/// @nodoc
class ABTestResults {
  /// The per-evaluator metrics comparing control and treatment variants.
  final List<EvaluatorMetric> evaluatorMetrics;

  /// The timestamp when the analysis was performed.
  final DateTime? analysisTimestamp;

  ABTestResults({
    required this.evaluatorMetrics,
    this.analysisTimestamp,
  });

  factory ABTestResults.fromJson(Map<String, dynamic> json) {
    return ABTestResults(
      evaluatorMetrics: ((json['evaluatorMetrics'] as List?) ?? const [])
          .nonNulls
          .map((e) => EvaluatorMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      analysisTimestamp: timeStampFromJson(json['analysisTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluatorMetrics = this.evaluatorMetrics;
    final analysisTimestamp = this.analysisTimestamp;
    return {
      'evaluatorMetrics': evaluatorMetrics,
      if (analysisTimestamp != null)
        'analysisTimestamp': unixTimestampToJson(analysisTimestamp),
    };
  }
}

/// Statistical metrics for a single evaluator comparing control and treatment
/// variants.
///
/// @nodoc
class EvaluatorMetric {
  /// The statistics for the control variant.
  final ControlStats controlStats;

  /// The Amazon Resource Name (ARN) of the evaluator.
  final String evaluatorArn;

  /// The results for each treatment variant compared against the control.
  final List<VariantResult> variantResults;

  EvaluatorMetric({
    required this.controlStats,
    required this.evaluatorArn,
    required this.variantResults,
  });

  factory EvaluatorMetric.fromJson(Map<String, dynamic> json) {
    return EvaluatorMetric(
      controlStats: ControlStats.fromJson(
          (json['controlStats'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      evaluatorArn: (json['evaluatorArn'] as String?) ?? '',
      variantResults: ((json['variantResults'] as List?) ?? const [])
          .nonNulls
          .map((e) => VariantResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final controlStats = this.controlStats;
    final evaluatorArn = this.evaluatorArn;
    final variantResults = this.variantResults;
    return {
      'controlStats': controlStats,
      'evaluatorArn': evaluatorArn,
      'variantResults': variantResults,
    };
  }
}

/// Statistics for the control variant in an A/B test.
///
/// @nodoc
class ControlStats {
  /// The mean evaluation score for the control variant.
  final double mean;

  /// The number of sessions evaluated for the control variant.
  final int sampleSize;

  /// The name of the control variant.
  final String variantName;

  ControlStats({
    required this.mean,
    required this.sampleSize,
    required this.variantName,
  });

  factory ControlStats.fromJson(Map<String, dynamic> json) {
    return ControlStats(
      mean: (json['mean'] as double?) ?? 0,
      sampleSize: (json['sampleSize'] as int?) ?? 0,
      variantName: (json['variantName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final mean = this.mean;
    final sampleSize = this.sampleSize;
    final variantName = this.variantName;
    return {
      'mean': mean,
      'sampleSize': sampleSize,
      'variantName': variantName,
    };
  }
}

/// Statistical results for a treatment variant compared against the control.
///
/// @nodoc
class VariantResult {
  /// Whether the observed difference is statistically significant.
  final bool isSignificant;

  /// The mean evaluation score for this variant.
  final double mean;

  /// The number of sessions evaluated for this variant.
  final int sampleSize;

  /// The name of the treatment variant.
  final String variantName;

  /// The absolute change in mean score compared to the control variant.
  final double? absoluteChange;

  /// The confidence interval for the observed difference.
  final ConfidenceInterval? confidenceInterval;

  /// The p-value indicating the statistical significance of the observed
  /// difference.
  final double? pValue;

  /// The percentage change in mean score compared to the control variant.
  final double? percentChange;

  VariantResult({
    required this.isSignificant,
    required this.mean,
    required this.sampleSize,
    required this.variantName,
    this.absoluteChange,
    this.confidenceInterval,
    this.pValue,
    this.percentChange,
  });

  factory VariantResult.fromJson(Map<String, dynamic> json) {
    return VariantResult(
      isSignificant: (json['isSignificant'] as bool?) ?? false,
      mean: (json['mean'] as double?) ?? 0,
      sampleSize: (json['sampleSize'] as int?) ?? 0,
      variantName: (json['variantName'] as String?) ?? '',
      absoluteChange: json['absoluteChange'] as double?,
      confidenceInterval: json['confidenceInterval'] != null
          ? ConfidenceInterval.fromJson(
              json['confidenceInterval'] as Map<String, dynamic>)
          : null,
      pValue: json['pValue'] as double?,
      percentChange: json['percentChange'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final isSignificant = this.isSignificant;
    final mean = this.mean;
    final sampleSize = this.sampleSize;
    final variantName = this.variantName;
    final absoluteChange = this.absoluteChange;
    final confidenceInterval = this.confidenceInterval;
    final pValue = this.pValue;
    final percentChange = this.percentChange;
    return {
      'isSignificant': isSignificant,
      'mean': mean,
      'sampleSize': sampleSize,
      'variantName': variantName,
      if (absoluteChange != null) 'absoluteChange': absoluteChange,
      if (confidenceInterval != null) 'confidenceInterval': confidenceInterval,
      if (pValue != null) 'pValue': pValue,
      if (percentChange != null) 'percentChange': percentChange,
    };
  }
}

/// A confidence interval for a statistical measurement.
///
/// @nodoc
class ConfidenceInterval {
  /// The lower bound of the confidence interval.
  final double? lower;

  /// The upper bound of the confidence interval.
  final double? upper;

  ConfidenceInterval({
    this.lower,
    this.upper,
  });

  factory ConfidenceInterval.fromJson(Map<String, dynamic> json) {
    return ConfidenceInterval(
      lower: json['lower'] as double?,
      upper: json['upper'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final lower = this.lower;
    final upper = this.upper;
    return {
      if (lower != null) 'lower': lower,
      if (upper != null) 'upper': upper,
    };
  }
}

/// The comprehensive result of an evaluation containing the score, explanation,
/// evaluator metadata, and execution details. Provides both quantitative
/// ratings and qualitative insights about agent performance.
///
/// @nodoc
class EvaluationResultContent {
  /// The contextual information associated with this evaluation result, including
  /// span context details that identify the specific traces and sessions that
  /// were evaluated.
  final Context context;

  /// The Amazon Resource Name (ARN) of the evaluator used to generate this
  /// result. For custom evaluators, this is the full ARN; for built-in
  /// evaluators, this follows the pattern <code>Builtin.{EvaluatorName}</code>.
  final String evaluatorArn;

  /// The unique identifier of the evaluator that produced this result. This
  /// matches the <code>evaluatorId</code> provided in the evaluation request and
  /// can be used to identify which evaluator generated specific results.
  final String evaluatorId;

  /// The human-readable name of the evaluator used for this evaluation. For
  /// built-in evaluators, this is the descriptive name (e.g., "Helpfulness",
  /// "Correctness"); for custom evaluators, this is the user-defined name.
  final String evaluatorName;

  /// The error code indicating the type of failure that occurred during
  /// evaluation. Used to programmatically identify and handle different
  /// categories of evaluation errors.
  final String? errorCode;

  /// The error message describing what went wrong if the evaluation failed.
  /// Provides detailed information about evaluation failures to help diagnose and
  /// resolve issues with evaluator configuration or input data.
  final String? errorMessage;

  /// The detailed explanation provided by the evaluator describing the reasoning
  /// behind the assigned score. This qualitative feedback helps understand why
  /// specific ratings were given and provides actionable insights for
  /// improvement.
  final String? explanation;

  /// The list of reference input field names that were provided but not used by
  /// the evaluator. Helps identify which ground truth data was not consumed
  /// during evaluation.
  final List<String>? ignoredReferenceInputFields;

  /// The categorical label assigned by the evaluator when using a categorical
  /// rating scale. This provides a human-readable description of the evaluation
  /// result (e.g., "Excellent", "Good", "Poor") corresponding to the numerical
  /// value. For numerical scales, this field is optional and provides a natural
  /// language explanation of what the value means (e.g., value 0.5 = "Somewhat
  /// Helpful").
  final String? label;

  /// The token consumption statistics for this evaluation, including input
  /// tokens, output tokens, and total tokens used by the underlying language
  /// model during the evaluation process.
  final TokenUsage? tokenUsage;

  /// The numerical score assigned by the evaluator according to its configured
  /// rating scale. For numerical scales, this is a decimal value within the
  /// defined range. This field is not allowed for categorical scales.
  final double? value;

  EvaluationResultContent({
    required this.context,
    required this.evaluatorArn,
    required this.evaluatorId,
    required this.evaluatorName,
    this.errorCode,
    this.errorMessage,
    this.explanation,
    this.ignoredReferenceInputFields,
    this.label,
    this.tokenUsage,
    this.value,
  });

  factory EvaluationResultContent.fromJson(Map<String, dynamic> json) {
    return EvaluationResultContent(
      context: Context.fromJson((json['context'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      evaluatorArn: (json['evaluatorArn'] as String?) ?? '',
      evaluatorId: (json['evaluatorId'] as String?) ?? '',
      evaluatorName: (json['evaluatorName'] as String?) ?? '',
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      explanation: json['explanation'] as String?,
      ignoredReferenceInputFields:
          (json['ignoredReferenceInputFields'] as List?)
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
      label: json['label'] as String?,
      tokenUsage: json['tokenUsage'] != null
          ? TokenUsage.fromJson(json['tokenUsage'] as Map<String, dynamic>)
          : null,
      value: json['value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final context = this.context;
    final evaluatorArn = this.evaluatorArn;
    final evaluatorId = this.evaluatorId;
    final evaluatorName = this.evaluatorName;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final explanation = this.explanation;
    final ignoredReferenceInputFields = this.ignoredReferenceInputFields;
    final label = this.label;
    final tokenUsage = this.tokenUsage;
    final value = this.value;
    return {
      'context': context,
      'evaluatorArn': evaluatorArn,
      'evaluatorId': evaluatorId,
      'evaluatorName': evaluatorName,
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (explanation != null) 'explanation': explanation,
      if (ignoredReferenceInputFields != null)
        'ignoredReferenceInputFields': ignoredReferenceInputFields,
      if (label != null) 'label': label,
      if (tokenUsage != null) 'tokenUsage': tokenUsage,
      if (value != null) 'value': value,
    };
  }
}

/// The contextual information associated with an evaluation, including span
/// context details that identify the specific traces and sessions being
/// evaluated within the agent's execution flow.
///
/// @nodoc
class Context {
  /// The span context information that uniquely identifies the trace and span
  /// being evaluated, including session ID, trace ID, and span ID for precise
  /// targeting within the agent's execution flow.
  final SpanContext? spanContext;

  Context({
    this.spanContext,
  });

  factory Context.fromJson(Map<String, dynamic> json) {
    return Context(
      spanContext: json['spanContext'] != null
          ? SpanContext.fromJson(json['spanContext'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final spanContext = this.spanContext;
    return {
      if (spanContext != null) 'spanContext': spanContext,
    };
  }
}

/// The token consumption statistics for language model operations during
/// evaluation. Provides detailed breakdown of input, output, and total tokens
/// used for cost tracking and performance monitoring.
///
/// @nodoc
class TokenUsage {
  /// The number of tokens consumed for input processing during the evaluation.
  /// Includes tokens from the evaluation prompt, agent traces, and any additional
  /// context provided to the evaluator model.
  final int? inputTokens;

  /// The number of tokens generated by the evaluator model in its response.
  /// Includes tokens for the score, explanation, and any additional output
  /// produced during the evaluation process.
  final int? outputTokens;

  /// The total number of tokens consumed during the evaluation, calculated as the
  /// sum of input and output tokens. Used for cost calculation and rate limiting
  /// within the service limits.
  final int? totalTokens;

  TokenUsage({
    this.inputTokens,
    this.outputTokens,
    this.totalTokens,
  });

  factory TokenUsage.fromJson(Map<String, dynamic> json) {
    return TokenUsage(
      inputTokens: json['inputTokens'] as int?,
      outputTokens: json['outputTokens'] as int?,
      totalTokens: json['totalTokens'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputTokens = this.inputTokens;
    final outputTokens = this.outputTokens;
    final totalTokens = this.totalTokens;
    return {
      if (inputTokens != null) 'inputTokens': inputTokens,
      if (outputTokens != null) 'outputTokens': outputTokens,
      if (totalTokens != null) 'totalTokens': totalTokens,
    };
  }
}

/// The contextual information that uniquely identifies a span within the
/// distributed tracing system. Contains session, trace, and span identifiers
/// used to correlate evaluation results with specific agent execution points.
///
/// @nodoc
class SpanContext {
  /// The unique identifier of the session containing this span. Sessions
  /// represent complete conversation flows and are detected using configurable
  /// <code>SessionTimeoutMinutes</code> (default 15 minutes).
  final String sessionId;

  /// The unique identifier of the specific span being referenced. Spans represent
  /// individual operations like tool calls, model invocations, or other discrete
  /// actions within the agent's execution.
  final String? spanId;

  /// The unique identifier of the trace containing this span. Traces represent
  /// individual request-response interactions within a session and group related
  /// spans together.
  final String? traceId;

  SpanContext({
    required this.sessionId,
    this.spanId,
    this.traceId,
  });

  factory SpanContext.fromJson(Map<String, dynamic> json) {
    return SpanContext(
      sessionId: (json['sessionId'] as String?) ?? '',
      spanId: json['spanId'] as String?,
      traceId: json['traceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionId = this.sessionId;
    final spanId = this.spanId;
    final traceId = this.traceId;
    return {
      'sessionId': sessionId,
      if (spanId != null) 'spanId': spanId,
      if (traceId != null) 'traceId': traceId,
    };
  }
}

/// The input data structure containing agent session spans in OpenTelemetry
/// format. Supports traces from frameworks like Strands (AgentCore Runtime) and
/// LangGraph with OpenInference instrumentation for comprehensive evaluation.
///
/// @nodoc
class EvaluationInput {
  /// The collection of spans representing agent execution traces within a
  /// session. Each span contains detailed information about tool calls, model
  /// interactions, and other agent activities that can be evaluated for quality
  /// and performance.
  final List<Object>? sessionSpans;

  EvaluationInput({
    this.sessionSpans,
  });

  Map<String, dynamic> toJson() {
    final sessionSpans = this.sessionSpans;
    return {
      if (sessionSpans != null) 'sessionSpans': sessionSpans,
    };
  }
}

/// The specification of which trace or span IDs to evaluate within the provided
/// input data. Allows precise targeting of evaluation at different levels: tool
/// calls, traces, or sessions.
///
/// @nodoc
class EvaluationTarget {
  /// The list of specific span IDs to evaluate within the provided traces. Used
  /// to target evaluation at individual tool calls or specific operations within
  /// the agent's execution flow.
  final List<String>? spanIds;

  /// The list of trace IDs to evaluate, representing complete request-response
  /// interactions. Used to evaluate entire conversation turns or specific agent
  /// interactions within a session.
  final List<String>? traceIds;

  EvaluationTarget({
    this.spanIds,
    this.traceIds,
  });

  Map<String, dynamic> toJson() {
    final spanIds = this.spanIds;
    final traceIds = this.traceIds;
    return {
      if (spanIds != null) 'spanIds': spanIds,
      if (traceIds != null) 'traceIds': traceIds,
    };
  }
}

/// A reference input containing ground truth data for evaluation, scoped to a
/// specific context level (session or trace) through its span context.
///
/// @nodoc
class EvaluationReferenceInput {
  /// The span context that identifies which session or trace this reference input
  /// applies to, used for correlating ground truth with agent output.
  final Context context;

  /// A list of assertion statements for session-level evaluation. Each assertion
  /// describes an expected behavior or outcome the agent should demonstrate
  /// during the session.
  final List<EvaluationContent>? assertions;

  /// The expected response for trace-level evaluation. Built-in evaluators that
  /// support this field compare the agent's actual response against this value
  /// for assessment. Custom evaluators can access it through the
  /// <code>{expected_response}</code> placeholder in their instructions.
  final EvaluationContent? expectedResponse;

  /// The expected tool call sequence for session-level trajectory evaluation.
  /// Contains a list of tool names representing the tools the agent is expected
  /// to invoke.
  final EvaluationExpectedTrajectory? expectedTrajectory;

  EvaluationReferenceInput({
    required this.context,
    this.assertions,
    this.expectedResponse,
    this.expectedTrajectory,
  });

  Map<String, dynamic> toJson() {
    final context = this.context;
    final assertions = this.assertions;
    final expectedResponse = this.expectedResponse;
    final expectedTrajectory = this.expectedTrajectory;
    return {
      'context': context,
      if (assertions != null) 'assertions': assertions,
      if (expectedResponse != null) 'expectedResponse': expectedResponse,
      if (expectedTrajectory != null) 'expectedTrajectory': expectedTrajectory,
    };
  }
}

/// A certificate to install in the browser or code interpreter session.
///
/// @nodoc
class Certificate {
  /// The location of the certificate.
  final CertificateLocation location;

  Certificate({
    required this.location,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      location: CertificateLocation.fromJson(
          (json['location'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    return {
      'location': location,
    };
  }
}

/// The location from which to retrieve a certificate.
///
/// @nodoc
class CertificateLocation {
  /// The Amazon Web Services Secrets Manager location of the certificate.
  final SecretsManagerLocation? secretsManager;

  CertificateLocation({
    this.secretsManager,
  });

  factory CertificateLocation.fromJson(Map<String, dynamic> json) {
    return CertificateLocation(
      secretsManager: json['secretsManager'] != null
          ? SecretsManagerLocation.fromJson(
              json['secretsManager'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final secretsManager = this.secretsManager;
    return {
      if (secretsManager != null) 'secretsManager': secretsManager,
    };
  }
}

/// The Amazon Web Services Secrets Manager location configuration.
///
/// @nodoc
class SecretsManagerLocation {
  /// The ARN of the Amazon Web Services Secrets Manager secret containing the
  /// certificate.
  final String secretArn;

  SecretsManagerLocation({
    required this.secretArn,
  });

  factory SecretsManagerLocation.fromJson(Map<String, dynamic> json) {
    return SecretsManagerLocation(
      secretArn: (json['secretArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final secretArn = this.secretArn;
    return {
      'secretArn': secretArn,
    };
  }
}

/// A condensed representation of a code interpreter session in Amazon Bedrock
/// AgentCore. This structure contains key information about a code interpreter
/// session, including identifiers, status, and timestamps, without the full
/// details of the session configuration.
///
/// @nodoc
class CodeInterpreterSessionSummary {
  /// The unique identifier of the code interpreter associated with the session.
  /// This identifier specifies which code interpreter environment is used for the
  /// session.
  final String codeInterpreterIdentifier;

  /// The timestamp when the code interpreter session was created. This value is
  /// in ISO 8601 format.
  final DateTime createdAt;

  /// The unique identifier of the code interpreter session. This identifier is
  /// used in operations that interact with the session.
  final String sessionId;

  /// The current status of the code interpreter session. Possible values include
  /// ACTIVE, STOPPING, and STOPPED.
  final CodeInterpreterSessionStatus status;

  /// The timestamp when the code interpreter session was last updated. This value
  /// is in ISO 8601 format.
  final DateTime? lastUpdatedAt;

  /// The name of the code interpreter session. This name helps identify and
  /// manage the session.
  final String? name;

  CodeInterpreterSessionSummary({
    required this.codeInterpreterIdentifier,
    required this.createdAt,
    required this.sessionId,
    required this.status,
    this.lastUpdatedAt,
    this.name,
  });

  factory CodeInterpreterSessionSummary.fromJson(Map<String, dynamic> json) {
    return CodeInterpreterSessionSummary(
      codeInterpreterIdentifier:
          (json['codeInterpreterIdentifier'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      sessionId: (json['sessionId'] as String?) ?? '',
      status: CodeInterpreterSessionStatus.fromString(
          (json['status'] as String?) ?? ''),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeInterpreterIdentifier = this.codeInterpreterIdentifier;
    final createdAt = this.createdAt;
    final sessionId = this.sessionId;
    final status = this.status;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    return {
      'codeInterpreterIdentifier': codeInterpreterIdentifier,
      'createdAt': iso8601ToJson(createdAt),
      'sessionId': sessionId,
      'status': status.value,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (name != null) 'name': name,
    };
  }
}

/// @nodoc
class CodeInterpreterSessionStatus {
  static const ready = CodeInterpreterSessionStatus._('READY');
  static const terminated = CodeInterpreterSessionStatus._('TERMINATED');

  final String value;

  const CodeInterpreterSessionStatus._(this.value);

  static const values = [ready, terminated];

  static CodeInterpreterSessionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CodeInterpreterSessionStatus._(value));

  @override
  bool operator ==(other) =>
      other is CodeInterpreterSessionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The collection of streams associated with a browser session in Amazon
/// Bedrock AgentCore. These streams provide different ways to interact with and
/// observe the browser session, including programmatic control and visual
/// representation of the browser content.
///
/// @nodoc
class BrowserSessionStream {
  /// The stream that enables programmatic control of the browser. This stream
  /// allows agents to perform actions such as navigating to URLs, clicking
  /// elements, and filling forms.
  final AutomationStream automationStream;

  /// The stream that provides a visual representation of the browser content.
  /// This stream allows agents to observe the current state of the browser,
  /// including rendered web pages and visual elements.
  final LiveViewStream? liveViewStream;

  BrowserSessionStream({
    required this.automationStream,
    this.liveViewStream,
  });

  factory BrowserSessionStream.fromJson(Map<String, dynamic> json) {
    return BrowserSessionStream(
      automationStream: AutomationStream.fromJson(
          (json['automationStream'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      liveViewStream: json['liveViewStream'] != null
          ? LiveViewStream.fromJson(
              json['liveViewStream'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final automationStream = this.automationStream;
    final liveViewStream = this.liveViewStream;
    return {
      'automationStream': automationStream,
      if (liveViewStream != null) 'liveViewStream': liveViewStream,
    };
  }
}

/// The configuration for a stream that enables programmatic control of a
/// browser session in Amazon Bedrock AgentCore. This stream provides a
/// bidirectional communication channel for sending commands to the browser and
/// receiving responses, allowing agents to automate web interactions such as
/// navigation, form filling, and element clicking.
///
/// @nodoc
class AutomationStream {
  /// The endpoint URL for the automation stream. This URL is used to establish a
  /// WebSocket connection to the stream for sending commands and receiving
  /// responses.
  final String streamEndpoint;

  /// The current status of the automation stream. This indicates whether the
  /// stream is available for use. Possible values include ACTIVE, CONNECTING, and
  /// DISCONNECTED.
  final AutomationStreamStatus streamStatus;

  AutomationStream({
    required this.streamEndpoint,
    required this.streamStatus,
  });

  factory AutomationStream.fromJson(Map<String, dynamic> json) {
    return AutomationStream(
      streamEndpoint: (json['streamEndpoint'] as String?) ?? '',
      streamStatus: AutomationStreamStatus.fromString(
          (json['streamStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final streamEndpoint = this.streamEndpoint;
    final streamStatus = this.streamStatus;
    return {
      'streamEndpoint': streamEndpoint,
      'streamStatus': streamStatus.value,
    };
  }
}

/// The configuration for a stream that provides a visual representation of a
/// browser session in Amazon Bedrock AgentCore. This stream enables agents to
/// observe the current state of the browser, including rendered web pages,
/// visual elements, and the results of interactions.
///
/// @nodoc
class LiveViewStream {
  /// The endpoint URL for the live view stream. This URL is used to establish a
  /// connection to receive visual updates from the browser session.
  final String? streamEndpoint;

  LiveViewStream({
    this.streamEndpoint,
  });

  factory LiveViewStream.fromJson(Map<String, dynamic> json) {
    return LiveViewStream(
      streamEndpoint: json['streamEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final streamEndpoint = this.streamEndpoint;
    return {
      if (streamEndpoint != null) 'streamEndpoint': streamEndpoint,
    };
  }
}

/// @nodoc
class AutomationStreamStatus {
  static const enabled = AutomationStreamStatus._('ENABLED');
  static const disabled = AutomationStreamStatus._('DISABLED');

  final String value;

  const AutomationStreamStatus._(this.value);

  static const values = [enabled, disabled];

  static AutomationStreamStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutomationStreamStatus._(value));

  @override
  bool operator ==(other) =>
      other is AutomationStreamStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about an update to a stream.
///
/// @nodoc
class StreamUpdate {
  /// The update to an automation stream.
  final AutomationStreamUpdate? automationStreamUpdate;

  StreamUpdate({
    this.automationStreamUpdate,
  });

  Map<String, dynamic> toJson() {
    final automationStreamUpdate = this.automationStreamUpdate;
    return {
      if (automationStreamUpdate != null)
        'automationStreamUpdate': automationStreamUpdate,
    };
  }
}

/// Contains information about an update to an automation stream.
///
/// @nodoc
class AutomationStreamUpdate {
  /// The status of the automation stream.
  final AutomationStreamStatus? streamStatus;

  AutomationStreamUpdate({
    this.streamStatus,
  });

  Map<String, dynamic> toJson() {
    final streamStatus = this.streamStatus;
    return {
      if (streamStatus != null) 'streamStatus': streamStatus.value,
    };
  }
}

/// The configuration that defines the dimensions of a browser viewport in a
/// browser session. The viewport determines the visible area of web content and
/// affects how web pages are rendered and displayed. Proper viewport
/// configuration ensures that web content is displayed correctly for the
/// agent's browsing tasks.
///
/// @nodoc
class ViewPort {
  /// The height of the viewport in pixels. This value determines the vertical
  /// dimension of the visible area. Valid values range from 600 to 1080 pixels.
  final int height;

  /// The width of the viewport in pixels. This value determines the horizontal
  /// dimension of the visible area. Valid values range from 800 to 1920 pixels.
  final int width;

  ViewPort({
    required this.height,
    required this.width,
  });

  factory ViewPort.fromJson(Map<String, dynamic> json) {
    return ViewPort(
      height: (json['height'] as int?) ?? 0,
      width: (json['width'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final height = this.height;
    final width = this.width;
    return {
      'height': height,
      'width': width,
    };
  }
}

/// The configuration for a browser profile in Amazon Bedrock AgentCore. A
/// browser profile contains persistent browser data such as cookies and local
/// storage that can be saved from one browser session and reused in subsequent
/// sessions. Browser profiles enable continuity for tasks that require
/// authentication, maintain user preferences, or depend on previously stored
/// browser state.
///
/// @nodoc
class BrowserProfileConfiguration {
  /// The unique identifier of the browser profile. This identifier is used to
  /// reference the profile when starting new browser sessions or saving session
  /// data to the profile.
  final String profileIdentifier;

  BrowserProfileConfiguration({
    required this.profileIdentifier,
  });

  factory BrowserProfileConfiguration.fromJson(Map<String, dynamic> json) {
    return BrowserProfileConfiguration(
      profileIdentifier: (json['profileIdentifier'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final profileIdentifier = this.profileIdentifier;
    return {
      'profileIdentifier': profileIdentifier,
    };
  }
}

/// Configuration for routing browser traffic through customer-managed proxy
/// servers. Supports 1-5 proxy servers for domain-based routing and proxy
/// bypass rules.
///
/// @nodoc
class ProxyConfiguration {
  /// An array of 1-5 proxy server configurations for domain-based routing. Each
  /// proxy can specify which domains it handles via <code>domainPatterns</code>,
  /// enabling flexible routing of different traffic through different proxies
  /// based on destination domain.
  final List<Proxy> proxies;

  /// Optional configuration for domains that should bypass all proxies and
  /// connect directly to their destination, like the internet. Takes precedence
  /// over all proxy routing rules.
  final ProxyBypass? bypass;

  ProxyConfiguration({
    required this.proxies,
    this.bypass,
  });

  factory ProxyConfiguration.fromJson(Map<String, dynamic> json) {
    return ProxyConfiguration(
      proxies: ((json['proxies'] as List?) ?? const [])
          .nonNulls
          .map((e) => Proxy.fromJson(e as Map<String, dynamic>))
          .toList(),
      bypass: json['bypass'] != null
          ? ProxyBypass.fromJson(json['bypass'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final proxies = this.proxies;
    final bypass = this.bypass;
    return {
      'proxies': proxies,
      if (bypass != null) 'bypass': bypass,
    };
  }
}

/// Browser enterprise policy configuration.
///
/// @nodoc
class BrowserEnterprisePolicy {
  /// The location of the enterprise policy file.
  final ResourceLocation location;

  /// The enterprise policy type. See BrowserEnterprisePolicyType.
  final BrowserEnterprisePolicyType? type;

  BrowserEnterprisePolicy({
    required this.location,
    this.type,
  });

  factory BrowserEnterprisePolicy.fromJson(Map<String, dynamic> json) {
    return BrowserEnterprisePolicy(
      location: ResourceLocation.fromJson(
          (json['location'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      type: (json['type'] as String?)
          ?.let(BrowserEnterprisePolicyType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    final type = this.type;
    return {
      'location': location,
      if (type != null) 'type': type.value,
    };
  }
}

/// The location of the browser extension.
///
/// @nodoc
class ResourceLocation {
  /// The Amazon S3 location of the resource. Use this when the resource is stored
  /// in an Amazon S3 bucket.
  final S3Location? s3;

  ResourceLocation({
    this.s3,
  });

  factory ResourceLocation.fromJson(Map<String, dynamic> json) {
    return ResourceLocation(
      s3: json['s3'] != null
          ? S3Location.fromJson(json['s3'] as Map<String, dynamic>)
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

/// The type of browser enterprise policy. Available values are
/// <code>MANAGED</code> and <code>RECOMMENDED</code>.
///
/// @nodoc
class BrowserEnterprisePolicyType {
  static const managed = BrowserEnterprisePolicyType._('MANAGED');
  static const recommended = BrowserEnterprisePolicyType._('RECOMMENDED');

  final String value;

  const BrowserEnterprisePolicyType._(this.value);

  static const values = [managed, recommended];

  static BrowserEnterprisePolicyType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BrowserEnterprisePolicyType._(value));

  @override
  bool operator ==(other) =>
      other is BrowserEnterprisePolicyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Amazon S3 location configuration of a resource.
///
/// @nodoc
class S3Location {
  /// The name of the Amazon S3 bucket where the resource is stored.
  final String bucket;

  /// The name of the Amazon S3 prefix/key where the resource is stored.
  final String prefix;

  /// The name of the Amazon S3 version ID where the resource is stored
  /// (Optional).
  final String? versionId;

  S3Location({
    required this.bucket,
    required this.prefix,
    this.versionId,
  });

  factory S3Location.fromJson(Map<String, dynamic> json) {
    return S3Location(
      bucket: (json['bucket'] as String?) ?? '',
      prefix: (json['prefix'] as String?) ?? '',
      versionId: json['versionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final prefix = this.prefix;
    final versionId = this.versionId;
    return {
      'bucket': bucket,
      'prefix': prefix,
      if (versionId != null) 'versionId': versionId,
    };
  }
}

/// Configuration for domains that should bypass all proxies and connect
/// directly to the internet. These bypass rules take precedence over all proxy
/// routing rules.
///
/// @nodoc
class ProxyBypass {
  /// Array of domain patterns that should bypass the proxy. Supports
  /// <code>.amazonaws.com</code> for subdomain matching or
  /// <code>amazonaws.com</code> for exact domain matching. Requests to these
  /// domains connect directly without using any proxy. Maximum 253 characters per
  /// pattern.
  final List<String>? domainPatterns;

  ProxyBypass({
    this.domainPatterns,
  });

  factory ProxyBypass.fromJson(Map<String, dynamic> json) {
    return ProxyBypass(
      domainPatterns: (json['domainPatterns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainPatterns = this.domainPatterns;
    return {
      if (domainPatterns != null) 'domainPatterns': domainPatterns,
    };
  }
}

/// Union type representing different proxy configurations. Currently supports
/// external customer-managed proxies.
///
/// @nodoc
class Proxy {
  /// Configuration for an external customer-managed proxy server.
  final ExternalProxy? externalProxy;

  Proxy({
    this.externalProxy,
  });

  factory Proxy.fromJson(Map<String, dynamic> json) {
    return Proxy(
      externalProxy: json['externalProxy'] != null
          ? ExternalProxy.fromJson(
              json['externalProxy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final externalProxy = this.externalProxy;
    return {
      if (externalProxy != null) 'externalProxy': externalProxy,
    };
  }
}

/// Configuration for a customer-managed external proxy server. Includes server
/// location, optional domain-based routing patterns, and authentication
/// credentials.
///
/// @nodoc
class ExternalProxy {
  /// The port number of the proxy server. Valid range: 1-65535.
  final int port;

  /// The hostname of the proxy server. Must be a valid DNS hostname (maximum 253
  /// characters).
  final String server;

  /// Optional authentication credentials for the proxy server. If omitted, the
  /// proxy is accessed without authentication (useful for IP-allowlisted
  /// proxies).
  final ProxyCredentials? credentials;

  /// Optional array of domain patterns that should route through this specific
  /// proxy. Supports <code>.example.com</code> for subdomain matching (matches
  /// any subdomain of example.com) or <code>example.com</code> for exact domain
  /// matching. If omitted, this proxy acts as a catch-all for domains not matched
  /// by other proxies. Maximum 100 patterns per proxy, each up to 253 characters.
  final List<String>? domainPatterns;

  ExternalProxy({
    required this.port,
    required this.server,
    this.credentials,
    this.domainPatterns,
  });

  factory ExternalProxy.fromJson(Map<String, dynamic> json) {
    return ExternalProxy(
      port: (json['port'] as int?) ?? 0,
      server: (json['server'] as String?) ?? '',
      credentials: json['credentials'] != null
          ? ProxyCredentials.fromJson(
              json['credentials'] as Map<String, dynamic>)
          : null,
      domainPatterns: (json['domainPatterns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final port = this.port;
    final server = this.server;
    final credentials = this.credentials;
    final domainPatterns = this.domainPatterns;
    return {
      'port': port,
      'server': server,
      if (credentials != null) 'credentials': credentials,
      if (domainPatterns != null) 'domainPatterns': domainPatterns,
    };
  }
}

/// Union type representing different proxy authentication methods. Currently
/// supports HTTP Basic Authentication (username and password).
///
/// @nodoc
class ProxyCredentials {
  /// HTTP Basic Authentication credentials (username and password) stored in
  /// Amazon Web Services Secrets Manager.
  final BasicAuth? basicAuth;

  ProxyCredentials({
    this.basicAuth,
  });

  factory ProxyCredentials.fromJson(Map<String, dynamic> json) {
    return ProxyCredentials(
      basicAuth: json['basicAuth'] != null
          ? BasicAuth.fromJson(json['basicAuth'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final basicAuth = this.basicAuth;
    return {
      if (basicAuth != null) 'basicAuth': basicAuth,
    };
  }
}

/// Configuration for HTTP Basic Authentication using credentials stored in
/// Amazon Web Services Secrets Manager. The secret must contain a JSON object
/// with <code>username</code> and <code>password</code> string fields. Username
/// allows alphanumeric characters and <code>@._+=-</code> symbols (pattern:
/// <code>^\[a-zA-Z0-9@._+=\-\]+$</code>). Password allows alphanumeric
/// characters and <code>@._+=-!#$%&amp;*</code> symbols (pattern:
/// <code>^\[a-zA-Z0-9@._+=\-!#$%&amp;*\]+$</code>). Both fields have a maximum
/// length of 256 characters.
///
/// @nodoc
class BasicAuth {
  /// The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager
  /// secret containing proxy credentials. The secret must be a JSON object with
  /// <code>username</code> and <code>password</code> string fields that meet
  /// validation requirements. The caller must have
  /// <code>secretsmanager:GetSecretValue</code> permission for this ARN. Example
  /// secret format: <code>{"username": "proxy_user", "password":
  /// "secure_password"}</code>
  final String secretArn;

  BasicAuth({
    required this.secretArn,
  });

  factory BasicAuth.fromJson(Map<String, dynamic> json) {
    return BasicAuth(
      secretArn: (json['secretArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final secretArn = this.secretArn;
    return {
      'secretArn': secretArn,
    };
  }
}

/// Browser extension configuration.
///
/// @nodoc
class BrowserExtension {
  /// The location where the browser extension files are stored. This specifies
  /// the source from which the extension will be loaded and installed.
  final ResourceLocation location;

  BrowserExtension({
    required this.location,
  });

  factory BrowserExtension.fromJson(Map<String, dynamic> json) {
    return BrowserExtension(
      location: ResourceLocation.fromJson(
          (json['location'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    return {
      'location': location,
    };
  }
}

/// A condensed representation of a browser session in Amazon Bedrock AgentCore.
/// This structure contains key information about a browser session, including
/// identifiers, status, and timestamps, without the full details of the session
/// configuration and streams.
///
/// @nodoc
class BrowserSessionSummary {
  /// The unique identifier of the browser associated with the session. This
  /// identifier specifies which browser environment is used for the session.
  final String browserIdentifier;

  /// The timestamp when the browser session was created. This value is in ISO
  /// 8601 format.
  final DateTime createdAt;

  /// The unique identifier of the browser session. This identifier is used in
  /// operations that interact with the session.
  final String sessionId;

  /// The current status of the browser session. Possible values include ACTIVE,
  /// STOPPING, and STOPPED.
  final BrowserSessionStatus status;

  /// The timestamp when the browser session was last updated. This value is in
  /// ISO 8601 format.
  final DateTime? lastUpdatedAt;

  /// The name of the browser session. This name helps identify and manage the
  /// session.
  final String? name;

  BrowserSessionSummary({
    required this.browserIdentifier,
    required this.createdAt,
    required this.sessionId,
    required this.status,
    this.lastUpdatedAt,
    this.name,
  });

  factory BrowserSessionSummary.fromJson(Map<String, dynamic> json) {
    return BrowserSessionSummary(
      browserIdentifier: (json['browserIdentifier'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      sessionId: (json['sessionId'] as String?) ?? '',
      status:
          BrowserSessionStatus.fromString((json['status'] as String?) ?? ''),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final browserIdentifier = this.browserIdentifier;
    final createdAt = this.createdAt;
    final sessionId = this.sessionId;
    final status = this.status;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    return {
      'browserIdentifier': browserIdentifier,
      'createdAt': iso8601ToJson(createdAt),
      'sessionId': sessionId,
      'status': status.value,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (name != null) 'name': name,
    };
  }
}

/// @nodoc
class BrowserSessionStatus {
  static const ready = BrowserSessionStatus._('READY');
  static const terminated = BrowserSessionStatus._('TERMINATED');

  final String value;

  const BrowserSessionStatus._(this.value);

  static const values = [ready, terminated];

  static BrowserSessionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BrowserSessionStatus._(value));

  @override
  bool operator ==(other) =>
      other is BrowserSessionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The result of a browser action execution. Exactly one member is set,
/// matching the action that was performed.
///
/// @nodoc
class BrowserActionResult {
  /// The result of a key press action.
  final KeyPressResult? keyPress;

  /// The result of a key shortcut action.
  final KeyShortcutResult? keyShortcut;

  /// The result of a key type action.
  final KeyTypeResult? keyType;

  /// The result of a mouse click action.
  final MouseClickResult? mouseClick;

  /// The result of a mouse drag action.
  final MouseDragResult? mouseDrag;

  /// The result of a mouse move action.
  final MouseMoveResult? mouseMove;

  /// The result of a mouse scroll action.
  final MouseScrollResult? mouseScroll;

  /// The result of a screenshot action.
  final ScreenshotResult? screenshot;

  BrowserActionResult({
    this.keyPress,
    this.keyShortcut,
    this.keyType,
    this.mouseClick,
    this.mouseDrag,
    this.mouseMove,
    this.mouseScroll,
    this.screenshot,
  });

  factory BrowserActionResult.fromJson(Map<String, dynamic> json) {
    return BrowserActionResult(
      keyPress: json['keyPress'] != null
          ? KeyPressResult.fromJson(json['keyPress'] as Map<String, dynamic>)
          : null,
      keyShortcut: json['keyShortcut'] != null
          ? KeyShortcutResult.fromJson(
              json['keyShortcut'] as Map<String, dynamic>)
          : null,
      keyType: json['keyType'] != null
          ? KeyTypeResult.fromJson(json['keyType'] as Map<String, dynamic>)
          : null,
      mouseClick: json['mouseClick'] != null
          ? MouseClickResult.fromJson(
              json['mouseClick'] as Map<String, dynamic>)
          : null,
      mouseDrag: json['mouseDrag'] != null
          ? MouseDragResult.fromJson(json['mouseDrag'] as Map<String, dynamic>)
          : null,
      mouseMove: json['mouseMove'] != null
          ? MouseMoveResult.fromJson(json['mouseMove'] as Map<String, dynamic>)
          : null,
      mouseScroll: json['mouseScroll'] != null
          ? MouseScrollResult.fromJson(
              json['mouseScroll'] as Map<String, dynamic>)
          : null,
      screenshot: json['screenshot'] != null
          ? ScreenshotResult.fromJson(
              json['screenshot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final keyPress = this.keyPress;
    final keyShortcut = this.keyShortcut;
    final keyType = this.keyType;
    final mouseClick = this.mouseClick;
    final mouseDrag = this.mouseDrag;
    final mouseMove = this.mouseMove;
    final mouseScroll = this.mouseScroll;
    final screenshot = this.screenshot;
    return {
      if (keyPress != null) 'keyPress': keyPress,
      if (keyShortcut != null) 'keyShortcut': keyShortcut,
      if (keyType != null) 'keyType': keyType,
      if (mouseClick != null) 'mouseClick': mouseClick,
      if (mouseDrag != null) 'mouseDrag': mouseDrag,
      if (mouseMove != null) 'mouseMove': mouseMove,
      if (mouseScroll != null) 'mouseScroll': mouseScroll,
      if (screenshot != null) 'screenshot': screenshot,
    };
  }
}

/// The result of a mouse click action.
///
/// @nodoc
class MouseClickResult {
  /// The status of the action execution.
  final BrowserActionStatus status;

  /// The error message. Present only when the action failed.
  final String? error;

  MouseClickResult({
    required this.status,
    this.error,
  });

  factory MouseClickResult.fromJson(Map<String, dynamic> json) {
    return MouseClickResult(
      status: BrowserActionStatus.fromString((json['status'] as String?) ?? ''),
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final error = this.error;
    return {
      'status': status.value,
      if (error != null) 'error': error,
    };
  }
}

/// The result of a mouse move action.
///
/// @nodoc
class MouseMoveResult {
  /// The status of the action execution.
  final BrowserActionStatus status;

  /// The error message. Present only when the action failed.
  final String? error;

  MouseMoveResult({
    required this.status,
    this.error,
  });

  factory MouseMoveResult.fromJson(Map<String, dynamic> json) {
    return MouseMoveResult(
      status: BrowserActionStatus.fromString((json['status'] as String?) ?? ''),
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final error = this.error;
    return {
      'status': status.value,
      if (error != null) 'error': error,
    };
  }
}

/// The result of a mouse drag action.
///
/// @nodoc
class MouseDragResult {
  /// The status of the action execution.
  final BrowserActionStatus status;

  /// The error message. Present only when the action failed.
  final String? error;

  MouseDragResult({
    required this.status,
    this.error,
  });

  factory MouseDragResult.fromJson(Map<String, dynamic> json) {
    return MouseDragResult(
      status: BrowserActionStatus.fromString((json['status'] as String?) ?? ''),
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final error = this.error;
    return {
      'status': status.value,
      if (error != null) 'error': error,
    };
  }
}

/// The result of a mouse scroll action.
///
/// @nodoc
class MouseScrollResult {
  /// The status of the action execution.
  final BrowserActionStatus status;

  /// The error message. Present only when the action failed.
  final String? error;

  MouseScrollResult({
    required this.status,
    this.error,
  });

  factory MouseScrollResult.fromJson(Map<String, dynamic> json) {
    return MouseScrollResult(
      status: BrowserActionStatus.fromString((json['status'] as String?) ?? ''),
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final error = this.error;
    return {
      'status': status.value,
      if (error != null) 'error': error,
    };
  }
}

/// The result of a key type action.
///
/// @nodoc
class KeyTypeResult {
  /// The status of the action execution.
  final BrowserActionStatus status;

  /// The error message. Present only when the action failed.
  final String? error;

  KeyTypeResult({
    required this.status,
    this.error,
  });

  factory KeyTypeResult.fromJson(Map<String, dynamic> json) {
    return KeyTypeResult(
      status: BrowserActionStatus.fromString((json['status'] as String?) ?? ''),
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final error = this.error;
    return {
      'status': status.value,
      if (error != null) 'error': error,
    };
  }
}

/// The result of a key press action.
///
/// @nodoc
class KeyPressResult {
  /// The status of the action execution.
  final BrowserActionStatus status;

  /// The error message. Present only when the action failed.
  final String? error;

  KeyPressResult({
    required this.status,
    this.error,
  });

  factory KeyPressResult.fromJson(Map<String, dynamic> json) {
    return KeyPressResult(
      status: BrowserActionStatus.fromString((json['status'] as String?) ?? ''),
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final error = this.error;
    return {
      'status': status.value,
      if (error != null) 'error': error,
    };
  }
}

/// The result of a key shortcut action.
///
/// @nodoc
class KeyShortcutResult {
  /// The status of the action execution.
  final BrowserActionStatus status;

  /// The error message. Present only when the action failed.
  final String? error;

  KeyShortcutResult({
    required this.status,
    this.error,
  });

  factory KeyShortcutResult.fromJson(Map<String, dynamic> json) {
    return KeyShortcutResult(
      status: BrowserActionStatus.fromString((json['status'] as String?) ?? ''),
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final error = this.error;
    return {
      'status': status.value,
      if (error != null) 'error': error,
    };
  }
}

/// The result of a screenshot action.
///
/// @nodoc
class ScreenshotResult {
  /// The status of the action execution.
  final BrowserActionStatus status;

  /// The base64-encoded image data. Present only when the action succeeded.
  final Uint8List? data;

  /// The error message. Present only when the action failed.
  final String? error;

  ScreenshotResult({
    required this.status,
    this.data,
    this.error,
  });

  factory ScreenshotResult.fromJson(Map<String, dynamic> json) {
    return ScreenshotResult(
      status: BrowserActionStatus.fromString((json['status'] as String?) ?? ''),
      data: _s.decodeNullableUint8List(json['data'] as String?),
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final data = this.data;
    final error = this.error;
    return {
      'status': status.value,
      if (data != null) 'data': base64Encode(data),
      if (error != null) 'error': error,
    };
  }
}

/// The status of a browser action execution.
///
/// @nodoc
class BrowserActionStatus {
  static const success = BrowserActionStatus._('SUCCESS');
  static const failed = BrowserActionStatus._('FAILED');

  final String value;

  const BrowserActionStatus._(this.value);

  static const values = [success, failed];

  static BrowserActionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BrowserActionStatus._(value));

  @override
  bool operator ==(other) =>
      other is BrowserActionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The browser action to perform. Exactly one member must be set per request.
///
/// @nodoc
class BrowserAction {
  /// Press a key one or more times.
  final KeyPressArguments? keyPress;

  /// Press a key combination.
  final KeyShortcutArguments? keyShortcut;

  /// Type a string of text.
  final KeyTypeArguments? keyType;

  /// Click at the specified coordinates.
  final MouseClickArguments? mouseClick;

  /// Drag from a start position to an end position.
  final MouseDragArguments? mouseDrag;

  /// Move the cursor to the specified coordinates.
  final MouseMoveArguments? mouseMove;

  /// Scroll at the specified position.
  final MouseScrollArguments? mouseScroll;

  /// Capture a full-screen screenshot.
  final ScreenshotArguments? screenshot;

  BrowserAction({
    this.keyPress,
    this.keyShortcut,
    this.keyType,
    this.mouseClick,
    this.mouseDrag,
    this.mouseMove,
    this.mouseScroll,
    this.screenshot,
  });

  Map<String, dynamic> toJson() {
    final keyPress = this.keyPress;
    final keyShortcut = this.keyShortcut;
    final keyType = this.keyType;
    final mouseClick = this.mouseClick;
    final mouseDrag = this.mouseDrag;
    final mouseMove = this.mouseMove;
    final mouseScroll = this.mouseScroll;
    final screenshot = this.screenshot;
    return {
      if (keyPress != null) 'keyPress': keyPress,
      if (keyShortcut != null) 'keyShortcut': keyShortcut,
      if (keyType != null) 'keyType': keyType,
      if (mouseClick != null) 'mouseClick': mouseClick,
      if (mouseDrag != null) 'mouseDrag': mouseDrag,
      if (mouseMove != null) 'mouseMove': mouseMove,
      if (mouseScroll != null) 'mouseScroll': mouseScroll,
      if (screenshot != null) 'screenshot': screenshot,
    };
  }
}

/// Arguments for a mouse click action.
///
/// @nodoc
class MouseClickArguments {
  /// The X coordinate on screen where the click occurs.
  final int x;

  /// The Y coordinate on screen where the click occurs.
  final int y;

  /// The mouse button to use. Defaults to <code>LEFT</code>.
  final MouseButton? button;

  /// The number of clicks to perform. Valid range: 1–10. Defaults to 1.
  final int? clickCount;

  MouseClickArguments({
    required this.x,
    required this.y,
    this.button,
    this.clickCount,
  });

  Map<String, dynamic> toJson() {
    final x = this.x;
    final y = this.y;
    final button = this.button;
    final clickCount = this.clickCount;
    return {
      'x': x,
      'y': y,
      if (button != null) 'button': button.value,
      if (clickCount != null) 'clickCount': clickCount,
    };
  }
}

/// Arguments for a mouse move action.
///
/// @nodoc
class MouseMoveArguments {
  /// The target X coordinate on screen.
  final int x;

  /// The target Y coordinate on screen.
  final int y;

  MouseMoveArguments({
    required this.x,
    required this.y,
  });

  Map<String, dynamic> toJson() {
    final x = this.x;
    final y = this.y;
    return {
      'x': x,
      'y': y,
    };
  }
}

/// Arguments for a mouse drag action.
///
/// @nodoc
class MouseDragArguments {
  /// The ending X coordinate for the drag.
  final int endX;

  /// The ending Y coordinate for the drag.
  final int endY;

  /// The starting X coordinate for the drag.
  final int startX;

  /// The starting Y coordinate for the drag.
  final int startY;

  /// The mouse button to use for the drag. Defaults to <code>LEFT</code>.
  final MouseButton? button;

  MouseDragArguments({
    required this.endX,
    required this.endY,
    required this.startX,
    required this.startY,
    this.button,
  });

  Map<String, dynamic> toJson() {
    final endX = this.endX;
    final endY = this.endY;
    final startX = this.startX;
    final startY = this.startY;
    final button = this.button;
    return {
      'endX': endX,
      'endY': endY,
      'startX': startX,
      'startY': startY,
      if (button != null) 'button': button.value,
    };
  }
}

/// Arguments for a mouse scroll action.
///
/// @nodoc
class MouseScrollArguments {
  /// The X coordinate on screen where the scroll occurs.
  final int x;

  /// The Y coordinate on screen where the scroll occurs.
  final int y;

  /// The horizontal scroll delta. Valid range: -1000 to 1000.
  final int? deltaX;

  /// The vertical scroll delta. Valid range: -1000 to 1000. Negative values
  /// scroll down.
  final int? deltaY;

  MouseScrollArguments({
    required this.x,
    required this.y,
    this.deltaX,
    this.deltaY,
  });

  Map<String, dynamic> toJson() {
    final x = this.x;
    final y = this.y;
    final deltaX = this.deltaX;
    final deltaY = this.deltaY;
    return {
      'x': x,
      'y': y,
      if (deltaX != null) 'deltaX': deltaX,
      if (deltaY != null) 'deltaY': deltaY,
    };
  }
}

/// Arguments for a key type action.
///
/// @nodoc
class KeyTypeArguments {
  /// The text string to type. Maximum length: 10,000 characters.
  final String text;

  KeyTypeArguments({
    required this.text,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      'text': text,
    };
  }
}

/// Arguments for a key press action.
///
/// @nodoc
class KeyPressArguments {
  /// The key name to press (for example, <code>enter</code>, <code>tab</code>,
  /// <code>escape</code>).
  final String key;

  /// The number of times to press the key. Valid range: 1–100. Defaults to 1.
  final int? presses;

  KeyPressArguments({
    required this.key,
    this.presses,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final presses = this.presses;
    return {
      'key': key,
      if (presses != null) 'presses': presses,
    };
  }
}

/// Arguments for a key shortcut action.
///
/// @nodoc
class KeyShortcutArguments {
  /// The key combination to press (for example, <code>\["ctrl", "s"\]</code>).
  /// Maximum 5 keys.
  final List<String> keys;

  KeyShortcutArguments({
    required this.keys,
  });

  Map<String, dynamic> toJson() {
    final keys = this.keys;
    return {
      'keys': keys,
    };
  }
}

/// Arguments for a screenshot action.
///
/// @nodoc
class ScreenshotArguments {
  /// The image format for the screenshot. Defaults to <code>PNG</code>.
  final ScreenshotFormat? format;

  ScreenshotArguments({
    this.format,
  });

  Map<String, dynamic> toJson() {
    final format = this.format;
    return {
      if (format != null) 'format': format.value,
    };
  }
}

/// The image format for a browser screenshot.
///
/// @nodoc
class ScreenshotFormat {
  static const png = ScreenshotFormat._('PNG');

  final String value;

  const ScreenshotFormat._(this.value);

  static const values = [png];

  static ScreenshotFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScreenshotFormat._(value));

  @override
  bool operator ==(other) => other is ScreenshotFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The mouse button to use for a browser mouse action.
///
/// @nodoc
class MouseButton {
  static const left = MouseButton._('LEFT');
  static const right = MouseButton._('RIGHT');
  static const middle = MouseButton._('MIDDLE');

  final String value;

  const MouseButton._(this.value);

  static const values = [left, right, middle];

  static MouseButton fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MouseButton._(value));

  @override
  bool operator ==(other) => other is MouseButton && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The streaming output union for the <code>InvokeAgentRuntimeCommand</code>
/// operation. This union delivers typed events: <code>contentStart</code>
/// (first), <code>contentDelta</code> (middle), and <code>contentStop</code>
/// (last).
///
/// @nodoc
class InvokeAgentRuntimeCommandStreamOutput {
  /// Exception events for error streaming.
  final AccessDeniedException? accessDeniedException;

  /// A response chunk containing command execution events such as content start,
  /// content delta, or content stop events.
  final ResponseChunk? chunk;
  final InternalServerException? internalServerException;
  final ResourceNotFoundException? resourceNotFoundException;
  final RuntimeClientError? runtimeClientError;
  final ServiceQuotaExceededException? serviceQuotaExceededException;
  final ThrottlingException? throttlingException;
  final ValidationException? validationException;

  InvokeAgentRuntimeCommandStreamOutput({
    this.accessDeniedException,
    this.chunk,
    this.internalServerException,
    this.resourceNotFoundException,
    this.runtimeClientError,
    this.serviceQuotaExceededException,
    this.throttlingException,
    this.validationException,
  });

  factory InvokeAgentRuntimeCommandStreamOutput.fromJson(
      Map<String, dynamic> json) {
    return InvokeAgentRuntimeCommandStreamOutput(
      accessDeniedException: json['accessDeniedException'] != null
          ? AccessDeniedException.fromJson(
              json['accessDeniedException'] as Map<String, dynamic>)
          : null,
      chunk: json['chunk'] != null
          ? ResponseChunk.fromJson(json['chunk'] as Map<String, dynamic>)
          : null,
      internalServerException: json['internalServerException'] != null
          ? InternalServerException.fromJson(
              json['internalServerException'] as Map<String, dynamic>)
          : null,
      resourceNotFoundException: json['resourceNotFoundException'] != null
          ? ResourceNotFoundException.fromJson(
              json['resourceNotFoundException'] as Map<String, dynamic>)
          : null,
      runtimeClientError: json['runtimeClientError'] != null
          ? RuntimeClientError.fromJson(
              json['runtimeClientError'] as Map<String, dynamic>)
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
    final chunk = this.chunk;
    final internalServerException = this.internalServerException;
    final resourceNotFoundException = this.resourceNotFoundException;
    final runtimeClientError = this.runtimeClientError;
    final serviceQuotaExceededException = this.serviceQuotaExceededException;
    final throttlingException = this.throttlingException;
    final validationException = this.validationException;
    return {
      if (accessDeniedException != null)
        'accessDeniedException': accessDeniedException,
      if (chunk != null) 'chunk': chunk,
      if (internalServerException != null)
        'internalServerException': internalServerException,
      if (resourceNotFoundException != null)
        'resourceNotFoundException': resourceNotFoundException,
      if (runtimeClientError != null) 'runtimeClientError': runtimeClientError,
      if (serviceQuotaExceededException != null)
        'serviceQuotaExceededException': serviceQuotaExceededException,
      if (throttlingException != null)
        'throttlingException': throttlingException,
      if (validationException != null)
        'validationException': validationException,
    };
  }
}

/// A structure representing a response chunk that contains exactly one of the
/// possible event types: <code>contentStart</code>, <code>contentDelta</code>,
/// or <code>contentStop</code>.
///
/// @nodoc
class ResponseChunk {
  /// An event containing incremental output (stdout or stderr) from the command
  /// execution. These are the middle chunks.
  final ContentDeltaEvent? contentDelta;

  /// An event indicating the start of content streaming from the command
  /// execution. This is the first chunk received.
  final ContentStartEvent? contentStart;

  /// An event indicating the completion of the command execution, including the
  /// exit code and final status. This is the last chunk received.
  final ContentStopEvent? contentStop;

  ResponseChunk({
    this.contentDelta,
    this.contentStart,
    this.contentStop,
  });

  factory ResponseChunk.fromJson(Map<String, dynamic> json) {
    return ResponseChunk(
      contentDelta: json['contentDelta'] != null
          ? ContentDeltaEvent.fromJson(
              json['contentDelta'] as Map<String, dynamic>)
          : null,
      contentStart: json['contentStart'] != null
          ? ContentStartEvent.fromJson(
              json['contentStart'] as Map<String, dynamic>)
          : null,
      contentStop: json['contentStop'] != null
          ? ContentStopEvent.fromJson(
              json['contentStop'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contentDelta = this.contentDelta;
    final contentStart = this.contentStart;
    final contentStop = this.contentStop;
    return {
      if (contentDelta != null) 'contentDelta': contentDelta,
      if (contentStart != null) 'contentStart': contentStart,
      if (contentStop != null) 'contentStop': contentStop,
    };
  }
}

/// An event that signals the start of content streaming from a command
/// execution. This event is sent when the command begins producing output.
///
/// @nodoc
class ContentStartEvent {
  ContentStartEvent();

  factory ContentStartEvent.fromJson(Map<String, dynamic> _) {
    return ContentStartEvent();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An event that contains incremental output from a command execution. This
/// event streams standard output and standard error content as it becomes
/// available during command execution.
///
/// @nodoc
class ContentDeltaEvent {
  /// The standard error content from the command execution. This field contains
  /// the incremental output written to stderr by the executing command.
  final String? stderr;

  /// The standard output content from the command execution. This field contains
  /// the incremental output written to stdout by the executing command.
  final String? stdout;

  ContentDeltaEvent({
    this.stderr,
    this.stdout,
  });

  factory ContentDeltaEvent.fromJson(Map<String, dynamic> json) {
    return ContentDeltaEvent(
      stderr: json['stderr'] as String?,
      stdout: json['stdout'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final stderr = this.stderr;
    final stdout = this.stdout;
    return {
      if (stderr != null) 'stderr': stderr,
      if (stdout != null) 'stdout': stdout,
    };
  }
}

/// An event that signals the completion of a command execution. This event
/// contains the final status and exit code of the executed command.
///
/// @nodoc
class ContentStopEvent {
  /// The exit code returned by the executed command. An exit code of 0 indicates
  /// successful execution, -1 indicates a platform error, and values greater than
  /// 0 indicate command-specific errors.
  final int exitCode;

  /// The final status of the command execution. Valid values are
  /// <code>COMPLETED</code> for successful completion or <code>TIMED_OUT</code>
  /// if the command exceeded the specified timeout.
  final CommandExecutionStatus status;

  ContentStopEvent({
    required this.exitCode,
    required this.status,
  });

  factory ContentStopEvent.fromJson(Map<String, dynamic> json) {
    return ContentStopEvent(
      exitCode: (json['exitCode'] as int?) ?? 0,
      status:
          CommandExecutionStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final exitCode = this.exitCode;
    final status = this.status;
    return {
      'exitCode': exitCode,
      'status': status.value,
    };
  }
}

/// @nodoc
class CommandExecutionStatus {
  static const completed = CommandExecutionStatus._('COMPLETED');
  static const timedOut = CommandExecutionStatus._('TIMED_OUT');

  final String value;

  const CommandExecutionStatus._(this.value);

  static const values = [completed, timedOut];

  static CommandExecutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CommandExecutionStatus._(value));

  @override
  bool operator ==(other) =>
      other is CommandExecutionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The request body structure for the <code>InvokeAgentRuntimeCommand</code>
/// operation, containing the command to execute and optional configuration
/// parameters.
///
/// @nodoc
class InvokeAgentRuntimeCommandRequestBody {
  /// The shell command to execute on the agent runtime. This command is executed
  /// in the runtime environment and its output is streamed back to the caller.
  final String command;

  /// The maximum duration in seconds to wait for the command to complete. If the
  /// command execution exceeds this timeout, it will be terminated. Default is
  /// 300 seconds. Minimum is 1 second. Maximum is 3600 seconds.
  final int? timeout;

  InvokeAgentRuntimeCommandRequestBody({
    required this.command,
    this.timeout,
  });

  Map<String, dynamic> toJson() {
    final command = this.command;
    final timeout = this.timeout;
    return {
      'command': command,
      if (timeout != null) 'timeout': timeout,
    };
  }
}

/// The streaming events returned by a harness invocation.
///
/// @nodoc
class InvokeHarnessStreamOutput {
  /// A delta update to the current content block.
  final HarnessContentBlockDeltaEvent? contentBlockDelta;

  /// Indicates the start of a new content block.
  final HarnessContentBlockStartEvent? contentBlockStart;

  /// Indicates the end of the current content block.
  final HarnessContentBlockStopEvent? contentBlockStop;
  final InternalServerException? internalServerException;

  /// Indicates the start of a new message from the agent.
  final HarnessMessageStartEvent? messageStart;

  /// Indicates the end of the current message.
  final HarnessMessageStopEvent? messageStop;

  /// Token usage and latency metrics for the invocation.
  final HarnessMetadataEvent? metadata;

  /// An error returned by the runtime container during agent execution.
  final RuntimeClientError? runtimeClientError;
  final ValidationException? validationException;

  InvokeHarnessStreamOutput({
    this.contentBlockDelta,
    this.contentBlockStart,
    this.contentBlockStop,
    this.internalServerException,
    this.messageStart,
    this.messageStop,
    this.metadata,
    this.runtimeClientError,
    this.validationException,
  });

  factory InvokeHarnessStreamOutput.fromJson(Map<String, dynamic> json) {
    return InvokeHarnessStreamOutput(
      contentBlockDelta: json['contentBlockDelta'] != null
          ? HarnessContentBlockDeltaEvent.fromJson(
              json['contentBlockDelta'] as Map<String, dynamic>)
          : null,
      contentBlockStart: json['contentBlockStart'] != null
          ? HarnessContentBlockStartEvent.fromJson(
              json['contentBlockStart'] as Map<String, dynamic>)
          : null,
      contentBlockStop: json['contentBlockStop'] != null
          ? HarnessContentBlockStopEvent.fromJson(
              json['contentBlockStop'] as Map<String, dynamic>)
          : null,
      internalServerException: json['internalServerException'] != null
          ? InternalServerException.fromJson(
              json['internalServerException'] as Map<String, dynamic>)
          : null,
      messageStart: json['messageStart'] != null
          ? HarnessMessageStartEvent.fromJson(
              json['messageStart'] as Map<String, dynamic>)
          : null,
      messageStop: json['messageStop'] != null
          ? HarnessMessageStopEvent.fromJson(
              json['messageStop'] as Map<String, dynamic>)
          : null,
      metadata: json['metadata'] != null
          ? HarnessMetadataEvent.fromJson(
              json['metadata'] as Map<String, dynamic>)
          : null,
      runtimeClientError: json['runtimeClientError'] != null
          ? RuntimeClientError.fromJson(
              json['runtimeClientError'] as Map<String, dynamic>)
          : null,
      validationException: json['validationException'] != null
          ? ValidationException.fromJson(
              json['validationException'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contentBlockDelta = this.contentBlockDelta;
    final contentBlockStart = this.contentBlockStart;
    final contentBlockStop = this.contentBlockStop;
    final internalServerException = this.internalServerException;
    final messageStart = this.messageStart;
    final messageStop = this.messageStop;
    final metadata = this.metadata;
    final runtimeClientError = this.runtimeClientError;
    final validationException = this.validationException;
    return {
      if (contentBlockDelta != null) 'contentBlockDelta': contentBlockDelta,
      if (contentBlockStart != null) 'contentBlockStart': contentBlockStart,
      if (contentBlockStop != null) 'contentBlockStop': contentBlockStop,
      if (internalServerException != null)
        'internalServerException': internalServerException,
      if (messageStart != null) 'messageStart': messageStart,
      if (messageStop != null) 'messageStop': messageStop,
      if (metadata != null) 'metadata': metadata,
      if (runtimeClientError != null) 'runtimeClientError': runtimeClientError,
      if (validationException != null)
        'validationException': validationException,
    };
  }
}

/// Event indicating the start of a message.
///
/// @nodoc
class HarnessMessageStartEvent {
  /// The role of the message sender.
  final HarnessConversationRole role;

  HarnessMessageStartEvent({
    required this.role,
  });

  factory HarnessMessageStartEvent.fromJson(Map<String, dynamic> json) {
    return HarnessMessageStartEvent(
      role: HarnessConversationRole.fromString((json['role'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final role = this.role;
    return {
      'role': role.value,
    };
  }
}

/// Event indicating the start of a content block.
///
/// @nodoc
class HarnessContentBlockStartEvent {
  /// The index of the content block within the message.
  final int contentBlockIndex;

  /// The content block start payload.
  final HarnessContentBlockStart start;

  HarnessContentBlockStartEvent({
    required this.contentBlockIndex,
    required this.start,
  });

  factory HarnessContentBlockStartEvent.fromJson(Map<String, dynamic> json) {
    return HarnessContentBlockStartEvent(
      contentBlockIndex: (json['contentBlockIndex'] as int?) ?? 0,
      start: HarnessContentBlockStart.fromJson(
          (json['start'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final contentBlockIndex = this.contentBlockIndex;
    final start = this.start;
    return {
      'contentBlockIndex': contentBlockIndex,
      'start': start,
    };
  }
}

/// Event containing a delta update to a content block.
///
/// @nodoc
class HarnessContentBlockDeltaEvent {
  /// The index of the content block being updated.
  final int contentBlockIndex;

  /// The delta payload.
  final HarnessContentBlockDelta delta;

  HarnessContentBlockDeltaEvent({
    required this.contentBlockIndex,
    required this.delta,
  });

  factory HarnessContentBlockDeltaEvent.fromJson(Map<String, dynamic> json) {
    return HarnessContentBlockDeltaEvent(
      contentBlockIndex: (json['contentBlockIndex'] as int?) ?? 0,
      delta: HarnessContentBlockDelta.fromJson(
          (json['delta'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final contentBlockIndex = this.contentBlockIndex;
    final delta = this.delta;
    return {
      'contentBlockIndex': contentBlockIndex,
      'delta': delta,
    };
  }
}

/// Event indicating the end of a content block.
///
/// @nodoc
class HarnessContentBlockStopEvent {
  /// The index of the content block that ended.
  final int contentBlockIndex;

  HarnessContentBlockStopEvent({
    required this.contentBlockIndex,
  });

  factory HarnessContentBlockStopEvent.fromJson(Map<String, dynamic> json) {
    return HarnessContentBlockStopEvent(
      contentBlockIndex: (json['contentBlockIndex'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final contentBlockIndex = this.contentBlockIndex;
    return {
      'contentBlockIndex': contentBlockIndex,
    };
  }
}

/// Event indicating the end of a message.
///
/// @nodoc
class HarnessMessageStopEvent {
  /// The reason the agent stopped generating.
  final HarnessStopReason stopReason;

  HarnessMessageStopEvent({
    required this.stopReason,
  });

  factory HarnessMessageStopEvent.fromJson(Map<String, dynamic> json) {
    return HarnessMessageStopEvent(
      stopReason:
          HarnessStopReason.fromString((json['stopReason'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final stopReason = this.stopReason;
    return {
      'stopReason': stopReason.value,
    };
  }
}

/// Token usage and latency metrics for the invocation.
///
/// @nodoc
class HarnessMetadataEvent {
  /// Latency metrics.
  final HarnessStreamMetrics metrics;

  /// Token usage counts.
  final HarnessTokenUsage usage;

  HarnessMetadataEvent({
    required this.metrics,
    required this.usage,
  });

  factory HarnessMetadataEvent.fromJson(Map<String, dynamic> json) {
    return HarnessMetadataEvent(
      metrics: HarnessStreamMetrics.fromJson(
          (json['metrics'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      usage: HarnessTokenUsage.fromJson(
          (json['usage'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final metrics = this.metrics;
    final usage = this.usage;
    return {
      'metrics': metrics,
      'usage': usage,
    };
  }
}

/// Token usage counts for the invocation.
///
/// @nodoc
class HarnessTokenUsage {
  /// The number of input tokens consumed.
  final int inputTokens;

  /// The number of output tokens generated.
  final int outputTokens;

  /// The total number of tokens consumed.
  final int totalTokens;

  /// The number of input tokens read from cache.
  final int? cacheReadInputTokens;

  /// The number of input tokens written to cache.
  final int? cacheWriteInputTokens;

  HarnessTokenUsage({
    required this.inputTokens,
    required this.outputTokens,
    required this.totalTokens,
    this.cacheReadInputTokens,
    this.cacheWriteInputTokens,
  });

  factory HarnessTokenUsage.fromJson(Map<String, dynamic> json) {
    return HarnessTokenUsage(
      inputTokens: (json['inputTokens'] as int?) ?? 0,
      outputTokens: (json['outputTokens'] as int?) ?? 0,
      totalTokens: (json['totalTokens'] as int?) ?? 0,
      cacheReadInputTokens: json['cacheReadInputTokens'] as int?,
      cacheWriteInputTokens: json['cacheWriteInputTokens'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputTokens = this.inputTokens;
    final outputTokens = this.outputTokens;
    final totalTokens = this.totalTokens;
    final cacheReadInputTokens = this.cacheReadInputTokens;
    final cacheWriteInputTokens = this.cacheWriteInputTokens;
    return {
      'inputTokens': inputTokens,
      'outputTokens': outputTokens,
      'totalTokens': totalTokens,
      if (cacheReadInputTokens != null)
        'cacheReadInputTokens': cacheReadInputTokens,
      if (cacheWriteInputTokens != null)
        'cacheWriteInputTokens': cacheWriteInputTokens,
    };
  }
}

/// Latency metrics for the invocation.
///
/// @nodoc
class HarnessStreamMetrics {
  /// The end-to-end latency of the invocation in milliseconds.
  final int latencyMs;

  HarnessStreamMetrics({
    required this.latencyMs,
  });

  factory HarnessStreamMetrics.fromJson(Map<String, dynamic> json) {
    return HarnessStreamMetrics(
      latencyMs: (json['latencyMs'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final latencyMs = this.latencyMs;
    return {
      'latencyMs': latencyMs,
    };
  }
}

/// @nodoc
class HarnessStopReason {
  static const endTurn = HarnessStopReason._('end_turn');
  static const toolUse = HarnessStopReason._('tool_use');
  static const toolResult = HarnessStopReason._('tool_result');
  static const maxTokens = HarnessStopReason._('max_tokens');
  static const stopSequence = HarnessStopReason._('stop_sequence');
  static const contentFiltered = HarnessStopReason._('content_filtered');
  static const malformedModelOutput =
      HarnessStopReason._('malformed_model_output');
  static const malformedToolUse = HarnessStopReason._('malformed_tool_use');
  static const interrupted = HarnessStopReason._('interrupted');
  static const partialTurn = HarnessStopReason._('partial_turn');
  static const modelContextWindowExceeded =
      HarnessStopReason._('model_context_window_exceeded');
  static const maxIterationsExceeded =
      HarnessStopReason._('max_iterations_exceeded');
  static const maxOutputTokensExceeded =
      HarnessStopReason._('max_output_tokens_exceeded');
  static const timeoutExceeded = HarnessStopReason._('timeout_exceeded');

  final String value;

  const HarnessStopReason._(this.value);

  static const values = [
    endTurn,
    toolUse,
    toolResult,
    maxTokens,
    stopSequence,
    contentFiltered,
    malformedModelOutput,
    malformedToolUse,
    interrupted,
    partialTurn,
    modelContextWindowExceeded,
    maxIterationsExceeded,
    maxOutputTokensExceeded,
    timeoutExceeded
  ];

  static HarnessStopReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HarnessStopReason._(value));

  @override
  bool operator ==(other) => other is HarnessStopReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A delta update to a content block.
///
/// @nodoc
class HarnessContentBlockDelta {
  /// A reasoning content delta.
  final HarnessReasoningContentBlockDelta? reasoningContent;

  /// A text delta.
  final String? text;

  /// A tool result delta.
  final List<HarnessToolResultBlockDelta>? toolResult;

  /// A tool use input delta.
  final HarnessToolUseBlockDelta? toolUse;

  HarnessContentBlockDelta({
    this.reasoningContent,
    this.text,
    this.toolResult,
    this.toolUse,
  });

  factory HarnessContentBlockDelta.fromJson(Map<String, dynamic> json) {
    return HarnessContentBlockDelta(
      reasoningContent: json['reasoningContent'] != null
          ? HarnessReasoningContentBlockDelta.fromJson(
              json['reasoningContent'] as Map<String, dynamic>)
          : null,
      text: json['text'] as String?,
      toolResult: (json['toolResult'] as List?)
          ?.nonNulls
          .map((e) =>
              HarnessToolResultBlockDelta.fromJson(e as Map<String, dynamic>))
          .toList(),
      toolUse: json['toolUse'] != null
          ? HarnessToolUseBlockDelta.fromJson(
              json['toolUse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final reasoningContent = this.reasoningContent;
    final text = this.text;
    final toolResult = this.toolResult;
    final toolUse = this.toolUse;
    return {
      if (reasoningContent != null) 'reasoningContent': reasoningContent,
      if (text != null) 'text': text,
      if (toolResult != null) 'toolResult': toolResult,
      if (toolUse != null) 'toolUse': toolUse,
    };
  }
}

/// Delta payload for tool use input.
///
/// @nodoc
class HarnessToolUseBlockDelta {
  /// The partial JSON input for the tool call.
  final String input;

  HarnessToolUseBlockDelta({
    required this.input,
  });

  factory HarnessToolUseBlockDelta.fromJson(Map<String, dynamic> json) {
    return HarnessToolUseBlockDelta(
      input: (json['input'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final input = this.input;
    return {
      'input': input,
    };
  }
}

/// A delta update to a reasoning content block.
///
/// @nodoc
class HarnessReasoningContentBlockDelta {
  /// Redacted reasoning content.
  final Uint8List? redactedContent;

  /// Signature for the reasoning content.
  final String? signature;

  /// Reasoning text delta.
  final String? text;

  HarnessReasoningContentBlockDelta({
    this.redactedContent,
    this.signature,
    this.text,
  });

  factory HarnessReasoningContentBlockDelta.fromJson(
      Map<String, dynamic> json) {
    return HarnessReasoningContentBlockDelta(
      redactedContent:
          _s.decodeNullableUint8List(json['redactedContent'] as String?),
      signature: json['signature'] as String?,
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final redactedContent = this.redactedContent;
    final signature = this.signature;
    final text = this.text;
    return {
      if (redactedContent != null)
        'redactedContent': base64Encode(redactedContent),
      if (signature != null) 'signature': signature,
      if (text != null) 'text': text,
    };
  }
}

/// A delta update to a tool result content block.
///
/// @nodoc
class HarnessToolResultBlockDelta {
  /// A JSON tool result delta.
  final Object? json;

  /// A text tool result delta.
  final String? text;

  HarnessToolResultBlockDelta({
    this.json,
    this.text,
  });

  factory HarnessToolResultBlockDelta.fromJson(Map<String, dynamic> json) {
    return HarnessToolResultBlockDelta(
      json: json['json'],
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final json = this.json;
    final text = this.text;
    return {
      if (json != null) 'json': json,
      if (text != null) 'text': text,
    };
  }
}

/// The start payload for a content block.
///
/// @nodoc
class HarnessContentBlockStart {
  /// Start of a tool result content block.
  final HarnessToolResultBlockStart? toolResult;

  /// Start of a tool use content block.
  final HarnessToolUseBlockStart? toolUse;

  HarnessContentBlockStart({
    this.toolResult,
    this.toolUse,
  });

  factory HarnessContentBlockStart.fromJson(Map<String, dynamic> json) {
    return HarnessContentBlockStart(
      toolResult: json['toolResult'] != null
          ? HarnessToolResultBlockStart.fromJson(
              json['toolResult'] as Map<String, dynamic>)
          : null,
      toolUse: json['toolUse'] != null
          ? HarnessToolUseBlockStart.fromJson(
              json['toolUse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final toolResult = this.toolResult;
    final toolUse = this.toolUse;
    return {
      if (toolResult != null) 'toolResult': toolResult,
      if (toolUse != null) 'toolUse': toolUse,
    };
  }
}

/// Start payload for a tool use content block.
///
/// @nodoc
class HarnessToolUseBlockStart {
  /// The name of the tool being called.
  final String name;

  /// The unique ID of this tool use.
  final String toolUseId;

  /// The name of the MCP server providing this tool.
  final String? serverName;

  /// The type of tool use.
  final HarnessToolUseType? type;

  HarnessToolUseBlockStart({
    required this.name,
    required this.toolUseId,
    this.serverName,
    this.type,
  });

  factory HarnessToolUseBlockStart.fromJson(Map<String, dynamic> json) {
    return HarnessToolUseBlockStart(
      name: (json['name'] as String?) ?? '',
      toolUseId: (json['toolUseId'] as String?) ?? '',
      serverName: json['serverName'] as String?,
      type: (json['type'] as String?)?.let(HarnessToolUseType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final toolUseId = this.toolUseId;
    final serverName = this.serverName;
    final type = this.type;
    return {
      'name': name,
      'toolUseId': toolUseId,
      if (serverName != null) 'serverName': serverName,
      if (type != null) 'type': type.value,
    };
  }
}

/// Start payload for a tool result content block.
///
/// @nodoc
class HarnessToolResultBlockStart {
  /// The tool use ID that this result corresponds to.
  final String toolUseId;

  /// The status of the tool execution.
  final HarnessToolUseStatus? status;

  HarnessToolResultBlockStart({
    required this.toolUseId,
    this.status,
  });

  factory HarnessToolResultBlockStart.fromJson(Map<String, dynamic> json) {
    return HarnessToolResultBlockStart(
      toolUseId: (json['toolUseId'] as String?) ?? '',
      status: (json['status'] as String?)?.let(HarnessToolUseStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final toolUseId = this.toolUseId;
    final status = this.status;
    return {
      'toolUseId': toolUseId,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class HarnessToolUseStatus {
  static const success = HarnessToolUseStatus._('success');
  static const error = HarnessToolUseStatus._('error');

  final String value;

  const HarnessToolUseStatus._(this.value);

  static const values = [success, error];

  static HarnessToolUseStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HarnessToolUseStatus._(value));

  @override
  bool operator ==(other) =>
      other is HarnessToolUseStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class HarnessToolUseType {
  static const toolUse = HarnessToolUseType._('tool_use');
  static const serverToolUse = HarnessToolUseType._('server_tool_use');
  static const mcpToolUse = HarnessToolUseType._('mcp_tool_use');

  final String value;

  const HarnessToolUseType._(this.value);

  static const values = [toolUse, serverToolUse, mcpToolUse];

  static HarnessToolUseType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HarnessToolUseType._(value));

  @override
  bool operator ==(other) =>
      other is HarnessToolUseType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class HarnessConversationRole {
  static const user = HarnessConversationRole._('user');
  static const assistant = HarnessConversationRole._('assistant');

  final String value;

  const HarnessConversationRole._(this.value);

  static const values = [user, assistant];

  static HarnessConversationRole fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HarnessConversationRole._(value));

  @override
  bool operator ==(other) =>
      other is HarnessConversationRole && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specification of which model to use.
///
/// @nodoc
class HarnessModelConfiguration {
  /// Configuration for an Amazon Bedrock model.
  final HarnessBedrockModelConfig? bedrockModelConfig;

  /// Configuration for a Google Gemini model.
  final HarnessGeminiModelConfig? geminiModelConfig;

  /// The LiteLLM model configuration for connecting to third-party model
  /// providers.
  final HarnessLiteLlmModelConfig? liteLlmModelConfig;

  /// Configuration for an OpenAI model.
  final HarnessOpenAiModelConfig? openAiModelConfig;

  HarnessModelConfiguration({
    this.bedrockModelConfig,
    this.geminiModelConfig,
    this.liteLlmModelConfig,
    this.openAiModelConfig,
  });

  Map<String, dynamic> toJson() {
    final bedrockModelConfig = this.bedrockModelConfig;
    final geminiModelConfig = this.geminiModelConfig;
    final liteLlmModelConfig = this.liteLlmModelConfig;
    final openAiModelConfig = this.openAiModelConfig;
    return {
      if (bedrockModelConfig != null) 'bedrockModelConfig': bedrockModelConfig,
      if (geminiModelConfig != null) 'geminiModelConfig': geminiModelConfig,
      if (liteLlmModelConfig != null) 'liteLlmModelConfig': liteLlmModelConfig,
      if (openAiModelConfig != null) 'openAiModelConfig': openAiModelConfig,
    };
  }
}

/// A skill available to the agent.
///
/// @nodoc
class HarnessSkill {
  /// A git repository containing the skill.
  final HarnessSkillGitSource? git;

  /// The filesystem path to the skill definition.
  final String? path;

  /// An S3 source containing the skill.
  final HarnessSkillS3Source? s3;

  HarnessSkill({
    this.git,
    this.path,
    this.s3,
  });

  Map<String, dynamic> toJson() {
    final git = this.git;
    final path = this.path;
    final s3 = this.s3;
    return {
      if (git != null) 'git': git,
      if (path != null) 'path': path,
      if (s3 != null) 's3': s3,
    };
  }
}

/// An S3 source for a skill.
///
/// @nodoc
class HarnessSkillS3Source {
  /// The S3 URI pointing to the skill directory (e.g.,
  /// s3://bucket/skills/my-skill/).
  final String uri;

  HarnessSkillS3Source({
    required this.uri,
  });

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    return {
      'uri': uri,
    };
  }
}

/// A git repository source for a skill.
///
/// @nodoc
class HarnessSkillGitSource {
  /// The HTTPS URL of the git repository.
  final String url;

  /// Authentication configuration for private repositories.
  final HarnessSkillGitAuth? auth;

  /// Subdirectory within the repository containing the skill.
  final String? path;

  HarnessSkillGitSource({
    required this.url,
    this.auth,
    this.path,
  });

  Map<String, dynamic> toJson() {
    final url = this.url;
    final auth = this.auth;
    final path = this.path;
    return {
      'url': url,
      if (auth != null) 'auth': auth,
      if (path != null) 'path': path,
    };
  }
}

/// Authentication configuration for accessing a private git repository.
///
/// @nodoc
class HarnessSkillGitAuth {
  /// The ARN of the credential in AgentCore Identity containing the password or
  /// personal access token.
  final String credentialArn;

  /// Username for authentication. Defaults to 'oauth2' if not specified.
  final String? username;

  HarnessSkillGitAuth({
    required this.credentialArn,
    this.username,
  });

  Map<String, dynamic> toJson() {
    final credentialArn = this.credentialArn;
    final username = this.username;
    return {
      'credentialArn': credentialArn,
      if (username != null) 'username': username,
    };
  }
}

/// A tool available to the agent loop.
///
/// @nodoc
class HarnessTool {
  /// The type of tool.
  final HarnessToolType type;

  /// Tool-specific configuration.
  final HarnessToolConfiguration? config;

  /// Unique name for the tool. If not provided, a name will be inferred or
  /// generated.
  final String? name;

  HarnessTool({
    required this.type,
    this.config,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final type = this.type;
    final config = this.config;
    final name = this.name;
    return {
      'type': type.value,
      if (config != null) 'config': config,
      if (name != null) 'name': name,
    };
  }
}

/// @nodoc
class HarnessToolType {
  static const remoteMcp = HarnessToolType._('remote_mcp');
  static const agentcoreBrowser = HarnessToolType._('agentcore_browser');
  static const agentcoreGateway = HarnessToolType._('agentcore_gateway');
  static const inlineFunction = HarnessToolType._('inline_function');
  static const agentcoreCodeInterpreter =
      HarnessToolType._('agentcore_code_interpreter');

  final String value;

  const HarnessToolType._(this.value);

  static const values = [
    remoteMcp,
    agentcoreBrowser,
    agentcoreGateway,
    inlineFunction,
    agentcoreCodeInterpreter
  ];

  static HarnessToolType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HarnessToolType._(value));

  @override
  bool operator ==(other) => other is HarnessToolType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration union for different tool types.
///
/// @nodoc
class HarnessToolConfiguration {
  /// Configuration for AgentCore Browser.
  final HarnessAgentCoreBrowserConfig? agentCoreBrowser;

  /// Configuration for AgentCore Code Interpreter.
  final HarnessAgentCoreCodeInterpreterConfig? agentCoreCodeInterpreter;

  /// Configuration for AgentCore Gateway.
  final HarnessAgentCoreGatewayConfig? agentCoreGateway;

  /// Configuration for an inline function tool.
  final HarnessInlineFunctionConfig? inlineFunction;

  /// Configuration for remote MCP server.
  final HarnessRemoteMcpConfig? remoteMcp;

  HarnessToolConfiguration({
    this.agentCoreBrowser,
    this.agentCoreCodeInterpreter,
    this.agentCoreGateway,
    this.inlineFunction,
    this.remoteMcp,
  });

  Map<String, dynamic> toJson() {
    final agentCoreBrowser = this.agentCoreBrowser;
    final agentCoreCodeInterpreter = this.agentCoreCodeInterpreter;
    final agentCoreGateway = this.agentCoreGateway;
    final inlineFunction = this.inlineFunction;
    final remoteMcp = this.remoteMcp;
    return {
      if (agentCoreBrowser != null) 'agentCoreBrowser': agentCoreBrowser,
      if (agentCoreCodeInterpreter != null)
        'agentCoreCodeInterpreter': agentCoreCodeInterpreter,
      if (agentCoreGateway != null) 'agentCoreGateway': agentCoreGateway,
      if (inlineFunction != null) 'inlineFunction': inlineFunction,
      if (remoteMcp != null) 'remoteMcp': remoteMcp,
    };
  }
}

/// Configuration for connecting to a remote MCP server.
///
/// @nodoc
class HarnessRemoteMcpConfig {
  /// URL of the MCP endpoint.
  final String url;

  /// Custom headers to include when connecting to the remote MCP server.
  final Map<String, String>? headers;

  HarnessRemoteMcpConfig({
    required this.url,
    this.headers,
  });

  Map<String, dynamic> toJson() {
    final url = this.url;
    final headers = this.headers;
    return {
      'url': url,
      if (headers != null) 'headers': headers,
    };
  }
}

/// Configuration for AgentCore Browser.
///
/// @nodoc
class HarnessAgentCoreBrowserConfig {
  /// If not populated, the built-in Browser ARN is used.
  final String? browserArn;

  HarnessAgentCoreBrowserConfig({
    this.browserArn,
  });

  Map<String, dynamic> toJson() {
    final browserArn = this.browserArn;
    return {
      if (browserArn != null) 'browserArn': browserArn,
    };
  }
}

/// Configuration for AgentCore Gateway.
///
/// @nodoc
class HarnessAgentCoreGatewayConfig {
  /// The ARN of the desired AgentCore Gateway.
  final String gatewayArn;

  /// How harness authenticates to this Gateway. Defaults to AWS_IAM (SigV4) if
  /// omitted.
  final HarnessGatewayOutboundAuth? outboundAuth;

  HarnessAgentCoreGatewayConfig({
    required this.gatewayArn,
    this.outboundAuth,
  });

  Map<String, dynamic> toJson() {
    final gatewayArn = this.gatewayArn;
    final outboundAuth = this.outboundAuth;
    return {
      'gatewayArn': gatewayArn,
      if (outboundAuth != null) 'outboundAuth': outboundAuth,
    };
  }
}

/// Configuration for an inline function tool. When the agent calls this tool,
/// the tool call is returned to the caller for external execution.
///
/// @nodoc
class HarnessInlineFunctionConfig {
  /// Description of what the tool does, provided to the model.
  final String description;

  /// JSON Schema describing the tool's input parameters.
  final Object inputSchema;

  HarnessInlineFunctionConfig({
    required this.description,
    required this.inputSchema,
  });

  Map<String, dynamic> toJson() {
    final description = this.description;
    final inputSchema = this.inputSchema;
    return {
      'description': description,
      'inputSchema': inputSchema,
    };
  }
}

/// Configuration for AgentCore Code Interpreter.
///
/// @nodoc
class HarnessAgentCoreCodeInterpreterConfig {
  /// If not populated, the built-in Code Interpreter ARN is used.
  final String? codeInterpreterArn;

  HarnessAgentCoreCodeInterpreterConfig({
    this.codeInterpreterArn,
  });

  Map<String, dynamic> toJson() {
    final codeInterpreterArn = this.codeInterpreterArn;
    return {
      if (codeInterpreterArn != null) 'codeInterpreterArn': codeInterpreterArn,
    };
  }
}

/// Authentication method for calling a Gateway.
///
/// @nodoc
class HarnessGatewayOutboundAuth {
  /// SigV4-sign requests using the agent's execution role.
  final Unit? awsIam;

  /// No authentication.
  final Unit? none;

  /// OAuth 2.0 authentication via AgentCore Identity.
  final OAuthCredentialProvider? oauth;

  HarnessGatewayOutboundAuth({
    this.awsIam,
    this.none,
    this.oauth,
  });

  Map<String, dynamic> toJson() {
    final awsIam = this.awsIam;
    final none = this.none;
    final oauth = this.oauth;
    return {
      if (awsIam != null) 'awsIam': awsIam,
      if (none != null) 'none': none,
      if (oauth != null) 'oauth': oauth,
    };
  }
}

/// Configuration for an OAuth 2.0 credential provider used to authenticate tool
/// calls.
///
/// @nodoc
class OAuthCredentialProvider {
  /// The ARN of the OAuth 2.0 credential provider in AgentCore Identity.
  final String providerArn;

  /// The OAuth 2.0 scopes to request when obtaining an access token.
  final List<String> scopes;

  /// Additional custom parameters to include in the OAuth 2.0 token request.
  final Map<String, String>? customParameters;

  /// The default return URL for the OAuth 2.0 authorization flow.
  final String? defaultReturnUrl;

  /// The OAuth 2.0 grant type to use for authentication.
  final OAuthGrantType? grantType;

  OAuthCredentialProvider({
    required this.providerArn,
    required this.scopes,
    this.customParameters,
    this.defaultReturnUrl,
    this.grantType,
  });

  Map<String, dynamic> toJson() {
    final providerArn = this.providerArn;
    final scopes = this.scopes;
    final customParameters = this.customParameters;
    final defaultReturnUrl = this.defaultReturnUrl;
    final grantType = this.grantType;
    return {
      'providerArn': providerArn,
      'scopes': scopes,
      if (customParameters != null) 'customParameters': customParameters,
      if (defaultReturnUrl != null) 'defaultReturnUrl': defaultReturnUrl,
      if (grantType != null) 'grantType': grantType.value,
    };
  }
}

/// @nodoc
class OAuthGrantType {
  static const clientCredentials = OAuthGrantType._('CLIENT_CREDENTIALS');
  static const authorizationCode = OAuthGrantType._('AUTHORIZATION_CODE');
  static const tokenExchange = OAuthGrantType._('TOKEN_EXCHANGE');

  final String value;

  const OAuthGrantType._(this.value);

  static const values = [clientCredentials, authorizationCode, tokenExchange];

  static OAuthGrantType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OAuthGrantType._(value));

  @override
  bool operator ==(other) => other is OAuthGrantType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A content block in the system prompt.
///
/// @nodoc
class HarnessSystemContentBlock {
  /// The text content of the system prompt block.
  final String? text;

  HarnessSystemContentBlock({
    this.text,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      if (text != null) 'text': text,
    };
  }
}

/// Configuration for an Amazon Bedrock model provider.
///
/// @nodoc
class HarnessBedrockModelConfig {
  /// The Bedrock model ID.
  final String modelId;

  /// Provider-specific parameters passed through to the model provider unchanged.
  final Document? additionalParams;

  /// The API format to use when calling the Bedrock provider.
  final HarnessBedrockApiFormat? apiFormat;

  /// The maximum number of tokens to allow in the generated response per
  /// iteration.
  final int? maxTokens;

  /// The temperature to set when calling the model.
  final double? temperature;

  /// The topP set when calling the model.
  final double? topP;

  HarnessBedrockModelConfig({
    required this.modelId,
    this.additionalParams,
    this.apiFormat,
    this.maxTokens,
    this.temperature,
    this.topP,
  });

  Map<String, dynamic> toJson() {
    final modelId = this.modelId;
    final additionalParams = this.additionalParams;
    final apiFormat = this.apiFormat;
    final maxTokens = this.maxTokens;
    final temperature = this.temperature;
    final topP = this.topP;
    return {
      'modelId': modelId,
      if (additionalParams != null) 'additionalParams': additionalParams,
      if (apiFormat != null) 'apiFormat': apiFormat.value,
      if (maxTokens != null) 'maxTokens': maxTokens,
      if (temperature != null) 'temperature': temperature,
      if (topP != null) 'topP': topP,
    };
  }
}

/// Configuration for an OpenAI model provider. Requires an API key stored in
/// AgentCore Identity.
///
/// @nodoc
class HarnessOpenAiModelConfig {
  /// The ARN of your OpenAI API key on AgentCore Identity.
  final String apiKeyArn;

  /// The OpenAI model ID.
  final String modelId;

  /// Provider-specific parameters passed through to the model provider unchanged.
  final Document? additionalParams;

  /// The API format to use when calling the OpenAI provider.
  final HarnessOpenAiApiFormat? apiFormat;

  /// The maximum number of tokens to allow in the generated response per
  /// iteration.
  final int? maxTokens;

  /// The temperature to set when calling the model.
  final double? temperature;

  /// The topP set when calling the model.
  final double? topP;

  HarnessOpenAiModelConfig({
    required this.apiKeyArn,
    required this.modelId,
    this.additionalParams,
    this.apiFormat,
    this.maxTokens,
    this.temperature,
    this.topP,
  });

  Map<String, dynamic> toJson() {
    final apiKeyArn = this.apiKeyArn;
    final modelId = this.modelId;
    final additionalParams = this.additionalParams;
    final apiFormat = this.apiFormat;
    final maxTokens = this.maxTokens;
    final temperature = this.temperature;
    final topP = this.topP;
    return {
      'apiKeyArn': apiKeyArn,
      'modelId': modelId,
      if (additionalParams != null) 'additionalParams': additionalParams,
      if (apiFormat != null) 'apiFormat': apiFormat.value,
      if (maxTokens != null) 'maxTokens': maxTokens,
      if (temperature != null) 'temperature': temperature,
      if (topP != null) 'topP': topP,
    };
  }
}

/// Configuration for a Google Gemini model provider. Requires an API key stored
/// in AgentCore Identity.
///
/// @nodoc
class HarnessGeminiModelConfig {
  /// The ARN of your Gemini API key on AgentCore Identity.
  final String apiKeyArn;

  /// The Gemini model ID.
  final String modelId;

  /// The maximum number of tokens to allow in the generated response per
  /// iteration.
  final int? maxTokens;

  /// The temperature to set when calling the model.
  final double? temperature;

  /// The topK set when calling the model.
  final int? topK;

  /// The topP set when calling the model.
  final double? topP;

  HarnessGeminiModelConfig({
    required this.apiKeyArn,
    required this.modelId,
    this.maxTokens,
    this.temperature,
    this.topK,
    this.topP,
  });

  Map<String, dynamic> toJson() {
    final apiKeyArn = this.apiKeyArn;
    final modelId = this.modelId;
    final maxTokens = this.maxTokens;
    final temperature = this.temperature;
    final topK = this.topK;
    final topP = this.topP;
    return {
      'apiKeyArn': apiKeyArn,
      'modelId': modelId,
      if (maxTokens != null) 'maxTokens': maxTokens,
      if (temperature != null) 'temperature': temperature,
      if (topK != null) 'topK': topK,
      if (topP != null) 'topP': topP,
    };
  }
}

/// Configuration for a LiteLLM model provider, enabling connection to
/// third-party model providers.
///
/// @nodoc
class HarnessLiteLlmModelConfig {
  /// The LiteLLM model identifier (e.g., "anthropic/claude-3-sonnet").
  final String modelId;

  /// Provider-specific parameters passed through to the model provider unchanged.
  final Document? additionalParams;

  /// The base URL for the model provider's API endpoint.
  final String? apiBase;

  /// The ARN of the API key in AgentCore Identity for authenticating with the
  /// model provider.
  final String? apiKeyArn;

  /// The maximum number of tokens to allow in the generated response per
  /// iteration.
  final int? maxTokens;

  /// The temperature to set when calling the model.
  final double? temperature;

  /// The topP set when calling the model.
  final double? topP;

  HarnessLiteLlmModelConfig({
    required this.modelId,
    this.additionalParams,
    this.apiBase,
    this.apiKeyArn,
    this.maxTokens,
    this.temperature,
    this.topP,
  });

  Map<String, dynamic> toJson() {
    final modelId = this.modelId;
    final additionalParams = this.additionalParams;
    final apiBase = this.apiBase;
    final apiKeyArn = this.apiKeyArn;
    final maxTokens = this.maxTokens;
    final temperature = this.temperature;
    final topP = this.topP;
    return {
      'modelId': modelId,
      if (additionalParams != null) 'additionalParams': additionalParams,
      if (apiBase != null) 'apiBase': apiBase,
      if (apiKeyArn != null) 'apiKeyArn': apiKeyArn,
      if (maxTokens != null) 'maxTokens': maxTokens,
      if (temperature != null) 'temperature': temperature,
      if (topP != null) 'topP': topP,
    };
  }
}

/// @nodoc
class HarnessOpenAiApiFormat {
  static const chatCompletions = HarnessOpenAiApiFormat._('chat_completions');
  static const responses = HarnessOpenAiApiFormat._('responses');

  final String value;

  const HarnessOpenAiApiFormat._(this.value);

  static const values = [chatCompletions, responses];

  static HarnessOpenAiApiFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HarnessOpenAiApiFormat._(value));

  @override
  bool operator ==(other) =>
      other is HarnessOpenAiApiFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class HarnessBedrockApiFormat {
  static const converseStream = HarnessBedrockApiFormat._('converse_stream');
  static const responses = HarnessBedrockApiFormat._('responses');
  static const chatCompletions = HarnessBedrockApiFormat._('chat_completions');

  final String value;

  const HarnessBedrockApiFormat._(this.value);

  static const values = [converseStream, responses, chatCompletions];

  static HarnessBedrockApiFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HarnessBedrockApiFormat._(value));

  @override
  bool operator ==(other) =>
      other is HarnessBedrockApiFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A message in the conversation.
///
/// @nodoc
class HarnessMessage {
  /// The content blocks of the message.
  final List<HarnessContentBlock> content;

  /// The role of the message sender.
  final HarnessConversationRole role;

  HarnessMessage({
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

/// A content block within a message.
///
/// @nodoc
class HarnessContentBlock {
  /// Model reasoning content.
  final HarnessReasoningContentBlock? reasoningContent;

  /// Text content.
  final String? text;

  /// A tool execution result.
  final HarnessToolResultBlock? toolResult;

  /// A tool use request from the model.
  final HarnessToolUseBlock? toolUse;

  HarnessContentBlock({
    this.reasoningContent,
    this.text,
    this.toolResult,
    this.toolUse,
  });

  Map<String, dynamic> toJson() {
    final reasoningContent = this.reasoningContent;
    final text = this.text;
    final toolResult = this.toolResult;
    final toolUse = this.toolUse;
    return {
      if (reasoningContent != null) 'reasoningContent': reasoningContent,
      if (text != null) 'text': text,
      if (toolResult != null) 'toolResult': toolResult,
      if (toolUse != null) 'toolUse': toolUse,
    };
  }
}

/// A tool use request from the model.
///
/// @nodoc
class HarnessToolUseBlock {
  /// The JSON input to pass to the tool.
  final Object input;

  /// The name of the tool to call.
  final String name;

  /// The unique ID of this tool use.
  final String toolUseId;

  /// The name of the MCP server providing this tool.
  final String? serverName;

  /// The type of tool use.
  final HarnessToolUseType? type;

  HarnessToolUseBlock({
    required this.input,
    required this.name,
    required this.toolUseId,
    this.serverName,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final input = this.input;
    final name = this.name;
    final toolUseId = this.toolUseId;
    final serverName = this.serverName;
    final type = this.type;
    return {
      'input': input,
      'name': name,
      'toolUseId': toolUseId,
      if (serverName != null) 'serverName': serverName,
      if (type != null) 'type': type.value,
    };
  }
}

/// The result of a tool execution.
///
/// @nodoc
class HarnessToolResultBlock {
  /// The content of the tool result.
  final List<HarnessToolResultContentBlock> content;

  /// The tool use ID that this result corresponds to.
  final String toolUseId;

  /// The status of the tool execution.
  final HarnessToolUseStatus? status;

  /// The type of tool use that produced this result.
  final HarnessToolUseType? type;

  HarnessToolResultBlock({
    required this.content,
    required this.toolUseId,
    this.status,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final content = this.content;
    final toolUseId = this.toolUseId;
    final status = this.status;
    final type = this.type;
    return {
      'content': content,
      'toolUseId': toolUseId,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
    };
  }
}

/// Reasoning content from the model.
///
/// @nodoc
class HarnessReasoningContentBlock {
  /// The reasoning text.
  final HarnessReasoningTextBlock? reasoningText;

  /// Redacted reasoning content.
  final Uint8List? redactedContent;

  HarnessReasoningContentBlock({
    this.reasoningText,
    this.redactedContent,
  });

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

/// A block of reasoning text from the model.
///
/// @nodoc
class HarnessReasoningTextBlock {
  /// The reasoning text.
  final String text;

  /// Signature for verifying the reasoning content.
  final String? signature;

  HarnessReasoningTextBlock({
    required this.text,
    this.signature,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    final signature = this.signature;
    return {
      'text': text,
      if (signature != null) 'signature': signature,
    };
  }
}

/// A content block within a tool result.
///
/// @nodoc
class HarnessToolResultContentBlock {
  /// JSON content.
  final Object? json;

  /// Text content.
  final String? text;

  HarnessToolResultContentBlock({
    this.json,
    this.text,
  });

  Map<String, dynamic> toJson() {
    final json = this.json;
    final text = this.text;
    return {
      if (json != null) 'json': json,
      if (text != null) 'text': text,
    };
  }
}

/// Contains output from a code interpreter stream.
///
/// @nodoc
class CodeInterpreterStreamOutput {
  final AccessDeniedException? accessDeniedException;
  final ConflictException? conflictException;
  final InternalServerException? internalServerException;
  final ResourceNotFoundException? resourceNotFoundException;
  final CodeInterpreterResult? result;
  final ServiceQuotaExceededException? serviceQuotaExceededException;
  final ThrottlingException? throttlingException;
  final ValidationException? validationException;

  CodeInterpreterStreamOutput({
    this.accessDeniedException,
    this.conflictException,
    this.internalServerException,
    this.resourceNotFoundException,
    this.result,
    this.serviceQuotaExceededException,
    this.throttlingException,
    this.validationException,
  });

  factory CodeInterpreterStreamOutput.fromJson(Map<String, dynamic> json) {
    return CodeInterpreterStreamOutput(
      accessDeniedException: json['accessDeniedException'] != null
          ? AccessDeniedException.fromJson(
              json['accessDeniedException'] as Map<String, dynamic>)
          : null,
      conflictException: json['conflictException'] != null
          ? ConflictException.fromJson(
              json['conflictException'] as Map<String, dynamic>)
          : null,
      internalServerException: json['internalServerException'] != null
          ? InternalServerException.fromJson(
              json['internalServerException'] as Map<String, dynamic>)
          : null,
      resourceNotFoundException: json['resourceNotFoundException'] != null
          ? ResourceNotFoundException.fromJson(
              json['resourceNotFoundException'] as Map<String, dynamic>)
          : null,
      result: json['result'] != null
          ? CodeInterpreterResult.fromJson(
              json['result'] as Map<String, dynamic>)
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
    final conflictException = this.conflictException;
    final internalServerException = this.internalServerException;
    final resourceNotFoundException = this.resourceNotFoundException;
    final result = this.result;
    final serviceQuotaExceededException = this.serviceQuotaExceededException;
    final throttlingException = this.throttlingException;
    final validationException = this.validationException;
    return {
      if (accessDeniedException != null)
        'accessDeniedException': accessDeniedException,
      if (conflictException != null) 'conflictException': conflictException,
      if (internalServerException != null)
        'internalServerException': internalServerException,
      if (resourceNotFoundException != null)
        'resourceNotFoundException': resourceNotFoundException,
      if (result != null) 'result': result,
      if (serviceQuotaExceededException != null)
        'serviceQuotaExceededException': serviceQuotaExceededException,
      if (throttlingException != null)
        'throttlingException': throttlingException,
      if (validationException != null)
        'validationException': validationException,
    };
  }
}

/// The output produced by executing code in a code interpreter session in
/// Amazon Bedrock AgentCore. This structure contains the results of code
/// execution, including textual output, structured data, and error information.
/// Agents use these results to generate responses that incorporate computation,
/// data analysis, and visualization.
///
/// @nodoc
class CodeInterpreterResult {
  /// The textual content of the execution result. This includes standard output
  /// from the code execution, such as print statements, console output, and text
  /// representations of results.
  final List<ContentBlock> content;

  /// Indicates whether the result represents an error. If true, the content
  /// contains error messages or exception information. If false, the content
  /// contains successful execution results.
  final bool? isError;

  /// The structured content of the execution result. This includes additional
  /// metadata about the execution, such as execution time, memory usage, and
  /// structured representations of output data. The format depends on the
  /// specific code interpreter and execution context.
  final ToolResultStructuredContent? structuredContent;

  CodeInterpreterResult({
    required this.content,
    this.isError,
    this.structuredContent,
  });

  factory CodeInterpreterResult.fromJson(Map<String, dynamic> json) {
    return CodeInterpreterResult(
      content: ((json['content'] as List?) ?? const [])
          .nonNulls
          .map((e) => ContentBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      isError: json['isError'] as bool?,
      structuredContent: json['structuredContent'] != null
          ? ToolResultStructuredContent.fromJson(
              json['structuredContent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final isError = this.isError;
    final structuredContent = this.structuredContent;
    return {
      'content': content,
      if (isError != null) 'isError': isError,
      if (structuredContent != null) 'structuredContent': structuredContent,
    };
  }
}

/// Contains structured content from a tool result.
///
/// @nodoc
class ToolResultStructuredContent {
  /// The execution time of the tool operation in milliseconds.
  final double? executionTime;

  /// The exit code from the tool execution.
  final int? exitCode;

  /// The standard error output from the tool execution.
  final String? stderr;

  /// The standard output from the tool execution.
  final String? stdout;

  /// The identifier of the task that produced the result.
  final String? taskId;

  /// The status of the task that produced the result.
  final TaskStatus? taskStatus;

  ToolResultStructuredContent({
    this.executionTime,
    this.exitCode,
    this.stderr,
    this.stdout,
    this.taskId,
    this.taskStatus,
  });

  factory ToolResultStructuredContent.fromJson(Map<String, dynamic> json) {
    return ToolResultStructuredContent(
      executionTime: json['executionTime'] as double?,
      exitCode: json['exitCode'] as int?,
      stderr: json['stderr'] as String?,
      stdout: json['stdout'] as String?,
      taskId: json['taskId'] as String?,
      taskStatus: (json['taskStatus'] as String?)?.let(TaskStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final executionTime = this.executionTime;
    final exitCode = this.exitCode;
    final stderr = this.stderr;
    final stdout = this.stdout;
    final taskId = this.taskId;
    final taskStatus = this.taskStatus;
    return {
      if (executionTime != null) 'executionTime': executionTime,
      if (exitCode != null) 'exitCode': exitCode,
      if (stderr != null) 'stderr': stderr,
      if (stdout != null) 'stdout': stdout,
      if (taskId != null) 'taskId': taskId,
      if (taskStatus != null) 'taskStatus': taskStatus.value,
    };
  }
}

/// @nodoc
class TaskStatus {
  static const submitted = TaskStatus._('submitted');
  static const working = TaskStatus._('working');
  static const completed = TaskStatus._('completed');
  static const canceled = TaskStatus._('canceled');
  static const failed = TaskStatus._('failed');

  final String value;

  const TaskStatus._(this.value);

  static const values = [submitted, working, completed, canceled, failed];

  static TaskStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TaskStatus._(value));

  @override
  bool operator ==(other) => other is TaskStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A block of content in a response.
///
/// @nodoc
class ContentBlock {
  /// The type of content in the block.
  final ContentBlockType type;

  /// The binary data content of the block.
  final Uint8List? data;

  /// The description of the content block.
  final String? description;

  /// The MIME type of the content.
  final String? mimeType;

  /// The name of the content block.
  final String? name;

  /// The resource associated with the content block.
  final ResourceContent? resource;

  /// The size of the content in bytes.
  final int? size;

  /// The text content of the block.
  final String? text;

  /// The URI of the content.
  final String? uri;

  ContentBlock({
    required this.type,
    this.data,
    this.description,
    this.mimeType,
    this.name,
    this.resource,
    this.size,
    this.text,
    this.uri,
  });

  factory ContentBlock.fromJson(Map<String, dynamic> json) {
    return ContentBlock(
      type: ContentBlockType.fromString((json['type'] as String?) ?? ''),
      data: _s.decodeNullableUint8List(json['data'] as String?),
      description: json['description'] as String?,
      mimeType: json['mimeType'] as String?,
      name: json['name'] as String?,
      resource: json['resource'] != null
          ? ResourceContent.fromJson(json['resource'] as Map<String, dynamic>)
          : null,
      size: json['size'] as int?,
      text: json['text'] as String?,
      uri: json['uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final data = this.data;
    final description = this.description;
    final mimeType = this.mimeType;
    final name = this.name;
    final resource = this.resource;
    final size = this.size;
    final text = this.text;
    final uri = this.uri;
    return {
      'type': type.value,
      if (data != null) 'data': base64Encode(data),
      if (description != null) 'description': description,
      if (mimeType != null) 'mimeType': mimeType,
      if (name != null) 'name': name,
      if (resource != null) 'resource': resource,
      if (size != null) 'size': size,
      if (text != null) 'text': text,
      if (uri != null) 'uri': uri,
    };
  }
}

/// @nodoc
class ContentBlockType {
  static const text = ContentBlockType._('text');
  static const image = ContentBlockType._('image');
  static const resource = ContentBlockType._('resource');
  static const resourceLink = ContentBlockType._('resource_link');

  final String value;

  const ContentBlockType._(this.value);

  static const values = [text, image, resource, resourceLink];

  static ContentBlockType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ContentBlockType._(value));

  @override
  bool operator ==(other) => other is ContentBlockType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about resource content.
///
/// @nodoc
class ResourceContent {
  /// The type of resource content.
  final ResourceContentType type;

  /// The binary resource content.
  final Uint8List? blob;

  /// The MIME type of the resource content.
  final String? mimeType;

  /// The text resource content.
  final String? text;

  /// The URI of the resource content.
  final String? uri;

  ResourceContent({
    required this.type,
    this.blob,
    this.mimeType,
    this.text,
    this.uri,
  });

  factory ResourceContent.fromJson(Map<String, dynamic> json) {
    return ResourceContent(
      type: ResourceContentType.fromString((json['type'] as String?) ?? ''),
      blob: _s.decodeNullableUint8List(json['blob'] as String?),
      mimeType: json['mimeType'] as String?,
      text: json['text'] as String?,
      uri: json['uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final blob = this.blob;
    final mimeType = this.mimeType;
    final text = this.text;
    final uri = this.uri;
    return {
      'type': type.value,
      if (blob != null) 'blob': base64Encode(blob),
      if (mimeType != null) 'mimeType': mimeType,
      if (text != null) 'text': text,
      if (uri != null) 'uri': uri,
    };
  }
}

/// @nodoc
class ResourceContentType {
  static const text = ResourceContentType._('text');
  static const blob = ResourceContentType._('blob');

  final String value;

  const ResourceContentType._(this.value);

  static const values = [text, blob];

  static ResourceContentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceContentType._(value));

  @override
  bool operator ==(other) =>
      other is ResourceContentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ToolName {
  static const executeCode = ToolName._('executeCode');
  static const executeCommand = ToolName._('executeCommand');
  static const readFiles = ToolName._('readFiles');
  static const listFiles = ToolName._('listFiles');
  static const removeFiles = ToolName._('removeFiles');
  static const writeFiles = ToolName._('writeFiles');
  static const startCommandExecution = ToolName._('startCommandExecution');
  static const getTask = ToolName._('getTask');
  static const stopTask = ToolName._('stopTask');

  final String value;

  const ToolName._(this.value);

  static const values = [
    executeCode,
    executeCommand,
    readFiles,
    listFiles,
    removeFiles,
    writeFiles,
    startCommandExecution,
    getTask,
    stopTask
  ];

  static ToolName fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ToolName._(value));

  @override
  bool operator ==(other) => other is ToolName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The collection of arguments that specify the operation to perform and its
/// parameters when invoking a tool in Amazon Bedrock AgentCore. Different tools
/// require different arguments, and this structure provides a flexible way to
/// pass the appropriate arguments to each tool type.
///
/// @nodoc
class ToolArguments {
  /// Whether to clear the context for the tool.
  final bool? clearContext;

  /// The code to execute in a code interpreter session. This is the source code
  /// in the specified programming language that will be executed by the code
  /// interpreter.
  final String? code;

  /// The command to execute with the tool.
  final String? command;

  /// The content for the tool operation.
  final List<InputContentBlock>? content;

  /// The directory path for the tool operation.
  final String? directoryPath;

  /// The programming language of the code to execute. This tells the code
  /// interpreter which language runtime to use for execution.
  final ProgrammingLanguage? language;

  /// The path for the tool operation.
  final String? path;

  /// The paths for the tool operation.
  final List<String>? paths;

  /// The runtime environment to use for code execution. If not specified,
  /// defaults to <code>deno</code> for JavaScript and TypeScript.
  final LanguageRuntime? runtime;

  /// The identifier of the task for the tool operation.
  final String? taskId;

  ToolArguments({
    this.clearContext,
    this.code,
    this.command,
    this.content,
    this.directoryPath,
    this.language,
    this.path,
    this.paths,
    this.runtime,
    this.taskId,
  });

  Map<String, dynamic> toJson() {
    final clearContext = this.clearContext;
    final code = this.code;
    final command = this.command;
    final content = this.content;
    final directoryPath = this.directoryPath;
    final language = this.language;
    final path = this.path;
    final paths = this.paths;
    final runtime = this.runtime;
    final taskId = this.taskId;
    return {
      if (clearContext != null) 'clearContext': clearContext,
      if (code != null) 'code': code,
      if (command != null) 'command': command,
      if (content != null) 'content': content,
      if (directoryPath != null) 'directoryPath': directoryPath,
      if (language != null) 'language': language.value,
      if (path != null) 'path': path,
      if (paths != null) 'paths': paths,
      if (runtime != null) 'runtime': runtime.value,
      if (taskId != null) 'taskId': taskId,
    };
  }
}

/// @nodoc
class ProgrammingLanguage {
  static const python = ProgrammingLanguage._('python');
  static const javascript = ProgrammingLanguage._('javascript');
  static const typescript = ProgrammingLanguage._('typescript');

  final String value;

  const ProgrammingLanguage._(this.value);

  static const values = [python, javascript, typescript];

  static ProgrammingLanguage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProgrammingLanguage._(value));

  @override
  bool operator ==(other) =>
      other is ProgrammingLanguage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LanguageRuntime {
  static const nodejs = LanguageRuntime._('nodejs');
  static const deno = LanguageRuntime._('deno');
  static const python = LanguageRuntime._('python');

  final String value;

  const LanguageRuntime._(this.value);

  static const values = [nodejs, deno, python];

  static LanguageRuntime fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LanguageRuntime._(value));

  @override
  bool operator ==(other) => other is LanguageRuntime && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A block of input content.
///
/// @nodoc
class InputContentBlock {
  /// The path to the input content.
  final String path;

  /// The binary input content.
  final Uint8List? blob;

  /// The text input content.
  final String? text;

  InputContentBlock({
    required this.path,
    this.blob,
    this.text,
  });

  Map<String, dynamic> toJson() {
    final path = this.path;
    final blob = this.blob;
    final text = this.text;
    return {
      'path': path,
      if (blob != null) 'blob': base64Encode(blob),
      if (text != null) 'text': text,
    };
  }
}

/// Vendor-specific token response configuration.
///
/// @nodoc
class PaymentTokenResponseOutput {
  /// The Coinbase CDP token response.
  final CoinbaseCdpTokenResponseOutput? coinbaseCdpTokenResponse;

  /// The Stripe Privy token response.
  final StripePrivyTokenResponseOutput? stripePrivyTokenResponse;

  PaymentTokenResponseOutput({
    this.coinbaseCdpTokenResponse,
    this.stripePrivyTokenResponse,
  });

  factory PaymentTokenResponseOutput.fromJson(Map<String, dynamic> json) {
    return PaymentTokenResponseOutput(
      coinbaseCdpTokenResponse: json['coinbaseCdpTokenResponse'] != null
          ? CoinbaseCdpTokenResponseOutput.fromJson(
              json['coinbaseCdpTokenResponse'] as Map<String, dynamic>)
          : null,
      stripePrivyTokenResponse: json['stripePrivyTokenResponse'] != null
          ? StripePrivyTokenResponseOutput.fromJson(
              json['stripePrivyTokenResponse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final coinbaseCdpTokenResponse = this.coinbaseCdpTokenResponse;
    final stripePrivyTokenResponse = this.stripePrivyTokenResponse;
    return {
      if (coinbaseCdpTokenResponse != null)
        'coinbaseCdpTokenResponse': coinbaseCdpTokenResponse,
      if (stripePrivyTokenResponse != null)
        'stripePrivyTokenResponse': stripePrivyTokenResponse,
    };
  }
}

/// Coinbase CDP token response.
///
/// @nodoc
class CoinbaseCdpTokenResponseOutput {
  /// Bearer Token for Authorization header.
  final String bearerToken;

  /// Wallet Auth Token for X-Wallet-Auth header.
  final String? walletAuthToken;

  CoinbaseCdpTokenResponseOutput({
    required this.bearerToken,
    this.walletAuthToken,
  });

  factory CoinbaseCdpTokenResponseOutput.fromJson(Map<String, dynamic> json) {
    return CoinbaseCdpTokenResponseOutput(
      bearerToken: (json['bearerToken'] as String?) ?? '',
      walletAuthToken: json['walletAuthToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bearerToken = this.bearerToken;
    final walletAuthToken = this.walletAuthToken;
    return {
      'bearerToken': bearerToken,
      if (walletAuthToken != null) 'walletAuthToken': walletAuthToken,
    };
  }
}

/// Stripe Privy token response containing appId, basicAuthToken, and optionally
/// authorizationSignature.
///
/// @nodoc
class StripePrivyTokenResponseOutput {
  /// The Privy app ID for the privy-app-id header.
  final String appId;

  /// Base64-encoded Basic Auth token (appId:appSecret) for the Authorization
  /// header.
  final String basicAuthToken;

  /// Base64-encoded ECDSA P-256 authorization signature (only present when
  /// includeAuthorizationSignature is true).
  final String? authorizationSignature;

  /// Unix timestamp in milliseconds when the authorization signature expires.
  final int? requestExpiry;

  StripePrivyTokenResponseOutput({
    required this.appId,
    required this.basicAuthToken,
    this.authorizationSignature,
    this.requestExpiry,
  });

  factory StripePrivyTokenResponseOutput.fromJson(Map<String, dynamic> json) {
    return StripePrivyTokenResponseOutput(
      appId: (json['appId'] as String?) ?? '',
      basicAuthToken: (json['basicAuthToken'] as String?) ?? '',
      authorizationSignature: json['authorizationSignature'] as String?,
      requestExpiry: json['requestExpiry'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final basicAuthToken = this.basicAuthToken;
    final authorizationSignature = this.authorizationSignature;
    final requestExpiry = this.requestExpiry;
    return {
      'appId': appId,
      'basicAuthToken': basicAuthToken,
      if (authorizationSignature != null)
        'authorizationSignature': authorizationSignature,
      if (requestExpiry != null) 'requestExpiry': requestExpiry,
    };
  }
}

/// Vendor-specific token request configuration.
///
/// @nodoc
class PaymentTokenRequestInput {
  /// The Coinbase CDP token request.
  final CoinbaseCdpTokenRequestInput? coinbaseCdpTokenRequest;

  /// The Stripe Privy token request.
  final StripePrivyTokenRequestInput? stripePrivyTokenRequest;

  PaymentTokenRequestInput({
    this.coinbaseCdpTokenRequest,
    this.stripePrivyTokenRequest,
  });

  Map<String, dynamic> toJson() {
    final coinbaseCdpTokenRequest = this.coinbaseCdpTokenRequest;
    final stripePrivyTokenRequest = this.stripePrivyTokenRequest;
    return {
      if (coinbaseCdpTokenRequest != null)
        'coinbaseCdpTokenRequest': coinbaseCdpTokenRequest,
      if (stripePrivyTokenRequest != null)
        'stripePrivyTokenRequest': stripePrivyTokenRequest,
    };
  }
}

/// Coinbase CDP token request parameters.
///
/// @nodoc
class CoinbaseCdpTokenRequestInput {
  /// The HTTP method for the payment API request.
  final PaymentHttpMethodType requestMethod;

  /// The path of the payment API request.
  final String requestPath;

  /// Set to true for wallet write operations (requires walletSecret configured).
  final bool? includeWalletAuthToken;

  /// Request body JSON — used to generate wallet auth JWT.
  final String? requestBody;

  /// The host for the payment API request. Defaults to "api.cdp.coinbase.com".
  final String? requestHost;

  CoinbaseCdpTokenRequestInput({
    required this.requestMethod,
    required this.requestPath,
    this.includeWalletAuthToken,
    this.requestBody,
    this.requestHost,
  });

  Map<String, dynamic> toJson() {
    final requestMethod = this.requestMethod;
    final requestPath = this.requestPath;
    final includeWalletAuthToken = this.includeWalletAuthToken;
    final requestBody = this.requestBody;
    final requestHost = this.requestHost;
    return {
      'requestMethod': requestMethod.value,
      'requestPath': requestPath,
      if (includeWalletAuthToken != null)
        'includeWalletAuthToken': includeWalletAuthToken,
      if (requestBody != null) 'requestBody': requestBody,
      if (requestHost != null) 'requestHost': requestHost,
    };
  }
}

/// Stripe Privy token request parameters.
///
/// @nodoc
class StripePrivyTokenRequestInput {
  /// Request body JSON for the Privy API call.
  final String requestBody;

  /// The path of the Stripe Privy API request.
  final String requestPath;

  /// Set to true to generate privy-authorization-signature.
  final bool? includeAuthorizationSignature;

  /// The host for the Privy API request. Defaults to "api.privy.io".
  final String? requestHost;

  StripePrivyTokenRequestInput({
    required this.requestBody,
    required this.requestPath,
    this.includeAuthorizationSignature,
    this.requestHost,
  });

  Map<String, dynamic> toJson() {
    final requestBody = this.requestBody;
    final requestPath = this.requestPath;
    final includeAuthorizationSignature = this.includeAuthorizationSignature;
    final requestHost = this.requestHost;
    return {
      'requestBody': requestBody,
      'requestPath': requestPath,
      if (includeAuthorizationSignature != null)
        'includeAuthorizationSignature': includeAuthorizationSignature,
      if (requestHost != null) 'requestHost': requestHost,
    };
  }
}

/// @nodoc
class PaymentHttpMethodType {
  static const get = PaymentHttpMethodType._('GET');
  static const post = PaymentHttpMethodType._('POST');
  static const put = PaymentHttpMethodType._('PUT');
  static const delete = PaymentHttpMethodType._('DELETE');
  static const patch = PaymentHttpMethodType._('PATCH');

  final String value;

  const PaymentHttpMethodType._(this.value);

  static const values = [get, post, put, delete, patch];

  static PaymentHttpMethodType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PaymentHttpMethodType._(value));

  @override
  bool operator ==(other) =>
      other is PaymentHttpMethodType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SessionStatus {
  static const inProgress = SessionStatus._('IN_PROGRESS');
  static const failed = SessionStatus._('FAILED');

  final String value;

  const SessionStatus._(this.value);

  static const values = [inProgress, failed];

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

/// @nodoc
class Oauth2FlowType {
  static const userFederation = Oauth2FlowType._('USER_FEDERATION');
  static const m2m = Oauth2FlowType._('M2M');
  static const onBehalfOfTokenExchange =
      Oauth2FlowType._('ON_BEHALF_OF_TOKEN_EXCHANGE');

  final String value;

  const Oauth2FlowType._(this.value);

  static const values = [userFederation, m2m, onBehalfOfTokenExchange];

  static Oauth2FlowType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => Oauth2FlowType._(value));

  @override
  bool operator ==(other) => other is Oauth2FlowType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ValidationExceptionReason {
  static const cannotParse = ValidationExceptionReason._('CannotParse');
  static const fieldValidationFailed =
      ValidationExceptionReason._('FieldValidationFailed');
  static const idempotentParameterMismatchException =
      ValidationExceptionReason._('IdempotentParameterMismatchException');
  static const eventInOtherSession =
      ValidationExceptionReason._('EventInOtherSession');
  static const resourceConflict =
      ValidationExceptionReason._('ResourceConflict');

  final String value;

  const ValidationExceptionReason._(this.value);

  static const values = [
    cannotParse,
    fieldValidationFailed,
    idempotentParameterMismatchException,
    eventInOtherSession,
    resourceConflict
  ];

  static ValidationExceptionReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ValidationExceptionReason._(value));

  @override
  bool operator ==(other) =>
      other is ValidationExceptionReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Stores information about a field passed inside a request that resulted in an
/// exception.
///
/// @nodoc
class ValidationExceptionField {
  /// A message describing why this field failed validation.
  final String message;

  /// The name of the field.
  final String name;

  ValidationExceptionField({
    required this.message,
    required this.name,
  });

  factory ValidationExceptionField.fromJson(Map<String, dynamic> json) {
    return ValidationExceptionField(
      message: (json['message'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final name = this.name;
    return {
      'message': message,
      'name': name,
    };
  }
}

/// The OAuth2.0 token or user ID that was used to generate the workload access
/// token used for initiating the user authorization flow to retrieve OAuth2.0
/// tokens.
///
/// @nodoc
class UserIdentifier {
  /// The ID of the user for whom you have retrieved a workload access token for
  final String? userId;

  /// The OAuth2.0 token issued by the user’s identity provider that was used to
  /// generate the workload access token
  final String? userToken;

  UserIdentifier({
    this.userId,
    this.userToken,
  });

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    final userToken = this.userToken;
    return {
      if (userId != null) 'userId': userId,
      if (userToken != null) 'userToken': userToken,
    };
  }
}

/// @nodoc
class Unit {
  Unit();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class Document {
  Document();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DuplicateIdException extends _s.GenericAwsException {
  DuplicateIdException({String? type, String? message})
      : super(type: type, code: 'DuplicateIdException', message: message);
}

/// @nodoc
class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String? type, String? message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

/// @nodoc
class RetryableConflictException extends _s.GenericAwsException {
  RetryableConflictException({String? type, String? message})
      : super(type: type, code: 'RetryableConflictException', message: message);
}

/// @nodoc
class ServiceException extends _s.GenericAwsException {
  ServiceException({String? type, String? message})
      : super(type: type, code: 'ServiceException', message: message);
}

/// @nodoc
class ThrottledException extends _s.GenericAwsException {
  ThrottledException({String? type, String? message})
      : super(type: type, code: 'ThrottledException', message: message);
}

/// @nodoc
class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(message: message),
  'ConflictException': (type, message) => ConflictException(message: message),
  'DuplicateIdException': (type, message) =>
      DuplicateIdException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(message: message),
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(message: message),
  'RetryableConflictException': (type, message) =>
      RetryableConflictException(type: type, message: message),
  'RuntimeClientError': (type, message) => RuntimeClientError(message: message),
  'ServiceException': (type, message) =>
      ServiceException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(message: message),
  'ThrottledException': (type, message) =>
      ThrottledException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(message: message),
};
