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

/// Describes the API operations for running inference using Amazon Bedrock
/// models.
class BedrockRuntime {
  final _s.RestJsonProtocol _protocol;
  BedrockRuntime({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'bedrock-runtime',
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

  /// Sends messages to the specified Amazon Bedrock model.
  /// <code>Converse</code> provides a consistent interface that works with all
  /// models that support messages. This allows you to write code once and use
  /// it with different models. Should a model have unique inference parameters,
  /// you can also pass those unique parameters to the model. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/api-methods-run.html">Run
  /// inference</a> in the Bedrock User Guide.
  ///
  /// This operation requires permission for the
  /// <code>bedrock:InvokeModel</code> action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ModelTimeoutException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ModelNotReadyException].
  /// May throw [ModelErrorException].
  ///
  /// Parameter [messages] :
  /// The messages that you want to send to the model.
  ///
  /// Parameter [modelId] :
  /// The identifier for the model that you want to call.
  ///
  /// The <code>modelId</code> to provide depends on the type of model that you
  /// use:
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
  /// </ul>
  ///
  /// Parameter [additionalModelRequestFields] :
  /// Additional inference parameters that the model supports, beyond the base
  /// set of inference parameters that <code>Converse</code> supports in the
  /// <code>inferenceConfig</code> field. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Model
  /// parameters</a>.
  ///
  /// Parameter [additionalModelResponseFieldPaths] :
  /// Additional model parameters field paths to return in the response.
  /// <code>Converse</code> returns the requested fields as a JSON Pointer
  /// object in the <code>additionalModelResultFields</code> field. The
  /// following is example JSON for
  /// <code>additionalModelResponseFieldPaths</code>.
  ///
  /// <code>[ "/stop_sequence" ]</code>
  ///
  /// For information about the JSON Pointer syntax, see the <a
  /// href="https://datatracker.ietf.org/doc/html/rfc6901">Internet Engineering
  /// Task Force (IETF)</a> documentation.
  ///
  /// <code>Converse</code> rejects an empty JSON Pointer or incorrectly
  /// structured JSON Pointer with a <code>400</code> error code. if the JSON
  /// Pointer is valid, but the requested field is not in the model response, it
  /// is ignored by <code>Converse</code>.
  ///
  /// Parameter [inferenceConfig] :
  /// Inference parameters to pass to the model. <code>Converse</code> supports
  /// a base set of inference parameters. If you need to pass additional
  /// parameters that the model supports, use the
  /// <code>additionalModelRequestFields</code> request field.
  ///
  /// Parameter [system] :
  /// A system prompt to pass to the model.
  ///
  /// Parameter [toolConfig] :
  /// Configuration information for the tools that the model can use when
  /// generating a response.
  /// <note>
  /// This field is only supported by Anthropic Claude 3, Cohere Command R,
  /// Cohere Command R+, and Mistral Large models.
  /// </note>
  Future<ConverseResponse> converse({
    required List<Message> messages,
    required String modelId,
    Document? additionalModelRequestFields,
    List<String>? additionalModelResponseFieldPaths,
    InferenceConfiguration? inferenceConfig,
    List<SystemContentBlock>? system,
    ToolConfiguration? toolConfig,
  }) async {
    final $payload = <String, dynamic>{
      'messages': messages,
      if (additionalModelRequestFields != null)
        'additionalModelRequestFields': additionalModelRequestFields,
      if (additionalModelResponseFieldPaths != null)
        'additionalModelResponseFieldPaths': additionalModelResponseFieldPaths,
      if (inferenceConfig != null) 'inferenceConfig': inferenceConfig,
      if (system != null) 'system': system,
      if (toolConfig != null) 'toolConfig': toolConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/model/${Uri.encodeComponent(modelId)}/converse',
      exceptionFnMap: _exceptionFns,
    );
    return ConverseResponse.fromJson(response);
  }

  /// Sends messages to the specified Amazon Bedrock model and returns the
  /// response in a stream. <code>ConverseStream</code> provides a consistent
  /// API that works with all Amazon Bedrock models that support messages. This
  /// allows you to write code once and use it with different models. Should a
  /// model have unique inference parameters, you can also pass those unique
  /// parameters to the model. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/api-methods-run.html">Run
  /// inference</a> in the Bedrock User Guide.
  ///
  /// To find out if a model supports streaming, call <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_GetFoundationModel.html">GetFoundationModel</a>
  /// and check the <code>responseStreamingSupported</code> field in the
  /// response.
  ///
  /// For example code, see <i>Invoke model with streaming code example</i> in
  /// the <i>Amazon Bedrock User Guide</i>.
  ///
  /// This operation requires permission for the
  /// <code>bedrock:InvokeModelWithResponseStream</code> action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ModelTimeoutException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ModelNotReadyException].
  /// May throw [ModelErrorException].
  ///
  /// Parameter [messages] :
  /// The messages that you want to send to the model.
  ///
  /// Parameter [modelId] :
  /// The ID for the model.
  ///
  /// The <code>modelId</code> to provide depends on the type of model that you
  /// use:
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
  /// </ul>
  ///
  /// Parameter [additionalModelRequestFields] :
  /// Additional inference parameters that the model supports, beyond the base
  /// set of inference parameters that <code>ConverseStream</code> supports in
  /// the <code>inferenceConfig</code> field.
  ///
  /// Parameter [additionalModelResponseFieldPaths] :
  /// Additional model parameters field paths to return in the response.
  /// <code>ConverseStream</code> returns the requested fields as a JSON Pointer
  /// object in the <code>additionalModelResultFields</code> field. The
  /// following is example JSON for
  /// <code>additionalModelResponseFieldPaths</code>.
  ///
  /// <code>[ "/stop_sequence" ]</code>
  ///
  /// For information about the JSON Pointer syntax, see the <a
  /// href="https://datatracker.ietf.org/doc/html/rfc6901">Internet Engineering
  /// Task Force (IETF)</a> documentation.
  ///
  /// <code>ConverseStream</code> rejects an empty JSON Pointer or incorrectly
  /// structured JSON Pointer with a <code>400</code> error code. if the JSON
  /// Pointer is valid, but the requested field is not in the model response, it
  /// is ignored by <code>ConverseStream</code>.
  ///
  /// Parameter [inferenceConfig] :
  /// Inference parameters to pass to the model. <code>ConverseStream</code>
  /// supports a base set of inference parameters. If you need to pass
  /// additional parameters that the model supports, use the
  /// <code>additionalModelRequestFields</code> request field.
  ///
  /// Parameter [system] :
  /// A system prompt to send to the model.
  ///
  /// Parameter [toolConfig] :
  /// Configuration information for the tools that the model can use when
  /// generating a response.
  /// <note>
  /// This field is only supported by Anthropic Claude 3 models.
  /// </note>
  Future<ConverseStreamResponse> converseStream({
    required List<Message> messages,
    required String modelId,
    Document? additionalModelRequestFields,
    List<String>? additionalModelResponseFieldPaths,
    InferenceConfiguration? inferenceConfig,
    List<SystemContentBlock>? system,
    ToolConfiguration? toolConfig,
  }) async {
    final $payload = <String, dynamic>{
      'messages': messages,
      if (additionalModelRequestFields != null)
        'additionalModelRequestFields': additionalModelRequestFields,
      if (additionalModelResponseFieldPaths != null)
        'additionalModelResponseFieldPaths': additionalModelResponseFieldPaths,
      if (inferenceConfig != null) 'inferenceConfig': inferenceConfig,
      if (system != null) 'system': system,
      if (toolConfig != null) 'toolConfig': toolConfig,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/model/${Uri.encodeComponent(modelId)}/converse-stream',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return ConverseStreamResponse(
      stream: ConverseStreamOutput.fromJson($json),
    );
  }

  /// Invokes the specified Amazon Bedrock model to run inference using the
  /// prompt and inference parameters provided in the request body. You use
  /// model inference to generate text, images, and embeddings.
  ///
  /// For example code, see <i>Invoke model code examples</i> in the <i>Amazon
  /// Bedrock User Guide</i>.
  ///
  /// This operation requires permission for the
  /// <code>bedrock:InvokeModel</code> action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ModelTimeoutException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ModelNotReadyException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ModelErrorException].
  ///
  /// Parameter [body] :
  /// The prompt and inference parameters in the format specified in the
  /// <code>contentType</code> in the header. To see the format and content of
  /// the request and response bodies for different models, refer to <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
  /// parameters</a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/api-methods-run.html">Run
  /// inference</a> in the Bedrock User Guide.
  ///
  /// Parameter [modelId] :
  /// The unique identifier of the model to invoke to run inference.
  ///
  /// The <code>modelId</code> to provide depends on the type of model that you
  /// use:
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
  /// </ul>
  ///
  /// Parameter [accept] :
  /// The desired MIME type of the inference body in the response. The default
  /// value is <code>application/json</code>.
  ///
  /// Parameter [contentType] :
  /// The MIME type of the input data in the request. The default value is
  /// <code>application/json</code>.
  ///
  /// Parameter [guardrailIdentifier] :
  /// The unique identifier of the guardrail that you want to use. If you don't
  /// provide a value, no guardrail is applied to the invocation.
  ///
  /// An error will be thrown in the following situations.
  ///
  /// <ul>
  /// <li>
  /// You don't provide a guardrail identifier but you specify the
  /// <code>amazon-bedrock-guardrailConfig</code> field in the request body.
  /// </li>
  /// <li>
  /// You enable the guardrail but the <code>contentType</code> isn't
  /// <code>application/json</code>.
  /// </li>
  /// <li>
  /// You provide a guardrail identifier, but <code>guardrailVersion</code>
  /// isn't specified.
  /// </li>
  /// </ul>
  ///
  /// Parameter [guardrailVersion] :
  /// The version number for the guardrail. The value can also be
  /// <code>DRAFT</code>.
  ///
  /// Parameter [trace] :
  /// Specifies whether to enable or disable the Bedrock trace. If enabled, you
  /// can see the full Bedrock trace.
  Future<InvokeModelResponse> invokeModel({
    required Uint8List body,
    required String modelId,
    String? accept,
    String? contentType,
    String? guardrailIdentifier,
    String? guardrailVersion,
    Trace? trace,
  }) async {
    final headers = <String, String>{
      if (accept != null) 'Accept': accept.toString(),
      if (contentType != null) 'Content-Type': contentType.toString(),
      if (guardrailIdentifier != null)
        'X-Amzn-Bedrock-GuardrailIdentifier': guardrailIdentifier.toString(),
      if (guardrailVersion != null)
        'X-Amzn-Bedrock-GuardrailVersion': guardrailVersion.toString(),
      if (trace != null) 'X-Amzn-Bedrock-Trace': trace.toValue(),
    };
    final response = await _protocol.sendRaw(
      payload: body,
      method: 'POST',
      requestUri: '/model/${Uri.encodeComponent(modelId)}/invoke',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return InvokeModelResponse(
      body: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type')!,
    );
  }

  /// Invoke the specified Amazon Bedrock model to run inference using the
  /// prompt and inference parameters provided in the request body. The response
  /// is returned in a stream.
  ///
  /// To see if a model supports streaming, call <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_GetFoundationModel.html">GetFoundationModel</a>
  /// and check the <code>responseStreamingSupported</code> field in the
  /// response.
  /// <note>
  /// The CLI doesn't support <code>InvokeModelWithResponseStream</code>.
  /// </note>
  /// For example code, see <i>Invoke model with streaming code example</i> in
  /// the <i>Amazon Bedrock User Guide</i>.
  ///
  /// This operation requires permissions to perform the
  /// <code>bedrock:InvokeModelWithResponseStream</code> action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ModelTimeoutException].
  /// May throw [InternalServerException].
  /// May throw [ModelStreamErrorException].
  /// May throw [ValidationException].
  /// May throw [ModelNotReadyException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ModelErrorException].
  ///
  /// Parameter [body] :
  /// The prompt and inference parameters in the format specified in the
  /// <code>contentType</code> in the header. To see the format and content of
  /// the request and response bodies for different models, refer to <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
  /// parameters</a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/api-methods-run.html">Run
  /// inference</a> in the Bedrock User Guide.
  ///
  /// Parameter [modelId] :
  /// The unique identifier of the model to invoke to run inference.
  ///
  /// The <code>modelId</code> to provide depends on the type of model that you
  /// use:
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
  /// </ul>
  ///
  /// Parameter [accept] :
  /// The desired MIME type of the inference body in the response. The default
  /// value is <code>application/json</code>.
  ///
  /// Parameter [contentType] :
  /// The MIME type of the input data in the request. The default value is
  /// <code>application/json</code>.
  ///
  /// Parameter [guardrailIdentifier] :
  /// The unique identifier of the guardrail that you want to use. If you don't
  /// provide a value, no guardrail is applied to the invocation.
  ///
  /// An error is thrown in the following situations.
  ///
  /// <ul>
  /// <li>
  /// You don't provide a guardrail identifier but you specify the
  /// <code>amazon-bedrock-guardrailConfig</code> field in the request body.
  /// </li>
  /// <li>
  /// You enable the guardrail but the <code>contentType</code> isn't
  /// <code>application/json</code>.
  /// </li>
  /// <li>
  /// You provide a guardrail identifier, but <code>guardrailVersion</code>
  /// isn't specified.
  /// </li>
  /// </ul>
  ///
  /// Parameter [guardrailVersion] :
  /// The version number for the guardrail. The value can also be
  /// <code>DRAFT</code>.
  ///
  /// Parameter [trace] :
  /// Specifies whether to enable or disable the Bedrock trace. If enabled, you
  /// can see the full Bedrock trace.
  Future<InvokeModelWithResponseStreamResponse> invokeModelWithResponseStream({
    required Uint8List body,
    required String modelId,
    String? accept,
    String? contentType,
    String? guardrailIdentifier,
    String? guardrailVersion,
    Trace? trace,
  }) async {
    final headers = <String, String>{
      if (accept != null) 'X-Amzn-Bedrock-Accept': accept.toString(),
      if (contentType != null) 'Content-Type': contentType.toString(),
      if (guardrailIdentifier != null)
        'X-Amzn-Bedrock-GuardrailIdentifier': guardrailIdentifier.toString(),
      if (guardrailVersion != null)
        'X-Amzn-Bedrock-GuardrailVersion': guardrailVersion.toString(),
      if (trace != null) 'X-Amzn-Bedrock-Trace': trace.toValue(),
    };
    final response = await _protocol.sendRaw(
      payload: body,
      method: 'POST',
      requestUri:
          '/model/${Uri.encodeComponent(modelId)}/invoke-with-response-stream',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return InvokeModelWithResponseStreamResponse(
      body: ResponseStream.fromJson($json),
      contentType: _s.extractHeaderStringValue(
          response.headers, 'X-Amzn-Bedrock-Content-Type')!,
    );
  }
}

/// The model must request at least one tool (no text is generated).
class AnyToolChoice {
  AnyToolChoice();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The Model automatically decides if a tool should be called or to whether to
/// generate text instead.
class AutoToolChoice {
  AutoToolChoice();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A block of content for a message.
class ContentBlock {
  /// Image to include in the message.
  /// <note>
  /// This field is only supported by Anthropic Claude 3 models.
  /// </note>
  final ImageBlock? image;

  /// Text to include in the message.
  final String? text;

  /// The result for a tool request that a model makes.
  final ToolResultBlock? toolResult;

  /// Information about a tool use request from a model.
  final ToolUseBlock? toolUse;

  ContentBlock({
    this.image,
    this.text,
    this.toolResult,
    this.toolUse,
  });

  factory ContentBlock.fromJson(Map<String, dynamic> json) {
    return ContentBlock(
      image: json['image'] != null
          ? ImageBlock.fromJson(json['image'] as Map<String, dynamic>)
          : null,
      text: json['text'] as String?,
      toolResult: json['toolResult'] != null
          ? ToolResultBlock.fromJson(json['toolResult'] as Map<String, dynamic>)
          : null,
      toolUse: json['toolUse'] != null
          ? ToolUseBlock.fromJson(json['toolUse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final image = this.image;
    final text = this.text;
    final toolResult = this.toolResult;
    final toolUse = this.toolUse;
    return {
      if (image != null) 'image': image,
      if (text != null) 'text': text,
      if (toolResult != null) 'toolResult': toolResult,
      if (toolUse != null) 'toolUse': toolUse,
    };
  }
}

/// A bock of content in a streaming response.
class ContentBlockDelta {
  /// The content text.
  final String? text;

  /// Information about a tool that the model is requesting to use.
  final ToolUseBlockDelta? toolUse;

  ContentBlockDelta({
    this.text,
    this.toolUse,
  });

  factory ContentBlockDelta.fromJson(Map<String, dynamic> json) {
    return ContentBlockDelta(
      text: json['text'] as String?,
      toolUse: json['toolUse'] != null
          ? ToolUseBlockDelta.fromJson(json['toolUse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final toolUse = this.toolUse;
    return {
      if (text != null) 'text': text,
      if (toolUse != null) 'toolUse': toolUse,
    };
  }
}

/// The content block delta event.
class ContentBlockDeltaEvent {
  /// The block index for a content block delta event.
  final int contentBlockIndex;

  /// The delta for a content block delta event.
  final ContentBlockDelta delta;

  ContentBlockDeltaEvent({
    required this.contentBlockIndex,
    required this.delta,
  });

  factory ContentBlockDeltaEvent.fromJson(Map<String, dynamic> json) {
    return ContentBlockDeltaEvent(
      contentBlockIndex: json['contentBlockIndex'] as int,
      delta: ContentBlockDelta.fromJson(json['delta'] as Map<String, dynamic>),
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

/// Content block start information.
class ContentBlockStart {
  /// Information about a tool that the model is requesting to use.
  final ToolUseBlockStart? toolUse;

  ContentBlockStart({
    this.toolUse,
  });

  factory ContentBlockStart.fromJson(Map<String, dynamic> json) {
    return ContentBlockStart(
      toolUse: json['toolUse'] != null
          ? ToolUseBlockStart.fromJson(json['toolUse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final toolUse = this.toolUse;
    return {
      if (toolUse != null) 'toolUse': toolUse,
    };
  }
}

/// Content block start event.
class ContentBlockStartEvent {
  /// The index for a content block start event.
  final int contentBlockIndex;

  /// Start information about a content block start event.
  final ContentBlockStart start;

  ContentBlockStartEvent({
    required this.contentBlockIndex,
    required this.start,
  });

  factory ContentBlockStartEvent.fromJson(Map<String, dynamic> json) {
    return ContentBlockStartEvent(
      contentBlockIndex: json['contentBlockIndex'] as int,
      start: ContentBlockStart.fromJson(json['start'] as Map<String, dynamic>),
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

/// A content block stop event.
class ContentBlockStopEvent {
  /// The index for a content block.
  final int contentBlockIndex;

  ContentBlockStopEvent({
    required this.contentBlockIndex,
  });

  factory ContentBlockStopEvent.fromJson(Map<String, dynamic> json) {
    return ContentBlockStopEvent(
      contentBlockIndex: json['contentBlockIndex'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final contentBlockIndex = this.contentBlockIndex;
    return {
      'contentBlockIndex': contentBlockIndex,
    };
  }
}

enum ConversationRole {
  user,
  assistant,
}

extension ConversationRoleValueExtension on ConversationRole {
  String toValue() {
    switch (this) {
      case ConversationRole.user:
        return 'user';
      case ConversationRole.assistant:
        return 'assistant';
    }
  }
}

extension ConversationRoleFromString on String {
  ConversationRole toConversationRole() {
    switch (this) {
      case 'user':
        return ConversationRole.user;
      case 'assistant':
        return ConversationRole.assistant;
    }
    throw Exception('$this is not known in enum ConversationRole');
  }
}

/// Metrics for a call to <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_Converse.html">Converse</a>.
class ConverseMetrics {
  /// The latency of the call to <code>Converse</code>, in milliseconds.
  final int latencyMs;

  ConverseMetrics({
    required this.latencyMs,
  });

  factory ConverseMetrics.fromJson(Map<String, dynamic> json) {
    return ConverseMetrics(
      latencyMs: json['latencyMs'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final latencyMs = this.latencyMs;
    return {
      'latencyMs': latencyMs,
    };
  }
}

/// The output from a call to <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_Converse.html">Converse</a>.
class ConverseOutput {
  /// The message that the model generates.
  final Message? message;

  ConverseOutput({
    this.message,
  });

  factory ConverseOutput.fromJson(Map<String, dynamic> json) {
    return ConverseOutput(
      message: json['message'] != null
          ? Message.fromJson(json['message'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

class ConverseResponse {
  /// Metrics for the call to <code>Converse</code>.
  final ConverseMetrics metrics;

  /// The result from the call to <code>Converse</code>.
  final ConverseOutput output;

  /// The reason why the model stopped generating output.
  final StopReason stopReason;

  /// The total number of tokens used in the call to <code>Converse</code>. The
  /// total includes the tokens input to the model and the tokens generated by the
  /// model.
  final TokenUsage usage;

  /// Additional fields in the response that are unique to the model.
  final Document? additionalModelResponseFields;

  ConverseResponse({
    required this.metrics,
    required this.output,
    required this.stopReason,
    required this.usage,
    this.additionalModelResponseFields,
  });

  factory ConverseResponse.fromJson(Map<String, dynamic> json) {
    return ConverseResponse(
      metrics:
          ConverseMetrics.fromJson(json['metrics'] as Map<String, dynamic>),
      output: ConverseOutput.fromJson(json['output'] as Map<String, dynamic>),
      stopReason: (json['stopReason'] as String).toStopReason(),
      usage: TokenUsage.fromJson(json['usage'] as Map<String, dynamic>),
      additionalModelResponseFields:
          json['additionalModelResponseFields'] != null
              ? Document.fromJson(
                  json['additionalModelResponseFields'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metrics = this.metrics;
    final output = this.output;
    final stopReason = this.stopReason;
    final usage = this.usage;
    final additionalModelResponseFields = this.additionalModelResponseFields;
    return {
      'metrics': metrics,
      'output': output,
      'stopReason': stopReason.toValue(),
      'usage': usage,
      if (additionalModelResponseFields != null)
        'additionalModelResponseFields': additionalModelResponseFields,
    };
  }
}

/// A conversation stream metadata event.
class ConverseStreamMetadataEvent {
  /// The metrics for the conversation stream metadata event.
  final ConverseStreamMetrics metrics;

  /// Usage information for the conversation stream event.
  final TokenUsage usage;

  ConverseStreamMetadataEvent({
    required this.metrics,
    required this.usage,
  });

  factory ConverseStreamMetadataEvent.fromJson(Map<String, dynamic> json) {
    return ConverseStreamMetadataEvent(
      metrics: ConverseStreamMetrics.fromJson(
          json['metrics'] as Map<String, dynamic>),
      usage: TokenUsage.fromJson(json['usage'] as Map<String, dynamic>),
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

/// Metrics for the stream.
class ConverseStreamMetrics {
  /// The latency for the streaming request, in milliseconds.
  final int latencyMs;

  ConverseStreamMetrics({
    required this.latencyMs,
  });

  factory ConverseStreamMetrics.fromJson(Map<String, dynamic> json) {
    return ConverseStreamMetrics(
      latencyMs: json['latencyMs'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final latencyMs = this.latencyMs;
    return {
      'latencyMs': latencyMs,
    };
  }
}

/// The messages output stream
class ConverseStreamOutput {
  /// The messages output content block delta.
  final ContentBlockDeltaEvent? contentBlockDelta;

  /// Start information for a content block.
  final ContentBlockStartEvent? contentBlockStart;

  /// Stop information for a content block.
  final ContentBlockStopEvent? contentBlockStop;

  /// An internal server error occurred. Retry your request.
  final InternalServerException? internalServerException;

  /// Message start information.
  final MessageStartEvent? messageStart;

  /// Message stop information.
  final MessageStopEvent? messageStop;

  /// Metadata for the converse output stream.
  final ConverseStreamMetadataEvent? metadata;

  /// A streaming error occurred. Retry your request.
  final ModelStreamErrorException? modelStreamErrorException;

  /// The number of requests exceeds the limit. Resubmit your request later.
  final ThrottlingException? throttlingException;

  /// Input validation failed. Check your request parameters and retry the
  /// request.
  final ValidationException? validationException;

  ConverseStreamOutput({
    this.contentBlockDelta,
    this.contentBlockStart,
    this.contentBlockStop,
    this.internalServerException,
    this.messageStart,
    this.messageStop,
    this.metadata,
    this.modelStreamErrorException,
    this.throttlingException,
    this.validationException,
  });

  factory ConverseStreamOutput.fromJson(Map<String, dynamic> json) {
    return ConverseStreamOutput(
      contentBlockDelta: json['contentBlockDelta'] != null
          ? ContentBlockDeltaEvent.fromJson(
              json['contentBlockDelta'] as Map<String, dynamic>)
          : null,
      contentBlockStart: json['contentBlockStart'] != null
          ? ContentBlockStartEvent.fromJson(
              json['contentBlockStart'] as Map<String, dynamic>)
          : null,
      contentBlockStop: json['contentBlockStop'] != null
          ? ContentBlockStopEvent.fromJson(
              json['contentBlockStop'] as Map<String, dynamic>)
          : null,
      internalServerException: json['internalServerException'] != null
          ? InternalServerException.fromJson(
              json['internalServerException'] as Map<String, dynamic>)
          : null,
      messageStart: json['messageStart'] != null
          ? MessageStartEvent.fromJson(
              json['messageStart'] as Map<String, dynamic>)
          : null,
      messageStop: json['messageStop'] != null
          ? MessageStopEvent.fromJson(
              json['messageStop'] as Map<String, dynamic>)
          : null,
      metadata: json['metadata'] != null
          ? ConverseStreamMetadataEvent.fromJson(
              json['metadata'] as Map<String, dynamic>)
          : null,
      modelStreamErrorException: json['modelStreamErrorException'] != null
          ? ModelStreamErrorException.fromJson(
              json['modelStreamErrorException'] as Map<String, dynamic>)
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
    final contentBlockDelta = this.contentBlockDelta;
    final contentBlockStart = this.contentBlockStart;
    final contentBlockStop = this.contentBlockStop;
    final internalServerException = this.internalServerException;
    final messageStart = this.messageStart;
    final messageStop = this.messageStop;
    final metadata = this.metadata;
    final modelStreamErrorException = this.modelStreamErrorException;
    final throttlingException = this.throttlingException;
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
      if (modelStreamErrorException != null)
        'modelStreamErrorException': modelStreamErrorException,
      if (throttlingException != null)
        'throttlingException': throttlingException,
      if (validationException != null)
        'validationException': validationException,
    };
  }
}

class ConverseStreamResponse {
  /// The output stream that the model generated.
  final ConverseStreamOutput? stream;

  ConverseStreamResponse({
    this.stream,
  });

  Map<String, dynamic> toJson() {
    final stream = this.stream;
    return {
      if (stream != null) 'stream': stream,
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

/// Image content for a message.
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
      format: (json['format'] as String).toImageFormat(),
      source: ImageSource.fromJson(json['source'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final source = this.source;
    return {
      'format': format.toValue(),
      'source': source,
    };
  }
}

enum ImageFormat {
  png,
  jpeg,
  gif,
  webp,
}

extension ImageFormatValueExtension on ImageFormat {
  String toValue() {
    switch (this) {
      case ImageFormat.png:
        return 'png';
      case ImageFormat.jpeg:
        return 'jpeg';
      case ImageFormat.gif:
        return 'gif';
      case ImageFormat.webp:
        return 'webp';
    }
  }
}

extension ImageFormatFromString on String {
  ImageFormat toImageFormat() {
    switch (this) {
      case 'png':
        return ImageFormat.png;
      case 'jpeg':
        return ImageFormat.jpeg;
      case 'gif':
        return ImageFormat.gif;
      case 'webp':
        return ImageFormat.webp;
    }
    throw Exception('$this is not known in enum ImageFormat');
  }
}

/// The source for an image.
class ImageSource {
  /// The raw image bytes for the image. If you use an AWS SDK, you don't need to
  /// base64 encode the image bytes.
  final Uint8List? bytes;

  ImageSource({
    this.bytes,
  });

  factory ImageSource.fromJson(Map<String, dynamic> json) {
    return ImageSource(
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

/// Base inference parameters to pass to a model in a call to <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_Converse.html">Converse</a>
/// or <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_ConverseStream.html">ConverseStream</a>.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
/// parameters for foundation models</a>.
///
/// If you need to pass additional parameters that the model supports, use the
/// <code>additionalModelRequestFields</code> request field in the call to
/// <code>Converse</code> or <code>ConverseStream</code>. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Model
/// parameters</a>.
class InferenceConfiguration {
  /// The maximum number of tokens to allow in the generated response. The default
  /// value is the maximum allowed value for the model that you are using. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
  /// parameters for foundatio{ "messages": [ { "role": "user", "content": [ {
  /// "text": "what's the weather in Queens, NY and Austin, TX?" } ] }, { "role":
  /// "assistant", "content": [ { "toolUse": { "toolUseId": "1", "name":
  /// "get_weather", "input": { "city": "Queens", "state": "NY" } } }, {
  /// "toolUse": { "toolUseId": "2", "name": "get_weather", "input": { "city":
  /// "Austin", "state": "TX" } } } ] }, { "role": "user", "content": [ {
  /// "toolResult": { "toolUseId": "2", "content": [ { "json": { "weather": "40" }
  /// } ] } }, { "text": "..." }, { "toolResult": { "toolUseId": "1", "content": [
  /// { "text": "result text" } ] } } ] } ], "toolConfig": { "tools": [ { "name":
  /// "get_weather", "description": "Get weather", "inputSchema": { "type":
  /// "object", "properties": { "city": { "type": "string", "description": "City
  /// of location" }, "state": { "type": "string", "description": "State of
  /// location" } }, "required": ["city", "state"] } } ] } } n models</a>.
  final int? maxTokens;

  /// A list of stop sequences. A stop sequence is a sequence of characters that
  /// causes the model to stop generating the response.
  final List<String>? stopSequences;

  /// The likelihood of the model selecting higher-probability options while
  /// generating a response. A lower value makes the model more likely to choose
  /// higher-probability options, while a higher value makes the model more likely
  /// to choose lower-probability options.
  ///
  /// The default value is the default value for the model that you are using. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
  /// parameters for foundation models</a>.
  final double? temperature;

  /// The percentage of most-likely candidates that the model considers for the
  /// next token. For example, if you choose a value of 0.8 for <code>topP</code>,
  /// the model selects from the top 80% of the probability distribution of tokens
  /// that could be next in the sequence.
  ///
  /// The default value is the default value for the model that you are using. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
  /// parameters for foundation models</a>.
  final double? topP;

  InferenceConfiguration({
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

class InvokeModelResponse {
  /// Inference response from the model in the format specified in the
  /// <code>contentType</code> header. To see the format and content of the
  /// request and response bodies for different models, refer to <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
  /// parameters</a>.
  final Uint8List body;

  /// The MIME type of the inference result.
  final String contentType;

  InvokeModelResponse({
    required this.body,
    required this.contentType,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final contentType = this.contentType;
    return {
      'body': base64Encode(body),
    };
  }
}

class InvokeModelWithResponseStreamResponse {
  /// Inference response from the model in the format specified by the
  /// <code>contentType</code> header. To see the format and content of this field
  /// for different models, refer to <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
  /// parameters</a>.
  final ResponseStream body;

  /// The MIME type of the inference result.
  final String contentType;

  InvokeModelWithResponseStreamResponse({
    required this.body,
    required this.contentType,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final contentType = this.contentType;
    return {
      'body': body,
    };
  }
}

/// A message in the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_Message.html">Message</a>
/// field. Use to send a message in a call to <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_Converse.html">Converse</a>.
class Message {
  /// The message content.
  final List<ContentBlock> content;

  /// The role that the message plays in the message.
  final ConversationRole role;

  Message({
    required this.content,
    required this.role,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      content: (json['content'] as List)
          .whereNotNull()
          .map((e) => ContentBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      role: (json['role'] as String).toConversationRole(),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final role = this.role;
    return {
      'content': content,
      'role': role.toValue(),
    };
  }
}

/// The start of a message.
class MessageStartEvent {
  /// The role for the message.
  final ConversationRole role;

  MessageStartEvent({
    required this.role,
  });

  factory MessageStartEvent.fromJson(Map<String, dynamic> json) {
    return MessageStartEvent(
      role: (json['role'] as String).toConversationRole(),
    );
  }

  Map<String, dynamic> toJson() {
    final role = this.role;
    return {
      'role': role.toValue(),
    };
  }
}

/// The stop event for a message.
class MessageStopEvent {
  /// The reason why the model stopped generating output.
  final StopReason stopReason;

  /// The additional model response fields.
  final Document? additionalModelResponseFields;

  MessageStopEvent({
    required this.stopReason,
    this.additionalModelResponseFields,
  });

  factory MessageStopEvent.fromJson(Map<String, dynamic> json) {
    return MessageStopEvent(
      stopReason: (json['stopReason'] as String).toStopReason(),
      additionalModelResponseFields:
          json['additionalModelResponseFields'] != null
              ? Document.fromJson(
                  json['additionalModelResponseFields'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stopReason = this.stopReason;
    final additionalModelResponseFields = this.additionalModelResponseFields;
    return {
      'stopReason': stopReason.toValue(),
      if (additionalModelResponseFields != null)
        'additionalModelResponseFields': additionalModelResponseFields,
    };
  }
}

/// An error occurred while streaming the response. Retry your request.
class ModelStreamErrorException implements _s.AwsException {
  final String? message;

  /// The original message.
  final String? originalMessage;

  /// The original status code.
  final int? originalStatusCode;

  ModelStreamErrorException({
    this.message,
    this.originalMessage,
    this.originalStatusCode,
  });

  factory ModelStreamErrorException.fromJson(Map<String, dynamic> json) {
    return ModelStreamErrorException(
      message: json['message'] as String?,
      originalMessage: json['originalMessage'] as String?,
      originalStatusCode: json['originalStatusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final originalMessage = this.originalMessage;
    final originalStatusCode = this.originalStatusCode;
    return {
      if (message != null) 'message': message,
      if (originalMessage != null) 'originalMessage': originalMessage,
      if (originalStatusCode != null) 'originalStatusCode': originalStatusCode,
    };
  }
}

/// The request took too long to process. Processing time exceeded the model
/// timeout length.
class ModelTimeoutException implements _s.AwsException {
  final String? message;

  ModelTimeoutException({
    this.message,
  });

  factory ModelTimeoutException.fromJson(Map<String, dynamic> json) {
    return ModelTimeoutException(
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

/// Payload content included in the response.
class PayloadPart {
  /// Base64-encoded bytes of payload data.
  final Uint8List? bytes;

  PayloadPart({
    this.bytes,
  });

  factory PayloadPart.fromJson(Map<String, dynamic> json) {
    return PayloadPart(
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

/// Definition of content in the response stream.
class ResponseStream {
  /// Content included in the response.
  final PayloadPart? chunk;

  /// An internal server error occurred. Retry your request.
  final InternalServerException? internalServerException;

  /// An error occurred while streaming the response. Retry your request.
  final ModelStreamErrorException? modelStreamErrorException;

  /// The request took too long to process. Processing time exceeded the model
  /// timeout length.
  final ModelTimeoutException? modelTimeoutException;

  /// The number or frequency of requests exceeds the limit. Resubmit your request
  /// later.
  final ThrottlingException? throttlingException;

  /// Input validation failed. Check your request parameters and retry the
  /// request.
  final ValidationException? validationException;

  ResponseStream({
    this.chunk,
    this.internalServerException,
    this.modelStreamErrorException,
    this.modelTimeoutException,
    this.throttlingException,
    this.validationException,
  });

  factory ResponseStream.fromJson(Map<String, dynamic> json) {
    return ResponseStream(
      chunk: json['chunk'] != null
          ? PayloadPart.fromJson(json['chunk'] as Map<String, dynamic>)
          : null,
      internalServerException: json['internalServerException'] != null
          ? InternalServerException.fromJson(
              json['internalServerException'] as Map<String, dynamic>)
          : null,
      modelStreamErrorException: json['modelStreamErrorException'] != null
          ? ModelStreamErrorException.fromJson(
              json['modelStreamErrorException'] as Map<String, dynamic>)
          : null,
      modelTimeoutException: json['modelTimeoutException'] != null
          ? ModelTimeoutException.fromJson(
              json['modelTimeoutException'] as Map<String, dynamic>)
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
    final chunk = this.chunk;
    final internalServerException = this.internalServerException;
    final modelStreamErrorException = this.modelStreamErrorException;
    final modelTimeoutException = this.modelTimeoutException;
    final throttlingException = this.throttlingException;
    final validationException = this.validationException;
    return {
      if (chunk != null) 'chunk': chunk,
      if (internalServerException != null)
        'internalServerException': internalServerException,
      if (modelStreamErrorException != null)
        'modelStreamErrorException': modelStreamErrorException,
      if (modelTimeoutException != null)
        'modelTimeoutException': modelTimeoutException,
      if (throttlingException != null)
        'throttlingException': throttlingException,
      if (validationException != null)
        'validationException': validationException,
    };
  }
}

/// The model must request a specific tool.
/// <note>
/// This field is only supported by Anthropic Claude 3 models.
/// </note>
class SpecificToolChoice {
  /// The name of the tool that the model must request.
  final String name;

  SpecificToolChoice({
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

enum StopReason {
  endTurn,
  toolUse,
  maxTokens,
  stopSequence,
  contentFiltered,
}

extension StopReasonValueExtension on StopReason {
  String toValue() {
    switch (this) {
      case StopReason.endTurn:
        return 'end_turn';
      case StopReason.toolUse:
        return 'tool_use';
      case StopReason.maxTokens:
        return 'max_tokens';
      case StopReason.stopSequence:
        return 'stop_sequence';
      case StopReason.contentFiltered:
        return 'content_filtered';
    }
  }
}

extension StopReasonFromString on String {
  StopReason toStopReason() {
    switch (this) {
      case 'end_turn':
        return StopReason.endTurn;
      case 'tool_use':
        return StopReason.toolUse;
      case 'max_tokens':
        return StopReason.maxTokens;
      case 'stop_sequence':
        return StopReason.stopSequence;
      case 'content_filtered':
        return StopReason.contentFiltered;
    }
    throw Exception('$this is not known in enum StopReason');
  }
}

/// A system content block
class SystemContentBlock {
  /// A system prompt for the model.
  final String? text;

  SystemContentBlock({
    this.text,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
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

/// The tokens used in a message API inference call.
class TokenUsage {
  /// The number of tokens sent in the request to the model.
  final int inputTokens;

  /// The number of tokens that the model generated for the request.
  final int outputTokens;

  /// The total of input tokens and tokens generated by the model.
  final int totalTokens;

  TokenUsage({
    required this.inputTokens,
    required this.outputTokens,
    required this.totalTokens,
  });

  factory TokenUsage.fromJson(Map<String, dynamic> json) {
    return TokenUsage(
      inputTokens: json['inputTokens'] as int,
      outputTokens: json['outputTokens'] as int,
      totalTokens: json['totalTokens'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final inputTokens = this.inputTokens;
    final outputTokens = this.outputTokens;
    final totalTokens = this.totalTokens;
    return {
      'inputTokens': inputTokens,
      'outputTokens': outputTokens,
      'totalTokens': totalTokens,
    };
  }
}

/// Information about a tool that you can use with the Converse API.
class Tool {
  /// The specfication for the tool.
  final ToolSpecification? toolSpec;

  Tool({
    this.toolSpec,
  });

  Map<String, dynamic> toJson() {
    final toolSpec = this.toolSpec;
    return {
      if (toolSpec != null) 'toolSpec': toolSpec,
    };
  }
}

/// Forces a model to use a tool.
class ToolChoice {
  /// The model must request at least one tool (no text is generated).
  final AnyToolChoice? any;

  /// The Model automatically decides if a tool should be called or to whether to
  /// generate text instead.
  final AutoToolChoice? auto;

  /// The Model must request the specified tool.
  final SpecificToolChoice? tool;

  ToolChoice({
    this.any,
    this.auto,
    this.tool,
  });

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

/// Configuration information for the tools that you pass to a model.
/// <note>
/// This field is only supported by Anthropic Claude 3, Cohere Command R, Cohere
/// Command R+, and Mistral Large models.
/// </note>
class ToolConfiguration {
  /// An array of tools that you want to pass to a model.
  final List<Tool> tools;

  /// If supported by model, forces the model to request a tool.
  final ToolChoice? toolChoice;

  ToolConfiguration({
    required this.tools,
    this.toolChoice,
  });

  Map<String, dynamic> toJson() {
    final tools = this.tools;
    final toolChoice = this.toolChoice;
    return {
      'tools': tools,
      if (toolChoice != null) 'toolChoice': toolChoice,
    };
  }
}

/// The schema for the tool. The top level schema type must be
/// <code>object</code>.
class ToolInputSchema {
  /// The JSON schema for the tool. For more information, see <a
  /// href="https://json-schema.org/understanding-json-schema/reference">JSON
  /// Schema Reference</a>.
  final Document? json;

  ToolInputSchema({
    this.json,
  });

  Map<String, dynamic> toJson() {
    final json = this.json;
    return {
      if (json != null) 'json': json,
    };
  }
}

/// A tool result block that contains the results for a tool request that the
/// model previously made.
class ToolResultBlock {
  /// The content for tool result content block.
  final List<ToolResultContentBlock> content;

  /// The ID of the tool request that this is the result for.
  final String toolUseId;

  /// The status for the tool result content block.
  /// <note>
  /// This field is only supported Anthropic Claude 3 models.
  /// </note>
  final ToolResultStatus? status;

  ToolResultBlock({
    required this.content,
    required this.toolUseId,
    this.status,
  });

  factory ToolResultBlock.fromJson(Map<String, dynamic> json) {
    return ToolResultBlock(
      content: (json['content'] as List)
          .whereNotNull()
          .map(
              (e) => ToolResultContentBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      toolUseId: json['toolUseId'] as String,
      status: (json['status'] as String?)?.toToolResultStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final toolUseId = this.toolUseId;
    final status = this.status;
    return {
      'content': content,
      'toolUseId': toolUseId,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// The tool result content block.
class ToolResultContentBlock {
  /// A tool result that is an image.
  /// <note>
  /// This field is only supported by Anthropic Claude 3 models.
  /// </note>
  final ImageBlock? image;

  /// A tool result that is JSON format data.
  final Document? json;

  /// A tool result that is text.
  final String? text;

  ToolResultContentBlock({
    this.image,
    this.json,
    this.text,
  });

  factory ToolResultContentBlock.fromJson(Map<String, dynamic> json) {
    return ToolResultContentBlock(
      image: json['image'] != null
          ? ImageBlock.fromJson(json['image'] as Map<String, dynamic>)
          : null,
      json: json['json'] != null
          ? Document.fromJson(json['json'] as Map<String, dynamic>)
          : null,
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final image = this.image;
    final json = this.json;
    final text = this.text;
    return {
      if (image != null) 'image': image,
      if (json != null) 'json': json,
      if (text != null) 'text': text,
    };
  }
}

enum ToolResultStatus {
  success,
  error,
}

extension ToolResultStatusValueExtension on ToolResultStatus {
  String toValue() {
    switch (this) {
      case ToolResultStatus.success:
        return 'success';
      case ToolResultStatus.error:
        return 'error';
    }
  }
}

extension ToolResultStatusFromString on String {
  ToolResultStatus toToolResultStatus() {
    switch (this) {
      case 'success':
        return ToolResultStatus.success;
      case 'error':
        return ToolResultStatus.error;
    }
    throw Exception('$this is not known in enum ToolResultStatus');
  }
}

/// The specification for the tool.
class ToolSpecification {
  /// The input schema for the tool in JSON format.
  final ToolInputSchema inputSchema;

  /// The name for the tool.
  final String name;

  /// The description for the tool.
  final String? description;

  ToolSpecification({
    required this.inputSchema,
    required this.name,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final inputSchema = this.inputSchema;
    final name = this.name;
    final description = this.description;
    return {
      'inputSchema': inputSchema,
      'name': name,
      if (description != null) 'description': description,
    };
  }
}

/// A tool use content block. Contains information about a tool that the model
/// is requesting be run., The model uses the result from the tool to generate a
/// response.
class ToolUseBlock {
  /// The input to pass to the tool.
  final Document input;

  /// The name of the tool that the model wants to use.
  final String name;

  /// The ID for the tool request.
  final String toolUseId;

  ToolUseBlock({
    required this.input,
    required this.name,
    required this.toolUseId,
  });

  factory ToolUseBlock.fromJson(Map<String, dynamic> json) {
    return ToolUseBlock(
      input: Document.fromJson(json['input'] as Map<String, dynamic>),
      name: json['name'] as String,
      toolUseId: json['toolUseId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final input = this.input;
    final name = this.name;
    final toolUseId = this.toolUseId;
    return {
      'input': input,
      'name': name,
      'toolUseId': toolUseId,
    };
  }
}

/// The delta for a tool use block.
class ToolUseBlockDelta {
  /// The input for a requested tool.
  final String input;

  ToolUseBlockDelta({
    required this.input,
  });

  factory ToolUseBlockDelta.fromJson(Map<String, dynamic> json) {
    return ToolUseBlockDelta(
      input: json['input'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final input = this.input;
    return {
      'input': input,
    };
  }
}

/// The start of a tool use block.
class ToolUseBlockStart {
  /// The name of the tool that the model is requesting to use.
  final String name;

  /// The ID for the tool request.
  final String toolUseId;

  ToolUseBlockStart({
    required this.name,
    required this.toolUseId,
  });

  factory ToolUseBlockStart.fromJson(Map<String, dynamic> json) {
    return ToolUseBlockStart(
      name: json['name'] as String,
      toolUseId: json['toolUseId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final toolUseId = this.toolUseId;
    return {
      'name': name,
      'toolUseId': toolUseId,
    };
  }
}

enum Trace {
  enabled,
  disabled,
}

extension TraceValueExtension on Trace {
  String toValue() {
    switch (this) {
      case Trace.enabled:
        return 'ENABLED';
      case Trace.disabled:
        return 'DISABLED';
    }
  }
}

extension TraceFromString on String {
  Trace toTrace() {
    switch (this) {
      case 'ENABLED':
        return Trace.enabled;
      case 'DISABLED':
        return Trace.disabled;
    }
    throw Exception('$this is not known in enum Trace');
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

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ModelErrorException extends _s.GenericAwsException {
  ModelErrorException({String? type, String? message})
      : super(type: type, code: 'ModelErrorException', message: message);
}

class ModelNotReadyException extends _s.GenericAwsException {
  ModelNotReadyException({String? type, String? message})
      : super(type: type, code: 'ModelNotReadyException', message: message);
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

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(message: message),
  'ModelErrorException': (type, message) =>
      ModelErrorException(type: type, message: message),
  'ModelNotReadyException': (type, message) =>
      ModelNotReadyException(type: type, message: message),
  'ModelStreamErrorException': (type, message) =>
      ModelStreamErrorException(message: message),
  'ModelTimeoutException': (type, message) =>
      ModelTimeoutException(message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(message: message),
  'ValidationException': (type, message) =>
      ValidationException(message: message),
};
