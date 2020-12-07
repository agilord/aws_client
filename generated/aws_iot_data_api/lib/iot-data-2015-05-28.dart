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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'iot-data-2015-05-28.g.dart';

/// AWS IoT-Data enables secure, bi-directional communication between
/// Internet-connected things (such as sensors, actuators, embedded devices, or
/// smart appliances) and the AWS cloud. It implements a broker for applications
/// and things to publish messages over HTTP (Publish) and retrieve, update, and
/// delete thing shadows. A thing shadow is a persistent representation of your
/// things and their state in the AWS cloud.
class IoTDataPlane {
  final _s.RestJsonProtocol _protocol;
  IoTDataPlane({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'data.iot',
            signingName: 'iotdata',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Deletes the thing shadow for the specified thing.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/iot/latest/developerguide/API_DeleteThingShadow.html">DeleteThingShadow</a>
  /// in the <i>AWS IoT Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [MethodNotAllowedException].
  /// May throw [UnsupportedDocumentEncodingException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing.
  Future<DeleteThingShadowResponse> deleteThingShadow({
    @_s.required String thingName,
  }) async {
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/shadow',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteThingShadowResponse(
      payload: await response.stream.toBytes(),
    );
  }

  /// Gets the thing shadow for the specified thing.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/iot/latest/developerguide/API_GetThingShadow.html">GetThingShadow</a>
  /// in the <i>AWS IoT Developer Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [MethodNotAllowedException].
  /// May throw [UnsupportedDocumentEncodingException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing.
  Future<GetThingShadowResponse> getThingShadow({
    @_s.required String thingName,
  }) async {
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/shadow',
      exceptionFnMap: _exceptionFns,
    );
    return GetThingShadowResponse(
      payload: await response.stream.toBytes(),
    );
  }

  /// Publishes state information.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/iot/latest/developerguide/protocols.html#http">HTTP
  /// Protocol</a> in the <i>AWS IoT Developer Guide</i>.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [MethodNotAllowedException].
  ///
  /// Parameter [topic] :
  /// The name of the MQTT topic.
  ///
  /// Parameter [payload] :
  /// The state information, in JSON format.
  ///
  /// Parameter [qos] :
  /// The Quality of Service (QoS) level.
  Future<void> publish({
    @_s.required String topic,
    Uint8List payload,
    int qos,
  }) async {
    ArgumentError.checkNotNull(topic, 'topic');
    _s.validateNumRange(
      'qos',
      qos,
      0,
      1,
    );
    final $query = <String, List<String>>{
      if (qos != null) 'qos': [qos.toString()],
    };
    await _protocol.send(
      payload: payload,
      method: 'POST',
      requestUri: '/topics/${Uri.encodeComponent(topic)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the thing shadow for the specified thing.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/iot/latest/developerguide/API_UpdateThingShadow.html">UpdateThingShadow</a>
  /// in the <i>AWS IoT Developer Guide</i>.
  ///
  /// May throw [ConflictException].
  /// May throw [RequestEntityTooLargeException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [MethodNotAllowedException].
  /// May throw [UnsupportedDocumentEncodingException].
  ///
  /// Parameter [payload] :
  /// The state information, in JSON format.
  ///
  /// Parameter [thingName] :
  /// The name of the thing.
  Future<UpdateThingShadowResponse> updateThingShadow({
    @_s.required Uint8List payload,
    @_s.required String thingName,
  }) async {
    ArgumentError.checkNotNull(payload, 'payload');
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final response = await _protocol.sendRaw(
      payload: payload,
      method: 'POST',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/shadow',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateThingShadowResponse(
      payload: await response.stream.toBytes(),
    );
  }
}

/// The specified version does not match the version of the document.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConflictException implements _s.AwsException {
  /// The message for the exception.
  @_s.JsonKey(name: 'message')
  final String message;

  ConflictException({
    this.message,
  });
  factory ConflictException.fromJson(Map<String, dynamic> json) =>
      _$ConflictExceptionFromJson(json);
}

/// The output from the DeleteThingShadow operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteThingShadowResponse {
  /// The state information, in JSON format.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'payload')
  final Uint8List payload;

  DeleteThingShadowResponse({
    @_s.required this.payload,
  });
  factory DeleteThingShadowResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteThingShadowResponseFromJson(json);
}

