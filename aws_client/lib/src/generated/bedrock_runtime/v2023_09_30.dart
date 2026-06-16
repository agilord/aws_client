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

  /// Retrieve information about an asynchronous invocation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [invocationArn] :
  /// The invocation's ARN.
  Future<GetAsyncInvokeResponse> getAsyncInvoke({
    required String invocationArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/async-invoke/${Uri.encodeComponent(invocationArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAsyncInvokeResponse.fromJson(response);
  }

  /// Lists asynchronous invocations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of invocations to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  ///
  /// Parameter [sortBy] :
  /// How to sort the response.
  ///
  /// Parameter [sortOrder] :
  /// The sorting order for the response.
  ///
  /// Parameter [statusEquals] :
  /// Filter invocations by status.
  ///
  /// Parameter [submitTimeAfter] :
  /// Include invocations submitted after this time.
  ///
  /// Parameter [submitTimeBefore] :
  /// Include invocations submitted before this time.
  Future<ListAsyncInvokesResponse> listAsyncInvokes({
    int? maxResults,
    String? nextToken,
    SortAsyncInvocationBy? sortBy,
    SortOrder? sortOrder,
    AsyncInvokeStatus? statusEquals,
    DateTime? submitTimeAfter,
    DateTime? submitTimeBefore,
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
      if (sortBy != null) 'sortBy': [sortBy.value],
      if (sortOrder != null) 'sortOrder': [sortOrder.value],
      if (statusEquals != null) 'statusEquals': [statusEquals.value],
      if (submitTimeAfter != null)
        'submitTimeAfter': [_s.iso8601ToJson(submitTimeAfter).toString()],
      if (submitTimeBefore != null)
        'submitTimeBefore': [_s.iso8601ToJson(submitTimeBefore).toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/async-invoke',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAsyncInvokesResponse.fromJson(response);
  }

  /// Starts an asynchronous invocation.
  ///
  /// This operation requires permission for the
  /// <code>bedrock:InvokeModel</code> action.
  /// <important>
  /// To deny all inference access to resources that you specify in the modelId
  /// field, you need to deny access to the <code>bedrock:InvokeModel</code> and
  /// <code>bedrock:InvokeModelWithResponseStream</code> actions. Doing this
  /// also denies access to the resource through the Converse API actions (<a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_Converse.html">Converse</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_ConverseStream.html">ConverseStream</a>).
  /// For more information see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/security_iam_id-based-policy-examples.html#security_iam_id-based-policy-examples-deny-inference">Deny
  /// access for inference on specific models</a>.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [modelId] :
  /// The model to invoke.
  ///
  /// Parameter [modelInput] :
  /// Input to send to the model.
  ///
  /// Parameter [outputDataConfig] :
  /// Where to store the output.
  ///
  /// Parameter [clientRequestToken] :
  /// Specify idempotency token to ensure that requests are not duplicated.
  ///
  /// Parameter [tags] :
  /// Tags to apply to the invocation.
  Future<StartAsyncInvokeResponse> startAsyncInvoke({
    required String modelId,
    required Object modelInput,
    required AsyncInvokeOutputDataConfig outputDataConfig,
    String? clientRequestToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'modelId': modelId,
      'modelInput': modelInput,
      'outputDataConfig': outputDataConfig,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/async-invoke',
      exceptionFnMap: _exceptionFns,
    );
    return StartAsyncInvokeResponse.fromJson(response);
  }

  /// The action to apply a guardrail.
  ///
  /// For troubleshooting some of the common errors you might encounter when
  /// using the <code>ApplyGuardrail</code> API, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/troubleshooting-api-error-codes.html">Troubleshooting
  /// Amazon Bedrock API Error Codes</a> in the Amazon Bedrock User Guide
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  ///
  /// Parameter [outputScope] :
  /// Specifies the scope of the output that you get in the response. Set to
  /// <code>FULL</code> to return the entire output, including any detected and
  /// non-detected entries in the response for enhanced debugging.
  ///
  /// Note that the full output scope doesn't apply to word filters or regex in
  /// sensitive information filters. It does apply to all other filtering
  /// policies, including sensitive information with filters that can detect
  /// personally identifiable information (PII).
  Future<ApplyGuardrailResponse> applyGuardrail({
    required List<GuardrailContentBlock> content,
    required String guardrailIdentifier,
    required String guardrailVersion,
    required GuardrailContentSource source,
    GuardrailOutputScope? outputScope,
  }) async {
    final $payload = <String, dynamic>{
      'content': content,
      'source': source.value,
      if (outputScope != null) 'outputScope': outputScope.value,
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
  /// You can submit a prompt by including it in the <code>messages</code>
  /// field, specifying the <code>modelId</code> of a foundation model or
  /// inference profile to run inference on it, and including any other fields
  /// that are relevant to your use case.
  ///
  /// You can also submit a prompt from Prompt management by specifying the ARN
  /// of the prompt version and including a map of variables to values in the
  /// <code>promptVariables</code> field. You can append more messages to the
  /// prompt by using the <code>messages</code> field. If you use a prompt from
  /// Prompt management, you can't include the following fields in the request:
  /// <code>additionalModelRequestFields</code>, <code>inferenceConfig</code>,
  /// <code>system</code>, or <code>toolConfig</code>. Instead, these fields
  /// must be defined through Prompt management. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-use.html">Use
  /// a prompt from Prompt management</a>.
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
  /// <important>
  /// To deny all inference access to resources that you specify in the modelId
  /// field, you need to deny access to the <code>bedrock:InvokeModel</code> and
  /// <code>bedrock:InvokeModelWithResponseStream</code> actions. Doing this
  /// also denies access to the resource through the base inference actions (<a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_InvokeModel.html">InvokeModel</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_InvokeModelWithResponseStream.html">InvokeModelWithResponseStream</a>).
  /// For more information see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/security_iam_id-based-policy-examples.html#security_iam_id-based-policy-examples-deny-inference">Deny
  /// access for inference on specific models</a>.
  /// </important>
  /// For troubleshooting some of the common errors you might encounter when
  /// using the <code>Converse</code> API, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/troubleshooting-api-error-codes.html">Troubleshooting
  /// Amazon Bedrock API Error Codes</a> in the Amazon Bedrock User Guide
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ModelErrorException].
  /// May throw [ModelNotReadyException].
  /// May throw [ModelTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [modelId] :
  /// Specifies the model or throughput with which to run inference, or the
  /// prompt resource to use in inference. The value depends on the resource
  /// that you use:
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
  /// To include a prompt that was defined in <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management.html">Prompt
  /// management</a>, specify the ARN of the prompt version to use.
  /// </li>
  /// </ul>
  /// The Converse API doesn't support <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-import-model.html">imported
  /// models</a>.
  ///
  /// Parameter [additionalModelRequestFields] :
  /// Additional inference parameters that the model supports, beyond the base
  /// set of inference parameters that <code>Converse</code> and
  /// <code>ConverseStream</code> support in the <code>inferenceConfig</code>
  /// field. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Model
  /// parameters</a>.
  ///
  /// Parameter [additionalModelResponseFieldPaths] :
  /// Additional model parameters field paths to return in the response.
  /// <code>Converse</code> and <code>ConverseStream</code> return the requested
  /// fields as a JSON Pointer object in the
  /// <code>additionalModelResponseFields</code> field. The following is example
  /// JSON for <code>additionalModelResponseFieldPaths</code>.
  ///
  /// <code>[ "/stop_sequence" ]</code>
  ///
  /// For information about the JSON Pointer syntax, see the <a
  /// href="https://datatracker.ietf.org/doc/html/rfc6901">Internet Engineering
  /// Task Force (IETF)</a> documentation.
  ///
  /// <code>Converse</code> and <code>ConverseStream</code> reject an empty JSON
  /// Pointer or incorrectly structured JSON Pointer with a <code>400</code>
  /// error code. if the JSON Pointer is valid, but the requested field is not
  /// in the model response, it is ignored by <code>Converse</code>.
  ///
  /// Parameter [guardrailConfig] :
  /// Configuration information for a guardrail that you want to use in the
  /// request. If you include <code>guardContent</code> blocks in the
  /// <code>content</code> field in the <code>messages</code> field, the
  /// guardrail operates only on those messages. If you include no
  /// <code>guardContent</code> blocks, the guardrail operates on all messages
  /// in the request body and in any included prompt resource.
  ///
  /// Parameter [inferenceConfig] :
  /// Inference parameters to pass to the model. <code>Converse</code> and
  /// <code>ConverseStream</code> support a base set of inference parameters. If
  /// you need to pass additional parameters that the model supports, use the
  /// <code>additionalModelRequestFields</code> request field.
  ///
  /// Parameter [messages] :
  /// The messages that you want to send to the model.
  ///
  /// Parameter [outputConfig] :
  /// Output configuration for a model response.
  ///
  /// Parameter [performanceConfig] :
  /// Model performance settings for the request.
  ///
  /// Parameter [promptVariables] :
  /// Contains a map of variables in a prompt from Prompt management to objects
  /// containing the values to fill in for them when running model invocation.
  /// This field is ignored if you don't specify a prompt resource in the
  /// <code>modelId</code> field.
  ///
  /// Parameter [requestMetadata] :
  /// Key-value pairs that you can use to filter invocation logs.
  ///
  /// Parameter [serviceTier] :
  /// Specifies the processing tier configuration used for serving the request.
  ///
  /// Parameter [system] :
  /// A prompt that provides instructions or context to the model about the task
  /// it should perform, or the persona it should adopt during the conversation.
  ///
  /// Parameter [toolConfig] :
  /// Configuration information for the tools that the model can use when
  /// generating a response.
  ///
  /// For information about models that support tool use, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/conversation-inference.html#conversation-inference-supported-models-features">Supported
  /// models and model features</a>.
  Future<ConverseResponse> converse({
    required String modelId,
    Document? additionalModelRequestFields,
    List<String>? additionalModelResponseFieldPaths,
    GuardrailConfiguration? guardrailConfig,
    InferenceConfiguration? inferenceConfig,
    List<Message>? messages,
    OutputConfig? outputConfig,
    PerformanceConfiguration? performanceConfig,
    Map<String, PromptVariableValues>? promptVariables,
    Map<String, String>? requestMetadata,
    ServiceTier? serviceTier,
    List<SystemContentBlock>? system,
    ToolConfiguration? toolConfig,
  }) async {
    final $payload = <String, dynamic>{
      if (additionalModelRequestFields != null)
        'additionalModelRequestFields': additionalModelRequestFields,
      if (additionalModelResponseFieldPaths != null)
        'additionalModelResponseFieldPaths': additionalModelResponseFieldPaths,
      if (guardrailConfig != null) 'guardrailConfig': guardrailConfig,
      if (inferenceConfig != null) 'inferenceConfig': inferenceConfig,
      if (messages != null) 'messages': messages,
      if (outputConfig != null) 'outputConfig': outputConfig,
      if (performanceConfig != null) 'performanceConfig': performanceConfig,
      if (promptVariables != null) 'promptVariables': promptVariables,
      if (requestMetadata != null) 'requestMetadata': requestMetadata,
      if (serviceTier != null) 'serviceTier': serviceTier,
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
  /// You can submit a prompt by including it in the <code>messages</code>
  /// field, specifying the <code>modelId</code> of a foundation model or
  /// inference profile to run inference on it, and including any other fields
  /// that are relevant to your use case.
  ///
  /// You can also submit a prompt from Prompt management by specifying the ARN
  /// of the prompt version and including a map of variables to values in the
  /// <code>promptVariables</code> field. You can append more messages to the
  /// prompt by using the <code>messages</code> field. If you use a prompt from
  /// Prompt management, you can't include the following fields in the request:
  /// <code>additionalModelRequestFields</code>, <code>inferenceConfig</code>,
  /// <code>system</code>, or <code>toolConfig</code>. Instead, these fields
  /// must be defined through Prompt management. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-use.html">Use
  /// a prompt from Prompt management</a>.
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
  /// <important>
  /// To deny all inference access to resources that you specify in the modelId
  /// field, you need to deny access to the <code>bedrock:InvokeModel</code> and
  /// <code>bedrock:InvokeModelWithResponseStream</code> actions. Doing this
  /// also denies access to the resource through the base inference actions (<a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_InvokeModel.html">InvokeModel</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_InvokeModelWithResponseStream.html">InvokeModelWithResponseStream</a>).
  /// For more information see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/security_iam_id-based-policy-examples.html#security_iam_id-based-policy-examples-deny-inference">Deny
  /// access for inference on specific models</a>.
  /// </important>
  /// For troubleshooting some of the common errors you might encounter when
  /// using the <code>ConverseStream</code> API, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/troubleshooting-api-error-codes.html">Troubleshooting
  /// Amazon Bedrock API Error Codes</a> in the Amazon Bedrock User Guide
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ModelErrorException].
  /// May throw [ModelNotReadyException].
  /// May throw [ModelTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [modelId] :
  /// Specifies the model or throughput with which to run inference, or the
  /// prompt resource to use in inference. The value depends on the resource
  /// that you use:
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
  /// To include a prompt that was defined in <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management.html">Prompt
  /// management</a>, specify the ARN of the prompt version to use.
  /// </li>
  /// </ul>
  /// The Converse API doesn't support <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-import-model.html">imported
  /// models</a>.
  ///
  /// Parameter [additionalModelRequestFields] :
  /// Additional inference parameters that the model supports, beyond the base
  /// set of inference parameters that <code>Converse</code> and
  /// <code>ConverseStream</code> support in the <code>inferenceConfig</code>
  /// field. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Model
  /// parameters</a>.
  ///
  /// Parameter [additionalModelResponseFieldPaths] :
  /// Additional model parameters field paths to return in the response.
  /// <code>Converse</code> and <code>ConverseStream</code> return the requested
  /// fields as a JSON Pointer object in the
  /// <code>additionalModelResponseFields</code> field. The following is example
  /// JSON for <code>additionalModelResponseFieldPaths</code>.
  ///
  /// <code>[ "/stop_sequence" ]</code>
  ///
  /// For information about the JSON Pointer syntax, see the <a
  /// href="https://datatracker.ietf.org/doc/html/rfc6901">Internet Engineering
  /// Task Force (IETF)</a> documentation.
  ///
  /// <code>Converse</code> and <code>ConverseStream</code> reject an empty JSON
  /// Pointer or incorrectly structured JSON Pointer with a <code>400</code>
  /// error code. if the JSON Pointer is valid, but the requested field is not
  /// in the model response, it is ignored by <code>Converse</code>.
  ///
  /// Parameter [guardrailConfig] :
  /// Configuration information for a guardrail that you want to use in the
  /// request. If you include <code>guardContent</code> blocks in the
  /// <code>content</code> field in the <code>messages</code> field, the
  /// guardrail operates only on those messages. If you include no
  /// <code>guardContent</code> blocks, the guardrail operates on all messages
  /// in the request body and in any included prompt resource.
  ///
  /// Parameter [inferenceConfig] :
  /// Inference parameters to pass to the model. <code>Converse</code> and
  /// <code>ConverseStream</code> support a base set of inference parameters. If
  /// you need to pass additional parameters that the model supports, use the
  /// <code>additionalModelRequestFields</code> request field.
  ///
  /// Parameter [messages] :
  /// The messages that you want to send to the model.
  ///
  /// Parameter [outputConfig] :
  /// Output configuration for a model response.
  ///
  /// Parameter [performanceConfig] :
  /// Model performance settings for the request.
  ///
  /// Parameter [promptVariables] :
  /// Contains a map of variables in a prompt from Prompt management to objects
  /// containing the values to fill in for them when running model invocation.
  /// This field is ignored if you don't specify a prompt resource in the
  /// <code>modelId</code> field.
  ///
  /// Parameter [requestMetadata] :
  /// Key-value pairs that you can use to filter invocation logs.
  ///
  /// Parameter [serviceTier] :
  /// Specifies the processing tier configuration used for serving the request.
  ///
  /// Parameter [system] :
  /// A prompt that provides instructions or context to the model about the task
  /// it should perform, or the persona it should adopt during the conversation.
  ///
  /// Parameter [toolConfig] :
  /// Configuration information for the tools that the model can use when
  /// generating a response.
  ///
  /// For information about models that support streaming tool use, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/conversation-inference.html#conversation-inference-supported-models-features">Supported
  /// models and model features</a>.
  Future<ConverseStreamResponse> converseStream({
    required String modelId,
    Document? additionalModelRequestFields,
    List<String>? additionalModelResponseFieldPaths,
    GuardrailStreamConfiguration? guardrailConfig,
    InferenceConfiguration? inferenceConfig,
    List<Message>? messages,
    OutputConfig? outputConfig,
    PerformanceConfiguration? performanceConfig,
    Map<String, PromptVariableValues>? promptVariables,
    Map<String, String>? requestMetadata,
    ServiceTier? serviceTier,
    List<SystemContentBlock>? system,
    ToolConfiguration? toolConfig,
  }) async {
    final $payload = <String, dynamic>{
      if (additionalModelRequestFields != null)
        'additionalModelRequestFields': additionalModelRequestFields,
      if (additionalModelResponseFieldPaths != null)
        'additionalModelResponseFieldPaths': additionalModelResponseFieldPaths,
      if (guardrailConfig != null) 'guardrailConfig': guardrailConfig,
      if (inferenceConfig != null) 'inferenceConfig': inferenceConfig,
      if (messages != null) 'messages': messages,
      if (outputConfig != null) 'outputConfig': outputConfig,
      if (performanceConfig != null) 'performanceConfig': performanceConfig,
      if (promptVariables != null) 'promptVariables': promptVariables,
      if (requestMetadata != null) 'requestMetadata': requestMetadata,
      if (serviceTier != null) 'serviceTier': serviceTier,
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
  /// <important>
  /// To deny all inference access to resources that you specify in the modelId
  /// field, you need to deny access to the <code>bedrock:InvokeModel</code> and
  /// <code>bedrock:InvokeModelWithResponseStream</code> actions. Doing this
  /// also denies access to the resource through the Converse API actions (<a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_Converse.html">Converse</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_ConverseStream.html">ConverseStream</a>).
  /// For more information see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/security_iam_id-based-policy-examples.html#security_iam_id-based-policy-examples-deny-inference">Deny
  /// access for inference on specific models</a>.
  /// </important>
  /// For troubleshooting some of the common errors you might encounter when
  /// using the <code>InvokeModel</code> API, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/troubleshooting-api-error-codes.html">Troubleshooting
  /// Amazon Bedrock API Error Codes</a> in the Amazon Bedrock User Guide
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ModelErrorException].
  /// May throw [ModelNotReadyException].
  /// May throw [ModelTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [modelId] :
  /// The unique identifier of the model to invoke to run inference.
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
  /// If you use a custom model, specify the ARN of the custom model deployment
  /// (for on-demand inference) or the ARN of your provisioned model (for
  /// Provisioned Throughput). For more information, see <a
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
  /// Parameter [performanceConfigLatency] :
  /// Model performance settings for the request.
  ///
  /// Parameter [requestMetadata] :
  /// Key-value pairs that you can use to filter invocation logs.
  ///
  /// Parameter [serviceTier] :
  /// Specifies the processing tier type used for serving the request.
  ///
  /// Parameter [trace] :
  /// Specifies whether to enable or disable the Bedrock trace. If enabled, you
  /// can see the full Bedrock trace.
  Future<InvokeModelResponse> invokeModel({
    required String modelId,
    String? accept,
    Uint8List? body,
    String? contentType,
    String? guardrailIdentifier,
    String? guardrailVersion,
    PerformanceConfigLatency? performanceConfigLatency,
    String? requestMetadata,
    ServiceTierType? serviceTier,
    Trace? trace,
  }) async {
    final headers = <String, String>{
      if (accept != null) 'Accept': accept.toString(),
      if (contentType != null) 'Content-Type': contentType.toString(),
      if (guardrailIdentifier != null)
        'X-Amzn-Bedrock-GuardrailIdentifier': guardrailIdentifier.toString(),
      if (guardrailVersion != null)
        'X-Amzn-Bedrock-GuardrailVersion': guardrailVersion.toString(),
      if (performanceConfigLatency != null)
        'X-Amzn-Bedrock-PerformanceConfig-Latency':
            performanceConfigLatency.value,
      if (requestMetadata != null)
        'X-Amzn-Bedrock-Request-Metadata': requestMetadata.toString(),
      if (serviceTier != null) 'X-Amzn-Bedrock-Service-Tier': serviceTier.value,
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
      performanceConfigLatency: _s
          .extractHeaderStringValue(
              response.headers, 'X-Amzn-Bedrock-PerformanceConfig-Latency')
          ?.let(PerformanceConfigLatency.fromString),
      serviceTier: _s
          .extractHeaderStringValue(
              response.headers, 'X-Amzn-Bedrock-Service-Tier')
          ?.let(ServiceTierType.fromString),
    );
  }

  /// Invoke the specified Amazon Bedrock model to run inference using the
  /// bidirectional stream. The response is returned in a stream that remains
  /// open for 8 minutes. A single session can contain multiple prompts and
  /// responses from the model. The prompts to the model are provided as audio
  /// files and the model's responses are spoken back to the user and
  /// transcribed.
  ///
  /// It is possible for users to interrupt the model's response with a new
  /// prompt, which will halt the response speech. The model will retain
  /// contextual awareness of the conversation while pivoting to respond to the
  /// new prompt.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ModelErrorException].
  /// May throw [ModelNotReadyException].
  /// May throw [ModelStreamErrorException].
  /// May throw [ModelTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [body] :
  /// The prompt and inference parameters in the format specified in the
  /// <code>BidirectionalInputPayloadPart</code> in the header. You must provide
  /// the body in JSON format. To see the format and content of the request and
  /// response bodies for different models, refer to <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
  /// parameters</a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/api-methods-run.html">Run
  /// inference</a> in the Bedrock User Guide.
  ///
  /// Parameter [modelId] :
  /// The model ID or ARN of the model ID to use. Currently, only
  /// <code>amazon.nova-sonic-v1:0</code> is supported.
  Future<InvokeModelWithBidirectionalStreamResponse>
      invokeModelWithBidirectionalStream({
    required InvokeModelWithBidirectionalStreamInput body,
    required String modelId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: body,
      method: 'POST',
      requestUri:
          '/model/${Uri.encodeComponent(modelId)}/invoke-with-bidirectional-stream',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return InvokeModelWithBidirectionalStreamResponse(
      body: InvokeModelWithBidirectionalStreamOutput.fromJson($json),
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
  /// <important>
  /// To deny all inference access to resources that you specify in the modelId
  /// field, you need to deny access to the <code>bedrock:InvokeModel</code> and
  /// <code>bedrock:InvokeModelWithResponseStream</code> actions. Doing this
  /// also denies access to the resource through the Converse API actions (<a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_Converse.html">Converse</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_ConverseStream.html">ConverseStream</a>).
  /// For more information see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/security_iam_id-based-policy-examples.html#security_iam_id-based-policy-examples-deny-inference">Deny
  /// access for inference on specific models</a>.
  /// </important>
  /// For troubleshooting some of the common errors you might encounter when
  /// using the <code>InvokeModelWithResponseStream</code> API, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/troubleshooting-api-error-codes.html">Troubleshooting
  /// Amazon Bedrock API Error Codes</a> in the Amazon Bedrock User Guide
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ModelErrorException].
  /// May throw [ModelNotReadyException].
  /// May throw [ModelStreamErrorException].
  /// May throw [ModelTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [modelId] :
  /// The unique identifier of the model to invoke to run inference.
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
  /// If you use a custom model, specify the ARN of the custom model deployment
  /// (for on-demand inference) or the ARN of your provisioned model (for
  /// Provisioned Throughput). For more information, see <a
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
  /// Parameter [performanceConfigLatency] :
  /// Model performance settings for the request.
  ///
  /// Parameter [requestMetadata] :
  /// Key-value pairs that you can use to filter invocation logs.
  ///
  /// Parameter [serviceTier] :
  /// Specifies the processing tier type used for serving the request.
  ///
  /// Parameter [trace] :
  /// Specifies whether to enable or disable the Bedrock trace. If enabled, you
  /// can see the full Bedrock trace.
  Future<InvokeModelWithResponseStreamResponse> invokeModelWithResponseStream({
    required String modelId,
    String? accept,
    Uint8List? body,
    String? contentType,
    String? guardrailIdentifier,
    String? guardrailVersion,
    PerformanceConfigLatency? performanceConfigLatency,
    String? requestMetadata,
    ServiceTierType? serviceTier,
    Trace? trace,
  }) async {
    final headers = <String, String>{
      if (accept != null) 'X-Amzn-Bedrock-Accept': accept.toString(),
      if (contentType != null) 'Content-Type': contentType.toString(),
      if (guardrailIdentifier != null)
        'X-Amzn-Bedrock-GuardrailIdentifier': guardrailIdentifier.toString(),
      if (guardrailVersion != null)
        'X-Amzn-Bedrock-GuardrailVersion': guardrailVersion.toString(),
      if (performanceConfigLatency != null)
        'X-Amzn-Bedrock-PerformanceConfig-Latency':
            performanceConfigLatency.value,
      if (requestMetadata != null)
        'X-Amzn-Bedrock-Request-Metadata': requestMetadata.toString(),
      if (serviceTier != null) 'X-Amzn-Bedrock-Service-Tier': serviceTier.value,
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
      performanceConfigLatency: _s
          .extractHeaderStringValue(
              response.headers, 'X-Amzn-Bedrock-PerformanceConfig-Latency')
          ?.let(PerformanceConfigLatency.fromString),
      serviceTier: _s
          .extractHeaderStringValue(
              response.headers, 'X-Amzn-Bedrock-Service-Tier')
          ?.let(ServiceTierType.fromString),
    );
  }

  /// Returns the token count for a given inference request. This operation
  /// helps you estimate token usage before sending requests to foundation
  /// models by returning the token count that would be used if the same input
  /// were sent to the model in an inference request.
  ///
  /// Token counting is model-specific because different models use different
  /// tokenization strategies. The token count returned by this operation will
  /// match the token count that would be charged if the same input were sent to
  /// the model in an <code>InvokeModel</code> or <code>Converse</code> request.
  ///
  /// You can use this operation to:
  ///
  /// <ul>
  /// <li>
  /// Estimate costs before sending inference requests.
  /// </li>
  /// <li>
  /// Optimize prompts to fit within token limits.
  /// </li>
  /// <li>
  /// Plan for token usage in your applications.
  /// </li>
  /// </ul>
  /// This operation accepts the same input formats as <code>InvokeModel</code>
  /// and <code>Converse</code>, allowing you to count tokens for both raw text
  /// inputs and structured conversation formats.
  ///
  /// The following operations are related to <code>CountTokens</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/API/API_runtime_InvokeModel.html">InvokeModel</a>
  /// - Sends inference requests to foundation models
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/API/API_runtime_Converse.html">Converse</a>
  /// - Sends conversation-based inference requests to foundation models
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [input] :
  /// The input for which to count tokens. The structure of this parameter
  /// depends on whether you're counting tokens for an <code>InvokeModel</code>
  /// or <code>Converse</code> request:
  ///
  /// <ul>
  /// <li>
  /// For <code>InvokeModel</code> requests, provide the request body in the
  /// <code>invokeModel</code> field
  /// </li>
  /// <li>
  /// For <code>Converse</code> requests, provide the messages and system
  /// content in the <code>converse</code> field
  /// </li>
  /// </ul>
  /// The input format must be compatible with the model specified in the
  /// <code>modelId</code> parameter.
  ///
  /// Parameter [modelId] :
  /// The unique identifier or ARN of the foundation model to use for token
  /// counting. Each model processes tokens differently, so the token count is
  /// specific to the model you specify.
  Future<CountTokensResponse> countTokens({
    required CountTokensInput input,
    required String modelId,
  }) async {
    final $payload = <String, dynamic>{
      'input': input,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/model/${Uri.encodeComponent(modelId)}/count-tokens',
      exceptionFnMap: _exceptionFns,
    );
    return CountTokensResponse.fromJson(response);
  }
}

class GetAsyncInvokeResponse {
  /// The invocation's ARN.
  final String invocationArn;

  /// The invocation's model ARN.
  final String modelArn;

  /// Output data settings.
  final AsyncInvokeOutputDataConfig outputDataConfig;

  /// The invocation's status.
  final AsyncInvokeStatus status;

  /// When the invocation request was submitted.
  final DateTime submitTime;

  /// The invocation's idempotency token.
  final String? clientRequestToken;

  /// When the invocation ended.
  final DateTime? endTime;

  /// An error message.
  final String? failureMessage;

  /// The invocation's last modified time.
  final DateTime? lastModifiedTime;

  GetAsyncInvokeResponse({
    required this.invocationArn,
    required this.modelArn,
    required this.outputDataConfig,
    required this.status,
    required this.submitTime,
    this.clientRequestToken,
    this.endTime,
    this.failureMessage,
    this.lastModifiedTime,
  });

  factory GetAsyncInvokeResponse.fromJson(Map<String, dynamic> json) {
    return GetAsyncInvokeResponse(
      invocationArn: (json['invocationArn'] as String?) ?? '',
      modelArn: (json['modelArn'] as String?) ?? '',
      outputDataConfig: AsyncInvokeOutputDataConfig.fromJson(
          (json['outputDataConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: AsyncInvokeStatus.fromString((json['status'] as String?) ?? ''),
      submitTime: nonNullableTimeStampFromJson(json['submitTime'] ?? 0),
      clientRequestToken: json['clientRequestToken'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      failureMessage: json['failureMessage'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final invocationArn = this.invocationArn;
    final modelArn = this.modelArn;
    final outputDataConfig = this.outputDataConfig;
    final status = this.status;
    final submitTime = this.submitTime;
    final clientRequestToken = this.clientRequestToken;
    final endTime = this.endTime;
    final failureMessage = this.failureMessage;
    final lastModifiedTime = this.lastModifiedTime;
    return {
      'invocationArn': invocationArn,
      'modelArn': modelArn,
      'outputDataConfig': outputDataConfig,
      'status': status.value,
      'submitTime': iso8601ToJson(submitTime),
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
    };
  }
}

/// An internal server error occurred. For troubleshooting this error, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/troubleshooting-api-error-codes.html#ts-internal-failure">InternalFailure</a>
/// in the Amazon Bedrock User Guide
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

/// Your request was denied due to exceeding the account quotas for <i>Amazon
/// Bedrock</i>. For troubleshooting this error, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/troubleshooting-api-error-codes.html#ts-throttling-exception">ThrottlingException</a>
/// in the Amazon Bedrock User Guide
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

/// The input fails to satisfy the constraints specified by <i>Amazon
/// Bedrock</i>. For troubleshooting this error, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/troubleshooting-api-error-codes.html#ts-validation-error">ValidationError</a>
/// in the Amazon Bedrock User Guide
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

class ListAsyncInvokesResponse {
  /// A list of invocation summaries.
  final List<AsyncInvokeSummary>? asyncInvokeSummaries;

  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  final String? nextToken;

  ListAsyncInvokesResponse({
    this.asyncInvokeSummaries,
    this.nextToken,
  });

  factory ListAsyncInvokesResponse.fromJson(Map<String, dynamic> json) {
    return ListAsyncInvokesResponse(
      asyncInvokeSummaries: (json['asyncInvokeSummaries'] as List?)
          ?.nonNulls
          .map((e) => AsyncInvokeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final asyncInvokeSummaries = this.asyncInvokeSummaries;
    final nextToken = this.nextToken;
    return {
      if (asyncInvokeSummaries != null)
        'asyncInvokeSummaries': asyncInvokeSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class StartAsyncInvokeResponse {
  /// The ARN of the invocation.
  final String invocationArn;

  StartAsyncInvokeResponse({
    required this.invocationArn,
  });

  factory StartAsyncInvokeResponse.fromJson(Map<String, dynamic> json) {
    return StartAsyncInvokeResponse(
      invocationArn: (json['invocationArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final invocationArn = this.invocationArn;
    return {
      'invocationArn': invocationArn,
    };
  }
}

/// The service isn't currently available. For troubleshooting this error, see
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/troubleshooting-api-error-codes.html#ts-service-unavailable">ServiceUnavailable</a>
/// in the Amazon Bedrock User Guide
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

class ApplyGuardrailResponse {
  /// The action taken in the response from the guardrail.
  final GuardrailAction action;

  /// The assessment details in the response from the guardrail.
  final List<GuardrailAssessment> assessments;

  /// The output details in the response from the guardrail.
  final List<GuardrailOutputContent> outputs;

  /// The usage details in the response from the guardrail.
  final GuardrailUsage usage;

  /// The reason for the action taken when harmful content is detected.
  final String? actionReason;

  /// The guardrail coverage details in the apply guardrail response.
  final GuardrailCoverage? guardrailCoverage;

  ApplyGuardrailResponse({
    required this.action,
    required this.assessments,
    required this.outputs,
    required this.usage,
    this.actionReason,
    this.guardrailCoverage,
  });

  factory ApplyGuardrailResponse.fromJson(Map<String, dynamic> json) {
    return ApplyGuardrailResponse(
      action: GuardrailAction.fromString((json['action'] as String?) ?? ''),
      assessments: ((json['assessments'] as List?) ?? const [])
          .nonNulls
          .map((e) => GuardrailAssessment.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputs: ((json['outputs'] as List?) ?? const [])
          .nonNulls
          .map(
              (e) => GuardrailOutputContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      usage: GuardrailUsage.fromJson((json['usage'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      actionReason: json['actionReason'] as String?,
      guardrailCoverage: json['guardrailCoverage'] != null
          ? GuardrailCoverage.fromJson(
              json['guardrailCoverage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final assessments = this.assessments;
    final outputs = this.outputs;
    final usage = this.usage;
    final actionReason = this.actionReason;
    final guardrailCoverage = this.guardrailCoverage;
    return {
      'action': action.value,
      'assessments': assessments,
      'outputs': outputs,
      'usage': usage,
      if (actionReason != null) 'actionReason': actionReason,
      if (guardrailCoverage != null) 'guardrailCoverage': guardrailCoverage,
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

  /// Model performance settings for the request.
  final PerformanceConfiguration? performanceConfig;

  /// Specifies the processing tier configuration used for serving the request.
  final ServiceTier? serviceTier;

  /// A trace object that contains information about the Guardrail behavior.
  final ConverseTrace? trace;

  ConverseResponse({
    required this.metrics,
    required this.output,
    required this.stopReason,
    required this.usage,
    this.additionalModelResponseFields,
    this.performanceConfig,
    this.serviceTier,
    this.trace,
  });

  factory ConverseResponse.fromJson(Map<String, dynamic> json) {
    return ConverseResponse(
      metrics: ConverseMetrics.fromJson(
          (json['metrics'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      output: ConverseOutput.fromJson(
          (json['output'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      stopReason: StopReason.fromString((json['stopReason'] as String?) ?? ''),
      usage: TokenUsage.fromJson((json['usage'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      additionalModelResponseFields:
          json['additionalModelResponseFields'] != null
              ? Document.fromJson(
                  json['additionalModelResponseFields'] as Map<String, dynamic>)
              : null,
      performanceConfig: json['performanceConfig'] != null
          ? PerformanceConfiguration.fromJson(
              json['performanceConfig'] as Map<String, dynamic>)
          : null,
      serviceTier: json['serviceTier'] != null
          ? ServiceTier.fromJson(json['serviceTier'] as Map<String, dynamic>)
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
    final performanceConfig = this.performanceConfig;
    final serviceTier = this.serviceTier;
    final trace = this.trace;
    return {
      'metrics': metrics,
      'output': output,
      'stopReason': stopReason.value,
      'usage': usage,
      if (additionalModelResponseFields != null)
        'additionalModelResponseFields': additionalModelResponseFields,
      if (performanceConfig != null) 'performanceConfig': performanceConfig,
      if (serviceTier != null) 'serviceTier': serviceTier,
      if (trace != null) 'trace': trace,
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

class InvokeModelResponse {
  /// Inference response from the model in the format specified in the
  /// <code>contentType</code> header. To see the format and content of the
  /// request and response bodies for different models, refer to <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
  /// parameters</a>.
  final Uint8List body;

  /// The MIME type of the inference result.
  final String contentType;

  /// Model performance settings for the request.
  final PerformanceConfigLatency? performanceConfigLatency;

  /// Specifies the processing tier type used for serving the request.
  final ServiceTierType? serviceTier;

  InvokeModelResponse({
    required this.body,
    required this.contentType,
    this.performanceConfigLatency,
    this.serviceTier,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final contentType = this.contentType;
    final performanceConfigLatency = this.performanceConfigLatency;
    final serviceTier = this.serviceTier;
    return {
      'body': base64Encode(body),
    };
  }
}

class InvokeModelWithBidirectionalStreamResponse {
  /// Streaming response from the model in the format specified by the
  /// <code>BidirectionalOutputPayloadPart</code> header.
  final InvokeModelWithBidirectionalStreamOutput body;

  InvokeModelWithBidirectionalStreamResponse({
    required this.body,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    return {
      'body': body,
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

class InvokeModelWithResponseStreamResponse {
  /// Inference response from the model in the format specified by the
  /// <code>contentType</code> header. To see the format and content of this field
  /// for different models, refer to <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
  /// parameters</a>.
  final ResponseStream body;

  /// The MIME type of the inference result.
  final String contentType;

  /// Model performance settings for the request.
  final PerformanceConfigLatency? performanceConfigLatency;

  /// Specifies the processing tier type used for serving the request.
  final ServiceTierType? serviceTier;

  InvokeModelWithResponseStreamResponse({
    required this.body,
    required this.contentType,
    this.performanceConfigLatency,
    this.serviceTier,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final contentType = this.contentType;
    final performanceConfigLatency = this.performanceConfigLatency;
    final serviceTier = this.serviceTier;
    return {
      'body': body,
    };
  }
}

class CountTokensResponse {
  /// The number of tokens in the provided input according to the specified
  /// model's tokenization rules. This count represents the number of input tokens
  /// that would be processed if the same input were sent to the model in an
  /// inference request. Use this value to estimate costs and ensure your inputs
  /// stay within model token limits.
  final int inputTokens;

  CountTokensResponse({
    required this.inputTokens,
  });

  factory CountTokensResponse.fromJson(Map<String, dynamic> json) {
    return CountTokensResponse(
      inputTokens: (json['inputTokens'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final inputTokens = this.inputTokens;
    return {
      'inputTokens': inputTokens,
    };
  }
}

/// The input value for token counting. The value should be either an
/// <code>InvokeModel</code> or <code>Converse</code> request body.
class CountTokensInput {
  /// A <code>Converse</code> request for which to count tokens. Use this field
  /// when you want to count tokens for a conversation-based input that would be
  /// sent to the <code>Converse</code> operation.
  final ConverseTokensRequest? converse;

  /// An <code>InvokeModel</code> request for which to count tokens. Use this
  /// field when you want to count tokens for a raw text input that would be sent
  /// to the <code>InvokeModel</code> operation.
  final InvokeModelTokensRequest? invokeModel;

  CountTokensInput({
    this.converse,
    this.invokeModel,
  });

  Map<String, dynamic> toJson() {
    final converse = this.converse;
    final invokeModel = this.invokeModel;
    return {
      if (converse != null) 'converse': converse,
      if (invokeModel != null) 'invokeModel': invokeModel,
    };
  }
}

/// The body of an <code>InvokeModel</code> API request for token counting. This
/// structure mirrors the input format for the <code>InvokeModel</code>
/// operation, allowing you to count tokens for raw text inference requests.
class InvokeModelTokensRequest {
  /// The request body to count tokens for, formatted according to the model's
  /// expected input format. To learn about the input format for different models,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Model
  /// inference parameters and responses</a>.
  final Uint8List body;

  InvokeModelTokensRequest({
    required this.body,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    return {
      'body': base64Encode(body),
    };
  }
}

/// The inputs from a <code>Converse</code> API request for token counting.
///
/// This structure mirrors the input format for the <code>Converse</code>
/// operation, allowing you to count tokens for conversation-based inference
/// requests.
class ConverseTokensRequest {
  /// The additionalModelRequestFields of Converse input request to count tokens
  /// for. Use this field when you want to pass additional parameters that the
  /// model supports.
  final Document? additionalModelRequestFields;

  /// An array of messages to count tokens for.
  final List<Message>? messages;

  /// The system content blocks to count tokens for. System content provides
  /// instructions or context to the model about how it should behave or respond.
  /// The token count will include any system content provided.
  final List<SystemContentBlock>? system;

  /// The toolConfig of Converse input request to count tokens for. Configuration
  /// information for the tools that the model can use when generating a response.
  final ToolConfiguration? toolConfig;

  ConverseTokensRequest({
    this.additionalModelRequestFields,
    this.messages,
    this.system,
    this.toolConfig,
  });

  Map<String, dynamic> toJson() {
    final additionalModelRequestFields = this.additionalModelRequestFields;
    final messages = this.messages;
    final system = this.system;
    final toolConfig = this.toolConfig;
    return {
      if (additionalModelRequestFields != null)
        'additionalModelRequestFields': additionalModelRequestFields,
      if (messages != null) 'messages': messages,
      if (system != null) 'system': system,
      if (toolConfig != null) 'toolConfig': toolConfig,
    };
  }
}

/// Configuration information for the tools that you pass to a model. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Tool
/// use (function calling)</a> in the Amazon Bedrock User Guide.
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

/// Determines which tools the model should request in a call to
/// <code>Converse</code> or <code>ConverseStream</code>. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Call
/// a tool with the Converse API</a> in the Amazon Bedrock User Guide.
class ToolChoice {
  /// The model must request at least one tool (no text is generated).
  final AnyToolChoice? any;

  /// (Default). The Model automatically decides if a tool should be called or
  /// whether to generate text instead.
  final AutoToolChoice? auto;

  /// The Model must request the specified tool. Only supported by Anthropic
  /// Claude 3 and Amazon Nova models.
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

/// The Model automatically decides if a tool should be called or whether to
/// generate text instead. For example, <code>{"auto" : {}}</code>. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Call
/// a tool with the Converse API</a> in the Amazon Bedrock User Guide
class AutoToolChoice {
  AutoToolChoice();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The model must request at least one tool (no text is generated). For
/// example, <code>{"any" : {}}</code>. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Call
/// a tool with the Converse API</a> in the Amazon Bedrock User Guide.
class AnyToolChoice {
  AnyToolChoice();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The model must request a specific tool. For example, <code>{"tool" : {"name"
/// : "Your tool name"}}</code>. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Call
/// a tool with the Converse API</a> in the Amazon Bedrock User Guide
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

/// Information about a tool that you can use with the Converse API. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Call
/// a tool with the Converse API</a> in the Amazon Bedrock User Guide.
class Tool {
  /// CachePoint to include in the tool configuration.
  final CachePointBlock? cachePoint;

  /// Specifies the system-defined tool that you want use.
  final SystemTool? systemTool;

  /// The specfication for the tool.
  final ToolSpecification? toolSpec;

  Tool({
    this.cachePoint,
    this.systemTool,
    this.toolSpec,
  });

  Map<String, dynamic> toJson() {
    final cachePoint = this.cachePoint;
    final systemTool = this.systemTool;
    final toolSpec = this.toolSpec;
    return {
      if (cachePoint != null) 'cachePoint': cachePoint,
      if (systemTool != null) 'systemTool': systemTool,
      if (toolSpec != null) 'toolSpec': toolSpec,
    };
  }
}

/// The specification for the tool. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Call
/// a tool with the Converse API</a> in the Amazon Bedrock User Guide.
class ToolSpecification {
  /// The input schema for the tool in JSON format.
  final ToolInputSchema inputSchema;

  /// The name for the tool.
  final String name;

  /// The description for the tool.
  final String? description;

  /// Flag to enable structured output enforcement on a tool usage response.
  final bool? strict;

  ToolSpecification({
    required this.inputSchema,
    required this.name,
    this.description,
    this.strict,
  });

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

/// Specifies a system-defined tool for the model to use. <i>System-defined
/// tools</i> are tools that are created and provided by the model provider.
class SystemTool {
  /// The name of the system-defined tool that you want to call.
  final String name;

  SystemTool({
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

/// Defines a section of content to be cached for reuse in subsequent API calls.
class CachePointBlock {
  /// Specifies the type of cache point within the CachePointBlock.
  final CachePointType type;

  /// Optional TTL duration for cache entries. When specified, enables extended
  /// TTL caching with the specified duration. When omitted, uses
  /// <code>type</code> value for caching behavior.
  final CacheTTL? ttl;

  CachePointBlock({
    required this.type,
    this.ttl,
  });

  factory CachePointBlock.fromJson(Map<String, dynamic> json) {
    return CachePointBlock(
      type: CachePointType.fromString((json['type'] as String?) ?? ''),
      ttl: (json['ttl'] as String?)?.let(CacheTTL.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final ttl = this.ttl;
    return {
      'type': type.value,
      if (ttl != null) 'ttl': ttl.value,
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

/// Time-to-live duration for ephemeral cache entries
class CacheTTL {
  static const $5m = CacheTTL._('5m');
  static const $1h = CacheTTL._('1h');

  final String value;

  const CacheTTL._(this.value);

  static const values = [$5m, $1h];

  static CacheTTL fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CacheTTL._(value));

  @override
  bool operator ==(other) => other is CacheTTL && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The schema for the tool. The top level schema type must be
/// <code>object</code>. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Call
/// a tool with the Converse API</a> in the Amazon Bedrock User Guide.
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

/// Contains configurations for instructions to provide the model for how to
/// handle input. To learn more, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/conversation-inference-call.html">Using
/// the Converse API</a>.
class SystemContentBlock {
  /// CachePoint to include in the system prompt.
  final CachePointBlock? cachePoint;

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
    this.cachePoint,
    this.guardContent,
    this.text,
  });

  Map<String, dynamic> toJson() {
    final cachePoint = this.cachePoint;
    final guardContent = this.guardContent;
    final text = this.text;
    return {
      if (cachePoint != null) 'cachePoint': cachePoint,
      if (guardContent != null) 'guardContent': guardContent,
      if (text != null) 'text': text,
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
  /// Image within converse content block to be evaluated by the guardrail.
  final GuardrailConverseImageBlock? image;

  /// The text to guard.
  final GuardrailConverseTextBlock? text;

  GuardrailConverseContentBlock({
    this.image,
    this.text,
  });

  factory GuardrailConverseContentBlock.fromJson(Map<String, dynamic> json) {
    return GuardrailConverseContentBlock(
      image: json['image'] != null
          ? GuardrailConverseImageBlock.fromJson(
              json['image'] as Map<String, dynamic>)
          : null,
      text: json['text'] != null
          ? GuardrailConverseTextBlock.fromJson(
              json['text'] as Map<String, dynamic>)
          : null,
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

/// A text block that contains text that you want to assess with a guardrail.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_GuardrailConverseContentBlock.html">GuardrailConverseContentBlock</a>.
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
      text: (json['text'] as String?) ?? '',
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

/// An image block that contains images that you want to assess with a
/// guardrail.
class GuardrailConverseImageBlock {
  /// The format details for the image type of the guardrail converse image block.
  final GuardrailConverseImageFormat format;

  /// The image source (image bytes) of the guardrail converse image block.
  final GuardrailConverseImageSource source;

  GuardrailConverseImageBlock({
    required this.format,
    required this.source,
  });

  factory GuardrailConverseImageBlock.fromJson(Map<String, dynamic> json) {
    return GuardrailConverseImageBlock(
      format: GuardrailConverseImageFormat.fromString(
          (json['format'] as String?) ?? ''),
      source: GuardrailConverseImageSource.fromJson(
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

class GuardrailConverseImageFormat {
  static const png = GuardrailConverseImageFormat._('png');
  static const jpeg = GuardrailConverseImageFormat._('jpeg');

  final String value;

  const GuardrailConverseImageFormat._(this.value);

  static const values = [png, jpeg];

  static GuardrailConverseImageFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailConverseImageFormat._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailConverseImageFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The image source (image bytes) of the guardrail converse image source.
class GuardrailConverseImageSource {
  /// The raw image bytes for the image.
  final Uint8List? bytes;

  GuardrailConverseImageSource({
    this.bytes,
  });

  factory GuardrailConverseImageSource.fromJson(Map<String, dynamic> json) {
    return GuardrailConverseImageSource(
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

class GuardrailConverseContentQualifier {
  static const groundingSource =
      GuardrailConverseContentQualifier._('grounding_source');
  static const query = GuardrailConverseContentQualifier._('query');
  static const guardContent =
      GuardrailConverseContentQualifier._('guard_content');

  final String value;

  const GuardrailConverseContentQualifier._(this.value);

  static const values = [groundingSource, query, guardContent];

  static GuardrailConverseContentQualifier fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailConverseContentQualifier._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailConverseContentQualifier && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
  static const system = ConversationRole._('system');

  final String value;

  const ConversationRole._(this.value);

  static const values = [user, assistant, system];

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

/// A block of content for a message that you pass to, or receive from, a model
/// with the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_Converse.html">Converse</a>
/// or <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_ConverseStream.html">ConverseStream</a>
/// API operations.
class ContentBlock {
  /// An audio content block containing audio data in the conversation.
  final AudioBlock? audio;

  /// CachePoint to include in the message.
  final CachePointBlock? cachePoint;

  /// A content block that contains both generated text and associated citation
  /// information, providing traceability between the response and source
  /// documents.
  final CitationsContentBlock? citationsContent;

  /// A document to include in the message.
  final DocumentBlock? document;

  /// Contains the content to assess with the guardrail. If you don't specify
  /// <code>guardContent</code> in a call to the Converse API, the guardrail (if
  /// passed in the Converse API) assesses the entire message.
  ///
  /// For more information, see <i>Use a guardrail with the Converse API</i> in
  /// the <i>Amazon Bedrock User Guide</i>.
  final GuardrailConverseContentBlock? guardContent;

  /// Image to include in the message.
  /// <note>
  /// This field is only supported by Anthropic Claude 3 models.
  /// </note>
  final ImageBlock? image;

  /// Contains content regarding the reasoning that is carried out by the model.
  /// Reasoning refers to a Chain of Thought (CoT) that the model generates to
  /// enhance the accuracy of its final response.
  final ReasoningContentBlock? reasoningContent;

  /// Search result to include in the message.
  final SearchResultBlock? searchResult;

  /// Text to include in the message.
  final String? text;

  /// The result for a tool request that a model makes.
  final ToolResultBlock? toolResult;

  /// Information about a tool use request from a model.
  final ToolUseBlock? toolUse;

  /// Video to include in the message.
  final VideoBlock? video;

  ContentBlock({
    this.audio,
    this.cachePoint,
    this.citationsContent,
    this.document,
    this.guardContent,
    this.image,
    this.reasoningContent,
    this.searchResult,
    this.text,
    this.toolResult,
    this.toolUse,
    this.video,
  });

  factory ContentBlock.fromJson(Map<String, dynamic> json) {
    return ContentBlock(
      audio: json['audio'] != null
          ? AudioBlock.fromJson(json['audio'] as Map<String, dynamic>)
          : null,
      cachePoint: json['cachePoint'] != null
          ? CachePointBlock.fromJson(json['cachePoint'] as Map<String, dynamic>)
          : null,
      citationsContent: json['citationsContent'] != null
          ? CitationsContentBlock.fromJson(
              json['citationsContent'] as Map<String, dynamic>)
          : null,
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
      reasoningContent: json['reasoningContent'] != null
          ? ReasoningContentBlock.fromJson(
              json['reasoningContent'] as Map<String, dynamic>)
          : null,
      searchResult: json['searchResult'] != null
          ? SearchResultBlock.fromJson(
              json['searchResult'] as Map<String, dynamic>)
          : null,
      text: json['text'] as String?,
      toolResult: json['toolResult'] != null
          ? ToolResultBlock.fromJson(json['toolResult'] as Map<String, dynamic>)
          : null,
      toolUse: json['toolUse'] != null
          ? ToolUseBlock.fromJson(json['toolUse'] as Map<String, dynamic>)
          : null,
      video: json['video'] != null
          ? VideoBlock.fromJson(json['video'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audio = this.audio;
    final cachePoint = this.cachePoint;
    final citationsContent = this.citationsContent;
    final document = this.document;
    final guardContent = this.guardContent;
    final image = this.image;
    final reasoningContent = this.reasoningContent;
    final searchResult = this.searchResult;
    final text = this.text;
    final toolResult = this.toolResult;
    final toolUse = this.toolUse;
    final video = this.video;
    return {
      if (audio != null) 'audio': audio,
      if (cachePoint != null) 'cachePoint': cachePoint,
      if (citationsContent != null) 'citationsContent': citationsContent,
      if (document != null) 'document': document,
      if (guardContent != null) 'guardContent': guardContent,
      if (image != null) 'image': image,
      if (reasoningContent != null) 'reasoningContent': reasoningContent,
      if (searchResult != null) 'searchResult': searchResult,
      if (text != null) 'text': text,
      if (toolResult != null) 'toolResult': toolResult,
      if (toolUse != null) 'toolUse': toolUse,
      if (video != null) 'video': video,
    };
  }
}

/// Image content for a message.
class ImageBlock {
  /// The format of the image.
  final ImageFormat format;

  /// The source for the image.
  final ImageSource source;

  /// Error information if the image block could not be processed or contains
  /// invalid data.
  final ErrorBlock? error;

  ImageBlock({
    required this.format,
    required this.source,
    this.error,
  });

  factory ImageBlock.fromJson(Map<String, dynamic> json) {
    return ImageBlock(
      format: ImageFormat.fromString((json['format'] as String?) ?? ''),
      source: ImageSource.fromJson((json['source'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      error: json['error'] != null
          ? ErrorBlock.fromJson(json['error'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final source = this.source;
    final error = this.error;
    return {
      'format': format.value,
      'source': source,
      if (error != null) 'error': error,
    };
  }
}

/// A document to include in a message.
class DocumentBlock {
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

  /// Configuration settings that control how citations should be generated for
  /// this specific document.
  final CitationsConfig? citations;

  /// Contextual information about how the document should be processed or
  /// interpreted by the model when generating citations.
  final String? context;

  /// The format of a document, or its extension.
  final DocumentFormat? format;

  DocumentBlock({
    required this.name,
    required this.source,
    this.citations,
    this.context,
    this.format,
  });

  factory DocumentBlock.fromJson(Map<String, dynamic> json) {
    return DocumentBlock(
      name: (json['name'] as String?) ?? '',
      source: DocumentSource.fromJson(
          (json['source'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      citations: json['citations'] != null
          ? CitationsConfig.fromJson(json['citations'] as Map<String, dynamic>)
          : null,
      context: json['context'] as String?,
      format: (json['format'] as String?)?.let(DocumentFormat.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final source = this.source;
    final citations = this.citations;
    final context = this.context;
    final format = this.format;
    return {
      'name': name,
      'source': source,
      if (citations != null) 'citations': citations,
      if (context != null) 'context': context,
      if (format != null) 'format': format.value,
    };
  }
}

/// A video block.
class VideoBlock {
  /// The block's format.
  final VideoFormat format;

  /// The block's source.
  final VideoSource source;

  VideoBlock({
    required this.format,
    required this.source,
  });

  factory VideoBlock.fromJson(Map<String, dynamic> json) {
    return VideoBlock(
      format: VideoFormat.fromString((json['format'] as String?) ?? ''),
      source: VideoSource.fromJson((json['source'] as Map<String, dynamic>?) ??
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

/// An audio content block that contains audio data in various supported
/// formats.
class AudioBlock {
  /// The format of the audio data, such as MP3, WAV, FLAC, or other supported
  /// audio formats.
  final AudioFormat format;

  /// The source of the audio data, which can be provided as raw bytes or an S3
  /// location.
  final AudioSource source;

  /// Error information if the audio block could not be processed or contains
  /// invalid data.
  final ErrorBlock? error;

  AudioBlock({
    required this.format,
    required this.source,
    this.error,
  });

  factory AudioBlock.fromJson(Map<String, dynamic> json) {
    return AudioBlock(
      format: AudioFormat.fromString((json['format'] as String?) ?? ''),
      source: AudioSource.fromJson((json['source'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      error: json['error'] != null
          ? ErrorBlock.fromJson(json['error'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final source = this.source;
    final error = this.error;
    return {
      'format': format.value,
      'source': source,
      if (error != null) 'error': error,
    };
  }
}

/// A tool use content block. Contains information about a tool that the model
/// is requesting be run., The model uses the result from the tool to generate a
/// response. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Call
/// a tool with the Converse API</a> in the Amazon Bedrock User Guide.
class ToolUseBlock {
  /// The input to pass to the tool.
  final Document input;

  /// The name of the tool that the model wants to use.
  final String name;

  /// The ID for the tool request.
  final String toolUseId;

  /// The type for the tool request.
  final ToolUseType? type;

  ToolUseBlock({
    required this.input,
    required this.name,
    required this.toolUseId,
    this.type,
  });

  factory ToolUseBlock.fromJson(Map<String, dynamic> json) {
    return ToolUseBlock(
      input: Document.fromJson((json['input'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      name: (json['name'] as String?) ?? '',
      toolUseId: (json['toolUseId'] as String?) ?? '',
      type: (json['type'] as String?)?.let(ToolUseType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final input = this.input;
    final name = this.name;
    final toolUseId = this.toolUseId;
    final type = this.type;
    return {
      'input': input,
      'name': name,
      'toolUseId': toolUseId,
      if (type != null) 'type': type.value,
    };
  }
}

/// A tool result block that contains the results for a tool request that the
/// model previously made. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Call
/// a tool with the Converse API</a> in the Amazon Bedrock User Guide.
class ToolResultBlock {
  /// The content for tool result content block.
  final List<ToolResultContentBlock> content;

  /// The ID of the tool request that this is the result for.
  final String toolUseId;

  /// The status for the tool result content block.
  /// <note>
  /// This field is only supported by Amazon Nova and Anthropic Claude 3 and 4
  /// models.
  /// </note>
  final ToolResultStatus? status;

  /// The type for the tool result content block.
  final String? type;

  ToolResultBlock({
    required this.content,
    required this.toolUseId,
    this.status,
    this.type,
  });

  factory ToolResultBlock.fromJson(Map<String, dynamic> json) {
    return ToolResultBlock(
      content: ((json['content'] as List?) ?? const [])
          .nonNulls
          .map(
              (e) => ToolResultContentBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      toolUseId: (json['toolUseId'] as String?) ?? '',
      status: (json['status'] as String?)?.let(ToolResultStatus.fromString),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final toolUseId = this.toolUseId;
    final status = this.status;
    final type = this.type;
    return {
      'content': content,
      'toolUseId': toolUseId,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type,
    };
  }
}

/// Contains content regarding the reasoning that is carried out by the model
/// with respect to the content in the content block. Reasoning refers to a
/// Chain of Thought (CoT) that the model generates to enhance the accuracy of
/// its final response.
class ReasoningContentBlock {
  /// The reasoning that the model used to return the output.
  final ReasoningTextBlock? reasoningText;

  /// The content in the reasoning that was encrypted by the model provider for
  /// safety reasons. The encryption doesn't affect the quality of responses.
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

/// A content block that contains both generated text and associated citation
/// information. This block type is returned when document citations are
/// enabled, providing traceability between the generated content and the source
/// documents that informed the response.
class CitationsContentBlock {
  /// An array of citations that reference the source documents used to generate
  /// the associated content.
  final List<Citation>? citations;

  /// The generated content that is supported by the associated citations.
  final List<CitationGeneratedContent>? content;

  CitationsContentBlock({
    this.citations,
    this.content,
  });

  factory CitationsContentBlock.fromJson(Map<String, dynamic> json) {
    return CitationsContentBlock(
      citations: (json['citations'] as List?)
          ?.nonNulls
          .map((e) => Citation.fromJson(e as Map<String, dynamic>))
          .toList(),
      content: (json['content'] as List?)
          ?.nonNulls
          .map((e) =>
              CitationGeneratedContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final citations = this.citations;
    final content = this.content;
    return {
      if (citations != null) 'citations': citations,
      if (content != null) 'content': content,
    };
  }
}

/// A search result block that enables natural citations with proper source
/// attribution for retrieved content.
/// <note>
/// This field is only supported by Anthropic Claude Opus 4.1, Opus 4, Sonnet
/// 4.5, Sonnet 4, Sonnet 3.7, and 3.5 Haiku models.
/// </note>
class SearchResultBlock {
  /// An array of search result content block.
  final List<SearchResultContentBlock> content;

  /// The source URL or identifier for the content.
  final String source;

  /// A descriptive title for the search result.
  final String title;

  /// Configuration setting for citations
  final CitationsConfig? citations;

  SearchResultBlock({
    required this.content,
    required this.source,
    required this.title,
    this.citations,
  });

  factory SearchResultBlock.fromJson(Map<String, dynamic> json) {
    return SearchResultBlock(
      content: ((json['content'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              SearchResultContentBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      source: (json['source'] as String?) ?? '',
      title: (json['title'] as String?) ?? '',
      citations: json['citations'] != null
          ? CitationsConfig.fromJson(json['citations'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final source = this.source;
    final title = this.title;
    final citations = this.citations;
    return {
      'content': content,
      'source': source,
      'title': title,
      if (citations != null) 'citations': citations,
    };
  }
}

/// Configuration settings for enabling and controlling document citations in
/// Converse API responses. When enabled, the model can include citation
/// information that links generated content back to specific source documents.
class CitationsConfig {
  /// Specifies whether citations from the selected document should be used in the
  /// model's response. When set to true, the model can generate citations that
  /// reference the source documents used to inform the response.
  final bool enabled;

  CitationsConfig({
    required this.enabled,
  });

  factory CitationsConfig.fromJson(Map<String, dynamic> json) {
    return CitationsConfig(
      enabled: (json['enabled'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      'enabled': enabled,
    };
  }
}

/// A block within a search result that contains the content.
class SearchResultContentBlock {
  /// The actual text content
  final String text;

  SearchResultContentBlock({
    required this.text,
  });

  factory SearchResultContentBlock.fromJson(Map<String, dynamic> json) {
    return SearchResultContentBlock(
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

/// Contains information about a citation that references a specific source
/// document. Citations provide traceability between the model's generated
/// response and the source documents that informed that response.
class Citation {
  /// The precise location within the source document where the cited content can
  /// be found, including character positions, page numbers, or chunk identifiers.
  final CitationLocation? location;

  /// The source from the original search result that provided the cited content.
  final String? source;

  /// The specific content from the source document that was referenced or cited
  /// in the generated response.
  final List<CitationSourceContent>? sourceContent;

  /// The title or identifier of the source document being cited.
  final String? title;

  Citation({
    this.location,
    this.source,
    this.sourceContent,
    this.title,
  });

  factory Citation.fromJson(Map<String, dynamic> json) {
    return Citation(
      location: json['location'] != null
          ? CitationLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      source: json['source'] as String?,
      sourceContent: (json['sourceContent'] as List?)
          ?.nonNulls
          .map((e) => CitationSourceContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    final source = this.source;
    final sourceContent = this.sourceContent;
    final title = this.title;
    return {
      if (location != null) 'location': location,
      if (source != null) 'source': source,
      if (sourceContent != null) 'sourceContent': sourceContent,
      if (title != null) 'title': title,
    };
  }
}

/// Specifies the precise location within a source document where cited content
/// can be found. This can include character-level positions, page numbers, or
/// document chunks depending on the document type and indexing method.
class CitationLocation {
  /// The character-level location within the document where the cited content is
  /// found.
  final DocumentCharLocation? documentChar;

  /// The chunk-level location within the document where the cited content is
  /// found, typically used for documents that have been segmented into logical
  /// chunks.
  final DocumentChunkLocation? documentChunk;

  /// The page-level location within the document where the cited content is
  /// found.
  final DocumentPageLocation? documentPage;

  /// The search result location where the cited content is found, including the
  /// search result index and block positions within the content array.
  final SearchResultLocation? searchResultLocation;

  /// The web URL that was cited for this reference.
  final WebLocation? web;

  CitationLocation({
    this.documentChar,
    this.documentChunk,
    this.documentPage,
    this.searchResultLocation,
    this.web,
  });

  factory CitationLocation.fromJson(Map<String, dynamic> json) {
    return CitationLocation(
      documentChar: json['documentChar'] != null
          ? DocumentCharLocation.fromJson(
              json['documentChar'] as Map<String, dynamic>)
          : null,
      documentChunk: json['documentChunk'] != null
          ? DocumentChunkLocation.fromJson(
              json['documentChunk'] as Map<String, dynamic>)
          : null,
      documentPage: json['documentPage'] != null
          ? DocumentPageLocation.fromJson(
              json['documentPage'] as Map<String, dynamic>)
          : null,
      searchResultLocation: json['searchResultLocation'] != null
          ? SearchResultLocation.fromJson(
              json['searchResultLocation'] as Map<String, dynamic>)
          : null,
      web: json['web'] != null
          ? WebLocation.fromJson(json['web'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final documentChar = this.documentChar;
    final documentChunk = this.documentChunk;
    final documentPage = this.documentPage;
    final searchResultLocation = this.searchResultLocation;
    final web = this.web;
    return {
      if (documentChar != null) 'documentChar': documentChar,
      if (documentChunk != null) 'documentChunk': documentChunk,
      if (documentPage != null) 'documentPage': documentPage,
      if (searchResultLocation != null)
        'searchResultLocation': searchResultLocation,
      if (web != null) 'web': web,
    };
  }
}

/// Provides the URL and domain information for the website that was cited when
/// performing a web search.
class WebLocation {
  /// The domain that was cited when performing a web search.
  final String? domain;

  /// The URL that was cited when performing a web search.
  final String? url;

  WebLocation({
    this.domain,
    this.url,
  });

  factory WebLocation.fromJson(Map<String, dynamic> json) {
    return WebLocation(
      domain: json['domain'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    final url = this.url;
    return {
      if (domain != null) 'domain': domain,
      if (url != null) 'url': url,
    };
  }
}

/// Specifies a character-level location within a document, providing precise
/// positioning information for cited content using start and end character
/// indices.
class DocumentCharLocation {
  /// The index of the document within the array of documents provided in the
  /// request.
  final int? documentIndex;

  /// The ending character position of the cited content within the document.
  final int? end;

  /// The starting character position of the cited content within the document.
  final int? start;

  DocumentCharLocation({
    this.documentIndex,
    this.end,
    this.start,
  });

  factory DocumentCharLocation.fromJson(Map<String, dynamic> json) {
    return DocumentCharLocation(
      documentIndex: json['documentIndex'] as int?,
      end: json['end'] as int?,
      start: json['start'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentIndex = this.documentIndex;
    final end = this.end;
    final start = this.start;
    return {
      if (documentIndex != null) 'documentIndex': documentIndex,
      if (end != null) 'end': end,
      if (start != null) 'start': start,
    };
  }
}

/// Specifies a page-level location within a document, providing positioning
/// information for cited content using page numbers.
class DocumentPageLocation {
  /// The index of the document within the array of documents provided in the
  /// request.
  final int? documentIndex;

  /// The ending page number of the cited content within the document.
  final int? end;

  /// The starting page number of the cited content within the document.
  final int? start;

  DocumentPageLocation({
    this.documentIndex,
    this.end,
    this.start,
  });

  factory DocumentPageLocation.fromJson(Map<String, dynamic> json) {
    return DocumentPageLocation(
      documentIndex: json['documentIndex'] as int?,
      end: json['end'] as int?,
      start: json['start'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentIndex = this.documentIndex;
    final end = this.end;
    final start = this.start;
    return {
      if (documentIndex != null) 'documentIndex': documentIndex,
      if (end != null) 'end': end,
      if (start != null) 'start': start,
    };
  }
}

/// Specifies a chunk-level location within a document, providing positioning
/// information for cited content using logical document segments or chunks.
class DocumentChunkLocation {
  /// The index of the document within the array of documents provided in the
  /// request.
  final int? documentIndex;

  /// The ending chunk identifier or index of the cited content within the
  /// document.
  final int? end;

  /// The starting chunk identifier or index of the cited content within the
  /// document.
  final int? start;

  DocumentChunkLocation({
    this.documentIndex,
    this.end,
    this.start,
  });

  factory DocumentChunkLocation.fromJson(Map<String, dynamic> json) {
    return DocumentChunkLocation(
      documentIndex: json['documentIndex'] as int?,
      end: json['end'] as int?,
      start: json['start'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentIndex = this.documentIndex;
    final end = this.end;
    final start = this.start;
    return {
      if (documentIndex != null) 'documentIndex': documentIndex,
      if (end != null) 'end': end,
      if (start != null) 'start': start,
    };
  }
}

/// Specifies a search result location within the content array, providing
/// positioning information for cited content using search result index and
/// block positions.
class SearchResultLocation {
  /// The ending position in the content array where the cited content ends.
  final int? end;

  /// The index of the search result content block where the cited content is
  /// found.
  final int? searchResultIndex;

  /// The starting position in the content array where the cited content begins.
  final int? start;

  SearchResultLocation({
    this.end,
    this.searchResultIndex,
    this.start,
  });

  factory SearchResultLocation.fromJson(Map<String, dynamic> json) {
    return SearchResultLocation(
      end: json['end'] as int?,
      searchResultIndex: json['searchResultIndex'] as int?,
      start: json['start'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final end = this.end;
    final searchResultIndex = this.searchResultIndex;
    final start = this.start;
    return {
      if (end != null) 'end': end,
      if (searchResultIndex != null) 'searchResultIndex': searchResultIndex,
      if (start != null) 'start': start,
    };
  }
}

/// Contains the actual text content from a source document that is being cited
/// or referenced in the model's response.
class CitationSourceContent {
  /// The text content from the source document that is being cited.
  final String? text;

  CitationSourceContent({
    this.text,
  });

  factory CitationSourceContent.fromJson(Map<String, dynamic> json) {
    return CitationSourceContent(
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

/// Contains the generated text content that corresponds to or is supported by a
/// citation from a source document.
class CitationGeneratedContent {
  /// The text content that was generated by the model and is supported by the
  /// associated citation.
  final String? text;

  CitationGeneratedContent({
    this.text,
  });

  factory CitationGeneratedContent.fromJson(Map<String, dynamic> json) {
    return CitationGeneratedContent(
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

/// Contains the reasoning that the model used to return the output.
class ReasoningTextBlock {
  /// The reasoning that the model used to return the output.
  final String text;

  /// A token that verifies that the reasoning text was generated by the model. If
  /// you pass a reasoning block back to the API in a multi-turn conversation,
  /// include the text and its signature unmodified.
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

class ToolResultStatus {
  static const success = ToolResultStatus._('success');
  static const error = ToolResultStatus._('error');

  final String value;

  const ToolResultStatus._(this.value);

  static const values = [success, error];

  static ToolResultStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ToolResultStatus._(value));

  @override
  bool operator ==(other) => other is ToolResultStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The tool result content block. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Call
/// a tool with the Converse API</a> in the Amazon Bedrock User Guide.
class ToolResultContentBlock {
  /// A tool result that is a document.
  final DocumentBlock? document;

  /// A tool result that is an image.
  /// <note>
  /// This field is only supported by Amazon Nova and Anthropic Claude 3 and 4
  /// models.
  /// </note>
  final ImageBlock? image;

  /// A tool result that is JSON format data.
  final Document? json;

  /// A tool result that is a search result.
  final SearchResultBlock? searchResult;

  /// A tool result that is text.
  final String? text;

  /// A tool result that is video.
  final VideoBlock? video;

  ToolResultContentBlock({
    this.document,
    this.image,
    this.json,
    this.searchResult,
    this.text,
    this.video,
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
      searchResult: json['searchResult'] != null
          ? SearchResultBlock.fromJson(
              json['searchResult'] as Map<String, dynamic>)
          : null,
      text: json['text'] as String?,
      video: json['video'] != null
          ? VideoBlock.fromJson(json['video'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final document = this.document;
    final image = this.image;
    final json = this.json;
    final searchResult = this.searchResult;
    final text = this.text;
    final video = this.video;
    return {
      if (document != null) 'document': document,
      if (image != null) 'image': image,
      if (json != null) 'json': json,
      if (searchResult != null) 'searchResult': searchResult,
      if (text != null) 'text': text,
      if (video != null) 'video': video,
    };
  }
}

class ToolUseType {
  static const serverToolUse = ToolUseType._('server_tool_use');

  final String value;

  const ToolUseType._(this.value);

  static const values = [serverToolUse];

  static ToolUseType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ToolUseType._(value));

  @override
  bool operator ==(other) => other is ToolUseType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AudioFormat {
  static const mp3 = AudioFormat._('mp3');
  static const opus = AudioFormat._('opus');
  static const wav = AudioFormat._('wav');
  static const aac = AudioFormat._('aac');
  static const flac = AudioFormat._('flac');
  static const mp4 = AudioFormat._('mp4');
  static const ogg = AudioFormat._('ogg');
  static const mkv = AudioFormat._('mkv');
  static const mka = AudioFormat._('mka');
  static const xAac = AudioFormat._('x-aac');
  static const m4a = AudioFormat._('m4a');
  static const mpeg = AudioFormat._('mpeg');
  static const mpga = AudioFormat._('mpga');
  static const pcm = AudioFormat._('pcm');
  static const webm = AudioFormat._('webm');

  final String value;

  const AudioFormat._(this.value);

  static const values = [
    mp3,
    opus,
    wav,
    aac,
    flac,
    mp4,
    ogg,
    mkv,
    mka,
    xAac,
    m4a,
    mpeg,
    mpga,
    pcm,
    webm
  ];

  static AudioFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AudioFormat._(value));

  @override
  bool operator ==(other) => other is AudioFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The source of audio data, which can be provided either as raw bytes or a
/// reference to an S3 location.
class AudioSource {
  /// Audio data encoded in base64.
  final Uint8List? bytes;

  /// A reference to audio data stored in an Amazon S3 bucket. To see which models
  /// support S3 uploads, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/conversation-inference-supported-models-features.html">Supported
  /// models and features for Converse</a>.
  final S3Location? s3Location;

  AudioSource({
    this.bytes,
    this.s3Location,
  });

  factory AudioSource.fromJson(Map<String, dynamic> json) {
    return AudioSource(
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

/// A block containing error information when content processing fails.
class ErrorBlock {
  /// A human-readable error message describing what went wrong during content
  /// processing.
  final String? message;

  ErrorBlock({
    this.message,
  });

  factory ErrorBlock.fromJson(Map<String, dynamic> json) {
    return ErrorBlock(
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

/// A storage location in an Amazon S3 bucket.
class S3Location {
  /// An object URI starting with <code>s3://</code>.
  final String uri;

  /// If the bucket belongs to another AWS account, specify that account's ID.
  final String? bucketOwner;

  S3Location({
    required this.uri,
    this.bucketOwner,
  });

  factory S3Location.fromJson(Map<String, dynamic> json) {
    return S3Location(
      uri: (json['uri'] as String?) ?? '',
      bucketOwner: json['bucketOwner'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    final bucketOwner = this.bucketOwner;
    return {
      'uri': uri,
      if (bucketOwner != null) 'bucketOwner': bucketOwner,
    };
  }
}

class VideoFormat {
  static const mkv = VideoFormat._('mkv');
  static const mov = VideoFormat._('mov');
  static const mp4 = VideoFormat._('mp4');
  static const webm = VideoFormat._('webm');
  static const flv = VideoFormat._('flv');
  static const mpeg = VideoFormat._('mpeg');
  static const mpg = VideoFormat._('mpg');
  static const wmv = VideoFormat._('wmv');
  static const threeGp = VideoFormat._('three_gp');

  final String value;

  const VideoFormat._(this.value);

  static const values = [mkv, mov, mp4, webm, flv, mpeg, mpg, wmv, threeGp];

  static VideoFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => VideoFormat._(value));

  @override
  bool operator ==(other) => other is VideoFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A video source. You can upload a smaller video as a base64-encoded string as
/// long as the encoded file is less than 25MB. You can also transfer videos up
/// to 1GB in size from an S3 bucket.
class VideoSource {
  /// Video content encoded in base64.
  final Uint8List? bytes;

  /// The location of a video object in an Amazon S3 bucket. To see which models
  /// support S3 uploads, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/conversation-inference-supported-models-features.html">Supported
  /// models and features for Converse</a>.
  final S3Location? s3Location;

  VideoSource({
    this.bytes,
    this.s3Location,
  });

  factory VideoSource.fromJson(Map<String, dynamic> json) {
    return VideoSource(
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

class DocumentFormat {
  static const pdf = DocumentFormat._('pdf');
  static const csv = DocumentFormat._('csv');
  static const doc = DocumentFormat._('doc');
  static const docx = DocumentFormat._('docx');
  static const xls = DocumentFormat._('xls');
  static const xlsx = DocumentFormat._('xlsx');
  static const html = DocumentFormat._('html');
  static const txt = DocumentFormat._('txt');
  static const md = DocumentFormat._('md');

  final String value;

  const DocumentFormat._(this.value);

  static const values = [pdf, csv, doc, docx, xls, xlsx, html, txt, md];

  static DocumentFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DocumentFormat._(value));

  @override
  bool operator ==(other) => other is DocumentFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the content of a document.
class DocumentSource {
  /// The raw bytes for the document. If you use an Amazon Web Services SDK, you
  /// don't need to encode the bytes in base64.
  final Uint8List? bytes;

  /// The structured content of the document source, which may include various
  /// content blocks such as text, images, or other document elements.
  final List<DocumentContentBlock>? content;

  /// The location of a document object in an Amazon S3 bucket. To see which
  /// models support S3 uploads, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/conversation-inference-supported-models-features.html">Supported
  /// models and features for Converse</a>.
  final S3Location? s3Location;

  /// The text content of the document source.
  final String? text;

  DocumentSource({
    this.bytes,
    this.content,
    this.s3Location,
    this.text,
  });

  factory DocumentSource.fromJson(Map<String, dynamic> json) {
    return DocumentSource(
      bytes: _s.decodeNullableUint8List(json['bytes'] as String?),
      content: (json['content'] as List?)
          ?.nonNulls
          .map((e) => DocumentContentBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      s3Location: json['s3Location'] != null
          ? S3Location.fromJson(json['s3Location'] as Map<String, dynamic>)
          : null,
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bytes = this.bytes;
    final content = this.content;
    final s3Location = this.s3Location;
    final text = this.text;
    return {
      if (bytes != null) 'bytes': base64Encode(bytes),
      if (content != null) 'content': content,
      if (s3Location != null) 's3Location': s3Location,
      if (text != null) 'text': text,
    };
  }
}

/// Contains the actual content of a document that can be processed by the model
/// and potentially cited in the response.
class DocumentContentBlock {
  /// The text content of the document.
  final String? text;

  DocumentContentBlock({
    this.text,
  });

  factory DocumentContentBlock.fromJson(Map<String, dynamic> json) {
    return DocumentContentBlock(
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
  /// The raw image bytes for the image. If you use an AWS SDK, you don't need to
  /// encode the image bytes in base64.
  final Uint8List? bytes;

  /// The location of an image object in an Amazon S3 bucket. To see which models
  /// support S3 uploads, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/conversation-inference-supported-models-features.html">Supported
  /// models and features for Converse</a>.
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

  /// The service isn't available. Try again later.
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

class ServiceTierType {
  static const priority = ServiceTierType._('priority');
  static const $default = ServiceTierType._('default');
  static const flex = ServiceTierType._('flex');
  static const reserved = ServiceTierType._('reserved');

  final String value;

  const ServiceTierType._(this.value);

  static const values = [priority, $default, flex, reserved];

  static ServiceTierType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ServiceTierType._(value));

  @override
  bool operator ==(other) => other is ServiceTierType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

class Trace {
  static const enabled = Trace._('ENABLED');
  static const disabled = Trace._('DISABLED');
  static const enabledFull = Trace._('ENABLED_FULL');

  final String value;

  const Trace._(this.value);

  static const values = [enabled, disabled, enabledFull];

  static Trace fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Trace._(value));

  @override
  bool operator ==(other) => other is Trace && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Output from the bidirectional stream that was used for model invocation.
class InvokeModelWithBidirectionalStreamOutput {
  /// The speech chunk that was provided as output from the invocation step.
  final BidirectionalOutputPayloadPart? chunk;

  /// The request encountered an unknown internal error.
  final InternalServerException? internalServerException;

  /// The request encountered an error with the model stream.
  final ModelStreamErrorException? modelStreamErrorException;

  /// The connection was closed because a request was not received within the
  /// timeout period.
  final ModelTimeoutException? modelTimeoutException;

  /// The request has failed due to a temporary failure of the server.
  final ServiceUnavailableException? serviceUnavailableException;

  /// The request was denied due to request throttling.
  final ThrottlingException? throttlingException;

  /// The input fails to satisfy the constraints specified by an Amazon Web
  /// Services service.
  final ValidationException? validationException;

  InvokeModelWithBidirectionalStreamOutput({
    this.chunk,
    this.internalServerException,
    this.modelStreamErrorException,
    this.modelTimeoutException,
    this.serviceUnavailableException,
    this.throttlingException,
    this.validationException,
  });

  factory InvokeModelWithBidirectionalStreamOutput.fromJson(
      Map<String, dynamic> json) {
    return InvokeModelWithBidirectionalStreamOutput(
      chunk: json['chunk'] != null
          ? BidirectionalOutputPayloadPart.fromJson(
              json['chunk'] as Map<String, dynamic>)
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

/// Output from the bidirectional stream. The output is speech and a text
/// transcription.
class BidirectionalOutputPayloadPart {
  /// The speech output of the bidirectional stream.
  final Uint8List? bytes;

  BidirectionalOutputPayloadPart({
    this.bytes,
  });

  factory BidirectionalOutputPayloadPart.fromJson(Map<String, dynamic> json) {
    return BidirectionalOutputPayloadPart(
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

/// Payload content, the speech chunk, for the bidirectional input of the
/// invocation step.
class InvokeModelWithBidirectionalStreamInput {
  /// The audio chunk that is used as input for the invocation step.
  final BidirectionalInputPayloadPart? chunk;

  InvokeModelWithBidirectionalStreamInput({
    this.chunk,
  });

  Map<String, dynamic> toJson() {
    final chunk = this.chunk;
    return {
      if (chunk != null) 'chunk': chunk,
    };
  }
}

/// Payload content for the bidirectional input. The input is an audio stream.
class BidirectionalInputPayloadPart {
  /// The audio content for the bidirectional input.
  final Uint8List? bytes;

  BidirectionalInputPayloadPart({
    this.bytes,
  });

  Map<String, dynamic> toJson() {
    final bytes = this.bytes;
    return {
      if (bytes != null) 'bytes': base64Encode(bytes),
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

  /// The service isn't currently available. For troubleshooting this error, see
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/troubleshooting-api-error-codes.html#ts-service-unavailable">ServiceUnavailable</a>
  /// in the Amazon Bedrock User Guide
  final ServiceUnavailableException? serviceUnavailableException;

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

/// The start of a message.
class MessageStartEvent {
  /// The role for the message.
  final ConversationRole role;

  MessageStartEvent({
    required this.role,
  });

  factory MessageStartEvent.fromJson(Map<String, dynamic> json) {
    return MessageStartEvent(
      role: ConversationRole.fromString((json['role'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final role = this.role;
    return {
      'role': role.value,
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
      contentBlockIndex: (json['contentBlockIndex'] as int?) ?? 0,
      start: ContentBlockStart.fromJson(
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
      contentBlockIndex: (json['contentBlockIndex'] as int?) ?? 0,
      delta: ContentBlockDelta.fromJson(
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

/// A content block stop event.
class ContentBlockStopEvent {
  /// The index for a content block.
  final int contentBlockIndex;

  ContentBlockStopEvent({
    required this.contentBlockIndex,
  });

  factory ContentBlockStopEvent.fromJson(Map<String, dynamic> json) {
    return ContentBlockStopEvent(
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
      stopReason: StopReason.fromString((json['stopReason'] as String?) ?? ''),
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

/// A conversation stream metadata event.
class ConverseStreamMetadataEvent {
  /// The metrics for the conversation stream metadata event.
  final ConverseStreamMetrics metrics;

  /// Usage information for the conversation stream event.
  final TokenUsage usage;

  /// Model performance configuration metadata for the conversation stream event.
  final PerformanceConfiguration? performanceConfig;

  /// Specifies the processing tier configuration used for serving the request.
  final ServiceTier? serviceTier;

  /// The trace object in the response from <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_ConverseStream.html">ConverseStream</a>
  /// that contains information about the guardrail behavior.
  final ConverseStreamTrace? trace;

  ConverseStreamMetadataEvent({
    required this.metrics,
    required this.usage,
    this.performanceConfig,
    this.serviceTier,
    this.trace,
  });

  factory ConverseStreamMetadataEvent.fromJson(Map<String, dynamic> json) {
    return ConverseStreamMetadataEvent(
      metrics: ConverseStreamMetrics.fromJson(
          (json['metrics'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      usage: TokenUsage.fromJson((json['usage'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      performanceConfig: json['performanceConfig'] != null
          ? PerformanceConfiguration.fromJson(
              json['performanceConfig'] as Map<String, dynamic>)
          : null,
      serviceTier: json['serviceTier'] != null
          ? ServiceTier.fromJson(json['serviceTier'] as Map<String, dynamic>)
          : null,
      trace: json['trace'] != null
          ? ConverseStreamTrace.fromJson(json['trace'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metrics = this.metrics;
    final usage = this.usage;
    final performanceConfig = this.performanceConfig;
    final serviceTier = this.serviceTier;
    final trace = this.trace;
    return {
      'metrics': metrics,
      'usage': usage,
      if (performanceConfig != null) 'performanceConfig': performanceConfig,
      if (serviceTier != null) 'serviceTier': serviceTier,
      if (trace != null) 'trace': trace,
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

  /// Detailed breakdown of cache writes by TTL. Empty if no cache creation
  /// occurred. Sorted by TTL duration (1h before 5m).
  final List<CacheDetail>? cacheDetails;

  /// The number of input tokens read from the cache for the request.
  final int? cacheReadInputTokens;

  /// The number of input tokens written to the cache for the request.
  final int? cacheWriteInputTokens;

  TokenUsage({
    required this.inputTokens,
    required this.outputTokens,
    required this.totalTokens,
    this.cacheDetails,
    this.cacheReadInputTokens,
    this.cacheWriteInputTokens,
  });

  factory TokenUsage.fromJson(Map<String, dynamic> json) {
    return TokenUsage(
      inputTokens: (json['inputTokens'] as int?) ?? 0,
      outputTokens: (json['outputTokens'] as int?) ?? 0,
      totalTokens: (json['totalTokens'] as int?) ?? 0,
      cacheDetails: (json['cacheDetails'] as List?)
          ?.nonNulls
          .map((e) => CacheDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      cacheReadInputTokens: json['cacheReadInputTokens'] as int?,
      cacheWriteInputTokens: json['cacheWriteInputTokens'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputTokens = this.inputTokens;
    final outputTokens = this.outputTokens;
    final totalTokens = this.totalTokens;
    final cacheDetails = this.cacheDetails;
    final cacheReadInputTokens = this.cacheReadInputTokens;
    final cacheWriteInputTokens = this.cacheWriteInputTokens;
    return {
      'inputTokens': inputTokens,
      'outputTokens': outputTokens,
      'totalTokens': totalTokens,
      if (cacheDetails != null) 'cacheDetails': cacheDetails,
      if (cacheReadInputTokens != null)
        'cacheReadInputTokens': cacheReadInputTokens,
      if (cacheWriteInputTokens != null)
        'cacheWriteInputTokens': cacheWriteInputTokens,
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

/// The trace object in a response from <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_ConverseStream.html">ConverseStream</a>.
class ConverseStreamTrace {
  /// The guardrail trace object.
  final GuardrailTraceAssessment? guardrail;

  /// The request's prompt router.
  final PromptRouterTrace? promptRouter;

  ConverseStreamTrace({
    this.guardrail,
    this.promptRouter,
  });

  factory ConverseStreamTrace.fromJson(Map<String, dynamic> json) {
    return ConverseStreamTrace(
      guardrail: json['guardrail'] != null
          ? GuardrailTraceAssessment.fromJson(
              json['guardrail'] as Map<String, dynamic>)
          : null,
      promptRouter: json['promptRouter'] != null
          ? PromptRouterTrace.fromJson(
              json['promptRouter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final guardrail = this.guardrail;
    final promptRouter = this.promptRouter;
    return {
      if (guardrail != null) 'guardrail': guardrail,
      if (promptRouter != null) 'promptRouter': promptRouter,
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

/// Specifies the processing tier configuration used for serving the request.
class ServiceTier {
  /// Specifies the processing tier type used for serving the request.
  final ServiceTierType type;

  ServiceTier({
    required this.type,
  });

  factory ServiceTier.fromJson(Map<String, dynamic> json) {
    return ServiceTier(
      type: ServiceTierType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'type': type.value,
    };
  }
}

/// A Top level guardrail trace object. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_ConverseTrace.html">ConverseTrace</a>.
class GuardrailTraceAssessment {
  /// Provides the reason for the action taken when harmful content is detected.
  final String? actionReason;

  /// The input assessment.
  final Map<String, GuardrailAssessment>? inputAssessment;

  /// The output from the model.
  final List<String>? modelOutput;

  /// the output assessments.
  final Map<String, List<GuardrailAssessment>>? outputAssessments;

  GuardrailTraceAssessment({
    this.actionReason,
    this.inputAssessment,
    this.modelOutput,
    this.outputAssessments,
  });

  factory GuardrailTraceAssessment.fromJson(Map<String, dynamic> json) {
    return GuardrailTraceAssessment(
      actionReason: json['actionReason'] as String?,
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
    final actionReason = this.actionReason;
    final inputAssessment = this.inputAssessment;
    final modelOutput = this.modelOutput;
    final outputAssessments = this.outputAssessments;
    return {
      if (actionReason != null) 'actionReason': actionReason,
      if (inputAssessment != null) 'inputAssessment': inputAssessment,
      if (modelOutput != null) 'modelOutput': modelOutput,
      if (outputAssessments != null) 'outputAssessments': outputAssessments,
    };
  }
}

/// A prompt router trace.
class PromptRouterTrace {
  /// The ID of the invoked model.
  final String? invokedModelId;

  PromptRouterTrace({
    this.invokedModelId,
  });

  factory PromptRouterTrace.fromJson(Map<String, dynamic> json) {
    return PromptRouterTrace(
      invokedModelId: json['invokedModelId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final invokedModelId = this.invokedModelId;
    return {
      if (invokedModelId != null) 'invokedModelId': invokedModelId,
    };
  }
}

/// A behavior assessment of the guardrail policies used in a call to the
/// Converse API.
class GuardrailAssessment {
  final AppliedGuardrailDetails? appliedGuardrailDetails;

  /// The automated reasoning policy assessment results, including logical
  /// validation findings for the input content.
  final GuardrailAutomatedReasoningPolicyAssessment? automatedReasoningPolicy;

  /// The content policy.
  final GuardrailContentPolicyAssessment? contentPolicy;

  /// The contextual grounding policy used for the guardrail assessment.
  final GuardrailContextualGroundingPolicyAssessment? contextualGroundingPolicy;

  /// The invocation metrics for the guardrail assessment.
  final GuardrailInvocationMetrics? invocationMetrics;

  /// The sensitive information policy.
  final GuardrailSensitiveInformationPolicyAssessment?
      sensitiveInformationPolicy;

  /// The topic policy.
  final GuardrailTopicPolicyAssessment? topicPolicy;

  /// The word policy.
  final GuardrailWordPolicyAssessment? wordPolicy;

  GuardrailAssessment({
    this.appliedGuardrailDetails,
    this.automatedReasoningPolicy,
    this.contentPolicy,
    this.contextualGroundingPolicy,
    this.invocationMetrics,
    this.sensitiveInformationPolicy,
    this.topicPolicy,
    this.wordPolicy,
  });

  factory GuardrailAssessment.fromJson(Map<String, dynamic> json) {
    return GuardrailAssessment(
      appliedGuardrailDetails: json['appliedGuardrailDetails'] != null
          ? AppliedGuardrailDetails.fromJson(
              json['appliedGuardrailDetails'] as Map<String, dynamic>)
          : null,
      automatedReasoningPolicy: json['automatedReasoningPolicy'] != null
          ? GuardrailAutomatedReasoningPolicyAssessment.fromJson(
              json['automatedReasoningPolicy'] as Map<String, dynamic>)
          : null,
      contentPolicy: json['contentPolicy'] != null
          ? GuardrailContentPolicyAssessment.fromJson(
              json['contentPolicy'] as Map<String, dynamic>)
          : null,
      contextualGroundingPolicy: json['contextualGroundingPolicy'] != null
          ? GuardrailContextualGroundingPolicyAssessment.fromJson(
              json['contextualGroundingPolicy'] as Map<String, dynamic>)
          : null,
      invocationMetrics: json['invocationMetrics'] != null
          ? GuardrailInvocationMetrics.fromJson(
              json['invocationMetrics'] as Map<String, dynamic>)
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
    final appliedGuardrailDetails = this.appliedGuardrailDetails;
    final automatedReasoningPolicy = this.automatedReasoningPolicy;
    final contentPolicy = this.contentPolicy;
    final contextualGroundingPolicy = this.contextualGroundingPolicy;
    final invocationMetrics = this.invocationMetrics;
    final sensitiveInformationPolicy = this.sensitiveInformationPolicy;
    final topicPolicy = this.topicPolicy;
    final wordPolicy = this.wordPolicy;
    return {
      if (appliedGuardrailDetails != null)
        'appliedGuardrailDetails': appliedGuardrailDetails,
      if (automatedReasoningPolicy != null)
        'automatedReasoningPolicy': automatedReasoningPolicy,
      if (contentPolicy != null) 'contentPolicy': contentPolicy,
      if (contextualGroundingPolicy != null)
        'contextualGroundingPolicy': contextualGroundingPolicy,
      if (invocationMetrics != null) 'invocationMetrics': invocationMetrics,
      if (sensitiveInformationPolicy != null)
        'sensitiveInformationPolicy': sensitiveInformationPolicy,
      if (topicPolicy != null) 'topicPolicy': topicPolicy,
      if (wordPolicy != null) 'wordPolicy': wordPolicy,
    };
  }
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
      topics: ((json['topics'] as List?) ?? const [])
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

/// An assessment of a content policy for a guardrail.
class GuardrailContentPolicyAssessment {
  /// The content policy filters.
  final List<GuardrailContentFilter> filters;

  GuardrailContentPolicyAssessment({
    required this.filters,
  });

  factory GuardrailContentPolicyAssessment.fromJson(Map<String, dynamic> json) {
    return GuardrailContentPolicyAssessment(
      filters: ((json['filters'] as List?) ?? const [])
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
      customWords: ((json['customWords'] as List?) ?? const [])
          .nonNulls
          .map((e) => GuardrailCustomWord.fromJson(e as Map<String, dynamic>))
          .toList(),
      managedWordLists: ((json['managedWordLists'] as List?) ?? const [])
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

/// The assessment for a Personally Identifiable Information (PII) policy.
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
      piiEntities: ((json['piiEntities'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              GuardrailPiiEntityFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      regexes: ((json['regexes'] as List?) ?? const [])
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

/// Contains the results of automated reasoning policy evaluation, including
/// logical findings about the validity of claims made in the input content.
class GuardrailAutomatedReasoningPolicyAssessment {
  /// List of logical validation results produced by evaluating the input content
  /// against automated reasoning policies.
  final List<GuardrailAutomatedReasoningFinding>? findings;

  GuardrailAutomatedReasoningPolicyAssessment({
    this.findings,
  });

  factory GuardrailAutomatedReasoningPolicyAssessment.fromJson(
      Map<String, dynamic> json) {
    return GuardrailAutomatedReasoningPolicyAssessment(
      findings: (json['findings'] as List?)
          ?.nonNulls
          .map((e) => GuardrailAutomatedReasoningFinding.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final findings = this.findings;
    return {
      if (findings != null) 'findings': findings,
    };
  }
}

/// The invocation metrics for the guardrail.
class GuardrailInvocationMetrics {
  /// The coverage details for the guardrail invocation metrics.
  final GuardrailCoverage? guardrailCoverage;

  /// The processing latency details for the guardrail invocation metrics.
  final int? guardrailProcessingLatency;

  /// The usage details for the guardrail invocation metrics.
  final GuardrailUsage? usage;

  GuardrailInvocationMetrics({
    this.guardrailCoverage,
    this.guardrailProcessingLatency,
    this.usage,
  });

  factory GuardrailInvocationMetrics.fromJson(Map<String, dynamic> json) {
    return GuardrailInvocationMetrics(
      guardrailCoverage: json['guardrailCoverage'] != null
          ? GuardrailCoverage.fromJson(
              json['guardrailCoverage'] as Map<String, dynamic>)
          : null,
      guardrailProcessingLatency: json['guardrailProcessingLatency'] as int?,
      usage: json['usage'] != null
          ? GuardrailUsage.fromJson(json['usage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final guardrailCoverage = this.guardrailCoverage;
    final guardrailProcessingLatency = this.guardrailProcessingLatency;
    final usage = this.usage;
    return {
      if (guardrailCoverage != null) 'guardrailCoverage': guardrailCoverage,
      if (guardrailProcessingLatency != null)
        'guardrailProcessingLatency': guardrailProcessingLatency,
      if (usage != null) 'usage': usage,
    };
  }
}

/// Details about the specific guardrail that was applied during this
/// assessment, including its identifier, version, ARN, origin, and ownership
/// information.
class AppliedGuardrailDetails {
  /// The ARN of the guardrail that was applied.
  final String? guardrailArn;

  /// The unique ID of the guardrail that was applied.
  final String? guardrailId;

  /// The origin of how the guardrail was applied. This can be either requested at
  /// the API level or enforced at the account or organization level as a default
  /// guardrail.
  final List<GuardrailOrigin>? guardrailOrigin;

  /// The ownership type of the guardrail, indicating whether it is owned by the
  /// requesting account or is a cross-account guardrail shared from another AWS
  /// account.
  final GuardrailOwnership? guardrailOwnership;

  /// The version of the guardrail that was applied.
  final String? guardrailVersion;

  AppliedGuardrailDetails({
    this.guardrailArn,
    this.guardrailId,
    this.guardrailOrigin,
    this.guardrailOwnership,
    this.guardrailVersion,
  });

  factory AppliedGuardrailDetails.fromJson(Map<String, dynamic> json) {
    return AppliedGuardrailDetails(
      guardrailArn: json['guardrailArn'] as String?,
      guardrailId: json['guardrailId'] as String?,
      guardrailOrigin: (json['guardrailOrigin'] as List?)
          ?.nonNulls
          .map((e) => GuardrailOrigin.fromString((e as String)))
          .toList(),
      guardrailOwnership: (json['guardrailOwnership'] as String?)
          ?.let(GuardrailOwnership.fromString),
      guardrailVersion: json['guardrailVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final guardrailArn = this.guardrailArn;
    final guardrailId = this.guardrailId;
    final guardrailOrigin = this.guardrailOrigin;
    final guardrailOwnership = this.guardrailOwnership;
    final guardrailVersion = this.guardrailVersion;
    return {
      if (guardrailArn != null) 'guardrailArn': guardrailArn,
      if (guardrailId != null) 'guardrailId': guardrailId,
      if (guardrailOrigin != null)
        'guardrailOrigin': guardrailOrigin.map((e) => e.value).toList(),
      if (guardrailOwnership != null)
        'guardrailOwnership': guardrailOwnership.value,
      if (guardrailVersion != null) 'guardrailVersion': guardrailVersion,
    };
  }
}

class GuardrailOwnership {
  static const self = GuardrailOwnership._('SELF');
  static const crossAccount = GuardrailOwnership._('CROSS_ACCOUNT');

  final String value;

  const GuardrailOwnership._(this.value);

  static const values = [self, crossAccount];

  static GuardrailOwnership fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailOwnership._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailOwnership && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class GuardrailOrigin {
  static const request = GuardrailOrigin._('REQUEST');
  static const accountEnforced = GuardrailOrigin._('ACCOUNT_ENFORCED');
  static const organizationEnforced =
      GuardrailOrigin._('ORGANIZATION_ENFORCED');

  final String value;

  const GuardrailOrigin._(this.value);

  static const values = [request, accountEnforced, organizationEnforced];

  static GuardrailOrigin fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailOrigin._(value));

  @override
  bool operator ==(other) => other is GuardrailOrigin && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

  /// The number of automated reasoning policies that were processed during the
  /// guardrail evaluation.
  final int? automatedReasoningPolicies;

  /// The number of text units processed by the automated reasoning policy.
  final int? automatedReasoningPolicyUnits;

  /// The content policy image units processed by the guardrail.
  final int? contentPolicyImageUnits;

  GuardrailUsage({
    required this.contentPolicyUnits,
    required this.contextualGroundingPolicyUnits,
    required this.sensitiveInformationPolicyFreeUnits,
    required this.sensitiveInformationPolicyUnits,
    required this.topicPolicyUnits,
    required this.wordPolicyUnits,
    this.automatedReasoningPolicies,
    this.automatedReasoningPolicyUnits,
    this.contentPolicyImageUnits,
  });

  factory GuardrailUsage.fromJson(Map<String, dynamic> json) {
    return GuardrailUsage(
      contentPolicyUnits: (json['contentPolicyUnits'] as int?) ?? 0,
      contextualGroundingPolicyUnits:
          (json['contextualGroundingPolicyUnits'] as int?) ?? 0,
      sensitiveInformationPolicyFreeUnits:
          (json['sensitiveInformationPolicyFreeUnits'] as int?) ?? 0,
      sensitiveInformationPolicyUnits:
          (json['sensitiveInformationPolicyUnits'] as int?) ?? 0,
      topicPolicyUnits: (json['topicPolicyUnits'] as int?) ?? 0,
      wordPolicyUnits: (json['wordPolicyUnits'] as int?) ?? 0,
      automatedReasoningPolicies: json['automatedReasoningPolicies'] as int?,
      automatedReasoningPolicyUnits:
          json['automatedReasoningPolicyUnits'] as int?,
      contentPolicyImageUnits: json['contentPolicyImageUnits'] as int?,
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
    final automatedReasoningPolicies = this.automatedReasoningPolicies;
    final automatedReasoningPolicyUnits = this.automatedReasoningPolicyUnits;
    final contentPolicyImageUnits = this.contentPolicyImageUnits;
    return {
      'contentPolicyUnits': contentPolicyUnits,
      'contextualGroundingPolicyUnits': contextualGroundingPolicyUnits,
      'sensitiveInformationPolicyFreeUnits':
          sensitiveInformationPolicyFreeUnits,
      'sensitiveInformationPolicyUnits': sensitiveInformationPolicyUnits,
      'topicPolicyUnits': topicPolicyUnits,
      'wordPolicyUnits': wordPolicyUnits,
      if (automatedReasoningPolicies != null)
        'automatedReasoningPolicies': automatedReasoningPolicies,
      if (automatedReasoningPolicyUnits != null)
        'automatedReasoningPolicyUnits': automatedReasoningPolicyUnits,
      if (contentPolicyImageUnits != null)
        'contentPolicyImageUnits': contentPolicyImageUnits,
    };
  }
}

/// The action of the guardrail coverage details.
class GuardrailCoverage {
  /// The guardrail coverage for images (the number of images that guardrails
  /// guarded).
  final GuardrailImageCoverage? images;

  /// The text characters of the guardrail coverage details.
  final GuardrailTextCharactersCoverage? textCharacters;

  GuardrailCoverage({
    this.images,
    this.textCharacters,
  });

  factory GuardrailCoverage.fromJson(Map<String, dynamic> json) {
    return GuardrailCoverage(
      images: json['images'] != null
          ? GuardrailImageCoverage.fromJson(
              json['images'] as Map<String, dynamic>)
          : null,
      textCharacters: json['textCharacters'] != null
          ? GuardrailTextCharactersCoverage.fromJson(
              json['textCharacters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final images = this.images;
    final textCharacters = this.textCharacters;
    return {
      if (images != null) 'images': images,
      if (textCharacters != null) 'textCharacters': textCharacters,
    };
  }
}

/// The guardrail coverage for the text characters.
class GuardrailTextCharactersCoverage {
  /// The text characters that were guarded by the guardrail coverage.
  final int? guarded;

  /// The total text characters by the guardrail coverage.
  final int? total;

  GuardrailTextCharactersCoverage({
    this.guarded,
    this.total,
  });

  factory GuardrailTextCharactersCoverage.fromJson(Map<String, dynamic> json) {
    return GuardrailTextCharactersCoverage(
      guarded: json['guarded'] as int?,
      total: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final guarded = this.guarded;
    final total = this.total;
    return {
      if (guarded != null) 'guarded': guarded,
      if (total != null) 'total': total,
    };
  }
}

/// The details of the guardrail image coverage.
class GuardrailImageCoverage {
  /// The count (integer) of images guardrails guarded.
  final int? guarded;

  /// Represents the total number of images (integer) that were in the request
  /// (guarded and unguarded).
  final int? total;

  GuardrailImageCoverage({
    this.guarded,
    this.total,
  });

  factory GuardrailImageCoverage.fromJson(Map<String, dynamic> json) {
    return GuardrailImageCoverage(
      guarded: json['guarded'] as int?,
      total: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final guarded = this.guarded;
    final total = this.total;
    return {
      if (guarded != null) 'guarded': guarded,
      if (total != null) 'total': total,
    };
  }
}

/// Represents a logical validation result from automated reasoning policy
/// evaluation. The finding indicates whether claims in the input are logically
/// valid, invalid, satisfiable, impossible, or have other logical issues.
class GuardrailAutomatedReasoningFinding {
  /// Contains the result when the automated reasoning evaluation determines that
  /// no valid logical conclusions can be drawn due to contradictions in the
  /// premises or policy rules themselves.
  final GuardrailAutomatedReasoningImpossibleFinding? impossible;

  /// Contains the result when the automated reasoning evaluation determines that
  /// the claims in the input are logically invalid and contradict the established
  /// premises or policy rules.
  final GuardrailAutomatedReasoningInvalidFinding? invalid;

  /// Contains the result when the automated reasoning evaluation cannot extract
  /// any relevant logical information from the input that can be validated
  /// against the policy rules.
  final GuardrailAutomatedReasoningNoTranslationsFinding? noTranslations;

  /// Contains the result when the automated reasoning evaluation determines that
  /// the claims in the input could be either true or false depending on
  /// additional assumptions not provided in the input context.
  final GuardrailAutomatedReasoningSatisfiableFinding? satisfiable;

  /// Contains the result when the automated reasoning evaluation cannot process
  /// the input due to its complexity or volume exceeding the system's processing
  /// capacity for logical analysis.
  final GuardrailAutomatedReasoningTooComplexFinding? tooComplex;

  /// Contains the result when the automated reasoning evaluation detects that the
  /// input has multiple valid logical interpretations, requiring additional
  /// context or clarification to proceed with validation.
  final GuardrailAutomatedReasoningTranslationAmbiguousFinding?
      translationAmbiguous;

  /// Contains the result when the automated reasoning evaluation determines that
  /// the claims in the input are logically valid and definitively true based on
  /// the provided premises and policy rules.
  final GuardrailAutomatedReasoningValidFinding? valid;

  GuardrailAutomatedReasoningFinding({
    this.impossible,
    this.invalid,
    this.noTranslations,
    this.satisfiable,
    this.tooComplex,
    this.translationAmbiguous,
    this.valid,
  });

  factory GuardrailAutomatedReasoningFinding.fromJson(
      Map<String, dynamic> json) {
    return GuardrailAutomatedReasoningFinding(
      impossible: json['impossible'] != null
          ? GuardrailAutomatedReasoningImpossibleFinding.fromJson(
              json['impossible'] as Map<String, dynamic>)
          : null,
      invalid: json['invalid'] != null
          ? GuardrailAutomatedReasoningInvalidFinding.fromJson(
              json['invalid'] as Map<String, dynamic>)
          : null,
      noTranslations: json['noTranslations'] != null
          ? GuardrailAutomatedReasoningNoTranslationsFinding.fromJson(
              json['noTranslations'] as Map<String, dynamic>)
          : null,
      satisfiable: json['satisfiable'] != null
          ? GuardrailAutomatedReasoningSatisfiableFinding.fromJson(
              json['satisfiable'] as Map<String, dynamic>)
          : null,
      tooComplex: json['tooComplex'] != null
          ? GuardrailAutomatedReasoningTooComplexFinding.fromJson(
              json['tooComplex'] as Map<String, dynamic>)
          : null,
      translationAmbiguous: json['translationAmbiguous'] != null
          ? GuardrailAutomatedReasoningTranslationAmbiguousFinding.fromJson(
              json['translationAmbiguous'] as Map<String, dynamic>)
          : null,
      valid: json['valid'] != null
          ? GuardrailAutomatedReasoningValidFinding.fromJson(
              json['valid'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final impossible = this.impossible;
    final invalid = this.invalid;
    final noTranslations = this.noTranslations;
    final satisfiable = this.satisfiable;
    final tooComplex = this.tooComplex;
    final translationAmbiguous = this.translationAmbiguous;
    final valid = this.valid;
    return {
      if (impossible != null) 'impossible': impossible,
      if (invalid != null) 'invalid': invalid,
      if (noTranslations != null) 'noTranslations': noTranslations,
      if (satisfiable != null) 'satisfiable': satisfiable,
      if (tooComplex != null) 'tooComplex': tooComplex,
      if (translationAmbiguous != null)
        'translationAmbiguous': translationAmbiguous,
      if (valid != null) 'valid': valid,
    };
  }
}

/// Indicates that the claims are definitively true and logically implied by the
/// premises, with no possible alternative interpretations.
class GuardrailAutomatedReasoningValidFinding {
  /// An example scenario demonstrating how the claims are logically true.
  final GuardrailAutomatedReasoningScenario? claimsTrueScenario;

  /// Indication of a logic issue with the translation without needing to consider
  /// the automated reasoning policy rules.
  final GuardrailAutomatedReasoningLogicWarning? logicWarning;

  /// The automated reasoning policy rules that support why this result is
  /// considered valid.
  final List<GuardrailAutomatedReasoningRule>? supportingRules;

  /// The logical translation of the input that this finding validates.
  final GuardrailAutomatedReasoningTranslation? translation;

  GuardrailAutomatedReasoningValidFinding({
    this.claimsTrueScenario,
    this.logicWarning,
    this.supportingRules,
    this.translation,
  });

  factory GuardrailAutomatedReasoningValidFinding.fromJson(
      Map<String, dynamic> json) {
    return GuardrailAutomatedReasoningValidFinding(
      claimsTrueScenario: json['claimsTrueScenario'] != null
          ? GuardrailAutomatedReasoningScenario.fromJson(
              json['claimsTrueScenario'] as Map<String, dynamic>)
          : null,
      logicWarning: json['logicWarning'] != null
          ? GuardrailAutomatedReasoningLogicWarning.fromJson(
              json['logicWarning'] as Map<String, dynamic>)
          : null,
      supportingRules: (json['supportingRules'] as List?)
          ?.nonNulls
          .map((e) => GuardrailAutomatedReasoningRule.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      translation: json['translation'] != null
          ? GuardrailAutomatedReasoningTranslation.fromJson(
              json['translation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final claimsTrueScenario = this.claimsTrueScenario;
    final logicWarning = this.logicWarning;
    final supportingRules = this.supportingRules;
    final translation = this.translation;
    return {
      if (claimsTrueScenario != null) 'claimsTrueScenario': claimsTrueScenario,
      if (logicWarning != null) 'logicWarning': logicWarning,
      if (supportingRules != null) 'supportingRules': supportingRules,
      if (translation != null) 'translation': translation,
    };
  }
}

/// Indicates that the claims are logically false and contradictory to the
/// established rules or premises.
class GuardrailAutomatedReasoningInvalidFinding {
  /// The automated reasoning policy rules that contradict the claims in the
  /// input.
  final List<GuardrailAutomatedReasoningRule>? contradictingRules;

  /// Indication of a logic issue with the translation without needing to consider
  /// the automated reasoning policy rules.
  final GuardrailAutomatedReasoningLogicWarning? logicWarning;

  /// The logical translation of the input that this finding invalidates.
  final GuardrailAutomatedReasoningTranslation? translation;

  GuardrailAutomatedReasoningInvalidFinding({
    this.contradictingRules,
    this.logicWarning,
    this.translation,
  });

  factory GuardrailAutomatedReasoningInvalidFinding.fromJson(
      Map<String, dynamic> json) {
    return GuardrailAutomatedReasoningInvalidFinding(
      contradictingRules: (json['contradictingRules'] as List?)
          ?.nonNulls
          .map((e) => GuardrailAutomatedReasoningRule.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      logicWarning: json['logicWarning'] != null
          ? GuardrailAutomatedReasoningLogicWarning.fromJson(
              json['logicWarning'] as Map<String, dynamic>)
          : null,
      translation: json['translation'] != null
          ? GuardrailAutomatedReasoningTranslation.fromJson(
              json['translation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contradictingRules = this.contradictingRules;
    final logicWarning = this.logicWarning;
    final translation = this.translation;
    return {
      if (contradictingRules != null) 'contradictingRules': contradictingRules,
      if (logicWarning != null) 'logicWarning': logicWarning,
      if (translation != null) 'translation': translation,
    };
  }
}

/// Indicates that the claims could be either true or false depending on
/// additional assumptions not provided in the input.
class GuardrailAutomatedReasoningSatisfiableFinding {
  /// An example scenario demonstrating how the claims could be logically false.
  final GuardrailAutomatedReasoningScenario? claimsFalseScenario;

  /// An example scenario demonstrating how the claims could be logically true.
  final GuardrailAutomatedReasoningScenario? claimsTrueScenario;

  /// Indication of a logic issue with the translation without needing to consider
  /// the automated reasoning policy rules.
  final GuardrailAutomatedReasoningLogicWarning? logicWarning;

  /// The logical translation of the input that this finding evaluates.
  final GuardrailAutomatedReasoningTranslation? translation;

  GuardrailAutomatedReasoningSatisfiableFinding({
    this.claimsFalseScenario,
    this.claimsTrueScenario,
    this.logicWarning,
    this.translation,
  });

  factory GuardrailAutomatedReasoningSatisfiableFinding.fromJson(
      Map<String, dynamic> json) {
    return GuardrailAutomatedReasoningSatisfiableFinding(
      claimsFalseScenario: json['claimsFalseScenario'] != null
          ? GuardrailAutomatedReasoningScenario.fromJson(
              json['claimsFalseScenario'] as Map<String, dynamic>)
          : null,
      claimsTrueScenario: json['claimsTrueScenario'] != null
          ? GuardrailAutomatedReasoningScenario.fromJson(
              json['claimsTrueScenario'] as Map<String, dynamic>)
          : null,
      logicWarning: json['logicWarning'] != null
          ? GuardrailAutomatedReasoningLogicWarning.fromJson(
              json['logicWarning'] as Map<String, dynamic>)
          : null,
      translation: json['translation'] != null
          ? GuardrailAutomatedReasoningTranslation.fromJson(
              json['translation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final claimsFalseScenario = this.claimsFalseScenario;
    final claimsTrueScenario = this.claimsTrueScenario;
    final logicWarning = this.logicWarning;
    final translation = this.translation;
    return {
      if (claimsFalseScenario != null)
        'claimsFalseScenario': claimsFalseScenario,
      if (claimsTrueScenario != null) 'claimsTrueScenario': claimsTrueScenario,
      if (logicWarning != null) 'logicWarning': logicWarning,
      if (translation != null) 'translation': translation,
    };
  }
}

/// Indicates that no valid claims can be made due to logical contradictions in
/// the premises or rules.
class GuardrailAutomatedReasoningImpossibleFinding {
  /// The automated reasoning policy rules that contradict the claims and/or
  /// premises in the input.
  final List<GuardrailAutomatedReasoningRule>? contradictingRules;

  /// Indication of a logic issue with the translation without needing to consider
  /// the automated reasoning policy rules.
  final GuardrailAutomatedReasoningLogicWarning? logicWarning;

  /// The logical translation of the input that this finding evaluates.
  final GuardrailAutomatedReasoningTranslation? translation;

  GuardrailAutomatedReasoningImpossibleFinding({
    this.contradictingRules,
    this.logicWarning,
    this.translation,
  });

  factory GuardrailAutomatedReasoningImpossibleFinding.fromJson(
      Map<String, dynamic> json) {
    return GuardrailAutomatedReasoningImpossibleFinding(
      contradictingRules: (json['contradictingRules'] as List?)
          ?.nonNulls
          .map((e) => GuardrailAutomatedReasoningRule.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      logicWarning: json['logicWarning'] != null
          ? GuardrailAutomatedReasoningLogicWarning.fromJson(
              json['logicWarning'] as Map<String, dynamic>)
          : null,
      translation: json['translation'] != null
          ? GuardrailAutomatedReasoningTranslation.fromJson(
              json['translation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contradictingRules = this.contradictingRules;
    final logicWarning = this.logicWarning;
    final translation = this.translation;
    return {
      if (contradictingRules != null) 'contradictingRules': contradictingRules,
      if (logicWarning != null) 'logicWarning': logicWarning,
      if (translation != null) 'translation': translation,
    };
  }
}

/// Indicates that the input has multiple valid logical interpretations,
/// requiring additional context or clarification.
class GuardrailAutomatedReasoningTranslationAmbiguousFinding {
  /// Scenarios showing how the different translation options differ in meaning.
  final List<GuardrailAutomatedReasoningScenario>? differenceScenarios;

  /// Different logical interpretations that were detected during translation of
  /// the input.
  final List<GuardrailAutomatedReasoningTranslationOption>? options;

  GuardrailAutomatedReasoningTranslationAmbiguousFinding({
    this.differenceScenarios,
    this.options,
  });

  factory GuardrailAutomatedReasoningTranslationAmbiguousFinding.fromJson(
      Map<String, dynamic> json) {
    return GuardrailAutomatedReasoningTranslationAmbiguousFinding(
      differenceScenarios: (json['differenceScenarios'] as List?)
          ?.nonNulls
          .map((e) => GuardrailAutomatedReasoningScenario.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      options: (json['options'] as List?)
          ?.nonNulls
          .map((e) => GuardrailAutomatedReasoningTranslationOption.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final differenceScenarios = this.differenceScenarios;
    final options = this.options;
    return {
      if (differenceScenarios != null)
        'differenceScenarios': differenceScenarios,
      if (options != null) 'options': options,
    };
  }
}

/// Indicates that the input exceeds the processing capacity due to the volume
/// or complexity of the logical information.
class GuardrailAutomatedReasoningTooComplexFinding {
  GuardrailAutomatedReasoningTooComplexFinding();

  factory GuardrailAutomatedReasoningTooComplexFinding.fromJson(
      Map<String, dynamic> _) {
    return GuardrailAutomatedReasoningTooComplexFinding();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Indicates that no relevant logical information could be extracted from the
/// input for validation.
class GuardrailAutomatedReasoningNoTranslationsFinding {
  GuardrailAutomatedReasoningNoTranslationsFinding();

  factory GuardrailAutomatedReasoningNoTranslationsFinding.fromJson(
      Map<String, dynamic> _) {
    return GuardrailAutomatedReasoningNoTranslationsFinding();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a logical scenario where claims can be evaluated as true or
/// false, containing specific logical assignments.
class GuardrailAutomatedReasoningScenario {
  /// List of logical assignments and statements that define this scenario.
  final List<GuardrailAutomatedReasoningStatement>? statements;

  GuardrailAutomatedReasoningScenario({
    this.statements,
  });

  factory GuardrailAutomatedReasoningScenario.fromJson(
      Map<String, dynamic> json) {
    return GuardrailAutomatedReasoningScenario(
      statements: (json['statements'] as List?)
          ?.nonNulls
          .map((e) => GuardrailAutomatedReasoningStatement.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statements = this.statements;
    return {
      if (statements != null) 'statements': statements,
    };
  }
}

/// A logical statement that includes both formal logic representation and
/// natural language explanation.
class GuardrailAutomatedReasoningStatement {
  /// The formal logical representation of the statement.
  final String? logic;

  /// The natural language explanation of the logical statement.
  final String? naturalLanguage;

  GuardrailAutomatedReasoningStatement({
    this.logic,
    this.naturalLanguage,
  });

  factory GuardrailAutomatedReasoningStatement.fromJson(
      Map<String, dynamic> json) {
    return GuardrailAutomatedReasoningStatement(
      logic: json['logic'] as String?,
      naturalLanguage: json['naturalLanguage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logic = this.logic;
    final naturalLanguage = this.naturalLanguage;
    return {
      if (logic != null) 'logic': logic,
      if (naturalLanguage != null) 'naturalLanguage': naturalLanguage,
    };
  }
}

/// Represents one possible logical interpretation of ambiguous input content.
class GuardrailAutomatedReasoningTranslationOption {
  /// Example translations that provide this possible interpretation of the input.
  final List<GuardrailAutomatedReasoningTranslation>? translations;

  GuardrailAutomatedReasoningTranslationOption({
    this.translations,
  });

  factory GuardrailAutomatedReasoningTranslationOption.fromJson(
      Map<String, dynamic> json) {
    return GuardrailAutomatedReasoningTranslationOption(
      translations: (json['translations'] as List?)
          ?.nonNulls
          .map((e) => GuardrailAutomatedReasoningTranslation.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final translations = this.translations;
    return {
      if (translations != null) 'translations': translations,
    };
  }
}

/// Contains the logical translation of natural language input into formal
/// logical statements, including premises, claims, and confidence scores.
class GuardrailAutomatedReasoningTranslation {
  /// The logical statements that are being validated against the premises and
  /// policy rules.
  final List<GuardrailAutomatedReasoningStatement>? claims;

  /// A confidence score between 0 and 1 indicating how certain the system is
  /// about the logical translation.
  final double? confidence;

  /// The logical statements that serve as the foundation or assumptions for the
  /// claims.
  final List<GuardrailAutomatedReasoningStatement>? premises;

  /// References to portions of the original input text that correspond to the
  /// claims but could not be fully translated.
  final List<GuardrailAutomatedReasoningInputTextReference>? untranslatedClaims;

  /// References to portions of the original input text that correspond to the
  /// premises but could not be fully translated.
  final List<GuardrailAutomatedReasoningInputTextReference>?
      untranslatedPremises;

  GuardrailAutomatedReasoningTranslation({
    this.claims,
    this.confidence,
    this.premises,
    this.untranslatedClaims,
    this.untranslatedPremises,
  });

  factory GuardrailAutomatedReasoningTranslation.fromJson(
      Map<String, dynamic> json) {
    return GuardrailAutomatedReasoningTranslation(
      claims: (json['claims'] as List?)
          ?.nonNulls
          .map((e) => GuardrailAutomatedReasoningStatement.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      confidence: json['confidence'] as double?,
      premises: (json['premises'] as List?)
          ?.nonNulls
          .map((e) => GuardrailAutomatedReasoningStatement.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      untranslatedClaims: (json['untranslatedClaims'] as List?)
          ?.nonNulls
          .map((e) => GuardrailAutomatedReasoningInputTextReference.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      untranslatedPremises: (json['untranslatedPremises'] as List?)
          ?.nonNulls
          .map((e) => GuardrailAutomatedReasoningInputTextReference.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final claims = this.claims;
    final confidence = this.confidence;
    final premises = this.premises;
    final untranslatedClaims = this.untranslatedClaims;
    final untranslatedPremises = this.untranslatedPremises;
    return {
      if (claims != null) 'claims': claims,
      if (confidence != null) 'confidence': confidence,
      if (premises != null) 'premises': premises,
      if (untranslatedClaims != null) 'untranslatedClaims': untranslatedClaims,
      if (untranslatedPremises != null)
        'untranslatedPremises': untranslatedPremises,
    };
  }
}

/// References a portion of the original input text that corresponds to logical
/// elements.
class GuardrailAutomatedReasoningInputTextReference {
  /// The specific text from the original input that this reference points to.
  final String? text;

  GuardrailAutomatedReasoningInputTextReference({
    this.text,
  });

  factory GuardrailAutomatedReasoningInputTextReference.fromJson(
      Map<String, dynamic> json) {
    return GuardrailAutomatedReasoningInputTextReference(
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

/// Identifies logical issues in the translated statements that exist
/// independent of any policy rules, such as statements that are always true or
/// always false.
class GuardrailAutomatedReasoningLogicWarning {
  /// The logical statements that are validated while assuming the policy and
  /// premises.
  final List<GuardrailAutomatedReasoningStatement>? claims;

  /// The logical statements that serve as premises under which the claims are
  /// validated.
  final List<GuardrailAutomatedReasoningStatement>? premises;

  /// The category of the detected logical issue, such as statements that are
  /// always true or always false.
  final GuardrailAutomatedReasoningLogicWarningType? type;

  GuardrailAutomatedReasoningLogicWarning({
    this.claims,
    this.premises,
    this.type,
  });

  factory GuardrailAutomatedReasoningLogicWarning.fromJson(
      Map<String, dynamic> json) {
    return GuardrailAutomatedReasoningLogicWarning(
      claims: (json['claims'] as List?)
          ?.nonNulls
          .map((e) => GuardrailAutomatedReasoningStatement.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      premises: (json['premises'] as List?)
          ?.nonNulls
          .map((e) => GuardrailAutomatedReasoningStatement.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      type: (json['type'] as String?)
          ?.let(GuardrailAutomatedReasoningLogicWarningType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final claims = this.claims;
    final premises = this.premises;
    final type = this.type;
    return {
      if (claims != null) 'claims': claims,
      if (premises != null) 'premises': premises,
      if (type != null) 'type': type.value,
    };
  }
}

class GuardrailAutomatedReasoningLogicWarningType {
  static const alwaysFalse =
      GuardrailAutomatedReasoningLogicWarningType._('ALWAYS_FALSE');
  static const alwaysTrue =
      GuardrailAutomatedReasoningLogicWarningType._('ALWAYS_TRUE');

  final String value;

  const GuardrailAutomatedReasoningLogicWarningType._(this.value);

  static const values = [alwaysFalse, alwaysTrue];

  static GuardrailAutomatedReasoningLogicWarningType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailAutomatedReasoningLogicWarningType._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailAutomatedReasoningLogicWarningType &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// References a specific automated reasoning policy rule that was applied
/// during evaluation.
class GuardrailAutomatedReasoningRule {
  /// The unique identifier of the automated reasoning rule.
  final String? identifier;

  /// The ARN of the automated reasoning policy version that contains this rule.
  final String? policyVersionArn;

  GuardrailAutomatedReasoningRule({
    this.identifier,
    this.policyVersionArn,
  });

  factory GuardrailAutomatedReasoningRule.fromJson(Map<String, dynamic> json) {
    return GuardrailAutomatedReasoningRule(
      identifier: json['identifier'] as String?,
      policyVersionArn: json['policyVersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final policyVersionArn = this.policyVersionArn;
    return {
      if (identifier != null) 'identifier': identifier,
      if (policyVersionArn != null) 'policyVersionArn': policyVersionArn,
    };
  }
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

  /// Indicates whether content that fails the contextual grounding evaluation
  /// (grounding or relevance score less than the corresponding threshold) was
  /// detected.
  final bool? detected;

  GuardrailContextualGroundingFilter({
    required this.action,
    required this.score,
    required this.threshold,
    required this.type,
    this.detected,
  });

  factory GuardrailContextualGroundingFilter.fromJson(
      Map<String, dynamic> json) {
    return GuardrailContextualGroundingFilter(
      action: GuardrailContextualGroundingPolicyAction.fromString(
          (json['action'] as String?) ?? ''),
      score: (json['score'] as double?) ?? 0,
      threshold: (json['threshold'] as double?) ?? 0,
      type: GuardrailContextualGroundingFilterType.fromString(
          (json['type'] as String?) ?? ''),
      detected: json['detected'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final score = this.score;
    final threshold = this.threshold;
    final type = this.type;
    final detected = this.detected;
    return {
      'action': action.value,
      'score': score,
      'threshold': threshold,
      'type': type.value,
      if (detected != null) 'detected': detected,
    };
  }
}

class GuardrailContextualGroundingFilterType {
  static const grounding =
      GuardrailContextualGroundingFilterType._('GROUNDING');
  static const relevance =
      GuardrailContextualGroundingFilterType._('RELEVANCE');

  final String value;

  const GuardrailContextualGroundingFilterType._(this.value);

  static const values = [grounding, relevance];

  static GuardrailContextualGroundingFilterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailContextualGroundingFilterType._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailContextualGroundingFilterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class GuardrailContextualGroundingPolicyAction {
  static const blocked = GuardrailContextualGroundingPolicyAction._('BLOCKED');
  static const none = GuardrailContextualGroundingPolicyAction._('NONE');

  final String value;

  const GuardrailContextualGroundingPolicyAction._(this.value);

  static const values = [blocked, none];

  static GuardrailContextualGroundingPolicyAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailContextualGroundingPolicyAction._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailContextualGroundingPolicyAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A Regex filter configured in a guardrail.
class GuardrailRegexFilter {
  /// The region filter action.
  final GuardrailSensitiveInformationPolicyAction action;

  /// Indicates whether custom regex entities that breach the guardrail
  /// configuration are detected.
  final bool? detected;

  /// The regesx filter match.
  final String? match;

  /// The regex filter name.
  final String? name;

  /// The regex query.
  final String? regex;

  GuardrailRegexFilter({
    required this.action,
    this.detected,
    this.match,
    this.name,
    this.regex,
  });

  factory GuardrailRegexFilter.fromJson(Map<String, dynamic> json) {
    return GuardrailRegexFilter(
      action: GuardrailSensitiveInformationPolicyAction.fromString(
          (json['action'] as String?) ?? ''),
      detected: json['detected'] as bool?,
      match: json['match'] as String?,
      name: json['name'] as String?,
      regex: json['regex'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final detected = this.detected;
    final match = this.match;
    final name = this.name;
    final regex = this.regex;
    return {
      'action': action.value,
      if (detected != null) 'detected': detected,
      if (match != null) 'match': match,
      if (name != null) 'name': name,
      if (regex != null) 'regex': regex,
    };
  }
}

class GuardrailSensitiveInformationPolicyAction {
  static const anonymized =
      GuardrailSensitiveInformationPolicyAction._('ANONYMIZED');
  static const blocked = GuardrailSensitiveInformationPolicyAction._('BLOCKED');
  static const none = GuardrailSensitiveInformationPolicyAction._('NONE');

  final String value;

  const GuardrailSensitiveInformationPolicyAction._(this.value);

  static const values = [anonymized, blocked, none];

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

/// A Personally Identifiable Information (PII) entity configured in a
/// guardrail.
class GuardrailPiiEntityFilter {
  /// The PII entity filter action.
  final GuardrailSensitiveInformationPolicyAction action;

  /// The PII entity filter match.
  final String match;

  /// The PII entity filter type.
  final GuardrailPiiEntityType type;

  /// Indicates whether personally identifiable information (PII) that breaches
  /// the guardrail configuration is detected.
  final bool? detected;

  GuardrailPiiEntityFilter({
    required this.action,
    required this.match,
    required this.type,
    this.detected,
  });

  factory GuardrailPiiEntityFilter.fromJson(Map<String, dynamic> json) {
    return GuardrailPiiEntityFilter(
      action: GuardrailSensitiveInformationPolicyAction.fromString(
          (json['action'] as String?) ?? ''),
      match: (json['match'] as String?) ?? '',
      type: GuardrailPiiEntityType.fromString((json['type'] as String?) ?? ''),
      detected: json['detected'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final match = this.match;
    final type = this.type;
    final detected = this.detected;
    return {
      'action': action.value,
      'match': match,
      'type': type.value,
      if (detected != null) 'detected': detected,
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

/// A managed word configured in a guardrail.
class GuardrailManagedWord {
  /// The action for the managed word.
  final GuardrailWordPolicyAction action;

  /// The match for the managed word.
  final String match;

  /// The type for the managed word.
  final GuardrailManagedWordType type;

  /// Indicates whether managed word content that breaches the guardrail
  /// configuration is detected.
  final bool? detected;

  GuardrailManagedWord({
    required this.action,
    required this.match,
    required this.type,
    this.detected,
  });

  factory GuardrailManagedWord.fromJson(Map<String, dynamic> json) {
    return GuardrailManagedWord(
      action: GuardrailWordPolicyAction.fromString(
          (json['action'] as String?) ?? ''),
      match: (json['match'] as String?) ?? '',
      type:
          GuardrailManagedWordType.fromString((json['type'] as String?) ?? ''),
      detected: json['detected'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final match = this.match;
    final type = this.type;
    final detected = this.detected;
    return {
      'action': action.value,
      'match': match,
      'type': type.value,
      if (detected != null) 'detected': detected,
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
  static const none = GuardrailWordPolicyAction._('NONE');

  final String value;

  const GuardrailWordPolicyAction._(this.value);

  static const values = [blocked, none];

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

/// A custom word configured in a guardrail.
class GuardrailCustomWord {
  /// The action for the custom word.
  final GuardrailWordPolicyAction action;

  /// The match for the custom word.
  final String match;

  /// Indicates whether custom word content that breaches the guardrail
  /// configuration is detected.
  final bool? detected;

  GuardrailCustomWord({
    required this.action,
    required this.match,
    this.detected,
  });

  factory GuardrailCustomWord.fromJson(Map<String, dynamic> json) {
    return GuardrailCustomWord(
      action: GuardrailWordPolicyAction.fromString(
          (json['action'] as String?) ?? ''),
      match: (json['match'] as String?) ?? '',
      detected: json['detected'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final match = this.match;
    final detected = this.detected;
    return {
      'action': action.value,
      'match': match,
      if (detected != null) 'detected': detected,
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

  /// Indicates whether content that breaches the guardrail configuration is
  /// detected.
  final bool? detected;

  /// The filter strength setting for the guardrail content filter.
  final GuardrailContentFilterStrength? filterStrength;

  GuardrailContentFilter({
    required this.action,
    required this.confidence,
    required this.type,
    this.detected,
    this.filterStrength,
  });

  factory GuardrailContentFilter.fromJson(Map<String, dynamic> json) {
    return GuardrailContentFilter(
      action: GuardrailContentPolicyAction.fromString(
          (json['action'] as String?) ?? ''),
      confidence: GuardrailContentFilterConfidence.fromString(
          (json['confidence'] as String?) ?? ''),
      type: GuardrailContentFilterType.fromString(
          (json['type'] as String?) ?? ''),
      detected: json['detected'] as bool?,
      filterStrength: (json['filterStrength'] as String?)
          ?.let(GuardrailContentFilterStrength.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final confidence = this.confidence;
    final type = this.type;
    final detected = this.detected;
    final filterStrength = this.filterStrength;
    return {
      'action': action.value,
      'confidence': confidence.value,
      'type': type.value,
      if (detected != null) 'detected': detected,
      if (filterStrength != null) 'filterStrength': filterStrength.value,
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

class GuardrailContentFilterStrength {
  static const none = GuardrailContentFilterStrength._('NONE');
  static const low = GuardrailContentFilterStrength._('LOW');
  static const medium = GuardrailContentFilterStrength._('MEDIUM');
  static const high = GuardrailContentFilterStrength._('HIGH');

  final String value;

  const GuardrailContentFilterStrength._(this.value);

  static const values = [none, low, medium, high];

  static GuardrailContentFilterStrength fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailContentFilterStrength._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailContentFilterStrength && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class GuardrailContentPolicyAction {
  static const blocked = GuardrailContentPolicyAction._('BLOCKED');
  static const none = GuardrailContentPolicyAction._('NONE');

  final String value;

  const GuardrailContentPolicyAction._(this.value);

  static const values = [blocked, none];

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

/// Information about a topic guardrail.
class GuardrailTopic {
  /// The action the guardrail should take when it intervenes on a topic.
  final GuardrailTopicPolicyAction action;

  /// The name for the guardrail.
  final String name;

  /// The type behavior that the guardrail should perform when the model detects
  /// the topic.
  final GuardrailTopicType type;

  /// Indicates whether topic content that breaches the guardrail configuration is
  /// detected.
  final bool? detected;

  GuardrailTopic({
    required this.action,
    required this.name,
    required this.type,
    this.detected,
  });

  factory GuardrailTopic.fromJson(Map<String, dynamic> json) {
    return GuardrailTopic(
      action: GuardrailTopicPolicyAction.fromString(
          (json['action'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      type: GuardrailTopicType.fromString((json['type'] as String?) ?? ''),
      detected: json['detected'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final name = this.name;
    final type = this.type;
    final detected = this.detected;
    return {
      'action': action.value,
      'name': name,
      'type': type.value,
      if (detected != null) 'detected': detected,
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
  static const none = GuardrailTopicPolicyAction._('NONE');

  final String value;

  const GuardrailTopicPolicyAction._(this.value);

  static const values = [blocked, none];

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

/// Cache creation metrics for a specific TTL duration
class CacheDetail {
  /// Number of tokens written to cache with this TTL (cache creation tokens)
  final int inputTokens;

  /// TTL duration for these cached tokens
  final CacheTTL ttl;

  CacheDetail({
    required this.inputTokens,
    required this.ttl,
  });

  factory CacheDetail.fromJson(Map<String, dynamic> json) {
    return CacheDetail(
      inputTokens: (json['inputTokens'] as int?) ?? 0,
      ttl: CacheTTL.fromString((json['ttl'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final inputTokens = this.inputTokens;
    final ttl = this.ttl;
    return {
      'inputTokens': inputTokens,
      'ttl': ttl.value,
    };
  }
}

class StopReason {
  static const endTurn = StopReason._('end_turn');
  static const toolUse = StopReason._('tool_use');
  static const maxTokens = StopReason._('max_tokens');
  static const stopSequence = StopReason._('stop_sequence');
  static const guardrailIntervened = StopReason._('guardrail_intervened');
  static const contentFiltered = StopReason._('content_filtered');
  static const malformedModelOutput = StopReason._('malformed_model_output');
  static const malformedToolUse = StopReason._('malformed_tool_use');
  static const modelContextWindowExceeded =
      StopReason._('model_context_window_exceeded');

  final String value;

  const StopReason._(this.value);

  static const values = [
    endTurn,
    toolUse,
    maxTokens,
    stopSequence,
    guardrailIntervened,
    contentFiltered,
    malformedModelOutput,
    malformedToolUse,
    modelContextWindowExceeded
  ];

  static StopReason fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StopReason._(value));

  @override
  bool operator ==(other) => other is StopReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A block of content in a streaming response.
class ContentBlockDelta {
  /// Incremental citation information that is streamed as part of the response
  /// generation process.
  final CitationsDelta? citation;

  /// A streaming delta event containing incremental image data.
  final ImageBlockDelta? image;

  /// Contains content regarding the reasoning that is carried out by the model.
  /// Reasoning refers to a Chain of Thought (CoT) that the model generates to
  /// enhance the accuracy of its final response.
  final ReasoningContentBlockDelta? reasoningContent;

  /// The content text.
  final String? text;

  /// An incremental update that contains the results from a tool call.
  final List<ToolResultBlockDelta>? toolResult;

  /// Information about a tool that the model is requesting to use.
  final ToolUseBlockDelta? toolUse;

  ContentBlockDelta({
    this.citation,
    this.image,
    this.reasoningContent,
    this.text,
    this.toolResult,
    this.toolUse,
  });

  factory ContentBlockDelta.fromJson(Map<String, dynamic> json) {
    return ContentBlockDelta(
      citation: json['citation'] != null
          ? CitationsDelta.fromJson(json['citation'] as Map<String, dynamic>)
          : null,
      image: json['image'] != null
          ? ImageBlockDelta.fromJson(json['image'] as Map<String, dynamic>)
          : null,
      reasoningContent: json['reasoningContent'] != null
          ? ReasoningContentBlockDelta.fromJson(
              json['reasoningContent'] as Map<String, dynamic>)
          : null,
      text: json['text'] as String?,
      toolResult: (json['toolResult'] as List?)
          ?.nonNulls
          .map((e) => ToolResultBlockDelta.fromJson(e as Map<String, dynamic>))
          .toList(),
      toolUse: json['toolUse'] != null
          ? ToolUseBlockDelta.fromJson(json['toolUse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final citation = this.citation;
    final image = this.image;
    final reasoningContent = this.reasoningContent;
    final text = this.text;
    final toolResult = this.toolResult;
    final toolUse = this.toolUse;
    return {
      if (citation != null) 'citation': citation,
      if (image != null) 'image': image,
      if (reasoningContent != null) 'reasoningContent': reasoningContent,
      if (text != null) 'text': text,
      if (toolResult != null) 'toolResult': toolResult,
      if (toolUse != null) 'toolUse': toolUse,
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

/// Contains content regarding the reasoning that is carried out by the model
/// with respect to the content in the content block. Reasoning refers to a
/// Chain of Thought (CoT) that the model generates to enhance the accuracy of
/// its final response.
class ReasoningContentBlockDelta {
  /// The content in the reasoning that was encrypted by the model provider for
  /// safety reasons. The encryption doesn't affect the quality of responses.
  final Uint8List? redactedContent;

  /// A token that verifies that the reasoning text was generated by the model. If
  /// you pass a reasoning block back to the API in a multi-turn conversation,
  /// include the text and its signature unmodified.
  final String? signature;

  /// The reasoning that the model used to return the output.
  final String? text;

  ReasoningContentBlockDelta({
    this.redactedContent,
    this.signature,
    this.text,
  });

  factory ReasoningContentBlockDelta.fromJson(Map<String, dynamic> json) {
    return ReasoningContentBlockDelta(
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

/// Contains incremental updates to citation information during streaming
/// responses. This allows clients to build up citation data progressively as
/// the response is generated.
class CitationsDelta {
  /// Specifies the precise location within a source document where cited content
  /// can be found. This can include character-level positions, page numbers, or
  /// document chunks depending on the document type and indexing method.
  final CitationLocation? location;

  /// The source from the original search result that provided the cited content.
  final String? source;

  /// The specific content from the source document that was referenced or cited
  /// in the generated response.
  final List<CitationSourceContentDelta>? sourceContent;

  /// The title or identifier of the source document being cited.
  final String? title;

  CitationsDelta({
    this.location,
    this.source,
    this.sourceContent,
    this.title,
  });

  factory CitationsDelta.fromJson(Map<String, dynamic> json) {
    return CitationsDelta(
      location: json['location'] != null
          ? CitationLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      source: json['source'] as String?,
      sourceContent: (json['sourceContent'] as List?)
          ?.nonNulls
          .map((e) =>
              CitationSourceContentDelta.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    final source = this.source;
    final sourceContent = this.sourceContent;
    final title = this.title;
    return {
      if (location != null) 'location': location,
      if (source != null) 'source': source,
      if (sourceContent != null) 'sourceContent': sourceContent,
      if (title != null) 'title': title,
    };
  }
}

/// A streaming delta event that contains incremental image data during
/// streaming responses.
class ImageBlockDelta {
  /// Error information if this image delta could not be processed.
  final ErrorBlock? error;

  /// The incremental image source data for this delta event.
  final ImageSource? source;

  ImageBlockDelta({
    this.error,
    this.source,
  });

  factory ImageBlockDelta.fromJson(Map<String, dynamic> json) {
    return ImageBlockDelta(
      error: json['error'] != null
          ? ErrorBlock.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      source: json['source'] != null
          ? ImageSource.fromJson(json['source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final source = this.source;
    return {
      if (error != null) 'error': error,
      if (source != null) 'source': source,
    };
  }
}

/// Contains incremental updates to the source content text during streaming
/// responses, allowing clients to build up the cited content progressively.
class CitationSourceContentDelta {
  /// An incremental update to the text content from the source document that is
  /// being cited.
  final String? text;

  CitationSourceContentDelta({
    this.text,
  });

  factory CitationSourceContentDelta.fromJson(Map<String, dynamic> json) {
    return CitationSourceContentDelta(
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

/// Contains incremental updates to tool results information during streaming
/// responses. This allows clients to build up tool results data progressively
/// as the response is generated.
class ToolResultBlockDelta {
  /// The JSON schema for the tool result content block. see <a
  /// href="https://json-schema.org/understanding-json-schema/reference">JSON
  /// Schema Reference</a>.
  final Document? json;

  /// The reasoning the model used to return the output.
  final String? text;

  ToolResultBlockDelta({
    this.json,
    this.text,
  });

  factory ToolResultBlockDelta.fromJson(Map<String, dynamic> json) {
    return ToolResultBlockDelta(
      json: json['json'] != null
          ? Document.fromJson(json['json'] as Map<String, dynamic>)
          : null,
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

/// Content block start information.
class ContentBlockStart {
  /// The initial event indicating the start of a streaming image block.
  final ImageBlockStart? image;

  /// The
  final ToolResultBlockStart? toolResult;

  /// Information about a tool that the model is requesting to use.
  final ToolUseBlockStart? toolUse;

  ContentBlockStart({
    this.image,
    this.toolResult,
    this.toolUse,
  });

  factory ContentBlockStart.fromJson(Map<String, dynamic> json) {
    return ContentBlockStart(
      image: json['image'] != null
          ? ImageBlockStart.fromJson(json['image'] as Map<String, dynamic>)
          : null,
      toolResult: json['toolResult'] != null
          ? ToolResultBlockStart.fromJson(
              json['toolResult'] as Map<String, dynamic>)
          : null,
      toolUse: json['toolUse'] != null
          ? ToolUseBlockStart.fromJson(json['toolUse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final image = this.image;
    final toolResult = this.toolResult;
    final toolUse = this.toolUse;
    return {
      if (image != null) 'image': image,
      if (toolResult != null) 'toolResult': toolResult,
      if (toolUse != null) 'toolUse': toolUse,
    };
  }
}

/// The start of a tool use block. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Call
/// a tool with the Converse API</a> in the Amazon Bedrock User Guide.
class ToolUseBlockStart {
  /// The name of the tool that the model is requesting to use.
  final String name;

  /// The ID for the tool request.
  final String toolUseId;

  /// The type for the tool request.
  final ToolUseType? type;

  ToolUseBlockStart({
    required this.name,
    required this.toolUseId,
    this.type,
  });

  factory ToolUseBlockStart.fromJson(Map<String, dynamic> json) {
    return ToolUseBlockStart(
      name: (json['name'] as String?) ?? '',
      toolUseId: (json['toolUseId'] as String?) ?? '',
      type: (json['type'] as String?)?.let(ToolUseType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final toolUseId = this.toolUseId;
    final type = this.type;
    return {
      'name': name,
      'toolUseId': toolUseId,
      if (type != null) 'type': type.value,
    };
  }
}

/// The start of a tool result block. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tool-use.html">Call
/// a tool with the Converse API</a> in the Amazon Bedrock User Guide.
class ToolResultBlockStart {
  /// The ID of the tool that was used to generate this tool result block.
  final String toolUseId;

  /// The status of the tool result block.
  final ToolResultStatus? status;

  /// The type for the tool that was used to generate this tool result block.
  final String? type;

  ToolResultBlockStart({
    required this.toolUseId,
    this.status,
    this.type,
  });

  factory ToolResultBlockStart.fromJson(Map<String, dynamic> json) {
    return ToolResultBlockStart(
      toolUseId: (json['toolUseId'] as String?) ?? '',
      status: (json['status'] as String?)?.let(ToolResultStatus.fromString),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final toolUseId = this.toolUseId;
    final status = this.status;
    final type = this.type;
    return {
      'toolUseId': toolUseId,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type,
    };
  }
}

/// The initial event in a streaming image block that indicates the start of
/// image content.
class ImageBlockStart {
  /// The format of the image data that will be streamed in subsequent delta
  /// events.
  final ImageFormat format;

  ImageBlockStart({
    required this.format,
  });

  factory ImageBlockStart.fromJson(Map<String, dynamic> json) {
    return ImageBlockStart(
      format: ImageFormat.fromString((json['format'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    return {
      'format': format.value,
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

/// Configuration information for a guardrail that you use with the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_ConverseStream.html">ConverseStream</a>
/// action.
class GuardrailStreamConfiguration {
  /// The identifier for the guardrail.
  final String? guardrailIdentifier;

  /// The version of the guardrail.
  final String? guardrailVersion;

  /// The processing mode.
  ///
  /// The processing mode. For more information, see <i>Configure streaming
  /// response behavior</i> in the <i>Amazon Bedrock User Guide</i>.
  final GuardrailStreamProcessingMode? streamProcessingMode;

  /// The trace behavior for the guardrail.
  final GuardrailTrace? trace;

  GuardrailStreamConfiguration({
    this.guardrailIdentifier,
    this.guardrailVersion,
    this.streamProcessingMode,
    this.trace,
  });

  Map<String, dynamic> toJson() {
    final guardrailIdentifier = this.guardrailIdentifier;
    final guardrailVersion = this.guardrailVersion;
    final streamProcessingMode = this.streamProcessingMode;
    final trace = this.trace;
    return {
      if (guardrailIdentifier != null)
        'guardrailIdentifier': guardrailIdentifier,
      if (guardrailVersion != null) 'guardrailVersion': guardrailVersion,
      if (streamProcessingMode != null)
        'streamProcessingMode': streamProcessingMode.value,
      if (trace != null) 'trace': trace.value,
    };
  }
}

/// Output configuration for a model response in a call to <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_Converse.html">Converse</a>
/// or <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_ConverseStream.html">ConverseStream</a>.
class OutputConfig {
  /// Structured output parameters to control the model's text response.
  final OutputFormat? textFormat;

  OutputConfig({
    this.textFormat,
  });

  Map<String, dynamic> toJson() {
    final textFormat = this.textFormat;
    return {
      if (textFormat != null) 'textFormat': textFormat,
    };
  }
}

/// Structured output parameters to control the model's response.
class OutputFormat {
  /// The structure that the model's output must adhere to.
  final OutputFormatStructure structure;

  /// The type of structured output format.
  final OutputFormatType type;

  OutputFormat({
    required this.structure,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final structure = this.structure;
    final type = this.type;
    return {
      'structure': structure,
      'type': type.value,
    };
  }
}

/// The type of structured output format. Available options are: json_schema.
class OutputFormatType {
  static const jsonSchema = OutputFormatType._('json_schema');

  final String value;

  const OutputFormatType._(this.value);

  static const values = [jsonSchema];

  static OutputFormatType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OutputFormatType._(value));

  @override
  bool operator ==(other) => other is OutputFormatType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The structure that the model's output must adhere to.
class OutputFormatStructure {
  /// A JSON schema structure that the model's output must adhere to.
  final JsonSchemaDefinition? jsonSchema;

  OutputFormatStructure({
    this.jsonSchema,
  });

  Map<String, dynamic> toJson() {
    final jsonSchema = this.jsonSchema;
    return {
      if (jsonSchema != null) 'jsonSchema': jsonSchema,
    };
  }
}

/// JSON schema structured output format options.
class JsonSchemaDefinition {
  /// The JSON schema to constrain the model's output. For more information, see
  /// <a href="https://json-schema.org/understanding-json-schema/reference">JSON
  /// Schema Reference</a>.
  final String schema;

  /// A description of the JSON schema.
  final String? description;

  /// The name of the JSON schema.
  final String? name;

  JsonSchemaDefinition({
    required this.schema,
    this.description,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final schema = this.schema;
    final description = this.description;
    final name = this.name;
    return {
      'schema': schema,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
    };
  }
}

/// Contains a map of variables in a prompt from Prompt management to an object
/// containing the values to fill in for them when running model invocation. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-how.html">How
/// Prompt management works</a>.
class PromptVariableValues {
  /// The text value that the variable maps to.
  final String? text;

  PromptVariableValues({
    this.text,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      if (text != null) 'text': text,
    };
  }
}

class GuardrailTrace {
  static const enabled = GuardrailTrace._('enabled');
  static const disabled = GuardrailTrace._('disabled');
  static const enabledFull = GuardrailTrace._('enabled_full');

  final String value;

  const GuardrailTrace._(this.value);

  static const values = [enabled, disabled, enabledFull];

  static GuardrailTrace fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailTrace._(value));

  @override
  bool operator ==(other) => other is GuardrailTrace && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class GuardrailStreamProcessingMode {
  static const sync = GuardrailStreamProcessingMode._('sync');
  static const async = GuardrailStreamProcessingMode._('async');

  final String value;

  const GuardrailStreamProcessingMode._(this.value);

  static const values = [sync, async];

  static GuardrailStreamProcessingMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailStreamProcessingMode._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailStreamProcessingMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

/// The trace object in a response from <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_Converse.html">Converse</a>.
class ConverseTrace {
  /// The guardrail trace object.
  final GuardrailTraceAssessment? guardrail;

  /// The request's prompt router.
  final PromptRouterTrace? promptRouter;

  ConverseTrace({
    this.guardrail,
    this.promptRouter,
  });

  factory ConverseTrace.fromJson(Map<String, dynamic> json) {
    return ConverseTrace(
      guardrail: json['guardrail'] != null
          ? GuardrailTraceAssessment.fromJson(
              json['guardrail'] as Map<String, dynamic>)
          : null,
      promptRouter: json['promptRouter'] != null
          ? PromptRouterTrace.fromJson(
              json['promptRouter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final guardrail = this.guardrail;
    final promptRouter = this.promptRouter;
    return {
      if (guardrail != null) 'guardrail': guardrail,
      if (promptRouter != null) 'promptRouter': promptRouter,
    };
  }
}

/// Configuration information for a guardrail that you use with the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_Converse.html">Converse</a>
/// operation.
class GuardrailConfiguration {
  /// The identifier for the guardrail.
  final String? guardrailIdentifier;

  /// The version of the guardrail.
  final String? guardrailVersion;

  /// The trace behavior for the guardrail.
  final GuardrailTrace? trace;

  GuardrailConfiguration({
    this.guardrailIdentifier,
    this.guardrailVersion,
    this.trace,
  });

  Map<String, dynamic> toJson() {
    final guardrailIdentifier = this.guardrailIdentifier;
    final guardrailVersion = this.guardrailVersion;
    final trace = this.trace;
    return {
      if (guardrailIdentifier != null)
        'guardrailIdentifier': guardrailIdentifier,
      if (guardrailVersion != null) 'guardrailVersion': guardrailVersion,
      if (trace != null) 'trace': trace.value,
    };
  }
}

class GuardrailAction {
  static const none = GuardrailAction._('NONE');
  static const guardrailIntervened = GuardrailAction._('GUARDRAIL_INTERVENED');

  final String value;

  const GuardrailAction._(this.value);

  static const values = [none, guardrailIntervened];

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

class GuardrailContentSource {
  static const input = GuardrailContentSource._('INPUT');
  static const output = GuardrailContentSource._('OUTPUT');

  final String value;

  const GuardrailContentSource._(this.value);

  static const values = [input, output];

  static GuardrailContentSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailContentSource._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailContentSource && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class GuardrailOutputScope {
  static const interventions = GuardrailOutputScope._('INTERVENTIONS');
  static const full = GuardrailOutputScope._('FULL');

  final String value;

  const GuardrailOutputScope._(this.value);

  static const values = [interventions, full];

  static GuardrailOutputScope fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailOutputScope._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailOutputScope && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The content block to be evaluated by the guardrail.
class GuardrailContentBlock {
  /// Image within guardrail content block to be evaluated by the guardrail.
  final GuardrailImageBlock? image;

  /// Text within content block to be evaluated by the guardrail.
  final GuardrailTextBlock? text;

  GuardrailContentBlock({
    this.image,
    this.text,
  });

  Map<String, dynamic> toJson() {
    final image = this.image;
    final text = this.text;
    return {
      if (image != null) 'image': image,
      if (text != null) 'text': text,
    };
  }
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

/// Contain an image which user wants guarded. This block is accepted by the
/// guardrails independent API.
class GuardrailImageBlock {
  /// The format details for the file type of the image blocked by the guardrail.
  final GuardrailImageFormat format;

  /// The image source (image bytes) details of the image blocked by the
  /// guardrail.
  final GuardrailImageSource source;

  GuardrailImageBlock({
    required this.format,
    required this.source,
  });

  Map<String, dynamic> toJson() {
    final format = this.format;
    final source = this.source;
    return {
      'format': format.value,
      'source': source,
    };
  }
}

class GuardrailImageFormat {
  static const png = GuardrailImageFormat._('png');
  static const jpeg = GuardrailImageFormat._('jpeg');

  final String value;

  const GuardrailImageFormat._(this.value);

  static const values = [png, jpeg];

  static GuardrailImageFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailImageFormat._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailImageFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The image source (image bytes) of the guardrail image source. Object used in
/// independent api.
class GuardrailImageSource {
  /// The bytes details of the guardrail image source. Object used in independent
  /// api.
  final Uint8List? bytes;

  GuardrailImageSource({
    this.bytes,
  });

  Map<String, dynamic> toJson() {
    final bytes = this.bytes;
    return {
      if (bytes != null) 'bytes': base64Encode(bytes),
    };
  }
}

class GuardrailContentQualifier {
  static const groundingSource =
      GuardrailContentQualifier._('grounding_source');
  static const query = GuardrailContentQualifier._('query');
  static const guardContent = GuardrailContentQualifier._('guard_content');

  final String value;

  const GuardrailContentQualifier._(this.value);

  static const values = [groundingSource, query, guardContent];

  static GuardrailContentQualifier fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailContentQualifier._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailContentQualifier && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Asynchronous invocation output data settings.
class AsyncInvokeOutputDataConfig {
  /// A storage location for the output data in an S3 bucket
  final AsyncInvokeS3OutputDataConfig? s3OutputDataConfig;

  AsyncInvokeOutputDataConfig({
    this.s3OutputDataConfig,
  });

  factory AsyncInvokeOutputDataConfig.fromJson(Map<String, dynamic> json) {
    return AsyncInvokeOutputDataConfig(
      s3OutputDataConfig: json['s3OutputDataConfig'] != null
          ? AsyncInvokeS3OutputDataConfig.fromJson(
              json['s3OutputDataConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3OutputDataConfig = this.s3OutputDataConfig;
    return {
      if (s3OutputDataConfig != null) 's3OutputDataConfig': s3OutputDataConfig,
    };
  }
}

/// A tag.
class Tag {
  /// The tag's key.
  final String key;

  /// The tag's value.
  final String value;

  Tag({
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

/// Asynchronous invocation output data settings.
class AsyncInvokeS3OutputDataConfig {
  /// An object URI starting with <code>s3://</code>.
  final String s3Uri;

  /// If the bucket belongs to another AWS account, specify that account's ID.
  final String? bucketOwner;

  /// A KMS encryption key ID.
  final String? kmsKeyId;

  AsyncInvokeS3OutputDataConfig({
    required this.s3Uri,
    this.bucketOwner,
    this.kmsKeyId,
  });

  factory AsyncInvokeS3OutputDataConfig.fromJson(Map<String, dynamic> json) {
    return AsyncInvokeS3OutputDataConfig(
      s3Uri: (json['s3Uri'] as String?) ?? '',
      bucketOwner: json['bucketOwner'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final bucketOwner = this.bucketOwner;
    final kmsKeyId = this.kmsKeyId;
    return {
      's3Uri': s3Uri,
      if (bucketOwner != null) 'bucketOwner': bucketOwner,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
    };
  }
}

/// A summary of an asynchronous invocation.
class AsyncInvokeSummary {
  /// The invocation's ARN.
  final String invocationArn;

  /// The invoked model's ARN.
  final String modelArn;

  /// The invocation's output data settings.
  final AsyncInvokeOutputDataConfig outputDataConfig;

  /// When the invocation was submitted.
  final DateTime submitTime;

  /// The invocation's idempotency token.
  final String? clientRequestToken;

  /// When the invocation ended.
  final DateTime? endTime;

  /// An error message.
  final String? failureMessage;

  /// When the invocation was last modified.
  final DateTime? lastModifiedTime;

  /// The invocation's status.
  final AsyncInvokeStatus? status;

  AsyncInvokeSummary({
    required this.invocationArn,
    required this.modelArn,
    required this.outputDataConfig,
    required this.submitTime,
    this.clientRequestToken,
    this.endTime,
    this.failureMessage,
    this.lastModifiedTime,
    this.status,
  });

  factory AsyncInvokeSummary.fromJson(Map<String, dynamic> json) {
    return AsyncInvokeSummary(
      invocationArn: (json['invocationArn'] as String?) ?? '',
      modelArn: (json['modelArn'] as String?) ?? '',
      outputDataConfig: AsyncInvokeOutputDataConfig.fromJson(
          (json['outputDataConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      submitTime: nonNullableTimeStampFromJson(json['submitTime'] ?? 0),
      clientRequestToken: json['clientRequestToken'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      failureMessage: json['failureMessage'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      status: (json['status'] as String?)?.let(AsyncInvokeStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final invocationArn = this.invocationArn;
    final modelArn = this.modelArn;
    final outputDataConfig = this.outputDataConfig;
    final submitTime = this.submitTime;
    final clientRequestToken = this.clientRequestToken;
    final endTime = this.endTime;
    final failureMessage = this.failureMessage;
    final lastModifiedTime = this.lastModifiedTime;
    final status = this.status;
    return {
      'invocationArn': invocationArn,
      'modelArn': modelArn,
      'outputDataConfig': outputDataConfig,
      'submitTime': iso8601ToJson(submitTime),
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (status != null) 'status': status.value,
    };
  }
}

class AsyncInvokeStatus {
  static const inProgress = AsyncInvokeStatus._('InProgress');
  static const completed = AsyncInvokeStatus._('Completed');
  static const failed = AsyncInvokeStatus._('Failed');

  final String value;

  const AsyncInvokeStatus._(this.value);

  static const values = [inProgress, completed, failed];

  static AsyncInvokeStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AsyncInvokeStatus._(value));

  @override
  bool operator ==(other) => other is AsyncInvokeStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SortAsyncInvocationBy {
  static const submissionTime = SortAsyncInvocationBy._('SubmissionTime');

  final String value;

  const SortAsyncInvocationBy._(this.value);

  static const values = [submissionTime];

  static SortAsyncInvocationBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SortAsyncInvocationBy._(value));

  @override
  bool operator ==(other) =>
      other is SortAsyncInvocationBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SortOrder {
  static const ascending = SortOrder._('Ascending');
  static const descending = SortOrder._('Descending');

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
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
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
