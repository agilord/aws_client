// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'runtime.sagemaker-2017-05-13.g.dart';

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
          service: 'runtime.sagemaker',
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
  /// href="http://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html">Authenticating
  /// Requests (AWS Signature Version 4)</a> in the <i>Amazon S3 API
  /// Reference</i>.
  ///
  /// A customer's model containers must respond to requests within 60 seconds.
  /// The model itself can have a maximum processing time of 60 seconds before
  /// responding to the /invocations. If your model is going to take 50-60
  /// seconds of processing time, the SDK socket timeout should be set to be 70
  /// seconds.
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
  /// Data Formats—Inference</a>.
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
  /// This feature is currently supported in the AWS SDKs but not in the Amazon
  /// SageMaker Python SDK.
  ///
  /// Parameter [targetModel] :
  /// Specifies the model to be requested for an inference when invoking a
  /// multi-model endpoint.
  Future<InvokeEndpointOutput> invokeEndpoint({
    @_s.required Uint8List body,
    @_s.required String endpointName,
    String accept,
    String contentType,
    String customAttributes,
    String targetModel,
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
    final headers = <String, String>{};
    accept?.let((v) => headers['Accept'] = v.toString());
    contentType?.let((v) => headers['Content-Type'] = v.toString());
    customAttributes?.let(
        (v) => headers['X-Amzn-SageMaker-Custom-Attributes'] = v.toString());
    targetModel
        ?.let((v) => headers['X-Amzn-SageMaker-Target-Model'] = v.toString());
    final response = await _protocol.send(
      payload: body,
      headers: headers,
      method: 'POST',
      requestUri:
          '/endpoints/${Uri.encodeComponent(endpointName.toString())}/invocations',
      exceptionFnMap: _exceptionFns,
    );
    return InvokeEndpointOutput.fromJson(response);
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
  /// Data Formats—Inference</a>.
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
