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

  /// The action to apply a guardrail.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [content] :
  /// The content details used in the request to apply the guardrail.
  ///
  /// Parameter [guardrailIdentifier] :
  /// The guardrail identifier used in the request to apply the guardrail.
  ///
  /// Parameter [guardrailVersion] :
  /// The guardrail version used in the request to apply the guardrail.
  ///
  /// Parameter [source] :
  /// The source of data used in the request to apply the guardrail.
  Future<ApplyGuardrailResponse> applyGuardrail({
    required List<GuardrailContentBlock> content,
    required String guardrailIdentifier,
    required String guardrailVersion,
    required GuardrailContentSource source,
  }) async {
    final $payload = <String, dynamic>{
      'content': content,
      'source': source.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/guardrail/${Uri.encodeComponent(guardrailIdentifier)}/version/${Uri.encodeComponent(guardrailVersion)}/apply',
      exceptionFnMap: _exceptionFns,
    );
    return ApplyGuardrailResponse.fromJson(response);
  }

  /// Sends messages to the specified Amazon Bedrock model.
  /// <code>Converse</code> provides a consistent interface that works with all
  /// models that support messages. This allows you to write code once and use
  /// it with different models. If a model has unique inference parameters, you
  /// can also pass those unique parameters to the model.
  ///
  /// Amazon Bedrock doesn't store any text, images, or documents that you
  /// provide as content. The data is only used to generate the response.
  ///
  /// For information about the Converse API, see <i>Use the Converse API</i> in
  /// the <i>Amazon Bedrock User Guide</i>. To use a guardrail, see <i>Use a
  /// guardrail with the Converse API</i> in the <i>Amazon Bedrock User
  /// Guide</i>. To use a tool with a model, see <i>Tool use (Function
  /// calling)</i> in the <i>Amazon Bedrock User Guide</i>
  ///
  /// For example code, see <i>Converse API examples</i> in the <i>Amazon
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
  /// May throw [ServiceUnavailableException].
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
  /// </ul>
  /// The Converse API doesn't support <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-import-model.html">imported
  /// models</a>.
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
  /// object in the <code>additionalModelResponseFields</code> field. The
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
  /// Parameter [guardrailConfig] :
  /// Configuration information for a guardrail that you want to use in the
  /// request.
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
    GuardrailConfiguration? guardrailConfig,
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
      if (guardrailConfig != null) 'guardrailConfig': guardrailConfig,
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
  /// parameters to the model.
  ///
  /// To find out if a model supports streaming, call <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_GetFoundationModel.html">GetFoundationModel</a>
  /// and check the <code>responseStreamingSupported</code> field in the
  /// response.
  /// <note>
  /// The CLI doesn't support streaming operations in Amazon Bedrock, including
  /// <code>ConverseStream</code>.
  /// </note>
  /// Amazon Bedrock doesn't store any text, images, or documents that you
  /// provide as content. The data is only used to generate the response.
  ///
  /// For information about the Converse API, see <i>Use the Converse API</i> in
  /// the <i>Amazon Bedrock User Guide</i>. To use a guardrail, see <i>Use a
  /// guardrail with the Converse API</i> in the <i>Amazon Bedrock User
  /// Guide</i>. To use a tool with a model, see <i>Tool use (Function
  /// calling)</i> in the <i>Amazon Bedrock User Guide</i>
  ///
  /// For example code, see <i>Conversation streaming example</i> in the
  /// <i>Amazon Bedrock User Guide</i>.
  ///
  /// This operation requires permission for the
  /// <code>bedrock:InvokeModelWithResponseStream</code> action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ModelTimeoutException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
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
  /// </ul>
  /// The Converse API doesn't support <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-import-model.html">imported
  /// models</a>.
  ///
  /// Parameter [additionalModelRequestFields] :
  /// Additional inference parameters that the model supports, beyond the base
  /// set of inference parameters that <code>ConverseStream</code> supports in
  /// the <code>inferenceConfig</code> field.
  ///
  /// Parameter [additionalModelResponseFieldPaths] :
  /// Additional model parameters field paths to return in the response.
  /// <code>ConverseStream</code> returns the requested fields as a JSON Pointer
  /// object in the <code>additionalModelResponseFields</code> field. The
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
  /// Parameter [guardrailConfig] :
  /// Configuration information for a guardrail that you want to use in the
  /// request.
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
    GuardrailStreamConfiguration? guardrailConfig,
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
      if (guardrailConfig != null) 'guardrailConfig': guardrailConfig,
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ModelNotReadyException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ModelErrorException].
  ///
  /// Parameter [body] :
  /// The prompt and inference parameters in the format specified in the
  /// <code>contentType</code> in the header. You must provide the body in JSON
  /// format. To see the format and content of the request and response bodies
  /// for different models, refer to <a
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
  /// Parameter [accept] :
  /// The desired MIME type of the inference body in the response. The default
  /// value is <code>application/json</code>.
  ///
  /// Parameter [contentType] :
  /// The MIME type of the input data in the request. You must specify
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
      if (trace != null) 'X-Amzn-Bedrock-Trace': trace.value,
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
  /// The CLI doesn't support streaming operations in Amazon Bedrock, including
  /// <code>InvokeModelWithResponseStream</code>.
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ModelStreamErrorException].
  /// May throw [ValidationException].
  /// May throw [ModelNotReadyException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ModelErrorException].
  ///
  /// Parameter [body] :
  /// The prompt and inference parameters in the format specified in the
  /// <code>contentType</code> in the header. You must provide the body in JSON
  /// format. To see the format and content of the request and response bodies
  /// for different models, refer to <a
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
  /// Parameter [accept] :
  /// The desired MIME type of the inference body in the response. The default
  /// value is <code>application/json</code>.
  ///
  /// Parameter [contentType] :
  /// The MIME type of the input data in the request. You must specify
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
      if (trace != null) 'X-Amzn-Bedrock-Trace': trace.value,
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

