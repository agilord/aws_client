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

/// WorkSpaces Web is a low cost, fully managed WorkSpace built specifically to
/// facilitate secure, web-based workloads. WorkSpaces Web makes it easy for
/// customers to safely provide their employees with access to internal websites
/// and SaaS web applications without the administrative burden of appliances or
/// specialized client software. WorkSpaces Web provides simple policy tools
/// tailored for user interactions, while offloading common tasks like capacity
/// management, scaling, and maintaining browser images.
class WorkSpacesWeb {
  final _s.RestJsonProtocol _protocol;
  WorkSpacesWeb({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'workspaces-web',
            signingName: 'workspaces-web',
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

  /// Associates a browser settings resource with a web portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [browserSettingsArn] :
  /// The ARN of the browser settings.
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  Future<AssociateBrowserSettingsResponse> associateBrowserSettings({
    required String browserSettingsArn,
    required String portalArn,
  }) async {
    final $query = <String, List<String>>{
      'browserSettingsArn': [browserSettingsArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}/browserSettings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AssociateBrowserSettingsResponse.fromJson(response);
  }

  /// Associates an IP access settings resource with a web portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [ipAccessSettingsArn] :
  /// The ARN of the IP access settings.
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  Future<AssociateIpAccessSettingsResponse> associateIpAccessSettings({
    required String ipAccessSettingsArn,
    required String portalArn,
  }) async {
    final $query = <String, List<String>>{
      'ipAccessSettingsArn': [ipAccessSettingsArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}/ipAccessSettings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AssociateIpAccessSettingsResponse.fromJson(response);
  }

  /// Associates a network settings resource with a web portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [networkSettingsArn] :
  /// The ARN of the network settings.
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  Future<AssociateNetworkSettingsResponse> associateNetworkSettings({
    required String networkSettingsArn,
    required String portalArn,
  }) async {
    final $query = <String, List<String>>{
      'networkSettingsArn': [networkSettingsArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}/networkSettings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AssociateNetworkSettingsResponse.fromJson(response);
  }

  /// Associates a trust store with a web portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  ///
  /// Parameter [trustStoreArn] :
  /// The ARN of the trust store.
  Future<AssociateTrustStoreResponse> associateTrustStore({
    required String portalArn,
    required String trustStoreArn,
  }) async {
    final $query = <String, List<String>>{
      'trustStoreArn': [trustStoreArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}/trustStores',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AssociateTrustStoreResponse.fromJson(response);
  }

  /// Associates a user access logging settings resource with a web portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  ///
  /// Parameter [userAccessLoggingSettingsArn] :
  /// The ARN of the user access logging settings.
  Future<AssociateUserAccessLoggingSettingsResponse>
      associateUserAccessLoggingSettings({
    required String portalArn,
    required String userAccessLoggingSettingsArn,
  }) async {
    final $query = <String, List<String>>{
      'userAccessLoggingSettingsArn': [userAccessLoggingSettingsArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}/userAccessLoggingSettings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AssociateUserAccessLoggingSettingsResponse.fromJson(response);
  }

  /// Associates a user settings resource with a web portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  ///
  /// Parameter [userSettingsArn] :
  /// The ARN of the user settings.
  Future<AssociateUserSettingsResponse> associateUserSettings({
    required String portalArn,
    required String userSettingsArn,
  }) async {
    final $query = <String, List<String>>{
      'userSettingsArn': [userSettingsArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}/userSettings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AssociateUserSettingsResponse.fromJson(response);
  }

  /// Creates a browser settings resource that can be associated with a web
  /// portal. Once associated with a web portal, browser settings control how
  /// the browser will behave once a user starts a streaming session for the web
  /// portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [browserPolicy] :
  /// A JSON string containing Chrome Enterprise policies that will be applied
  /// to all streaming sessions.
  ///
  /// Parameter [additionalEncryptionContext] :
  /// Additional encryption context of the browser settings.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, subsequent retries with the same client token
  /// returns the result from the original successful request.
  ///
  /// If you do not specify a client token, one is automatically generated by
  /// the Amazon Web Services SDK.
  ///
  /// Parameter [customerManagedKey] :
  /// The custom managed key of the browser settings.
  ///
  /// Parameter [tags] :
  /// The tags to add to the browser settings resource. A tag is a key-value
  /// pair.
  Future<CreateBrowserSettingsResponse> createBrowserSettings({
    required String browserPolicy,
    Map<String, String>? additionalEncryptionContext,
    String? clientToken,
    String? customerManagedKey,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'browserPolicy': browserPolicy,
      if (additionalEncryptionContext != null)
        'additionalEncryptionContext': additionalEncryptionContext,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (customerManagedKey != null) 'customerManagedKey': customerManagedKey,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/browserSettings',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBrowserSettingsResponse.fromJson(response);
  }

  /// Creates an identity provider resource that is then associated with a web
  /// portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [identityProviderDetails] :
  /// The identity provider details. The following list describes the provider
  /// detail keys for each identity provider type.
  ///
  /// <ul>
  /// <li>
  /// For Google and Login with Amazon:
  ///
  /// <ul>
  /// <li>
  /// <code>client_id</code>
  /// </li>
  /// <li>
  /// <code>client_secret</code>
  /// </li>
  /// <li>
  /// <code>authorize_scopes</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For Facebook:
  ///
  /// <ul>
  /// <li>
  /// <code>client_id</code>
  /// </li>
  /// <li>
  /// <code>client_secret</code>
  /// </li>
  /// <li>
  /// <code>authorize_scopes</code>
  /// </li>
  /// <li>
  /// <code>api_version</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For Sign in with Apple:
  ///
  /// <ul>
  /// <li>
  /// <code>client_id</code>
  /// </li>
  /// <li>
  /// <code>team_id</code>
  /// </li>
  /// <li>
  /// <code>key_id</code>
  /// </li>
  /// <li>
  /// <code>private_key</code>
  /// </li>
  /// <li>
  /// <code>authorize_scopes</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For OIDC providers:
  ///
  /// <ul>
  /// <li>
  /// <code>client_id</code>
  /// </li>
  /// <li>
  /// <code>client_secret</code>
  /// </li>
  /// <li>
  /// <code>attributes_request_method</code>
  /// </li>
  /// <li>
  /// <code>oidc_issuer</code>
  /// </li>
  /// <li>
  /// <code>authorize_scopes</code>
  /// </li>
  /// <li>
  /// <code>authorize_url</code> <i>if not available from discovery URL
  /// specified by <code>oidc_issuer</code> key</i>
  /// </li>
  /// <li>
  /// <code>token_url</code> <i>if not available from discovery URL specified by
  /// <code>oidc_issuer</code> key</i>
  /// </li>
  /// <li>
  /// <code>attributes_url</code> <i>if not available from discovery URL
  /// specified by <code>oidc_issuer</code> key</i>
  /// </li>
  /// <li>
  /// <code>jwks_uri</code> <i>if not available from discovery URL specified by
  /// <code>oidc_issuer</code> key</i>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For SAML providers:
  ///
  /// <ul>
  /// <li>
  /// <code>MetadataFile</code> OR <code>MetadataURL</code>
  /// </li>
  /// <li>
  /// <code>IDPSignout</code> (boolean) <i>optional</i>
  /// </li>
  /// <li>
  /// <code>IDPInit</code> (boolean) <i>optional</i>
  /// </li>
  /// <li>
  /// <code>RequestSigningAlgorithm</code> (string) <i>optional</i> - Only
  /// accepts <code>rsa-sha256</code>
  /// </li>
  /// <li>
  /// <code>EncryptedResponses</code> (boolean) <i>optional</i>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [identityProviderName] :
  /// The identity provider name.
  ///
  /// Parameter [identityProviderType] :
  /// The identity provider type.
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, subsequent retries with the same client token
  /// returns the result from the original successful request.
  ///
  /// If you do not specify a client token, one is automatically generated by
  /// the Amazon Web Services SDK.
  Future<CreateIdentityProviderResponse> createIdentityProvider({
    required Map<String, String> identityProviderDetails,
    required String identityProviderName,
    required IdentityProviderType identityProviderType,
    required String portalArn,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'identityProviderDetails': identityProviderDetails,
      'identityProviderName': identityProviderName,
      'identityProviderType': identityProviderType.toValue(),
      'portalArn': portalArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/identityProviders',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIdentityProviderResponse.fromJson(response);
  }

  /// Creates an IP access settings resource that can be associated with a web
  /// portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [ipRules] :
  /// The IP rules of the IP access settings.
  ///
  /// Parameter [additionalEncryptionContext] :
  /// Additional encryption context of the IP access settings.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, subsequent retries with the same client token
  /// returns the result from the original successful request.
  ///
  /// If you do not specify a client token, one is automatically generated by
  /// the Amazon Web Services SDK.
  ///
  /// Parameter [customerManagedKey] :
  /// The custom managed key of the IP access settings.
  ///
  /// Parameter [description] :
  /// The description of the IP access settings.
  ///
  /// Parameter [displayName] :
  /// The display name of the IP access settings.
  ///
  /// Parameter [tags] :
  /// The tags to add to the browser settings resource. A tag is a key-value
  /// pair.
  Future<CreateIpAccessSettingsResponse> createIpAccessSettings({
    required List<IpRule> ipRules,
    Map<String, String>? additionalEncryptionContext,
    String? clientToken,
    String? customerManagedKey,
    String? description,
    String? displayName,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ipRules': ipRules,
      if (additionalEncryptionContext != null)
        'additionalEncryptionContext': additionalEncryptionContext,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (customerManagedKey != null) 'customerManagedKey': customerManagedKey,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ipAccessSettings',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIpAccessSettingsResponse.fromJson(response);
  }

  /// Creates a network settings resource that can be associated with a web
  /// portal. Once associated with a web portal, network settings define how
  /// streaming instances will connect with your specified VPC.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [securityGroupIds] :
  /// One or more security groups used to control access from streaming
  /// instances to your VPC.
  ///
  /// Parameter [subnetIds] :
  /// The subnets in which network interfaces are created to connect streaming
  /// instances to your VPC. At least two of these subnets must be in different
  /// availability zones.
  ///
  /// Parameter [vpcId] :
  /// The VPC that streaming instances will connect to.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, subsequent retries with the same client token
  /// returns the result from the original successful request.
  ///
  /// If you do not specify a client token, one is automatically generated by
  /// the Amazon Web Services SDK.
  ///
  /// Parameter [tags] :
  /// The tags to add to the network settings resource. A tag is a key-value
  /// pair.
  Future<CreateNetworkSettingsResponse> createNetworkSettings({
    required List<String> securityGroupIds,
    required List<String> subnetIds,
    required String vpcId,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'securityGroupIds': securityGroupIds,
      'subnetIds': subnetIds,
      'vpcId': vpcId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/networkSettings',
      exceptionFnMap: _exceptionFns,
    );
    return CreateNetworkSettingsResponse.fromJson(response);
  }

  /// Creates a web portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [additionalEncryptionContext] :
  /// The additional encryption context of the portal.
  ///
  /// Parameter [authenticationType] :
  /// The type of authentication integration points used when signing into the
  /// web portal. Defaults to <code>Standard</code>.
  ///
  /// <code>Standard</code> web portals are authenticated directly through your
  /// identity provider. You need to call <code>CreateIdentityProvider</code> to
  /// integrate your identity provider with your web portal. User and group
  /// access to your web portal is controlled through your identity provider.
  ///
  /// <code>IAM Identity Center</code> web portals are authenticated through IAM
  /// Identity Center (successor to Single Sign-On). Identity sources (including
  /// external identity provider integration), plus user and group access to
  /// your web portal, can be configured in the IAM Identity Center.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, subsequent retries with the same client token
  /// returns the result from the original successful request.
  ///
  /// If you do not specify a client token, one is automatically generated by
  /// the Amazon Web Services SDK.
  ///
  /// Parameter [customerManagedKey] :
  /// The customer managed key of the web portal.
  ///
  /// Parameter [displayName] :
  /// The name of the web portal. This is not visible to users who log into the
  /// web portal.
  ///
  /// Parameter [instanceType] :
  /// The type and resources of the underlying instance.
  ///
  /// Parameter [maxConcurrentSessions] :
  /// The maximum number of concurrent sessions for the portal.
  ///
  /// Parameter [tags] :
  /// The tags to add to the web portal. A tag is a key-value pair.
  Future<CreatePortalResponse> createPortal({
    Map<String, String>? additionalEncryptionContext,
    AuthenticationType? authenticationType,
    String? clientToken,
    String? customerManagedKey,
    String? displayName,
    InstanceType? instanceType,
    int? maxConcurrentSessions,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'maxConcurrentSessions',
      maxConcurrentSessions,
      1,
      5000,
    );
    final $payload = <String, dynamic>{
      if (additionalEncryptionContext != null)
        'additionalEncryptionContext': additionalEncryptionContext,
      if (authenticationType != null)
        'authenticationType': authenticationType.toValue(),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (customerManagedKey != null) 'customerManagedKey': customerManagedKey,
      if (displayName != null) 'displayName': displayName,
      if (instanceType != null) 'instanceType': instanceType.toValue(),
      if (maxConcurrentSessions != null)
        'maxConcurrentSessions': maxConcurrentSessions,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/portals',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePortalResponse.fromJson(response);
  }

  /// Creates a trust store that can be associated with a web portal. A trust
  /// store contains certificate authority (CA) certificates. Once associated
  /// with a web portal, the browser in a streaming session will recognize
  /// certificates that have been issued using any of the CAs in the trust
  /// store. If your organization has internal websites that use certificates
  /// issued by private CAs, you should add the private CA certificate to the
  /// trust store.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [certificateList] :
  /// A list of CA certificates to be added to the trust store.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, subsequent retries with the same client token
  /// returns the result from the original successful request.
  ///
  /// If you do not specify a client token, one is automatically generated by
  /// the Amazon Web Services SDK.
  ///
  /// Parameter [tags] :
  /// The tags to add to the trust store. A tag is a key-value pair.
  Future<CreateTrustStoreResponse> createTrustStore({
    required List<Uint8List> certificateList,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'certificateList': certificateList.map(base64Encode).toList(),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/trustStores',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTrustStoreResponse.fromJson(response);
  }

  /// Creates a user access logging settings resource that can be associated
  /// with a web portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [kinesisStreamArn] :
  /// The ARN of the Kinesis stream.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, subsequent retries with the same client token
  /// returns the result from the original successful request.
  ///
  /// If you do not specify a client token, one is automatically generated by
  /// the Amazon Web Services SDK.
  ///
  /// Parameter [tags] :
  /// The tags to add to the user settings resource. A tag is a key-value pair.
  Future<CreateUserAccessLoggingSettingsResponse>
      createUserAccessLoggingSettings({
    required String kinesisStreamArn,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'kinesisStreamArn': kinesisStreamArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/userAccessLoggingSettings',
      exceptionFnMap: _exceptionFns,
    );
    return CreateUserAccessLoggingSettingsResponse.fromJson(response);
  }

  /// Creates a user settings resource that can be associated with a web portal.
  /// Once associated with a web portal, user settings control how users can
  /// transfer data between a streaming session and the their local devices.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [copyAllowed] :
  /// Specifies whether the user can copy text from the streaming session to the
  /// local device.
  ///
  /// Parameter [downloadAllowed] :
  /// Specifies whether the user can download files from the streaming session
  /// to the local device.
  ///
  /// Parameter [pasteAllowed] :
  /// Specifies whether the user can paste text from the local device to the
  /// streaming session.
  ///
  /// Parameter [printAllowed] :
  /// Specifies whether the user can print to the local device.
  ///
  /// Parameter [uploadAllowed] :
  /// Specifies whether the user can upload files from the local device to the
  /// streaming session.
  ///
  /// Parameter [additionalEncryptionContext] :
  /// The additional encryption context of the user settings.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, subsequent retries with the same client token
  /// returns the result from the original successful request.
  ///
  /// If you do not specify a client token, one is automatically generated by
  /// the Amazon Web Services SDK.
  ///
  /// Parameter [cookieSynchronizationConfiguration] :
  /// The configuration that specifies which cookies should be synchronized from
  /// the end user's local browser to the remote browser.
  ///
  /// Parameter [customerManagedKey] :
  /// The customer managed key used to encrypt sensitive information in the user
  /// settings.
  ///
  /// Parameter [disconnectTimeoutInMinutes] :
  /// The amount of time that a streaming session remains active after users
  /// disconnect.
  ///
  /// Parameter [idleDisconnectTimeoutInMinutes] :
  /// The amount of time that users can be idle (inactive) before they are
  /// disconnected from their streaming session and the disconnect timeout
  /// interval begins.
  ///
  /// Parameter [tags] :
  /// The tags to add to the user settings resource. A tag is a key-value pair.
  Future<CreateUserSettingsResponse> createUserSettings({
    required EnabledType copyAllowed,
    required EnabledType downloadAllowed,
    required EnabledType pasteAllowed,
    required EnabledType printAllowed,
    required EnabledType uploadAllowed,
    Map<String, String>? additionalEncryptionContext,
    String? clientToken,
    CookieSynchronizationConfiguration? cookieSynchronizationConfiguration,
    String? customerManagedKey,
    int? disconnectTimeoutInMinutes,
    int? idleDisconnectTimeoutInMinutes,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'disconnectTimeoutInMinutes',
      disconnectTimeoutInMinutes,
      1,
      600,
    );
    _s.validateNumRange(
      'idleDisconnectTimeoutInMinutes',
      idleDisconnectTimeoutInMinutes,
      0,
      60,
    );
    final $payload = <String, dynamic>{
      'copyAllowed': copyAllowed.toValue(),
      'downloadAllowed': downloadAllowed.toValue(),
      'pasteAllowed': pasteAllowed.toValue(),
      'printAllowed': printAllowed.toValue(),
      'uploadAllowed': uploadAllowed.toValue(),
      if (additionalEncryptionContext != null)
        'additionalEncryptionContext': additionalEncryptionContext,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (cookieSynchronizationConfiguration != null)
        'cookieSynchronizationConfiguration':
            cookieSynchronizationConfiguration,
      if (customerManagedKey != null) 'customerManagedKey': customerManagedKey,
      if (disconnectTimeoutInMinutes != null)
        'disconnectTimeoutInMinutes': disconnectTimeoutInMinutes,
      if (idleDisconnectTimeoutInMinutes != null)
        'idleDisconnectTimeoutInMinutes': idleDisconnectTimeoutInMinutes,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/userSettings',
      exceptionFnMap: _exceptionFns,
    );
    return CreateUserSettingsResponse.fromJson(response);
  }

  /// Deletes browser settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [browserSettingsArn] :
  /// The ARN of the browser settings.
  Future<void> deleteBrowserSettings({
    required String browserSettingsArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/browserSettings/${browserSettingsArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the identity provider.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [identityProviderArn] :
  /// The ARN of the identity provider.
  Future<void> deleteIdentityProvider({
    required String identityProviderArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/identityProviders/${identityProviderArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes IP access settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [ipAccessSettingsArn] :
  /// The ARN of the IP access settings.
  Future<void> deleteIpAccessSettings({
    required String ipAccessSettingsArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/ipAccessSettings/${ipAccessSettingsArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes network settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [networkSettingsArn] :
  /// The ARN of the network settings.
  Future<void> deleteNetworkSettings({
    required String networkSettingsArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/networkSettings/${networkSettingsArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a web portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  Future<void> deletePortal({
    required String portalArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the trust store.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [trustStoreArn] :
  /// The ARN of the trust store.
  Future<void> deleteTrustStore({
    required String trustStoreArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/trustStores/${trustStoreArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes user access logging settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [userAccessLoggingSettingsArn] :
  /// The ARN of the user access logging settings.
  Future<void> deleteUserAccessLoggingSettings({
    required String userAccessLoggingSettingsArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/userAccessLoggingSettings/${userAccessLoggingSettingsArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes user settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [userSettingsArn] :
  /// The ARN of the user settings.
  Future<void> deleteUserSettings({
    required String userSettingsArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/userSettings/${userSettingsArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates browser settings from a web portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  Future<void> disassociateBrowserSettings({
    required String portalArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}/browserSettings',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates IP access settings from a web portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  Future<void> disassociateIpAccessSettings({
    required String portalArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}/ipAccessSettings',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates network settings from a web portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  Future<void> disassociateNetworkSettings({
    required String portalArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}/networkSettings',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a trust store from a web portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  Future<void> disassociateTrustStore({
    required String portalArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}/trustStores',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates user access logging settings from a web portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  Future<void> disassociateUserAccessLoggingSettings({
    required String portalArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}/userAccessLoggingSettings',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates user settings from a web portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  Future<void> disassociateUserSettings({
    required String portalArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}/userSettings',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets browser settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [browserSettingsArn] :
  /// The ARN of the browser settings.
  Future<GetBrowserSettingsResponse> getBrowserSettings({
    required String browserSettingsArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/browserSettings/${browserSettingsArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBrowserSettingsResponse.fromJson(response);
  }

  /// Gets the identity provider.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identityProviderArn] :
  /// The ARN of the identity provider.
  Future<GetIdentityProviderResponse> getIdentityProvider({
    required String identityProviderArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/identityProviders/${identityProviderArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return GetIdentityProviderResponse.fromJson(response);
  }

  /// Gets the IP access settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ipAccessSettingsArn] :
  /// The ARN of the IP access settings.
  Future<GetIpAccessSettingsResponse> getIpAccessSettings({
    required String ipAccessSettingsArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/ipAccessSettings/${ipAccessSettingsArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return GetIpAccessSettingsResponse.fromJson(response);
  }

  /// Gets the network settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [networkSettingsArn] :
  /// The ARN of the network settings.
  Future<GetNetworkSettingsResponse> getNetworkSettings({
    required String networkSettingsArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/networkSettings/${networkSettingsArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return GetNetworkSettingsResponse.fromJson(response);
  }

  /// Gets the web portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  Future<GetPortalResponse> getPortal({
    required String portalArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPortalResponse.fromJson(response);
  }

  /// Gets the service provider metadata.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  Future<GetPortalServiceProviderMetadataResponse>
      getPortalServiceProviderMetadata({
    required String portalArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/portalIdp/${portalArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPortalServiceProviderMetadataResponse.fromJson(response);
  }

  /// Gets the trust store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [trustStoreArn] :
  /// The ARN of the trust store.
  Future<GetTrustStoreResponse> getTrustStore({
    required String trustStoreArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/trustStores/${trustStoreArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTrustStoreResponse.fromJson(response);
  }

  /// Gets the trust store certificate.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [thumbprint] :
  /// The thumbprint of the trust store certificate.
  ///
  /// Parameter [trustStoreArn] :
  /// The ARN of the trust store certificate.
  Future<GetTrustStoreCertificateResponse> getTrustStoreCertificate({
    required String thumbprint,
    required String trustStoreArn,
  }) async {
    final $query = <String, List<String>>{
      'thumbprint': [thumbprint],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/trustStores/${trustStoreArn.split('/').map(Uri.encodeComponent).join('/')}/certificate',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTrustStoreCertificateResponse.fromJson(response);
  }

  /// Gets user access logging settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [userAccessLoggingSettingsArn] :
  /// The ARN of the user access logging settings.
  Future<GetUserAccessLoggingSettingsResponse> getUserAccessLoggingSettings({
    required String userAccessLoggingSettingsArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/userAccessLoggingSettings/${userAccessLoggingSettingsArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return GetUserAccessLoggingSettingsResponse.fromJson(response);
  }

  /// Gets user settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [userSettingsArn] :
  /// The ARN of the user settings.
  Future<GetUserSettingsResponse> getUserSettings({
    required String userSettingsArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/userSettings/${userSettingsArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return GetUserSettingsResponse.fromJson(response);
  }

  /// Retrieves a list of browser settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be included in the next page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<ListBrowserSettingsResponse> listBrowserSettings({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/browserSettings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBrowserSettingsResponse.fromJson(response);
  }

  /// Retrieves a list of identity providers for a specific web portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be included in the next page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<ListIdentityProvidersResponse> listIdentityProviders({
    required String portalArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}/identityProviders',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIdentityProvidersResponse.fromJson(response);
  }

  /// Retrieves a list of IP access settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be included in the next page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<ListIpAccessSettingsResponse> listIpAccessSettings({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ipAccessSettings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIpAccessSettingsResponse.fromJson(response);
  }

  /// Retrieves a list of network settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be included in the next page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<ListNetworkSettingsResponse> listNetworkSettings({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/networkSettings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworkSettingsResponse.fromJson(response);
  }

  /// Retrieves a list or web portals.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be included in the next page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<ListPortalsResponse> listPortals({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/portals',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPortalsResponse.fromJson(response);
  }

  /// Retrieves a list of tags for a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/tags/${resourceArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Retrieves a list of trust store certificates.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [trustStoreArn] :
  /// The ARN of the trust store
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be included in the next page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<ListTrustStoreCertificatesResponse> listTrustStoreCertificates({
    required String trustStoreArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/trustStores/${trustStoreArn.split('/').map(Uri.encodeComponent).join('/')}/certificates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTrustStoreCertificatesResponse.fromJson(response);
  }

  /// Retrieves a list of trust stores.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be included in the next page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<ListTrustStoresResponse> listTrustStores({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/trustStores',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTrustStoresResponse.fromJson(response);
  }

  /// Retrieves a list of user access logging settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be included in the next page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<ListUserAccessLoggingSettingsResponse> listUserAccessLoggingSettings({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/userAccessLoggingSettings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListUserAccessLoggingSettingsResponse.fromJson(response);
  }

  /// Retrieves a list of user settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be included in the next page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<ListUserSettingsResponse> listUserSettings({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/userSettings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListUserSettingsResponse.fromJson(response);
  }

  /// Adds or overwrites one or more tags for the specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tags] :
  /// The tags of the resource.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, subsequent retries with the same client token
  /// returns the result from the original successful request.
  ///
  /// If you do not specify a client token, one is automatically generated by
  /// the Amazon Web Services SDK.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/tags/${resourceArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from the specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/tags/${resourceArn.split('/').map(Uri.encodeComponent).join('/')}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates browser settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [browserSettingsArn] :
  /// The ARN of the browser settings.
  ///
  /// Parameter [browserPolicy] :
  /// A JSON string containing Chrome Enterprise policies that will be applied
  /// to all streaming sessions.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, subsequent retries with the same client token
  /// return the result from the original successful request.
  ///
  /// If you do not specify a client token, one is automatically generated by
  /// the Amazon Web Services SDK.
  Future<UpdateBrowserSettingsResponse> updateBrowserSettings({
    required String browserSettingsArn,
    String? browserPolicy,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      if (browserPolicy != null) 'browserPolicy': browserPolicy,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/browserSettings/${browserSettingsArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBrowserSettingsResponse.fromJson(response);
  }

  /// Updates the identity provider.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identityProviderArn] :
  /// The ARN of the identity provider.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, subsequent retries with the same client token
  /// return the result from the original successful request.
  ///
  /// If you do not specify a client token, one is automatically generated by
  /// the Amazon Web Services SDK.
  ///
  /// Parameter [identityProviderDetails] :
  /// The details of the identity provider. The following list describes the
  /// provider detail keys for each identity provider type.
  ///
  /// <ul>
  /// <li>
  /// For Google and Login with Amazon:
  ///
  /// <ul>
  /// <li>
  /// <code>client_id</code>
  /// </li>
  /// <li>
  /// <code>client_secret</code>
  /// </li>
  /// <li>
  /// <code>authorize_scopes</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For Facebook:
  ///
  /// <ul>
  /// <li>
  /// <code>client_id</code>
  /// </li>
  /// <li>
  /// <code>client_secret</code>
  /// </li>
  /// <li>
  /// <code>authorize_scopes</code>
  /// </li>
  /// <li>
  /// <code>api_version</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For Sign in with Apple:
  ///
  /// <ul>
  /// <li>
  /// <code>client_id</code>
  /// </li>
  /// <li>
  /// <code>team_id</code>
  /// </li>
  /// <li>
  /// <code>key_id</code>
  /// </li>
  /// <li>
  /// <code>private_key</code>
  /// </li>
  /// <li>
  /// <code>authorize_scopes</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For OIDC providers:
  ///
  /// <ul>
  /// <li>
  /// <code>client_id</code>
  /// </li>
  /// <li>
  /// <code>client_secret</code>
  /// </li>
  /// <li>
  /// <code>attributes_request_method</code>
  /// </li>
  /// <li>
  /// <code>oidc_issuer</code>
  /// </li>
  /// <li>
  /// <code>authorize_scopes</code>
  /// </li>
  /// <li>
  /// <code>authorize_url</code> <i>if not available from discovery URL
  /// specified by <code>oidc_issuer</code> key</i>
  /// </li>
  /// <li>
  /// <code>token_url</code> <i>if not available from discovery URL specified by
  /// <code>oidc_issuer</code> key</i>
  /// </li>
  /// <li>
  /// <code>attributes_url</code> <i>if not available from discovery URL
  /// specified by <code>oidc_issuer</code> key</i>
  /// </li>
  /// <li>
  /// <code>jwks_uri</code> <i>if not available from discovery URL specified by
  /// <code>oidc_issuer</code> key</i>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For SAML providers:
  ///
  /// <ul>
  /// <li>
  /// <code>MetadataFile</code> OR <code>MetadataURL</code>
  /// </li>
  /// <li>
  /// <code>IDPSignout</code> (boolean) <i>optional</i>
  /// </li>
  /// <li>
  /// <code>IDPInit</code> (boolean) <i>optional</i>
  /// </li>
  /// <li>
  /// <code>RequestSigningAlgorithm</code> (string) <i>optional</i> - Only
  /// accepts <code>rsa-sha256</code>
  /// </li>
  /// <li>
  /// <code>EncryptedResponses</code> (boolean) <i>optional</i>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [identityProviderName] :
  /// The name of the identity provider.
  ///
  /// Parameter [identityProviderType] :
  /// The type of the identity provider.
  Future<UpdateIdentityProviderResponse> updateIdentityProvider({
    required String identityProviderArn,
    String? clientToken,
    Map<String, String>? identityProviderDetails,
    String? identityProviderName,
    IdentityProviderType? identityProviderType,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (identityProviderDetails != null)
        'identityProviderDetails': identityProviderDetails,
      if (identityProviderName != null)
        'identityProviderName': identityProviderName,
      if (identityProviderType != null)
        'identityProviderType': identityProviderType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/identityProviders/${identityProviderArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateIdentityProviderResponse.fromJson(response);
  }

  /// Updates IP access settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ipAccessSettingsArn] :
  /// The ARN of the IP access settings.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, subsequent retries with the same client token
  /// return the result from the original successful request.
  ///
  /// If you do not specify a client token, one is automatically generated by
  /// the Amazon Web Services SDK.
  ///
  /// Parameter [description] :
  /// The description of the IP access settings.
  ///
  /// Parameter [displayName] :
  /// The display name of the IP access settings.
  ///
  /// Parameter [ipRules] :
  /// The updated IP rules of the IP access settings.
  Future<UpdateIpAccessSettingsResponse> updateIpAccessSettings({
    required String ipAccessSettingsArn,
    String? clientToken,
    String? description,
    String? displayName,
    List<IpRule>? ipRules,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (ipRules != null) 'ipRules': ipRules,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/ipAccessSettings/${ipAccessSettingsArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateIpAccessSettingsResponse.fromJson(response);
  }

  /// Updates network settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [networkSettingsArn] :
  /// The ARN of the network settings.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, subsequent retries with the same client token
  /// return the result from the original successful request.
  ///
  /// If you do not specify a client token, one is automatically generated by
  /// the Amazon Web Services SDK.
  ///
  /// Parameter [securityGroupIds] :
  /// One or more security groups used to control access from streaming
  /// instances to your VPC.
  ///
  /// Parameter [subnetIds] :
  /// The subnets in which network interfaces are created to connect streaming
  /// instances to your VPC. At least two of these subnets must be in different
  /// availability zones.
  ///
  /// Parameter [vpcId] :
  /// The VPC that streaming instances will connect to.
  Future<UpdateNetworkSettingsResponse> updateNetworkSettings({
    required String networkSettingsArn,
    String? clientToken,
    List<String>? securityGroupIds,
    List<String>? subnetIds,
    String? vpcId,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (vpcId != null) 'vpcId': vpcId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/networkSettings/${networkSettingsArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateNetworkSettingsResponse.fromJson(response);
  }

  /// Updates a web portal.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  ///
  /// Parameter [authenticationType] :
  /// The type of authentication integration points used when signing into the
  /// web portal. Defaults to <code>Standard</code>.
  ///
  /// <code>Standard</code> web portals are authenticated directly through your
  /// identity provider. You need to call <code>CreateIdentityProvider</code> to
  /// integrate your identity provider with your web portal. User and group
  /// access to your web portal is controlled through your identity provider.
  ///
  /// <code>IAM Identity Center</code> web portals are authenticated through IAM
  /// Identity Center (successor to Single Sign-On). Identity sources (including
  /// external identity provider integration), plus user and group access to
  /// your web portal, can be configured in the IAM Identity Center.
  ///
  /// Parameter [displayName] :
  /// The name of the web portal. This is not visible to users who log into the
  /// web portal.
  ///
  /// Parameter [instanceType] :
  /// The type and resources of the underlying instance.
  ///
  /// Parameter [maxConcurrentSessions] :
  /// The maximum number of concurrent sessions for the portal.
  Future<UpdatePortalResponse> updatePortal({
    required String portalArn,
    AuthenticationType? authenticationType,
    String? displayName,
    InstanceType? instanceType,
    int? maxConcurrentSessions,
  }) async {
    _s.validateNumRange(
      'maxConcurrentSessions',
      maxConcurrentSessions,
      1,
      5000,
    );
    final $payload = <String, dynamic>{
      if (authenticationType != null)
        'authenticationType': authenticationType.toValue(),
      if (displayName != null) 'displayName': displayName,
      if (instanceType != null) 'instanceType': instanceType.toValue(),
      if (maxConcurrentSessions != null)
        'maxConcurrentSessions': maxConcurrentSessions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePortalResponse.fromJson(response);
  }

  /// Updates the trust store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [trustStoreArn] :
  /// The ARN of the trust store.
  ///
  /// Parameter [certificatesToAdd] :
  /// A list of CA certificates to add to the trust store.
  ///
  /// Parameter [certificatesToDelete] :
  /// A list of CA certificates to delete from a trust store.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, subsequent retries with the same client token
  /// return the result from the original successful request.
  ///
  /// If you do not specify a client token, one is automatically generated by
  /// the Amazon Web Services SDK.
  Future<UpdateTrustStoreResponse> updateTrustStore({
    required String trustStoreArn,
    List<Uint8List>? certificatesToAdd,
    List<String>? certificatesToDelete,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      if (certificatesToAdd != null)
        'certificatesToAdd': certificatesToAdd.map(base64Encode).toList(),
      if (certificatesToDelete != null)
        'certificatesToDelete': certificatesToDelete,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/trustStores/${trustStoreArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTrustStoreResponse.fromJson(response);
  }

  /// Updates the user access logging settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [userAccessLoggingSettingsArn] :
  /// The ARN of the user access logging settings.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, subsequent retries with the same client token
  /// return the result from the original successful request.
  ///
  /// If you do not specify a client token, one is automatically generated by
  /// the Amazon Web Services SDK.
  ///
  /// Parameter [kinesisStreamArn] :
  /// The ARN of the Kinesis stream.
  Future<UpdateUserAccessLoggingSettingsResponse>
      updateUserAccessLoggingSettings({
    required String userAccessLoggingSettingsArn,
    String? clientToken,
    String? kinesisStreamArn,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (kinesisStreamArn != null) 'kinesisStreamArn': kinesisStreamArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/userAccessLoggingSettings/${userAccessLoggingSettingsArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateUserAccessLoggingSettingsResponse.fromJson(response);
  }

  /// Updates the user settings.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [userSettingsArn] :
  /// The ARN of the user settings.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, subsequent retries with the same client token
  /// return the result from the original successful request.
  ///
  /// If you do not specify a client token, one is automatically generated by
  /// the Amazon Web Services SDK.
  ///
  /// Parameter [cookieSynchronizationConfiguration] :
  /// The configuration that specifies which cookies should be synchronized from
  /// the end user's local browser to the remote browser.
  ///
  /// If the allowlist and blocklist are empty, the configuration becomes null.
  ///
  /// Parameter [copyAllowed] :
  /// Specifies whether the user can copy text from the streaming session to the
  /// local device.
  ///
  /// Parameter [disconnectTimeoutInMinutes] :
  /// The amount of time that a streaming session remains active after users
  /// disconnect.
  ///
  /// Parameter [downloadAllowed] :
  /// Specifies whether the user can download files from the streaming session
  /// to the local device.
  ///
  /// Parameter [idleDisconnectTimeoutInMinutes] :
  /// The amount of time that users can be idle (inactive) before they are
  /// disconnected from their streaming session and the disconnect timeout
  /// interval begins.
  ///
  /// Parameter [pasteAllowed] :
  /// Specifies whether the user can paste text from the local device to the
  /// streaming session.
  ///
  /// Parameter [printAllowed] :
  /// Specifies whether the user can print to the local device.
  ///
  /// Parameter [uploadAllowed] :
  /// Specifies whether the user can upload files from the local device to the
  /// streaming session.
  Future<UpdateUserSettingsResponse> updateUserSettings({
    required String userSettingsArn,
    String? clientToken,
    CookieSynchronizationConfiguration? cookieSynchronizationConfiguration,
    EnabledType? copyAllowed,
    int? disconnectTimeoutInMinutes,
    EnabledType? downloadAllowed,
    int? idleDisconnectTimeoutInMinutes,
    EnabledType? pasteAllowed,
    EnabledType? printAllowed,
    EnabledType? uploadAllowed,
  }) async {
    _s.validateNumRange(
      'disconnectTimeoutInMinutes',
      disconnectTimeoutInMinutes,
      1,
      600,
    );
    _s.validateNumRange(
      'idleDisconnectTimeoutInMinutes',
      idleDisconnectTimeoutInMinutes,
      0,
      60,
    );
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (cookieSynchronizationConfiguration != null)
        'cookieSynchronizationConfiguration':
            cookieSynchronizationConfiguration,
      if (copyAllowed != null) 'copyAllowed': copyAllowed.toValue(),
      if (disconnectTimeoutInMinutes != null)
        'disconnectTimeoutInMinutes': disconnectTimeoutInMinutes,
      if (downloadAllowed != null) 'downloadAllowed': downloadAllowed.toValue(),
      if (idleDisconnectTimeoutInMinutes != null)
        'idleDisconnectTimeoutInMinutes': idleDisconnectTimeoutInMinutes,
      if (pasteAllowed != null) 'pasteAllowed': pasteAllowed.toValue(),
      if (printAllowed != null) 'printAllowed': printAllowed.toValue(),
      if (uploadAllowed != null) 'uploadAllowed': uploadAllowed.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/userSettings/${userSettingsArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateUserSettingsResponse.fromJson(response);
  }
}

class AssociateBrowserSettingsResponse {
  /// The ARN of the browser settings.
  final String browserSettingsArn;

  /// The ARN of the web portal.
  final String portalArn;

  AssociateBrowserSettingsResponse({
    required this.browserSettingsArn,
    required this.portalArn,
  });

  factory AssociateBrowserSettingsResponse.fromJson(Map<String, dynamic> json) {
    return AssociateBrowserSettingsResponse(
      browserSettingsArn: json['browserSettingsArn'] as String,
      portalArn: json['portalArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final browserSettingsArn = this.browserSettingsArn;
    final portalArn = this.portalArn;
    return {
      'browserSettingsArn': browserSettingsArn,
      'portalArn': portalArn,
    };
  }
}

class AssociateIpAccessSettingsResponse {
  /// The ARN of the IP access settings resource.
  final String ipAccessSettingsArn;

  /// The ARN of the web portal.
  final String portalArn;

  AssociateIpAccessSettingsResponse({
    required this.ipAccessSettingsArn,
    required this.portalArn,
  });

  factory AssociateIpAccessSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateIpAccessSettingsResponse(
      ipAccessSettingsArn: json['ipAccessSettingsArn'] as String,
      portalArn: json['portalArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final ipAccessSettingsArn = this.ipAccessSettingsArn;
    final portalArn = this.portalArn;
    return {
      'ipAccessSettingsArn': ipAccessSettingsArn,
      'portalArn': portalArn,
    };
  }
}

class AssociateNetworkSettingsResponse {
  /// The ARN of the network settings.
  final String networkSettingsArn;

  /// The ARN of the web portal.
  final String portalArn;

  AssociateNetworkSettingsResponse({
    required this.networkSettingsArn,
    required this.portalArn,
  });

  factory AssociateNetworkSettingsResponse.fromJson(Map<String, dynamic> json) {
    return AssociateNetworkSettingsResponse(
      networkSettingsArn: json['networkSettingsArn'] as String,
      portalArn: json['portalArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final networkSettingsArn = this.networkSettingsArn;
    final portalArn = this.portalArn;
    return {
      'networkSettingsArn': networkSettingsArn,
      'portalArn': portalArn,
    };
  }
}

class AssociateTrustStoreResponse {
  /// The ARN of the web portal.
  final String portalArn;

  /// The ARN of the trust store.
  final String trustStoreArn;

  AssociateTrustStoreResponse({
    required this.portalArn,
    required this.trustStoreArn,
  });

  factory AssociateTrustStoreResponse.fromJson(Map<String, dynamic> json) {
    return AssociateTrustStoreResponse(
      portalArn: json['portalArn'] as String,
      trustStoreArn: json['trustStoreArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final portalArn = this.portalArn;
    final trustStoreArn = this.trustStoreArn;
    return {
      'portalArn': portalArn,
      'trustStoreArn': trustStoreArn,
    };
  }
}

class AssociateUserAccessLoggingSettingsResponse {
  /// The ARN of the web portal.
  final String portalArn;

  /// The ARN of the user access logging settings.
  final String userAccessLoggingSettingsArn;

  AssociateUserAccessLoggingSettingsResponse({
    required this.portalArn,
    required this.userAccessLoggingSettingsArn,
  });

  factory AssociateUserAccessLoggingSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateUserAccessLoggingSettingsResponse(
      portalArn: json['portalArn'] as String,
      userAccessLoggingSettingsArn:
          json['userAccessLoggingSettingsArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final portalArn = this.portalArn;
    final userAccessLoggingSettingsArn = this.userAccessLoggingSettingsArn;
    return {
      'portalArn': portalArn,
      'userAccessLoggingSettingsArn': userAccessLoggingSettingsArn,
    };
  }
}

class AssociateUserSettingsResponse {
  /// The ARN of the web portal.
  final String portalArn;

  /// The ARN of the user settings.
  final String userSettingsArn;

  AssociateUserSettingsResponse({
    required this.portalArn,
    required this.userSettingsArn,
  });

  factory AssociateUserSettingsResponse.fromJson(Map<String, dynamic> json) {
    return AssociateUserSettingsResponse(
      portalArn: json['portalArn'] as String,
      userSettingsArn: json['userSettingsArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final portalArn = this.portalArn;
    final userSettingsArn = this.userSettingsArn;
    return {
      'portalArn': portalArn,
      'userSettingsArn': userSettingsArn,
    };
  }
}

enum AuthenticationType {
  standard,
  iamIdentityCenter,
}

extension AuthenticationTypeValueExtension on AuthenticationType {
  String toValue() {
    switch (this) {
      case AuthenticationType.standard:
        return 'Standard';
      case AuthenticationType.iamIdentityCenter:
        return 'IAM_Identity_Center';
    }
  }
}

extension AuthenticationTypeFromString on String {
  AuthenticationType toAuthenticationType() {
    switch (this) {
      case 'Standard':
        return AuthenticationType.standard;
      case 'IAM_Identity_Center':
        return AuthenticationType.iamIdentityCenter;
    }
    throw Exception('$this is not known in enum AuthenticationType');
  }
}

/// The browser settings resource that can be associated with a web portal. Once
/// associated with a web portal, browser settings control how the browser will
/// behave once a user starts a streaming session for the web portal.
class BrowserSettings {
  /// The ARN of the browser settings.
  final String browserSettingsArn;

  /// The additional encryption context of the browser settings.
  final Map<String, String>? additionalEncryptionContext;

  /// A list of web portal ARNs that this browser settings is associated with.
  final List<String>? associatedPortalArns;

  /// A JSON string containing Chrome Enterprise policies that will be applied to
  /// all streaming sessions.
  final String? browserPolicy;

  /// The customer managed key used to encrypt sensitive information in the
  /// browser settings.
  final String? customerManagedKey;

  BrowserSettings({
    required this.browserSettingsArn,
    this.additionalEncryptionContext,
    this.associatedPortalArns,
    this.browserPolicy,
    this.customerManagedKey,
  });

  factory BrowserSettings.fromJson(Map<String, dynamic> json) {
    return BrowserSettings(
      browserSettingsArn: json['browserSettingsArn'] as String,
      additionalEncryptionContext:
          (json['additionalEncryptionContext'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      associatedPortalArns: (json['associatedPortalArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      browserPolicy: json['browserPolicy'] as String?,
      customerManagedKey: json['customerManagedKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final browserSettingsArn = this.browserSettingsArn;
    final additionalEncryptionContext = this.additionalEncryptionContext;
    final associatedPortalArns = this.associatedPortalArns;
    final browserPolicy = this.browserPolicy;
    final customerManagedKey = this.customerManagedKey;
    return {
      'browserSettingsArn': browserSettingsArn,
      if (additionalEncryptionContext != null)
        'additionalEncryptionContext': additionalEncryptionContext,
      if (associatedPortalArns != null)
        'associatedPortalArns': associatedPortalArns,
      if (browserPolicy != null) 'browserPolicy': browserPolicy,
      if (customerManagedKey != null) 'customerManagedKey': customerManagedKey,
    };
  }
}

/// The summary for browser settings.
class BrowserSettingsSummary {
  /// The ARN of the browser settings.
  final String browserSettingsArn;

  BrowserSettingsSummary({
    required this.browserSettingsArn,
  });

  factory BrowserSettingsSummary.fromJson(Map<String, dynamic> json) {
    return BrowserSettingsSummary(
      browserSettingsArn: json['browserSettingsArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final browserSettingsArn = this.browserSettingsArn;
    return {
      'browserSettingsArn': browserSettingsArn,
    };
  }
}

enum BrowserType {
  chrome,
}

extension BrowserTypeValueExtension on BrowserType {
  String toValue() {
    switch (this) {
      case BrowserType.chrome:
        return 'Chrome';
    }
  }
}

extension BrowserTypeFromString on String {
  BrowserType toBrowserType() {
    switch (this) {
      case 'Chrome':
        return BrowserType.chrome;
    }
    throw Exception('$this is not known in enum BrowserType');
  }
}

/// The certificate.
class Certificate {
  /// The body of the certificate.
  final Uint8List? body;

  /// The entity that issued the certificate.
  final String? issuer;

  /// The certificate is not valid after this date.
  final DateTime? notValidAfter;

  /// The certificate is not valid before this date.
  final DateTime? notValidBefore;

  /// The entity the certificate belongs to.
  final String? subject;

  /// A hexadecimal identifier for the certificate.
  final String? thumbprint;

  Certificate({
    this.body,
    this.issuer,
    this.notValidAfter,
    this.notValidBefore,
    this.subject,
    this.thumbprint,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      body: _s.decodeNullableUint8List(json['body'] as String?),
      issuer: json['issuer'] as String?,
      notValidAfter: timeStampFromJson(json['notValidAfter']),
      notValidBefore: timeStampFromJson(json['notValidBefore']),
      subject: json['subject'] as String?,
      thumbprint: json['thumbprint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final body = this.body;
    final issuer = this.issuer;
    final notValidAfter = this.notValidAfter;
    final notValidBefore = this.notValidBefore;
    final subject = this.subject;
    final thumbprint = this.thumbprint;
    return {
      if (body != null) 'body': base64Encode(body),
      if (issuer != null) 'issuer': issuer,
      if (notValidAfter != null)
        'notValidAfter': unixTimestampToJson(notValidAfter),
      if (notValidBefore != null)
        'notValidBefore': unixTimestampToJson(notValidBefore),
      if (subject != null) 'subject': subject,
      if (thumbprint != null) 'thumbprint': thumbprint,
    };
  }
}

/// The summary of the certificate.
class CertificateSummary {
  /// The entity that issued the certificate.
  final String? issuer;

  /// The certificate is not valid after this date.
  final DateTime? notValidAfter;

  /// The certificate is not valid before this date.
  final DateTime? notValidBefore;

  /// The entity the certificate belongs to.
  final String? subject;

  /// A hexadecimal identifier for the certificate.
  final String? thumbprint;

  CertificateSummary({
    this.issuer,
    this.notValidAfter,
    this.notValidBefore,
    this.subject,
    this.thumbprint,
  });

  factory CertificateSummary.fromJson(Map<String, dynamic> json) {
    return CertificateSummary(
      issuer: json['issuer'] as String?,
      notValidAfter: timeStampFromJson(json['notValidAfter']),
      notValidBefore: timeStampFromJson(json['notValidBefore']),
      subject: json['subject'] as String?,
      thumbprint: json['thumbprint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final issuer = this.issuer;
    final notValidAfter = this.notValidAfter;
    final notValidBefore = this.notValidBefore;
    final subject = this.subject;
    final thumbprint = this.thumbprint;
    return {
      if (issuer != null) 'issuer': issuer,
      if (notValidAfter != null)
        'notValidAfter': unixTimestampToJson(notValidAfter),
      if (notValidBefore != null)
        'notValidBefore': unixTimestampToJson(notValidBefore),
      if (subject != null) 'subject': subject,
      if (thumbprint != null) 'thumbprint': thumbprint,
    };
  }
}

/// Specifies a single cookie or set of cookies in an end user's browser.
class CookieSpecification {
  /// The domain of the cookie.
  final String domain;

  /// The name of the cookie.
  final String? name;

  /// The path of the cookie.
  final String? path;

  CookieSpecification({
    required this.domain,
    this.name,
    this.path,
  });

  factory CookieSpecification.fromJson(Map<String, dynamic> json) {
    return CookieSpecification(
      domain: json['domain'] as String,
      name: json['name'] as String?,
      path: json['path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    final name = this.name;
    final path = this.path;
    return {
      'domain': domain,
      if (name != null) 'name': name,
      if (path != null) 'path': path,
    };
  }
}

/// The configuration that specifies which cookies should be synchronized from
/// the end user's local browser to the remote browser.
class CookieSynchronizationConfiguration {
  /// The list of cookie specifications that are allowed to be synchronized to the
  /// remote browser.
  final List<CookieSpecification> allowlist;

  /// The list of cookie specifications that are blocked from being synchronized
  /// to the remote browser.
  final List<CookieSpecification>? blocklist;

  CookieSynchronizationConfiguration({
    required this.allowlist,
    this.blocklist,
  });

  factory CookieSynchronizationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return CookieSynchronizationConfiguration(
      allowlist: (json['allowlist'] as List)
          .whereNotNull()
          .map((e) => CookieSpecification.fromJson(e as Map<String, dynamic>))
          .toList(),
      blocklist: (json['blocklist'] as List?)
          ?.whereNotNull()
          .map((e) => CookieSpecification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowlist = this.allowlist;
    final blocklist = this.blocklist;
    return {
      'allowlist': allowlist,
      if (blocklist != null) 'blocklist': blocklist,
    };
  }
}

class CreateBrowserSettingsResponse {
  /// The ARN of the browser settings.
  final String browserSettingsArn;

  CreateBrowserSettingsResponse({
    required this.browserSettingsArn,
  });

  factory CreateBrowserSettingsResponse.fromJson(Map<String, dynamic> json) {
    return CreateBrowserSettingsResponse(
      browserSettingsArn: json['browserSettingsArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final browserSettingsArn = this.browserSettingsArn;
    return {
      'browserSettingsArn': browserSettingsArn,
    };
  }
}

class CreateIdentityProviderResponse {
  /// The ARN of the identity provider.
  final String identityProviderArn;

  CreateIdentityProviderResponse({
    required this.identityProviderArn,
  });

  factory CreateIdentityProviderResponse.fromJson(Map<String, dynamic> json) {
    return CreateIdentityProviderResponse(
      identityProviderArn: json['identityProviderArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final identityProviderArn = this.identityProviderArn;
    return {
      'identityProviderArn': identityProviderArn,
    };
  }
}

class CreateIpAccessSettingsResponse {
  /// The ARN of the IP access settings resource.
  final String ipAccessSettingsArn;

  CreateIpAccessSettingsResponse({
    required this.ipAccessSettingsArn,
  });

  factory CreateIpAccessSettingsResponse.fromJson(Map<String, dynamic> json) {
    return CreateIpAccessSettingsResponse(
      ipAccessSettingsArn: json['ipAccessSettingsArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final ipAccessSettingsArn = this.ipAccessSettingsArn;
    return {
      'ipAccessSettingsArn': ipAccessSettingsArn,
    };
  }
}

class CreateNetworkSettingsResponse {
  /// The ARN of the network settings.
  final String networkSettingsArn;

  CreateNetworkSettingsResponse({
    required this.networkSettingsArn,
  });

  factory CreateNetworkSettingsResponse.fromJson(Map<String, dynamic> json) {
    return CreateNetworkSettingsResponse(
      networkSettingsArn: json['networkSettingsArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final networkSettingsArn = this.networkSettingsArn;
    return {
      'networkSettingsArn': networkSettingsArn,
    };
  }
}

class CreatePortalResponse {
  /// The ARN of the web portal.
  final String portalArn;

  /// The endpoint URL of the web portal that users access in order to start
  /// streaming sessions.
  final String portalEndpoint;

  CreatePortalResponse({
    required this.portalArn,
    required this.portalEndpoint,
  });

  factory CreatePortalResponse.fromJson(Map<String, dynamic> json) {
    return CreatePortalResponse(
      portalArn: json['portalArn'] as String,
      portalEndpoint: json['portalEndpoint'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final portalArn = this.portalArn;
    final portalEndpoint = this.portalEndpoint;
    return {
      'portalArn': portalArn,
      'portalEndpoint': portalEndpoint,
    };
  }
}

class CreateTrustStoreResponse {
  /// The ARN of the trust store.
  final String trustStoreArn;

  CreateTrustStoreResponse({
    required this.trustStoreArn,
  });

  factory CreateTrustStoreResponse.fromJson(Map<String, dynamic> json) {
    return CreateTrustStoreResponse(
      trustStoreArn: json['trustStoreArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final trustStoreArn = this.trustStoreArn;
    return {
      'trustStoreArn': trustStoreArn,
    };
  }
}

class CreateUserAccessLoggingSettingsResponse {
  /// The ARN of the user access logging settings.
  final String userAccessLoggingSettingsArn;

  CreateUserAccessLoggingSettingsResponse({
    required this.userAccessLoggingSettingsArn,
  });

  factory CreateUserAccessLoggingSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateUserAccessLoggingSettingsResponse(
      userAccessLoggingSettingsArn:
          json['userAccessLoggingSettingsArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final userAccessLoggingSettingsArn = this.userAccessLoggingSettingsArn;
    return {
      'userAccessLoggingSettingsArn': userAccessLoggingSettingsArn,
    };
  }
}

class CreateUserSettingsResponse {
  /// The ARN of the user settings.
  final String userSettingsArn;

  CreateUserSettingsResponse({
    required this.userSettingsArn,
  });

  factory CreateUserSettingsResponse.fromJson(Map<String, dynamic> json) {
    return CreateUserSettingsResponse(
      userSettingsArn: json['userSettingsArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final userSettingsArn = this.userSettingsArn;
    return {
      'userSettingsArn': userSettingsArn,
    };
  }
}

class DeleteBrowserSettingsResponse {
  DeleteBrowserSettingsResponse();

  factory DeleteBrowserSettingsResponse.fromJson(Map<String, dynamic> _) {
    return DeleteBrowserSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteIdentityProviderResponse {
  DeleteIdentityProviderResponse();

  factory DeleteIdentityProviderResponse.fromJson(Map<String, dynamic> _) {
    return DeleteIdentityProviderResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteIpAccessSettingsResponse {
  DeleteIpAccessSettingsResponse();

  factory DeleteIpAccessSettingsResponse.fromJson(Map<String, dynamic> _) {
    return DeleteIpAccessSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteNetworkSettingsResponse {
  DeleteNetworkSettingsResponse();

  factory DeleteNetworkSettingsResponse.fromJson(Map<String, dynamic> _) {
    return DeleteNetworkSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePortalResponse {
  DeletePortalResponse();

  factory DeletePortalResponse.fromJson(Map<String, dynamic> _) {
    return DeletePortalResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTrustStoreResponse {
  DeleteTrustStoreResponse();

  factory DeleteTrustStoreResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTrustStoreResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteUserAccessLoggingSettingsResponse {
  DeleteUserAccessLoggingSettingsResponse();

  factory DeleteUserAccessLoggingSettingsResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteUserAccessLoggingSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteUserSettingsResponse {
  DeleteUserSettingsResponse();

  factory DeleteUserSettingsResponse.fromJson(Map<String, dynamic> _) {
    return DeleteUserSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateBrowserSettingsResponse {
  DisassociateBrowserSettingsResponse();

  factory DisassociateBrowserSettingsResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateBrowserSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateIpAccessSettingsResponse {
  DisassociateIpAccessSettingsResponse();

  factory DisassociateIpAccessSettingsResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateIpAccessSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateNetworkSettingsResponse {
  DisassociateNetworkSettingsResponse();

  factory DisassociateNetworkSettingsResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateNetworkSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateTrustStoreResponse {
  DisassociateTrustStoreResponse();

  factory DisassociateTrustStoreResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateTrustStoreResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateUserAccessLoggingSettingsResponse {
  DisassociateUserAccessLoggingSettingsResponse();

  factory DisassociateUserAccessLoggingSettingsResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateUserAccessLoggingSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateUserSettingsResponse {
  DisassociateUserSettingsResponse();

  factory DisassociateUserSettingsResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateUserSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum EnabledType {
  disabled,
  enabled,
}

extension EnabledTypeValueExtension on EnabledType {
  String toValue() {
    switch (this) {
      case EnabledType.disabled:
        return 'Disabled';
      case EnabledType.enabled:
        return 'Enabled';
    }
  }
}

extension EnabledTypeFromString on String {
  EnabledType toEnabledType() {
    switch (this) {
      case 'Disabled':
        return EnabledType.disabled;
      case 'Enabled':
        return EnabledType.enabled;
    }
    throw Exception('$this is not known in enum EnabledType');
  }
}

class GetBrowserSettingsResponse {
  /// The browser settings.
  final BrowserSettings? browserSettings;

  GetBrowserSettingsResponse({
    this.browserSettings,
  });

  factory GetBrowserSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetBrowserSettingsResponse(
      browserSettings: json['browserSettings'] != null
          ? BrowserSettings.fromJson(
              json['browserSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final browserSettings = this.browserSettings;
    return {
      if (browserSettings != null) 'browserSettings': browserSettings,
    };
  }
}

class GetIdentityProviderResponse {
  /// The identity provider.
  final IdentityProvider? identityProvider;

  GetIdentityProviderResponse({
    this.identityProvider,
  });

  factory GetIdentityProviderResponse.fromJson(Map<String, dynamic> json) {
    return GetIdentityProviderResponse(
      identityProvider: json['identityProvider'] != null
          ? IdentityProvider.fromJson(
              json['identityProvider'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final identityProvider = this.identityProvider;
    return {
      if (identityProvider != null) 'identityProvider': identityProvider,
    };
  }
}

class GetIpAccessSettingsResponse {
  /// The IP access settings.
  final IpAccessSettings? ipAccessSettings;

  GetIpAccessSettingsResponse({
    this.ipAccessSettings,
  });

  factory GetIpAccessSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetIpAccessSettingsResponse(
      ipAccessSettings: json['ipAccessSettings'] != null
          ? IpAccessSettings.fromJson(
              json['ipAccessSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ipAccessSettings = this.ipAccessSettings;
    return {
      if (ipAccessSettings != null) 'ipAccessSettings': ipAccessSettings,
    };
  }
}

class GetNetworkSettingsResponse {
  /// The network settings.
  final NetworkSettings? networkSettings;

  GetNetworkSettingsResponse({
    this.networkSettings,
  });

  factory GetNetworkSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetNetworkSettingsResponse(
      networkSettings: json['networkSettings'] != null
          ? NetworkSettings.fromJson(
              json['networkSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final networkSettings = this.networkSettings;
    return {
      if (networkSettings != null) 'networkSettings': networkSettings,
    };
  }
}

class GetPortalResponse {
  /// The web portal.
  final Portal? portal;

  GetPortalResponse({
    this.portal,
  });

  factory GetPortalResponse.fromJson(Map<String, dynamic> json) {
    return GetPortalResponse(
      portal: json['portal'] != null
          ? Portal.fromJson(json['portal'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final portal = this.portal;
    return {
      if (portal != null) 'portal': portal,
    };
  }
}

class GetPortalServiceProviderMetadataResponse {
  /// The ARN of the web portal.
  final String portalArn;

  /// The service provider SAML metadata.
  final String? serviceProviderSamlMetadata;

  GetPortalServiceProviderMetadataResponse({
    required this.portalArn,
    this.serviceProviderSamlMetadata,
  });

  factory GetPortalServiceProviderMetadataResponse.fromJson(
      Map<String, dynamic> json) {
    return GetPortalServiceProviderMetadataResponse(
      portalArn: json['portalArn'] as String,
      serviceProviderSamlMetadata:
          json['serviceProviderSamlMetadata'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final portalArn = this.portalArn;
    final serviceProviderSamlMetadata = this.serviceProviderSamlMetadata;
    return {
      'portalArn': portalArn,
      if (serviceProviderSamlMetadata != null)
        'serviceProviderSamlMetadata': serviceProviderSamlMetadata,
    };
  }
}

class GetTrustStoreCertificateResponse {
  /// The ARN of the trust store certificate.
  final String trustStoreArn;

  /// The certificate of the trust store certificate.
  final Certificate? certificate;

  GetTrustStoreCertificateResponse({
    required this.trustStoreArn,
    this.certificate,
  });

  factory GetTrustStoreCertificateResponse.fromJson(Map<String, dynamic> json) {
    return GetTrustStoreCertificateResponse(
      trustStoreArn: json['trustStoreArn'] as String,
      certificate: json['certificate'] != null
          ? Certificate.fromJson(json['certificate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final trustStoreArn = this.trustStoreArn;
    final certificate = this.certificate;
    return {
      'trustStoreArn': trustStoreArn,
      if (certificate != null) 'certificate': certificate,
    };
  }
}

class GetTrustStoreResponse {
  /// The trust store.
  final TrustStore? trustStore;

  GetTrustStoreResponse({
    this.trustStore,
  });

  factory GetTrustStoreResponse.fromJson(Map<String, dynamic> json) {
    return GetTrustStoreResponse(
      trustStore: json['trustStore'] != null
          ? TrustStore.fromJson(json['trustStore'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final trustStore = this.trustStore;
    return {
      if (trustStore != null) 'trustStore': trustStore,
    };
  }
}

class GetUserAccessLoggingSettingsResponse {
  /// The user access logging settings.
  final UserAccessLoggingSettings? userAccessLoggingSettings;

  GetUserAccessLoggingSettingsResponse({
    this.userAccessLoggingSettings,
  });

  factory GetUserAccessLoggingSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetUserAccessLoggingSettingsResponse(
      userAccessLoggingSettings: json['userAccessLoggingSettings'] != null
          ? UserAccessLoggingSettings.fromJson(
              json['userAccessLoggingSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final userAccessLoggingSettings = this.userAccessLoggingSettings;
    return {
      if (userAccessLoggingSettings != null)
        'userAccessLoggingSettings': userAccessLoggingSettings,
    };
  }
}

class GetUserSettingsResponse {
  /// The user settings.
  final UserSettings? userSettings;

  GetUserSettingsResponse({
    this.userSettings,
  });

  factory GetUserSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetUserSettingsResponse(
      userSettings: json['userSettings'] != null
          ? UserSettings.fromJson(json['userSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final userSettings = this.userSettings;
    return {
      if (userSettings != null) 'userSettings': userSettings,
    };
  }
}

/// The identity provider.
class IdentityProvider {
  /// The ARN of the identity provider.
  final String identityProviderArn;

  /// The identity provider details. The following list describes the provider
  /// detail keys for each identity provider type.
  ///
  /// <ul>
  /// <li>
  /// For Google and Login with Amazon:
  ///
  /// <ul>
  /// <li>
  /// <code>client_id</code>
  /// </li>
  /// <li>
  /// <code>client_secret</code>
  /// </li>
  /// <li>
  /// <code>authorize_scopes</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For Facebook:
  ///
  /// <ul>
  /// <li>
  /// <code>client_id</code>
  /// </li>
  /// <li>
  /// <code>client_secret</code>
  /// </li>
  /// <li>
  /// <code>authorize_scopes</code>
  /// </li>
  /// <li>
  /// <code>api_version</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For Sign in with Apple:
  ///
  /// <ul>
  /// <li>
  /// <code>client_id</code>
  /// </li>
  /// <li>
  /// <code>team_id</code>
  /// </li>
  /// <li>
  /// <code>key_id</code>
  /// </li>
  /// <li>
  /// <code>private_key</code>
  /// </li>
  /// <li>
  /// <code>authorize_scopes</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For OIDC providers:
  ///
  /// <ul>
  /// <li>
  /// <code>client_id</code>
  /// </li>
  /// <li>
  /// <code>client_secret</code>
  /// </li>
  /// <li>
  /// <code>attributes_request_method</code>
  /// </li>
  /// <li>
  /// <code>oidc_issuer</code>
  /// </li>
  /// <li>
  /// <code>authorize_scopes</code>
  /// </li>
  /// <li>
  /// <code>authorize_url</code> <i>if not available from discovery URL specified
  /// by oidc_issuer key</i>
  /// </li>
  /// <li>
  /// <code>token_url</code> <i>if not available from discovery URL specified by
  /// oidc_issuer key</i>
  /// </li>
  /// <li>
  /// <code>attributes_url</code> <i>if not available from discovery URL specified
  /// by oidc_issuer key</i>
  /// </li>
  /// <li>
  /// <code>jwks_uri</code> <i>if not available from discovery URL specified by
  /// oidc_issuer key</i>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For SAML providers:
  ///
  /// <ul>
  /// <li>
  /// <code>MetadataFile</code> OR <code>MetadataURL</code>
  /// </li>
  /// <li>
  /// <code>IDPSignout</code> (boolean) <i>optional</i>
  /// </li>
  /// <li>
  /// <code>IDPInit</code> (boolean) <i>optional</i>
  /// </li>
  /// <li>
  /// <code>RequestSigningAlgorithm</code> (string) <i>optional</i> - Only accepts
  /// <code>rsa-sha256</code>
  /// </li>
  /// <li>
  /// <code>EncryptedResponses</code> (boolean) <i>optional</i>
  /// </li>
  /// </ul> </li>
  /// </ul>
  final Map<String, String>? identityProviderDetails;

  /// The identity provider name.
  final String? identityProviderName;

  /// The identity provider type.
  final IdentityProviderType? identityProviderType;

  IdentityProvider({
    required this.identityProviderArn,
    this.identityProviderDetails,
    this.identityProviderName,
    this.identityProviderType,
  });

  factory IdentityProvider.fromJson(Map<String, dynamic> json) {
    return IdentityProvider(
      identityProviderArn: json['identityProviderArn'] as String,
      identityProviderDetails:
          (json['identityProviderDetails'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      identityProviderName: json['identityProviderName'] as String?,
      identityProviderType:
          (json['identityProviderType'] as String?)?.toIdentityProviderType(),
    );
  }

  Map<String, dynamic> toJson() {
    final identityProviderArn = this.identityProviderArn;
    final identityProviderDetails = this.identityProviderDetails;
    final identityProviderName = this.identityProviderName;
    final identityProviderType = this.identityProviderType;
    return {
      'identityProviderArn': identityProviderArn,
      if (identityProviderDetails != null)
        'identityProviderDetails': identityProviderDetails,
      if (identityProviderName != null)
        'identityProviderName': identityProviderName,
      if (identityProviderType != null)
        'identityProviderType': identityProviderType.toValue(),
    };
  }
}

/// The summary of the identity provider.
class IdentityProviderSummary {
  /// The ARN of the identity provider.
  final String identityProviderArn;

  /// The identity provider name.
  final String? identityProviderName;

  /// The identity provider type.
  final IdentityProviderType? identityProviderType;

  IdentityProviderSummary({
    required this.identityProviderArn,
    this.identityProviderName,
    this.identityProviderType,
  });

  factory IdentityProviderSummary.fromJson(Map<String, dynamic> json) {
    return IdentityProviderSummary(
      identityProviderArn: json['identityProviderArn'] as String,
      identityProviderName: json['identityProviderName'] as String?,
      identityProviderType:
          (json['identityProviderType'] as String?)?.toIdentityProviderType(),
    );
  }

  Map<String, dynamic> toJson() {
    final identityProviderArn = this.identityProviderArn;
    final identityProviderName = this.identityProviderName;
    final identityProviderType = this.identityProviderType;
    return {
      'identityProviderArn': identityProviderArn,
      if (identityProviderName != null)
        'identityProviderName': identityProviderName,
      if (identityProviderType != null)
        'identityProviderType': identityProviderType.toValue(),
    };
  }
}

enum IdentityProviderType {
  saml,
  facebook,
  google,
  loginWithAmazon,
  signInWithApple,
  oidc,
}

extension IdentityProviderTypeValueExtension on IdentityProviderType {
  String toValue() {
    switch (this) {
      case IdentityProviderType.saml:
        return 'SAML';
      case IdentityProviderType.facebook:
        return 'Facebook';
      case IdentityProviderType.google:
        return 'Google';
      case IdentityProviderType.loginWithAmazon:
        return 'LoginWithAmazon';
      case IdentityProviderType.signInWithApple:
        return 'SignInWithApple';
      case IdentityProviderType.oidc:
        return 'OIDC';
    }
  }
}

extension IdentityProviderTypeFromString on String {
  IdentityProviderType toIdentityProviderType() {
    switch (this) {
      case 'SAML':
        return IdentityProviderType.saml;
      case 'Facebook':
        return IdentityProviderType.facebook;
      case 'Google':
        return IdentityProviderType.google;
      case 'LoginWithAmazon':
        return IdentityProviderType.loginWithAmazon;
      case 'SignInWithApple':
        return IdentityProviderType.signInWithApple;
      case 'OIDC':
        return IdentityProviderType.oidc;
    }
    throw Exception('$this is not known in enum IdentityProviderType');
  }
}

enum InstanceType {
  standardRegular,
  standardLarge,
  standardXlarge,
}

extension InstanceTypeValueExtension on InstanceType {
  String toValue() {
    switch (this) {
      case InstanceType.standardRegular:
        return 'standard.regular';
      case InstanceType.standardLarge:
        return 'standard.large';
      case InstanceType.standardXlarge:
        return 'standard.xlarge';
    }
  }
}

extension InstanceTypeFromString on String {
  InstanceType toInstanceType() {
    switch (this) {
      case 'standard.regular':
        return InstanceType.standardRegular;
      case 'standard.large':
        return InstanceType.standardLarge;
      case 'standard.xlarge':
        return InstanceType.standardXlarge;
    }
    throw Exception('$this is not known in enum InstanceType');
  }
}

/// The IP access settings resource that can be associated with a web portal.
class IpAccessSettings {
  /// The ARN of the IP access settings resource.
  final String ipAccessSettingsArn;

  /// The additional encryption context of the IP access settings.
  final Map<String, String>? additionalEncryptionContext;

  /// A list of web portal ARNs that this IP access settings resource is
  /// associated with.
  final List<String>? associatedPortalArns;

  /// The creation date timestamp of the IP access settings.
  final DateTime? creationDate;

  /// The customer managed key used to encrypt sensitive information in the IP
  /// access settings.
  final String? customerManagedKey;

  /// The description of the IP access settings.
  final String? description;

  /// The display name of the IP access settings.
  final String? displayName;

  /// The IP rules of the IP access settings.
  final List<IpRule>? ipRules;

  IpAccessSettings({
    required this.ipAccessSettingsArn,
    this.additionalEncryptionContext,
    this.associatedPortalArns,
    this.creationDate,
    this.customerManagedKey,
    this.description,
    this.displayName,
    this.ipRules,
  });

  factory IpAccessSettings.fromJson(Map<String, dynamic> json) {
    return IpAccessSettings(
      ipAccessSettingsArn: json['ipAccessSettingsArn'] as String,
      additionalEncryptionContext:
          (json['additionalEncryptionContext'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      associatedPortalArns: (json['associatedPortalArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      creationDate: timeStampFromJson(json['creationDate']),
      customerManagedKey: json['customerManagedKey'] as String?,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      ipRules: (json['ipRules'] as List?)
          ?.whereNotNull()
          .map((e) => IpRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final ipAccessSettingsArn = this.ipAccessSettingsArn;
    final additionalEncryptionContext = this.additionalEncryptionContext;
    final associatedPortalArns = this.associatedPortalArns;
    final creationDate = this.creationDate;
    final customerManagedKey = this.customerManagedKey;
    final description = this.description;
    final displayName = this.displayName;
    final ipRules = this.ipRules;
    return {
      'ipAccessSettingsArn': ipAccessSettingsArn,
      if (additionalEncryptionContext != null)
        'additionalEncryptionContext': additionalEncryptionContext,
      if (associatedPortalArns != null)
        'associatedPortalArns': associatedPortalArns,
      if (creationDate != null)
        'creationDate': unixTimestampToJson(creationDate),
      if (customerManagedKey != null) 'customerManagedKey': customerManagedKey,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (ipRules != null) 'ipRules': ipRules,
    };
  }
}

/// The summary of IP access settings.
class IpAccessSettingsSummary {
  /// The ARN of IP access settings.
  final String ipAccessSettingsArn;

  /// The creation date timestamp of the IP access settings.
  final DateTime? creationDate;

  /// The description of the IP access settings.
  final String? description;

  /// The display name of the IP access settings.
  final String? displayName;

  IpAccessSettingsSummary({
    required this.ipAccessSettingsArn,
    this.creationDate,
    this.description,
    this.displayName,
  });

  factory IpAccessSettingsSummary.fromJson(Map<String, dynamic> json) {
    return IpAccessSettingsSummary(
      ipAccessSettingsArn: json['ipAccessSettingsArn'] as String,
      creationDate: timeStampFromJson(json['creationDate']),
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ipAccessSettingsArn = this.ipAccessSettingsArn;
    final creationDate = this.creationDate;
    final description = this.description;
    final displayName = this.displayName;
    return {
      'ipAccessSettingsArn': ipAccessSettingsArn,
      if (creationDate != null)
        'creationDate': unixTimestampToJson(creationDate),
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
    };
  }
}

/// The IP rules of the IP access settings.
class IpRule {
  /// The IP range of the IP rule.
  final String ipRange;

  /// The description of the IP rule.
  final String? description;

  IpRule({
    required this.ipRange,
    this.description,
  });

  factory IpRule.fromJson(Map<String, dynamic> json) {
    return IpRule(
      ipRange: json['ipRange'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ipRange = this.ipRange;
    final description = this.description;
    return {
      'ipRange': ipRange,
      if (description != null) 'description': description,
    };
  }
}

class ListBrowserSettingsResponse {
  /// The browser settings.
  final List<BrowserSettingsSummary>? browserSettings;

  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  ListBrowserSettingsResponse({
    this.browserSettings,
    this.nextToken,
  });

  factory ListBrowserSettingsResponse.fromJson(Map<String, dynamic> json) {
    return ListBrowserSettingsResponse(
      browserSettings: (json['browserSettings'] as List?)
          ?.whereNotNull()
          .map(
              (e) => BrowserSettingsSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final browserSettings = this.browserSettings;
    final nextToken = this.nextToken;
    return {
      if (browserSettings != null) 'browserSettings': browserSettings,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListIdentityProvidersResponse {
  /// The identity providers.
  final List<IdentityProviderSummary>? identityProviders;

  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  ListIdentityProvidersResponse({
    this.identityProviders,
    this.nextToken,
  });

  factory ListIdentityProvidersResponse.fromJson(Map<String, dynamic> json) {
    return ListIdentityProvidersResponse(
      identityProviders: (json['identityProviders'] as List?)
          ?.whereNotNull()
          .map((e) =>
              IdentityProviderSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityProviders = this.identityProviders;
    final nextToken = this.nextToken;
    return {
      if (identityProviders != null) 'identityProviders': identityProviders,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListIpAccessSettingsResponse {
  /// The IP access settings.
  final List<IpAccessSettingsSummary>? ipAccessSettings;

  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  ListIpAccessSettingsResponse({
    this.ipAccessSettings,
    this.nextToken,
  });

  factory ListIpAccessSettingsResponse.fromJson(Map<String, dynamic> json) {
    return ListIpAccessSettingsResponse(
      ipAccessSettings: (json['ipAccessSettings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              IpAccessSettingsSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ipAccessSettings = this.ipAccessSettings;
    final nextToken = this.nextToken;
    return {
      if (ipAccessSettings != null) 'ipAccessSettings': ipAccessSettings,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNetworkSettingsResponse {
  /// The network settings.
  final List<NetworkSettingsSummary>? networkSettings;

  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  ListNetworkSettingsResponse({
    this.networkSettings,
    this.nextToken,
  });

  factory ListNetworkSettingsResponse.fromJson(Map<String, dynamic> json) {
    return ListNetworkSettingsResponse(
      networkSettings: (json['networkSettings'] as List?)
          ?.whereNotNull()
          .map(
              (e) => NetworkSettingsSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkSettings = this.networkSettings;
    final nextToken = this.nextToken;
    return {
      if (networkSettings != null) 'networkSettings': networkSettings,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListPortalsResponse {
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  /// The portals in the list.
  final List<PortalSummary>? portals;

  ListPortalsResponse({
    this.nextToken,
    this.portals,
  });

  factory ListPortalsResponse.fromJson(Map<String, dynamic> json) {
    return ListPortalsResponse(
      nextToken: json['nextToken'] as String?,
      portals: (json['portals'] as List?)
          ?.whereNotNull()
          .map((e) => PortalSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final portals = this.portals;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (portals != null) 'portals': portals,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags of the resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

class ListTrustStoreCertificatesResponse {
  /// The ARN of the trust store.
  final String trustStoreArn;

  /// The certificate list.
  final List<CertificateSummary>? certificateList;

  /// The pagination token used to retrieve the next page of results for this
  /// operation.&gt;
  final String? nextToken;

  ListTrustStoreCertificatesResponse({
    required this.trustStoreArn,
    this.certificateList,
    this.nextToken,
  });

  factory ListTrustStoreCertificatesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListTrustStoreCertificatesResponse(
      trustStoreArn: json['trustStoreArn'] as String,
      certificateList: (json['certificateList'] as List?)
          ?.whereNotNull()
          .map((e) => CertificateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final trustStoreArn = this.trustStoreArn;
    final certificateList = this.certificateList;
    final nextToken = this.nextToken;
    return {
      'trustStoreArn': trustStoreArn,
      if (certificateList != null) 'certificateList': certificateList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTrustStoresResponse {
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  /// The trust stores.
  final List<TrustStoreSummary>? trustStores;

  ListTrustStoresResponse({
    this.nextToken,
    this.trustStores,
  });

  factory ListTrustStoresResponse.fromJson(Map<String, dynamic> json) {
    return ListTrustStoresResponse(
      nextToken: json['nextToken'] as String?,
      trustStores: (json['trustStores'] as List?)
          ?.whereNotNull()
          .map((e) => TrustStoreSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final trustStores = this.trustStores;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (trustStores != null) 'trustStores': trustStores,
    };
  }
}

class ListUserAccessLoggingSettingsResponse {
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  /// The user access logging settings.
  final List<UserAccessLoggingSettingsSummary>? userAccessLoggingSettings;

  ListUserAccessLoggingSettingsResponse({
    this.nextToken,
    this.userAccessLoggingSettings,
  });

  factory ListUserAccessLoggingSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListUserAccessLoggingSettingsResponse(
      nextToken: json['nextToken'] as String?,
      userAccessLoggingSettings: (json['userAccessLoggingSettings'] as List?)
          ?.whereNotNull()
          .map((e) => UserAccessLoggingSettingsSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final userAccessLoggingSettings = this.userAccessLoggingSettings;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (userAccessLoggingSettings != null)
        'userAccessLoggingSettings': userAccessLoggingSettings,
    };
  }
}

class ListUserSettingsResponse {
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  /// The user settings.
  final List<UserSettingsSummary>? userSettings;

  ListUserSettingsResponse({
    this.nextToken,
    this.userSettings,
  });

  factory ListUserSettingsResponse.fromJson(Map<String, dynamic> json) {
    return ListUserSettingsResponse(
      nextToken: json['nextToken'] as String?,
      userSettings: (json['userSettings'] as List?)
          ?.whereNotNull()
          .map((e) => UserSettingsSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final userSettings = this.userSettings;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (userSettings != null) 'userSettings': userSettings,
    };
  }
}

/// A network settings resource that can be associated with a web portal. Once
/// associated with a web portal, network settings define how streaming
/// instances will connect with your specified VPC.
class NetworkSettings {
  /// The ARN of the network settings.
  final String networkSettingsArn;

  /// A list of web portal ARNs that this network settings is associated with.
  final List<String>? associatedPortalArns;

  /// One or more security groups used to control access from streaming instances
  /// to your VPC.
  final List<String>? securityGroupIds;

  /// The subnets in which network interfaces are created to connect streaming
  /// instances to your VPC. At least two of these subnets must be in different
  /// availability zones.
  final List<String>? subnetIds;

  /// The VPC that streaming instances will connect to.
  final String? vpcId;

  NetworkSettings({
    required this.networkSettingsArn,
    this.associatedPortalArns,
    this.securityGroupIds,
    this.subnetIds,
    this.vpcId,
  });

  factory NetworkSettings.fromJson(Map<String, dynamic> json) {
    return NetworkSettings(
      networkSettingsArn: json['networkSettingsArn'] as String,
      associatedPortalArns: (json['associatedPortalArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkSettingsArn = this.networkSettingsArn;
    final associatedPortalArns = this.associatedPortalArns;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      'networkSettingsArn': networkSettingsArn,
      if (associatedPortalArns != null)
        'associatedPortalArns': associatedPortalArns,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// The summary of network settings.
class NetworkSettingsSummary {
  /// The ARN of the network settings.
  final String networkSettingsArn;

  /// The VPC ID of the network settings.
  final String? vpcId;

  NetworkSettingsSummary({
    required this.networkSettingsArn,
    this.vpcId,
  });

  factory NetworkSettingsSummary.fromJson(Map<String, dynamic> json) {
    return NetworkSettingsSummary(
      networkSettingsArn: json['networkSettingsArn'] as String,
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkSettingsArn = this.networkSettingsArn;
    final vpcId = this.vpcId;
    return {
      'networkSettingsArn': networkSettingsArn,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// The web portal.
class Portal {
  /// The ARN of the web portal.
  final String portalArn;

  /// The additional encryption context of the portal.
  final Map<String, String>? additionalEncryptionContext;

  /// The type of authentication integration points used when signing into the web
  /// portal. Defaults to <code>Standard</code>.
  ///
  /// <code>Standard</code> web portals are authenticated directly through your
  /// identity provider. You need to call <code>CreateIdentityProvider</code> to
  /// integrate your identity provider with your web portal. User and group access
  /// to your web portal is controlled through your identity provider.
  ///
  /// <code>IAM Identity Center</code> web portals are authenticated through IAM
  /// Identity Center (successor to Single Sign-On). Identity sources (including
  /// external identity provider integration), plus user and group access to your
  /// web portal, can be configured in the IAM Identity Center.
  final AuthenticationType? authenticationType;

  /// The ARN of the browser settings that is associated with this web portal.
  final String? browserSettingsArn;

  /// The browser that users see when using a streaming session.
  final BrowserType? browserType;

  /// The creation date of the web portal.
  final DateTime? creationDate;

  /// The customer managed key used to encrypt sensitive information in the
  /// portal.
  final String? customerManagedKey;

  /// The name of the web portal.
  final String? displayName;

  /// The type and resources of the underlying instance.
  final InstanceType? instanceType;

  /// The ARN of the IP access settings.
  final String? ipAccessSettingsArn;

  /// The maximum number of concurrent sessions for the portal.
  final int? maxConcurrentSessions;

  /// The ARN of the network settings that is associated with the web portal.
  final String? networkSettingsArn;

  /// The endpoint URL of the web portal that users access in order to start
  /// streaming sessions.
  final String? portalEndpoint;

  /// The status of the web portal.
  final PortalStatus? portalStatus;

  /// The renderer that is used in streaming sessions.
  final RendererType? rendererType;

  /// A message that explains why the web portal is in its current status.
  final String? statusReason;

  /// The ARN of the trust store that is associated with the web portal.
  final String? trustStoreArn;

  /// The ARN of the user access logging settings that is associated with the web
  /// portal.
  final String? userAccessLoggingSettingsArn;

  /// The ARN of the user settings that is associated with the web portal.
  final String? userSettingsArn;

  Portal({
    required this.portalArn,
    this.additionalEncryptionContext,
    this.authenticationType,
    this.browserSettingsArn,
    this.browserType,
    this.creationDate,
    this.customerManagedKey,
    this.displayName,
    this.instanceType,
    this.ipAccessSettingsArn,
    this.maxConcurrentSessions,
    this.networkSettingsArn,
    this.portalEndpoint,
    this.portalStatus,
    this.rendererType,
    this.statusReason,
    this.trustStoreArn,
    this.userAccessLoggingSettingsArn,
    this.userSettingsArn,
  });

  factory Portal.fromJson(Map<String, dynamic> json) {
    return Portal(
      portalArn: json['portalArn'] as String,
      additionalEncryptionContext:
          (json['additionalEncryptionContext'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      authenticationType:
          (json['authenticationType'] as String?)?.toAuthenticationType(),
      browserSettingsArn: json['browserSettingsArn'] as String?,
      browserType: (json['browserType'] as String?)?.toBrowserType(),
      creationDate: timeStampFromJson(json['creationDate']),
      customerManagedKey: json['customerManagedKey'] as String?,
      displayName: json['displayName'] as String?,
      instanceType: (json['instanceType'] as String?)?.toInstanceType(),
      ipAccessSettingsArn: json['ipAccessSettingsArn'] as String?,
      maxConcurrentSessions: json['maxConcurrentSessions'] as int?,
      networkSettingsArn: json['networkSettingsArn'] as String?,
      portalEndpoint: json['portalEndpoint'] as String?,
      portalStatus: (json['portalStatus'] as String?)?.toPortalStatus(),
      rendererType: (json['rendererType'] as String?)?.toRendererType(),
      statusReason: json['statusReason'] as String?,
      trustStoreArn: json['trustStoreArn'] as String?,
      userAccessLoggingSettingsArn:
          json['userAccessLoggingSettingsArn'] as String?,
      userSettingsArn: json['userSettingsArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final portalArn = this.portalArn;
    final additionalEncryptionContext = this.additionalEncryptionContext;
    final authenticationType = this.authenticationType;
    final browserSettingsArn = this.browserSettingsArn;
    final browserType = this.browserType;
    final creationDate = this.creationDate;
    final customerManagedKey = this.customerManagedKey;
    final displayName = this.displayName;
    final instanceType = this.instanceType;
    final ipAccessSettingsArn = this.ipAccessSettingsArn;
    final maxConcurrentSessions = this.maxConcurrentSessions;
    final networkSettingsArn = this.networkSettingsArn;
    final portalEndpoint = this.portalEndpoint;
    final portalStatus = this.portalStatus;
    final rendererType = this.rendererType;
    final statusReason = this.statusReason;
    final trustStoreArn = this.trustStoreArn;
    final userAccessLoggingSettingsArn = this.userAccessLoggingSettingsArn;
    final userSettingsArn = this.userSettingsArn;
    return {
      'portalArn': portalArn,
      if (additionalEncryptionContext != null)
        'additionalEncryptionContext': additionalEncryptionContext,
      if (authenticationType != null)
        'authenticationType': authenticationType.toValue(),
      if (browserSettingsArn != null) 'browserSettingsArn': browserSettingsArn,
      if (browserType != null) 'browserType': browserType.toValue(),
      if (creationDate != null)
        'creationDate': unixTimestampToJson(creationDate),
      if (customerManagedKey != null) 'customerManagedKey': customerManagedKey,
      if (displayName != null) 'displayName': displayName,
      if (instanceType != null) 'instanceType': instanceType.toValue(),
      if (ipAccessSettingsArn != null)
        'ipAccessSettingsArn': ipAccessSettingsArn,
      if (maxConcurrentSessions != null)
        'maxConcurrentSessions': maxConcurrentSessions,
      if (networkSettingsArn != null) 'networkSettingsArn': networkSettingsArn,
      if (portalEndpoint != null) 'portalEndpoint': portalEndpoint,
      if (portalStatus != null) 'portalStatus': portalStatus.toValue(),
      if (rendererType != null) 'rendererType': rendererType.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
      if (trustStoreArn != null) 'trustStoreArn': trustStoreArn,
      if (userAccessLoggingSettingsArn != null)
        'userAccessLoggingSettingsArn': userAccessLoggingSettingsArn,
      if (userSettingsArn != null) 'userSettingsArn': userSettingsArn,
    };
  }
}

enum PortalStatus {
  incomplete,
  pending,
  active,
}

extension PortalStatusValueExtension on PortalStatus {
  String toValue() {
    switch (this) {
      case PortalStatus.incomplete:
        return 'Incomplete';
      case PortalStatus.pending:
        return 'Pending';
      case PortalStatus.active:
        return 'Active';
    }
  }
}

extension PortalStatusFromString on String {
  PortalStatus toPortalStatus() {
    switch (this) {
      case 'Incomplete':
        return PortalStatus.incomplete;
      case 'Pending':
        return PortalStatus.pending;
      case 'Active':
        return PortalStatus.active;
    }
    throw Exception('$this is not known in enum PortalStatus');
  }
}

/// The summary of the portal.
class PortalSummary {
  /// The ARN of the web portal.
  final String portalArn;

  /// The type of authentication integration points used when signing into the web
  /// portal. Defaults to <code>Standard</code>.
  ///
  /// <code>Standard</code> web portals are authenticated directly through your
  /// identity provider. You need to call <code>CreateIdentityProvider</code> to
  /// integrate your identity provider with your web portal. User and group access
  /// to your web portal is controlled through your identity provider.
  ///
  /// <code>IAM Identity Center</code> web portals are authenticated through IAM
  /// Identity Center (successor to Single Sign-On). Identity sources (including
  /// external identity provider integration), plus user and group access to your
  /// web portal, can be configured in the IAM Identity Center.
  final AuthenticationType? authenticationType;

  /// The ARN of the browser settings that is associated with the web portal.
  final String? browserSettingsArn;

  /// The browser type of the web portal.
  final BrowserType? browserType;

  /// The creation date of the web portal.
  final DateTime? creationDate;

  /// The name of the web portal.
  final String? displayName;

  /// The type and resources of the underlying instance.
  final InstanceType? instanceType;

  /// The ARN of the IP access settings.
  final String? ipAccessSettingsArn;

  /// The maximum number of concurrent sessions for the portal.
  final int? maxConcurrentSessions;

  /// The ARN of the network settings that is associated with the web portal.
  final String? networkSettingsArn;

  /// The endpoint URL of the web portal that users access in order to start
  /// streaming sessions.
  final String? portalEndpoint;

  /// The status of the web portal.
  final PortalStatus? portalStatus;

  /// The renderer that is used in streaming sessions.
  final RendererType? rendererType;

  /// The ARN of the trust that is associated with this web portal.
  final String? trustStoreArn;

  /// The ARN of the user access logging settings that is associated with the web
  /// portal.
  final String? userAccessLoggingSettingsArn;

  /// The ARN of the user settings that is associated with the web portal.
  final String? userSettingsArn;

  PortalSummary({
    required this.portalArn,
    this.authenticationType,
    this.browserSettingsArn,
    this.browserType,
    this.creationDate,
    this.displayName,
    this.instanceType,
    this.ipAccessSettingsArn,
    this.maxConcurrentSessions,
    this.networkSettingsArn,
    this.portalEndpoint,
    this.portalStatus,
    this.rendererType,
    this.trustStoreArn,
    this.userAccessLoggingSettingsArn,
    this.userSettingsArn,
  });

  factory PortalSummary.fromJson(Map<String, dynamic> json) {
    return PortalSummary(
      portalArn: json['portalArn'] as String,
      authenticationType:
          (json['authenticationType'] as String?)?.toAuthenticationType(),
      browserSettingsArn: json['browserSettingsArn'] as String?,
      browserType: (json['browserType'] as String?)?.toBrowserType(),
      creationDate: timeStampFromJson(json['creationDate']),
      displayName: json['displayName'] as String?,
      instanceType: (json['instanceType'] as String?)?.toInstanceType(),
      ipAccessSettingsArn: json['ipAccessSettingsArn'] as String?,
      maxConcurrentSessions: json['maxConcurrentSessions'] as int?,
      networkSettingsArn: json['networkSettingsArn'] as String?,
      portalEndpoint: json['portalEndpoint'] as String?,
      portalStatus: (json['portalStatus'] as String?)?.toPortalStatus(),
      rendererType: (json['rendererType'] as String?)?.toRendererType(),
      trustStoreArn: json['trustStoreArn'] as String?,
      userAccessLoggingSettingsArn:
          json['userAccessLoggingSettingsArn'] as String?,
      userSettingsArn: json['userSettingsArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final portalArn = this.portalArn;
    final authenticationType = this.authenticationType;
    final browserSettingsArn = this.browserSettingsArn;
    final browserType = this.browserType;
    final creationDate = this.creationDate;
    final displayName = this.displayName;
    final instanceType = this.instanceType;
    final ipAccessSettingsArn = this.ipAccessSettingsArn;
    final maxConcurrentSessions = this.maxConcurrentSessions;
    final networkSettingsArn = this.networkSettingsArn;
    final portalEndpoint = this.portalEndpoint;
    final portalStatus = this.portalStatus;
    final rendererType = this.rendererType;
    final trustStoreArn = this.trustStoreArn;
    final userAccessLoggingSettingsArn = this.userAccessLoggingSettingsArn;
    final userSettingsArn = this.userSettingsArn;
    return {
      'portalArn': portalArn,
      if (authenticationType != null)
        'authenticationType': authenticationType.toValue(),
      if (browserSettingsArn != null) 'browserSettingsArn': browserSettingsArn,
      if (browserType != null) 'browserType': browserType.toValue(),
      if (creationDate != null)
        'creationDate': unixTimestampToJson(creationDate),
      if (displayName != null) 'displayName': displayName,
      if (instanceType != null) 'instanceType': instanceType.toValue(),
      if (ipAccessSettingsArn != null)
        'ipAccessSettingsArn': ipAccessSettingsArn,
      if (maxConcurrentSessions != null)
        'maxConcurrentSessions': maxConcurrentSessions,
      if (networkSettingsArn != null) 'networkSettingsArn': networkSettingsArn,
      if (portalEndpoint != null) 'portalEndpoint': portalEndpoint,
      if (portalStatus != null) 'portalStatus': portalStatus.toValue(),
      if (rendererType != null) 'rendererType': rendererType.toValue(),
      if (trustStoreArn != null) 'trustStoreArn': trustStoreArn,
      if (userAccessLoggingSettingsArn != null)
        'userAccessLoggingSettingsArn': userAccessLoggingSettingsArn,
      if (userSettingsArn != null) 'userSettingsArn': userSettingsArn,
    };
  }
}

enum RendererType {
  appStream,
}

extension RendererTypeValueExtension on RendererType {
  String toValue() {
    switch (this) {
      case RendererType.appStream:
        return 'AppStream';
    }
  }
}

extension RendererTypeFromString on String {
  RendererType toRendererType() {
    switch (this) {
      case 'AppStream':
        return RendererType.appStream;
    }
    throw Exception('$this is not known in enum RendererType');
  }
}

/// The tag.
class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
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

/// A trust store that can be associated with a web portal. A trust store
/// contains certificate authority (CA) certificates. Once associated with a web
/// portal, the browser in a streaming session will recognize certificates that
/// have been issued using any of the CAs in the trust store. If your
/// organization has internal websites that use certificates issued by private
/// CAs, you should add the private CA certificate to the trust store.
class TrustStore {
  /// The ARN of the trust store.
  final String trustStoreArn;

  /// A list of web portal ARNs that this trust store is associated with.
  final List<String>? associatedPortalArns;

  TrustStore({
    required this.trustStoreArn,
    this.associatedPortalArns,
  });

  factory TrustStore.fromJson(Map<String, dynamic> json) {
    return TrustStore(
      trustStoreArn: json['trustStoreArn'] as String,
      associatedPortalArns: (json['associatedPortalArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final trustStoreArn = this.trustStoreArn;
    final associatedPortalArns = this.associatedPortalArns;
    return {
      'trustStoreArn': trustStoreArn,
      if (associatedPortalArns != null)
        'associatedPortalArns': associatedPortalArns,
    };
  }
}

/// The summary of the trust store.
class TrustStoreSummary {
  /// The ARN of the trust store.
  final String? trustStoreArn;

  TrustStoreSummary({
    this.trustStoreArn,
  });

  factory TrustStoreSummary.fromJson(Map<String, dynamic> json) {
    return TrustStoreSummary(
      trustStoreArn: json['trustStoreArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final trustStoreArn = this.trustStoreArn;
    return {
      if (trustStoreArn != null) 'trustStoreArn': trustStoreArn,
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

class UpdateBrowserSettingsResponse {
  /// The browser settings.
  final BrowserSettings browserSettings;

  UpdateBrowserSettingsResponse({
    required this.browserSettings,
  });

  factory UpdateBrowserSettingsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBrowserSettingsResponse(
      browserSettings: BrowserSettings.fromJson(
          json['browserSettings'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final browserSettings = this.browserSettings;
    return {
      'browserSettings': browserSettings,
    };
  }
}

class UpdateIdentityProviderResponse {
  /// The identity provider.
  final IdentityProvider identityProvider;

  UpdateIdentityProviderResponse({
    required this.identityProvider,
  });

  factory UpdateIdentityProviderResponse.fromJson(Map<String, dynamic> json) {
    return UpdateIdentityProviderResponse(
      identityProvider: IdentityProvider.fromJson(
          json['identityProvider'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final identityProvider = this.identityProvider;
    return {
      'identityProvider': identityProvider,
    };
  }
}

class UpdateIpAccessSettingsResponse {
  /// The IP access settings.
  final IpAccessSettings ipAccessSettings;

  UpdateIpAccessSettingsResponse({
    required this.ipAccessSettings,
  });

  factory UpdateIpAccessSettingsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateIpAccessSettingsResponse(
      ipAccessSettings: IpAccessSettings.fromJson(
          json['ipAccessSettings'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final ipAccessSettings = this.ipAccessSettings;
    return {
      'ipAccessSettings': ipAccessSettings,
    };
  }
}

class UpdateNetworkSettingsResponse {
  /// The network settings.
  final NetworkSettings networkSettings;

  UpdateNetworkSettingsResponse({
    required this.networkSettings,
  });

  factory UpdateNetworkSettingsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateNetworkSettingsResponse(
      networkSettings: NetworkSettings.fromJson(
          json['networkSettings'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final networkSettings = this.networkSettings;
    return {
      'networkSettings': networkSettings,
    };
  }
}

class UpdatePortalResponse {
  /// The web portal.
  final Portal? portal;

  UpdatePortalResponse({
    this.portal,
  });

  factory UpdatePortalResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePortalResponse(
      portal: json['portal'] != null
          ? Portal.fromJson(json['portal'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final portal = this.portal;
    return {
      if (portal != null) 'portal': portal,
    };
  }
}

class UpdateTrustStoreResponse {
  /// The ARN of the trust store.
  final String trustStoreArn;

  UpdateTrustStoreResponse({
    required this.trustStoreArn,
  });

  factory UpdateTrustStoreResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTrustStoreResponse(
      trustStoreArn: json['trustStoreArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final trustStoreArn = this.trustStoreArn;
    return {
      'trustStoreArn': trustStoreArn,
    };
  }
}

class UpdateUserAccessLoggingSettingsResponse {
  /// The user access logging settings.
  final UserAccessLoggingSettings userAccessLoggingSettings;

  UpdateUserAccessLoggingSettingsResponse({
    required this.userAccessLoggingSettings,
  });

  factory UpdateUserAccessLoggingSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateUserAccessLoggingSettingsResponse(
      userAccessLoggingSettings: UserAccessLoggingSettings.fromJson(
          json['userAccessLoggingSettings'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final userAccessLoggingSettings = this.userAccessLoggingSettings;
    return {
      'userAccessLoggingSettings': userAccessLoggingSettings,
    };
  }
}

class UpdateUserSettingsResponse {
  /// The user settings.
  final UserSettings userSettings;

  UpdateUserSettingsResponse({
    required this.userSettings,
  });

  factory UpdateUserSettingsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateUserSettingsResponse(
      userSettings:
          UserSettings.fromJson(json['userSettings'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final userSettings = this.userSettings;
    return {
      'userSettings': userSettings,
    };
  }
}

/// A user access logging settings resource that can be associated with a web
/// portal.
class UserAccessLoggingSettings {
  /// The ARN of the user access logging settings.
  final String userAccessLoggingSettingsArn;

  /// A list of web portal ARNs that this user access logging settings is
  /// associated with.
  final List<String>? associatedPortalArns;

  /// The ARN of the Kinesis stream.
  final String? kinesisStreamArn;

  UserAccessLoggingSettings({
    required this.userAccessLoggingSettingsArn,
    this.associatedPortalArns,
    this.kinesisStreamArn,
  });

  factory UserAccessLoggingSettings.fromJson(Map<String, dynamic> json) {
    return UserAccessLoggingSettings(
      userAccessLoggingSettingsArn:
          json['userAccessLoggingSettingsArn'] as String,
      associatedPortalArns: (json['associatedPortalArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      kinesisStreamArn: json['kinesisStreamArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userAccessLoggingSettingsArn = this.userAccessLoggingSettingsArn;
    final associatedPortalArns = this.associatedPortalArns;
    final kinesisStreamArn = this.kinesisStreamArn;
    return {
      'userAccessLoggingSettingsArn': userAccessLoggingSettingsArn,
      if (associatedPortalArns != null)
        'associatedPortalArns': associatedPortalArns,
      if (kinesisStreamArn != null) 'kinesisStreamArn': kinesisStreamArn,
    };
  }
}

/// The summary of user access logging settings.
class UserAccessLoggingSettingsSummary {
  /// The ARN of the user access logging settings.
  final String userAccessLoggingSettingsArn;

  /// The ARN of the Kinesis stream.
  final String? kinesisStreamArn;

  UserAccessLoggingSettingsSummary({
    required this.userAccessLoggingSettingsArn,
    this.kinesisStreamArn,
  });

  factory UserAccessLoggingSettingsSummary.fromJson(Map<String, dynamic> json) {
    return UserAccessLoggingSettingsSummary(
      userAccessLoggingSettingsArn:
          json['userAccessLoggingSettingsArn'] as String,
      kinesisStreamArn: json['kinesisStreamArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userAccessLoggingSettingsArn = this.userAccessLoggingSettingsArn;
    final kinesisStreamArn = this.kinesisStreamArn;
    return {
      'userAccessLoggingSettingsArn': userAccessLoggingSettingsArn,
      if (kinesisStreamArn != null) 'kinesisStreamArn': kinesisStreamArn,
    };
  }
}

/// A user settings resource that can be associated with a web portal. Once
/// associated with a web portal, user settings control how users can transfer
/// data between a streaming session and the their local devices.
class UserSettings {
  /// The ARN of the user settings.
  final String userSettingsArn;

  /// The additional encryption context of the user settings.
  final Map<String, String>? additionalEncryptionContext;

  /// A list of web portal ARNs that this user settings is associated with.
  final List<String>? associatedPortalArns;

  /// The configuration that specifies which cookies should be synchronized from
  /// the end user's local browser to the remote browser.
  final CookieSynchronizationConfiguration? cookieSynchronizationConfiguration;

  /// Specifies whether the user can copy text from the streaming session to the
  /// local device.
  final EnabledType? copyAllowed;

  /// The customer managed key used to encrypt sensitive information in the user
  /// settings.
  final String? customerManagedKey;

  /// The amount of time that a streaming session remains active after users
  /// disconnect.
  final int? disconnectTimeoutInMinutes;

  /// Specifies whether the user can download files from the streaming session to
  /// the local device.
  final EnabledType? downloadAllowed;

  /// The amount of time that users can be idle (inactive) before they are
  /// disconnected from their streaming session and the disconnect timeout
  /// interval begins.
  final int? idleDisconnectTimeoutInMinutes;

  /// Specifies whether the user can paste text from the local device to the
  /// streaming session.
  final EnabledType? pasteAllowed;

  /// Specifies whether the user can print to the local device.
  final EnabledType? printAllowed;

  /// Specifies whether the user can upload files from the local device to the
  /// streaming session.
  final EnabledType? uploadAllowed;

  UserSettings({
    required this.userSettingsArn,
    this.additionalEncryptionContext,
    this.associatedPortalArns,
    this.cookieSynchronizationConfiguration,
    this.copyAllowed,
    this.customerManagedKey,
    this.disconnectTimeoutInMinutes,
    this.downloadAllowed,
    this.idleDisconnectTimeoutInMinutes,
    this.pasteAllowed,
    this.printAllowed,
    this.uploadAllowed,
  });

  factory UserSettings.fromJson(Map<String, dynamic> json) {
    return UserSettings(
      userSettingsArn: json['userSettingsArn'] as String,
      additionalEncryptionContext:
          (json['additionalEncryptionContext'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      associatedPortalArns: (json['associatedPortalArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      cookieSynchronizationConfiguration:
          json['cookieSynchronizationConfiguration'] != null
              ? CookieSynchronizationConfiguration.fromJson(
                  json['cookieSynchronizationConfiguration']
                      as Map<String, dynamic>)
              : null,
      copyAllowed: (json['copyAllowed'] as String?)?.toEnabledType(),
      customerManagedKey: json['customerManagedKey'] as String?,
      disconnectTimeoutInMinutes: json['disconnectTimeoutInMinutes'] as int?,
      downloadAllowed: (json['downloadAllowed'] as String?)?.toEnabledType(),
      idleDisconnectTimeoutInMinutes:
          json['idleDisconnectTimeoutInMinutes'] as int?,
      pasteAllowed: (json['pasteAllowed'] as String?)?.toEnabledType(),
      printAllowed: (json['printAllowed'] as String?)?.toEnabledType(),
      uploadAllowed: (json['uploadAllowed'] as String?)?.toEnabledType(),
    );
  }

  Map<String, dynamic> toJson() {
    final userSettingsArn = this.userSettingsArn;
    final additionalEncryptionContext = this.additionalEncryptionContext;
    final associatedPortalArns = this.associatedPortalArns;
    final cookieSynchronizationConfiguration =
        this.cookieSynchronizationConfiguration;
    final copyAllowed = this.copyAllowed;
    final customerManagedKey = this.customerManagedKey;
    final disconnectTimeoutInMinutes = this.disconnectTimeoutInMinutes;
    final downloadAllowed = this.downloadAllowed;
    final idleDisconnectTimeoutInMinutes = this.idleDisconnectTimeoutInMinutes;
    final pasteAllowed = this.pasteAllowed;
    final printAllowed = this.printAllowed;
    final uploadAllowed = this.uploadAllowed;
    return {
      'userSettingsArn': userSettingsArn,
      if (additionalEncryptionContext != null)
        'additionalEncryptionContext': additionalEncryptionContext,
      if (associatedPortalArns != null)
        'associatedPortalArns': associatedPortalArns,
      if (cookieSynchronizationConfiguration != null)
        'cookieSynchronizationConfiguration':
            cookieSynchronizationConfiguration,
      if (copyAllowed != null) 'copyAllowed': copyAllowed.toValue(),
      if (customerManagedKey != null) 'customerManagedKey': customerManagedKey,
      if (disconnectTimeoutInMinutes != null)
        'disconnectTimeoutInMinutes': disconnectTimeoutInMinutes,
      if (downloadAllowed != null) 'downloadAllowed': downloadAllowed.toValue(),
      if (idleDisconnectTimeoutInMinutes != null)
        'idleDisconnectTimeoutInMinutes': idleDisconnectTimeoutInMinutes,
      if (pasteAllowed != null) 'pasteAllowed': pasteAllowed.toValue(),
      if (printAllowed != null) 'printAllowed': printAllowed.toValue(),
      if (uploadAllowed != null) 'uploadAllowed': uploadAllowed.toValue(),
    };
  }
}

/// The summary of user settings.
class UserSettingsSummary {
  /// The ARN of the user settings.
  final String userSettingsArn;

  /// The configuration that specifies which cookies should be synchronized from
  /// the end user's local browser to the remote browser.
  final CookieSynchronizationConfiguration? cookieSynchronizationConfiguration;

  /// Specifies whether the user can copy text from the streaming session to the
  /// local device.
  final EnabledType? copyAllowed;

  /// The amount of time that a streaming session remains active after users
  /// disconnect.
  final int? disconnectTimeoutInMinutes;

  /// Specifies whether the user can download files from the streaming session to
  /// the local device.
  final EnabledType? downloadAllowed;

  /// The amount of time that users can be idle (inactive) before they are
  /// disconnected from their streaming session and the disconnect timeout
  /// interval begins.
  final int? idleDisconnectTimeoutInMinutes;

  /// Specifies whether the user can paste text from the local device to the
  /// streaming session.
  final EnabledType? pasteAllowed;

  /// Specifies whether the user can print to the local device.
  final EnabledType? printAllowed;

  /// Specifies whether the user can upload files from the local device to the
  /// streaming session.
  final EnabledType? uploadAllowed;

  UserSettingsSummary({
    required this.userSettingsArn,
    this.cookieSynchronizationConfiguration,
    this.copyAllowed,
    this.disconnectTimeoutInMinutes,
    this.downloadAllowed,
    this.idleDisconnectTimeoutInMinutes,
    this.pasteAllowed,
    this.printAllowed,
    this.uploadAllowed,
  });

  factory UserSettingsSummary.fromJson(Map<String, dynamic> json) {
    return UserSettingsSummary(
      userSettingsArn: json['userSettingsArn'] as String,
      cookieSynchronizationConfiguration:
          json['cookieSynchronizationConfiguration'] != null
              ? CookieSynchronizationConfiguration.fromJson(
                  json['cookieSynchronizationConfiguration']
                      as Map<String, dynamic>)
              : null,
      copyAllowed: (json['copyAllowed'] as String?)?.toEnabledType(),
      disconnectTimeoutInMinutes: json['disconnectTimeoutInMinutes'] as int?,
      downloadAllowed: (json['downloadAllowed'] as String?)?.toEnabledType(),
      idleDisconnectTimeoutInMinutes:
          json['idleDisconnectTimeoutInMinutes'] as int?,
      pasteAllowed: (json['pasteAllowed'] as String?)?.toEnabledType(),
      printAllowed: (json['printAllowed'] as String?)?.toEnabledType(),
      uploadAllowed: (json['uploadAllowed'] as String?)?.toEnabledType(),
    );
  }

  Map<String, dynamic> toJson() {
    final userSettingsArn = this.userSettingsArn;
    final cookieSynchronizationConfiguration =
        this.cookieSynchronizationConfiguration;
    final copyAllowed = this.copyAllowed;
    final disconnectTimeoutInMinutes = this.disconnectTimeoutInMinutes;
    final downloadAllowed = this.downloadAllowed;
    final idleDisconnectTimeoutInMinutes = this.idleDisconnectTimeoutInMinutes;
    final pasteAllowed = this.pasteAllowed;
    final printAllowed = this.printAllowed;
    final uploadAllowed = this.uploadAllowed;
    return {
      'userSettingsArn': userSettingsArn,
      if (cookieSynchronizationConfiguration != null)
        'cookieSynchronizationConfiguration':
            cookieSynchronizationConfiguration,
      if (copyAllowed != null) 'copyAllowed': copyAllowed.toValue(),
      if (disconnectTimeoutInMinutes != null)
        'disconnectTimeoutInMinutes': disconnectTimeoutInMinutes,
      if (downloadAllowed != null) 'downloadAllowed': downloadAllowed.toValue(),
      if (idleDisconnectTimeoutInMinutes != null)
        'idleDisconnectTimeoutInMinutes': idleDisconnectTimeoutInMinutes,
      if (pasteAllowed != null) 'pasteAllowed': pasteAllowed.toValue(),
      if (printAllowed != null) 'printAllowed': printAllowed.toValue(),
      if (uploadAllowed != null) 'uploadAllowed': uploadAllowed.toValue(),
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

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
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
