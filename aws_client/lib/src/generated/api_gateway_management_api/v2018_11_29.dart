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

/// The Amazon API Gateway Management API allows you to directly manage runtime
/// aspects of your deployed APIs. To use it, you must explicitly set the SDK's
/// endpoint to point to the endpoint of your deployed API. The endpoint will be
/// of the form https://{api-id}.execute-api.{region}.amazonaws.com/{stage}, or
/// will be the endpoint corresponding to your API's custom domain and base
/// path, if applicable.
class ApiGatewayManagementApi {
  final _s.RestJsonProtocol _protocol;
  ApiGatewayManagementApi({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'execute-api',
            signingName: 'execute-api',
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

  /// Delete the connection with the provided id.
  ///
  /// May throw [GoneException].
  /// May throw [LimitExceededException].
  /// May throw [ForbiddenException].
  Future<void> deleteConnection({
    required String connectionId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/%40connections/${Uri.encodeComponent(connectionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get information about the connection with the provided id.
  ///
  /// May throw [GoneException].
  /// May throw [LimitExceededException].
  /// May throw [ForbiddenException].
  Future<GetConnectionResponse> getConnection({
    required String connectionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/%40connections/${Uri.encodeComponent(connectionId)}',
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
    required String connectionId,
    required Uint8List data,
  }) async {
    await _protocol.send(
      payload: data,
      method: 'POST',
      requestUri: '/%40connections/${Uri.encodeComponent(connectionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

class GetConnectionResponse {
  /// The time in ISO 8601 format for when the connection was established.
  final DateTime? connectedAt;
  final Identity? identity;

  /// The time in ISO 8601 format for when the connection was last active.
  final DateTime? lastActiveAt;

  GetConnectionResponse({
    this.connectedAt,
    this.identity,
    this.lastActiveAt,
  });

  factory GetConnectionResponse.fromJson(Map<String, dynamic> json) {
    return GetConnectionResponse(
      connectedAt: timeStampFromJson(json['connectedAt']),
      identity: json['identity'] != null
          ? Identity.fromJson(json['identity'] as Map<String, dynamic>)
          : null,
      lastActiveAt: timeStampFromJson(json['lastActiveAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final connectedAt = this.connectedAt;
    final identity = this.identity;
    final lastActiveAt = this.lastActiveAt;
    return {
      if (connectedAt != null) 'connectedAt': iso8601ToJson(connectedAt),
      if (identity != null) 'identity': identity,
      if (lastActiveAt != null) 'lastActiveAt': iso8601ToJson(lastActiveAt),
    };
  }
}

class Identity {
  /// The source IP address of the TCP connection making the request to API
  /// Gateway.
  final String sourceIp;

  /// The User Agent of the API caller.
  final String userAgent;

  Identity({
    required this.sourceIp,
    required this.userAgent,
  });

  factory Identity.fromJson(Map<String, dynamic> json) {
    return Identity(
      sourceIp: json['sourceIp'] as String,
      userAgent: json['userAgent'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceIp = this.sourceIp;
    final userAgent = this.userAgent;
    return {
      'sourceIp': sourceIp,
      'userAgent': userAgent,
    };
  }
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class GoneException extends _s.GenericAwsException {
  GoneException({String? type, String? message})
      : super(type: type, code: 'GoneException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class PayloadTooLargeException extends _s.GenericAwsException {
  PayloadTooLargeException({String? type, String? message})
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