/// The model must request at least one tool (no text is generated). For
/// example, <code>{"any" : {}}</code>.
class AnyToolChoice {
  AnyToolChoice();

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ApplyGuardrailResponse {
  /// The action taken in the response from the guardrail.
  final GuardrailAction action;

  /// The assessment details in the response from the guardrail.
  final List<GuardrailAssessment> assessments;

  /// The output details in the response from the guardrail.
  final List<GuardrailOutputContent> outputs;

  /// The usage details in the response from the guardrail.
  final GuardrailUsage usage;

  ApplyGuardrailResponse({
    required this.action,
    required this.assessments,
    required this.outputs,
    required this.usage,
  });

  factory ApplyGuardrailResponse.fromJson(Map<String, dynamic> json) {
    return ApplyGuardrailResponse(
      action: GuardrailAction.fromString((json['action'] as String)),
      assessments: (json['assessments'] as List)
          .nonNulls
          .map((e) => GuardrailAssessment.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputs: (json['outputs'] as List)
          .nonNulls
          .map(
              (e) => GuardrailOutputContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      usage: GuardrailUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final assessments = this.assessments;
    final outputs = this.outputs;
    final usage = this.usage;
    return {
      'action': action.value,
      'assessments': assessments,
      'outputs': outputs,
      'usage': usage,
    };
  }
}

/// The Model automatically decides if a tool should be called or whether to
/// generate text instead. For example, <code>{"auto" : {}}</code>.
class AutoToolChoice {
  AutoToolChoice();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A block of content for a message that you pass to, or receive from, a model
/// with the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_Converse.html">Converse</a>
/// or <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_ConverseStream.html">ConverseStream</a>
/// API operations.
class ContentBlock {
  /// A document to include in the message.
  final DocumentBlock? document;

  /// Contains the content to assess with the guardrail. If you don't specify
  /// <code>guardContent</code> in a call to the Converse API, the guardrail (if
  /// passed in the Converse API) assesses the entire message.
  ///
  /// For more information, see <i>Use a guardrail with the Converse API</i> in
  /// the <i>Amazon Bedrock User Guide</i>. <pre><code> &lt;/p&gt; </code></pre>
  final GuardrailConverseContentBlock? guardContent;

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
    this.document,
    this.guardContent,
    this.image,
    this.text,
    this.toolResult,
    this.toolUse,
  });

  factory ContentBlock.fromJson(Map<String, dynamic> json) {
    return ContentBlock(
      document: json['document'] != null
          ? DocumentBlock.fromJson(json['document'] as Map<String, dynamic>)
          : null,
      guardContent: json['guardContent'] != null
          ? GuardrailConverseContentBlock.fromJson(
              json['guardContent'] as Map<String, dynamic>)
          : null,
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
    final document = this.document;
    final guardContent = this.guardContent;
    final image = this.image;
    final text = this.text;
    final toolResult = this.toolResult;
    final toolUse = this.toolUse;
    return {
      if (document != null) 'document': document,
      if (guardContent != null) 'guardContent': guardContent,
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
  user('user'),
  assistant('assistant'),
  ;

  final String value;

  const ConversationRole(this.value);

  static ConversationRole fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ConversationRole'));
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

  /// A trace object that contains information about the Guardrail behavior.
  final ConverseTrace? trace;

  ConverseResponse({
    required this.metrics,
    required this.output,
    required this.stopReason,
    required this.usage,
    this.additionalModelResponseFields,
    this.trace,
  });

  factory ConverseResponse.fromJson(Map<String, dynamic> json) {
    return ConverseResponse(
      metrics:
          ConverseMetrics.fromJson(json['metrics'] as Map<String, dynamic>),
      output: ConverseOutput.fromJson(json['output'] as Map<String, dynamic>),
      stopReason: StopReason.fromString((json['stopReason'] as String)),
      usage: TokenUsage.fromJson(json['usage'] as Map<String, dynamic>),
      additionalModelResponseFields:
          json['additionalModelResponseFields'] != null
              ? Document.fromJson(
                  json['additionalModelResponseFields'] as Map<String, dynamic>)
              : null,
      trace: json['trace'] != null
          ? ConverseTrace.fromJson(json['trace'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metrics = this.metrics;
    final output = this.output;
    final stopReason = this.stopReason;
    final usage = this.usage;
    final additionalModelResponseFields = this.additionalModelResponseFields;
    final trace = this.trace;
    return {
      'metrics': metrics,
      'output': output,
      'stopReason': stopReason.value,
      'usage': usage,
      if (additionalModelResponseFields != null)
        'additionalModelResponseFields': additionalModelResponseFields,
      if (trace != null) 'trace': trace,
    };
  }
}

/// A conversation stream metadata event.
class ConverseStreamMetadataEvent {
  /// The metrics for the conversation stream metadata event.
  final ConverseStreamMetrics metrics;

  /// Usage information for the conversation stream event.
  final TokenUsage usage;

  /// The trace object in the response from <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_ConverseStream.html">ConverseStream</a>
  /// that contains information about the guardrail behavior.
  final ConverseStreamTrace? trace;

  ConverseStreamMetadataEvent({
    required this.metrics,
    required this.usage,
    this.trace,
  });

  factory ConverseStreamMetadataEvent.fromJson(Map<String, dynamic> json) {
    return ConverseStreamMetadataEvent(
      metrics: ConverseStreamMetrics.fromJson(
          json['metrics'] as Map<String, dynamic>),
      usage: TokenUsage.fromJson(json['usage'] as Map<String, dynamic>),
      trace: json['trace'] != null
          ? ConverseStreamTrace.fromJson(json['trace'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metrics = this.metrics;
    final usage = this.usage;
    final trace = this.trace;
    return {
      'metrics': metrics,
      'usage': usage,
      if (trace != null) 'trace': trace,
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

  /// The service isn't currently available. Try again later.
  final ServiceUnavailableException? serviceUnavailableException;

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
    this.serviceUnavailableException,
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
      serviceUnavailableException: json['serviceUnavailableException'] != null
          ? ServiceUnavailableException.fromJson(
              json['serviceUnavailableException'] as Map<String, dynamic>)
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
    final serviceUnavailableException = this.serviceUnavailableException;
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
      if (serviceUnavailableException != null)
        'serviceUnavailableException': serviceUnavailableException,
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

/// The trace object in a response from <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_ConverseStream.html">ConverseStream</a>.
/// Currently, you can only trace guardrails.
class ConverseStreamTrace {
  /// The guardrail trace object.
  final GuardrailTraceAssessment? guardrail;

  ConverseStreamTrace({
    this.guardrail,
  });

  factory ConverseStreamTrace.fromJson(Map<String, dynamic> json) {
    return ConverseStreamTrace(
      guardrail: json['guardrail'] != null
          ? GuardrailTraceAssessment.fromJson(
              json['guardrail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final guardrail = this.guardrail;
    return {
      if (guardrail != null) 'guardrail': guardrail,
    };
  }
}

/// The trace object in a response from <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_Converse.html">Converse</a>.
/// Currently, you can only trace guardrails.
class ConverseTrace {
  /// The guardrail trace object.
  final GuardrailTraceAssessment? guardrail;

  ConverseTrace({
    this.guardrail,
  });

  factory ConverseTrace.fromJson(Map<String, dynamic> json) {
    return ConverseTrace(
      guardrail: json['guardrail'] != null
          ? GuardrailTraceAssessment.fromJson(
              json['guardrail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final guardrail = this.guardrail;
    return {
      if (guardrail != null) 'guardrail': guardrail,
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

/// A document to include in a message.
class DocumentBlock {
  /// The format of a document, or its extension.
  final DocumentFormat format;

  /// A name for the document. The name can only contain the following characters:
  ///
  /// <ul>
  /// <li>
  /// Alphanumeric characters
  /// </li>
  /// <li>
  /// Whitespace characters (no more than one in a row)
  /// </li>
  /// <li>
  /// Hyphens
  /// </li>
  /// <li>
  /// Parentheses
  /// </li>
  /// <li>
  /// Square brackets
  /// </li>
  /// </ul> <note>
  /// This field is vulnerable to prompt injections, because the model might
  /// inadvertently interpret it as instructions. Therefore, we recommend that you
  /// specify a neutral name.
  /// </note>
  final String name;

  /// Contains the content of the document.
  final DocumentSource source;

  DocumentBlock({
    required this.format,
    required this.name,
    required this.source,
  });

  factory DocumentBlock.fromJson(Map<String, dynamic> json) {
    return DocumentBlock(
      format: DocumentFormat.fromString((json['format'] as String)),
      name: json['name'] as String,
      source: DocumentSource.fromJson(json['source'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final name = this.name;
    final source = this.source;
    return {
      'format': format.value,
      'name': name,
      'source': source,
    };
  }
}

enum DocumentFormat {
  pdf('pdf'),
  csv('csv'),
  doc('doc'),
  docx('docx'),
  xls('xls'),
  xlsx('xlsx'),
  html('html'),
  txt('txt'),
  md('md'),
  ;

  final String value;

  const DocumentFormat(this.value);

  static DocumentFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DocumentFormat'));
}

/// Contains the content of a document.
class DocumentSource {
  /// The raw bytes for the document. If you use an Amazon Web Services SDK, you
  /// don't need to encode the bytes in base64.
  final Uint8List? bytes;

  DocumentSource({
    this.bytes,
  });

  factory DocumentSource.fromJson(Map<String, dynamic> json) {
    return DocumentSource(
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

enum GuardrailAction {
  none('NONE'),
  guardrailIntervened('GUARDRAIL_INTERVENED'),
  ;

  final String value;

  const GuardrailAction(this.value);

  static GuardrailAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum GuardrailAction'));
}

/// A behavior assessment of the guardrail policies used in a call to the
/// Converse API.
class GuardrailAssessment {
  /// The content policy.
  final GuardrailContentPolicyAssessment? contentPolicy;

  /// The contextual grounding policy used for the guardrail assessment.
  final GuardrailContextualGroundingPolicyAssessment? contextualGroundingPolicy;

  /// The sensitive information policy.
  final GuardrailSensitiveInformationPolicyAssessment?
      sensitiveInformationPolicy;

  /// The topic policy.
  final GuardrailTopicPolicyAssessment? topicPolicy;

  /// The word policy.
  final GuardrailWordPolicyAssessment? wordPolicy;

  GuardrailAssessment({
    this.contentPolicy,
    this.contextualGroundingPolicy,
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
      contextualGroundingPolicy: json['contextualGroundingPolicy'] != null
          ? GuardrailContextualGroundingPolicyAssessment.fromJson(
              json['contextualGroundingPolicy'] as Map<String, dynamic>)
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
    final contextualGroundingPolicy = this.contextualGroundingPolicy;
    final sensitiveInformationPolicy = this.sensitiveInformationPolicy;
    final topicPolicy = this.topicPolicy;
    final wordPolicy = this.wordPolicy;
    return {
      if (contentPolicy != null) 'contentPolicy': contentPolicy,
      if (contextualGroundingPolicy != null)
        'contextualGroundingPolicy': contextualGroundingPolicy,
      if (sensitiveInformationPolicy != null)
        'sensitiveInformationPolicy': sensitiveInformationPolicy,
      if (topicPolicy != null) 'topicPolicy': topicPolicy,
      if (wordPolicy != null) 'wordPolicy': wordPolicy,
    };
  }
}

/// Configuration information for a guardrail that you use with the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_Converse.html">Converse</a>
/// operation.
class GuardrailConfiguration {
  /// The identifier for the guardrail.
  final String guardrailIdentifier;

  /// The version of the guardrail.
  final String guardrailVersion;

  /// The trace behavior for the guardrail.
  final GuardrailTrace? trace;

  GuardrailConfiguration({
    required this.guardrailIdentifier,
    required this.guardrailVersion,
    this.trace,
  });

  Map<String, dynamic> toJson() {
    final guardrailIdentifier = this.guardrailIdentifier;
    final guardrailVersion = this.guardrailVersion;
    final trace = this.trace;
    return {
      'guardrailIdentifier': guardrailIdentifier,
      'guardrailVersion': guardrailVersion,
      if (trace != null) 'trace': trace.value,
    };
  }
}

/// The content block to be evaluated by the guardrail.
class GuardrailContentBlock {
  /// Text within content block to be evaluated by the guardrail.
  final GuardrailTextBlock? text;

  GuardrailContentBlock({
    this.text,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      if (text != null) 'text': text,
    };
  }
}

/// The content filter for a guardrail.
class GuardrailContentFilter {
  /// The guardrail action.
  final GuardrailContentPolicyAction action;

  /// The guardrail confidence.
  final GuardrailContentFilterConfidence confidence;

  /// The guardrail type.
  final GuardrailContentFilterType type;

  GuardrailContentFilter({
    required this.action,
    required this.confidence,
    required this.type,
  });

  factory GuardrailContentFilter.fromJson(Map<String, dynamic> json) {
    return GuardrailContentFilter(
      action:
          GuardrailContentPolicyAction.fromString((json['action'] as String)),
      confidence: GuardrailContentFilterConfidence.fromString(
          (json['confidence'] as String)),
      type: GuardrailContentFilterType.fromString((json['type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final confidence = this.confidence;
    final type = this.type;
    return {
      'action': action.value,
      'confidence': confidence.value,
      'type': type.value,
    };
  }
}

enum GuardrailContentFilterConfidence {
  none('NONE'),
  low('LOW'),
  medium('MEDIUM'),
  high('HIGH'),
  ;

  final String value;

  const GuardrailContentFilterConfidence(this.value);

  static GuardrailContentFilterConfidence fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailContentFilterConfidence'));
}

enum GuardrailContentFilterType {
  insults('INSULTS'),
  hate('HATE'),
  sexual('SEXUAL'),
  violence('VIOLENCE'),
  misconduct('MISCONDUCT'),
  promptAttack('PROMPT_ATTACK'),
  ;

  final String value;

  const GuardrailContentFilterType(this.value);

  static GuardrailContentFilterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailContentFilterType'));
}

enum GuardrailContentPolicyAction {
  blocked('BLOCKED'),
  ;

  final String value;

  const GuardrailContentPolicyAction(this.value);

  static GuardrailContentPolicyAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailContentPolicyAction'));
}

/// An assessment of a content policy for a guardrail.
class GuardrailContentPolicyAssessment {
  /// The content policy filters.
  final List<GuardrailContentFilter> filters;

  GuardrailContentPolicyAssessment({
    required this.filters,
  });

  factory GuardrailContentPolicyAssessment.fromJson(Map<String, dynamic> json) {
    return GuardrailContentPolicyAssessment(
      filters: (json['filters'] as List)
          .nonNulls
          .map(
              (e) => GuardrailContentFilter.fromJson(e as Map<String, dynamic>))
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

enum GuardrailContentQualifier {
  groundingSource('grounding_source'),
  query('query'),
  guardContent('guard_content'),
  ;

  final String value;

  const GuardrailContentQualifier(this.value);

  static GuardrailContentQualifier fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailContentQualifier'));
}

enum GuardrailContentSource {
  input('INPUT'),
  output('OUTPUT'),
  ;

  final String value;

  const GuardrailContentSource(this.value);

  static GuardrailContentSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailContentSource'));
}

/// The details for the guardrails contextual grounding filter.
class GuardrailContextualGroundingFilter {
  /// The action performed by the guardrails contextual grounding filter.
  final GuardrailContextualGroundingPolicyAction action;

  /// The score generated by contextual grounding filter.
  final double score;

  /// The threshold used by contextual grounding filter to determine whether the
  /// content is grounded or not.
  final double threshold;

  /// The contextual grounding filter type.
  final GuardrailContextualGroundingFilterType type;

  GuardrailContextualGroundingFilter({
    required this.action,
    required this.score,
    required this.threshold,
    required this.type,
  });

  factory GuardrailContextualGroundingFilter.fromJson(
      Map<String, dynamic> json) {
    return GuardrailContextualGroundingFilter(
      action: GuardrailContextualGroundingPolicyAction.fromString(
          (json['action'] as String)),
      score: json['score'] as double,
      threshold: json['threshold'] as double,
      type: GuardrailContextualGroundingFilterType.fromString(
          (json['type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final score = this.score;
    final threshold = this.threshold;
    final type = this.type;
    return {
      'action': action.value,
      'score': score,
      'threshold': threshold,
      'type': type.value,
    };
  }
}

enum GuardrailContextualGroundingFilterType {
  grounding('GROUNDING'),
  relevance('RELEVANCE'),
  ;

  final String value;

  const GuardrailContextualGroundingFilterType(this.value);

  static GuardrailContextualGroundingFilterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailContextualGroundingFilterType'));
}

enum GuardrailContextualGroundingPolicyAction {
  blocked('BLOCKED'),
  none('NONE'),
  ;

  final String value;

  const GuardrailContextualGroundingPolicyAction(this.value);

  static GuardrailContextualGroundingPolicyAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailContextualGroundingPolicyAction'));
}

/// The policy assessment details for the guardrails contextual grounding
/// filter.
class GuardrailContextualGroundingPolicyAssessment {
  /// The filter details for the guardrails contextual grounding filter.
  final List<GuardrailContextualGroundingFilter>? filters;

  GuardrailContextualGroundingPolicyAssessment({
    this.filters,
  });

  factory GuardrailContextualGroundingPolicyAssessment.fromJson(
      Map<String, dynamic> json) {
    return GuardrailContextualGroundingPolicyAssessment(
      filters: (json['filters'] as List?)
          ?.nonNulls
          .map((e) => GuardrailContextualGroundingFilter.fromJson(
              e as Map<String, dynamic>))
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

/// <p/>
/// A content block for selective guarding with the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_Converse.html">Converse</a>
/// or <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_ConverseStream.html">ConverseStream</a>
/// API operations.
class GuardrailConverseContentBlock {
  /// The text to guard.
  final GuardrailConverseTextBlock? text;

  GuardrailConverseContentBlock({
    this.text,
  });

  factory GuardrailConverseContentBlock.fromJson(Map<String, dynamic> json) {
    return GuardrailConverseContentBlock(
      text: json['text'] != null
          ? GuardrailConverseTextBlock.fromJson(
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

enum GuardrailConverseContentQualifier {
  groundingSource('grounding_source'),
  query('query'),
  guardContent('guard_content'),
  ;

  final String value;

  const GuardrailConverseContentQualifier(this.value);

  static GuardrailConverseContentQualifier fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailConverseContentQualifier'));
}

/// A text block that contains text that you want to assess with a guardrail.
/// For more information, see <a>GuardrailConverseContentBlock</a>.
class GuardrailConverseTextBlock {
  /// The text that you want to guard.
  final String text;

  /// The qualifier details for the guardrails contextual grounding filter.
  final List<GuardrailConverseContentQualifier>? qualifiers;

  GuardrailConverseTextBlock({
    required this.text,
    this.qualifiers,
  });

  factory GuardrailConverseTextBlock.fromJson(Map<String, dynamic> json) {
    return GuardrailConverseTextBlock(
      text: json['text'] as String,
      qualifiers: (json['qualifiers'] as List?)
          ?.nonNulls
          .map((e) =>
              GuardrailConverseContentQualifier.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final qualifiers = this.qualifiers;
    return {
      'text': text,
      if (qualifiers != null)
        'qualifiers': qualifiers.map((e) => e.value).toList(),
    };
  }
}

/// A custom word configured in a guardrail.
class GuardrailCustomWord {
  /// The action for the custom word.
  final GuardrailWordPolicyAction action;

  /// The match for the custom word.
  final String match;

  GuardrailCustomWord({
    required this.action,
    required this.match,
  });

  factory GuardrailCustomWord.fromJson(Map<String, dynamic> json) {
    return GuardrailCustomWord(
      action: GuardrailWordPolicyAction.fromString((json['action'] as String)),
      match: json['match'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final match = this.match;
    return {
      'action': action.value,
      'match': match,
    };
  }
}

/// A managed word configured in a guardrail.
class GuardrailManagedWord {
  /// The action for the managed word.
  final GuardrailWordPolicyAction action;

  /// The match for the managed word.
  final String match;

  /// The type for the managed word.
  final GuardrailManagedWordType type;

  GuardrailManagedWord({
    required this.action,
    required this.match,
    required this.type,
  });

  factory GuardrailManagedWord.fromJson(Map<String, dynamic> json) {
    return GuardrailManagedWord(
      action: GuardrailWordPolicyAction.fromString((json['action'] as String)),
      match: json['match'] as String,
      type: GuardrailManagedWordType.fromString((json['type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final match = this.match;
    final type = this.type;
    return {
      'action': action.value,
      'match': match,
      'type': type.value,
    };
  }
}

enum GuardrailManagedWordType {
  profanity('PROFANITY'),
  ;

  final String value;

  const GuardrailManagedWordType(this.value);

  static GuardrailManagedWordType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailManagedWordType'));
}

/// The output content produced by the guardrail.
class GuardrailOutputContent {
  /// The specific text for the output content produced by the guardrail.
  final String? text;

  GuardrailOutputContent({
    this.text,
  });

  factory GuardrailOutputContent.fromJson(Map<String, dynamic> json) {
    return GuardrailOutputContent(
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

/// A Personally Identifiable Information (PII) entity configured in a
/// guardrail.
class GuardrailPiiEntityFilter {
  /// The PII entity filter action.
  final GuardrailSensitiveInformationPolicyAction action;

  /// The PII entity filter match.
  final String match;

  /// The PII entity filter type.
  final GuardrailPiiEntityType type;

  GuardrailPiiEntityFilter({
    required this.action,
    required this.match,
    required this.type,
  });

  factory GuardrailPiiEntityFilter.fromJson(Map<String, dynamic> json) {
    return GuardrailPiiEntityFilter(
      action: GuardrailSensitiveInformationPolicyAction.fromString(
          (json['action'] as String)),
      match: json['match'] as String,
      type: GuardrailPiiEntityType.fromString((json['type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final match = this.match;
    final type = this.type;
    return {
      'action': action.value,
      'match': match,
      'type': type.value,
    };
  }
}

enum GuardrailPiiEntityType {
  address('ADDRESS'),
  age('AGE'),
  awsAccessKey('AWS_ACCESS_KEY'),
  awsSecretKey('AWS_SECRET_KEY'),
  caHealthNumber('CA_HEALTH_NUMBER'),
  caSocialInsuranceNumber('CA_SOCIAL_INSURANCE_NUMBER'),
  creditDebitCardCvv('CREDIT_DEBIT_CARD_CVV'),
  creditDebitCardExpiry('CREDIT_DEBIT_CARD_EXPIRY'),
  creditDebitCardNumber('CREDIT_DEBIT_CARD_NUMBER'),
  driverId('DRIVER_ID'),
  email('EMAIL'),
  internationalBankAccountNumber('INTERNATIONAL_BANK_ACCOUNT_NUMBER'),
  ipAddress('IP_ADDRESS'),
  licensePlate('LICENSE_PLATE'),
  macAddress('MAC_ADDRESS'),
  name('NAME'),
  password('PASSWORD'),
  phone('PHONE'),
  pin('PIN'),
  swiftCode('SWIFT_CODE'),
  ukNationalHealthServiceNumber('UK_NATIONAL_HEALTH_SERVICE_NUMBER'),
  ukNationalInsuranceNumber('UK_NATIONAL_INSURANCE_NUMBER'),
  ukUniqueTaxpayerReferenceNumber('UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER'),
  url('URL'),
  username('USERNAME'),
  usBankAccountNumber('US_BANK_ACCOUNT_NUMBER'),
  usBankRoutingNumber('US_BANK_ROUTING_NUMBER'),
  usIndividualTaxIdentificationNumber(
      'US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER'),
  usPassportNumber('US_PASSPORT_NUMBER'),
  usSocialSecurityNumber('US_SOCIAL_SECURITY_NUMBER'),
  vehicleIdentificationNumber('VEHICLE_IDENTIFICATION_NUMBER'),
  ;

  final String value;

  const GuardrailPiiEntityType(this.value);

  static GuardrailPiiEntityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailPiiEntityType'));
}

/// A Regex filter configured in a guardrail.
class GuardrailRegexFilter {
  /// The region filter action.
  final GuardrailSensitiveInformationPolicyAction action;

  /// The regesx filter match.
  final String? match;

  /// The regex filter name.
  final String? name;

  /// The regex query.
  final String? regex;

  GuardrailRegexFilter({
    required this.action,
    this.match,
    this.name,
    this.regex,
  });

  factory GuardrailRegexFilter.fromJson(Map<String, dynamic> json) {
    return GuardrailRegexFilter(
      action: GuardrailSensitiveInformationPolicyAction.fromString(
          (json['action'] as String)),
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
      'action': action.value,
      if (match != null) 'match': match,
      if (name != null) 'name': name,
      if (regex != null) 'regex': regex,
    };
  }
}

enum GuardrailSensitiveInformationPolicyAction {
  anonymized('ANONYMIZED'),
  blocked('BLOCKED'),
  ;

  final String value;

  const GuardrailSensitiveInformationPolicyAction(this.value);

  static GuardrailSensitiveInformationPolicyAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailSensitiveInformationPolicyAction'));
}

/// The assessment for aPersonally Identifiable Information (PII) policy.
class GuardrailSensitiveInformationPolicyAssessment {
  /// The PII entities in the assessment.
  final List<GuardrailPiiEntityFilter> piiEntities;

  /// The regex queries in the assessment.
  final List<GuardrailRegexFilter> regexes;

  GuardrailSensitiveInformationPolicyAssessment({
    required this.piiEntities,
    required this.regexes,
  });

  factory GuardrailSensitiveInformationPolicyAssessment.fromJson(
      Map<String, dynamic> json) {
    return GuardrailSensitiveInformationPolicyAssessment(
      piiEntities: (json['piiEntities'] as List)
          .nonNulls
          .map((e) =>
              GuardrailPiiEntityFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      regexes: (json['regexes'] as List)
          .nonNulls
          .map((e) => GuardrailRegexFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final piiEntities = this.piiEntities;
    final regexes = this.regexes;
    return {
      'piiEntities': piiEntities,
      'regexes': regexes,
    };
  }
}

/// Configuration information for a guardrail that you use with the
/// <a>ConverseStream</a> action.
class GuardrailStreamConfiguration {
  /// The identifier for the guardrail.
  final String guardrailIdentifier;

  /// The version of the guardrail.
  final String guardrailVersion;

  /// The processing mode.
  ///
  /// The processing mode. For more information, see <i>Configure streaming
  /// response behavior</i> in the <i>Amazon Bedrock User Guide</i>.
  final GuardrailStreamProcessingMode? streamProcessingMode;

  /// The trace behavior for the guardrail.
  final GuardrailTrace? trace;

  GuardrailStreamConfiguration({
    required this.guardrailIdentifier,
    required this.guardrailVersion,
    this.streamProcessingMode,
    this.trace,
  });

  Map<String, dynamic> toJson() {
    final guardrailIdentifier = this.guardrailIdentifier;
    final guardrailVersion = this.guardrailVersion;
    final streamProcessingMode = this.streamProcessingMode;
    final trace = this.trace;
    return {
      'guardrailIdentifier': guardrailIdentifier,
      'guardrailVersion': guardrailVersion,
      if (streamProcessingMode != null)
        'streamProcessingMode': streamProcessingMode.value,
      if (trace != null) 'trace': trace.value,
    };
  }
}

enum GuardrailStreamProcessingMode {
  sync('sync'),
  async('async'),
  ;

  final String value;

  const GuardrailStreamProcessingMode(this.value);

  static GuardrailStreamProcessingMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailStreamProcessingMode'));
}

/// The text block to be evaluated by the guardrail.
class GuardrailTextBlock {
  /// The input text details to be evaluated by the guardrail.
  final String text;

  /// The qualifiers describing the text block.
  final List<GuardrailContentQualifier>? qualifiers;

  GuardrailTextBlock({
    required this.text,
    this.qualifiers,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    final qualifiers = this.qualifiers;
    return {
      'text': text,
      if (qualifiers != null)
        'qualifiers': qualifiers.map((e) => e.value).toList(),
    };
  }
}

/// Information about a topic guardrail.
class GuardrailTopic {
  /// The action the guardrail should take when it intervenes on a topic.
  final GuardrailTopicPolicyAction action;

  /// The name for the guardrail.
  final String name;

  /// The type behavior that the guardrail should perform when the model detects
  /// the topic.
  final GuardrailTopicType type;

  GuardrailTopic({
    required this.action,
    required this.name,
    required this.type,
  });

  factory GuardrailTopic.fromJson(Map<String, dynamic> json) {
    return GuardrailTopic(
      action: GuardrailTopicPolicyAction.fromString((json['action'] as String)),
      name: json['name'] as String,
      type: GuardrailTopicType.fromString((json['type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final name = this.name;
    final type = this.type;
    return {
      'action': action.value,
      'name': name,
      'type': type.value,
    };
  }
}

enum GuardrailTopicPolicyAction {
  blocked('BLOCKED'),
  ;

  final String value;

  const GuardrailTopicPolicyAction(this.value);

  static GuardrailTopicPolicyAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailTopicPolicyAction'));
}

/// A behavior assessment of a topic policy.
class GuardrailTopicPolicyAssessment {
  /// The topics in the assessment.
  final List<GuardrailTopic> topics;

  GuardrailTopicPolicyAssessment({
    required this.topics,
  });

  factory GuardrailTopicPolicyAssessment.fromJson(Map<String, dynamic> json) {
    return GuardrailTopicPolicyAssessment(
      topics: (json['topics'] as List)
          .nonNulls
          .map((e) => GuardrailTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final topics = this.topics;
    return {
      'topics': topics,
    };
  }
}

enum GuardrailTopicType {
  deny('DENY'),
  ;

  final String value;

  const GuardrailTopicType(this.value);

  static GuardrailTopicType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum GuardrailTopicType'));
}

enum GuardrailTrace {
  enabled('enabled'),
  disabled('disabled'),
  ;

  final String value;

  const GuardrailTrace(this.value);

  static GuardrailTrace fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum GuardrailTrace'));
}

/// A Top level guardrail trace object. For more information, see
/// <a>ConverseTrace</a>.
class GuardrailTraceAssessment {
  /// The input assessment.
  final Map<String, GuardrailAssessment>? inputAssessment;

  /// The output from the model.
  final List<String>? modelOutput;

  /// the output assessments.
  final Map<String, List<GuardrailAssessment>>? outputAssessments;

  GuardrailTraceAssessment({
    this.inputAssessment,
    this.modelOutput,
    this.outputAssessments,
  });

  factory GuardrailTraceAssessment.fromJson(Map<String, dynamic> json) {
    return GuardrailTraceAssessment(
      inputAssessment: (json['inputAssessment'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, GuardrailAssessment.fromJson(e as Map<String, dynamic>))),
      modelOutput: (json['modelOutput'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      outputAssessments: (json['outputAssessments'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              (e as List)
                  .nonNulls
                  .map((e) =>
                      GuardrailAssessment.fromJson(e as Map<String, dynamic>))
                  .toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final inputAssessment = this.inputAssessment;
    final modelOutput = this.modelOutput;
    final outputAssessments = this.outputAssessments;
    return {
      if (inputAssessment != null) 'inputAssessment': inputAssessment,
      if (modelOutput != null) 'modelOutput': modelOutput,
      if (outputAssessments != null) 'outputAssessments': outputAssessments,
    };
  }
}

/// The details on the use of the guardrail.
class GuardrailUsage {
  /// The content policy units processed by the guardrail.
  final int contentPolicyUnits;

  /// The contextual grounding policy units processed by the guardrail.
  final int contextualGroundingPolicyUnits;

  /// The sensitive information policy free units processed by the guardrail.
  final int sensitiveInformationPolicyFreeUnits;

  /// The sensitive information policy units processed by the guardrail.
  final int sensitiveInformationPolicyUnits;

  /// The topic policy units processed by the guardrail.
  final int topicPolicyUnits;

  /// The word policy units processed by the guardrail.
  final int wordPolicyUnits;

  GuardrailUsage({
    required this.contentPolicyUnits,
    required this.contextualGroundingPolicyUnits,
    required this.sensitiveInformationPolicyFreeUnits,
    required this.sensitiveInformationPolicyUnits,
    required this.topicPolicyUnits,
    required this.wordPolicyUnits,
  });

  factory GuardrailUsage.fromJson(Map<String, dynamic> json) {
    return GuardrailUsage(
      contentPolicyUnits: json['contentPolicyUnits'] as int,
      contextualGroundingPolicyUnits:
          json['contextualGroundingPolicyUnits'] as int,
      sensitiveInformationPolicyFreeUnits:
          json['sensitiveInformationPolicyFreeUnits'] as int,
      sensitiveInformationPolicyUnits:
          json['sensitiveInformationPolicyUnits'] as int,
      topicPolicyUnits: json['topicPolicyUnits'] as int,
      wordPolicyUnits: json['wordPolicyUnits'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final contentPolicyUnits = this.contentPolicyUnits;
    final contextualGroundingPolicyUnits = this.contextualGroundingPolicyUnits;
    final sensitiveInformationPolicyFreeUnits =
        this.sensitiveInformationPolicyFreeUnits;
    final sensitiveInformationPolicyUnits =
        this.sensitiveInformationPolicyUnits;
    final topicPolicyUnits = this.topicPolicyUnits;
    final wordPolicyUnits = this.wordPolicyUnits;
    return {
      'contentPolicyUnits': contentPolicyUnits,
      'contextualGroundingPolicyUnits': contextualGroundingPolicyUnits,
      'sensitiveInformationPolicyFreeUnits':
          sensitiveInformationPolicyFreeUnits,
      'sensitiveInformationPolicyUnits': sensitiveInformationPolicyUnits,
      'topicPolicyUnits': topicPolicyUnits,
      'wordPolicyUnits': wordPolicyUnits,
    };
  }
}

enum GuardrailWordPolicyAction {
  blocked('BLOCKED'),
  ;

  final String value;

  const GuardrailWordPolicyAction(this.value);

  static GuardrailWordPolicyAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailWordPolicyAction'));
}

/// The word policy assessment.
class GuardrailWordPolicyAssessment {
  /// Custom words in the assessment.
  final List<GuardrailCustomWord> customWords;

  /// Managed word lists in the assessment.
  final List<GuardrailManagedWord> managedWordLists;

  GuardrailWordPolicyAssessment({
    required this.customWords,
    required this.managedWordLists,
  });

  factory GuardrailWordPolicyAssessment.fromJson(Map<String, dynamic> json) {
    return GuardrailWordPolicyAssessment(
      customWords: (json['customWords'] as List)
          .nonNulls
          .map((e) => GuardrailCustomWord.fromJson(e as Map<String, dynamic>))
          .toList(),
      managedWordLists: (json['managedWordLists'] as List)
          .nonNulls
          .map((e) => GuardrailManagedWord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final customWords = this.customWords;
    final managedWordLists = this.managedWordLists;
    return {
      'customWords': customWords,
      'managedWordLists': managedWordLists,
    };
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
      format: ImageFormat.fromString((json['format'] as String)),
      source: ImageSource.fromJson(json['source'] as Map<String, dynamic>),
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

enum ImageFormat {
  png('png'),
  jpeg('jpeg'),
  gif('gif'),
  webp('webp'),
  ;

  final String value;

  const ImageFormat(this.value);

  static ImageFormat fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum ImageFormat'));
}

/// The source for an image.
class ImageSource {
  /// The raw image bytes for the image. If you use an AWS SDK, you don't need to
  /// encode the image bytes in base64.
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
  /// parameters for foundation models</a>.
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

/// A message input, or returned from, a call to <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_Converse.html">Converse</a>
/// or <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_ConverseStream.html">ConverseStream</a>.
class Message {
  /// The message content. Note the following restrictions:
  ///
  /// <ul>
  /// <li>
  /// You can include up to 20 images. Each image's size, height, and width must
  /// be no more than 3.75 MB, 8000 px, and 8000 px, respectively.
  /// </li>
  /// <li>
  /// You can include up to five documents. Each document's size must be no more
  /// than 4.5 MB.
  /// </li>
  /// <li>
  /// If you include a <code>ContentBlock</code> with a <code>document</code>
  /// field in the array, you must also include a <code>ContentBlock</code> with a
  /// <code>text</code> field.
  /// </li>
  /// <li>
  /// You can only include images and documents if the <code>role</code> is
  /// <code>user</code>.
  /// </li>
  /// </ul>
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
          .nonNulls
          .map((e) => ContentBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      role: ConversationRole.fromString((json['role'] as String)),
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

/// The start of a message.
class MessageStartEvent {
  /// The role for the message.
  final ConversationRole role;

  MessageStartEvent({
    required this.role,
  });

  factory MessageStartEvent.fromJson(Map<String, dynamic> json) {
    return MessageStartEvent(
      role: ConversationRole.fromString((json['role'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final role = this.role;
    return {
      'role': role.value,
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
      stopReason: StopReason.fromString((json['stopReason'] as String)),
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
      'stopReason': stopReason.value,
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
  final ServiceUnavailableException? serviceUnavailableException;

  /// Your request was throttled because of service-wide limitations. Resubmit
  /// your request later or in a different region. You can also purchase <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prov-throughput.html">Provisioned
  /// Throughput</a> to increase the rate or number of tokens you can process.
  final ThrottlingException? throttlingException;

  /// Input validation failed. Check your request parameters and retry the
  /// request.
  final ValidationException? validationException;

  ResponseStream({
    this.chunk,
    this.internalServerException,
    this.modelStreamErrorException,
    this.modelTimeoutException,
    this.serviceUnavailableException,
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
      serviceUnavailableException: json['serviceUnavailableException'] != null
          ? ServiceUnavailableException.fromJson(
              json['serviceUnavailableException'] as Map<String, dynamic>)
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
    final serviceUnavailableException = this.serviceUnavailableException;
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
      if (serviceUnavailableException != null)
        'serviceUnavailableException': serviceUnavailableException,
      if (throttlingException != null)
        'throttlingException': throttlingException,
      if (validationException != null)
        'validationException': validationException,
    };
  }
}

/// The service isn't currently available. Try again later.
class ServiceUnavailableException implements _s.AwsException {
  final String? message;

  ServiceUnavailableException({
    this.message,
  });

  factory ServiceUnavailableException.fromJson(Map<String, dynamic> json) {
    return ServiceUnavailableException(
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

/// The model must request a specific tool. For example, <code>{"tool" : {"name"
/// : "Your tool name"}}</code>.
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
  endTurn('end_turn'),
  toolUse('tool_use'),
  maxTokens('max_tokens'),
  stopSequence('stop_sequence'),
  guardrailIntervened('guardrail_intervened'),
  contentFiltered('content_filtered'),
  ;

  final String value;

  const StopReason(this.value);

  static StopReason fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum StopReason'));
}

/// A system content block.
class SystemContentBlock {
  /// A content block to assess with the guardrail. Use with the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_Converse.html">Converse</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_ConverseStream.html">ConverseStream</a>
  /// API operations.
  ///
  /// For more information, see <i>Use a guardrail with the Converse API</i> in
  /// the <i>Amazon Bedrock User Guide</i>.
  final GuardrailConverseContentBlock? guardContent;

  /// A system prompt for the model.
  final String? text;

  SystemContentBlock({
    this.guardContent,
    this.text,
  });

  Map<String, dynamic> toJson() {
    final guardContent = this.guardContent;
    final text = this.text;
    return {
      if (guardContent != null) 'guardContent': guardContent,
      if (text != null) 'text': text,
    };
  }
}

/// Your request was throttled because of service-wide limitations. Resubmit
/// your request later or in a different region. You can also purchase <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prov-throughput.html">Provisioned
/// Throughput</a> to increase the rate or number of tokens you can process.
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

/// Information about a tool that you can use with the Converse API. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Tool
/// use (function calling)</a> in the Amazon Bedrock User Guide.
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

/// Determines which tools the model should request in a call to
/// <code>Converse</code> or <code>ConverseStream</code>.
/// <code>ToolChoice</code> is only supported by Anthropic Claude 3 models and
/// by Mistral AI Mistral Large.
class ToolChoice {
  /// The model must request at least one tool (no text is generated).
  final AnyToolChoice? any;

  /// (Default). The Model automatically decides if a tool should be called or
  /// whether to generate text instead.
  final AutoToolChoice? auto;

  /// The Model must request the specified tool. Only supported by Anthropic
  /// Claude 3 models.
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

/// Configuration information for the tools that you pass to a model. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Tool
/// use (function calling)</a> in the Amazon Bedrock User Guide.
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
          .nonNulls
          .map(
              (e) => ToolResultContentBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      toolUseId: json['toolUseId'] as String,
      status: (json['status'] as String?)?.let(ToolResultStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final toolUseId = this.toolUseId;
    final status = this.status;
    return {
      'content': content,
      'toolUseId': toolUseId,
      if (status != null) 'status': status.value,
    };
  }
}

/// The tool result content block.
class ToolResultContentBlock {
  /// A tool result that is a document.
  final DocumentBlock? document;

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
    this.document,
    this.image,
    this.json,
    this.text,
  });

  factory ToolResultContentBlock.fromJson(Map<String, dynamic> json) {
    return ToolResultContentBlock(
      document: json['document'] != null
          ? DocumentBlock.fromJson(json['document'] as Map<String, dynamic>)
          : null,
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
    final document = this.document;
    final image = this.image;
    final json = this.json;
    final text = this.text;
    return {
      if (document != null) 'document': document,
      if (image != null) 'image': image,
      if (json != null) 'json': json,
      if (text != null) 'text': text,
    };
  }
}

enum ToolResultStatus {
  success('success'),
  error('error'),
  ;

  final String value;

  const ToolResultStatus(this.value);

  static ToolResultStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ToolResultStatus'));
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
  enabled('ENABLED'),
  disabled('DISABLED'),
  ;

  final String value;

  const Trace(this.value);

  static Trace fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Trace'));
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
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(message: message),
  'ValidationException': (type, message) =>
      ValidationException(message: message),
};