/// The output from the GetThingShadow operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetThingShadowResponse {
  /// The state information, in JSON format.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'payload')
  final Uint8List payload;

  GetThingShadowResponse({
    this.payload,
  });
  factory GetThingShadowResponse.fromJson(Map<String, dynamic> json) =>
      _$GetThingShadowResponseFromJson(json);
}

/// An unexpected error has occurred.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InternalFailureException implements _s.AwsException {
  /// The message for the exception.
  @_s.JsonKey(name: 'message')
  final String message;

  InternalFailureException({
    this.message,
  });
  factory InternalFailureException.fromJson(Map<String, dynamic> json) =>
      _$InternalFailureExceptionFromJson(json);
}

/// The request is not valid.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InvalidRequestException implements _s.AwsException {
  /// The message for the exception.
  @_s.JsonKey(name: 'message')
  final String message;

  InvalidRequestException({
    this.message,
  });
  factory InvalidRequestException.fromJson(Map<String, dynamic> json) =>
      _$InvalidRequestExceptionFromJson(json);
}

/// The specified combination of HTTP verb and URI is not supported.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MethodNotAllowedException implements _s.AwsException {
  /// The message for the exception.
  @_s.JsonKey(name: 'message')
  final String message;

  MethodNotAllowedException({
    this.message,
  });
  factory MethodNotAllowedException.fromJson(Map<String, dynamic> json) =>
      _$MethodNotAllowedExceptionFromJson(json);
}

/// The payload exceeds the maximum size allowed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RequestEntityTooLargeException implements _s.AwsException {
  /// The message for the exception.
  @_s.JsonKey(name: 'message')
  final String message;

  RequestEntityTooLargeException({
    this.message,
  });
  factory RequestEntityTooLargeException.fromJson(Map<String, dynamic> json) =>
      _$RequestEntityTooLargeExceptionFromJson(json);
}

/// The specified resource does not exist.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceNotFoundException implements _s.AwsException {
  /// The message for the exception.
  @_s.JsonKey(name: 'message')
  final String message;

  ResourceNotFoundException({
    this.message,
  });
  factory ResourceNotFoundException.fromJson(Map<String, dynamic> json) =>
      _$ResourceNotFoundExceptionFromJson(json);
}

/// The service is temporarily unavailable.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceUnavailableException implements _s.AwsException {
  /// The message for the exception.
  @_s.JsonKey(name: 'message')
  final String message;

  ServiceUnavailableException({
    this.message,
  });
  factory ServiceUnavailableException.fromJson(Map<String, dynamic> json) =>
      _$ServiceUnavailableExceptionFromJson(json);
}

/// The rate exceeds the limit.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ThrottlingException implements _s.AwsException {
  /// The message for the exception.
  @_s.JsonKey(name: 'message')
  final String message;

  ThrottlingException({
    this.message,
  });
  factory ThrottlingException.fromJson(Map<String, dynamic> json) =>
      _$ThrottlingExceptionFromJson(json);
}

/// You are not authorized to perform this operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnauthorizedException implements _s.AwsException {
  /// The message for the exception.
  @_s.JsonKey(name: 'message')
  final String message;

  UnauthorizedException({
    this.message,
  });
  factory UnauthorizedException.fromJson(Map<String, dynamic> json) =>
      _$UnauthorizedExceptionFromJson(json);
}

/// The document encoding is not supported.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnsupportedDocumentEncodingException implements _s.AwsException {
  /// The message for the exception.
  @_s.JsonKey(name: 'message')
  final String message;

  UnsupportedDocumentEncodingException({
    this.message,
  });
  factory UnsupportedDocumentEncodingException.fromJson(
          Map<String, dynamic> json) =>
      _$UnsupportedDocumentEncodingExceptionFromJson(json);
}

/// The output from the UpdateThingShadow operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateThingShadowResponse {
  /// The state information, in JSON format.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'payload')
  final Uint8List payload;

  UpdateThingShadowResponse({
    this.payload,
  });
  factory UpdateThingShadowResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateThingShadowResponseFromJson(json);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) => ConflictException(message: message),
  'InternalFailureException': (type, message) =>
      InternalFailureException(message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(message: message),
  'MethodNotAllowedException': (type, message) =>
      MethodNotAllowedException(message: message),
  'RequestEntityTooLargeException': (type, message) =>
      RequestEntityTooLargeException(message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(message: message),
  'UnsupportedDocumentEncodingException': (type, message) =>
      UnsupportedDocumentEncodingException(message: message),
};
