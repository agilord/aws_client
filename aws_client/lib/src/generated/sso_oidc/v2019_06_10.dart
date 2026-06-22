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

import 'v2019_06_10.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// IAM Identity Center OpenID Connect (OIDC) is a web service that enables a
/// client (such as CLI or a native application) to register with IAM Identity
/// Center. The service also enables the client to fetch the user’s access token
/// upon successful authentication and authorization with IAM Identity Center.
///
/// <b>API namespaces</b>
///
/// IAM Identity Center uses the <code>sso</code> and <code>identitystore</code>
/// API namespaces. IAM Identity Center OpenID Connect uses the
/// <code>sso-oauth</code> namespace.
///
/// <b>Considerations for using this guide</b>
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
/// that are necessary to enable single sign-on authentication with the CLI.
/// </li>
/// <li>
/// With older versions of the CLI, the service only emits OIDC access tokens,
/// so to obtain a new token, users must explicitly re-authenticate. To access
/// the OIDC flow that supports token refresh and doesn’t require
/// re-authentication, update to the latest CLI version (1.27.10 for CLI V1 and
/// 2.9.0 for CLI V2) with support for OIDC token refresh and configurable IAM
/// Identity Center session durations. For more information, see <a
/// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/configure-user-session.html">Configure
/// Amazon Web Services access portal session duration </a>.
/// </li>
/// <li>
/// The access tokens provided by this service grant access to all Amazon Web
/// Services account entitlements assigned to an IAM Identity Center user, not
/// just a particular application.
/// </li>
/// <li>
/// The documentation in this guide does not describe the mechanism to convert
/// the access token into Amazon Web Services Auth (“sigv4”) credentials for use
/// with IAM-protected Amazon Web Services service endpoints. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/singlesignon/latest/PortalAPIReference/API_GetRoleCredentials.html">GetRoleCredentials</a>
/// in the <i>IAM Identity Center Portal API Reference Guide</i>.
/// </li>
/// </ul>
/// For general information about IAM Identity Center, see <a
/// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html">What
/// is IAM Identity Center?</a> in the <i>IAM Identity Center User Guide</i>.
class SsoOidc {
  final _s.RestJsonProtocol _protocol;
  factory SsoOidc({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'oidc',
      signingName: 'sso-oauth',
    );
    return SsoOidc._(
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
  SsoOidc._({
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

  /// Creates and returns access and refresh tokens for clients that are
  /// authenticated using client secrets. The access token can be used to fetch
  /// short-lived credentials for the assigned AWS accounts or to access
  /// application APIs using <code>bearer</code> authentication.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AuthorizationPendingException].
  /// May throw [ExpiredTokenException].
  /// May throw [InternalServerException].
  /// May throw [InvalidClientException].
  /// May throw [InvalidGrantException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidScopeException].
  /// May throw [SlowDownException].
  /// May throw [UnauthorizedClientException].
  /// May throw [UnsupportedGrantTypeException].
  ///
  /// Parameter [clientId] :
  /// The unique identifier string for the client or application. This value
  /// comes from the result of the <a>RegisterClient</a> API.
  ///
  /// Parameter [clientSecret] :
  /// A secret string generated for the client. This value should come from the
  /// persisted result of the <a>RegisterClient</a> API.
  ///
  /// Parameter [grantType] :
  /// Supports the following OAuth grant types: Authorization Code, Device Code,
  /// and Refresh Token. Specify one of the following values, depending on the
  /// grant type that you want:
  ///
  /// * Authorization Code - <code>authorization_code</code>
  ///
  /// * Device Code - <code>urn:ietf:params:oauth:grant-type:device_code</code>
  ///
  /// * Refresh Token - <code>refresh_token</code>
  ///
  /// Parameter [code] :
  /// Used only when calling this API for the Authorization Code grant type. The
  /// short-lived code is used to identify this authorization request.
  ///
  /// Parameter [codeVerifier] :
  /// Used only when calling this API for the Authorization Code grant type.
  /// This value is generated by the client and presented to validate the
  /// original code challenge value the client passed at authorization time.
  ///
  /// Parameter [deviceCode] :
  /// Used only when calling this API for the Device Code grant type. This
  /// short-lived code is used to identify this authorization request. This
  /// comes from the result of the <a>StartDeviceAuthorization</a> API.
  ///
  /// Parameter [redirectUri] :
  /// Used only when calling this API for the Authorization Code grant type.
  /// This value specifies the location of the client or application that has
  /// registered to receive the authorization code.
  ///
  /// Parameter [refreshToken] :
  /// Used only when calling this API for the Refresh Token grant type. This
  /// token is used to refresh short-lived tokens, such as the access token,
  /// that might expire.
  ///
  /// For more information about the features and limitations of the current IAM
  /// Identity Center OIDC implementation, see <i>Considerations for Using this
  /// Guide</i> in the <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/Welcome.html">IAM
  /// Identity Center OIDC API Reference</a>.
  ///
  /// Parameter [scope] :
  /// The list of scopes for which authorization is requested. This parameter
  /// has no effect; the access token will always include all scopes configured
  /// during client registration.
  Future<CreateTokenResponse> createToken({
    required String clientId,
    required String clientSecret,
    required String grantType,
    String? code,
    String? codeVerifier,
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
      if (codeVerifier != null) 'codeVerifier': codeVerifier,
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

  /// Creates and returns access and refresh tokens for authorized client
  /// applications that are authenticated using any IAM entity, such as a
  /// service role or user. These tokens might contain defined scopes that
  /// specify permissions such as <code>read:profile</code> or
  /// <code>write:data</code>. Through downscoping, you can use the scopes
  /// parameter to request tokens with reduced permissions compared to the
  /// original client application's permissions or, if applicable, the refresh
  /// token's scopes. The access token can be used to fetch short-lived
  /// credentials for the assigned Amazon Web Services accounts or to access
  /// application APIs using <code>bearer</code> authentication.
  /// <note>
  /// This API is used with Signature Version 4. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_sigv.html">Amazon
  /// Web Services Signature Version 4 for API Requests</a>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AuthorizationPendingException].
  /// May throw [ExpiredTokenException].
  /// May throw [InternalServerException].
  /// May throw [InvalidClientException].
  /// May throw [InvalidGrantException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidRequestRegionException].
  /// May throw [InvalidScopeException].
  /// May throw [SlowDownException].
  /// May throw [UnauthorizedClientException].
  /// May throw [UnsupportedGrantTypeException].
  ///
  /// Parameter [clientId] :
  /// The unique identifier string for the client or application. This value is
  /// an application ARN that has OAuth grants configured.
  ///
  /// Parameter [grantType] :
  /// Supports the following OAuth grant types: Authorization Code, Refresh
  /// Token, JWT Bearer, and Token Exchange. Specify one of the following
  /// values, depending on the grant type that you want:
  ///
  /// * Authorization Code - <code>authorization_code</code>
  ///
  /// * Refresh Token - <code>refresh_token</code>
  ///
  /// * JWT Bearer - <code>urn:ietf:params:oauth:grant-type:jwt-bearer</code>
  ///
  /// * Token Exchange -
  /// <code>urn:ietf:params:oauth:grant-type:token-exchange</code>
  ///
  /// Parameter [assertion] :
  /// Used only when calling this API for the JWT Bearer grant type. This value
  /// specifies the JSON Web Token (JWT) issued by a trusted token issuer. To
  /// authorize a trusted token issuer, configure the JWT Bearer GrantOptions
  /// for the application.
  ///
  /// Parameter [code] :
  /// Used only when calling this API for the Authorization Code grant type.
  /// This short-lived code is used to identify this authorization request. The
  /// code is obtained through a redirect from IAM Identity Center to a redirect
  /// URI persisted in the Authorization Code GrantOptions for the application.
  ///
  /// Parameter [codeVerifier] :
  /// Used only when calling this API for the Authorization Code grant type.
  /// This value is generated by the client and presented to validate the
  /// original code challenge value the client passed at authorization time.
  ///
  /// Parameter [redirectUri] :
  /// Used only when calling this API for the Authorization Code grant type.
  /// This value specifies the location of the client or application that has
  /// registered to receive the authorization code.
  ///
  /// Parameter [refreshToken] :
  /// Used only when calling this API for the Refresh Token grant type. This
  /// token is used to refresh short-lived tokens, such as the access token,
  /// that might expire.
  ///
  /// For more information about the features and limitations of the current IAM
  /// Identity Center OIDC implementation, see <i>Considerations for Using this
  /// Guide</i> in the <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/Welcome.html">IAM
  /// Identity Center OIDC API Reference</a>.
  ///
  /// Parameter [requestedTokenType] :
  /// Used only when calling this API for the Token Exchange grant type. This
  /// value specifies the type of token that the requester can receive. The
  /// following values are supported:
  ///
  /// * Access Token -
  /// <code>urn:ietf:params:oauth:token-type:access_token</code>
  ///
  /// * Refresh Token -
  /// <code>urn:ietf:params:oauth:token-type:refresh_token</code>
  ///
  /// Parameter [scope] :
  /// The list of scopes for which authorization is requested. The access token
  /// that is issued is limited to the scopes that are granted. If the value is
  /// not specified, IAM Identity Center authorizes all scopes configured for
  /// the application, including the following default scopes:
  /// <code>openid</code>, <code>aws</code>, <code>sts:identity_context</code>.
  ///
  /// Parameter [subjectToken] :
  /// Used only when calling this API for the Token Exchange grant type. This
  /// value specifies the subject of the exchange. The value of the subject
  /// token must be an access token issued by IAM Identity Center to a different
  /// client or application. The access token must have authorized scopes that
  /// indicate the requested application as a target audience.
  ///
  /// Parameter [subjectTokenType] :
  /// Used only when calling this API for the Token Exchange grant type. This
  /// value specifies the type of token that is passed as the subject of the
  /// exchange. The following value is supported:
  ///
  /// * Access Token -
  /// <code>urn:ietf:params:oauth:token-type:access_token</code>
  Future<CreateTokenWithIAMResponse> createTokenWithIAM({
    required String clientId,
    required String grantType,
    String? assertion,
    String? code,
    String? codeVerifier,
    String? redirectUri,
    String? refreshToken,
    String? requestedTokenType,
    List<String>? scope,
    String? subjectToken,
    String? subjectTokenType,
  }) async {
    final $payload = <String, dynamic>{
      'clientId': clientId,
      'grantType': grantType,
      if (assertion != null) 'assertion': assertion,
      if (code != null) 'code': code,
      if (codeVerifier != null) 'codeVerifier': codeVerifier,
      if (redirectUri != null) 'redirectUri': redirectUri,
      if (refreshToken != null) 'refreshToken': refreshToken,
      if (requestedTokenType != null) 'requestedTokenType': requestedTokenType,
      if (scope != null) 'scope': scope,
      if (subjectToken != null) 'subjectToken': subjectToken,
      if (subjectTokenType != null) 'subjectTokenType': subjectTokenType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/token?aws_iam=t',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTokenWithIAMResponse.fromJson(response);
  }

  /// Registers a public client with IAM Identity Center. This allows clients to
  /// perform authorization using the authorization code grant with Proof Key
  /// for Code Exchange (PKCE) or the device code grant.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidClientMetadataException].
  /// May throw [InvalidRedirectUriException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidScopeException].
  /// May throw [SlowDownException].
  /// May throw [UnsupportedGrantTypeException].
  ///
  /// Parameter [clientName] :
  /// The friendly name of the client.
  ///
  /// Parameter [clientType] :
  /// The type of client. The service supports only <code>public</code> as a
  /// client type. Anything other than public will be rejected by the service.
  ///
  /// Parameter [entitledApplicationArn] :
  /// This IAM Identity Center application ARN is used to define
  /// administrator-managed configuration for public client access to resources.
  /// At authorization, the scopes, grants, and redirect URI available to this
  /// client will be restricted by this application resource.
  ///
  /// Parameter [grantTypes] :
  /// The list of OAuth 2.0 grant types that are defined by the client. This
  /// list is used to restrict the token granting flows available to the client.
  /// Supports the following OAuth 2.0 grant types: Authorization Code, Device
  /// Code, and Refresh Token.
  ///
  /// * Authorization Code - <code>authorization_code</code>
  ///
  /// * Device Code - <code>urn:ietf:params:oauth:grant-type:device_code</code>
  ///
  /// * Refresh Token - <code>refresh_token</code>
  ///
  /// Parameter [issuerUrl] :
  /// The IAM Identity Center Issuer URL associated with an instance of IAM
  /// Identity Center. This value is needed for user access to resources through
  /// the client.
  ///
  /// Parameter [redirectUris] :
  /// The list of redirect URI that are defined by the client. At completion of
  /// authorization, this list is used to restrict what locations the user agent
  /// can be redirected back to.
  ///
  /// Parameter [scopes] :
  /// The list of scopes that are defined by the client. Upon authorization,
  /// this list is used to restrict permissions when granting an access token.
  Future<RegisterClientResponse> registerClient({
    required String clientName,
    required String clientType,
    String? entitledApplicationArn,
    List<String>? grantTypes,
    String? issuerUrl,
    List<String>? redirectUris,
    List<String>? scopes,
  }) async {
    final $payload = <String, dynamic>{
      'clientName': clientName,
      'clientType': clientType,
      if (entitledApplicationArn != null)
        'entitledApplicationArn': entitledApplicationArn,
      if (grantTypes != null) 'grantTypes': grantTypes,
      if (issuerUrl != null) 'issuerUrl': issuerUrl,
      if (redirectUris != null) 'redirectUris': redirectUris,
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
  /// May throw [InternalServerException].
  /// May throw [InvalidClientException].
  /// May throw [InvalidRequestException].
  /// May throw [SlowDownException].
  /// May throw [UnauthorizedClientException].
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
  /// The URL for the Amazon Web Services access portal. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/using-the-portal.html">Using
  /// the Amazon Web Services access portal</a> in the <i>IAM Identity Center
  /// User Guide</i>.
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

/// @nodoc
class CreateTokenResponse {
  /// A bearer token to access Amazon Web Services accounts and applications
  /// assigned to a user.
  final String? accessToken;

  /// Indicates the time in seconds when an access token will expire.
  final int? expiresIn;

  /// The <code>idToken</code> is not implemented or supported. For more
  /// information about the features and limitations of the current IAM Identity
  /// Center OIDC implementation, see <i>Considerations for Using this Guide</i>
  /// in the <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/Welcome.html">IAM
  /// Identity Center OIDC API Reference</a>.
  ///
  /// A JSON Web Token (JWT) that identifies who is associated with the issued
  /// access token.
  final String? idToken;

  /// A token that, if present, can be used to refresh a previously issued access
  /// token that might have expired.
  ///
  /// For more information about the features and limitations of the current IAM
  /// Identity Center OIDC implementation, see <i>Considerations for Using this
  /// Guide</i> in the <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/Welcome.html">IAM
  /// Identity Center OIDC API Reference</a>.
  final String? refreshToken;

  /// Used to notify the client that the returned token is an access token. The
  /// supported token type is <code>Bearer</code>.
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

  Map<String, dynamic> toJson() {
    final accessToken = this.accessToken;
    final expiresIn = this.expiresIn;
    final idToken = this.idToken;
    final refreshToken = this.refreshToken;
    final tokenType = this.tokenType;
    return {
      if (accessToken != null) 'accessToken': accessToken,
      if (expiresIn != null) 'expiresIn': expiresIn,
      if (idToken != null) 'idToken': idToken,
      if (refreshToken != null) 'refreshToken': refreshToken,
      if (tokenType != null) 'tokenType': tokenType,
    };
  }
}

/// @nodoc
class CreateTokenWithIAMResponse {
  /// A bearer token to access Amazon Web Services accounts and applications
  /// assigned to a user.
  final String? accessToken;

  /// A structure containing information from IAM Identity Center managed user and
  /// group information.
  final AwsAdditionalDetails? awsAdditionalDetails;

  /// Indicates the time in seconds when an access token will expire.
  final int? expiresIn;

  /// A JSON Web Token (JWT) that identifies the user associated with the issued
  /// access token.
  final String? idToken;

  /// Indicates the type of tokens that are issued by IAM Identity Center. The
  /// following values are supported:
  ///
  /// * Access Token - <code>urn:ietf:params:oauth:token-type:access_token</code>
  ///
  /// * Refresh Token -
  /// <code>urn:ietf:params:oauth:token-type:refresh_token</code>
  final String? issuedTokenType;

  /// A token that, if present, can be used to refresh a previously issued access
  /// token that might have expired.
  ///
  /// For more information about the features and limitations of the current IAM
  /// Identity Center OIDC implementation, see <i>Considerations for Using this
  /// Guide</i> in the <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/Welcome.html">IAM
  /// Identity Center OIDC API Reference</a>.
  final String? refreshToken;

  /// The list of scopes for which authorization is granted. The access token that
  /// is issued is limited to the scopes that are granted.
  final List<String>? scope;

  /// Used to notify the requester that the returned token is an access token. The
  /// supported token type is <code>Bearer</code>.
  final String? tokenType;

  CreateTokenWithIAMResponse({
    this.accessToken,
    this.awsAdditionalDetails,
    this.expiresIn,
    this.idToken,
    this.issuedTokenType,
    this.refreshToken,
    this.scope,
    this.tokenType,
  });

  factory CreateTokenWithIAMResponse.fromJson(Map<String, dynamic> json) {
    return CreateTokenWithIAMResponse(
      accessToken: json['accessToken'] as String?,
      awsAdditionalDetails: json['awsAdditionalDetails'] != null
          ? AwsAdditionalDetails.fromJson(
              json['awsAdditionalDetails'] as Map<String, dynamic>)
          : null,
      expiresIn: json['expiresIn'] as int?,
      idToken: json['idToken'] as String?,
      issuedTokenType: json['issuedTokenType'] as String?,
      refreshToken: json['refreshToken'] as String?,
      scope:
          (json['scope'] as List?)?.nonNulls.map((e) => e as String).toList(),
      tokenType: json['tokenType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessToken = this.accessToken;
    final awsAdditionalDetails = this.awsAdditionalDetails;
    final expiresIn = this.expiresIn;
    final idToken = this.idToken;
    final issuedTokenType = this.issuedTokenType;
    final refreshToken = this.refreshToken;
    final scope = this.scope;
    final tokenType = this.tokenType;
    return {
      if (accessToken != null) 'accessToken': accessToken,
      if (awsAdditionalDetails != null)
        'awsAdditionalDetails': awsAdditionalDetails,
      if (expiresIn != null) 'expiresIn': expiresIn,
      if (idToken != null) 'idToken': idToken,
      if (issuedTokenType != null) 'issuedTokenType': issuedTokenType,
      if (refreshToken != null) 'refreshToken': refreshToken,
      if (scope != null) 'scope': scope,
      if (tokenType != null) 'tokenType': tokenType,
    };
  }
}

/// @nodoc
class RegisterClientResponse {
  /// An endpoint that the client can use to request authorization.
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

  /// An endpoint that the client can use to create tokens.
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

  Map<String, dynamic> toJson() {
    final authorizationEndpoint = this.authorizationEndpoint;
    final clientId = this.clientId;
    final clientIdIssuedAt = this.clientIdIssuedAt;
    final clientSecret = this.clientSecret;
    final clientSecretExpiresAt = this.clientSecretExpiresAt;
    final tokenEndpoint = this.tokenEndpoint;
    return {
      if (authorizationEndpoint != null)
        'authorizationEndpoint': authorizationEndpoint,
      if (clientId != null) 'clientId': clientId,
      if (clientIdIssuedAt != null) 'clientIdIssuedAt': clientIdIssuedAt,
      if (clientSecret != null) 'clientSecret': clientSecret,
      if (clientSecretExpiresAt != null)
        'clientSecretExpiresAt': clientSecretExpiresAt,
      if (tokenEndpoint != null) 'tokenEndpoint': tokenEndpoint,
    };
  }
}

/// @nodoc
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

  Map<String, dynamic> toJson() {
    final deviceCode = this.deviceCode;
    final expiresIn = this.expiresIn;
    final interval = this.interval;
    final userCode = this.userCode;
    final verificationUri = this.verificationUri;
    final verificationUriComplete = this.verificationUriComplete;
    return {
      if (deviceCode != null) 'deviceCode': deviceCode,
      if (expiresIn != null) 'expiresIn': expiresIn,
      if (interval != null) 'interval': interval,
      if (userCode != null) 'userCode': userCode,
      if (verificationUri != null) 'verificationUri': verificationUri,
      if (verificationUriComplete != null)
        'verificationUriComplete': verificationUriComplete,
    };
  }
}

/// This structure contains Amazon Web Services-specific parameter extensions
/// and the <a
/// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/trustedidentitypropagation-overview.html">identity
/// context</a>.
///
/// @nodoc
class AwsAdditionalDetails {
  /// The trusted context assertion is signed and encrypted by STS. It provides
  /// access to <code>sts:identity_context</code> claim in the
  /// <code>idToken</code> without JWT parsing
  ///
  /// Identity context comprises information that Amazon Web Services services use
  /// to make authorization decisions when they receive requests.
  final String? identityContext;

  AwsAdditionalDetails({
    this.identityContext,
  });

  factory AwsAdditionalDetails.fromJson(Map<String, dynamic> json) {
    return AwsAdditionalDetails(
      identityContext: json['identityContext'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityContext = this.identityContext;
    return {
      if (identityContext != null) 'identityContext': identityContext,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class AuthorizationPendingException extends _s.GenericAwsException {
  AuthorizationPendingException({String? type, String? message})
      : super(
            type: type,
            code: 'AuthorizationPendingException',
            message: message);
}

/// @nodoc
class ExpiredTokenException extends _s.GenericAwsException {
  ExpiredTokenException({String? type, String? message})
      : super(type: type, code: 'ExpiredTokenException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class InvalidClientException extends _s.GenericAwsException {
  InvalidClientException({String? type, String? message})
      : super(type: type, code: 'InvalidClientException', message: message);
}

/// @nodoc
class InvalidClientMetadataException extends _s.GenericAwsException {
  InvalidClientMetadataException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidClientMetadataException',
            message: message);
}

/// @nodoc
class InvalidGrantException extends _s.GenericAwsException {
  InvalidGrantException({String? type, String? message})
      : super(type: type, code: 'InvalidGrantException', message: message);
}

/// @nodoc
class InvalidRedirectUriException extends _s.GenericAwsException {
  InvalidRedirectUriException({String? type, String? message})
      : super(
            type: type, code: 'InvalidRedirectUriException', message: message);
}

/// @nodoc
class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

/// @nodoc
class InvalidRequestRegionException extends _s.GenericAwsException {
  InvalidRequestRegionException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidRequestRegionException',
            message: message);
}

/// @nodoc
class InvalidScopeException extends _s.GenericAwsException {
  InvalidScopeException({String? type, String? message})
      : super(type: type, code: 'InvalidScopeException', message: message);
}

/// @nodoc
class SlowDownException extends _s.GenericAwsException {
  SlowDownException({String? type, String? message})
      : super(type: type, code: 'SlowDownException', message: message);
}

/// @nodoc
class UnauthorizedClientException extends _s.GenericAwsException {
  UnauthorizedClientException({String? type, String? message})
      : super(
            type: type, code: 'UnauthorizedClientException', message: message);
}

/// @nodoc
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
  'InvalidRedirectUriException': (type, message) =>
      InvalidRedirectUriException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'InvalidRequestRegionException': (type, message) =>
      InvalidRequestRegionException(type: type, message: message),
  'InvalidScopeException': (type, message) =>
      InvalidScopeException(type: type, message: message),
  'SlowDownException': (type, message) =>
      SlowDownException(type: type, message: message),
  'UnauthorizedClientException': (type, message) =>
      UnauthorizedClientException(type: type, message: message),
  'UnsupportedGrantTypeException': (type, message) =>
      UnsupportedGrantTypeException(type: type, message: message),
};
