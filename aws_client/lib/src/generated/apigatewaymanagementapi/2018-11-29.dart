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

part '2018-11-29.g.dart';

/// The Amazon API Gateway Management API allows you to directly manage runtime
/// aspects of your deployed APIs. To use it, you must explicitly set the SDK's
/// endpoint to point to the endpoint of your deployed API. The endpoint will be
/// of the form https://{api-id}.execute-api.{region}.amazonaws.com/{stage}, or
/// will be the endpoint corresponding to your API's custom domain and base
/// path, if applicable.
class ApiGatewayManagementApi {
  final _s.RestJsonProtocol _protocol;
  ApiGatewayManagementApi({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'execute-api',
            signingName: 'execute-api',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Delete the connection with the provided id.
  ///
  /// May throw [GoneException].
  /// May throw [LimitExceededException].
  /// May throw [ForbiddenException].
  Future<void> deleteConnection({
    @_s.required String connectionId,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/@connections/${Uri.encodeComponent(connectionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get information about the connection with the provided id.
  ///
  /// May throw [GoneException].
  /// May throw [LimitExceededException].
  /// May throw [ForbiddenException].
  Future<GetConnectionResponse> getConnection({
    @_s.required String connectionId,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/@connections/${Uri.encodeComponent(connectionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConnectionResponse.fromJson(response);
  }

  /// Sends the provided data to the specified connection.
  ///
  /// May throw [GoneException].
  /// May throw [LimitExceededException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [connectionId] :
  /// The identifier of the connection that a specific client is using.
  ///
  /// Parameter [data] :
  /// The data to be sent to the client specified by its connection id.
  Future<void> postToConnection({
    @_s.required String connectionId,
    @_s.required Uint8List data,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    ArgumentError.checkNotNull(data, 'data');
    await _protocol.send(
      payload: data,
      method: 'POST',
      requestUri: '/@connections/${Uri.encodeComponent(connectionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetConnectionResponse {
  /// The time in ISO 8601 format for when the connection was established.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'connectedAt')
  final DateTime connectedAt;
  @_s.JsonKey(name: 'identity')
  final Identity identity;

  /// The time in ISO 8601 format for when the connection was last active.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'lastActiveAt')
  final DateTime lastActiveAt;

  GetConnectionResponse({
    this.connectedAt,
    this.identity,
    this.lastActiveAt,
  });
  factory GetConnectionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetConnectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Identity {
  /// The source IP address of the TCP connection making the request to API
  /// Gateway.
  @_s.JsonKey(name: 'sourceIp')
  final String sourceIp;

  /// The User Agent of the API caller.
  @_s.JsonKey(name: 'userAgent')
  final String userAgent;

  Identity({
    @_s.required this.sourceIp,
    @_s.required this.userAgent,
  });
  factory Identity.fromJson(Map<String, dynamic> json) =>
      _$IdentityFromJson(json);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String type, String message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class GoneException extends _s.GenericAwsException {
  GoneException({String type, String message})
      : super(type: type, code: 'GoneException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class PayloadTooLargeException extends _s.GenericAwsException {
  PayloadTooLargeException({String type, String message})
      : super(type: type, code: 'PayloadTooLargeException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'GoneException': (type, message) =>
      GoneException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'PayloadTooLargeException': (type, message) =>
      PayloadTooLargeException(type: type, message: message),
};
