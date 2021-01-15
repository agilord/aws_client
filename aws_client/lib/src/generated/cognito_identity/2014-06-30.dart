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

part '2014-06-30.g.dart';

/// Amazon Cognito Federated Identities is a web service that delivers scoped
/// temporary credentials to mobile devices and other untrusted environments. It
/// uniquely identifies a device and supplies the user with a consistent
/// identity over the lifetime of an application.
class CognitoIdentity {
  final _s.JsonProtocol _protocol;
  CognitoIdentity({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cognito-identity',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a new identity pool. The identity pool is a store of user identity
  /// information that is specific to your AWS account. The keys for
  /// <code>SupportedLoginProviders</code> are as follows:
  ///
  /// <ul>
  /// <li>
  /// Facebook: <code>graph.facebook.com</code>
  /// </li>
  /// <li>
  /// Google: <code>accounts.google.com</code>
  /// </li>
  /// <li>
  /// Amazon: <code>www.amazon.com</code>
  /// </li>
  /// <li>
  /// Twitter: <code>api.twitter.com</code>
  /// </li>
  /// <li>
  /// Digits: <code>www.digits.com</code>
  /// </li>
  /// </ul>
  /// You must use AWS Developer credentials to call this API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [ResourceConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [allowUnauthenticatedIdentities] :
  /// TRUE if the identity pool supports unauthenticated logins.
  ///
  /// Parameter [identityPoolName] :
  /// A string that you provide.
  ///
  /// Parameter [allowClassicFlow] :
  /// Enables or disables the Basic (Classic) authentication flow. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flow.html">Identity
  /// Pools (Federated Identities) Authentication Flow</a> in the <i>Amazon
  /// Cognito Developer Guide</i>.
  ///
  /// Parameter [cognitoIdentityProviders] :
  /// An array of Amazon Cognito user pools and their client IDs.
  ///
  /// Parameter [developerProviderName] :
  /// The "domain" by which Cognito will refer to your users. This name acts as
  /// a placeholder that allows your backend and the Cognito service to
  /// communicate about the developer provider. For the
  /// <code>DeveloperProviderName</code>, you can use letters as well as period
  /// (<code>.</code>), underscore (<code>_</code>), and dash (<code>-</code>).
  ///
  /// Once you have set a developer provider name, you cannot change it. Please
  /// take care in setting this parameter.
  ///
  /// Parameter [identityPoolTags] :
  /// Tags to assign to the identity pool. A tag is a label that you can apply
  /// to identity pools to categorize and manage them in different ways, such as
  /// by purpose, owner, environment, or other criteria.
  ///
  /// Parameter [openIdConnectProviderARNs] :
  /// A list of OpendID Connect provider ARNs.
  ///
  /// Parameter [samlProviderARNs] :
  /// An array of Amazon Resource Names (ARNs) of the SAML provider for your
  /// identity pool.
  ///
  /// Parameter [supportedLoginProviders] :
  /// Optional key:value pairs mapping provider names to provider app IDs.
  Future<IdentityPool> createIdentityPool({
    @_s.required bool allowUnauthenticatedIdentities,
    @_s.required String identityPoolName,
    bool allowClassicFlow,
    List<CognitoIdentityProvider> cognitoIdentityProviders,
    String developerProviderName,
    Map<String, String> identityPoolTags,
    List<String> openIdConnectProviderARNs,
    List<String> samlProviderARNs,
    Map<String, String> supportedLoginProviders,
  }) async {
    ArgumentError.checkNotNull(
        allowUnauthenticatedIdentities, 'allowUnauthenticatedIdentities');
    ArgumentError.checkNotNull(identityPoolName, 'identityPoolName');
    _s.validateStringLength(
      'identityPoolName',
      identityPoolName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolName',
      identityPoolName,
      r'''[\w\s+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'developerProviderName',
      developerProviderName,
      1,
      128,
    );
    _s.validateStringPattern(
      'developerProviderName',
      developerProviderName,
      r'''[\w._-]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.CreateIdentityPool'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AllowUnauthenticatedIdentities': allowUnauthenticatedIdentities,
        'IdentityPoolName': identityPoolName,
        if (allowClassicFlow != null) 'AllowClassicFlow': allowClassicFlow,
        if (cognitoIdentityProviders != null)
          'CognitoIdentityProviders': cognitoIdentityProviders,
        if (developerProviderName != null)
          'DeveloperProviderName': developerProviderName,
        if (identityPoolTags != null) 'IdentityPoolTags': identityPoolTags,
        if (openIdConnectProviderARNs != null)
          'OpenIdConnectProviderARNs': openIdConnectProviderARNs,
        if (samlProviderARNs != null) 'SamlProviderARNs': samlProviderARNs,
        if (supportedLoginProviders != null)
          'SupportedLoginProviders': supportedLoginProviders,
      },
    );

    return IdentityPool.fromJson(jsonResponse.body);
  }

  /// Deletes identities from an identity pool. You can specify a list of 1-60
  /// identities that you want to delete.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [identityIdsToDelete] :
  /// A list of 1-60 identities that you want to delete.
  Future<DeleteIdentitiesResponse> deleteIdentities({
    @_s.required List<String> identityIdsToDelete,
  }) async {
    ArgumentError.checkNotNull(identityIdsToDelete, 'identityIdsToDelete');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.DeleteIdentities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityIdsToDelete': identityIdsToDelete,
      },
    );

