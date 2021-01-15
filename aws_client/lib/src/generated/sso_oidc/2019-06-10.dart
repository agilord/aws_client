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

part '2019-06-10.g.dart';

/// AWS Single Sign-On (SSO) OpenID Connect (OIDC) is a web service that enables
/// a client (such as AWS CLI or a native application) to register with AWS SSO.
/// The service also enables the client to fetch the user’s access token upon
/// successful authentication and authorization with AWS SSO. This service
/// conforms with the OAuth 2.0 based implementation of the device authorization
/// grant standard (<a
/// href="https://tools.ietf.org/html/rfc8628">https://tools.ietf.org/html/rfc8628</a>).
///
/// For general information about AWS SSO, see <a
/// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html">What
/// is AWS Single Sign-On?</a> in the <i>AWS SSO User Guide</i>.
///
/// This API reference guide describes the AWS SSO OIDC operations that you can
/// call programatically and includes detailed information on data types and
/// errors.
/// <note>
/// AWS provides SDKs that consist of libraries and sample code for various
/// programming languages and platforms such as Java, Ruby, .Net, iOS, and
/// Android. The SDKs provide a convenient way to create programmatic access to
/// AWS SSO and other AWS services. For more information about the AWS SDKs,
/// including how to download and install them, see <a
/// href="http://aws.amazon.com/tools/">Tools for Amazon Web Services</a>.
/// </note>
class SsoOidc {
  final _s.RestJsonProtocol _protocol;
  SsoOidc({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'oidc',
            signingName: 'awsssooidc',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
  /// Parameter [deviceCode] :
  /// Used only when calling this API for the device code grant type. This
  /// short-term code is used to identify this authentication attempt. This
  /// should come from an in-memory reference to the result of the
  /// <a>StartDeviceAuthorization</a> API.
  ///
  /// Parameter [grantType] :
  /// Supports grant types for authorization code, refresh token, and device
  /// code request.
  ///
  /// Parameter [code] :
  /// The authorization code received from the authorization service. This
  /// parameter is required to perform an authorization grant request to get
  /// access to a token.
  ///
  /// Parameter [redirectUri] :
  /// The location of the application that will receive the authorization code.
  /// Users authorize the service to send the request to this location.
  ///
  /// Parameter [refreshToken] :
  /// The token used to obtain an access token in the event that the access
  /// token is invalid or expired. This token is not issued by the service.
  ///
  /// Parameter [scope] :
  /// The list of scopes that is defined by the client. Upon authorization, this
  /// list is used to restrict permissions when granting an access token.
  Future<CreateTokenResponse> createToken({
    @_s.required String clientId,
    @_s.required String clientSecret,
    @_s.required String deviceCode,
    @_s.required String grantType,
    String code,
    String redirectUri,
    String refreshToken,
    List<String> scope,
  }) async {
    ArgumentError.checkNotNull(clientId, 'clientId');
    ArgumentError.checkNotNull(clientSecret, 'clientSecret');
    ArgumentError.checkNotNull(deviceCode, 'deviceCode');
    ArgumentError.checkNotNull(grantType, 'grantType');
    final $payload = <String, dynamic>{
      'clientId': clientId,
      'clientSecret': clientSecret,
      'deviceCode': deviceCode,
      'grantType': grantType,
      if (code != null) 'code': code,
      if (redirectUri != null) 'redirectUri': redirectUri,
      if (refreshToken != null) 'refreshToken': refreshToken,
      if (scope != null) 'scope': scope,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/token',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTokenResponse.fromJson(response);
  }

  /// Registers a client with AWS SSO. This allows clients to initiate device
  /// authorization. The output should be persisted for reuse through many
  /// authentication requests.
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
    @_s.required String clientName,
    @_s.required String clientType,
    List<String> scopes,
  }) async {
    ArgumentError.checkNotNull(clientName, 'clientName');
    ArgumentError.checkNotNull(clientType, 'clientType');
    final $payload = <String, dynamic>{
      'clientName': clientName,
      'clientType': clientType,
      if (scopes != null) 'scopes': scopes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/client/register',
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
  /// The unique identifier string for the client that is registered with AWS
  /// SSO. This value should come from the persisted result of the
  /// <a>RegisterClient</a> API operation.
  ///
  /// Parameter [clientSecret] :
  /// A secret string that is generated for the client. This value should come
  /// from the persisted result of the <a>RegisterClient</a> API operation.
  ///
  /// Parameter [startUrl] :
  /// The URL for the AWS SSO user portal. For more information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/using-the-portal.html">Using
  /// the User Portal</a> in the <i>AWS Single Sign-On User Guide</i>.
  Future<StartDeviceAuthorizationResponse> startDeviceAuthorization({
    @_s.required String clientId,
    @_s.required String clientSecret,
    @_s.required String startUrl,
  }) async {
    ArgumentError.checkNotNull(clientId, 'clientId');
    ArgumentError.checkNotNull(clientSecret, 'clientSecret');
    ArgumentError.checkNotNull(startUrl, 'startUrl');
    final $payload = <String, dynamic>{
      'clientId': clientId,
      'clientSecret': clientSecret,
      'startUrl': startUrl,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/device_authorization',
      exceptionFnMap: _exceptionFns,
    );
    return StartDeviceAuthorizationResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTokenResponse {
  /// An opaque token to access AWS SSO resources assigned to a user.
  @_s.JsonKey(name: 'accessToken')
  final String accessToken;

  /// Indicates the time in seconds when an access token will expire.
  @_s.JsonKey(name: 'expiresIn')
  final int expiresIn;

  /// The identifier of the user that associated with the access token, if
  /// present.
  @_s.JsonKey(name: 'idToken')
  final String idToken;

  /// A token that, if present, can be used to refresh a previously issued access
  /// token that might have expired.
  @_s.JsonKey(name: 'refreshToken')
  final String refreshToken;

  /// Used to notify the client that the returned token is an access token. The
  /// supported type is <code>BearerToken</code>.
  @_s.JsonKey(name: 'tokenType')
  final String tokenType;

  CreateTokenResponse({
    this.accessToken,
    this.expiresIn,
    this.idToken,
    this.refreshToken,
    this.tokenType,
  });
  factory CreateTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTokenResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterClientResponse {
  /// The endpoint where the client can request authorization.
  @_s.JsonKey(name: 'authorizationEndpoint')
  final String authorizationEndpoint;

  /// The unique identifier string for each client. This client uses this
  /// identifier to get authenticated by the service in subsequent calls.
  @_s.JsonKey(name: 'clientId')
  final String clientId;

  /// Indicates the time at which the <code>clientId</code> and
  /// <code>clientSecret</code> were issued.
  @_s.JsonKey(name: 'clientIdIssuedAt')
  final int clientIdIssuedAt;

  /// A secret string generated for the client. The client will use this string to
  /// get authenticated by the service in subsequent calls.
  @_s.JsonKey(name: 'clientSecret')
  final String clientSecret;

  /// Indicates the time at which the <code>clientId</code> and
  /// <code>clientSecret</code> will become invalid.
  @_s.JsonKey(name: 'clientSecretExpiresAt')
  final int clientSecretExpiresAt;

  /// The endpoint where the client can get an access token.
  @_s.JsonKey(name: 'tokenEndpoint')
  final String tokenEndpoint;

  RegisterClientResponse({
    this.authorizationEndpoint,
    this.clientId,
    this.clientIdIssuedAt,
    this.clientSecret,
    this.clientSecretExpiresAt,
    this.tokenEndpoint,
  });
  factory RegisterClientResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterClientResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartDeviceAuthorizationResponse {
  /// The short-lived code that is used by the device when polling for a session
  /// token.
  @_s.JsonKey(name: 'deviceCode')
  final String deviceCode;

  /// Indicates the number of seconds in which the verification code will become
  /// invalid.
  @_s.JsonKey(name: 'expiresIn')
  final int expiresIn;

  /// Indicates the number of seconds the client must wait between attempts when
  /// polling for a session.
  @_s.JsonKey(name: 'interval')
  final int interval;

  /// A one-time user verification code. This is needed to authorize an in-use
  /// device.
  @_s.JsonKey(name: 'userCode')
  final String userCode;

  /// The URI of the verification page that takes the <code>userCode</code> to
  /// authorize the device.
  @_s.JsonKey(name: 'verificationUri')
  final String verificationUri;

  /// An alternate URL that the client can use to automatically launch a browser.
  /// This process skips the manual step in which the user visits the verification
  /// page and enters their code.
  @_s.JsonKey(name: 'verificationUriComplete')
  final String verificationUriComplete;

  StartDeviceAuthorizationResponse({
    this.deviceCode,
    this.expiresIn,
    this.interval,
    this.userCode,
    this.verificationUri,
    this.verificationUriComplete,
  });
  factory StartDeviceAuthorizationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartDeviceAuthorizationResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AuthorizationPendingException extends _s.GenericAwsException {
  AuthorizationPendingException({String type, String message})
      : super(
            type: type,
            code: 'AuthorizationPendingException',
            message: message);
}

class ExpiredTokenException extends _s.GenericAwsException {
  ExpiredTokenException({String type, String message})
      : super(type: type, code: 'ExpiredTokenException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidClientException extends _s.GenericAwsException {
  InvalidClientException({String type, String message})
      : super(type: type, code: 'InvalidClientException', message: message);
}

class InvalidClientMetadataException extends _s.GenericAwsException {
  InvalidClientMetadataException({String type, String message})
      : super(
            type: type,
            code: 'InvalidClientMetadataException',
            message: message);
}

class InvalidGrantException extends _s.GenericAwsException {
  InvalidGrantException({String type, String message})
      : super(type: type, code: 'InvalidGrantException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class InvalidScopeException extends _s.GenericAwsException {
  InvalidScopeException({String type, String message})
      : super(type: type, code: 'InvalidScopeException', message: message);
}

class SlowDownException extends _s.GenericAwsException {
  SlowDownException({String type, String message})
      : super(type: type, code: 'SlowDownException', message: message);
}

class UnauthorizedClientException extends _s.GenericAwsException {
  UnauthorizedClientException({String type, String message})
      : super(
            type: type, code: 'UnauthorizedClientException', message: message);
}

class UnsupportedGrantTypeException extends _s.GenericAwsException {
  UnsupportedGrantTypeException({String type, String message})
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
