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

/// The Amazon SageMaker AI runtime API.
class SageMakerRuntime {
  final _s.RestJsonProtocol _protocol;
  SageMakerRuntime({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'runtime.sagemaker',
            signingName: 'sagemaker',
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

  /// After you deploy a model into production using Amazon SageMaker AI hosting
  /// services, your client applications use this API to get inferences from the
  /// model hosted at the specified endpoint.
  ///
  /// For an overview of Amazon SageMaker AI, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How
  /// It Works</a>.
  ///
  /// Amazon SageMaker AI strips all POST headers except those supported by the
  /// API. Amazon SageMaker AI might add additional headers. You should not rely
  /// on the behavior of headers outside those enumerated in the request syntax.
  ///
  /// Calls to <code>InvokeEndpoint</code> are authenticated by using Amazon Web
  /// Services Signature Version 4. For information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html">Authenticating
  /// Requests (Amazon Web Services Signature Version 4)</a> in the <i>Amazon S3
  /// API Reference</i>.
  ///
  /// A customer's model containers must respond to requests within 60 seconds.
  /// The model itself can have a maximum processing time of 60 seconds before
  /// responding to invocations. If your model is going to take 50-60 seconds of
  /// processing time, the SDK socket timeout should be set to be 70 seconds.
  /// <note>
  /// Endpoints are scoped to an individual account, and are not public. The URL
  /// does not contain the account ID, but Amazon SageMaker AI determines the
  /// account ID from the authentication token that is supplied by the caller.
  /// </note>
  ///
  /// May throw [InternalDependencyException].
  /// May throw [InternalFailure].
  /// May throw [ModelError].
  /// May throw [ModelNotReadyException].
  /// May throw [ServiceUnavailable].
  /// May throw [ValidationError].
  ///
  /// Parameter [body] :
  /// Provides input data, in the format specified in the
  /// <code>ContentType</code> request header. Amazon SageMaker AI passes all of
  /// the data in the body to the model.
  ///
  /// For information about the format of the request body, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/cdf-inference.html">Common
  /// Data Formats-Inference</a>.
  ///
  /// Parameter [endpointName] :
  /// The name of the endpoint that you specified when you created the endpoint
  /// using the <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateEndpoint.html">CreateEndpoint</a>
  /// API.
  ///
  /// Parameter [accept] :
  /// The desired MIME type of the inference response from the model container.
  ///
  /// Parameter [contentType] :
  /// The MIME type of the input data in the request body.
  ///
  /// Parameter [customAttributes] :
  /// Provides additional information about a request for an inference submitted
  /// to a model hosted at an Amazon SageMaker AI endpoint. The information is
  /// an opaque value that is forwarded verbatim. You could use this value, for
  /// example, to provide an ID that you can use to track a request or to
  /// provide other metadata that a service endpoint was programmed to process.
  /// The value must consist of no more than 1024 visible US-ASCII characters as
  /// specified in <a
  /// href="https://datatracker.ietf.org/doc/html/rfc7230#section-3.2.6">Section
  /// 3.3.6. Field Value Components</a> of the Hypertext Transfer Protocol
  /// (HTTP/1.1).
  ///
  /// The code in your model is responsible for setting or updating any custom
  /// attributes in the response. If your code does not set this value in the
  /// response, an empty value is returned. For example, if a custom attribute
  /// represents the trace ID, your model can prepend the custom attribute with
  /// <code>Trace ID:</code> in your post-processing function.
  ///
  /// This feature is currently supported in the Amazon Web Services SDKs but
  /// not in the Amazon SageMaker AI Python SDK.
  ///
  /// Parameter [enableExplanations] :
  /// An optional JMESPath expression used to override the
  /// <code>EnableExplanations</code> parameter of the
  /// <code>ClarifyExplainerConfig</code> API. See the <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/clarify-online-explainability-create-endpoint.html#clarify-online-explainability-create-endpoint-enable">EnableExplanations</a>
  /// section in the developer guide for more information.
  ///
  /// Parameter [inferenceComponentName] :
  /// If the endpoint hosts one or more inference components, this parameter
  /// specifies the name of inference component to invoke.
  ///
  /// Parameter [inferenceId] :
  /// If you provide a value, it is added to the captured data when you enable
  /// data capture on the endpoint. For information about data capture, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/model-monitor-data-capture.html">Capture
  /// Data</a>.
  ///
  /// Parameter [sessionId] :
  /// Creates a stateful session or identifies an existing one. You can do one
  /// of the following:
  ///
  /// <ul>
  /// <li>
  /// Create a stateful session by specifying the value
  /// <code>NEW_SESSION</code>.
  /// </li>
  /// <li>
  /// Send your request to an existing stateful session by specifying the ID of
  /// that session.
  /// </li>
  /// </ul>
  /// With a stateful session, you can send multiple requests to a stateful
  /// model. When you create a session with a stateful model, the model must
  /// create the session ID and set the expiration time. The model must also
  /// provide that information in the response to your request. You can get the
  /// ID and timestamp from the <code>NewSessionId</code> response parameter.
  /// For any subsequent request where you specify that session ID, SageMaker AI
  /// routes the request to the same instance that supports the session.
  ///
  /// Parameter [targetContainerHostname] :
  /// If the endpoint hosts multiple containers and is configured to use direct
  /// invocation, this parameter specifies the host name of the container to
  /// invoke.
  ///
  /// Parameter [targetModel] :
  /// The model to request for inference when invoking a multi-model endpoint.
  ///
  /// Parameter [targetVariant] :
  /// Specify the production variant to send the inference request to when
  /// invoking an endpoint that is running two or more variants. Note that this
  /// parameter overrides the default behavior for the endpoint, which is to
  /// distribute the invocation traffic based on the variant weights.
  ///
  /// For information about how to use variant targeting to perform a/b testing,
  /// see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/model-ab-testing.html">Test
  /// models in production</a>
  Future<InvokeEndpointOutput> invokeEndpoint({
    required Uint8List body,
    required String endpointName,
    String? accept,
    String? contentType,
    String? customAttributes,
    String? enableExplanations,
    String? inferenceComponentName,
    String? inferenceId,
    String? sessionId,
    String? targetContainerHostname,
    String? targetModel,
    String? targetVariant,
  }) async {
    final headers = <String, String>{
      if (accept != null) 'Accept': accept.toString(),
      if (contentType != null) 'Content-Type': contentType.toString(),
      if (customAttributes != null)
        'X-Amzn-SageMaker-Custom-Attributes': customAttributes.toString(),
      if (enableExplanations != null)
        'X-Amzn-SageMaker-Enable-Explanations': enableExplanations.toString(),
      if (inferenceComponentName != null)
        'X-Amzn-SageMaker-Inference-Component':
            inferenceComponentName.toString(),
      if (inferenceId != null)
        'X-Amzn-SageMaker-Inference-Id': inferenceId.toString(),
      if (sessionId != null)
        'X-Amzn-SageMaker-Session-Id': sessionId.toString(),
      if (targetContainerHostname != null)
        'X-Amzn-SageMaker-Target-Container-Hostname':
            targetContainerHostname.toString(),
      if (targetModel != null)
        'X-Amzn-SageMaker-Target-Model': targetModel.toString(),
      if (targetVariant != null)
        'X-Amzn-SageMaker-Target-Variant': targetVariant.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: body,
      method: 'POST',
      requestUri: '/endpoints/${Uri.encodeComponent(endpointName)}/invocations',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return InvokeEndpointOutput(
      body: await response.stream.toBytes(),
      closedSessionId: _s.extractHeaderStringValue(
          response.headers, 'X-Amzn-SageMaker-Closed-Session-Id'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      customAttributes: _s.extractHeaderStringValue(
          response.headers, 'X-Amzn-SageMaker-Custom-Attributes'),
      invokedProductionVariant: _s.extractHeaderStringValue(
          response.headers, 'x-Amzn-Invoked-Production-Variant'),
      newSessionId: _s.extractHeaderStringValue(
          response.headers, 'X-Amzn-SageMaker-New-Session-Id'),
    );
  }

  /// After you deploy a model into production using Amazon SageMaker AI hosting
  /// services, your client applications use this API to get inferences from the
  /// model hosted at the specified endpoint in an asynchronous manner.
  ///
  /// Inference requests sent to this API are enqueued for asynchronous
  /// processing. The processing of the inference request may or may not
  /// complete before you receive a response from this API. The response from
  /// this API will not contain the result of the inference request but contain
  /// information about where you can locate it.
  ///
  /// Amazon SageMaker AI strips all POST headers except those supported by the
  /// API. Amazon SageMaker AI might add additional headers. You should not rely
  /// on the behavior of headers outside those enumerated in the request syntax.
  ///
  /// Calls to <code>InvokeEndpointAsync</code> are authenticated by using
  /// Amazon Web Services Signature Version 4. For information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html">Authenticating
  /// Requests (Amazon Web Services Signature Version 4)</a> in the <i>Amazon S3
  /// API Reference</i>.
  ///
  /// May throw [InternalFailure].
  /// May throw [ServiceUnavailable].
  /// May throw [ValidationError].
  ///
  /// Parameter [endpointName] :
  /// The name of the endpoint that you specified when you created the endpoint
  /// using the <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateEndpoint.html">CreateEndpoint</a>
  /// API.
  ///
  /// Parameter [inputLocation] :
  /// The Amazon S3 URI where the inference request payload is stored.
  ///
  /// Parameter [accept] :
  /// The desired MIME type of the inference response from the model container.
  ///
  /// Parameter [contentType] :
  /// The MIME type of the input data in the request body.
  ///
  /// Parameter [customAttributes] :
  /// Provides additional information about a request for an inference submitted
  /// to a model hosted at an Amazon SageMaker AI endpoint. The information is
  /// an opaque value that is forwarded verbatim. You could use this value, for
  /// example, to provide an ID that you can use to track a request or to
  /// provide other metadata that a service endpoint was programmed to process.
  /// The value must consist of no more than 1024 visible US-ASCII characters as
  /// specified in <a
  /// href="https://datatracker.ietf.org/doc/html/rfc7230#section-3.2.6">Section
  /// 3.3.6. Field Value Components</a> of the Hypertext Transfer Protocol
  /// (HTTP/1.1).
  ///
  /// The code in your model is responsible for setting or updating any custom
  /// attributes in the response. If your code does not set this value in the
  /// response, an empty value is returned. For example, if a custom attribute
  /// represents the trace ID, your model can prepend the custom attribute with
  /// <code>Trace ID:</code> in your post-processing function.
  ///
  /// This feature is currently supported in the Amazon Web Services SDKs but
  /// not in the Amazon SageMaker AI Python SDK.
  ///
  /// Parameter [filename] :
  /// The filename for the inference response payload stored in Amazon S3. If
  /// not specified, Amazon SageMaker AI generates a filename based on the
  /// inference ID.
  ///
  /// Parameter [inferenceId] :
  /// The identifier for the inference request. Amazon SageMaker AI will
  /// generate an identifier for you if none is specified.
  ///
  /// Parameter [invocationTimeoutSeconds] :
  /// Maximum amount of time in seconds a request can be processed before it is
  /// marked as expired. The default is 15 minutes, or 900 seconds.
  ///
  /// Parameter [requestTTLSeconds] :
  /// Maximum age in seconds a request can be in the queue before it is marked
  /// as expired. The default is 6 hours, or 21,600 seconds.
  ///
  /// Parameter [s3OutputPathExtension] :
  /// The path extension that is appended to the Amazon S3 output path where the
  /// inference response payload is stored.
  Future<InvokeEndpointAsyncOutput> invokeEndpointAsync({
    required String endpointName,
    required String inputLocation,
    String? accept,
    String? contentType,
    String? customAttributes,
    String? filename,
    String? inferenceId,
    int? invocationTimeoutSeconds,
    int? requestTTLSeconds,
    String? s3OutputPathExtension,
  }) async {
    _s.validateNumRange(
      'invocationTimeoutSeconds',
      invocationTimeoutSeconds,
      1,
      3600,
    );
    _s.validateNumRange(
      'requestTTLSeconds',
      requestTTLSeconds,
      60,
      21600,
    );
    final headers = <String, String>{
      'X-Amzn-SageMaker-InputLocation': inputLocation.toString(),
      if (accept != null) 'X-Amzn-SageMaker-Accept': accept.toString(),
      if (contentType != null)
        'X-Amzn-SageMaker-Content-Type': contentType.toString(),
      if (customAttributes != null)
        'X-Amzn-SageMaker-Custom-Attributes': customAttributes.toString(),
      if (filename != null) 'X-Amzn-SageMaker-Filename': filename.toString(),
      if (inferenceId != null)
        'X-Amzn-SageMaker-Inference-Id': inferenceId.toString(),
      if (invocationTimeoutSeconds != null)
        'X-Amzn-SageMaker-InvocationTimeoutSeconds':
            invocationTimeoutSeconds.toString(),
      if (requestTTLSeconds != null)
        'X-Amzn-SageMaker-RequestTTLSeconds': requestTTLSeconds.toString(),
      if (s3OutputPathExtension != null)
        'X-Amzn-SageMaker-S3OutputPathExtension':
            s3OutputPathExtension.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri:
          '/endpoints/${Uri.encodeComponent(endpointName)}/async-invocations',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return InvokeEndpointAsyncOutput(
      inferenceId: $json['InferenceId'] as String?,
      failureLocation: _s.extractHeaderStringValue(
          response.headers, 'X-Amzn-SageMaker-FailureLocation'),
      outputLocation: _s.extractHeaderStringValue(
          response.headers, 'X-Amzn-SageMaker-OutputLocation'),
    );
  }

  /// Invokes a model at the specified endpoint to return the inference response
  /// as a stream. The inference stream provides the response payload
  /// incrementally as a series of parts. Before you can get an inference
  /// stream, you must have access to a model that's deployed using Amazon
  /// SageMaker AI hosting services, and the container for that model must
  /// support inference streaming.
  ///
  /// For more information that can help you use this API, see the following
  /// sections in the <i>Amazon SageMaker AI Developer Guide</i>:
  ///
  /// <ul>
  /// <li>
  /// For information about how to add streaming support to a model, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms-inference-code.html#your-algorithms-inference-code-how-containe-serves-requests">How
  /// Containers Serve Requests</a>.
  /// </li>
  /// <li>
  /// For information about how to process the streaming response, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/realtime-endpoints-test-endpoints.html">Invoke
  /// real-time endpoints</a>.
  /// </li>
  /// </ul>
  /// Before you can use this operation, your IAM permissions must allow the
  /// <code>sagemaker:InvokeEndpoint</code> action. For more information about
  /// Amazon SageMaker AI actions for IAM policies, see <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_amazonsagemaker.html">Actions,
  /// resources, and condition keys for Amazon SageMaker AI</a> in the <i>IAM
  /// Service Authorization Reference</i>.
  ///
  /// Amazon SageMaker AI strips all POST headers except those supported by the
  /// API. Amazon SageMaker AI might add additional headers. You should not rely
  /// on the behavior of headers outside those enumerated in the request syntax.
  ///
  /// Calls to <code>InvokeEndpointWithResponseStream</code> are authenticated
  /// by using Amazon Web Services Signature Version 4. For information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html">Authenticating
  /// Requests (Amazon Web Services Signature Version 4)</a> in the <i>Amazon S3
  /// API Reference</i>.
  ///
  /// May throw [InternalFailure].
  /// May throw [InternalStreamFailure].
  /// May throw [ModelError].
  /// May throw [ModelStreamError].
  /// May throw [ServiceUnavailable].
  /// May throw [ValidationError].
  ///
  /// Parameter [body] :
  /// Provides input data, in the format specified in the
  /// <code>ContentType</code> request header. Amazon SageMaker AI passes all of
  /// the data in the body to the model.
  ///
  /// For information about the format of the request body, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/cdf-inference.html">Common
  /// Data Formats-Inference</a>.
  ///
  /// Parameter [endpointName] :
  /// The name of the endpoint that you specified when you created the endpoint
  /// using the <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateEndpoint.html">CreateEndpoint</a>
  /// API.
  ///
  /// Parameter [accept] :
  /// The desired MIME type of the inference response from the model container.
  ///
  /// Parameter [contentType] :
  /// The MIME type of the input data in the request body.
  ///
  /// Parameter [customAttributes] :
  /// Provides additional information about a request for an inference submitted
  /// to a model hosted at an Amazon SageMaker AI endpoint. The information is
  /// an opaque value that is forwarded verbatim. You could use this value, for
  /// example, to provide an ID that you can use to track a request or to
  /// provide other metadata that a service endpoint was programmed to process.
  /// The value must consist of no more than 1024 visible US-ASCII characters as
  /// specified in <a
  /// href="https://datatracker.ietf.org/doc/html/rfc7230#section-3.2.6">Section
  /// 3.3.6. Field Value Components</a> of the Hypertext Transfer Protocol
  /// (HTTP/1.1).
  ///
  /// The code in your model is responsible for setting or updating any custom
  /// attributes in the response. If your code does not set this value in the
  /// response, an empty value is returned. For example, if a custom attribute
  /// represents the trace ID, your model can prepend the custom attribute with
  /// <code>Trace ID:</code> in your post-processing function.
  ///
  /// This feature is currently supported in the Amazon Web Services SDKs but
  /// not in the Amazon SageMaker AI Python SDK.
  ///
  /// Parameter [inferenceComponentName] :
  /// If the endpoint hosts one or more inference components, this parameter
  /// specifies the name of inference component to invoke for a streaming
  /// response.
  ///
  /// Parameter [inferenceId] :
  /// An identifier that you assign to your request.
  ///
  /// Parameter [sessionId] :
  /// The ID of a stateful session to handle your request.
  ///
  /// You can't create a stateful session by using the
  /// <code>InvokeEndpointWithResponseStream</code> action. Instead, you can
  /// create one by using the <code> <a>InvokeEndpoint</a> </code> action. In
  /// your request, you specify <code>NEW_SESSION</code> for the
  /// <code>SessionId</code> request parameter. The response to that request
  /// provides the session ID for the <code>NewSessionId</code> response
  /// parameter.
  ///
  /// Parameter [targetContainerHostname] :
  /// If the endpoint hosts multiple containers and is configured to use direct
  /// invocation, this parameter specifies the host name of the container to
  /// invoke.
  ///
  /// Parameter [targetVariant] :
  /// Specify the production variant to send the inference request to when
  /// invoking an endpoint that is running two or more variants. Note that this
  /// parameter overrides the default behavior for the endpoint, which is to
  /// distribute the invocation traffic based on the variant weights.
  ///
  /// For information about how to use variant targeting to perform a/b testing,
  /// see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/model-ab-testing.html">Test
  /// models in production</a>
  Future<InvokeEndpointWithResponseStreamOutput>
      invokeEndpointWithResponseStream({
    required Uint8List body,
    required String endpointName,
    String? accept,
    String? contentType,
    String? customAttributes,
    String? inferenceComponentName,
    String? inferenceId,
    String? sessionId,
    String? targetContainerHostname,
    String? targetVariant,
  }) async {
    final headers = <String, String>{
      if (accept != null) 'X-Amzn-SageMaker-Accept': accept.toString(),
      if (contentType != null) 'Content-Type': contentType.toString(),
      if (customAttributes != null)
        'X-Amzn-SageMaker-Custom-Attributes': customAttributes.toString(),
      if (inferenceComponentName != null)
        'X-Amzn-SageMaker-Inference-Component':
            inferenceComponentName.toString(),
      if (inferenceId != null)
        'X-Amzn-SageMaker-Inference-Id': inferenceId.toString(),
      if (sessionId != null)
        'X-Amzn-SageMaker-Session-Id': sessionId.toString(),
      if (targetContainerHostname != null)
        'X-Amzn-SageMaker-Target-Container-Hostname':
            targetContainerHostname.toString(),
      if (targetVariant != null)
        'X-Amzn-SageMaker-Target-Variant': targetVariant.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: body,
      method: 'POST',
      requestUri:
          '/endpoints/${Uri.encodeComponent(endpointName)}/invocations-response-stream',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return InvokeEndpointWithResponseStreamOutput(
      body: ResponseStream.fromJson($json),
      contentType: _s.extractHeaderStringValue(
          response.headers, 'X-Amzn-SageMaker-Content-Type'),
      customAttributes: _s.extractHeaderStringValue(
          response.headers, 'X-Amzn-SageMaker-Custom-Attributes'),
      invokedProductionVariant: _s.extractHeaderStringValue(
          response.headers, 'x-Amzn-Invoked-Production-Variant'),
    );
  }
}

/// @nodoc
class InvokeEndpointOutput {
  /// Includes the inference provided by the model.
  ///
  /// For information about the format of the response body, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/cdf-inference.html">Common
  /// Data Formats-Inference</a>.
  ///
  /// If the explainer is activated, the body includes the explanations provided
  /// by the model. For more information, see the <b>Response section</b> under <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/clarify-online-explainability-invoke-endpoint.html#clarify-online-explainability-response">Invoke
  /// the Endpoint</a> in the Developer Guide.
  final Uint8List body;

  /// If you closed a stateful session with your request, the ID of that session.
  final String? closedSessionId;

  /// The MIME type of the inference returned from the model container.
  final String? contentType;

  /// Provides additional information in the response about the inference returned
  /// by a model hosted at an Amazon SageMaker AI endpoint. The information is an
  /// opaque value that is forwarded verbatim. You could use this value, for
  /// example, to return an ID received in the <code>CustomAttributes</code>
  /// header of a request or other metadata that a service endpoint was programmed
  /// to produce. The value must consist of no more than 1024 visible US-ASCII
  /// characters as specified in <a
  /// href="https://tools.ietf.org/html/rfc7230#section-3.2.6">Section 3.3.6.
  /// Field Value Components</a> of the Hypertext Transfer Protocol (HTTP/1.1). If
  /// the customer wants the custom attribute returned, the model must set the
  /// custom attribute to be included on the way back.
  ///
  /// The code in your model is responsible for setting or updating any custom
  /// attributes in the response. If your code does not set this value in the
  /// response, an empty value is returned. For example, if a custom attribute
  /// represents the trace ID, your model can prepend the custom attribute with
  /// <code>Trace ID:</code> in your post-processing function.
  ///
  /// This feature is currently supported in the Amazon Web Services SDKs but not
  /// in the Amazon SageMaker AI Python SDK.
  final String? customAttributes;

  /// Identifies the production variant that was invoked.
  final String? invokedProductionVariant;

  /// If you created a stateful session with your request, the ID and expiration
  /// time that the model assigns to that session.
  final String? newSessionId;

  InvokeEndpointOutput({
    required this.body,
    this.closedSessionId,
    this.contentType,
    this.customAttributes,
    this.invokedProductionVariant,
    this.newSessionId,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final closedSessionId = this.closedSessionId;
    final contentType = this.contentType;
    final customAttributes = this.customAttributes;
    final invokedProductionVariant = this.invokedProductionVariant;
    final newSessionId = this.newSessionId;
    return {
      'Body': base64Encode(body),
    };
  }
}

/// @nodoc
class InvokeEndpointAsyncOutput {
  /// The Amazon S3 URI where the inference failure response payload is stored.
  final String? failureLocation;

  /// Identifier for an inference request. This will be the same as the
  /// <code>InferenceId</code> specified in the input. Amazon SageMaker AI will
  /// generate an identifier for you if you do not specify one.
  final String? inferenceId;

  /// The Amazon S3 URI where the inference response payload is stored.
  final String? outputLocation;

  InvokeEndpointAsyncOutput({
    this.failureLocation,
    this.inferenceId,
    this.outputLocation,
  });

  Map<String, dynamic> toJson() {
    final failureLocation = this.failureLocation;
    final inferenceId = this.inferenceId;
    final outputLocation = this.outputLocation;
    return {
      if (inferenceId != null) 'InferenceId': inferenceId,
    };
  }
}

/// @nodoc
class InvokeEndpointWithResponseStreamOutput {
  final ResponseStream body;

  /// The MIME type of the inference returned from the model container.
  final String? contentType;

  /// Provides additional information in the response about the inference returned
  /// by a model hosted at an Amazon SageMaker AI endpoint. The information is an
  /// opaque value that is forwarded verbatim. You could use this value, for
  /// example, to return an ID received in the <code>CustomAttributes</code>
  /// header of a request or other metadata that a service endpoint was programmed
  /// to produce. The value must consist of no more than 1024 visible US-ASCII
  /// characters as specified in <a
  /// href="https://tools.ietf.org/html/rfc7230#section-3.2.6">Section 3.3.6.
  /// Field Value Components</a> of the Hypertext Transfer Protocol (HTTP/1.1). If
  /// the customer wants the custom attribute returned, the model must set the
  /// custom attribute to be included on the way back.
  ///
  /// The code in your model is responsible for setting or updating any custom
  /// attributes in the response. If your code does not set this value in the
  /// response, an empty value is returned. For example, if a custom attribute
  /// represents the trace ID, your model can prepend the custom attribute with
  /// <code>Trace ID:</code> in your post-processing function.
  ///
  /// This feature is currently supported in the Amazon Web Services SDKs but not
  /// in the Amazon SageMaker AI Python SDK.
  final String? customAttributes;

  /// Identifies the production variant that was invoked.
  final String? invokedProductionVariant;

  InvokeEndpointWithResponseStreamOutput({
    required this.body,
    this.contentType,
    this.customAttributes,
    this.invokedProductionVariant,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final contentType = this.contentType;
    final customAttributes = this.customAttributes;
    final invokedProductionVariant = this.invokedProductionVariant;
    return {
      'Body': body,
    };
  }
}

/// The stream processing failed because of an unknown error, exception or
/// failure. Try your request again.
///
/// @nodoc
class InternalStreamFailure implements _s.AwsException {
  final String? message;

  InternalStreamFailure({
    this.message,
  });

  factory InternalStreamFailure.fromJson(Map<String, dynamic> json) {
    return InternalStreamFailure(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// An error occurred while streaming the response body. This error can have the
/// following error codes:
/// <dl> <dt>ModelInvocationTimeExceeded</dt> <dd>
/// The model failed to finish sending the response within the timeout period
/// allowed by Amazon SageMaker AI.
/// </dd> <dt>StreamBroken</dt> <dd>
/// The Transmission Control Protocol (TCP) connection between the client and
/// the model was reset or closed.
/// </dd> </dl>
///
/// @nodoc
class ModelStreamError implements _s.AwsException {
  /// This error can have the following error codes:
  /// <dl> <dt>ModelInvocationTimeExceeded</dt> <dd>
  /// The model failed to finish sending the response within the timeout period
  /// allowed by Amazon SageMaker AI.
  /// </dd> <dt>StreamBroken</dt> <dd>
  /// The Transmission Control Protocol (TCP) connection between the client and
  /// the model was reset or closed.
  /// </dd> </dl>
  final String? errorCode;
  final String? message;

  ModelStreamError({
    this.errorCode,
    this.message,
  });

  factory ModelStreamError.fromJson(Map<String, dynamic> json) {
    return ModelStreamError(
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final message = this.message;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (message != null) 'Message': message,
    };
  }
}

/// A stream of payload parts. Each part contains a portion of the response for
/// a streaming inference request.
///
/// @nodoc
class ResponseStream {
  /// The stream processing failed because of an unknown error, exception or
  /// failure. Try your request again.
  final InternalStreamFailure? internalStreamFailure;

  /// An error occurred while streaming the response body. This error can have the
  /// following error codes:
  /// <dl> <dt>ModelInvocationTimeExceeded</dt> <dd>
  /// The model failed to finish sending the response within the timeout period
  /// allowed by Amazon SageMaker AI.
  /// </dd> <dt>StreamBroken</dt> <dd>
  /// The Transmission Control Protocol (TCP) connection between the client and
  /// the model was reset or closed.
  /// </dd> </dl>
  final ModelStreamError? modelStreamError;

  /// A wrapper for pieces of the payload that's returned in response to a
  /// streaming inference request. A streaming inference response consists of one
  /// or more payload parts.
  final PayloadPart? payloadPart;

  ResponseStream({
    this.internalStreamFailure,
    this.modelStreamError,
    this.payloadPart,
  });

  factory ResponseStream.fromJson(Map<String, dynamic> json) {
    return ResponseStream(
      internalStreamFailure: json['InternalStreamFailure'] != null
          ? InternalStreamFailure.fromJson(
              json['InternalStreamFailure'] as Map<String, dynamic>)
          : null,
      modelStreamError: json['ModelStreamError'] != null
          ? ModelStreamError.fromJson(
              json['ModelStreamError'] as Map<String, dynamic>)
          : null,
      payloadPart: json['PayloadPart'] != null
          ? PayloadPart.fromJson(json['PayloadPart'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final internalStreamFailure = this.internalStreamFailure;
    final modelStreamError = this.modelStreamError;
    final payloadPart = this.payloadPart;
    return {
      if (internalStreamFailure != null)
        'InternalStreamFailure': internalStreamFailure,
      if (modelStreamError != null) 'ModelStreamError': modelStreamError,
      if (payloadPart != null) 'PayloadPart': payloadPart,
    };
  }
}

/// A wrapper for pieces of the payload that's returned in response to a
/// streaming inference request. A streaming inference response consists of one
/// or more payload parts.
///
/// @nodoc
class PayloadPart {
  /// A blob that contains part of the response for your streaming inference
  /// request.
  final Uint8List? bytes;

  PayloadPart({
    this.bytes,
  });

  factory PayloadPart.fromJson(Map<String, dynamic> json) {
    return PayloadPart(
      bytes: _s.decodeNullableUint8List(json['Bytes'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final bytes = this.bytes;
    return {
      if (bytes != null) 'Bytes': base64Encode(bytes),
    };
  }
}

/// @nodoc
class InternalDependencyException extends _s.GenericAwsException {
  InternalDependencyException({String? type, String? message})
      : super(
            type: type, code: 'InternalDependencyException', message: message);
}

/// @nodoc
class InternalFailure extends _s.GenericAwsException {
  InternalFailure({String? type, String? message})
      : super(type: type, code: 'InternalFailure', message: message);
}

/// @nodoc
class ModelError extends _s.GenericAwsException {
  ModelError({String? type, String? message})
      : super(type: type, code: 'ModelError', message: message);
}

/// @nodoc
class ModelNotReadyException extends _s.GenericAwsException {
  ModelNotReadyException({String? type, String? message})
      : super(type: type, code: 'ModelNotReadyException', message: message);
}

/// @nodoc
class ServiceUnavailable extends _s.GenericAwsException {
  ServiceUnavailable({String? type, String? message})
      : super(type: type, code: 'ServiceUnavailable', message: message);
}

/// @nodoc
class ValidationError extends _s.GenericAwsException {
  ValidationError({String? type, String? message})
      : super(type: type, code: 'ValidationError', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalDependencyException': (type, message) =>
      InternalDependencyException(type: type, message: message),
  'InternalFailure': (type, message) =>
      InternalFailure(type: type, message: message),
  'InternalStreamFailure': (type, message) =>
      InternalStreamFailure(message: message),
  'ModelError': (type, message) => ModelError(type: type, message: message),
  'ModelNotReadyException': (type, message) =>
      ModelNotReadyException(type: type, message: message),
  'ModelStreamError': (type, message) => ModelStreamError(message: message),
  'ServiceUnavailable': (type, message) =>
      ServiceUnavailable(type: type, message: message),
  'ValidationError': (type, message) =>
      ValidationError(type: type, message: message),
};
