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

/// The Amazon SageMaker AI runtime HTTP/2 API.
class SageMakerRuntimeHttp2 {
  final _s.RestJsonProtocol _protocol;
  SageMakerRuntimeHttp2({
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

  /// Invokes a model endpoint with bidirectional streaming capabilities. This
  /// operation establishes a persistent connection that allows you to send
  /// multiple requests and receive streaming responses from the model in
  /// real-time.
  ///
  /// Bidirectional streaming is useful for interactive applications such as
  /// chatbots, real-time translation, or any scenario where you need to
  /// maintain a conversation-like interaction with the model. The connection
  /// remains open, allowing you to send additional input and receive responses
  /// without establishing a new connection for each request.
  ///
  /// For an overview of Amazon SageMaker AI, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How
  /// It Works</a>.
  ///
  /// Amazon SageMaker AI strips all POST headers except those supported by the
  /// API. Amazon SageMaker AI might add additional headers. You should not rely
  /// on the behavior of headers outside those enumerated in the request syntax.
  ///
  /// Calls to <code>InvokeEndpointWithBidirectionalStream</code> are
  /// authenticated by using Amazon Web Services Signature Version 4. For
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html">Authenticating
  /// Requests (Amazon Web Services Signature Version 4)</a> in the <i>Amazon S3
  /// API Reference</i>.
  ///
  /// The bidirectional stream maintains the connection until either the client
  /// closes it or the model indicates completion. Each request and response in
  /// the stream is sent as an event with optional headers for data type and
  /// completion state.
  /// <note>
  /// Endpoints are scoped to an individual account, and are not public. The URL
  /// does not contain the account ID, but Amazon SageMaker AI determines the
  /// account ID from the authentication token that is supplied by the caller.
  /// </note>
  ///
  /// May throw [InputValidationError].
  /// May throw [InternalServerError].
  /// May throw [InternalStreamFailure].
  /// May throw [ModelError].
  /// May throw [ModelStreamError].
  /// May throw [ServiceUnavailableError].
  ///
  /// Parameter [body] :
  /// The request payload stream.
  ///
  /// Parameter [endpointName] :
  /// The name of the endpoint to invoke.
  ///
  /// Parameter [modelInvocationPath] :
  /// Model invocation path.
  ///
  /// Parameter [modelQueryString] :
  /// Model query string.
  ///
  /// Parameter [targetVariant] :
  /// Target variant for the request.
  Future<InvokeEndpointWithBidirectionalStreamOutput>
      invokeEndpointWithBidirectionalStream({
    required RequestStreamEvent body,
    required String endpointName,
    String? modelInvocationPath,
    String? modelQueryString,
    String? targetVariant,
  }) async {
    final headers = <String, String>{
      if (modelInvocationPath != null)
        'X-Amzn-SageMaker-Model-Invocation-Path':
            modelInvocationPath.toString(),
      if (modelQueryString != null)
        'X-Amzn-SageMaker-Model-Query-String': modelQueryString.toString(),
      if (targetVariant != null)
        'X-Amzn-SageMaker-Target-Variant': targetVariant.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: body,
      method: 'POST',
      requestUri:
          '/endpoints/${Uri.encodeComponent(endpointName)}/invocations-bidirectional-stream',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return InvokeEndpointWithBidirectionalStreamOutput(
      body: ResponseStreamEvent.fromJson($json),
      invokedProductionVariant: _s.extractHeaderStringValue(
          response.headers, 'X-Amzn-Invoked-Production-Variant'),
    );
  }
}

/// @nodoc
class InvokeEndpointWithBidirectionalStreamOutput {
  /// The response payload stream.
  final ResponseStreamEvent body;

  /// The invoked production variant.
  final String? invokedProductionVariant;

  InvokeEndpointWithBidirectionalStreamOutput({
    required this.body,
    this.invokedProductionVariant,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final invokedProductionVariant = this.invokedProductionVariant;
    return {
      'Body': body,
    };
  }
}

/// Internal stream failure that occurs during streaming.
///
/// @nodoc
class InternalStreamFailure implements _s.AwsException {
  /// Error message.
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

/// Model stream error that occurs during streaming.
///
/// @nodoc
class ModelStreamError implements _s.AwsException {
  /// Error code.
  final String? errorCode;

  /// Error message.
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

/// Response stream event union.
///
/// @nodoc
class ResponseStreamEvent {
  /// Internal stream failure event.
  final InternalStreamFailure? internalStreamFailure;

  /// Model stream error event.
  final ModelStreamError? modelStreamError;

  /// Payload part event.
  final ResponsePayloadPart? payloadPart;

  ResponseStreamEvent({
    this.internalStreamFailure,
    this.modelStreamError,
    this.payloadPart,
  });

  factory ResponseStreamEvent.fromJson(Map<String, dynamic> json) {
    return ResponseStreamEvent(
      internalStreamFailure: json['InternalStreamFailure'] != null
          ? InternalStreamFailure.fromJson(
              json['InternalStreamFailure'] as Map<String, dynamic>)
          : null,
      modelStreamError: json['ModelStreamError'] != null
          ? ModelStreamError.fromJson(
              json['ModelStreamError'] as Map<String, dynamic>)
          : null,
      payloadPart: json['PayloadPart'] != null
          ? ResponsePayloadPart.fromJson(
              json['PayloadPart'] as Map<String, dynamic>)
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

/// Response payload part structure.
///
/// @nodoc
class ResponsePayloadPart {
  /// The payload bytes.
  final Uint8List? bytes;

  /// Completion state header. Can be one of these possible values: "PARTIAL",
  /// "COMPLETE".
  final String? completionState;

  /// Data type header. Can be one of these possible values: "UTF8", "BINARY".
  final String? dataType;

  /// Padding string for alignment.
  final String? p;

  ResponsePayloadPart({
    this.bytes,
    this.completionState,
    this.dataType,
    this.p,
  });

  factory ResponsePayloadPart.fromJson(Map<String, dynamic> json) {
    return ResponsePayloadPart(
      bytes: _s.decodeNullableUint8List(json['Bytes'] as String?),
      completionState: json['CompletionState'] as String?,
      dataType: json['DataType'] as String?,
      p: json['P'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bytes = this.bytes;
    final completionState = this.completionState;
    final dataType = this.dataType;
    final p = this.p;
    return {
      if (bytes != null) 'Bytes': base64Encode(bytes),
      if (completionState != null) 'CompletionState': completionState,
      if (dataType != null) 'DataType': dataType,
      if (p != null) 'P': p,
    };
  }
}

/// Request stream event union.
///
/// @nodoc
class RequestStreamEvent {
  /// Payload part event.
  final RequestPayloadPart? payloadPart;

  RequestStreamEvent({
    this.payloadPart,
  });

  Map<String, dynamic> toJson() {
    final payloadPart = this.payloadPart;
    return {
      if (payloadPart != null) 'PayloadPart': payloadPart,
    };
  }
}

/// Request payload part structure.
///
/// @nodoc
class RequestPayloadPart {
  /// The payload bytes.
  final Uint8List? bytes;

  /// Completion state header. Can be one of these possible values: "PARTIAL",
  /// "COMPLETE".
  final String? completionState;

  /// Data type header. Can be one of these possible values: "UTF8", "BINARY".
  final String? dataType;

  /// Padding string for alignment.
  final String? p;

  RequestPayloadPart({
    this.bytes,
    this.completionState,
    this.dataType,
    this.p,
  });

  Map<String, dynamic> toJson() {
    final bytes = this.bytes;
    final completionState = this.completionState;
    final dataType = this.dataType;
    final p = this.p;
    return {
      if (bytes != null) 'Bytes': base64Encode(bytes),
      if (completionState != null) 'CompletionState': completionState,
      if (dataType != null) 'DataType': dataType,
      if (p != null) 'P': p,
    };
  }
}

/// @nodoc
class InputValidationError extends _s.GenericAwsException {
  InputValidationError({String? type, String? message})
      : super(type: type, code: 'InputValidationError', message: message);
}

/// @nodoc
class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String? type, String? message})
      : super(type: type, code: 'InternalServerError', message: message);
}

/// @nodoc
class ModelError extends _s.GenericAwsException {
  ModelError({String? type, String? message})
      : super(type: type, code: 'ModelError', message: message);
}

/// @nodoc
class ServiceUnavailableError extends _s.GenericAwsException {
  ServiceUnavailableError({String? type, String? message})
      : super(type: type, code: 'ServiceUnavailableError', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InputValidationError': (type, message) =>
      InputValidationError(type: type, message: message),
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'InternalStreamFailure': (type, message) =>
      InternalStreamFailure(message: message),
  'ModelError': (type, message) => ModelError(type: type, message: message),
  'ModelStreamError': (type, message) => ModelStreamError(message: message),
  'ServiceUnavailableError': (type, message) =>
      ServiceUnavailableError(type: type, message: message),
};
