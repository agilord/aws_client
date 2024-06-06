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

/// Contains APIs related to model invocation and querying of knowledge bases.
class AgentsForAmazonBedrockRuntime {
  final _s.RestJsonProtocol _protocol;
  AgentsForAmazonBedrockRuntime({
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

  /// <note>
  /// The CLI doesn't support <code>InvokeAgent</code>.
  /// </note>
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
  /// The response is returned in the <code>bytes</code> field of the
  /// <code>chunk</code> object.
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
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [DependencyFailedException].
  /// May throw [BadGatewayException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
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
  Future<InvokeAgentResponse> invokeAgent({
    required String agentAliasId,
    required String agentId,
    required String sessionId,
    bool? enableTrace,
    bool? endSession,
    String? inputText,
    SessionState? sessionState,
  }) async {
    final $payload = <String, dynamic>{
      if (enableTrace != null) 'enableTrace': enableTrace,
      if (endSession != null) 'endSession': endSession,
      if (inputText != null) 'inputText': inputText,
      if (sessionState != null) 'sessionState': sessionState,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/agents/${Uri.encodeComponent(agentId)}/agentAliases/${Uri.encodeComponent(agentAliasId)}/sessions/${Uri.encodeComponent(sessionId)}/text',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return InvokeAgentResponse(
      completion: ResponseStream.fromJson($json),
      contentType: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-bedrock-agent-content-type')!,
      sessionId: _s.extractHeaderStringValue(
          response.headers, 'x-amz-bedrock-agent-session-id')!,
    );
  }

  /// Queries a knowledge base and retrieves information from it.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [DependencyFailedException].
  /// May throw [BadGatewayException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [knowledgeBaseId] :
  /// The unique identifier of the knowledge base to query.
  ///
  /// Parameter [retrievalQuery] :
  /// Contains the query to send the knowledge base.
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
    String? nextToken,
    KnowledgeBaseRetrievalConfiguration? retrievalConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'retrievalQuery': retrievalQuery,
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

  /// Queries a knowledge base and generates responses based on the retrieved
  /// results. The response only cites sources that are relevant to the query.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [DependencyFailedException].
  /// May throw [BadGatewayException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
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
  /// The unique identifier of the session. Reuse the same value to continue the
  /// same session with the knowledge base.
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

/// Contains information about the action group being invoked. For more
/// information about the possible structures, see the InvocationInput tab in <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/trace-orchestration.html">OrchestrationTrace</a>
/// in the Amazon Bedrock User Guide.
class ActionGroupInvocationInput {
  /// The name of the action group.
  final String? actionGroupName;

  /// The path to the API to call, based off the action group.
  final String? apiPath;

  /// The function in the action group to call.
  final String? function;

  /// The parameters in the Lambda input event.
  final List<Parameter>? parameters;

  /// The parameters in the request body for the Lambda input event.
  final RequestBody? requestBody;

  /// The API method being used, based off the action group.
  final String? verb;

  ActionGroupInvocationInput({
    this.actionGroupName,
    this.apiPath,
    this.function,
    this.parameters,
    this.requestBody,
    this.verb,
  });

  factory ActionGroupInvocationInput.fromJson(Map<String, dynamic> json) {
    return ActionGroupInvocationInput(
      actionGroupName: json['actionGroupName'] as String?,
      apiPath: json['apiPath'] as String?,
      function: json['function'] as String?,
      parameters: (json['parameters'] as List?)
          ?.whereNotNull()
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
    final function = this.function;
    final parameters = this.parameters;
    final requestBody = this.requestBody;
    final verb = this.verb;
    return {
      if (actionGroupName != null) 'actionGroupName': actionGroupName,
      if (apiPath != null) 'apiPath': apiPath,
      if (function != null) 'function': function,
      if (parameters != null) 'parameters': parameters,
      if (requestBody != null) 'requestBody': requestBody,
      if (verb != null) 'verb': verb,
    };
  }
}

/// Contains the JSON-formatted string returned by the API invoked by the action
/// group.
class ActionGroupInvocationOutput {
  /// The JSON-formatted string returned by the API invoked by the action group.
  final String? text;

  ActionGroupInvocationOutput({
    this.text,
  });

  factory ActionGroupInvocationOutput.fromJson(Map<String, dynamic> json) {
    return ActionGroupInvocationOutput(
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

class AdditionalModelRequestFieldsValue {
  AdditionalModelRequestFieldsValue();

  Map<String, dynamic> toJson() {
    return {};
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

  /// The path to the API operation.
  final String? apiPath;

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
    this.apiPath,
    this.httpMethod,
    this.parameters,
    this.requestBody,
  });

  factory ApiInvocationInput.fromJson(Map<String, dynamic> json) {
    return ApiInvocationInput(
      actionGroup: json['actionGroup'] as String,
      apiPath: json['apiPath'] as String?,
      httpMethod: json['httpMethod'] as String?,
      parameters: (json['parameters'] as List?)
          ?.whereNotNull()
          .map((e) => ApiParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestBody: json['requestBody'] != null
          ? ApiRequestBody.fromJson(json['requestBody'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionGroup = this.actionGroup;
    final apiPath = this.apiPath;
    final httpMethod = this.httpMethod;
    final parameters = this.parameters;
    final requestBody = this.requestBody;
    return {
      'actionGroup': actionGroup,
      if (apiPath != null) 'apiPath': apiPath,
      if (httpMethod != null) 'httpMethod': httpMethod,
      if (parameters != null) 'parameters': parameters,
      if (requestBody != null) 'requestBody': requestBody,
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

  /// The path to the API operation.
  final String? apiPath;

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
    this.apiPath,
    this.httpMethod,
    this.httpStatusCode,
    this.responseBody,
    this.responseState,
  });

  Map<String, dynamic> toJson() {
    final actionGroup = this.actionGroup;
    final apiPath = this.apiPath;
    final httpMethod = this.httpMethod;
    final httpStatusCode = this.httpStatusCode;
    final responseBody = this.responseBody;
    final responseState = this.responseState;
    return {
      'actionGroup': actionGroup,
      if (apiPath != null) 'apiPath': apiPath,
      if (httpMethod != null) 'httpMethod': httpMethod,
      if (httpStatusCode != null) 'httpStatusCode': httpStatusCode,
      if (responseBody != null) 'responseBody': responseBody,
      if (responseState != null) 'responseState': responseState.toValue(),
    };
  }
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

  ContentBody({
    this.body,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    return {
      if (body != null) 'body': body,
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
      'sourceType': sourceType.toValue(),
      if (byteContent != null) 'byteContent': byteContent,
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

enum ExternalSourceType {
  s3,
  byteContent,
}

extension ExternalSourceTypeValueExtension on ExternalSourceType {
  String toValue() {
    switch (this) {
      case ExternalSourceType.s3:
        return 'S3';
      case ExternalSourceType.byteContent:
        return 'BYTE_CONTENT';
    }
  }
}

extension ExternalSourceTypeFromString on String {
  ExternalSourceType toExternalSourceType() {
    switch (this) {
      case 'S3':
        return ExternalSourceType.s3;
      case 'BYTE_CONTENT':
        return ExternalSourceType.byteContent;
    }
    throw Exception('$this is not known in enum ExternalSourceType');
  }
}

/// Contains the generation configuration of the external source wrapper object.
class ExternalSourcesGenerationConfiguration {
  /// Additional model parameters and their corresponding values not included in
  /// the textInferenceConfig structure for an external source. Takes in custom
  /// model parameters specific to the language model being used.
  final Map<String, AdditionalModelRequestFieldsValue>?
      additionalModelRequestFields;

  /// The configuration details for the guardrail.
  final GuardrailConfiguration? guardrailConfiguration;

  /// Configuration settings for inference when using RetrieveAndGenerate to
  /// generate responses while using an external source.
  final InferenceConfig? inferenceConfig;

  /// Contain the textPromptTemplate string for the external source wrapper
  /// object.
  final PromptTemplate? promptTemplate;

  ExternalSourcesGenerationConfiguration({
    this.additionalModelRequestFields,
    this.guardrailConfiguration,
    this.inferenceConfig,
    this.promptTemplate,
  });

  Map<String, dynamic> toJson() {
    final additionalModelRequestFields = this.additionalModelRequestFields;
    final guardrailConfiguration = this.guardrailConfiguration;
    final inferenceConfig = this.inferenceConfig;
    final promptTemplate = this.promptTemplate;
    return {
      if (additionalModelRequestFields != null)
        'additionalModelRequestFields': additionalModelRequestFields,
      if (guardrailConfiguration != null)
        'guardrailConfiguration': guardrailConfiguration,
      if (inferenceConfig != null) 'inferenceConfig': inferenceConfig,
      if (promptTemplate != null) 'promptTemplate': promptTemplate,
    };
  }
}

/// The configurations of the external source wrapper object in the
/// retrieveAndGenerate function.
class ExternalSourcesRetrieveAndGenerateConfiguration {
  /// The modelArn used with the external source wrapper object in the
  /// retrieveAndGenerate function.
  final String modelArn;

  /// The document used with the external source wrapper object in the
  /// retrieveAndGenerate function.
  final List<ExternalSource> sources;

  /// The prompt used with the external source wrapper object with the
  /// retrieveAndGenerate function.
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

/// Contains information about the failure of the interaction.
class FailureTrace {
  /// The reason the interaction failed.
  final String? failureReason;

  /// The unique identifier of the trace.
  final String? traceId;

  FailureTrace({
    this.failureReason,
    this.traceId,
  });

  factory FailureTrace.fromJson(Map<String, dynamic> json) {
    return FailureTrace(
      failureReason: json['failureReason'] as String?,
      traceId: json['traceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureReason = this.failureReason;
    final traceId = this.traceId;
    return {
      if (failureReason != null) 'failureReason': failureReason,
      if (traceId != null) 'traceId': traceId,
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
  final FilterValue value;

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

class FilterValue {
  FilterValue();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains details about the response to the user.
class FinalResponse {
  /// The text in the response to the user.
  final String? text;

  FinalResponse({
    this.text,
  });

  factory FinalResponse.fromJson(Map<String, dynamic> json) {
    return FinalResponse(
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

  /// The name of the function.
  final String? function;

  /// A list of parameters of the function.
  final List<FunctionParameter>? parameters;

  FunctionInvocationInput({
    required this.actionGroup,
    this.function,
    this.parameters,
  });

  factory FunctionInvocationInput.fromJson(Map<String, dynamic> json) {
    return FunctionInvocationInput(
      actionGroup: json['actionGroup'] as String,
      function: json['function'] as String?,
      parameters: (json['parameters'] as List?)
          ?.whereNotNull()
          .map((e) => FunctionParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final actionGroup = this.actionGroup;
    final function = this.function;
    final parameters = this.parameters;
    return {
      'actionGroup': actionGroup,
      if (function != null) 'function': function,
      if (parameters != null) 'parameters': parameters,
    };
  }
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

  /// The name of the function that was called.
  final String? function;

  /// The response from the function call using the parameters. The key of the
  /// object is the content type (currently, only <code>TEXT</code> is supported).
  /// The response may be returned directly or from the Lambda function.
  final Map<String, ContentBody>? responseBody;

  /// Controls the final response state returned to end user when API/Function
  /// execution failed. When this state is FAILURE, the request would fail with
  /// dependency failure exception. When this state is REPROMPT, the API/function
  /// response will be sent to model for re-prompt
  final ResponseState? responseState;

  FunctionResult({
    required this.actionGroup,
    this.function,
    this.responseBody,
    this.responseState,
  });

  Map<String, dynamic> toJson() {
    final actionGroup = this.actionGroup;
    final function = this.function;
    final responseBody = this.responseBody;
    final responseState = this.responseState;
    return {
      'actionGroup': actionGroup,
      if (function != null) 'function': function,
      if (responseBody != null) 'responseBody': responseBody,
      if (responseState != null) 'responseState': responseState.toValue(),
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
  final Map<String, AdditionalModelRequestFieldsValue>?
      additionalModelRequestFields;

  /// The configuration details for the guardrail.
  final GuardrailConfiguration? guardrailConfiguration;

  /// Configuration settings for inference when using RetrieveAndGenerate to
  /// generate responses while using a knowledge base as a source.
  final InferenceConfig? inferenceConfig;

  /// Contains the template for the prompt that's sent to the model for response
  /// generation.
  final PromptTemplate? promptTemplate;

  GenerationConfiguration({
    this.additionalModelRequestFields,
    this.guardrailConfiguration,
    this.inferenceConfig,
    this.promptTemplate,
  });

  Map<String, dynamic> toJson() {
    final additionalModelRequestFields = this.additionalModelRequestFields;
    final guardrailConfiguration = this.guardrailConfiguration;
    final inferenceConfig = this.inferenceConfig;
    final promptTemplate = this.promptTemplate;
    return {
      if (additionalModelRequestFields != null)
        'additionalModelRequestFields': additionalModelRequestFields,
      if (guardrailConfiguration != null)
        'guardrailConfiguration': guardrailConfiguration,
      if (inferenceConfig != null) 'inferenceConfig': inferenceConfig,
      if (promptTemplate != null) 'promptTemplate': promptTemplate,
    };
  }
}

enum GuadrailAction {
  intervened,
  none,
}

extension GuadrailActionValueExtension on GuadrailAction {
  String toValue() {
    switch (this) {
      case GuadrailAction.intervened:
        return 'INTERVENED';
      case GuadrailAction.none:
        return 'NONE';
    }
  }
}

extension GuadrailActionFromString on String {
  GuadrailAction toGuadrailAction() {
    switch (this) {
      case 'INTERVENED':
        return GuadrailAction.intervened;
      case 'NONE':
        return GuadrailAction.none;
    }
    throw Exception('$this is not known in enum GuadrailAction');
  }
}

enum GuardrailAction {
  intervened,
  none,
}

extension GuardrailActionValueExtension on GuardrailAction {
  String toValue() {
    switch (this) {
      case GuardrailAction.intervened:
        return 'INTERVENED';
      case GuardrailAction.none:
        return 'NONE';
    }
  }
}

extension GuardrailActionFromString on String {
  GuardrailAction toGuardrailAction() {
    switch (this) {
      case 'INTERVENED':
        return GuardrailAction.intervened;
      case 'NONE':
        return GuardrailAction.none;
    }
    throw Exception('$this is not known in enum GuardrailAction');
  }
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
      action: (json['action'] as String?)?.toGuardrailContentPolicyAction(),
      confidence:
          (json['confidence'] as String?)?.toGuardrailContentFilterConfidence(),
      type: (json['type'] as String?)?.toGuardrailContentFilterType(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final confidence = this.confidence;
    final type = this.type;
    return {
      if (action != null) 'action': action.toValue(),
      if (confidence != null) 'confidence': confidence.toValue(),
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum GuardrailContentFilterConfidence {
  none,
  low,
  medium,
  high,
}

extension GuardrailContentFilterConfidenceValueExtension
    on GuardrailContentFilterConfidence {
  String toValue() {
    switch (this) {
      case GuardrailContentFilterConfidence.none:
        return 'NONE';
      case GuardrailContentFilterConfidence.low:
        return 'LOW';
      case GuardrailContentFilterConfidence.medium:
        return 'MEDIUM';
      case GuardrailContentFilterConfidence.high:
        return 'HIGH';
    }
  }
}

extension GuardrailContentFilterConfidenceFromString on String {
  GuardrailContentFilterConfidence toGuardrailContentFilterConfidence() {
    switch (this) {
      case 'NONE':
        return GuardrailContentFilterConfidence.none;
      case 'LOW':
        return GuardrailContentFilterConfidence.low;
      case 'MEDIUM':
        return GuardrailContentFilterConfidence.medium;
      case 'HIGH':
        return GuardrailContentFilterConfidence.high;
    }
    throw Exception(
        '$this is not known in enum GuardrailContentFilterConfidence');
  }
}

enum GuardrailContentFilterType {
  insults,
  hate,
  sexual,
  violence,
  misconduct,
  promptAttack,
}

extension GuardrailContentFilterTypeValueExtension
    on GuardrailContentFilterType {
  String toValue() {
    switch (this) {
      case GuardrailContentFilterType.insults:
        return 'INSULTS';
      case GuardrailContentFilterType.hate:
        return 'HATE';
      case GuardrailContentFilterType.sexual:
        return 'SEXUAL';
      case GuardrailContentFilterType.violence:
        return 'VIOLENCE';
      case GuardrailContentFilterType.misconduct:
        return 'MISCONDUCT';
      case GuardrailContentFilterType.promptAttack:
        return 'PROMPT_ATTACK';
    }
  }
}

extension GuardrailContentFilterTypeFromString on String {
  GuardrailContentFilterType toGuardrailContentFilterType() {
    switch (this) {
      case 'INSULTS':
        return GuardrailContentFilterType.insults;
      case 'HATE':
        return GuardrailContentFilterType.hate;
      case 'SEXUAL':
        return GuardrailContentFilterType.sexual;
      case 'VIOLENCE':
        return GuardrailContentFilterType.violence;
      case 'MISCONDUCT':
        return GuardrailContentFilterType.misconduct;
      case 'PROMPT_ATTACK':
        return GuardrailContentFilterType.promptAttack;
    }
    throw Exception('$this is not known in enum GuardrailContentFilterType');
  }
}

enum GuardrailContentPolicyAction {
  blocked,
}

extension GuardrailContentPolicyActionValueExtension
    on GuardrailContentPolicyAction {
  String toValue() {
    switch (this) {
      case GuardrailContentPolicyAction.blocked:
        return 'BLOCKED';
    }
  }
}

extension GuardrailContentPolicyActionFromString on String {
  GuardrailContentPolicyAction toGuardrailContentPolicyAction() {
    switch (this) {
      case 'BLOCKED':
        return GuardrailContentPolicyAction.blocked;
    }
    throw Exception('$this is not known in enum GuardrailContentPolicyAction');
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
          ?.whereNotNull()
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
      action: (json['action'] as String?)?.toGuardrailWordPolicyAction(),
      match: json['match'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final match = this.match;
    return {
      if (action != null) 'action': action.toValue(),
      if (match != null) 'match': match,
    };
  }
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
      action: (json['action'] as String?)?.toGuardrailWordPolicyAction(),
      match: json['match'] as String?,
      type: (json['type'] as String?)?.toGuardrailManagedWordType(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final match = this.match;
    final type = this.type;
    return {
      if (action != null) 'action': action.toValue(),
      if (match != null) 'match': match,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum GuardrailManagedWordType {
  profanity,
}

extension GuardrailManagedWordTypeValueExtension on GuardrailManagedWordType {
  String toValue() {
    switch (this) {
      case GuardrailManagedWordType.profanity:
        return 'PROFANITY';
    }
  }
}

extension GuardrailManagedWordTypeFromString on String {
  GuardrailManagedWordType toGuardrailManagedWordType() {
    switch (this) {
      case 'PROFANITY':
        return GuardrailManagedWordType.profanity;
    }
    throw Exception('$this is not known in enum GuardrailManagedWordType');
  }
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
          ?.toGuardrailSensitiveInformationPolicyAction(),
      match: json['match'] as String?,
      type: (json['type'] as String?)?.toGuardrailPiiEntityType(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final match = this.match;
    final type = this.type;
    return {
      if (action != null) 'action': action.toValue(),
      if (match != null) 'match': match,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum GuardrailPiiEntityType {
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
  vehicleIdentificationNumber,
}

extension GuardrailPiiEntityTypeValueExtension on GuardrailPiiEntityType {
  String toValue() {
    switch (this) {
      case GuardrailPiiEntityType.address:
        return 'ADDRESS';
      case GuardrailPiiEntityType.age:
        return 'AGE';
      case GuardrailPiiEntityType.awsAccessKey:
        return 'AWS_ACCESS_KEY';
      case GuardrailPiiEntityType.awsSecretKey:
        return 'AWS_SECRET_KEY';
      case GuardrailPiiEntityType.caHealthNumber:
        return 'CA_HEALTH_NUMBER';
      case GuardrailPiiEntityType.caSocialInsuranceNumber:
        return 'CA_SOCIAL_INSURANCE_NUMBER';
      case GuardrailPiiEntityType.creditDebitCardCvv:
        return 'CREDIT_DEBIT_CARD_CVV';
      case GuardrailPiiEntityType.creditDebitCardExpiry:
        return 'CREDIT_DEBIT_CARD_EXPIRY';
      case GuardrailPiiEntityType.creditDebitCardNumber:
        return 'CREDIT_DEBIT_CARD_NUMBER';
      case GuardrailPiiEntityType.driverId:
        return 'DRIVER_ID';
      case GuardrailPiiEntityType.email:
        return 'EMAIL';
      case GuardrailPiiEntityType.internationalBankAccountNumber:
        return 'INTERNATIONAL_BANK_ACCOUNT_NUMBER';
      case GuardrailPiiEntityType.ipAddress:
        return 'IP_ADDRESS';
      case GuardrailPiiEntityType.licensePlate:
        return 'LICENSE_PLATE';
      case GuardrailPiiEntityType.macAddress:
        return 'MAC_ADDRESS';
      case GuardrailPiiEntityType.name:
        return 'NAME';
      case GuardrailPiiEntityType.password:
        return 'PASSWORD';
      case GuardrailPiiEntityType.phone:
        return 'PHONE';
      case GuardrailPiiEntityType.pin:
        return 'PIN';
      case GuardrailPiiEntityType.swiftCode:
        return 'SWIFT_CODE';
      case GuardrailPiiEntityType.ukNationalHealthServiceNumber:
        return 'UK_NATIONAL_HEALTH_SERVICE_NUMBER';
      case GuardrailPiiEntityType.ukNationalInsuranceNumber:
        return 'UK_NATIONAL_INSURANCE_NUMBER';
      case GuardrailPiiEntityType.ukUniqueTaxpayerReferenceNumber:
        return 'UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER';
      case GuardrailPiiEntityType.url:
        return 'URL';
      case GuardrailPiiEntityType.username:
        return 'USERNAME';
      case GuardrailPiiEntityType.usBankAccountNumber:
        return 'US_BANK_ACCOUNT_NUMBER';
      case GuardrailPiiEntityType.usBankRoutingNumber:
        return 'US_BANK_ROUTING_NUMBER';
      case GuardrailPiiEntityType.usIndividualTaxIdentificationNumber:
        return 'US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER';
      case GuardrailPiiEntityType.usPassportNumber:
        return 'US_PASSPORT_NUMBER';
      case GuardrailPiiEntityType.usSocialSecurityNumber:
        return 'US_SOCIAL_SECURITY_NUMBER';
      case GuardrailPiiEntityType.vehicleIdentificationNumber:
        return 'VEHICLE_IDENTIFICATION_NUMBER';
    }
  }
}

extension GuardrailPiiEntityTypeFromString on String {
  GuardrailPiiEntityType toGuardrailPiiEntityType() {
    switch (this) {
      case 'ADDRESS':
        return GuardrailPiiEntityType.address;
      case 'AGE':
        return GuardrailPiiEntityType.age;
      case 'AWS_ACCESS_KEY':
        return GuardrailPiiEntityType.awsAccessKey;
      case 'AWS_SECRET_KEY':
        return GuardrailPiiEntityType.awsSecretKey;
      case 'CA_HEALTH_NUMBER':
        return GuardrailPiiEntityType.caHealthNumber;
      case 'CA_SOCIAL_INSURANCE_NUMBER':
        return GuardrailPiiEntityType.caSocialInsuranceNumber;
      case 'CREDIT_DEBIT_CARD_CVV':
        return GuardrailPiiEntityType.creditDebitCardCvv;
      case 'CREDIT_DEBIT_CARD_EXPIRY':
        return GuardrailPiiEntityType.creditDebitCardExpiry;
      case 'CREDIT_DEBIT_CARD_NUMBER':
        return GuardrailPiiEntityType.creditDebitCardNumber;
      case 'DRIVER_ID':
        return GuardrailPiiEntityType.driverId;
      case 'EMAIL':
        return GuardrailPiiEntityType.email;
      case 'INTERNATIONAL_BANK_ACCOUNT_NUMBER':
        return GuardrailPiiEntityType.internationalBankAccountNumber;
      case 'IP_ADDRESS':
        return GuardrailPiiEntityType.ipAddress;
      case 'LICENSE_PLATE':
        return GuardrailPiiEntityType.licensePlate;
      case 'MAC_ADDRESS':
        return GuardrailPiiEntityType.macAddress;
      case 'NAME':
        return GuardrailPiiEntityType.name;
      case 'PASSWORD':
        return GuardrailPiiEntityType.password;
      case 'PHONE':
        return GuardrailPiiEntityType.phone;
      case 'PIN':
        return GuardrailPiiEntityType.pin;
      case 'SWIFT_CODE':
        return GuardrailPiiEntityType.swiftCode;
      case 'UK_NATIONAL_HEALTH_SERVICE_NUMBER':
        return GuardrailPiiEntityType.ukNationalHealthServiceNumber;
      case 'UK_NATIONAL_INSURANCE_NUMBER':
        return GuardrailPiiEntityType.ukNationalInsuranceNumber;
      case 'UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER':
        return GuardrailPiiEntityType.ukUniqueTaxpayerReferenceNumber;
      case 'URL':
        return GuardrailPiiEntityType.url;
      case 'USERNAME':
        return GuardrailPiiEntityType.username;
      case 'US_BANK_ACCOUNT_NUMBER':
        return GuardrailPiiEntityType.usBankAccountNumber;
      case 'US_BANK_ROUTING_NUMBER':
        return GuardrailPiiEntityType.usBankRoutingNumber;
      case 'US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER':
        return GuardrailPiiEntityType.usIndividualTaxIdentificationNumber;
      case 'US_PASSPORT_NUMBER':
        return GuardrailPiiEntityType.usPassportNumber;
      case 'US_SOCIAL_SECURITY_NUMBER':
        return GuardrailPiiEntityType.usSocialSecurityNumber;
      case 'VEHICLE_IDENTIFICATION_NUMBER':
        return GuardrailPiiEntityType.vehicleIdentificationNumber;
    }
    throw Exception('$this is not known in enum GuardrailPiiEntityType');
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
          ?.toGuardrailSensitiveInformationPolicyAction(),
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
      if (action != null) 'action': action.toValue(),
      if (match != null) 'match': match,
      if (name != null) 'name': name,
      if (regex != null) 'regex': regex,
    };
  }
}

enum GuardrailSensitiveInformationPolicyAction {
  blocked,
  anonymized,
}

extension GuardrailSensitiveInformationPolicyActionValueExtension
    on GuardrailSensitiveInformationPolicyAction {
  String toValue() {
    switch (this) {
      case GuardrailSensitiveInformationPolicyAction.blocked:
        return 'BLOCKED';
      case GuardrailSensitiveInformationPolicyAction.anonymized:
        return 'ANONYMIZED';
    }
  }
}

extension GuardrailSensitiveInformationPolicyActionFromString on String {
  GuardrailSensitiveInformationPolicyAction
      toGuardrailSensitiveInformationPolicyAction() {
    switch (this) {
      case 'BLOCKED':
        return GuardrailSensitiveInformationPolicyAction.blocked;
      case 'ANONYMIZED':
        return GuardrailSensitiveInformationPolicyAction.anonymized;
    }
    throw Exception(
        '$this is not known in enum GuardrailSensitiveInformationPolicyAction');
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
          ?.whereNotNull()
          .map((e) =>
              GuardrailPiiEntityFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      regexes: (json['regexes'] as List?)
          ?.whereNotNull()
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
      action: (json['action'] as String?)?.toGuardrailTopicPolicyAction(),
      name: json['name'] as String?,
      type: (json['type'] as String?)?.toGuardrailTopicType(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final name = this.name;
    final type = this.type;
    return {
      if (action != null) 'action': action.toValue(),
      if (name != null) 'name': name,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum GuardrailTopicPolicyAction {
  blocked,
}

extension GuardrailTopicPolicyActionValueExtension
    on GuardrailTopicPolicyAction {
  String toValue() {
    switch (this) {
      case GuardrailTopicPolicyAction.blocked:
        return 'BLOCKED';
    }
  }
}

extension GuardrailTopicPolicyActionFromString on String {
  GuardrailTopicPolicyAction toGuardrailTopicPolicyAction() {
    switch (this) {
      case 'BLOCKED':
        return GuardrailTopicPolicyAction.blocked;
    }
    throw Exception('$this is not known in enum GuardrailTopicPolicyAction');
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
          ?.whereNotNull()
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

enum GuardrailTopicType {
  deny,
}

extension GuardrailTopicTypeValueExtension on GuardrailTopicType {
  String toValue() {
    switch (this) {
      case GuardrailTopicType.deny:
        return 'DENY';
    }
  }
}

extension GuardrailTopicTypeFromString on String {
  GuardrailTopicType toGuardrailTopicType() {
    switch (this) {
      case 'DENY':
        return GuardrailTopicType.deny;
    }
    throw Exception('$this is not known in enum GuardrailTopicType');
  }
}

/// The trace details used in the Guardrail.
class GuardrailTrace {
  /// The trace action details used with the Guardrail.
  final GuardrailAction? action;

  /// The details of the input assessments used in the Guardrail Trace.
  final List<GuardrailAssessment>? inputAssessments;

  /// The details of the output assessments used in the Guardrail Trace.
  final List<GuardrailAssessment>? outputAssessments;

  /// The details of the trace Id used in the Guardrail Trace.
  final String? traceId;

  GuardrailTrace({
    this.action,
    this.inputAssessments,
    this.outputAssessments,
    this.traceId,
  });

  factory GuardrailTrace.fromJson(Map<String, dynamic> json) {
    return GuardrailTrace(
      action: (json['action'] as String?)?.toGuardrailAction(),
      inputAssessments: (json['inputAssessments'] as List?)
          ?.whereNotNull()
          .map((e) => GuardrailAssessment.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputAssessments: (json['outputAssessments'] as List?)
          ?.whereNotNull()
          .map((e) => GuardrailAssessment.fromJson(e as Map<String, dynamic>))
          .toList(),
      traceId: json['traceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final inputAssessments = this.inputAssessments;
    final outputAssessments = this.outputAssessments;
    final traceId = this.traceId;
    return {
      if (action != null) 'action': action.toValue(),
      if (inputAssessments != null) 'inputAssessments': inputAssessments,
      if (outputAssessments != null) 'outputAssessments': outputAssessments,
      if (traceId != null) 'traceId': traceId,
    };
  }
}

enum GuardrailWordPolicyAction {
  blocked,
}

extension GuardrailWordPolicyActionValueExtension on GuardrailWordPolicyAction {
  String toValue() {
    switch (this) {
      case GuardrailWordPolicyAction.blocked:
        return 'BLOCKED';
    }
  }
}

extension GuardrailWordPolicyActionFromString on String {
  GuardrailWordPolicyAction toGuardrailWordPolicyAction() {
    switch (this) {
      case 'BLOCKED':
        return GuardrailWordPolicyAction.blocked;
    }
    throw Exception('$this is not known in enum GuardrailWordPolicyAction');
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
          ?.whereNotNull()
          .map((e) => GuardrailCustomWord.fromJson(e as Map<String, dynamic>))
          .toList(),
      managedWordLists: (json['managedWordLists'] as List?)
          ?.whereNotNull()
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

/// An internal server error occurred. Retry your request.
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

/// Contains information pertaining to the action group or knowledge base that
/// is being invoked.
class InvocationInput {
  /// Contains information about the action group to be invoked.
  final ActionGroupInvocationInput? actionGroupInvocationInput;

  /// Specifies whether the agent is invoking an action group or a knowledge base.
  final InvocationType? invocationType;

  /// Contains details about the knowledge base to look up and the query to be
  /// made.
  final KnowledgeBaseLookupInput? knowledgeBaseLookupInput;

  /// The unique identifier of the trace.
  final String? traceId;

  InvocationInput({
    this.actionGroupInvocationInput,
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
      invocationType: (json['invocationType'] as String?)?.toInvocationType(),
      knowledgeBaseLookupInput: json['knowledgeBaseLookupInput'] != null
          ? KnowledgeBaseLookupInput.fromJson(
              json['knowledgeBaseLookupInput'] as Map<String, dynamic>)
          : null,
      traceId: json['traceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionGroupInvocationInput = this.actionGroupInvocationInput;
    final invocationType = this.invocationType;
    final knowledgeBaseLookupInput = this.knowledgeBaseLookupInput;
    final traceId = this.traceId;
    return {
      if (actionGroupInvocationInput != null)
        'actionGroupInvocationInput': actionGroupInvocationInput,
      if (invocationType != null) 'invocationType': invocationType.toValue(),
      if (knowledgeBaseLookupInput != null)
        'knowledgeBaseLookupInput': knowledgeBaseLookupInput,
      if (traceId != null) 'traceId': traceId,
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

  Map<String, dynamic> toJson() {
    final apiResult = this.apiResult;
    final functionResult = this.functionResult;
    return {
      if (apiResult != null) 'apiResult': apiResult,
      if (functionResult != null) 'functionResult': functionResult,
    };
  }
}

enum InvocationType {
  actionGroup,
  knowledgeBase,
  finish,
}

extension InvocationTypeValueExtension on InvocationType {
  String toValue() {
    switch (this) {
      case InvocationType.actionGroup:
        return 'ACTION_GROUP';
      case InvocationType.knowledgeBase:
        return 'KNOWLEDGE_BASE';
      case InvocationType.finish:
        return 'FINISH';
    }
  }
}

extension InvocationTypeFromString on String {
  InvocationType toInvocationType() {
    switch (this) {
      case 'ACTION_GROUP':
        return InvocationType.actionGroup;
      case 'KNOWLEDGE_BASE':
        return InvocationType.knowledgeBase;
      case 'FINISH':
        return InvocationType.finish;
    }
    throw Exception('$this is not known in enum InvocationType');
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

  InvokeAgentResponse({
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

/// Contains details about the results from looking up the knowledge base.
class KnowledgeBaseLookupOutput {
  /// Contains metadata about the sources cited for the generated response.
  final List<RetrievedReference>? retrievedReferences;

  KnowledgeBaseLookupOutput({
    this.retrievedReferences,
  });

  factory KnowledgeBaseLookupOutput.fromJson(Map<String, dynamic> json) {
    return KnowledgeBaseLookupOutput(
      retrievedReferences: (json['retrievedReferences'] as List?)
          ?.whereNotNull()
          .map((e) => RetrievedReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final retrievedReferences = this.retrievedReferences;
    return {
      if (retrievedReferences != null)
        'retrievedReferences': retrievedReferences,
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
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_agent-runtime_Retrieve.html#API_agent-runtime_Retrieve_RequestSyntax">Retrieve
/// request</a> – in the <code>retrievalQuery</code> field
/// </li>
/// </ul>
class KnowledgeBaseQuery {
  /// The text of the query made to the knowledge base.
  final String text;

  KnowledgeBaseQuery({
    required this.text,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      'text': text,
    };
  }
}

/// Contains configurations for the knowledge base query and retrieval process.
/// For more information, see <a
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
  /// Contains a chunk of text from a data source in the knowledge base.
  final RetrievalResultContent content;

  /// Contains information about the location of the data source.
  final RetrievalResultLocation? location;

  /// Contains metadata attributes and their values for the file in the data
  /// source. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-ds.html#kb-ds-metadata">Metadata
  /// and filtering</a>.
  final Map<String, RetrievalResultMetadataValue>? metadata;

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
          json['content'] as Map<String, dynamic>),
      location: json['location'] != null
          ? RetrievalResultLocation.fromJson(
              json['location'] as Map<String, dynamic>)
          : null,
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              RetrievalResultMetadataValue.fromJson(
                  e as Map<String, dynamic>))),
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
  /// The unique identifier of the knowledge base that is queried and the
  /// foundation model used for generation.
  final String knowledgeBaseId;

  /// The ARN of the foundation model used to generate a response.
  final String modelArn;

  /// Contains configurations for response generation based on the knowwledge base
  /// query results.
  final GenerationConfiguration? generationConfiguration;

  /// Contains configurations for how to retrieve and return the knowledge base
  /// query.
  final KnowledgeBaseRetrievalConfiguration? retrievalConfiguration;

  KnowledgeBaseRetrieveAndGenerateConfiguration({
    required this.knowledgeBaseId,
    required this.modelArn,
    this.generationConfiguration,
    this.retrievalConfiguration,
  });

  Map<String, dynamic> toJson() {
    final knowledgeBaseId = this.knowledgeBaseId;
    final modelArn = this.modelArn;
    final generationConfiguration = this.generationConfiguration;
    final retrievalConfiguration = this.retrievalConfiguration;
    return {
      'knowledgeBaseId': knowledgeBaseId,
      'modelArn': modelArn,
      if (generationConfiguration != null)
        'generationConfiguration': generationConfiguration,
      if (retrievalConfiguration != null)
        'retrievalConfiguration': retrievalConfiguration,
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

  KnowledgeBaseVectorSearchConfiguration({
    this.filter,
    this.numberOfResults,
    this.overrideSearchType,
  });

  Map<String, dynamic> toJson() {
    final filter = this.filter;
    final numberOfResults = this.numberOfResults;
    final overrideSearchType = this.overrideSearchType;
    return {
      if (filter != null) 'filter': filter,
      if (numberOfResults != null) 'numberOfResults': numberOfResults,
      if (overrideSearchType != null)
        'overrideSearchType': overrideSearchType.toValue(),
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
      inferenceConfiguration: json['inferenceConfiguration'] != null
          ? InferenceConfiguration.fromJson(
              json['inferenceConfiguration'] as Map<String, dynamic>)
          : null,
      overrideLambda: json['overrideLambda'] as String?,
      parserMode: (json['parserMode'] as String?)?.toCreationMode(),
      promptCreationMode:
          (json['promptCreationMode'] as String?)?.toCreationMode(),
      text: json['text'] as String?,
      traceId: json['traceId'] as String?,
      type: (json['type'] as String?)?.toPromptType(),
    );
  }

  Map<String, dynamic> toJson() {
    final inferenceConfiguration = this.inferenceConfiguration;
    final overrideLambda = this.overrideLambda;
    final parserMode = this.parserMode;
    final promptCreationMode = this.promptCreationMode;
    final text = this.text;
    final traceId = this.traceId;
    final type = this.type;
    return {
      if (inferenceConfiguration != null)
        'inferenceConfiguration': inferenceConfiguration,
      if (overrideLambda != null) 'overrideLambda': overrideLambda,
      if (parserMode != null) 'parserMode': parserMode.toValue(),
      if (promptCreationMode != null)
        'promptCreationMode': promptCreationMode.toValue(),
      if (text != null) 'text': text,
      if (traceId != null) 'traceId': traceId,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Contains the result or output of an action group or knowledge base, or the
/// response to the user.
class Observation {
  /// Contains the JSON-formatted string returned by the API invoked by the action
  /// group.
  final ActionGroupInvocationOutput? actionGroupInvocationOutput;

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
      type: (json['type'] as String?)?.toType(),
    );
  }

  Map<String, dynamic> toJson() {
    final actionGroupInvocationOutput = this.actionGroupInvocationOutput;
    final finalResponse = this.finalResponse;
    final knowledgeBaseLookupOutput = this.knowledgeBaseLookupOutput;
    final repromptResponse = this.repromptResponse;
    final traceId = this.traceId;
    final type = this.type;
    return {
      if (actionGroupInvocationOutput != null)
        'actionGroupInvocationOutput': actionGroupInvocationOutput,
      if (finalResponse != null) 'finalResponse': finalResponse,
      if (knowledgeBaseLookupOutput != null)
        'knowledgeBaseLookupOutput': knowledgeBaseLookupOutput,
      if (repromptResponse != null) 'repromptResponse': repromptResponse,
      if (traceId != null) 'traceId': traceId,
      if (type != null) 'type': type.toValue(),
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
    final observation = this.observation;
    final rationale = this.rationale;
    return {
      if (invocationInput != null) 'invocationInput': invocationInput,
      if (modelInvocationInput != null)
        'modelInvocationInput': modelInvocationInput,
      if (observation != null) 'observation': observation,
      if (rationale != null) 'rationale': rationale,
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

/// The foundation model output from the post-processing step.
class PostProcessingModelInvocationOutput {
  /// Details about the response from the Lambda parsing of the output of the
  /// post-processing step.
  final PostProcessingParsedResponse? parsedResponse;

  /// The unique identifier of the trace.
  final String? traceId;

  PostProcessingModelInvocationOutput({
    this.parsedResponse,
    this.traceId,
  });

  factory PostProcessingModelInvocationOutput.fromJson(
      Map<String, dynamic> json) {
    return PostProcessingModelInvocationOutput(
      parsedResponse: json['parsedResponse'] != null
          ? PostProcessingParsedResponse.fromJson(
              json['parsedResponse'] as Map<String, dynamic>)
          : null,
      traceId: json['traceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final parsedResponse = this.parsedResponse;
    final traceId = this.traceId;
    return {
      if (parsedResponse != null) 'parsedResponse': parsedResponse,
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

/// The foundation model output from the pre-processing step.
class PreProcessingModelInvocationOutput {
  /// Details about the response from the Lambda parsing of the output of the
  /// pre-processing step.
  final PreProcessingParsedResponse? parsedResponse;

  /// The unique identifier of the trace.
  final String? traceId;

  PreProcessingModelInvocationOutput({
    this.parsedResponse,
    this.traceId,
  });

  factory PreProcessingModelInvocationOutput.fromJson(
      Map<String, dynamic> json) {
    return PreProcessingModelInvocationOutput(
      parsedResponse: json['parsedResponse'] != null
          ? PreProcessingParsedResponse.fromJson(
              json['parsedResponse'] as Map<String, dynamic>)
          : null,
      traceId: json['traceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final parsedResponse = this.parsedResponse;
    final traceId = this.traceId;
    return {
      if (parsedResponse != null) 'parsedResponse': parsedResponse,
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
  /// <a href="https://docs.anthropic.com/claude/docs/use-xml-tags">Use XML tags
  /// with Anthropic Claude models</a>
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

enum PromptType {
  preProcessing,
  orchestration,
  knowledgeBaseResponseGeneration,
  postProcessing,
}

extension PromptTypeValueExtension on PromptType {
  String toValue() {
    switch (this) {
      case PromptType.preProcessing:
        return 'PRE_PROCESSING';
      case PromptType.orchestration:
        return 'ORCHESTRATION';
      case PromptType.knowledgeBaseResponseGeneration:
        return 'KNOWLEDGE_BASE_RESPONSE_GENERATION';
      case PromptType.postProcessing:
        return 'POST_PROCESSING';
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
      case 'KNOWLEDGE_BASE_RESPONSE_GENERATION':
        return PromptType.knowledgeBaseResponseGeneration;
      case 'POST_PROCESSING':
        return PromptType.postProcessing;
    }
    throw Exception('$this is not known in enum PromptType');
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
          ?.whereNotNull()
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
      source: (json['source'] as String?)?.toSource(),
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    final text = this.text;
    return {
      if (source != null) 'source': source.toValue(),
      if (text != null) 'text': text,
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
                  .whereNotNull()
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

enum ResponseState {
  failure,
  reprompt,
}

extension ResponseStateValueExtension on ResponseState {
  String toValue() {
    switch (this) {
      case ResponseState.failure:
        return 'FAILURE';
      case ResponseState.reprompt:
        return 'REPROMPT';
    }
  }
}

extension ResponseStateFromString on String {
  ResponseState toResponseState() {
    switch (this) {
      case 'FAILURE':
        return ResponseState.failure;
      case 'REPROMPT':
        return ResponseState.reprompt;
    }
    throw Exception('$this is not known in enum ResponseState');
  }
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

  /// An internal server error occurred. Retry your request.
  final InternalServerException? internalServerException;

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
    this.internalServerException,
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
      internalServerException: json['internalServerException'] != null
          ? InternalServerException.fromJson(
              json['internalServerException'] as Map<String, dynamic>)
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

  /// Knowledge base data sources that contain a metadata attribute whose name
  /// matches the <code>key</code> and whose value doesn't match the
  /// <code>value</code> in this object are returned.
  ///
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

/// Contains the cited text from the data source.
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
  /// The cited text from the data source.
  final String text;

  RetrievalResultContent({
    required this.text,
  });

  factory RetrievalResultContent.fromJson(Map<String, dynamic> json) {
    return RetrievalResultContent(
      text: json['text'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      'text': text,
    };
  }
}

/// Contains information about the location of the data source.
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
/// response</a> – in the <code>locatino</code> field
/// </li>
/// </ul>
class RetrievalResultLocation {
  /// The type of the location of the data source.
  final RetrievalResultLocationType type;

  /// Contains the S3 location of the data source.
  final RetrievalResultS3Location? s3Location;

  RetrievalResultLocation({
    required this.type,
    this.s3Location,
  });

  factory RetrievalResultLocation.fromJson(Map<String, dynamic> json) {
    return RetrievalResultLocation(
      type: (json['type'] as String).toRetrievalResultLocationType(),
      s3Location: json['s3Location'] != null
          ? RetrievalResultS3Location.fromJson(
              json['s3Location'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final s3Location = this.s3Location;
    return {
      'type': type.toValue(),
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

enum RetrievalResultLocationType {
  s3,
}

extension RetrievalResultLocationTypeValueExtension
    on RetrievalResultLocationType {
  String toValue() {
    switch (this) {
      case RetrievalResultLocationType.s3:
        return 'S3';
    }
  }
}

extension RetrievalResultLocationTypeFromString on String {
  RetrievalResultLocationType toRetrievalResultLocationType() {
    switch (this) {
      case 'S3':
        return RetrievalResultLocationType.s3;
    }
    throw Exception('$this is not known in enum RetrievalResultLocationType');
  }
}

class RetrievalResultMetadataValue {
  RetrievalResultMetadataValue();

  factory RetrievalResultMetadataValue.fromJson(Map<String, dynamic> _) {
    return RetrievalResultMetadataValue();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the S3 location of the data source.
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
  /// The S3 URI of the data source.
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
  /// The type of resource that is queried by the request.
  final RetrieveAndGenerateType type;

  /// The configuration used with the external source wrapper object in the
  /// retrieveAndGenerate function.
  final ExternalSourcesRetrieveAndGenerateConfiguration?
      externalSourcesConfiguration;

  /// Contains details about the resource being queried.
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
      'type': type.toValue(),
      if (externalSourcesConfiguration != null)
        'externalSourcesConfiguration': externalSourcesConfiguration,
      if (knowledgeBaseConfiguration != null)
        'knowledgeBaseConfiguration': knowledgeBaseConfiguration,
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
  /// The query made to the knowledge base.
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
      text: json['text'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      'text': text,
    };
  }
}

class RetrieveAndGenerateResponse {
  /// Contains the response generated from querying the knowledge base.
  final RetrieveAndGenerateOutput output;

  /// The unique identifier of the session. Reuse the same value to continue the
  /// same session with the knowledge base.
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
          json['output'] as Map<String, dynamic>),
      sessionId: json['sessionId'] as String,
      citations: (json['citations'] as List?)
          ?.whereNotNull()
          .map((e) => Citation.fromJson(e as Map<String, dynamic>))
          .toList(),
      guardrailAction: (json['guardrailAction'] as String?)?.toGuadrailAction(),
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
      if (guardrailAction != null) 'guardrailAction': guardrailAction.toValue(),
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

enum RetrieveAndGenerateType {
  knowledgeBase,
  externalSources,
}

extension RetrieveAndGenerateTypeValueExtension on RetrieveAndGenerateType {
  String toValue() {
    switch (this) {
      case RetrieveAndGenerateType.knowledgeBase:
        return 'KNOWLEDGE_BASE';
      case RetrieveAndGenerateType.externalSources:
        return 'EXTERNAL_SOURCES';
    }
  }
}

extension RetrieveAndGenerateTypeFromString on String {
  RetrieveAndGenerateType toRetrieveAndGenerateType() {
    switch (this) {
      case 'KNOWLEDGE_BASE':
        return RetrieveAndGenerateType.knowledgeBase;
      case 'EXTERNAL_SOURCES':
        return RetrieveAndGenerateType.externalSources;
    }
    throw Exception('$this is not known in enum RetrieveAndGenerateType');
  }
}

class RetrieveResponse {
  /// A list of results from querying the knowledge base.
  final List<KnowledgeBaseRetrievalResult> retrievalResults;

  /// If there are more results than can fit in the response, the response returns
  /// a <code>nextToken</code>. Use this token in the <code>nextToken</code> field
  /// of another request to retrieve the next batch of results.
  final String? nextToken;

  RetrieveResponse({
    required this.retrievalResults,
    this.nextToken,
  });

  factory RetrieveResponse.fromJson(Map<String, dynamic> json) {
    return RetrieveResponse(
      retrievalResults: (json['retrievalResults'] as List)
          .whereNotNull()
          .map((e) =>
              KnowledgeBaseRetrievalResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final retrievalResults = this.retrievalResults;
    final nextToken = this.nextToken;
    return {
      'retrievalResults': retrievalResults,
      if (nextToken != null) 'nextToken': nextToken,
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
  final Map<String, RetrievalResultMetadataValue>? metadata;

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
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              RetrievalResultMetadataValue.fromJson(
                  e as Map<String, dynamic>))),
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
          ?.whereNotNull()
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

enum SearchType {
  hybrid,
  semantic,
}

extension SearchTypeValueExtension on SearchType {
  String toValue() {
    switch (this) {
      case SearchType.hybrid:
        return 'HYBRID';
      case SearchType.semantic:
        return 'SEMANTIC';
    }
  }
}

extension SearchTypeFromString on String {
  SearchType toSearchType() {
    switch (this) {
      case 'HYBRID':
        return SearchType.hybrid;
      case 'SEMANTIC':
        return SearchType.semantic;
    }
    throw Exception('$this is not known in enum SearchType');
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

  /// Contains attributes that persist across a prompt and the values of those
  /// attributes. These attributes replace the $prompt_session_attributes$
  /// placeholder variable in the orchestration prompt template. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-placeholders.html">Prompt
  /// template placeholder variables</a>.
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
  /// attributes.
  final Map<String, String>? sessionAttributes;

  SessionState({
    this.invocationId,
    this.promptSessionAttributes,
    this.returnControlInvocationResults,
    this.sessionAttributes,
  });

  Map<String, dynamic> toJson() {
    final invocationId = this.invocationId;
    final promptSessionAttributes = this.promptSessionAttributes;
    final returnControlInvocationResults = this.returnControlInvocationResults;
    final sessionAttributes = this.sessionAttributes;
    return {
      if (invocationId != null) 'invocationId': invocationId,
      if (promptSessionAttributes != null)
        'promptSessionAttributes': promptSessionAttributes,
      if (returnControlInvocationResults != null)
        'returnControlInvocationResults': returnControlInvocationResults,
      if (sessionAttributes != null) 'sessionAttributes': sessionAttributes,
    };
  }
}

enum Source {
  actionGroup,
  knowledgeBase,
  parser,
}

extension SourceValueExtension on Source {
  String toValue() {
    switch (this) {
      case Source.actionGroup:
        return 'ACTION_GROUP';
      case Source.knowledgeBase:
        return 'KNOWLEDGE_BASE';
      case Source.parser:
        return 'PARSER';
    }
  }
}

extension SourceFromString on String {
  Source toSource() {
    switch (this) {
      case 'ACTION_GROUP':
        return Source.actionGroup;
      case 'KNOWLEDGE_BASE':
        return Source.knowledgeBase;
      case 'PARSER':
        return Source.parser;
    }
    throw Exception('$this is not known in enum Source');
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

/// Contains one part of the agent's reasoning process and results from calling
/// API actions and querying knowledge bases. You can use the trace to
/// understand how the agent arrived at the response it provided the customer.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/agents-test.html#trace-enablement">Trace
/// enablement</a>.
class Trace {
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

  Trace({
    this.failureTrace,
    this.guardrailTrace,
    this.orchestrationTrace,
    this.postProcessingTrace,
    this.preProcessingTrace,
  });

  factory Trace.fromJson(Map<String, dynamic> json) {
    return Trace(
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
    );
  }

  Map<String, dynamic> toJson() {
    final failureTrace = this.failureTrace;
    final guardrailTrace = this.guardrailTrace;
    final orchestrationTrace = this.orchestrationTrace;
    final postProcessingTrace = this.postProcessingTrace;
    final preProcessingTrace = this.preProcessingTrace;
    return {
      if (failureTrace != null) 'failureTrace': failureTrace,
      if (guardrailTrace != null) 'guardrailTrace': guardrailTrace,
      if (orchestrationTrace != null) 'orchestrationTrace': orchestrationTrace,
      if (postProcessingTrace != null)
        'postProcessingTrace': postProcessingTrace,
      if (preProcessingTrace != null) 'preProcessingTrace': preProcessingTrace,
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
    this.sessionId,
    this.trace,
  });

  factory TracePart.fromJson(Map<String, dynamic> json) {
    return TracePart(
      agentAliasId: json['agentAliasId'] as String?,
      agentId: json['agentId'] as String?,
      agentVersion: json['agentVersion'] as String?,
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
    final sessionId = this.sessionId;
    final trace = this.trace;
    return {
      if (agentAliasId != null) 'agentAliasId': agentAliasId,
      if (agentId != null) 'agentId': agentId,
      if (agentVersion != null) 'agentVersion': agentVersion,
      if (sessionId != null) 'sessionId': sessionId,
      if (trace != null) 'trace': trace,
    };
  }
}

enum Type {
  actionGroup,
  knowledgeBase,
  finish,
  askUser,
  reprompt,
}

extension TypeValueExtension on Type {
  String toValue() {
    switch (this) {
      case Type.actionGroup:
        return 'ACTION_GROUP';
      case Type.knowledgeBase:
        return 'KNOWLEDGE_BASE';
      case Type.finish:
        return 'FINISH';
      case Type.askUser:
        return 'ASK_USER';
      case Type.reprompt:
        return 'REPROMPT';
    }
  }
}

extension TypeFromString on String {
  Type toType() {
    switch (this) {
      case 'ACTION_GROUP':
        return Type.actionGroup;
      case 'KNOWLEDGE_BASE':
        return Type.knowledgeBase;
      case 'FINISH':
        return Type.finish;
      case 'ASK_USER':
        return Type.askUser;
      case 'REPROMPT':
        return Type.reprompt;
    }
    throw Exception('$this is not known in enum Type');
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(message: message),
  'ValidationException': (type, message) =>
      ValidationException(message: message),
};
