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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2017-05-13.g.dart';

/// The Amazon SageMaker runtime API.
class SageMakerRuntime {
  final _s.RestJsonProtocol _protocol;
  SageMakerRuntime({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'runtime.sagemaker',
            signingName: 'sagemaker',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// After you deploy a model into production using Amazon SageMaker hosting
  /// services, your client applications use this API to get inferences from the
  /// model hosted at the specified endpoint.
  ///
  /// For an overview of Amazon SageMaker, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How
  /// It Works</a>.
  ///
  /// Amazon SageMaker strips all POST headers except those supported by the
  /// API. Amazon SageMaker might add additional headers. You should not rely on
  /// the behavior of headers outside those enumerated in the request syntax.
  ///
  /// Calls to <code>InvokeEndpoint</code> are authenticated by using AWS
  /// Signature Version 4. For information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html">Authenticating
  /// Requests (AWS Signature Version 4)</a> in the <i>Amazon S3 API
  /// Reference</i>.
  ///
  /// A customer's model containers must respond to requests within 60 seconds.
  /// The model itself can have a maximum processing time of 60 seconds before
  /// responding to invocations. If your model is going to take 50-60 seconds of
  /// processing time, the SDK socket timeout should be set to be 70 seconds.
  /// <note>
  /// Endpoints are scoped to an individual account, and are not public. The URL
  /// does not contain the account ID, but Amazon SageMaker determines the
  /// account ID from the authentication token that is supplied by the caller.
  /// </note>
  ///
  /// May throw [InternalFailure].
  /// May throw [ServiceUnavailable].
  /// May throw [ValidationError].
  /// May throw [ModelError].
  ///
  /// Parameter [body] :
  /// Provides input data, in the format specified in the
  /// <code>ContentType</code> request header. Amazon SageMaker passes all of
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
  /// The desired MIME type of the inference in the response.
  ///
  /// Parameter [contentType] :
  /// The MIME type of the input data in the request body.
  ///
  /// Parameter [customAttributes] :
  /// Provides additional information about a request for an inference submitted
  /// to a model hosted at an Amazon SageMaker endpoint. The information is an
  /// opaque value that is forwarded verbatim. You could use this value, for
  /// example, to provide an ID that you can use to track a request or to
  /// provide other metadata that a service endpoint was programmed to process.
  /// The value must consist of no more than 1024 visible US-ASCII characters as
  /// specified in <a
  /// href="https://tools.ietf.org/html/rfc7230#section-3.2.6">Section 3.3.6.
  /// Field Value Components</a> of the Hypertext Transfer Protocol (HTTP/1.1).
  ///
  /// The code in your model is responsible for setting or updating any custom
  /// attributes in the response. If your code does not set this value in the
  /// response, an empty value is returned. For example, if a custom attribute
  /// represents the trace ID, your model can prepend the custom attribute with
  /// <code>Trace ID:</code> in your post-processing function.
  ///
  /// This feature is currently supported in the AWS SDKs but not in the Amazon
  /// SageMaker Python SDK.
  ///
  /// Parameter [inferenceId] :
  /// If you provide a value, it is added to the captured data when you enable
  /// data capture on the endpoint. For information about data capture, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/model-monitor-data-capture.html">Capture
  /// Data</a>.
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
    @_s.required Uint8List body,
    @_s.required String endpointName,
    String accept,
    String contentType,
    String customAttributes,
    String inferenceId,
    String targetModel,
    String targetVariant,
  }) async {
    ArgumentError.checkNotNull(body, 'body');
    ArgumentError.checkNotNull(endpointName, 'endpointName');
    _s.validateStringLength(
      'endpointName',
      endpointName,
      0,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'endpointName',
      endpointName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'accept',
      accept,
      0,
      1024,
    );
    _s.validateStringPattern(
      'accept',
      accept,
      r'''\p{ASCII}*''',
    );
    _s.validateStringLength(
      'contentType',
      contentType,
      0,
      1024,
    );
    _s.validateStringPattern(
      'contentType',
      contentType,
      r'''\p{ASCII}*''',
    );
    _s.validateStringLength(
      'customAttributes',
      customAttributes,
      0,
      1024,
    );
    _s.validateStringPattern(
      'customAttributes',
      customAttributes,
      r'''\p{ASCII}*''',
    );
    _s.validateStringLength(
      'inferenceId',
      inferenceId,
      1,
      64,
    );
    _s.validateStringPattern(
      'inferenceId',
      inferenceId,
      r'''\A\S[\p{Print}]*\z''',
    );
    _s.validateStringLength(
      'targetModel',
      targetModel,
      1,
      1024,
    );
    _s.validateStringPattern(
      'targetModel',
      targetModel,
      r'''\A\S[\p{Print}]*\z''',
    );
    _s.validateStringLength(
      'targetVariant',
      targetVariant,
      0,
      63,
    );
    _s.validateStringPattern(
      'targetVariant',
      targetVariant,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{};
    accept?.let((v) => headers['Accept'] = v.toString());
    contentType?.let((v) => headers['Content-Type'] = v.toString());
    customAttributes?.let(
        (v) => headers['X-Amzn-SageMaker-Custom-Attributes'] = v.toString());
    inferenceId
        ?.let((v) => headers['X-Amzn-SageMaker-Inference-Id'] = v.toString());
    targetModel
        ?.let((v) => headers['X-Amzn-SageMaker-Target-Model'] = v.toString());
    targetVariant
        ?.let((v) => headers['X-Amzn-SageMaker-Target-Variant'] = v.toString());
    final response = await _protocol.sendRaw(
      payload: body,
      method: 'POST',
      requestUri: '/endpoints/${Uri.encodeComponent(endpointName)}/invocations',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return InvokeEndpointOutput(
      body: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      customAttributes: _s.extractHeaderStringValue(
          response.headers, 'X-Amzn-SageMaker-Custom-Attributes'),
      invokedProductionVariant: _s.extractHeaderStringValue(
          response.headers, 'x-Amzn-Invoked-Production-Variant'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InvokeEndpointOutput {
  /// Includes the inference provided by the model.
  ///
  /// For information about the format of the response body, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/cdf-inference.html">Common
  /// Data Formats-Inference</a>.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Body')
  final Uint8List body;

  /// The MIME type of the inference returned in the response body.
  @_s.JsonKey(name: 'Content-Type')
  final String contentType;

  /// Provides additional information in the response about the inference returned
  /// by a model hosted at an Amazon SageMaker endpoint. The information is an
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
  /// This feature is currently supported in the AWS SDKs but not in the Amazon
  /// SageMaker Python SDK.
  @_s.JsonKey(name: 'X-Amzn-SageMaker-Custom-Attributes')
  final String customAttributes;

  /// Identifies the production variant that was invoked.
  @_s.JsonKey(name: 'x-Amzn-Invoked-Production-Variant')
  final String invokedProductionVariant;

  InvokeEndpointOutput({
    @_s.required this.body,
    this.contentType,
    this.customAttributes,
    this.invokedProductionVariant,
  });
  factory InvokeEndpointOutput.fromJson(Map<String, dynamic> json) =>
      _$InvokeEndpointOutputFromJson(json);
}

class InternalFailure extends _s.GenericAwsException {
  InternalFailure({String type, String message})
      : super(type: type, code: 'InternalFailure', message: message);
}

class ModelError extends _s.GenericAwsException {
  ModelError({String type, String message})
      : super(type: type, code: 'ModelError', message: message);
}

class ServiceUnavailable extends _s.GenericAwsException {
  ServiceUnavailable({String type, String message})
      : super(type: type, code: 'ServiceUnavailable', message: message);
}

class ValidationError extends _s.GenericAwsException {
  ValidationError({String type, String message})
      : super(type: type, code: 'ValidationError', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalFailure': (type, message) =>
      InternalFailure(type: type, message: message),
  'ModelError': (type, message) => ModelError(type: type, message: message),
  'ServiceUnavailable': (type, message) =>
      ServiceUnavailable(type: type, message: message),
  'ValidationError': (type, message) =>
      ValidationError(type: type, message: message),
};
