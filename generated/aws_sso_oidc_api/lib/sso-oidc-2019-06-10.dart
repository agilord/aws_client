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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// AWS IAM Identity Center (successor to AWS Single Sign-On) OpenID Connect
/// (OIDC) is a web service that enables a client (such as AWS CLI or a native
/// application) to register with IAM Identity Center. The service also enables
/// the client to fetch the user’s access token upon successful authentication
/// and authorization with IAM Identity Center.
/// <note>
/// Although AWS Single Sign-On was renamed, the <code>sso</code> and
/// <code>identitystore</code> API namespaces will continue to retain their
/// original name for backward compatibility purposes. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html#renamed">IAM
/// Identity Center rename</a>.
/// </note>
/// <b>Considerations for Using This Guide</b>
///
/// Before you begin using this guide, we recommend that you first review the
/// following important information about how the IAM Identity Center OIDC
/// service works.
///
/// <ul>
/// <li>
/// The IAM Identity Center OIDC service currently implements only the portions
/// of the OAuth 2.0 Device Authorization Grant standard (<a
/// href="https://tools.ietf.org/html/rfc8628">https://tools.ietf.org/html/rfc8628</a>)
/// that are necessary to enable single sign-on authentication with the AWS CLI.
/// Support for other OIDC flows frequently needed for native applications, such
/// as Authorization Code Flow (+ PKCE), will be addressed in future releases.
/// </li>
/// <li>
/// The service emits only OIDC access tokens, such that obtaining a new token
/// (For example, token refresh) requires explicit user re-authentication.
/// </li>
/// <li>
/// The access tokens provided by this service grant access to all AWS account
/// entitlements assigned to an IAM Identity Center user, not just a particular
/// application.
/// </li>
/// <li>
/// The documentation in this guide does not describe the mechanism to convert
/// the access token into AWS Auth (“sigv4”) credentials for use with
/// IAM-protected AWS service endpoints. For more information, see <a
/// href="https://docs.aws.amazon.com/singlesignon/latest/PortalAPIReference/API_GetRoleCredentials.html">GetRoleCredentials</a>
/// in the <i>IAM Identity Center Portal API Reference Guide</i>.
/// </li>
/// </ul>
/// For general information about IAM Identity Center, see <a
/// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html">What
/// is IAM Identity Center?</a> in the <i>IAM Identity Center User Guide</i>.
class SSOOIDC {
  final _s.RestJsonProtocol _protocol;
  SSOOIDC({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'oidc',
            signingName: 'awsssooidc',
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

  /// Creates and returns an access token for the authorized client. The access
  /// token issued will be used to fetch short-term credentials for the assigned
  /// roles in the AWS account.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidClientException].
  /// May throw [InvalidGrantException].
  /// May throw [UnauthorizedClientException].
  /// May throw [UnsupportedGrantTypeException].
  /// May throw [InvalidScopeException].
  /// May throw [AuthorizationPendingException].
  /// May throw [SlowDownException].
  /// May throw [AccessDeniedException].
  /// May throw [ExpiredTokenException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [clientId] :
  /// The unique identifier string for each client. This value should come from
  /// the persisted result of the <a>RegisterClient</a> API.
  ///
  /// Parameter [clientSecret] :
  /// A secret string generated for the client. This value should come from the
  /// persisted result of the <a>RegisterClient</a> API.
  ///
  /// Parameter [grantType] :
  /// Supports grant types for the authorization code, refresh token, and device
  /// code request. For device code requests, specify the following value:
  ///
  /// <code>urn:ietf:params:oauth:grant-type:<i>device_code</i> </code>
  ///
  /// For information about how to obtain the device code, see the
  /// <a>StartDeviceAuthorization</a> topic.
  ///
  /// Parameter [code] :
  /// The authorization code received from the authorization service. This
  /// parameter is required to perform an authorization grant request to get
  /// access to a token.
  ///
  /// Parameter [deviceCode] :
  /// Used only when calling this API for the device code grant type. This
  /// short-term code is used to identify this authentication attempt. This
  /// should come from an in-memory reference to the result of the
  /// <a>StartDeviceAuthorization</a> API.
  ///
  /// Parameter [redirectUri] :
  /// The location of the application that will receive the authorization code.
  /// Users authorize the service to send the request to this location.
  ///
  /// Parameter [refreshToken] :
  /// Currently, <code>refreshToken</code> is not yet implemented and is not
  /// supported. For more information about the features and limitations of the
  /// current IAM Identity Center OIDC implementation, see <i>Considerations for
  /// Using this Guide</i> in the <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/Welcome.html">IAM
  /// Identity Center OIDC API Reference</a>.
  ///
  /// The token used to obtain an access token in the event that the access
  /// token is invalid or expired.
  ///
  /// Parameter [scope] :
  /// The list of scopes that is defined by the client. Upon authorization, this
  /// list is used to restrict permissions when granting an access token.
  Future<CreateTokenResponse> createToken({
    required String clientId,
    required String clientSecret,
    required String grantType,
    String? code,
    String? deviceCode,
    String? redirectUri,
    String? refreshToken,
    List<String>? scope,
  }) async {
    final $payload = <String, dynamic>{
      'clientId': clientId,
      'clientSecret': clientSecret,
      'grantType': grantType,
      if (code != null) 'code': code,
      if (deviceCode != null) 'deviceCode': deviceCode,
      if (redirectUri != null) 'redirectUri': redirectUri,
      if (refreshToken != null) 'refreshToken': refreshToken,
      if (scope != null) 'scope': scope,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/token',
      signed: false,
      exceptionFnMap: _exceptionFns,
    );
    return CreateTokenResponse.fromJson(response);
  }

  /// Registers a client with IAM Identity Center. This allows clients to
  /// initiate device authorization. The output should be persisted for reuse
  /// through many authentication requests.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidScopeException].
  /// May throw [InvalidClientMetadataException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [clientName] :
  /// The friendly name of the client.
  ///
  /// Parameter [clientType] :
  /// The type of client. The service supports only <code>public</code> as a
  /// client type. Anything other than public will be rejected by the service.
  ///
  /// Parameter [scopes] :
  /// The list of scopes that are defined by the client. Upon authorization,
  /// this list is used to restrict permissions when granting an access token.
  Future<RegisterClientResponse> registerClient({
    required String clientName,
    required String clientType,
    List<String>? scopes,
  }) async {
    final $payload = <String, dynamic>{
      'clientName': clientName,
      'clientType': clientType,
      if (scopes != null) 'scopes': scopes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/client/register',
      signed: false,
      exceptionFnMap: _exceptionFns,
    );
    return RegisterClientResponse.fromJson(response);
  }

  /// Initiates device authorization by requesting a pair of verification codes
  /// from the authorization service.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [SlowDownException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [clientId] :
  /// The unique identifier string for the client that is registered with IAM
  /// Identity Center. This value should come from the persisted result of the
  /// <a>RegisterClient</a> API operation.
  ///
  /// Parameter [clientSecret] :
  /// A secret string that is generated for the client. This value should come
  /// from the persisted result of the <a>RegisterClient</a> API operation.
  ///
  /// Parameter [startUrl] :
  /// The URL for the AWS access portal. For more information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/using-the-portal.html">Using
  /// the AWS access portal</a> in the <i>IAM Identity Center User Guide</i>.
  Future<StartDeviceAuthorizationResponse> startDeviceAuthorization({
    required String clientId,
    required String clientSecret,
    required String startUrl,
  }) async {
    final $payload = <String, dynamic>{
      'clientId': clientId,
      'clientSecret': clientSecret,
      'startUrl': startUrl,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/device_authorization',
      signed: false,
      exceptionFnMap: _exceptionFns,
    );
    return StartDeviceAuthorizationResponse.fromJson(response);
  }
}

class CreateTokenResponse {
  /// An opaque token to access IAM Identity Center resources assigned to a user.
  final String? accessToken;

  /// Indicates the time in seconds when an access token will expire.
  final int? expiresIn;

  /// Currently, <code>idToken</code> is not yet implemented and is not supported.
  /// For more information about the features and limitations of the current IAM
  /// Identity Center OIDC implementation, see <i>Considerations for Using this
  /// Guide</i> in the <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/Welcome.html">IAM
  /// Identity Center OIDC API Reference</a>.
  ///
  /// The identifier of the user that associated with the access token, if
  /// present.
  final String? idToken;

  /// Currently, <code>refreshToken</code> is not yet implemented and is not
  /// supported. For more information about the features and limitations of the
  /// current IAM Identity Center OIDC implementation, see <i>Considerations for
  /// Using this Guide</i> in the <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/Welcome.html">IAM
  /// Identity Center OIDC API Reference</a>.
  ///
  /// A token that, if present, can be used to refresh a previously issued access
  /// token that might have expired.
  final String? refreshToken;

  /// Used to notify the client that the returned token is an access token. The
  /// supported type is <code>BearerToken</code>.
  final String? tokenType;

  CreateTokenResponse({
    this.accessToken,
    this.expiresIn,
    this.idToken,
    this.refreshToken,
    this.tokenType,
  });

  factory CreateTokenResponse.fromJson(Map<String, dynamic> json) {
    return CreateTokenResponse(
      accessToken: json['accessToken'] as String?,
      expiresIn: json['expiresIn'] as int?,
      idToken: json['idToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      tokenType: json['tokenType'] as String?,
    );
  }
}

class RegisterClientResponse {
  /// The endpoint where the client can request authorization.
  final String? authorizationEndpoint;

  /// The unique identifier string for each client. This client uses this
  /// identifier to get authenticated by the service in subsequent calls.
  final String? clientId;

  /// Indicates the time at which the <code>clientId</code> and
  /// <code>clientSecret</code> were issued.
  final int? clientIdIssuedAt;

  /// A secret string generated for the client. The client will use this string to
  /// get authenticated by the service in subsequent calls.
  final String? clientSecret;

  /// Indicates the time at which the <code>clientId</code> and
  /// <code>clientSecret</code> will become invalid.
  final int? clientSecretExpiresAt;

  /// The endpoint where the client can get an access token.
  final String? tokenEndpoint;

  RegisterClientResponse({
    this.authorizationEndpoint,
    this.clientId,
    this.clientIdIssuedAt,
    this.clientSecret,
    this.clientSecretExpiresAt,
    this.tokenEndpoint,
  });

  factory RegisterClientResponse.fromJson(Map<String, dynamic> json) {
    return RegisterClientResponse(
      authorizationEndpoint: json['authorizationEndpoint'] as String?,
      clientId: json['clientId'] as String?,
      clientIdIssuedAt: json['clientIdIssuedAt'] as int?,
      clientSecret: json['clientSecret'] as String?,
      clientSecretExpiresAt: json['clientSecretExpiresAt'] as int?,
      tokenEndpoint: json['tokenEndpoint'] as String?,
    );
  }
}

class StartDeviceAuthorizationResponse {
  /// The short-lived code that is used by the device when polling for a session
  /// token.
  final String? deviceCode;

  /// Indicates the number of seconds in which the verification code will become
  /// invalid.
  final int? expiresIn;

  /// Indicates the number of seconds the client must wait between attempts when
  /// polling for a session.
  final int? interval;

  /// A one-time user verification code. This is needed to authorize an in-use
  /// device.
  final String? userCode;

  /// The URI of the verification page that takes the <code>userCode</code> to
  /// authorize the device.
  final String? verificationUri;

  /// An alternate URL that the client can use to automatically launch a browser.
  /// This process skips the manual step in which the user visits the verification
  /// page and enters their code.
  final String? verificationUriComplete;

  StartDeviceAuthorizationResponse({
    this.deviceCode,
    this.expiresIn,
    this.interval,
    this.userCode,
    this.verificationUri,
    this.verificationUriComplete,
  });

  factory StartDeviceAuthorizationResponse.fromJson(Map<String, dynamic> json) {
    return StartDeviceAuthorizationResponse(
      deviceCode: json['deviceCode'] as String?,
      expiresIn: json['expiresIn'] as int?,
      interval: json['interval'] as int?,
      userCode: json['userCode'] as String?,
      verificationUri: json['verificationUri'] as String?,
      verificationUriComplete: json['verificationUriComplete'] as String?,
    );
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AuthorizationPendingException extends _s.GenericAwsException {
  AuthorizationPendingException({String? type, String? message})
      : super(
            type: type,
            code: 'AuthorizationPendingException',
            message: message);
}

class ExpiredTokenException extends _s.GenericAwsException {
  ExpiredTokenException({String? type, String? message})
      : super(type: type, code: 'ExpiredTokenException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidClientException extends _s.GenericAwsException {
  InvalidClientException({String? type, String? message})
      : super(type: type, code: 'InvalidClientException', message: message);
}

class InvalidClientMetadataException extends _s.GenericAwsException {
  InvalidClientMetadataException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidClientMetadataException',
            message: message);
}

class InvalidGrantException extends _s.GenericAwsException {
  InvalidGrantException({String? type, String? message})
      : super(type: type, code: 'InvalidGrantException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class InvalidScopeException extends _s.GenericAwsException {
  InvalidScopeException({String? type, String? message})
      : super(type: type, code: 'InvalidScopeException', message: message);
}

class SlowDownException extends _s.GenericAwsException {
  SlowDownException({String? type, String? message})
      : super(type: type, code: 'SlowDownException', message: message);
}

class UnauthorizedClientException extends _s.GenericAwsException {
  UnauthorizedClientException({String? type, String? message})
      : super(
            type: type, code: 'UnauthorizedClientException', message: message);
}

class UnsupportedGrantTypeException extends _s.GenericAwsException {
  UnsupportedGrantTypeException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedGrantTypeException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'AuthorizationPendingException': (type, message) =>
      AuthorizationPendingException(type: type, message: message),
  'ExpiredTokenException': (type, message) =>
      ExpiredTokenException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidClientException': (type, message) =>
      InvalidClientException(type: type, message: message),
  'InvalidClientMetadataException': (type, message) =>
      InvalidClientMetadataException(type: type, message: message),
  'InvalidGrantException': (type, message) =>
      InvalidGrantException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'InvalidScopeException': (type, message) =>
      InvalidScopeException(type: type, message: message),
  'SlowDownException': (type, message) =>
      SlowDownException(type: type, message: message),
  'UnauthorizedClientException': (type, message) =>
      UnauthorizedClientException(type: type, message: message),
  'UnsupportedGrantTypeException': (type, message) =>
      UnsupportedGrantTypeException(type: type, message: message),
};
