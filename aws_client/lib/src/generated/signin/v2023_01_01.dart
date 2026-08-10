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
  final _s.ServiceMetadata _service;
  final String? _region;
  final String? _endpointUrl;
  final bool _useFipsEndpoint;
  final bool _useDualStackEndpoint;
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
      service: service,
      region: region,
      endpointUrl: endpointUrl,
      useFipsEndpoint: useFipsEndpoint,
      useDualStackEndpoint: useDualStackEndpoint,
    );
  }
  Signin._({
    required _s.RestJsonProtocol protocol,
    required _s.ServiceMetadata service,
    required String? region,
    required String? endpointUrl,
    required bool useFipsEndpoint,
    required bool useDualStackEndpoint,
  })  : _protocol = protocol,
        _service = service,
        _region = region,
        _endpointUrl = endpointUrl,
        _useFipsEndpoint = useFipsEndpoint,
        _useDualStackEndpoint = useDualStackEndpoint;
  _s.Endpoint _resolveEndpoint({
    bool? isControlPlane,
    bool? isoAuthEndpoint,
  }) {
    return _s.Endpoint.fromResolved(
      _endpoints.resolveEndpoint(
        region: _region,
        endpoint: _endpointUrl,
        useFips: _useFipsEndpoint,
        useDualStack: _useDualStackEndpoint,
        isControlPlane: isControlPlane,
        isoAuthEndpoint: isoAuthEndpoint,
      ),
      service: _service,
      region: _region,
    );
  }

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
      endpoint: _resolveEndpoint(
        isControlPlane: false,
      ),
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateOAuth2TokenResponse(
      tokenOutput: CreateOAuth2TokenResponseBody.fromJson($json),
    );
  }

  /// Grants permission to exchange client credentials for an OAuth 2.0 access
  /// token scoped to a resource that can be used to access AWS services from
  /// applications
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsError].
  /// May throw [ValidationException].
  ///
  /// Parameter [grantType] :
  /// OAuth 2.0 grant type. Must be "client_credentials".
  ///
  /// Parameter [resource] :
  /// The OAuth resource for which the access token is requested. Example:
  /// "aws-mcp.amazonaws.com".
  Future<CreateOAuth2TokenWithIAMResponse> createOAuth2TokenWithIAM({
    required String grantType,
    required String resource,
  }) async {
    final $payload = <String, dynamic>{
      'grant_type': grantType,
      'resource': resource,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/token?x-amz-client-auth-method=iam',
      endpoint: _resolveEndpoint(
        isoAuthEndpoint: true,
      ),
      exceptionFnMap: _exceptionFns,
    );
    return CreateOAuth2TokenWithIAMResponse.fromJson(response);
  }

  /// Delete console authorization configuration with automatic scope detection
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsError].
  /// May throw [ValidationException].
  ///
  /// Parameter [targetId] :
  /// Target account identifier
  Future<DeleteConsoleAuthorizationConfigurationOutput>
      deleteConsoleAuthorizationConfiguration({
    String? targetId,
  }) async {
    final $payload = <String, dynamic>{
      if (targetId != null) 'targetId': targetId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-console-authorization-configuration',
      endpoint: _resolveEndpoint(
        isControlPlane: true,
      ),
      exceptionFnMap: _exceptionFns,
    );
    return DeleteConsoleAuthorizationConfigurationOutput.fromJson(response);
  }

  /// Remove a permission statement from the account's SignIn resource-based
  /// policy
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsError].
  /// May throw [ValidationException].
  ///
  /// Parameter [statementId] :
  /// Unique identifier of the permission statement to delete
  ///
  /// Parameter [clientToken] :
  /// Idempotency token for the request
  Future<void> deleteResourcePermissionStatement({
    required String statementId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'statementId': statementId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-resource-permission-statement',
      endpoint: _resolveEndpoint(
        isControlPlane: true,
      ),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get console authorization configuration with automatic scope detection
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsError].
  /// May throw [ValidationException].
  ///
  /// Parameter [targetId] :
  /// Target account identifier
  Future<GetConsoleAuthorizationConfigurationOutput>
      getConsoleAuthorizationConfiguration({
    String? targetId,
  }) async {
    final $payload = <String, dynamic>{
      if (targetId != null) 'targetId': targetId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-console-authorization-configuration',
      endpoint: _resolveEndpoint(
        isControlPlane: true,
      ),
      exceptionFnMap: _exceptionFns,
    );
    return GetConsoleAuthorizationConfigurationOutput.fromJson(response);
  }

  /// Retrieve the account's consolidated SignIn resource-based policy
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsError].
  Future<GetResourcePolicyOutput> getResourcePolicy() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/get-resource-policy',
      endpoint: _resolveEndpoint(
        isControlPlane: true,
      ),
      exceptionFnMap: _exceptionFns,
    );
    return GetResourcePolicyOutput.fromJson(response);
  }

  /// Grants permission to inspect the metadata and state of an OAuth 2.0 access
  /// token or refresh token Implements RFC 7662 OAuth 2.0 Token Introspection
  /// over a SigV4-authenticated endpoint. Inspects the metadata of an
  /// access_token or refresh_token issued by AWS Sign-In and returns the claims
  /// associated with it. Inactive token semantics (RFC 7662 §2.2): when the
  /// supplied token is unknown, expired, revoked, malformed, or owned by a
  /// different account, the response body is exactly { "active": false } with
  /// all other claims omitted.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsError].
  /// May throw [ValidationException].
  ///
  /// Parameter [token] :
  /// The string value of the token to introspect. May be either an access_token
  /// or a refresh_token issued by AWS Sign-In.
  ///
  /// Parameter [tokenTypeHint] :
  /// Optional hint about the type of the token submitted for introspection. The
  /// server uses this hint to optimize lookup, but still falls back to the
  /// other token type on miss. Allowed values: access_token, refresh_token.
  Future<IntrospectOAuth2TokenWithIAMResponse> introspectOAuth2TokenWithIAM({
    required String token,
    String? tokenTypeHint,
  }) async {
    final $payload = <String, dynamic>{
      'token': token,
      if (tokenTypeHint != null) 'token_type_hint': tokenTypeHint,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/introspect?x-amz-client-auth-method=iam',
      endpoint: _resolveEndpoint(
        isoAuthEndpoint: true,
      ),
      exceptionFnMap: _exceptionFns,
    );
    return IntrospectOAuth2TokenWithIAMResponse.fromJson(response);
  }

  /// Retrieve all permission statements in the account's SignIn resource-based
  /// policy
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsError].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return
  ///
  /// Parameter [nextToken] :
  /// Token for pagination
  Future<ListResourcePermissionStatementsOutput>
      listResourcePermissionStatements({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-resource-permission-statements',
      endpoint: _resolveEndpoint(
        isControlPlane: true,
      ),
      exceptionFnMap: _exceptionFns,
    );
    return ListResourcePermissionStatementsOutput.fromJson(response);
  }

  /// Enable console authorization configuration with automatic scope detection
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsError].
  /// May throw [ValidationException].
  ///
  /// Parameter [targetId] :
  /// Target account identifier
  Future<PutConsoleAuthorizationConfigurationOutput>
      putConsoleAuthorizationConfiguration({
    String? targetId,
  }) async {
    final $payload = <String, dynamic>{
      if (targetId != null) 'targetId': targetId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/put-console-authorization-configuration',
      endpoint: _resolveEndpoint(
        isControlPlane: true,
      ),
      exceptionFnMap: _exceptionFns,
    );
    return PutConsoleAuthorizationConfigurationOutput.fromJson(response);
  }

  /// Create a permission statement in the account's SignIn resource-based
  /// policy
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [TooManyRequestsError].
  /// May throw [ValidationException].
  ///
  /// Parameter [clientToken] :
  /// Idempotency token for the request
  ///
  /// Parameter [consoleSourceVpce] :
  /// Console VPC endpoint identifier
  ///
  /// Parameter [excludedPrincipal] :
  /// Principal to exclude from the permission statement
  ///
  /// Parameter [requestedRegion] :
  /// AWS region where the VPC and VPC endpoint reside Required when sourceVpc
  /// or signinSourceVpce/consoleSourceVpce is provided
  ///
  /// Parameter [signinSourceVpce] :
  /// SignIn VPC endpoint identifier
  ///
  /// Parameter [sourceIp] :
  /// Source IP address
  ///
  /// Parameter [sourceVpc] :
  /// VPC identifier to restrict console access
  ///
  /// Parameter [vpcSourceIp] :
  /// Source IP address within VPC
  Future<PutResourcePermissionStatementOutput> putResourcePermissionStatement({
    String? clientToken,
    String? consoleSourceVpce,
    String? excludedPrincipal,
    String? requestedRegion,
    String? signinSourceVpce,
    String? sourceIp,
    String? sourceVpc,
    String? vpcSourceIp,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (consoleSourceVpce != null) 'consoleSourceVpce': consoleSourceVpce,
      if (excludedPrincipal != null) 'excludedPrincipal': excludedPrincipal,
      if (requestedRegion != null) 'requestedRegion': requestedRegion,
      if (signinSourceVpce != null) 'signinSourceVpce': signinSourceVpce,
      if (sourceIp != null) 'sourceIp': sourceIp,
      if (sourceVpc != null) 'sourceVpc': sourceVpc,
      if (vpcSourceIp != null) 'vpcSourceIp': vpcSourceIp,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/put-resource-permission-statement',
      endpoint: _resolveEndpoint(
        isControlPlane: true,
      ),
      exceptionFnMap: _exceptionFns,
    );
    return PutResourcePermissionStatementOutput.fromJson(response);
  }

  /// Grants permission to revoke an OAuth 2.0 refresh token and its associated
  /// refresh tokens Revokes a refresh_token issued by AWS Sign-In, invalidating
  /// the entire token chain so that the refresh_token can no longer be used to
  /// mint new access_tokens. Idempotency: revoking an already-revoked, expired,
  /// or otherwise invalid token still returns 200 OK with an empty body. Only
  /// the refresh_token type is accepted.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsError].
  /// May throw [ValidationException].
  ///
  /// Parameter [token] :
  /// The refresh_token to revoke. Must be a refresh_token issued by AWS Sign-In
  /// (prefix "ASOR"); access_tokens are not accepted for revocation.
  Future<void> revokeOAuth2TokenWithIAM({
    required String token,
  }) async {
    final $payload = <String, dynamic>{
      'token': token,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/revoke?x-amz-client-auth-method=iam',
      endpoint: _resolveEndpoint(
        isoAuthEndpoint: true,
      ),
      exceptionFnMap: _exceptionFns,
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

/// Output structure for CreateOAuth2TokenWithIAM operation Contains the JWT
/// access token, token type, and expiration per RFC 6749 §5.1.
///
/// @nodoc
class CreateOAuth2TokenWithIAMResponse {
  /// JWT access token containing principal identity, resource scope, and session
  /// metadata
  final String accessToken;

  /// Token lifetime in seconds. Value is the minimum of session validity and 1
  /// hour.
  final int expiresIn;

  /// Always "Bearer" per OAuth 2.1 specification
  final String tokenType;

  CreateOAuth2TokenWithIAMResponse({
    required this.accessToken,
    required this.expiresIn,
    required this.tokenType,
  });

  factory CreateOAuth2TokenWithIAMResponse.fromJson(Map<String, dynamic> json) {
    return CreateOAuth2TokenWithIAMResponse(
      accessToken: (json['access_token'] as String?) ?? '',
      expiresIn: (json['expires_in'] as int?) ?? 0,
      tokenType: (json['token_type'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accessToken = this.accessToken;
    final expiresIn = this.expiresIn;
    final tokenType = this.tokenType;
    return {
      'access_token': accessToken,
      'expires_in': expiresIn,
      'token_type': tokenType,
    };
  }
}

/// Output for DeleteConsoleAuthorizationConfiguration operation
///
/// @nodoc
class DeleteConsoleAuthorizationConfigurationOutput {
  /// Whether console authorization is enabled
  final bool consoleAuthorizationEnabled;

  /// Authorization scope
  final String scope;

  /// Target account identifier
  final String targetId;

  DeleteConsoleAuthorizationConfigurationOutput({
    required this.consoleAuthorizationEnabled,
    required this.scope,
    required this.targetId,
  });

  factory DeleteConsoleAuthorizationConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return DeleteConsoleAuthorizationConfigurationOutput(
      consoleAuthorizationEnabled:
          (json['consoleAuthorizationEnabled'] as bool?) ?? false,
      scope: (json['scope'] as String?) ?? '',
      targetId: (json['targetId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final consoleAuthorizationEnabled = this.consoleAuthorizationEnabled;
    final scope = this.scope;
    final targetId = this.targetId;
    return {
      'consoleAuthorizationEnabled': consoleAuthorizationEnabled,
      'scope': scope,
      'targetId': targetId,
    };
  }
}

/// Output for DeleteResourcePermissionStatement operation
///
/// @nodoc
class DeleteResourcePermissionStatementOutput {
  DeleteResourcePermissionStatementOutput();

  factory DeleteResourcePermissionStatementOutput.fromJson(
      Map<String, dynamic> _) {
    return DeleteResourcePermissionStatementOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Output for GetConsoleAuthorizationConfiguration operation
///
/// @nodoc
class GetConsoleAuthorizationConfigurationOutput {
  /// Whether console authorization is enabled
  final bool consoleAuthorizationEnabled;

  /// Authorization scope
  final String scope;

  /// Target account identifier
  final String targetId;

  GetConsoleAuthorizationConfigurationOutput({
    required this.consoleAuthorizationEnabled,
    required this.scope,
    required this.targetId,
  });

  factory GetConsoleAuthorizationConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return GetConsoleAuthorizationConfigurationOutput(
      consoleAuthorizationEnabled:
          (json['consoleAuthorizationEnabled'] as bool?) ?? false,
      scope: (json['scope'] as String?) ?? '',
      targetId: (json['targetId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final consoleAuthorizationEnabled = this.consoleAuthorizationEnabled;
    final scope = this.scope;
    final targetId = this.targetId;
    return {
      'consoleAuthorizationEnabled': consoleAuthorizationEnabled,
      'scope': scope,
      'targetId': targetId,
    };
  }
}

/// Output for GetResourcePolicy operation
///
/// @nodoc
class GetResourcePolicyOutput {
  /// The account's SignIn resource-based policy
  final SigninResourceBasedPolicy signinResourceBasedPolicy;

  GetResourcePolicyOutput({
    required this.signinResourceBasedPolicy,
  });

  factory GetResourcePolicyOutput.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyOutput(
      signinResourceBasedPolicy: SigninResourceBasedPolicy.fromJson(
          (json['signinResourceBasedPolicy'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final signinResourceBasedPolicy = this.signinResourceBasedPolicy;
    return {
      'signinResourceBasedPolicy': signinResourceBasedPolicy,
    };
  }
}

/// Output structure for IntrospectOAuth2TokenWithIAM operation RFC 7662 §2.2
/// introspection response. Only `active` is required; all other claims are
/// omitted when the token is inactive.
///
/// @nodoc
class IntrospectOAuth2TokenWithIAMResponse {
  /// Indicates whether the token is currently active. `true` only when the token
  /// is valid, has not expired, has not been revoked, and belongs to the caller's
  /// account.
  final bool active;

  /// 12-digit AWS account ID of the token's subject principal.
  final String? accountId;

  /// Audience of the token: the OAuth resource the token is scoped to (for
  /// example, "aws-mcp.amazonaws.com"). Omitted for refresh tokens.
  final String? aud;

  /// Client identifier for the OAuth 2.0 client that requested the token.
  final String? clientId;

  /// Token expiration time as a NumericDate (Unix epoch seconds).
  final int? exp;

  /// Token issuance time as a NumericDate (Unix epoch seconds).
  final int? iat;

  /// Issuer of the token. Always "signin.amazonaws.com" for AWS Sign-In.
  final String? iss;

  /// Unique identifier for the token.
  final String? jti;

  /// Token "not before" time as a NumericDate (Unix epoch seconds).
  final int? nbf;

  /// The OAuth resource the token is scoped to during Human OAuth flow. Only
  /// present for refresh token introspection.
  final String? resource;

  /// AWS Sign-In session ARN bound to the token, of the form
  /// arn:aws:signin:{region}:{account}:session/{uuid}.
  final String? signinSession;

  /// Subject of the token: the IAM principal ARN. For assumed-role sessions, this
  /// is the session ARN (matches sts:GetCallerIdentity's `Arn` field), e.g.
  /// arn:aws:sts::123456789012:assumed-role/MyRole/session-name.
  final String? sub;

  /// Indicates which kind of token was introspected. One of "access_token" or
  /// "refresh_token".
  final String? tokenType;

  /// User identifier matching sts:GetCallerIdentity's `UserId` field for the
  /// token's subject principal (e.g. "AIDAEXAMPLE" for an IAM user, or
  /// "AROAEXAMPLE:session-name" for an assumed role).
  final String? userId;

  IntrospectOAuth2TokenWithIAMResponse({
    required this.active,
    this.accountId,
    this.aud,
    this.clientId,
    this.exp,
    this.iat,
    this.iss,
    this.jti,
    this.nbf,
    this.resource,
    this.signinSession,
    this.sub,
    this.tokenType,
    this.userId,
  });

  factory IntrospectOAuth2TokenWithIAMResponse.fromJson(
      Map<String, dynamic> json) {
    return IntrospectOAuth2TokenWithIAMResponse(
      active: (json['active'] as bool?) ?? false,
      accountId: json['account_id'] as String?,
      aud: json['aud'] as String?,
      clientId: json['client_id'] as String?,
      exp: json['exp'] as int?,
      iat: json['iat'] as int?,
      iss: json['iss'] as String?,
      jti: json['jti'] as String?,
      nbf: json['nbf'] as int?,
      resource: json['resource'] as String?,
      signinSession: json['signin_session'] as String?,
      sub: json['sub'] as String?,
      tokenType: json['token_type'] as String?,
      userId: json['user_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final active = this.active;
    final accountId = this.accountId;
    final aud = this.aud;
    final clientId = this.clientId;
    final exp = this.exp;
    final iat = this.iat;
    final iss = this.iss;
    final jti = this.jti;
    final nbf = this.nbf;
    final resource = this.resource;
    final signinSession = this.signinSession;
    final sub = this.sub;
    final tokenType = this.tokenType;
    final userId = this.userId;
    return {
      'active': active,
      if (accountId != null) 'account_id': accountId,
      if (aud != null) 'aud': aud,
      if (clientId != null) 'client_id': clientId,
      if (exp != null) 'exp': exp,
      if (iat != null) 'iat': iat,
      if (iss != null) 'iss': iss,
      if (jti != null) 'jti': jti,
      if (nbf != null) 'nbf': nbf,
      if (resource != null) 'resource': resource,
      if (signinSession != null) 'signin_session': signinSession,
      if (sub != null) 'sub': sub,
      if (tokenType != null) 'token_type': tokenType,
      if (userId != null) 'user_id': userId,
    };
  }
}

/// Output for ListResourcePermissionStatements operation
///
/// @nodoc
class ListResourcePermissionStatementsOutput {
  /// List of permission statement summaries
  final List<PermissionStatementSummary> permissionStatements;

  /// Token for next page of results
  final String? nextToken;

  ListResourcePermissionStatementsOutput({
    required this.permissionStatements,
    this.nextToken,
  });

  factory ListResourcePermissionStatementsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListResourcePermissionStatementsOutput(
      permissionStatements: ((json['permissionStatements'] as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              PermissionStatementSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final permissionStatements = this.permissionStatements;
    final nextToken = this.nextToken;
    return {
      'permissionStatements': permissionStatements,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Output for PutConsoleAuthorizationConfiguration operation
///
/// @nodoc
class PutConsoleAuthorizationConfigurationOutput {
  /// Whether console authorization is enabled
  final bool consoleAuthorizationEnabled;

  /// Authorization scope
  final String scope;

  /// Target account identifier
  final String targetId;

  PutConsoleAuthorizationConfigurationOutput({
    required this.consoleAuthorizationEnabled,
    required this.scope,
    required this.targetId,
  });

  factory PutConsoleAuthorizationConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return PutConsoleAuthorizationConfigurationOutput(
      consoleAuthorizationEnabled:
          (json['consoleAuthorizationEnabled'] as bool?) ?? false,
      scope: (json['scope'] as String?) ?? '',
      targetId: (json['targetId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final consoleAuthorizationEnabled = this.consoleAuthorizationEnabled;
    final scope = this.scope;
    final targetId = this.targetId;
    return {
      'consoleAuthorizationEnabled': consoleAuthorizationEnabled,
      'scope': scope,
      'targetId': targetId,
    };
  }
}

/// Output for PutResourcePermissionStatement operation
///
/// @nodoc
class PutResourcePermissionStatementOutput {
  /// Unique identifier for the created permission statement
  final String statementId;

  PutResourcePermissionStatementOutput({
    required this.statementId,
  });

  factory PutResourcePermissionStatementOutput.fromJson(
      Map<String, dynamic> json) {
    return PutResourcePermissionStatementOutput(
      statementId: (json['statementId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final statementId = this.statementId;
    return {
      'statementId': statementId,
    };
  }
}

/// Output structure for RevokeOAuth2TokenWithIAM operation RFC 7009 §2.2
/// revocation response. The endpoint returns 200 OK with an empty body on
/// success; there are no response fields.
///
/// @nodoc
class RevokeOAuth2TokenWithIAMResponse {
  RevokeOAuth2TokenWithIAMResponse();

  factory RevokeOAuth2TokenWithIAMResponse.fromJson(Map<String, dynamic> _) {
    return RevokeOAuth2TokenWithIAMResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Summary of a permission statement
///
/// @nodoc
class PermissionStatementSummary {
  /// Unique identifier for the permission statement
  final String sid;

  /// Condition block for the permission statement
  final Map<String, Map<String, List<String>>>? condition;

  PermissionStatementSummary({
    required this.sid,
    this.condition,
  });

  factory PermissionStatementSummary.fromJson(Map<String, dynamic> json) {
    return PermissionStatementSummary(
      sid: (json['sid'] as String?) ?? '',
      condition: (json['condition'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              (e as Map<String, dynamic>).map((k, e) => MapEntry(
                  k, (e as List).nonNulls.map((e) => e as String).toList())))),
    );
  }

  Map<String, dynamic> toJson() {
    final sid = this.sid;
    final condition = this.condition;
    return {
      'sid': sid,
      if (condition != null) 'condition': condition,
    };
  }
}

/// SignIn resource-based policy document
///
/// @nodoc
class SigninResourceBasedPolicy {
  /// Policy statements
  final List<PolicyStatement>? statement;

  /// Policy version
  final String? version;

  SigninResourceBasedPolicy({
    this.statement,
    this.version,
  });

  factory SigninResourceBasedPolicy.fromJson(Map<String, dynamic> json) {
    return SigninResourceBasedPolicy(
      statement: (json['Statement'] as List?)
          ?.nonNulls
          .map((e) => PolicyStatement.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statement = this.statement;
    final version = this.version;
    return {
      if (statement != null) 'Statement': statement,
      if (version != null) 'Version': version,
    };
  }
}

/// Individual policy statement within a resource-based policy
///
/// @nodoc
class PolicyStatement {
  /// Actions the statement controls
  final List<String>? action;

  /// Condition block for the statement
  final Map<String, Map<String, List<String>>>? condition;

  /// Effect of the policy statement (Allow/Deny)
  final String? effect;

  /// Principal the statement applies to
  final Map<String, String>? principal;

  /// Resource the statement applies to
  final String? resource;

  PolicyStatement({
    this.action,
    this.condition,
    this.effect,
    this.principal,
    this.resource,
  });

  factory PolicyStatement.fromJson(Map<String, dynamic> json) {
    return PolicyStatement(
      action:
          (json['Action'] as List?)?.nonNulls.map((e) => e as String).toList(),
      condition: (json['Condition'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              (e as Map<String, dynamic>).map((k, e) => MapEntry(
                  k, (e as List).nonNulls.map((e) => e as String).toList())))),
      effect: json['Effect'] as String?,
      principal: (json['Principal'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      resource: json['Resource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final condition = this.condition;
    final effect = this.effect;
    final principal = this.principal;
    final resource = this.resource;
    return {
      if (action != null) 'Action': action,
      if (condition != null) 'Condition': condition,
      if (effect != null) 'Effect': effect,
      if (principal != null) 'Principal': principal,
      if (resource != null) 'Resource': resource,
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

/// AWS credentials structure containing temporary access credentials Scoped,
/// temporary AWS credentials with a 15-minute duration.
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
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
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
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'TooManyRequestsError': (type, message) =>
      TooManyRequestsError(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