    return DeleteIdentitiesResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an identity pool. Once a pool is deleted, users will not be able
  /// to authenticate with the pool.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [identityPoolId] :
  /// An identity pool ID in the format REGION:GUID.
  Future<void> deleteIdentityPool({
    @_s.required String identityPoolId,
  }) async {
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.DeleteIdentityPool'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityPoolId': identityPoolId,
      },
    );
  }

  /// Returns metadata related to the given identity, including when the
  /// identity was created and any associated linked logins.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [identityId] :
  /// A unique identifier in the format REGION:GUID.
  Future<IdentityDescription> describeIdentity({
    @_s.required String identityId,
  }) async {
    ArgumentError.checkNotNull(identityId, 'identityId');
    _s.validateStringLength(
      'identityId',
      identityId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.DescribeIdentity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityId': identityId,
      },
    );

    return IdentityDescription.fromJson(jsonResponse.body);
  }

  /// Gets details about a particular identity pool, including the pool name, ID
  /// description, creation date, and current number of users.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [identityPoolId] :
  /// An identity pool ID in the format REGION:GUID.
  Future<IdentityPool> describeIdentityPool({
    @_s.required String identityPoolId,
  }) async {
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.DescribeIdentityPool'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityPoolId': identityPoolId,
      },
    );

    return IdentityPool.fromJson(jsonResponse.body);
  }

  /// Returns credentials for the provided identity ID. Any provided logins will
  /// be validated against supported login providers. If the token is for
  /// cognito-identity.amazonaws.com, it will be passed through to AWS Security
  /// Token Service with the appropriate role for the token.
  ///
  /// This is a public API. You do not need any credentials to call this API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [ResourceConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidIdentityPoolConfigurationException].
  /// May throw [InternalErrorException].
  /// May throw [ExternalServiceException].
  ///
  /// Parameter [identityId] :
  /// A unique identifier in the format REGION:GUID.
  ///
  /// Parameter [customRoleArn] :
  /// The Amazon Resource Name (ARN) of the role to be assumed when multiple
  /// roles were received in the token from the identity provider. For example,
  /// a SAML-based identity provider. This parameter is optional for identity
  /// providers that do not support role customization.
  ///
  /// Parameter [logins] :
  /// A set of optional name-value pairs that map provider names to provider
  /// tokens. The name-value pair will follow the syntax "provider_name":
  /// "provider_user_identifier".
  ///
  /// Logins should not be specified when trying to get credentials for an
  /// unauthenticated identity.
  ///
  /// The Logins parameter is required when using identities associated with
  /// external identity providers such as FaceBook. For examples of
  /// <code>Logins</code> maps, see the code examples in the <a
  /// href="http://docs.aws.amazon.com/cognito/latest/developerguide/external-identity-providers.html">External
  /// Identity Providers</a> section of the Amazon Cognito Developer Guide.
  Future<GetCredentialsForIdentityResponse> getCredentialsForIdentity({
    @_s.required String identityId,
    String customRoleArn,
    Map<String, String> logins,
  }) async {
    ArgumentError.checkNotNull(identityId, 'identityId');
    _s.validateStringLength(
      'identityId',
      identityId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'customRoleArn',
      customRoleArn,
      20,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.GetCredentialsForIdentity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityId': identityId,
        if (customRoleArn != null) 'CustomRoleArn': customRoleArn,
        if (logins != null) 'Logins': logins,
      },
    );

    return GetCredentialsForIdentityResponse.fromJson(jsonResponse.body);
  }

  /// Generates (or retrieves) a Cognito ID. Supplying multiple logins will
  /// create an implicit linked account.
  ///
  /// This is a public API. You do not need any credentials to call this API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [ResourceConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  /// May throw [LimitExceededException].
  /// May throw [ExternalServiceException].
  ///
  /// Parameter [identityPoolId] :
  /// An identity pool ID in the format REGION:GUID.
  ///
  /// Parameter [accountId] :
  /// A standard AWS account ID (9+ digits).
  ///
  /// Parameter [logins] :
  /// A set of optional name-value pairs that map provider names to provider
  /// tokens. The available provider names for <code>Logins</code> are as
  /// follows:
  ///
  /// <ul>
  /// <li>
  /// Facebook: <code>graph.facebook.com</code>
  /// </li>
  /// <li>
  /// Amazon Cognito user pool:
  /// <code>cognito-idp.&lt;region&gt;.amazonaws.com/&lt;YOUR_USER_POOL_ID&gt;</code>,
  /// for example,
  /// <code>cognito-idp.us-east-1.amazonaws.com/us-east-1_123456789</code>.
  /// </li>
  /// <li>
  /// Google: <code>accounts.google.com</code>
  /// </li>
  /// <li>
  /// Amazon: <code>www.amazon.com</code>
  /// </li>
  /// <li>
  /// Twitter: <code>api.twitter.com</code>
  /// </li>
  /// <li>
  /// Digits: <code>www.digits.com</code>
  /// </li>
  /// </ul>
  Future<GetIdResponse> getId({
    @_s.required String identityPoolId,
    String accountId,
    Map<String, String> logins,
  }) async {
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'accountId',
      accountId,
      1,
      15,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.GetId'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityPoolId': identityPoolId,
        if (accountId != null) 'AccountId': accountId,
        if (logins != null) 'Logins': logins,
      },
    );

    return GetIdResponse.fromJson(jsonResponse.body);
  }

  /// Gets the roles for an identity pool.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [ResourceConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [identityPoolId] :
  /// An identity pool ID in the format REGION:GUID.
  Future<GetIdentityPoolRolesResponse> getIdentityPoolRoles({
    @_s.required String identityPoolId,
  }) async {
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.GetIdentityPoolRoles'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityPoolId': identityPoolId,
      },
    );

    return GetIdentityPoolRolesResponse.fromJson(jsonResponse.body);
  }

  /// Gets an OpenID token, using a known Cognito ID. This known Cognito ID is
  /// returned by <a>GetId</a>. You can optionally add additional logins for the
  /// identity. Supplying multiple logins creates an implicit link.
  ///
  /// The OpenId token is valid for 10 minutes.
  ///
  /// This is a public API. You do not need any credentials to call this API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [ResourceConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  /// May throw [ExternalServiceException].
  ///
  /// Parameter [identityId] :
  /// A unique identifier in the format REGION:GUID.
  ///
  /// Parameter [logins] :
  /// A set of optional name-value pairs that map provider names to provider
  /// tokens. When using graph.facebook.com and www.amazon.com, supply the
  /// access_token returned from the provider's authflow. For
  /// accounts.google.com, an Amazon Cognito user pool provider, or any other
  /// OpenId Connect provider, always include the <code>id_token</code>.
  Future<GetOpenIdTokenResponse> getOpenIdToken({
    @_s.required String identityId,
    Map<String, String> logins,
  }) async {
    ArgumentError.checkNotNull(identityId, 'identityId');
    _s.validateStringLength(
      'identityId',
      identityId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.GetOpenIdToken'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityId': identityId,
        if (logins != null) 'Logins': logins,
      },
    );

    return GetOpenIdTokenResponse.fromJson(jsonResponse.body);
  }

  /// Registers (or retrieves) a Cognito <code>IdentityId</code> and an OpenID
  /// Connect token for a user authenticated by your backend authentication
  /// process. Supplying multiple logins will create an implicit linked account.
  /// You can only specify one developer provider as part of the
  /// <code>Logins</code> map, which is linked to the identity pool. The
  /// developer provider is the "domain" by which Cognito will refer to your
  /// users.
  ///
  /// You can use <code>GetOpenIdTokenForDeveloperIdentity</code> to create a
  /// new identity and to link new logins (that is, user credentials issued by a
  /// public provider or developer provider) to an existing identity. When you
  /// want to create a new identity, the <code>IdentityId</code> should be null.
  /// When you want to associate a new login with an existing
  /// authenticated/unauthenticated identity, you can do so by providing the
  /// existing <code>IdentityId</code>. This API will create the identity in the
  /// specified <code>IdentityPoolId</code>.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [ResourceConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  /// May throw [DeveloperUserAlreadyRegisteredException].
  ///
  /// Parameter [identityPoolId] :
  /// An identity pool ID in the format REGION:GUID.
  ///
  /// Parameter [logins] :
  /// A set of optional name-value pairs that map provider names to provider
  /// tokens. Each name-value pair represents a user from a public provider or
  /// developer provider. If the user is from a developer provider, the
  /// name-value pair will follow the syntax <code>"developer_provider_name":
  /// "developer_user_identifier"</code>. The developer provider is the "domain"
  /// by which Cognito will refer to your users; you provided this domain while
  /// creating/updating the identity pool. The developer user identifier is an
  /// identifier from your backend that uniquely identifies a user. When you
  /// create an identity pool, you can specify the supported logins.
  ///
  /// Parameter [identityId] :
  /// A unique identifier in the format REGION:GUID.
  ///
  /// Parameter [tokenDuration] :
  /// The expiration time of the token, in seconds. You can specify a custom
  /// expiration time for the token so that you can cache it. If you don't
  /// provide an expiration time, the token is valid for 15 minutes. You can
  /// exchange the token with Amazon STS for temporary AWS credentials, which
  /// are valid for a maximum of one hour. The maximum token duration you can
  /// set is 24 hours. You should take care in setting the expiration time for a
  /// token, as there are significant security implications: an attacker could
  /// use a leaked token to access your AWS resources for the token's duration.
  /// <note>
  /// Please provide for a small grace period, usually no more than 5 minutes,
  /// to account for clock skew.
  /// </note>
  Future<GetOpenIdTokenForDeveloperIdentityResponse>
      getOpenIdTokenForDeveloperIdentity({
    @_s.required String identityPoolId,
    @_s.required Map<String, String> logins,
    String identityId,
    int tokenDuration,
  }) async {
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(logins, 'logins');
    _s.validateStringLength(
      'identityId',
      identityId,
      1,
      55,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\w-]+:[0-9a-f-]+''',
    );
    _s.validateNumRange(
      'tokenDuration',
      tokenDuration,
      1,
      86400,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCognitoIdentityService.GetOpenIdTokenForDeveloperIdentity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityPoolId': identityPoolId,
        'Logins': logins,
        if (identityId != null) 'IdentityId': identityId,
        if (tokenDuration != null) 'TokenDuration': tokenDuration,
      },
    );

    return GetOpenIdTokenForDeveloperIdentityResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the identities in an identity pool.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [identityPoolId] :
  /// An identity pool ID in the format REGION:GUID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of identities to return.
  ///
  /// Parameter [hideDisabled] :
  /// An optional boolean parameter that allows you to hide disabled identities.
  /// If omitted, the ListIdentities API will include disabled identities in the
  /// response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token.
  Future<ListIdentitiesResponse> listIdentities({
    @_s.required String identityPoolId,
    @_s.required int maxResults,
    bool hideDisabled,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(maxResults, 'maxResults');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      60,
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65535,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\S]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.ListIdentities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityPoolId': identityPoolId,
        'MaxResults': maxResults,
        if (hideDisabled != null) 'HideDisabled': hideDisabled,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListIdentitiesResponse.fromJson(jsonResponse.body);
  }

  /// Lists all of the Cognito identity pools registered for your account.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of identities to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token.
  Future<ListIdentityPoolsResponse> listIdentityPools({
    @_s.required int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(maxResults, 'maxResults');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      60,
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65535,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\S]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.ListIdentityPools'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListIdentityPoolsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags that are assigned to an Amazon Cognito identity pool.
  ///
  /// A tag is a label that you can apply to identity pools to categorize and
  /// manage them in different ways, such as by purpose, owner, environment, or
  /// other criteria.
  ///
  /// You can use this action up to 10 times per second, per account.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the identity pool that the tags are
  /// assigned to.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the <code>IdentityID</code> associated with a
  /// <code>DeveloperUserIdentifier</code> or the list of
  /// <code>DeveloperUserIdentifier</code> values associated with an
  /// <code>IdentityId</code> for an existing identity. Either
  /// <code>IdentityID</code> or <code>DeveloperUserIdentifier</code> must not
  /// be null. If you supply only one of these values, the other value will be
  /// searched in the database and returned as a part of the response. If you
  /// supply both, <code>DeveloperUserIdentifier</code> will be matched against
  /// <code>IdentityID</code>. If the values are verified against the database,
  /// the response returns both values and is the same as the request. Otherwise
  /// a <code>ResourceConflictException</code> is thrown.
  ///
  /// <code>LookupDeveloperIdentity</code> is intended for low-throughput
  /// control plane operations: for example, to enable customer service to
  /// locate an identity ID by username. If you are using it for higher-volume
  /// operations such as user authentication, your requests are likely to be
  /// throttled. <a>GetOpenIdTokenForDeveloperIdentity</a> is a better option
  /// for higher-volume operations for user authentication.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [ResourceConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [identityPoolId] :
  /// An identity pool ID in the format REGION:GUID.
  ///
  /// Parameter [developerUserIdentifier] :
  /// A unique ID used by your backend authentication process to identify a
  /// user. Typically, a developer identity provider would issue many developer
  /// user identifiers, in keeping with the number of users.
  ///
  /// Parameter [identityId] :
  /// A unique identifier in the format REGION:GUID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of identities to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token. The first call you make will have
  /// <code>NextToken</code> set to null. After that the service will return
  /// <code>NextToken</code> values as needed. For example, let's say you make a
  /// request with <code>MaxResults</code> set to 10, and there are 20 matches
  /// in the database. The service will return a pagination token as a part of
  /// the response. This token can be used to call the API again and get results
  /// starting from the 11th match.
  Future<LookupDeveloperIdentityResponse> lookupDeveloperIdentity({
    @_s.required String identityPoolId,
    String developerUserIdentifier,
    String identityId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'developerUserIdentifier',
      developerUserIdentifier,
      1,
      1024,
    );
    _s.validateStringLength(
      'identityId',
      identityId,
      1,
      55,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\w-]+:[0-9a-f-]+''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      60,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65535,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\S]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.LookupDeveloperIdentity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityPoolId': identityPoolId,
        if (developerUserIdentifier != null)
          'DeveloperUserIdentifier': developerUserIdentifier,
        if (identityId != null) 'IdentityId': identityId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return LookupDeveloperIdentityResponse.fromJson(jsonResponse.body);
  }

  /// Merges two users having different <code>IdentityId</code>s, existing in
  /// the same identity pool, and identified by the same developer provider. You
  /// can use this action to request that discrete users be merged and
  /// identified as a single user in the Cognito environment. Cognito associates
  /// the given source user (<code>SourceUserIdentifier</code>) with the
  /// <code>IdentityId</code> of the <code>DestinationUserIdentifier</code>.
  /// Only developer-authenticated users can be merged. If the users to be
  /// merged are associated with the same public provider, but as two different
  /// users, an exception will be thrown.
  ///
  /// The number of linked logins is limited to 20. So, the number of linked
  /// logins for the source user, <code>SourceUserIdentifier</code>, and the
  /// destination user, <code>DestinationUserIdentifier</code>, together should
  /// not be larger than 20. Otherwise, an exception will be thrown.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [ResourceConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [destinationUserIdentifier] :
  /// User identifier for the destination user. The value should be a
  /// <code>DeveloperUserIdentifier</code>.
  ///
  /// Parameter [developerProviderName] :
  /// The "domain" by which Cognito will refer to your users. This is a (pseudo)
  /// domain name that you provide while creating an identity pool. This name
  /// acts as a placeholder that allows your backend and the Cognito service to
  /// communicate about the developer provider. For the
  /// <code>DeveloperProviderName</code>, you can use letters as well as period
  /// (.), underscore (_), and dash (-).
  ///
  /// Parameter [identityPoolId] :
  /// An identity pool ID in the format REGION:GUID.
  ///
  /// Parameter [sourceUserIdentifier] :
  /// User identifier for the source user. The value should be a
  /// <code>DeveloperUserIdentifier</code>.
  Future<MergeDeveloperIdentitiesResponse> mergeDeveloperIdentities({
    @_s.required String destinationUserIdentifier,
    @_s.required String developerProviderName,
    @_s.required String identityPoolId,
    @_s.required String sourceUserIdentifier,
  }) async {
    ArgumentError.checkNotNull(
        destinationUserIdentifier, 'destinationUserIdentifier');
    _s.validateStringLength(
      'destinationUserIdentifier',
      destinationUserIdentifier,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(developerProviderName, 'developerProviderName');
    _s.validateStringLength(
      'developerProviderName',
      developerProviderName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'developerProviderName',
      developerProviderName,
      r'''[\w._-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceUserIdentifier, 'sourceUserIdentifier');
    _s.validateStringLength(
      'sourceUserIdentifier',
      sourceUserIdentifier,
      1,
      1024,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.MergeDeveloperIdentities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DestinationUserIdentifier': destinationUserIdentifier,
        'DeveloperProviderName': developerProviderName,
        'IdentityPoolId': identityPoolId,
        'SourceUserIdentifier': sourceUserIdentifier,
      },
    );

    return MergeDeveloperIdentitiesResponse.fromJson(jsonResponse.body);
  }

  /// Sets the roles for an identity pool. These roles are used when making
  /// calls to <a>GetCredentialsForIdentity</a> action.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [ResourceConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [identityPoolId] :
  /// An identity pool ID in the format REGION:GUID.
  ///
  /// Parameter [roles] :
  /// The map of roles associated with this pool. For a given role, the key will
  /// be either "authenticated" or "unauthenticated" and the value will be the
  /// Role ARN.
  ///
  /// Parameter [roleMappings] :
  /// How users for a specific identity provider are to mapped to roles. This is
  /// a string to <a>RoleMapping</a> object map. The string identifies the
  /// identity provider, for example, "graph.facebook.com" or
  /// "cognito-idp-east-1.amazonaws.com/us-east-1_abcdefghi:app_client_id".
  ///
  /// Up to 25 rules can be specified per identity provider.
  Future<void> setIdentityPoolRoles({
    @_s.required String identityPoolId,
    @_s.required Map<String, String> roles,
    Map<String, RoleMapping> roleMappings,
  }) async {
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roles, 'roles');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.SetIdentityPoolRoles'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityPoolId': identityPoolId,
        'Roles': roles,
        if (roleMappings != null) 'RoleMappings': roleMappings,
      },
    );
  }

  /// Assigns a set of tags to an Amazon Cognito identity pool. A tag is a label
  /// that you can use to categorize and manage identity pools in different
  /// ways, such as by purpose, owner, environment, or other criteria.
  ///
  /// Each tag consists of a key and value, both of which you define. A key is a
  /// general category for more specific values. For example, if you have two
  /// versions of an identity pool, one for testing and another for production,
  /// you might assign an <code>Environment</code> tag key to both identity
  /// pools. The value of this key might be <code>Test</code> for one identity
  /// pool and <code>Production</code> for the other.
  ///
  /// Tags are useful for cost tracking and access control. You can activate
  /// your tags so that they appear on the Billing and Cost Management console,
  /// where you can track the costs associated with your identity pools. In an
  /// IAM policy, you can constrain permissions for identity pools based on
  /// specific tags or tag values.
  ///
  /// You can use this action up to 5 times per second, per account. An identity
  /// pool can have as many as 50 tags.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the identity pool to assign the tags to.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the identity pool.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Unlinks a <code>DeveloperUserIdentifier</code> from an existing identity.
  /// Unlinked developer users will be considered new identities next time they
  /// are seen. If, for a given Cognito identity, you remove all federated
  /// identities as well as the developer user identifier, the Cognito identity
  /// becomes inaccessible.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [ResourceConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [developerProviderName] :
  /// The "domain" by which Cognito will refer to your users.
  ///
  /// Parameter [developerUserIdentifier] :
  /// A unique ID used by your backend authentication process to identify a
  /// user.
  ///
  /// Parameter [identityId] :
  /// A unique identifier in the format REGION:GUID.
  ///
  /// Parameter [identityPoolId] :
  /// An identity pool ID in the format REGION:GUID.
  Future<void> unlinkDeveloperIdentity({
    @_s.required String developerProviderName,
    @_s.required String developerUserIdentifier,
    @_s.required String identityId,
    @_s.required String identityPoolId,
  }) async {
    ArgumentError.checkNotNull(developerProviderName, 'developerProviderName');
    _s.validateStringLength(
      'developerProviderName',
      developerProviderName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'developerProviderName',
      developerProviderName,
      r'''[\w._-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        developerUserIdentifier, 'developerUserIdentifier');
    _s.validateStringLength(
      'developerUserIdentifier',
      developerUserIdentifier,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityId, 'identityId');
    _s.validateStringLength(
      'identityId',
      identityId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.UnlinkDeveloperIdentity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeveloperProviderName': developerProviderName,
        'DeveloperUserIdentifier': developerUserIdentifier,
        'IdentityId': identityId,
        'IdentityPoolId': identityPoolId,
      },
    );
  }

  /// Unlinks a federated identity from an existing account. Unlinked logins
  /// will be considered new identities next time they are seen. Removing the
  /// last linked login will make this identity inaccessible.
  ///
  /// This is a public API. You do not need any credentials to call this API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [ResourceConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  /// May throw [ExternalServiceException].
  ///
  /// Parameter [identityId] :
  /// A unique identifier in the format REGION:GUID.
  ///
  /// Parameter [logins] :
  /// A set of optional name-value pairs that map provider names to provider
  /// tokens.
  ///
  /// Parameter [loginsToRemove] :
  /// Provider names to unlink from this identity.
  Future<void> unlinkIdentity({
    @_s.required String identityId,
    @_s.required Map<String, String> logins,
    @_s.required List<String> loginsToRemove,
  }) async {
    ArgumentError.checkNotNull(identityId, 'identityId');
    _s.validateStringLength(
      'identityId',
      identityId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(logins, 'logins');
    ArgumentError.checkNotNull(loginsToRemove, 'loginsToRemove');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.UnlinkIdentity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityId': identityId,
        'Logins': logins,
        'LoginsToRemove': loginsToRemove,
      },
    );
  }

  /// Removes the specified tags from an Amazon Cognito identity pool. You can
  /// use this action up to 5 times per second, per account
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the identity pool that the tags are
  /// assigned to.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to remove from the user pool.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Updates an identity pool.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [ResourceConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  /// May throw [ConcurrentModificationException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [allowUnauthenticatedIdentities] :
  /// TRUE if the identity pool supports unauthenticated logins.
  ///
  /// Parameter [identityPoolId] :
  /// An identity pool ID in the format REGION:GUID.
  ///
  /// Parameter [identityPoolName] :
  /// A string that you provide.
  ///
  /// Parameter [allowClassicFlow] :
  /// Enables or disables the Basic (Classic) authentication flow. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flow.html">Identity
  /// Pools (Federated Identities) Authentication Flow</a> in the <i>Amazon
  /// Cognito Developer Guide</i>.
  ///
  /// Parameter [cognitoIdentityProviders] :
  /// A list representing an Amazon Cognito user pool and its client ID.
  ///
  /// Parameter [developerProviderName] :
  /// The "domain" by which Cognito will refer to your users.
  ///
  /// Parameter [identityPoolTags] :
  /// The tags that are assigned to the identity pool. A tag is a label that you
  /// can apply to identity pools to categorize and manage them in different
  /// ways, such as by purpose, owner, environment, or other criteria.
  ///
  /// Parameter [openIdConnectProviderARNs] :
  /// A list of OpendID Connect provider ARNs.
  ///
  /// Parameter [samlProviderARNs] :
  /// An array of Amazon Resource Names (ARNs) of the SAML provider for your
  /// identity pool.
  ///
  /// Parameter [supportedLoginProviders] :
  /// Optional key:value pairs mapping provider names to provider app IDs.
  Future<IdentityPool> updateIdentityPool({
    @_s.required bool allowUnauthenticatedIdentities,
    @_s.required String identityPoolId,
    @_s.required String identityPoolName,
    bool allowClassicFlow,
    List<CognitoIdentityProvider> cognitoIdentityProviders,
    String developerProviderName,
    Map<String, String> identityPoolTags,
    List<String> openIdConnectProviderARNs,
    List<String> samlProviderARNs,
    Map<String, String> supportedLoginProviders,
  }) async {
    ArgumentError.checkNotNull(
        allowUnauthenticatedIdentities, 'allowUnauthenticatedIdentities');
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityPoolName, 'identityPoolName');
    _s.validateStringLength(
      'identityPoolName',
      identityPoolName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolName',
      identityPoolName,
      r'''[\w\s+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'developerProviderName',
      developerProviderName,
      1,
      128,
    );
    _s.validateStringPattern(
      'developerProviderName',
      developerProviderName,
      r'''[\w._-]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.UpdateIdentityPool'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AllowUnauthenticatedIdentities': allowUnauthenticatedIdentities,
        'IdentityPoolId': identityPoolId,
        'IdentityPoolName': identityPoolName,
        if (allowClassicFlow != null) 'AllowClassicFlow': allowClassicFlow,
        if (cognitoIdentityProviders != null)
          'CognitoIdentityProviders': cognitoIdentityProviders,
        if (developerProviderName != null)
          'DeveloperProviderName': developerProviderName,
        if (identityPoolTags != null) 'IdentityPoolTags': identityPoolTags,
        if (openIdConnectProviderARNs != null)
          'OpenIdConnectProviderARNs': openIdConnectProviderARNs,
        if (samlProviderARNs != null) 'SamlProviderARNs': samlProviderARNs,
        if (supportedLoginProviders != null)
          'SupportedLoginProviders': supportedLoginProviders,
      },
    );

    return IdentityPool.fromJson(jsonResponse.body);
  }
}

enum AmbiguousRoleResolutionType {
  @_s.JsonValue('AuthenticatedRole')
  authenticatedRole,
  @_s.JsonValue('Deny')
  deny,
}

/// A provider representing an Amazon Cognito user pool and its client ID.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CognitoIdentityProvider {
  /// The client ID for the Amazon Cognito user pool.
  @_s.JsonKey(name: 'ClientId')
  final String clientId;

  /// The provider name for an Amazon Cognito user pool. For example,
  /// <code>cognito-idp.us-east-1.amazonaws.com/us-east-1_123456789</code>.
  @_s.JsonKey(name: 'ProviderName')
  final String providerName;

  /// TRUE if server-side token validation is enabled for the identity provider’s
  /// token.
  ///
  /// Once you set <code>ServerSideTokenCheck</code> to TRUE for an identity pool,
  /// that identity pool will check with the integrated user pools to make sure
  /// that the user has not been globally signed out or deleted before the
  /// identity pool provides an OIDC token or AWS credentials for the user.
  ///
  /// If the user is signed out or deleted, the identity pool will return a 400
  /// Not Authorized error.
  @_s.JsonKey(name: 'ServerSideTokenCheck')
  final bool serverSideTokenCheck;

  CognitoIdentityProvider({
    this.clientId,
    this.providerName,
    this.serverSideTokenCheck,
  });
  factory CognitoIdentityProvider.fromJson(Map<String, dynamic> json) =>
      _$CognitoIdentityProviderFromJson(json);

  Map<String, dynamic> toJson() => _$CognitoIdentityProviderToJson(this);
}

/// Credentials for the provided identity ID.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Credentials {
  /// The Access Key portion of the credentials.
  @_s.JsonKey(name: 'AccessKeyId')
  final String accessKeyId;

  /// The date at which these credentials will expire.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Expiration')
  final DateTime expiration;

  /// The Secret Access Key portion of the credentials
  @_s.JsonKey(name: 'SecretKey')
  final String secretKey;

  /// The Session Token portion of the credentials
  @_s.JsonKey(name: 'SessionToken')
  final String sessionToken;

  Credentials({
    this.accessKeyId,
    this.expiration,
    this.secretKey,
    this.sessionToken,
  });
  factory Credentials.fromJson(Map<String, dynamic> json) =>
      _$CredentialsFromJson(json);
}

/// Returned in response to a successful <code>DeleteIdentities</code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteIdentitiesResponse {
  /// An array of UnprocessedIdentityId objects, each of which contains an
  /// ErrorCode and IdentityId.
  @_s.JsonKey(name: 'UnprocessedIdentityIds')
  final List<UnprocessedIdentityId> unprocessedIdentityIds;

  DeleteIdentitiesResponse({
    this.unprocessedIdentityIds,
  });
  factory DeleteIdentitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteIdentitiesResponseFromJson(json);
}

enum ErrorCode {
  @_s.JsonValue('AccessDenied')
  accessDenied,
  @_s.JsonValue('InternalServerError')
  internalServerError,
}

/// Returned in response to a successful <code>GetCredentialsForIdentity</code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCredentialsForIdentityResponse {
  /// Credentials for the provided identity ID.
  @_s.JsonKey(name: 'Credentials')
  final Credentials credentials;

  /// A unique identifier in the format REGION:GUID.
  @_s.JsonKey(name: 'IdentityId')
  final String identityId;

  GetCredentialsForIdentityResponse({
    this.credentials,
    this.identityId,
  });
  factory GetCredentialsForIdentityResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetCredentialsForIdentityResponseFromJson(json);
}

/// Returned in response to a GetId request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetIdResponse {
  /// A unique identifier in the format REGION:GUID.
  @_s.JsonKey(name: 'IdentityId')
  final String identityId;

  GetIdResponse({
    this.identityId,
  });
  factory GetIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetIdResponseFromJson(json);
}

/// Returned in response to a successful <code>GetIdentityPoolRoles</code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetIdentityPoolRolesResponse {
  /// An identity pool ID in the format REGION:GUID.
  @_s.JsonKey(name: 'IdentityPoolId')
  final String identityPoolId;

  /// How users for a specific identity provider are to mapped to roles. This is a
  /// String-to-<a>RoleMapping</a> object map. The string identifies the identity
  /// provider, for example, "graph.facebook.com" or
  /// "cognito-idp.us-east-1.amazonaws.com/us-east-1_abcdefghi:app_client_id".
  @_s.JsonKey(name: 'RoleMappings')
  final Map<String, RoleMapping> roleMappings;

  /// The map of roles associated with this pool. Currently only authenticated and
  /// unauthenticated roles are supported.
  @_s.JsonKey(name: 'Roles')
  final Map<String, String> roles;

  GetIdentityPoolRolesResponse({
    this.identityPoolId,
    this.roleMappings,
    this.roles,
  });
  factory GetIdentityPoolRolesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetIdentityPoolRolesResponseFromJson(json);
}

/// Returned in response to a successful
/// <code>GetOpenIdTokenForDeveloperIdentity</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetOpenIdTokenForDeveloperIdentityResponse {
  /// A unique identifier in the format REGION:GUID.
  @_s.JsonKey(name: 'IdentityId')
  final String identityId;

  /// An OpenID token.
  @_s.JsonKey(name: 'Token')
  final String token;

  GetOpenIdTokenForDeveloperIdentityResponse({
    this.identityId,
    this.token,
  });
  factory GetOpenIdTokenForDeveloperIdentityResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetOpenIdTokenForDeveloperIdentityResponseFromJson(json);
}

/// Returned in response to a successful GetOpenIdToken request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetOpenIdTokenResponse {
  /// A unique identifier in the format REGION:GUID. Note that the IdentityId
  /// returned may not match the one passed on input.
  @_s.JsonKey(name: 'IdentityId')
  final String identityId;

  /// An OpenID token, valid for 10 minutes.
  @_s.JsonKey(name: 'Token')
  final String token;

  GetOpenIdTokenResponse({
    this.identityId,
    this.token,
  });
  factory GetOpenIdTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOpenIdTokenResponseFromJson(json);
}

/// A description of the identity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IdentityDescription {
  /// Date on which the identity was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// A unique identifier in the format REGION:GUID.
  @_s.JsonKey(name: 'IdentityId')
  final String identityId;

  /// Date on which the identity was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// The provider names.
  @_s.JsonKey(name: 'Logins')
  final List<String> logins;

  IdentityDescription({
    this.creationDate,
    this.identityId,
    this.lastModifiedDate,
    this.logins,
  });
  factory IdentityDescription.fromJson(Map<String, dynamic> json) =>
      _$IdentityDescriptionFromJson(json);
}

/// An object representing an Amazon Cognito identity pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IdentityPool {
  /// TRUE if the identity pool supports unauthenticated logins.
  @_s.JsonKey(name: 'AllowUnauthenticatedIdentities')
  final bool allowUnauthenticatedIdentities;

  /// An identity pool ID in the format REGION:GUID.
  @_s.JsonKey(name: 'IdentityPoolId')
  final String identityPoolId;

  /// A string that you provide.
  @_s.JsonKey(name: 'IdentityPoolName')
  final String identityPoolName;

  /// Enables or disables the Basic (Classic) authentication flow. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flow.html">Identity
  /// Pools (Federated Identities) Authentication Flow</a> in the <i>Amazon
  /// Cognito Developer Guide</i>.
  @_s.JsonKey(name: 'AllowClassicFlow')
  final bool allowClassicFlow;

  /// A list representing an Amazon Cognito user pool and its client ID.
  @_s.JsonKey(name: 'CognitoIdentityProviders')
  final List<CognitoIdentityProvider> cognitoIdentityProviders;

  /// The "domain" by which Cognito will refer to your users.
  @_s.JsonKey(name: 'DeveloperProviderName')
  final String developerProviderName;

  /// The tags that are assigned to the identity pool. A tag is a label that you
  /// can apply to identity pools to categorize and manage them in different ways,
  /// such as by purpose, owner, environment, or other criteria.
  @_s.JsonKey(name: 'IdentityPoolTags')
  final Map<String, String> identityPoolTags;

  /// A list of OpendID Connect provider ARNs.
  @_s.JsonKey(name: 'OpenIdConnectProviderARNs')
  final List<String> openIdConnectProviderARNs;

  /// An array of Amazon Resource Names (ARNs) of the SAML provider for your
  /// identity pool.
  @_s.JsonKey(name: 'SamlProviderARNs')
  final List<String> samlProviderARNs;

  /// Optional key:value pairs mapping provider names to provider app IDs.
  @_s.JsonKey(name: 'SupportedLoginProviders')
  final Map<String, String> supportedLoginProviders;

  IdentityPool({
    @_s.required this.allowUnauthenticatedIdentities,
    @_s.required this.identityPoolId,
    @_s.required this.identityPoolName,
    this.allowClassicFlow,
    this.cognitoIdentityProviders,
    this.developerProviderName,
    this.identityPoolTags,
    this.openIdConnectProviderARNs,
    this.samlProviderARNs,
    this.supportedLoginProviders,
  });
  factory IdentityPool.fromJson(Map<String, dynamic> json) =>
      _$IdentityPoolFromJson(json);
}

/// A description of the identity pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IdentityPoolShortDescription {
  /// An identity pool ID in the format REGION:GUID.
  @_s.JsonKey(name: 'IdentityPoolId')
  final String identityPoolId;

  /// A string that you provide.
  @_s.JsonKey(name: 'IdentityPoolName')
  final String identityPoolName;

  IdentityPoolShortDescription({
    this.identityPoolId,
    this.identityPoolName,
  });
  factory IdentityPoolShortDescription.fromJson(Map<String, dynamic> json) =>
      _$IdentityPoolShortDescriptionFromJson(json);
}

/// The response to a ListIdentities request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListIdentitiesResponse {
  /// An object containing a set of identities and associated mappings.
  @_s.JsonKey(name: 'Identities')
  final List<IdentityDescription> identities;

  /// An identity pool ID in the format REGION:GUID.
  @_s.JsonKey(name: 'IdentityPoolId')
  final String identityPoolId;

  /// A pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListIdentitiesResponse({
    this.identities,
    this.identityPoolId,
    this.nextToken,
  });
  factory ListIdentitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListIdentitiesResponseFromJson(json);
}

/// The result of a successful ListIdentityPools action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListIdentityPoolsResponse {
  /// The identity pools returned by the ListIdentityPools action.
  @_s.JsonKey(name: 'IdentityPools')
  final List<IdentityPoolShortDescription> identityPools;

  /// A pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListIdentityPoolsResponse({
    this.identityPools,
    this.nextToken,
  });
  factory ListIdentityPoolsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListIdentityPoolsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags that are assigned to the identity pool.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// Returned in response to a successful <code>LookupDeveloperIdentity</code>
/// action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LookupDeveloperIdentityResponse {
  /// This is the list of developer user identifiers associated with an identity
  /// ID. Cognito supports the association of multiple developer user identifiers
  /// with an identity ID.
  @_s.JsonKey(name: 'DeveloperUserIdentifierList')
  final List<String> developerUserIdentifierList;

  /// A unique identifier in the format REGION:GUID.
  @_s.JsonKey(name: 'IdentityId')
  final String identityId;

  /// A pagination token. The first call you make will have <code>NextToken</code>
  /// set to null. After that the service will return <code>NextToken</code>
  /// values as needed. For example, let's say you make a request with
  /// <code>MaxResults</code> set to 10, and there are 20 matches in the database.
  /// The service will return a pagination token as a part of the response. This
  /// token can be used to call the API again and get results starting from the
  /// 11th match.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  LookupDeveloperIdentityResponse({
    this.developerUserIdentifierList,
    this.identityId,
    this.nextToken,
  });
  factory LookupDeveloperIdentityResponse.fromJson(Map<String, dynamic> json) =>
      _$LookupDeveloperIdentityResponseFromJson(json);
}

/// A rule that maps a claim name, a claim value, and a match type to a role
/// ARN.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MappingRule {
  /// The claim name that must be present in the token, for example, "isAdmin" or
  /// "paid".
  @_s.JsonKey(name: 'Claim')
  final String claim;

  /// The match condition that specifies how closely the claim value in the IdP
  /// token must match <code>Value</code>.
  @_s.JsonKey(name: 'MatchType')
  final MappingRuleMatchType matchType;

  /// The role ARN.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// A brief string that the claim must match, for example, "paid" or "yes".
  @_s.JsonKey(name: 'Value')
  final String value;

  MappingRule({
    @_s.required this.claim,
    @_s.required this.matchType,
    @_s.required this.roleARN,
    @_s.required this.value,
  });
  factory MappingRule.fromJson(Map<String, dynamic> json) =>
      _$MappingRuleFromJson(json);

  Map<String, dynamic> toJson() => _$MappingRuleToJson(this);
}

enum MappingRuleMatchType {
  @_s.JsonValue('Equals')
  equals,
  @_s.JsonValue('Contains')
  contains,
  @_s.JsonValue('StartsWith')
  startsWith,
  @_s.JsonValue('NotEqual')
  notEqual,
}

/// Returned in response to a successful <code>MergeDeveloperIdentities</code>
/// action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MergeDeveloperIdentitiesResponse {
  /// A unique identifier in the format REGION:GUID.
  @_s.JsonKey(name: 'IdentityId')
  final String identityId;

  MergeDeveloperIdentitiesResponse({
    this.identityId,
  });
  factory MergeDeveloperIdentitiesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MergeDeveloperIdentitiesResponseFromJson(json);
}

/// A role mapping.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RoleMapping {
  /// The role mapping type. Token will use <code>cognito:roles</code> and
  /// <code>cognito:preferred_role</code> claims from the Cognito identity
  /// provider token to map groups to roles. Rules will attempt to match claims
  /// from the token to map to a role.
  @_s.JsonKey(name: 'Type')
  final RoleMappingType type;

  /// If you specify Token or Rules as the <code>Type</code>,
  /// <code>AmbiguousRoleResolution</code> is required.
  ///
  /// Specifies the action to be taken if either no rules match the claim value
  /// for the <code>Rules</code> type, or there is no
  /// <code>cognito:preferred_role</code> claim and there are multiple
  /// <code>cognito:roles</code> matches for the <code>Token</code> type.
  @_s.JsonKey(name: 'AmbiguousRoleResolution')
  final AmbiguousRoleResolutionType ambiguousRoleResolution;

  /// The rules to be used for mapping users to roles.
  ///
  /// If you specify Rules as the role mapping type,
  /// <code>RulesConfiguration</code> is required.
  @_s.JsonKey(name: 'RulesConfiguration')
  final RulesConfigurationType rulesConfiguration;

  RoleMapping({
    @_s.required this.type,
    this.ambiguousRoleResolution,
    this.rulesConfiguration,
  });
  factory RoleMapping.fromJson(Map<String, dynamic> json) =>
      _$RoleMappingFromJson(json);

  Map<String, dynamic> toJson() => _$RoleMappingToJson(this);
}

enum RoleMappingType {
  @_s.JsonValue('Token')
  token,
  @_s.JsonValue('Rules')
  rules,
}

/// A container for rules.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RulesConfigurationType {
  /// An array of rules. You can specify up to 25 rules per identity provider.
  ///
  /// Rules are evaluated in order. The first one to match specifies the role.
  @_s.JsonKey(name: 'Rules')
  final List<MappingRule> rules;

  RulesConfigurationType({
    @_s.required this.rules,
  });
  factory RulesConfigurationType.fromJson(Map<String, dynamic> json) =>
      _$RulesConfigurationTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RulesConfigurationTypeToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

/// An array of UnprocessedIdentityId objects, each of which contains an
/// ErrorCode and IdentityId.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnprocessedIdentityId {
  /// The error code indicating the type of error that occurred.
  @_s.JsonKey(name: 'ErrorCode')
  final ErrorCode errorCode;

  /// A unique identifier in the format REGION:GUID.
  @_s.JsonKey(name: 'IdentityId')
  final String identityId;

  UnprocessedIdentityId({
    this.errorCode,
    this.identityId,
  });
  factory UnprocessedIdentityId.fromJson(Map<String, dynamic> json) =>
      _$UnprocessedIdentityIdFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class DeveloperUserAlreadyRegisteredException extends _s.GenericAwsException {
  DeveloperUserAlreadyRegisteredException({String type, String message})
      : super(
            type: type,
            code: 'DeveloperUserAlreadyRegisteredException',
            message: message);
}

class ExternalServiceException extends _s.GenericAwsException {
  ExternalServiceException({String type, String message})
      : super(type: type, code: 'ExternalServiceException', message: message);
}

class InternalErrorException extends _s.GenericAwsException {
  InternalErrorException({String type, String message})
      : super(type: type, code: 'InternalErrorException', message: message);
}

class InvalidIdentityPoolConfigurationException extends _s.GenericAwsException {
  InvalidIdentityPoolConfigurationException({String type, String message})
      : super(
            type: type,
            code: 'InvalidIdentityPoolConfigurationException',
            message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotAuthorizedException extends _s.GenericAwsException {
  NotAuthorizedException({String type, String message})
      : super(type: type, code: 'NotAuthorizedException', message: message);
}

class ResourceConflictException extends _s.GenericAwsException {
  ResourceConflictException({String type, String message})
      : super(type: type, code: 'ResourceConflictException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'DeveloperUserAlreadyRegisteredException': (type, message) =>
      DeveloperUserAlreadyRegisteredException(type: type, message: message),
  'ExternalServiceException': (type, message) =>
      ExternalServiceException(type: type, message: message),
  'InternalErrorException': (type, message) =>
      InternalErrorException(type: type, message: message),
  'InvalidIdentityPoolConfigurationException': (type, message) =>
      InvalidIdentityPoolConfigurationException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'NotAuthorizedException': (type, message) =>
      NotAuthorizedException(type: type, message: message),
  'ResourceConflictException': (type, message) =>
      ResourceConflictException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
};
