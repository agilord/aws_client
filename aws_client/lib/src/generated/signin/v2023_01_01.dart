// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2023_01_01.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// AWS Sign-In manages authentication for AWS services. This service provides
/// secure authentication flows for accessing AWS resources from the console and
/// developer tools.
class Signin {
  final _s.RestJsonProtocol _protocol;
  factory Signin({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'signin',
    );
    return Signin._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  Signin._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// CreateOAuth2Token API Path: /v1/token Request Method: POST Content-Type:
  /// application/json or application/x-www-form-urlencoded This API implements
  /// OAuth 2.0 flows for AWS Sign-In CLI clients, supporting both: 1.
  /// Authorization code redemption (grant_type=authorization_code) - NOT
  /// idempotent 2. Token refresh (grant_type=refresh_token) - Idempotent within
  /// token validity window The operation behavior is determined by the
  /// grant_type parameter in the request body: **Authorization Code Flow (NOT
  /// Idempotent):** - JSON or form-encoded body with client_id,
  /// grant_type=authorization_code, code, redirect_uri, code_verifier - Returns
  /// access_token, token_type, expires_in, refresh_token, and id_token - Each
  /// authorization code can only be used ONCE for security (prevents replay
  /// attacks) **Token Refresh Flow (Idempotent):** - JSON or form-encoded body
  /// with client_id, grant_type=refresh_token, refresh_token - Returns
  /// access_token, token_type, expires_in, and refresh_token (no id_token) -
  /// Multiple calls with same refresh_token return consistent results within
  /// validity window Authentication and authorization: - Confidential clients:
  /// sigv4 signing required with signin:ExchangeToken permissions - CLI clients
  /// (public): authn/authz skipped based on client_id & grant_type Note: This
  /// operation cannot be marked as @idempotent because it handles both
  /// idempotent (token refresh) and non-idempotent (auth code redemption) flows
  /// in a single endpoint.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsError].
  /// May throw [ValidationException].
  ///
  /// Parameter [tokenInput] :
  /// Flattened token operation inputs The specific operation is determined by
  /// grant_type in the request body
  Future<CreateOAuth2TokenResponse> createOAuth2Token({
    required CreateOAuth2TokenRequestBody tokenInput,
  }) async {
    final response = await _protocol.sendRaw(
      payload: tokenInput,
      method: 'POST',
      requestUri: '/v1/token',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateOAuth2TokenResponse(
      tokenOutput: CreateOAuth2TokenResponseBody.fromJson($json),
    );
  }
}

/// Output structure for CreateOAuth2Token operation Contains flattened token
/// operation outputs for both authorization code and refresh token flows. The
/// response content depends on the grant_type from the original request.
///
/// @nodoc
class CreateOAuth2TokenResponse {
  /// Flattened token operation outputs The specific response fields depend on the
  /// grant_type used in the request
  final CreateOAuth2TokenResponseBody tokenOutput;

  CreateOAuth2TokenResponse({
    required this.tokenOutput,
  });

  Map<String, dynamic> toJson() {
    final tokenOutput = this.tokenOutput;
    return {
      'tokenOutput': tokenOutput,
    };
  }
}

/// Response body payload for CreateOAuth2Token operation The response content
/// depends on the grant_type from the request: - grant_type=authorization_code:
/// Returns all fields including refresh_token and id_token -
/// grant_type=refresh_token: Returns access_token, token_type, expires_in,
/// refresh_token (no id_token)
///
/// @nodoc
class CreateOAuth2TokenResponseBody {
  /// Scoped-down AWS credentials (15 minute duration) Present for both
  /// authorization code redemption and token refresh
  final AccessToken accessToken;

  /// Time to expiry in seconds (maximum 900) Present for both authorization code
  /// redemption and token refresh
  final int expiresIn;

  /// Encrypted refresh token with cnf.jkt (SHA-256 thumbprint of presented jwk)
  /// Always present in responses (required for both flows)
  final String refreshToken;

  /// Token type indicating this is AWS SigV4 credentials Value is "aws_sigv4" for
  /// both flows
  final String tokenType;

  /// ID token containing user identity information Present only in authorization
  /// code redemption response (grant_type=authorization_code) Not included in
  /// token refresh responses
  final String? idToken;

  CreateOAuth2TokenResponseBody({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.tokenType,
    this.idToken,
  });

  factory CreateOAuth2TokenResponseBody.fromJson(Map<String, dynamic> json) {
    return CreateOAuth2TokenResponseBody(
      accessToken: AccessToken.fromJson(
          (json['accessToken'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      expiresIn: (json['expiresIn'] as int?) ?? 0,
      refreshToken: (json['refreshToken'] as String?) ?? '',
      tokenType: (json['tokenType'] as String?) ?? '',
      idToken: json['idToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessToken = this.accessToken;
    final expiresIn = this.expiresIn;
    final refreshToken = this.refreshToken;
    final tokenType = this.tokenType;
    final idToken = this.idToken;
    return {
      'accessToken': accessToken,
      'expiresIn': expiresIn,
      'refreshToken': refreshToken,
      'tokenType': tokenType,
      if (idToken != null) 'idToken': idToken,
    };
  }
}

/// AWS credentials structure containing temporary access credentials The
/// scoped-down, 15 minute duration AWS credentials. Scoping down will be based
/// on CLI policy (CLI team needs to create it). Similar to cloud shell
/// implementation.
///
/// @nodoc
class AccessToken {
  /// AWS access key ID for temporary credentials
  final String accessKeyId;

  /// AWS secret access key for temporary credentials
  final String secretAccessKey;

  /// AWS session token for temporary credentials
  final String sessionToken;

  AccessToken({
    required this.accessKeyId,
    required this.secretAccessKey,
    required this.sessionToken,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) {
    return AccessToken(
      accessKeyId: (json['accessKeyId'] as String?) ?? '',
      secretAccessKey: (json['secretAccessKey'] as String?) ?? '',
      sessionToken: (json['sessionToken'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final secretAccessKey = this.secretAccessKey;
    final sessionToken = this.sessionToken;
    return {
      'accessKeyId': accessKeyId,
      'secretAccessKey': secretAccessKey,
      'sessionToken': sessionToken,
    };
  }
}

/// Request body payload for CreateOAuth2Token operation The operation type is
/// determined by the grant_type parameter: - grant_type=authorization_code:
/// Requires code, redirect_uri, code_verifier - grant_type=refresh_token:
/// Requires refresh_token
///
/// @nodoc
class CreateOAuth2TokenRequestBody {
  /// The client identifier (ARN) used during Sign-In onboarding Required for both
  /// authorization code and refresh token flows
  final String clientId;

  /// OAuth 2.0 grant type - determines which flow is used Must be
  /// "authorization_code" or "refresh_token"
  final String grantType;

  /// The authorization code received from /v1/authorize Required only when
  /// grant_type=authorization_code
  final String? code;

  /// PKCE code verifier to prove possession of the original code challenge
  /// Required only when grant_type=authorization_code
  final String? codeVerifier;

  /// The redirect URI that must match the original authorization request Required
  /// only when grant_type=authorization_code
  final String? redirectUri;

  /// The refresh token returned from auth_code redemption Required only when
  /// grant_type=refresh_token
  final String? refreshToken;

  CreateOAuth2TokenRequestBody({
    required this.clientId,
    required this.grantType,
    this.code,
    this.codeVerifier,
    this.redirectUri,
    this.refreshToken,
  });

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final grantType = this.grantType;
    final code = this.code;
    final codeVerifier = this.codeVerifier;
    final redirectUri = this.redirectUri;
    final refreshToken = this.refreshToken;
    return {
      'clientId': clientId,
      'grantType': grantType,
      if (code != null) 'code': code,
      if (codeVerifier != null) 'codeVerifier': codeVerifier,
      if (redirectUri != null) 'redirectUri': redirectUri,
      if (refreshToken != null) 'refreshToken': refreshToken,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class TooManyRequestsError extends _s.GenericAwsException {
  TooManyRequestsError({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsError', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'TooManyRequestsError': (type, message) =>
      TooManyRequestsError(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
