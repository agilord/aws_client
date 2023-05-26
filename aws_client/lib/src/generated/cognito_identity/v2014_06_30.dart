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

/// Amazon Cognito Federated Identities is a web service that delivers scoped
/// temporary credentials to mobile devices and other untrusted environments. It
/// uniquely identifies a device and supplies the user with a consistent
/// identity over the lifetime of an application.
class CognitoIdentity {
  final _s.JsonProtocol _protocol;
  CognitoIdentity({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cognito-identity',
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
  /// The Amazon Resource Names (ARN) of the OpenID Connect providers.
  ///
  /// Parameter [samlProviderARNs] :
  /// An array of Amazon Resource Names (ARNs) of the SAML provider for your
  /// identity pool.
  ///
  /// Parameter [supportedLoginProviders] :
  /// Optional key:value pairs mapping provider names to provider app IDs.
  Future<IdentityPool> createIdentityPool({
    required bool allowUnauthenticatedIdentities,
    required String identityPoolName,
    bool? allowClassicFlow,
    List<CognitoIdentityProvider>? cognitoIdentityProviders,
    String? developerProviderName,
    Map<String, String>? identityPoolTags,
    List<String>? openIdConnectProviderARNs,
    List<String>? samlProviderARNs,
    Map<String, String>? supportedLoginProviders,
  }) async {
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
    required List<String> identityIdsToDelete,
  }) async {
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
    required String identityPoolId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.DeleteIdentityPool'
    };
    await _protocol.send(
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
    required String identityId,
  }) async {
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
    required String identityPoolId,
  }) async {
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
  /// external identity providers such as Facebook. For examples of
  /// <code>Logins</code> maps, see the code examples in the <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/external-identity-providers.html">External
  /// Identity Providers</a> section of the Amazon Cognito Developer Guide.
  Future<GetCredentialsForIdentityResponse> getCredentialsForIdentity({
    required String identityId,
    String? customRoleArn,
    Map<String, String>? logins,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.GetCredentialsForIdentity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      signed: false,
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
    required String identityPoolId,
    String? accountId,
    Map<String, String>? logins,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.GetId'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      signed: false,
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
    required String identityPoolId,
  }) async {
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
  /// The OpenID token is valid for 10 minutes.
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
  /// OpenID Connect provider, always include the <code>id_token</code>.
  Future<GetOpenIdTokenResponse> getOpenIdToken({
    required String identityId,
    Map<String, String>? logins,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.GetOpenIdToken'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      signed: false,
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
  /// Parameter [principalTags] :
  /// Use this operation to configure attribute mappings for custom providers.
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
    required String identityPoolId,
    required Map<String, String> logins,
    String? identityId,
    Map<String, String>? principalTags,
    int? tokenDuration,
  }) async {
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
        if (principalTags != null) 'PrincipalTags': principalTags,
        if (tokenDuration != null) 'TokenDuration': tokenDuration,
      },
    );

    return GetOpenIdTokenForDeveloperIdentityResponse.fromJson(
        jsonResponse.body);
  }

  /// Use <code>GetPrincipalTagAttributeMap</code> to list all mappings between
  /// <code>PrincipalTags</code> and user attributes.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [identityPoolId] :
  /// You can use this operation to get the ID of the Identity Pool you setup
  /// attribute mappings for.
  ///
  /// Parameter [identityProviderName] :
  /// You can use this operation to get the provider name.
  Future<GetPrincipalTagAttributeMapResponse> getPrincipalTagAttributeMap({
    required String identityPoolId,
    required String identityProviderName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.GetPrincipalTagAttributeMap'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityPoolId': identityPoolId,
        'IdentityProviderName': identityProviderName,
      },
    );

    return GetPrincipalTagAttributeMapResponse.fromJson(jsonResponse.body);
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
    required String identityPoolId,
    required int maxResults,
    bool? hideDisabled,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      60,
      isRequired: true,
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
    required int maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      60,
      isRequired: true,
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
    required String resourceArn,
  }) async {
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
    required String identityPoolId,
    String? developerUserIdentifier,
    String? identityId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      60,
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
    required String destinationUserIdentifier,
    required String developerProviderName,
    required String identityPoolId,
    required String sourceUserIdentifier,
  }) async {
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
  /// "cognito-idp.us-east-1.amazonaws.com/us-east-1_abcdefghi:app_client_id".
  ///
  /// Up to 25 rules can be specified per identity provider.
  Future<void> setIdentityPoolRoles({
    required String identityPoolId,
    required Map<String, String> roles,
    Map<String, RoleMapping>? roleMappings,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.SetIdentityPoolRoles'
    };
    await _protocol.send(
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

  /// You can use this operation to use default (username and clientID)
  /// attribute or custom attribute mappings.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [identityPoolId] :
  /// The ID of the Identity Pool you want to set attribute mappings for.
  ///
  /// Parameter [identityProviderName] :
  /// The provider name you want to use for attribute mappings.
  ///
  /// Parameter [principalTags] :
  /// You can use this operation to add principal tags.
  ///
  /// Parameter [useDefaults] :
  /// You can use this operation to use default (username and clientID)
  /// attribute mappings.
  Future<SetPrincipalTagAttributeMapResponse> setPrincipalTagAttributeMap({
    required String identityPoolId,
    required String identityProviderName,
    Map<String, String>? principalTags,
    bool? useDefaults,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.SetPrincipalTagAttributeMap'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityPoolId': identityPoolId,
        'IdentityProviderName': identityProviderName,
        if (principalTags != null) 'PrincipalTags': principalTags,
        if (useDefaults != null) 'UseDefaults': useDefaults,
      },
    );

    return SetPrincipalTagAttributeMapResponse.fromJson(jsonResponse.body);
  }

  /// Assigns a set of tags to the specified Amazon Cognito identity pool. A tag
  /// is a label that you can use to categorize and manage identity pools in
  /// different ways, such as by purpose, owner, environment, or other criteria.
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
  /// The Amazon Resource Name (ARN) of the identity pool.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the identity pool.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.TagResource'
    };
    await _protocol.send(
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
    required String developerProviderName,
    required String developerUserIdentifier,
    required String identityId,
    required String identityPoolId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.UnlinkDeveloperIdentity'
    };
    await _protocol.send(
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
    required String identityId,
    required Map<String, String> logins,
    required List<String> loginsToRemove,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.UnlinkIdentity'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      signed: false,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityId': identityId,
        'Logins': logins,
        'LoginsToRemove': loginsToRemove,
      },
    );
  }

  /// Removes the specified tags from the specified Amazon Cognito identity
  /// pool. You can use this action up to 5 times per second, per account
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the identity pool.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to remove from the user pool.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityService.UntagResource'
    };
    await _protocol.send(
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
  /// The ARNs of the OpenID Connect providers.
  ///
  /// Parameter [samlProviderARNs] :
  /// An array of Amazon Resource Names (ARNs) of the SAML provider for your
  /// identity pool.
  ///
  /// Parameter [supportedLoginProviders] :
  /// Optional key:value pairs mapping provider names to provider app IDs.
  Future<IdentityPool> updateIdentityPool({
    required bool allowUnauthenticatedIdentities,
    required String identityPoolId,
    required String identityPoolName,
    bool? allowClassicFlow,
    List<CognitoIdentityProvider>? cognitoIdentityProviders,
    String? developerProviderName,
    Map<String, String>? identityPoolTags,
    List<String>? openIdConnectProviderARNs,
    List<String>? samlProviderARNs,
    Map<String, String>? supportedLoginProviders,
  }) async {
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
  authenticatedRole,
  deny,
}

extension AmbiguousRoleResolutionTypeValueExtension
    on AmbiguousRoleResolutionType {
  String toValue() {
    switch (this) {
      case AmbiguousRoleResolutionType.authenticatedRole:
        return 'AuthenticatedRole';
      case AmbiguousRoleResolutionType.deny:
        return 'Deny';
    }
  }
}

extension AmbiguousRoleResolutionTypeFromString on String {
  AmbiguousRoleResolutionType toAmbiguousRoleResolutionType() {
    switch (this) {
      case 'AuthenticatedRole':
        return AmbiguousRoleResolutionType.authenticatedRole;
      case 'Deny':
        return AmbiguousRoleResolutionType.deny;
    }
    throw Exception('$this is not known in enum AmbiguousRoleResolutionType');
  }
}

/// A provider representing an Amazon Cognito user pool and its client ID.
class CognitoIdentityProvider {
  /// The client ID for the Amazon Cognito user pool.
  final String? clientId;

  /// The provider name for an Amazon Cognito user pool. For example,
  /// <code>cognito-idp.us-east-1.amazonaws.com/us-east-1_123456789</code>.
  final String? providerName;

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
  final bool? serverSideTokenCheck;

  CognitoIdentityProvider({
    this.clientId,
    this.providerName,
    this.serverSideTokenCheck,
  });

  factory CognitoIdentityProvider.fromJson(Map<String, dynamic> json) {
    return CognitoIdentityProvider(
      clientId: json['ClientId'] as String?,
      providerName: json['ProviderName'] as String?,
      serverSideTokenCheck: json['ServerSideTokenCheck'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final providerName = this.providerName;
    final serverSideTokenCheck = this.serverSideTokenCheck;
    return {
      if (clientId != null) 'ClientId': clientId,
      if (providerName != null) 'ProviderName': providerName,
      if (serverSideTokenCheck != null)
        'ServerSideTokenCheck': serverSideTokenCheck,
    };
  }
}

/// Credentials for the provided identity ID.
class Credentials {
  /// The Access Key portion of the credentials.
  final String? accessKeyId;

  /// The date at which these credentials will expire.
  final DateTime? expiration;

  /// The Secret Access Key portion of the credentials
  final String? secretKey;

  /// The Session Token portion of the credentials
  final String? sessionToken;

  Credentials({
    this.accessKeyId,
    this.expiration,
    this.secretKey,
    this.sessionToken,
  });

  factory Credentials.fromJson(Map<String, dynamic> json) {
    return Credentials(
      accessKeyId: json['AccessKeyId'] as String?,
      expiration: timeStampFromJson(json['Expiration']),
      secretKey: json['SecretKey'] as String?,
      sessionToken: json['SessionToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final expiration = this.expiration;
    final secretKey = this.secretKey;
    final sessionToken = this.sessionToken;
    return {
      if (accessKeyId != null) 'AccessKeyId': accessKeyId,
      if (expiration != null) 'Expiration': unixTimestampToJson(expiration),
      if (secretKey != null) 'SecretKey': secretKey,
      if (sessionToken != null) 'SessionToken': sessionToken,
    };
  }
}

/// Returned in response to a successful <code>DeleteIdentities</code>
/// operation.
class DeleteIdentitiesResponse {
  /// An array of UnprocessedIdentityId objects, each of which contains an
  /// ErrorCode and IdentityId.
  final List<UnprocessedIdentityId>? unprocessedIdentityIds;

  DeleteIdentitiesResponse({
    this.unprocessedIdentityIds,
  });

  factory DeleteIdentitiesResponse.fromJson(Map<String, dynamic> json) {
    return DeleteIdentitiesResponse(
      unprocessedIdentityIds: (json['UnprocessedIdentityIds'] as List?)
          ?.whereNotNull()
          .map((e) => UnprocessedIdentityId.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final unprocessedIdentityIds = this.unprocessedIdentityIds;
    return {
      if (unprocessedIdentityIds != null)
        'UnprocessedIdentityIds': unprocessedIdentityIds,
    };
  }
}

enum ErrorCode {
  accessDenied,
  internalServerError,
}

extension ErrorCodeValueExtension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.accessDenied:
        return 'AccessDenied';
      case ErrorCode.internalServerError:
        return 'InternalServerError';
    }
  }
}

extension ErrorCodeFromString on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'AccessDenied':
        return ErrorCode.accessDenied;
      case 'InternalServerError':
        return ErrorCode.internalServerError;
    }
    throw Exception('$this is not known in enum ErrorCode');
  }
}

/// Returned in response to a successful <code>GetCredentialsForIdentity</code>
/// operation.
class GetCredentialsForIdentityResponse {
  /// Credentials for the provided identity ID.
  final Credentials? credentials;

  /// A unique identifier in the format REGION:GUID.
  final String? identityId;

  GetCredentialsForIdentityResponse({
    this.credentials,
    this.identityId,
  });

  factory GetCredentialsForIdentityResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCredentialsForIdentityResponse(
      credentials: json['Credentials'] != null
          ? Credentials.fromJson(json['Credentials'] as Map<String, dynamic>)
          : null,
      identityId: json['IdentityId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    final identityId = this.identityId;
    return {
      if (credentials != null) 'Credentials': credentials,
      if (identityId != null) 'IdentityId': identityId,
    };
  }
}

/// Returned in response to a GetId request.
class GetIdResponse {
  /// A unique identifier in the format REGION:GUID.
  final String? identityId;

  GetIdResponse({
    this.identityId,
  });

  factory GetIdResponse.fromJson(Map<String, dynamic> json) {
    return GetIdResponse(
      identityId: json['IdentityId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityId = this.identityId;
    return {
      if (identityId != null) 'IdentityId': identityId,
    };
  }
}

/// Returned in response to a successful <code>GetIdentityPoolRoles</code>
/// operation.
class GetIdentityPoolRolesResponse {
  /// An identity pool ID in the format REGION:GUID.
  final String? identityPoolId;

  /// How users for a specific identity provider are to mapped to roles. This is a
  /// String-to-<a>RoleMapping</a> object map. The string identifies the identity
  /// provider, for example, "graph.facebook.com" or
  /// "cognito-idp.us-east-1.amazonaws.com/us-east-1_abcdefghi:app_client_id".
  final Map<String, RoleMapping>? roleMappings;

  /// The map of roles associated with this pool. Currently only authenticated and
  /// unauthenticated roles are supported.
  final Map<String, String>? roles;

  GetIdentityPoolRolesResponse({
    this.identityPoolId,
    this.roleMappings,
    this.roles,
  });

  factory GetIdentityPoolRolesResponse.fromJson(Map<String, dynamic> json) {
    return GetIdentityPoolRolesResponse(
      identityPoolId: json['IdentityPoolId'] as String?,
      roleMappings: (json['RoleMappings'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, RoleMapping.fromJson(e as Map<String, dynamic>))),
      roles: (json['Roles'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final identityPoolId = this.identityPoolId;
    final roleMappings = this.roleMappings;
    final roles = this.roles;
    return {
      if (identityPoolId != null) 'IdentityPoolId': identityPoolId,
      if (roleMappings != null) 'RoleMappings': roleMappings,
      if (roles != null) 'Roles': roles,
    };
  }
}

/// Returned in response to a successful
/// <code>GetOpenIdTokenForDeveloperIdentity</code> request.
class GetOpenIdTokenForDeveloperIdentityResponse {
  /// A unique identifier in the format REGION:GUID.
  final String? identityId;

  /// An OpenID token.
  final String? token;

  GetOpenIdTokenForDeveloperIdentityResponse({
    this.identityId,
    this.token,
  });

  factory GetOpenIdTokenForDeveloperIdentityResponse.fromJson(
      Map<String, dynamic> json) {
    return GetOpenIdTokenForDeveloperIdentityResponse(
      identityId: json['IdentityId'] as String?,
      token: json['Token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityId = this.identityId;
    final token = this.token;
    return {
      if (identityId != null) 'IdentityId': identityId,
      if (token != null) 'Token': token,
    };
  }
}

/// Returned in response to a successful GetOpenIdToken request.
class GetOpenIdTokenResponse {
  /// A unique identifier in the format REGION:GUID. Note that the IdentityId
  /// returned may not match the one passed on input.
  final String? identityId;

  /// An OpenID token, valid for 10 minutes.
  final String? token;

  GetOpenIdTokenResponse({
    this.identityId,
    this.token,
  });

  factory GetOpenIdTokenResponse.fromJson(Map<String, dynamic> json) {
    return GetOpenIdTokenResponse(
      identityId: json['IdentityId'] as String?,
      token: json['Token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityId = this.identityId;
    final token = this.token;
    return {
      if (identityId != null) 'IdentityId': identityId,
      if (token != null) 'Token': token,
    };
  }
}

class GetPrincipalTagAttributeMapResponse {
  /// You can use this operation to get the ID of the Identity Pool you setup
  /// attribute mappings for.
  final String? identityPoolId;

  /// You can use this operation to get the provider name.
  final String? identityProviderName;

  /// You can use this operation to add principal tags. The
  /// <code>PrincipalTags</code>operation enables you to reference user attributes
  /// in your IAM permissions policy.
  final Map<String, String>? principalTags;

  /// You can use this operation to list
  final bool? useDefaults;

  GetPrincipalTagAttributeMapResponse({
    this.identityPoolId,
    this.identityProviderName,
    this.principalTags,
    this.useDefaults,
  });

  factory GetPrincipalTagAttributeMapResponse.fromJson(
      Map<String, dynamic> json) {
    return GetPrincipalTagAttributeMapResponse(
      identityPoolId: json['IdentityPoolId'] as String?,
      identityProviderName: json['IdentityProviderName'] as String?,
      principalTags: (json['PrincipalTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      useDefaults: json['UseDefaults'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityPoolId = this.identityPoolId;
    final identityProviderName = this.identityProviderName;
    final principalTags = this.principalTags;
    final useDefaults = this.useDefaults;
    return {
      if (identityPoolId != null) 'IdentityPoolId': identityPoolId,
      if (identityProviderName != null)
        'IdentityProviderName': identityProviderName,
      if (principalTags != null) 'PrincipalTags': principalTags,
      if (useDefaults != null) 'UseDefaults': useDefaults,
    };
  }
}

/// A description of the identity.
class IdentityDescription {
  /// Date on which the identity was created.
  final DateTime? creationDate;

  /// A unique identifier in the format REGION:GUID.
  final String? identityId;

  /// Date on which the identity was last modified.
  final DateTime? lastModifiedDate;

  /// The provider names.
  final List<String>? logins;

  IdentityDescription({
    this.creationDate,
    this.identityId,
    this.lastModifiedDate,
    this.logins,
  });

  factory IdentityDescription.fromJson(Map<String, dynamic> json) {
    return IdentityDescription(
      creationDate: timeStampFromJson(json['CreationDate']),
      identityId: json['IdentityId'] as String?,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      logins: (json['Logins'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final identityId = this.identityId;
    final lastModifiedDate = this.lastModifiedDate;
    final logins = this.logins;
    return {
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (identityId != null) 'IdentityId': identityId,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (logins != null) 'Logins': logins,
    };
  }
}

/// An object representing an Amazon Cognito identity pool.
class IdentityPool {
  /// TRUE if the identity pool supports unauthenticated logins.
  final bool allowUnauthenticatedIdentities;

  /// An identity pool ID in the format REGION:GUID.
  final String identityPoolId;

  /// A string that you provide.
  final String identityPoolName;

  /// Enables or disables the Basic (Classic) authentication flow. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flow.html">Identity
  /// Pools (Federated Identities) Authentication Flow</a> in the <i>Amazon
  /// Cognito Developer Guide</i>.
  final bool? allowClassicFlow;

  /// A list representing an Amazon Cognito user pool and its client ID.
  final List<CognitoIdentityProvider>? cognitoIdentityProviders;

  /// The "domain" by which Cognito will refer to your users.
  final String? developerProviderName;

  /// The tags that are assigned to the identity pool. A tag is a label that you
  /// can apply to identity pools to categorize and manage them in different ways,
  /// such as by purpose, owner, environment, or other criteria.
  final Map<String, String>? identityPoolTags;

  /// The ARNs of the OpenID Connect providers.
  final List<String>? openIdConnectProviderARNs;

  /// An array of Amazon Resource Names (ARNs) of the SAML provider for your
  /// identity pool.
  final List<String>? samlProviderARNs;

  /// Optional key:value pairs mapping provider names to provider app IDs.
  final Map<String, String>? supportedLoginProviders;

  IdentityPool({
    required this.allowUnauthenticatedIdentities,
    required this.identityPoolId,
    required this.identityPoolName,
    this.allowClassicFlow,
    this.cognitoIdentityProviders,
    this.developerProviderName,
    this.identityPoolTags,
    this.openIdConnectProviderARNs,
    this.samlProviderARNs,
    this.supportedLoginProviders,
  });

  factory IdentityPool.fromJson(Map<String, dynamic> json) {
    return IdentityPool(
      allowUnauthenticatedIdentities:
          json['AllowUnauthenticatedIdentities'] as bool,
      identityPoolId: json['IdentityPoolId'] as String,
      identityPoolName: json['IdentityPoolName'] as String,
      allowClassicFlow: json['AllowClassicFlow'] as bool?,
      cognitoIdentityProviders: (json['CognitoIdentityProviders'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CognitoIdentityProvider.fromJson(e as Map<String, dynamic>))
          .toList(),
      developerProviderName: json['DeveloperProviderName'] as String?,
      identityPoolTags: (json['IdentityPoolTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      openIdConnectProviderARNs: (json['OpenIdConnectProviderARNs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      samlProviderARNs: (json['SamlProviderARNs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      supportedLoginProviders:
          (json['SupportedLoginProviders'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final allowUnauthenticatedIdentities = this.allowUnauthenticatedIdentities;
    final identityPoolId = this.identityPoolId;
    final identityPoolName = this.identityPoolName;
    final allowClassicFlow = this.allowClassicFlow;
    final cognitoIdentityProviders = this.cognitoIdentityProviders;
    final developerProviderName = this.developerProviderName;
    final identityPoolTags = this.identityPoolTags;
    final openIdConnectProviderARNs = this.openIdConnectProviderARNs;
    final samlProviderARNs = this.samlProviderARNs;
    final supportedLoginProviders = this.supportedLoginProviders;
    return {
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
    };
  }
}

/// A description of the identity pool.
class IdentityPoolShortDescription {
  /// An identity pool ID in the format REGION:GUID.
  final String? identityPoolId;

  /// A string that you provide.
  final String? identityPoolName;

  IdentityPoolShortDescription({
    this.identityPoolId,
    this.identityPoolName,
  });

  factory IdentityPoolShortDescription.fromJson(Map<String, dynamic> json) {
    return IdentityPoolShortDescription(
      identityPoolId: json['IdentityPoolId'] as String?,
      identityPoolName: json['IdentityPoolName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityPoolId = this.identityPoolId;
    final identityPoolName = this.identityPoolName;
    return {
      if (identityPoolId != null) 'IdentityPoolId': identityPoolId,
      if (identityPoolName != null) 'IdentityPoolName': identityPoolName,
    };
  }
}

/// The response to a ListIdentities request.
class ListIdentitiesResponse {
  /// An object containing a set of identities and associated mappings.
  final List<IdentityDescription>? identities;

  /// An identity pool ID in the format REGION:GUID.
  final String? identityPoolId;

  /// A pagination token.
  final String? nextToken;

  ListIdentitiesResponse({
    this.identities,
    this.identityPoolId,
    this.nextToken,
  });

  factory ListIdentitiesResponse.fromJson(Map<String, dynamic> json) {
    return ListIdentitiesResponse(
      identities: (json['Identities'] as List?)
          ?.whereNotNull()
          .map((e) => IdentityDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      identityPoolId: json['IdentityPoolId'] as String?,
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identities = this.identities;
    final identityPoolId = this.identityPoolId;
    final nextToken = this.nextToken;
    return {
      if (identities != null) 'Identities': identities,
      if (identityPoolId != null) 'IdentityPoolId': identityPoolId,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The result of a successful ListIdentityPools action.
class ListIdentityPoolsResponse {
  /// The identity pools returned by the ListIdentityPools action.
  final List<IdentityPoolShortDescription>? identityPools;

  /// A pagination token.
  final String? nextToken;

  ListIdentityPoolsResponse({
    this.identityPools,
    this.nextToken,
  });

  factory ListIdentityPoolsResponse.fromJson(Map<String, dynamic> json) {
    return ListIdentityPoolsResponse(
      identityPools: (json['IdentityPools'] as List?)
          ?.whereNotNull()
          .map((e) =>
              IdentityPoolShortDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityPools = this.identityPools;
    final nextToken = this.nextToken;
    return {
      if (identityPools != null) 'IdentityPools': identityPools,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags that are assigned to the identity pool.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Returned in response to a successful <code>LookupDeveloperIdentity</code>
/// action.
class LookupDeveloperIdentityResponse {
  /// This is the list of developer user identifiers associated with an identity
  /// ID. Cognito supports the association of multiple developer user identifiers
  /// with an identity ID.
  final List<String>? developerUserIdentifierList;

  /// A unique identifier in the format REGION:GUID.
  final String? identityId;

  /// A pagination token. The first call you make will have <code>NextToken</code>
  /// set to null. After that the service will return <code>NextToken</code>
  /// values as needed. For example, let's say you make a request with
  /// <code>MaxResults</code> set to 10, and there are 20 matches in the database.
  /// The service will return a pagination token as a part of the response. This
  /// token can be used to call the API again and get results starting from the
  /// 11th match.
  final String? nextToken;

  LookupDeveloperIdentityResponse({
    this.developerUserIdentifierList,
    this.identityId,
    this.nextToken,
  });

  factory LookupDeveloperIdentityResponse.fromJson(Map<String, dynamic> json) {
    return LookupDeveloperIdentityResponse(
      developerUserIdentifierList:
          (json['DeveloperUserIdentifierList'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      identityId: json['IdentityId'] as String?,
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final developerUserIdentifierList = this.developerUserIdentifierList;
    final identityId = this.identityId;
    final nextToken = this.nextToken;
    return {
      if (developerUserIdentifierList != null)
        'DeveloperUserIdentifierList': developerUserIdentifierList,
      if (identityId != null) 'IdentityId': identityId,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A rule that maps a claim name, a claim value, and a match type to a role
/// ARN.
class MappingRule {
  /// The claim name that must be present in the token, for example, "isAdmin" or
  /// "paid".
  final String claim;

  /// The match condition that specifies how closely the claim value in the IdP
  /// token must match <code>Value</code>.
  final MappingRuleMatchType matchType;

  /// The role ARN.
  final String roleARN;

  /// A brief string that the claim must match, for example, "paid" or "yes".
  final String value;

  MappingRule({
    required this.claim,
    required this.matchType,
    required this.roleARN,
    required this.value,
  });

  factory MappingRule.fromJson(Map<String, dynamic> json) {
    return MappingRule(
      claim: json['Claim'] as String,
      matchType: (json['MatchType'] as String).toMappingRuleMatchType(),
      roleARN: json['RoleARN'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final claim = this.claim;
    final matchType = this.matchType;
    final roleARN = this.roleARN;
    final value = this.value;
    return {
      'Claim': claim,
      'MatchType': matchType.toValue(),
      'RoleARN': roleARN,
      'Value': value,
    };
  }
}

enum MappingRuleMatchType {
  equals,
  contains,
  startsWith,
  notEqual,
}

extension MappingRuleMatchTypeValueExtension on MappingRuleMatchType {
  String toValue() {
    switch (this) {
      case MappingRuleMatchType.equals:
        return 'Equals';
      case MappingRuleMatchType.contains:
        return 'Contains';
      case MappingRuleMatchType.startsWith:
        return 'StartsWith';
      case MappingRuleMatchType.notEqual:
        return 'NotEqual';
    }
  }
}

extension MappingRuleMatchTypeFromString on String {
  MappingRuleMatchType toMappingRuleMatchType() {
    switch (this) {
      case 'Equals':
        return MappingRuleMatchType.equals;
      case 'Contains':
        return MappingRuleMatchType.contains;
      case 'StartsWith':
        return MappingRuleMatchType.startsWith;
      case 'NotEqual':
        return MappingRuleMatchType.notEqual;
    }
    throw Exception('$this is not known in enum MappingRuleMatchType');
  }
}

/// Returned in response to a successful <code>MergeDeveloperIdentities</code>
/// action.
class MergeDeveloperIdentitiesResponse {
  /// A unique identifier in the format REGION:GUID.
  final String? identityId;

  MergeDeveloperIdentitiesResponse({
    this.identityId,
  });

  factory MergeDeveloperIdentitiesResponse.fromJson(Map<String, dynamic> json) {
    return MergeDeveloperIdentitiesResponse(
      identityId: json['IdentityId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityId = this.identityId;
    return {
      if (identityId != null) 'IdentityId': identityId,
    };
  }
}

/// A role mapping.
class RoleMapping {
  /// The role mapping type. Token will use <code>cognito:roles</code> and
  /// <code>cognito:preferred_role</code> claims from the Cognito identity
  /// provider token to map groups to roles. Rules will attempt to match claims
  /// from the token to map to a role.
  final RoleMappingType type;

  /// If you specify Token or Rules as the <code>Type</code>,
  /// <code>AmbiguousRoleResolution</code> is required.
  ///
  /// Specifies the action to be taken if either no rules match the claim value
  /// for the <code>Rules</code> type, or there is no
  /// <code>cognito:preferred_role</code> claim and there are multiple
  /// <code>cognito:roles</code> matches for the <code>Token</code> type.
  final AmbiguousRoleResolutionType? ambiguousRoleResolution;

  /// The rules to be used for mapping users to roles.
  ///
  /// If you specify Rules as the role mapping type,
  /// <code>RulesConfiguration</code> is required.
  final RulesConfigurationType? rulesConfiguration;

  RoleMapping({
    required this.type,
    this.ambiguousRoleResolution,
    this.rulesConfiguration,
  });

  factory RoleMapping.fromJson(Map<String, dynamic> json) {
    return RoleMapping(
      type: (json['Type'] as String).toRoleMappingType(),
      ambiguousRoleResolution: (json['AmbiguousRoleResolution'] as String?)
          ?.toAmbiguousRoleResolutionType(),
      rulesConfiguration: json['RulesConfiguration'] != null
          ? RulesConfigurationType.fromJson(
              json['RulesConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final ambiguousRoleResolution = this.ambiguousRoleResolution;
    final rulesConfiguration = this.rulesConfiguration;
    return {
      'Type': type.toValue(),
      if (ambiguousRoleResolution != null)
        'AmbiguousRoleResolution': ambiguousRoleResolution.toValue(),
      if (rulesConfiguration != null) 'RulesConfiguration': rulesConfiguration,
    };
  }
}

enum RoleMappingType {
  token,
  rules,
}

extension RoleMappingTypeValueExtension on RoleMappingType {
  String toValue() {
    switch (this) {
      case RoleMappingType.token:
        return 'Token';
      case RoleMappingType.rules:
        return 'Rules';
    }
  }
}

extension RoleMappingTypeFromString on String {
  RoleMappingType toRoleMappingType() {
    switch (this) {
      case 'Token':
        return RoleMappingType.token;
      case 'Rules':
        return RoleMappingType.rules;
    }
    throw Exception('$this is not known in enum RoleMappingType');
  }
}

/// A container for rules.
class RulesConfigurationType {
  /// An array of rules. You can specify up to 25 rules per identity provider.
  ///
  /// Rules are evaluated in order. The first one to match specifies the role.
  final List<MappingRule> rules;

  RulesConfigurationType({
    required this.rules,
  });

  factory RulesConfigurationType.fromJson(Map<String, dynamic> json) {
    return RulesConfigurationType(
      rules: (json['Rules'] as List)
          .whereNotNull()
          .map((e) => MappingRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rules = this.rules;
    return {
      'Rules': rules,
    };
  }
}

class SetPrincipalTagAttributeMapResponse {
  /// The ID of the Identity Pool you want to set attribute mappings for.
  final String? identityPoolId;

  /// The provider name you want to use for attribute mappings.
  final String? identityProviderName;

  /// You can use this operation to add principal tags. The
  /// <code>PrincipalTags</code>operation enables you to reference user attributes
  /// in your IAM permissions policy.
  final Map<String, String>? principalTags;

  /// You can use this operation to select default (username and clientID)
  /// attribute mappings.
  final bool? useDefaults;

  SetPrincipalTagAttributeMapResponse({
    this.identityPoolId,
    this.identityProviderName,
    this.principalTags,
    this.useDefaults,
  });

  factory SetPrincipalTagAttributeMapResponse.fromJson(
      Map<String, dynamic> json) {
    return SetPrincipalTagAttributeMapResponse(
      identityPoolId: json['IdentityPoolId'] as String?,
      identityProviderName: json['IdentityProviderName'] as String?,
      principalTags: (json['PrincipalTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      useDefaults: json['UseDefaults'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityPoolId = this.identityPoolId;
    final identityProviderName = this.identityProviderName;
    final principalTags = this.principalTags;
    final useDefaults = this.useDefaults;
    return {
      if (identityPoolId != null) 'IdentityPoolId': identityPoolId,
      if (identityProviderName != null)
        'IdentityProviderName': identityProviderName,
      if (principalTags != null) 'PrincipalTags': principalTags,
      if (useDefaults != null) 'UseDefaults': useDefaults,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An array of UnprocessedIdentityId objects, each of which contains an
/// ErrorCode and IdentityId.
class UnprocessedIdentityId {
  /// The error code indicating the type of error that occurred.
  final ErrorCode? errorCode;

  /// A unique identifier in the format REGION:GUID.
  final String? identityId;

  UnprocessedIdentityId({
    this.errorCode,
    this.identityId,
  });

  factory UnprocessedIdentityId.fromJson(Map<String, dynamic> json) {
    return UnprocessedIdentityId(
      errorCode: (json['ErrorCode'] as String?)?.toErrorCode(),
      identityId: json['IdentityId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final identityId = this.identityId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (identityId != null) 'IdentityId': identityId,
    };
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class DeveloperUserAlreadyRegisteredException extends _s.GenericAwsException {
  DeveloperUserAlreadyRegisteredException({String? type, String? message})
      : super(
            type: type,
            code: 'DeveloperUserAlreadyRegisteredException',
            message: message);
}

class ExternalServiceException extends _s.GenericAwsException {
  ExternalServiceException({String? type, String? message})
      : super(type: type, code: 'ExternalServiceException', message: message);
}

class InternalErrorException extends _s.GenericAwsException {
  InternalErrorException({String? type, String? message})
      : super(type: type, code: 'InternalErrorException', message: message);
}

class InvalidIdentityPoolConfigurationException extends _s.GenericAwsException {
  InvalidIdentityPoolConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidIdentityPoolConfigurationException',
            message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotAuthorizedException extends _s.GenericAwsException {
  NotAuthorizedException({String? type, String? message})
      : super(type: type, code: 'NotAuthorizedException', message: message);
}

class ResourceConflictException extends _s.GenericAwsException {
  ResourceConflictException({String? type, String? message})
      : super(type: type, code: 'ResourceConflictException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
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
