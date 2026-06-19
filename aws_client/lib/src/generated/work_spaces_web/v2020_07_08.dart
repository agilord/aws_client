// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// Amazon WorkSpaces Secure Browser is a low cost, fully managed WorkSpace
/// built specifically to facilitate secure, web-based workloads. WorkSpaces
/// Secure Browser makes it easy for customers to safely provide their employees
/// with access to internal websites and SaaS web applications without the
/// administrative burden of appliances or specialized client software.
/// WorkSpaces Secure Browser provides simple policy tools tailored for user
/// interactions, while offloading common tasks like capacity management,
/// scaling, and maintaining browser images.
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

  /// Expires an active secure browser session.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [portalId] :
  /// The ID of the web portal for the session.
  ///
  /// Parameter [sessionId] :
  /// The ID of the session to expire.
  Future<void> expireSession({
    required String portalId,
    required String sessionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/portals/${Uri.encodeComponent(portalId)}/sessions/${Uri.encodeComponent(sessionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets information for a secure browser session.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [portalId] :
  /// The ID of the web portal for the session.
  ///
  /// Parameter [sessionId] :
  /// The ID of the session.
  Future<GetSessionResponse> getSession({
    required String portalId,
    required String sessionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/portals/${Uri.encodeComponent(portalId)}/sessions/${Uri.encodeComponent(sessionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSessionResponse.fromJson(response);
  }

  /// Lists information for multiple secure browser sessions from a specific
  /// portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [portalId] :
  /// The ID of the web portal for the sessions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be included in the next page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  ///
  /// Parameter [sessionId] :
  /// The ID of the session.
  ///
  /// Parameter [sortBy] :
  /// The method in which the returned sessions should be sorted.
  ///
  /// Parameter [status] :
  /// The status of the session.
  ///
  /// Parameter [username] :
  /// The username of the session.
  Future<ListSessionsResponse> listSessions({
    required String portalId,
    int? maxResults,
    String? nextToken,
    String? sessionId,
    SessionSortBy? sortBy,
    SessionStatus? status,
    String? username,
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
      if (sessionId != null) 'sessionId': [sessionId],
      if (sortBy != null) 'sortBy': [sortBy.value],
      if (status != null) 'status': [status.value],
      if (username != null) 'username': [username],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/portals/${Uri.encodeComponent(portalId)}/sessions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSessionsResponse.fromJson(response);
  }

  /// Retrieves a list of tags for a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Adds or overwrites one or more tags for the specified resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [TooManyTagsException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Creates a browser settings resource that can be associated with a web
  /// portal. Once associated with a web portal, browser settings control how
  /// the browser will behave once a user starts a streaming session for the web
  /// portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [additionalEncryptionContext] :
  /// Additional encryption context of the browser settings.
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
  ///
  /// Parameter [webContentFilteringPolicy] :
  /// The policy that specifies which URLs end users are allowed to access or
  /// which URLs or domain categories they are restricted from accessing for
  /// enhanced security.
  Future<CreateBrowserSettingsResponse> createBrowserSettings({
    Map<String, String>? additionalEncryptionContext,
    String? browserPolicy,
    String? clientToken,
    String? customerManagedKey,
    List<Tag>? tags,
    WebContentFilteringPolicy? webContentFilteringPolicy,
  }) async {
    final $payload = <String, dynamic>{
      if (additionalEncryptionContext != null)
        'additionalEncryptionContext': additionalEncryptionContext,
      if (browserPolicy != null) 'browserPolicy': browserPolicy,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (customerManagedKey != null) 'customerManagedKey': customerManagedKey,
      if (tags != null) 'tags': tags,
      if (webContentFilteringPolicy != null)
        'webContentFilteringPolicy': webContentFilteringPolicy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/browserSettings',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBrowserSettingsResponse.fromJson(response);
  }

  /// Gets browser settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Updates browser settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
  ///
  /// Parameter [webContentFilteringPolicy] :
  /// The policy that specifies which URLs end users are allowed to access or
  /// which URLs or domain categories they are restricted from accessing for
  /// enhanced security.
  Future<UpdateBrowserSettingsResponse> updateBrowserSettings({
    required String browserSettingsArn,
    String? browserPolicy,
    String? clientToken,
    WebContentFilteringPolicy? webContentFilteringPolicy,
  }) async {
    final $payload = <String, dynamic>{
      if (browserPolicy != null) 'browserPolicy': browserPolicy,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (webContentFilteringPolicy != null)
        'webContentFilteringPolicy': webContentFilteringPolicy,
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

  /// Deletes browser settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves a list of browser settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
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

  /// Creates a data protection settings resource that can be associated with a
  /// web portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [additionalEncryptionContext] :
  /// Additional encryption context of the data protection settings.
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
  /// The custom managed key of the data protection settings.
  ///
  /// Parameter [description] :
  /// The description of the data protection settings.
  ///
  /// Parameter [displayName] :
  /// The display name of the data protection settings.
  ///
  /// Parameter [inlineRedactionConfiguration] :
  /// The inline redaction configuration of the data protection settings that
  /// will be applied to all sessions.
  ///
  /// Parameter [tags] :
  /// The tags to add to the data protection settings resource. A tag is a
  /// key-value pair.
  Future<CreateDataProtectionSettingsResponse> createDataProtectionSettings({
    Map<String, String>? additionalEncryptionContext,
    String? clientToken,
    String? customerManagedKey,
    String? description,
    String? displayName,
    InlineRedactionConfiguration? inlineRedactionConfiguration,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (additionalEncryptionContext != null)
        'additionalEncryptionContext': additionalEncryptionContext,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (customerManagedKey != null) 'customerManagedKey': customerManagedKey,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (inlineRedactionConfiguration != null)
        'inlineRedactionConfiguration': inlineRedactionConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/dataProtectionSettings',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataProtectionSettingsResponse.fromJson(response);
  }

  /// Gets the data protection settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataProtectionSettingsArn] :
  /// The ARN of the data protection settings.
  Future<GetDataProtectionSettingsResponse> getDataProtectionSettings({
    required String dataProtectionSettingsArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/dataProtectionSettings/${dataProtectionSettingsArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataProtectionSettingsResponse.fromJson(response);
  }

  /// Updates data protection settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataProtectionSettingsArn] :
  /// The ARN of the data protection settings.
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
  /// The description of the data protection settings.
  ///
  /// Parameter [displayName] :
  /// The display name of the data protection settings.
  ///
  /// Parameter [inlineRedactionConfiguration] :
  /// The inline redaction configuration of the data protection settings that
  /// will be applied to all sessions.
  Future<UpdateDataProtectionSettingsResponse> updateDataProtectionSettings({
    required String dataProtectionSettingsArn,
    String? clientToken,
    String? description,
    String? displayName,
    InlineRedactionConfiguration? inlineRedactionConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (inlineRedactionConfiguration != null)
        'inlineRedactionConfiguration': inlineRedactionConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/dataProtectionSettings/${dataProtectionSettingsArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDataProtectionSettingsResponse.fromJson(response);
  }

  /// Deletes data protection settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataProtectionSettingsArn] :
  /// The ARN of the data protection settings.
  Future<void> deleteDataProtectionSettings({
    required String dataProtectionSettingsArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/dataProtectionSettings/${dataProtectionSettingsArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves a list of data protection settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be included in the next page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<ListDataProtectionSettingsResponse> listDataProtectionSettings({
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
      requestUri: '/dataProtectionSettings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataProtectionSettingsResponse.fromJson(response);
  }

  /// Creates an identity provider resource that is then associated with a web
  /// portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  ///
  /// Parameter [tags] :
  /// The tags to add to the identity provider resource. A tag is a key-value
  /// pair.
  Future<CreateIdentityProviderResponse> createIdentityProvider({
    required Map<String, String> identityProviderDetails,
    required String identityProviderName,
    required IdentityProviderType identityProviderType,
    required String portalArn,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'identityProviderDetails': identityProviderDetails,
      'identityProviderName': identityProviderName,
      'identityProviderType': identityProviderType.value,
      'portalArn': portalArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/identityProviders',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIdentityProviderResponse.fromJson(response);
  }

  /// Gets the identity provider.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Updates the identity provider.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
        'identityProviderType': identityProviderType.value,
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

  /// Deletes the identity provider.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves a list of identity providers for a specific web portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
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

  /// Creates an IP access settings resource that can be associated with a web
  /// portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// The tags to add to the IP access settings resource. A tag is a key-value
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

  /// Gets the IP access settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Updates IP access settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Deletes IP access settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves a list of IP access settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
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

  /// Creates a network settings resource that can be associated with a web
  /// portal. Once associated with a web portal, network settings define how
  /// streaming instances will connect with your specified VPC.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Gets the network settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Updates network settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Deletes network settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves a list of network settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
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

  /// Creates a web portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// Identity Center. Identity sources (including external identity provider
  /// integration), plus user and group access to your web portal, can be
  /// configured in the IAM Identity Center.
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
  /// Parameter [portalCustomDomain] :
  /// The custom domain of the web portal that users access in order to start
  /// streaming sessions.
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
    String? portalCustomDomain,
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
        'authenticationType': authenticationType.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (customerManagedKey != null) 'customerManagedKey': customerManagedKey,
      if (displayName != null) 'displayName': displayName,
      if (instanceType != null) 'instanceType': instanceType.value,
      if (maxConcurrentSessions != null)
        'maxConcurrentSessions': maxConcurrentSessions,
      if (portalCustomDomain != null) 'portalCustomDomain': portalCustomDomain,
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

  /// Gets the web portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Updates a web portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// Identity Center. Identity sources (including external identity provider
  /// integration), plus user and group access to your web portal, can be
  /// configured in the IAM Identity Center.
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
  /// Parameter [portalCustomDomain] :
  /// The custom domain of the web portal that users access in order to start
  /// streaming sessions.
  Future<UpdatePortalResponse> updatePortal({
    required String portalArn,
    AuthenticationType? authenticationType,
    String? displayName,
    InstanceType? instanceType,
    int? maxConcurrentSessions,
    String? portalCustomDomain,
  }) async {
    _s.validateNumRange(
      'maxConcurrentSessions',
      maxConcurrentSessions,
      1,
      5000,
    );
    final $payload = <String, dynamic>{
      if (authenticationType != null)
        'authenticationType': authenticationType.value,
      if (displayName != null) 'displayName': displayName,
      if (instanceType != null) 'instanceType': instanceType.value,
      if (maxConcurrentSessions != null)
        'maxConcurrentSessions': maxConcurrentSessions,
      if (portalCustomDomain != null) 'portalCustomDomain': portalCustomDomain,
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

  /// Deletes a web portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves a list or web portals.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
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

  /// Associates a browser settings resource with a web portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Associates a data protection settings resource with a web portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataProtectionSettingsArn] :
  /// The ARN of the data protection settings.
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  Future<AssociateDataProtectionSettingsResponse>
      associateDataProtectionSettings({
    required String dataProtectionSettingsArn,
    required String portalArn,
  }) async {
    final $query = <String, List<String>>{
      'dataProtectionSettingsArn': [dataProtectionSettingsArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}/dataProtectionSettings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AssociateDataProtectionSettingsResponse.fromJson(response);
  }

  /// Associates an IP access settings resource with a web portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Associates a session logger with a portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [portalArn] :
  /// The ARN of the portal to associate to the session logger ARN.
  ///
  /// Parameter [sessionLoggerArn] :
  /// The ARN of the session logger to associate to the portal ARN.
  Future<AssociateSessionLoggerResponse> associateSessionLogger({
    required String portalArn,
    required String sessionLoggerArn,
  }) async {
    final $query = <String, List<String>>{
      'sessionLoggerArn': [sessionLoggerArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}/sessionLogger',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AssociateSessionLoggerResponse.fromJson(response);
  }

  /// Associates a trust store with a web portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Disassociates browser settings from a web portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Disassociates data protection settings from a web portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [portalArn] :
  /// The ARN of the web portal.
  Future<void> disassociateDataProtectionSettings({
    required String portalArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}/dataProtectionSettings',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates IP access settings from a web portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Disassociates a session logger from a portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [portalArn] :
  /// The ARN of the portal to disassociate from the a session logger.
  Future<void> disassociateSessionLogger({
    required String portalArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/portals/${portalArn.split('/').map(Uri.encodeComponent).join('/')}/sessionLogger',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a trust store from a web portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Gets the service provider metadata.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Creates a session logger.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [eventFilter] :
  /// The filter that specifies the events to monitor.
  ///
  /// Parameter [logConfiguration] :
  /// The configuration that specifies where logs are delivered.
  ///
  /// Parameter [additionalEncryptionContext] :
  /// The additional encryption context of the session logger.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, subsequent retries with the same client token
  /// returns the result from the original successful request. If you do not
  /// specify a client token, one is automatically generated by the AWS SDK.
  ///
  /// Parameter [customerManagedKey] :
  /// The custom managed key of the session logger.
  ///
  /// Parameter [displayName] :
  /// The human-readable display name for the session logger resource.
  ///
  /// Parameter [tags] :
  /// The tags to add to the session logger.
  Future<CreateSessionLoggerResponse> createSessionLogger({
    required EventFilter eventFilter,
    required LogConfiguration logConfiguration,
    Map<String, String>? additionalEncryptionContext,
    String? clientToken,
    String? customerManagedKey,
    String? displayName,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'eventFilter': eventFilter,
      'logConfiguration': logConfiguration,
      if (additionalEncryptionContext != null)
        'additionalEncryptionContext': additionalEncryptionContext,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (customerManagedKey != null) 'customerManagedKey': customerManagedKey,
      if (displayName != null) 'displayName': displayName,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sessionLoggers',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSessionLoggerResponse.fromJson(response);
  }

  /// Gets details about a specific session logger resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sessionLoggerArn] :
  /// The ARN of the session logger.
  Future<GetSessionLoggerResponse> getSessionLogger({
    required String sessionLoggerArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sessionLoggers/${sessionLoggerArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSessionLoggerResponse.fromJson(response);
  }

  /// Updates the details of a session logger.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sessionLoggerArn] :
  /// The ARN of the session logger to update.
  ///
  /// Parameter [displayName] :
  /// The updated display name.
  ///
  /// Parameter [eventFilter] :
  /// The updated eventFilter.
  ///
  /// Parameter [logConfiguration] :
  /// The updated logConfiguration.
  Future<UpdateSessionLoggerResponse> updateSessionLogger({
    required String sessionLoggerArn,
    String? displayName,
    EventFilter? eventFilter,
    LogConfiguration? logConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      if (displayName != null) 'displayName': displayName,
      if (eventFilter != null) 'eventFilter': eventFilter,
      if (logConfiguration != null) 'logConfiguration': logConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sessionLoggers/${sessionLoggerArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSessionLoggerResponse.fromJson(response);
  }

  /// Deletes a session logger resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sessionLoggerArn] :
  /// The ARN of the session logger.
  Future<void> deleteSessionLogger({
    required String sessionLoggerArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/sessionLoggers/${sessionLoggerArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all available session logger resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be included in the next page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<ListSessionLoggersResponse> listSessionLoggers({
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
      requestUri: '/sessionLoggers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSessionLoggersResponse.fromJson(response);
  }

  /// Creates a trust store that can be associated with a web portal. A trust
  /// store contains certificate authority (CA) certificates. Once associated
  /// with a web portal, the browser in a streaming session will recognize
  /// certificates that have been issued using any of the CAs in the trust
  /// store. If your organization has internal websites that use certificates
  /// issued by private CAs, you should add the private CA certificate to the
  /// trust store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Gets the trust store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Updates the trust store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
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

  /// Deletes the trust store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves a list of trust stores.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
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

  /// Gets the trust store certificate.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Retrieves a list of trust store certificates.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Creates a user access logging settings resource that can be associated
  /// with a web portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Gets user access logging settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Updates the user access logging settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Deletes user access logging settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves a list of user access logging settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
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

  /// Creates a user settings resource that can be associated with a web portal.
  /// Once associated with a web portal, user settings control how users can
  /// transfer data between a streaming session and the their local devices.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// Parameter [brandingConfigurationInput] :
  /// The branding configuration input that customizes the appearance of the web
  /// portal for end users. This includes a custom logo, favicon, localized
  /// strings, color theme, and optionally a wallpaper and terms of service.
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
  /// Parameter [deepLinkAllowed] :
  /// Specifies whether the user can use deep links that open automatically when
  /// connecting to a session.
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
  ///
  /// Parameter [toolbarConfiguration] :
  /// The configuration of the toolbar. This allows administrators to select the
  /// toolbar type and visual mode, set maximum display resolution for sessions,
  /// and choose which items are visible to end users during their sessions. If
  /// administrators do not modify these settings, end users retain control over
  /// their toolbar preferences.
  ///
  /// Parameter [webAuthnAllowed] :
  /// Specifies whether the user can use WebAuthn redirection for passwordless
  /// login to websites within the streaming session.
  Future<CreateUserSettingsResponse> createUserSettings({
    required EnabledType copyAllowed,
    required EnabledType downloadAllowed,
    required EnabledType pasteAllowed,
    required EnabledType printAllowed,
    required EnabledType uploadAllowed,
    Map<String, String>? additionalEncryptionContext,
    BrandingConfigurationCreateInput? brandingConfigurationInput,
    String? clientToken,
    CookieSynchronizationConfiguration? cookieSynchronizationConfiguration,
    String? customerManagedKey,
    EnabledType? deepLinkAllowed,
    int? disconnectTimeoutInMinutes,
    int? idleDisconnectTimeoutInMinutes,
    List<Tag>? tags,
    ToolbarConfiguration? toolbarConfiguration,
    EnabledType? webAuthnAllowed,
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
      'copyAllowed': copyAllowed.value,
      'downloadAllowed': downloadAllowed.value,
      'pasteAllowed': pasteAllowed.value,
      'printAllowed': printAllowed.value,
      'uploadAllowed': uploadAllowed.value,
      if (additionalEncryptionContext != null)
        'additionalEncryptionContext': additionalEncryptionContext,
      if (brandingConfigurationInput != null)
        'brandingConfigurationInput': brandingConfigurationInput,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (cookieSynchronizationConfiguration != null)
        'cookieSynchronizationConfiguration':
            cookieSynchronizationConfiguration,
      if (customerManagedKey != null) 'customerManagedKey': customerManagedKey,
      if (deepLinkAllowed != null) 'deepLinkAllowed': deepLinkAllowed.value,
      if (disconnectTimeoutInMinutes != null)
        'disconnectTimeoutInMinutes': disconnectTimeoutInMinutes,
      if (idleDisconnectTimeoutInMinutes != null)
        'idleDisconnectTimeoutInMinutes': idleDisconnectTimeoutInMinutes,
      if (tags != null) 'tags': tags,
      if (toolbarConfiguration != null)
        'toolbarConfiguration': toolbarConfiguration,
      if (webAuthnAllowed != null) 'webAuthnAllowed': webAuthnAllowed.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/userSettings',
      exceptionFnMap: _exceptionFns,
    );
    return CreateUserSettingsResponse.fromJson(response);
  }

  /// Gets user settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Updates the user settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [userSettingsArn] :
  /// The ARN of the user settings.
  ///
  /// Parameter [brandingConfigurationInput] :
  /// The branding configuration that customizes the appearance of the web
  /// portal for end users. When updating user settings without an existing
  /// branding configuration, all fields (logo, favicon, localized strings, and
  /// color theme) are required except for wallpaper and terms of service. When
  /// updating user settings with an existing branding configuration, all fields
  /// are optional.
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
  /// Parameter [deepLinkAllowed] :
  /// Specifies whether the user can use deep links that open automatically when
  /// connecting to a session.
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
  /// Parameter [toolbarConfiguration] :
  /// The configuration of the toolbar. This allows administrators to select the
  /// toolbar type and visual mode, set maximum display resolution for sessions,
  /// and choose which items are visible to end users during their sessions. If
  /// administrators do not modify these settings, end users retain control over
  /// their toolbar preferences.
  ///
  /// Parameter [uploadAllowed] :
  /// Specifies whether the user can upload files from the local device to the
  /// streaming session.
  ///
  /// Parameter [webAuthnAllowed] :
  /// Specifies whether the user can use WebAuthn redirection for passwordless
  /// login to websites within the streaming session.
  Future<UpdateUserSettingsResponse> updateUserSettings({
    required String userSettingsArn,
    BrandingConfigurationUpdateInput? brandingConfigurationInput,
    String? clientToken,
    CookieSynchronizationConfiguration? cookieSynchronizationConfiguration,
    EnabledType? copyAllowed,
    EnabledType? deepLinkAllowed,
    int? disconnectTimeoutInMinutes,
    EnabledType? downloadAllowed,
    int? idleDisconnectTimeoutInMinutes,
    EnabledType? pasteAllowed,
    EnabledType? printAllowed,
    ToolbarConfiguration? toolbarConfiguration,
    EnabledType? uploadAllowed,
    EnabledType? webAuthnAllowed,
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
      if (brandingConfigurationInput != null)
        'brandingConfigurationInput': brandingConfigurationInput,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (cookieSynchronizationConfiguration != null)
        'cookieSynchronizationConfiguration':
            cookieSynchronizationConfiguration,
      if (copyAllowed != null) 'copyAllowed': copyAllowed.value,
      if (deepLinkAllowed != null) 'deepLinkAllowed': deepLinkAllowed.value,
      if (disconnectTimeoutInMinutes != null)
        'disconnectTimeoutInMinutes': disconnectTimeoutInMinutes,
      if (downloadAllowed != null) 'downloadAllowed': downloadAllowed.value,
      if (idleDisconnectTimeoutInMinutes != null)
        'idleDisconnectTimeoutInMinutes': idleDisconnectTimeoutInMinutes,
      if (pasteAllowed != null) 'pasteAllowed': pasteAllowed.value,
      if (printAllowed != null) 'printAllowed': printAllowed.value,
      if (toolbarConfiguration != null)
        'toolbarConfiguration': toolbarConfiguration,
      if (uploadAllowed != null) 'uploadAllowed': uploadAllowed.value,
      if (webAuthnAllowed != null) 'webAuthnAllowed': webAuthnAllowed.value,
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

  /// Deletes user settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves a list of user settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
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
}

/// @nodoc
class ExpireSessionResponse {
  ExpireSessionResponse();

  factory ExpireSessionResponse.fromJson(Map<String, dynamic> _) {
    return ExpireSessionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetSessionResponse {
  /// The sessions in a list.
  final Session? session;

  GetSessionResponse({
    this.session,
  });

  factory GetSessionResponse.fromJson(Map<String, dynamic> json) {
    return GetSessionResponse(
      session: json['session'] != null
          ? Session.fromJson(json['session'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final session = this.session;
    return {
      if (session != null) 'session': session,
    };
  }
}

/// @nodoc
class ListSessionsResponse {
  /// The sessions in a list.
  final List<SessionSummary> sessions;

  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  ListSessionsResponse({
    required this.sessions,
    this.nextToken,
  });

  factory ListSessionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSessionsResponse(
      sessions: ((json['sessions'] as List?) ?? const [])
          .nonNulls
          .map((e) => SessionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sessions = this.sessions;
    final nextToken = this.nextToken;
    return {
      'sessions': sessions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The tags of the resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as List?)
          ?.nonNulls
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

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateBrowserSettingsResponse {
  /// The ARN of the browser settings.
  final String browserSettingsArn;

  CreateBrowserSettingsResponse({
    required this.browserSettingsArn,
  });

  factory CreateBrowserSettingsResponse.fromJson(Map<String, dynamic> json) {
    return CreateBrowserSettingsResponse(
      browserSettingsArn: (json['browserSettingsArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final browserSettingsArn = this.browserSettingsArn;
    return {
      'browserSettingsArn': browserSettingsArn,
    };
  }
}

/// @nodoc
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

/// @nodoc
class UpdateBrowserSettingsResponse {
  /// The browser settings.
  final BrowserSettings browserSettings;

  UpdateBrowserSettingsResponse({
    required this.browserSettings,
  });

  factory UpdateBrowserSettingsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBrowserSettingsResponse(
      browserSettings: BrowserSettings.fromJson(
          (json['browserSettings'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final browserSettings = this.browserSettings;
    return {
      'browserSettings': browserSettings,
    };
  }
}

/// @nodoc
class DeleteBrowserSettingsResponse {
  DeleteBrowserSettingsResponse();

  factory DeleteBrowserSettingsResponse.fromJson(Map<String, dynamic> _) {
    return DeleteBrowserSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class CreateDataProtectionSettingsResponse {
  /// The ARN of the data protection settings resource.
  final String dataProtectionSettingsArn;

  CreateDataProtectionSettingsResponse({
    required this.dataProtectionSettingsArn,
  });

  factory CreateDataProtectionSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateDataProtectionSettingsResponse(
      dataProtectionSettingsArn:
          (json['dataProtectionSettingsArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final dataProtectionSettingsArn = this.dataProtectionSettingsArn;
    return {
      'dataProtectionSettingsArn': dataProtectionSettingsArn,
    };
  }
}

/// @nodoc
class GetDataProtectionSettingsResponse {
  /// The data protection settings.
  final DataProtectionSettings? dataProtectionSettings;

  GetDataProtectionSettingsResponse({
    this.dataProtectionSettings,
  });

  factory GetDataProtectionSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDataProtectionSettingsResponse(
      dataProtectionSettings: json['dataProtectionSettings'] != null
          ? DataProtectionSettings.fromJson(
              json['dataProtectionSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataProtectionSettings = this.dataProtectionSettings;
    return {
      if (dataProtectionSettings != null)
        'dataProtectionSettings': dataProtectionSettings,
    };
  }
}

/// @nodoc
class UpdateDataProtectionSettingsResponse {
  /// The data protection settings.
  final DataProtectionSettings dataProtectionSettings;

  UpdateDataProtectionSettingsResponse({
    required this.dataProtectionSettings,
  });

  factory UpdateDataProtectionSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateDataProtectionSettingsResponse(
      dataProtectionSettings: DataProtectionSettings.fromJson(
          (json['dataProtectionSettings'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final dataProtectionSettings = this.dataProtectionSettings;
    return {
      'dataProtectionSettings': dataProtectionSettings,
    };
  }
}

/// @nodoc
class DeleteDataProtectionSettingsResponse {
  DeleteDataProtectionSettingsResponse();

  factory DeleteDataProtectionSettingsResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteDataProtectionSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListDataProtectionSettingsResponse {
  /// The data protection settings.
  final List<DataProtectionSettingsSummary>? dataProtectionSettings;

  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  ListDataProtectionSettingsResponse({
    this.dataProtectionSettings,
    this.nextToken,
  });

  factory ListDataProtectionSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDataProtectionSettingsResponse(
      dataProtectionSettings: (json['dataProtectionSettings'] as List?)
          ?.nonNulls
          .map((e) =>
              DataProtectionSettingsSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataProtectionSettings = this.dataProtectionSettings;
    final nextToken = this.nextToken;
    return {
      if (dataProtectionSettings != null)
        'dataProtectionSettings': dataProtectionSettings,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateIdentityProviderResponse {
  /// The ARN of the identity provider.
  final String identityProviderArn;

  CreateIdentityProviderResponse({
    required this.identityProviderArn,
  });

  factory CreateIdentityProviderResponse.fromJson(Map<String, dynamic> json) {
    return CreateIdentityProviderResponse(
      identityProviderArn: (json['identityProviderArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final identityProviderArn = this.identityProviderArn;
    return {
      'identityProviderArn': identityProviderArn,
    };
  }
}

/// @nodoc
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

/// @nodoc
class UpdateIdentityProviderResponse {
  /// The identity provider.
  final IdentityProvider identityProvider;

  UpdateIdentityProviderResponse({
    required this.identityProvider,
  });

  factory UpdateIdentityProviderResponse.fromJson(Map<String, dynamic> json) {
    return UpdateIdentityProviderResponse(
      identityProvider: IdentityProvider.fromJson(
          (json['identityProvider'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final identityProvider = this.identityProvider;
    return {
      'identityProvider': identityProvider,
    };
  }
}

/// @nodoc
class DeleteIdentityProviderResponse {
  DeleteIdentityProviderResponse();

  factory DeleteIdentityProviderResponse.fromJson(Map<String, dynamic> _) {
    return DeleteIdentityProviderResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class CreateIpAccessSettingsResponse {
  /// The ARN of the IP access settings resource.
  final String ipAccessSettingsArn;

  CreateIpAccessSettingsResponse({
    required this.ipAccessSettingsArn,
  });

  factory CreateIpAccessSettingsResponse.fromJson(Map<String, dynamic> json) {
    return CreateIpAccessSettingsResponse(
      ipAccessSettingsArn: (json['ipAccessSettingsArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final ipAccessSettingsArn = this.ipAccessSettingsArn;
    return {
      'ipAccessSettingsArn': ipAccessSettingsArn,
    };
  }
}

/// @nodoc
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

/// @nodoc
class UpdateIpAccessSettingsResponse {
  /// The IP access settings.
  final IpAccessSettings ipAccessSettings;

  UpdateIpAccessSettingsResponse({
    required this.ipAccessSettings,
  });

  factory UpdateIpAccessSettingsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateIpAccessSettingsResponse(
      ipAccessSettings: IpAccessSettings.fromJson(
          (json['ipAccessSettings'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final ipAccessSettings = this.ipAccessSettings;
    return {
      'ipAccessSettings': ipAccessSettings,
    };
  }
}

/// @nodoc
class DeleteIpAccessSettingsResponse {
  DeleteIpAccessSettingsResponse();

  factory DeleteIpAccessSettingsResponse.fromJson(Map<String, dynamic> _) {
    return DeleteIpAccessSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class CreateNetworkSettingsResponse {
  /// The ARN of the network settings.
  final String networkSettingsArn;

  CreateNetworkSettingsResponse({
    required this.networkSettingsArn,
  });

  factory CreateNetworkSettingsResponse.fromJson(Map<String, dynamic> json) {
    return CreateNetworkSettingsResponse(
      networkSettingsArn: (json['networkSettingsArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final networkSettingsArn = this.networkSettingsArn;
    return {
      'networkSettingsArn': networkSettingsArn,
    };
  }
}

/// @nodoc
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

/// @nodoc
class UpdateNetworkSettingsResponse {
  /// The network settings.
  final NetworkSettings networkSettings;

  UpdateNetworkSettingsResponse({
    required this.networkSettings,
  });

  factory UpdateNetworkSettingsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateNetworkSettingsResponse(
      networkSettings: NetworkSettings.fromJson(
          (json['networkSettings'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final networkSettings = this.networkSettings;
    return {
      'networkSettings': networkSettings,
    };
  }
}

/// @nodoc
class DeleteNetworkSettingsResponse {
  DeleteNetworkSettingsResponse();

  factory DeleteNetworkSettingsResponse.fromJson(Map<String, dynamic> _) {
    return DeleteNetworkSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
      portalArn: (json['portalArn'] as String?) ?? '',
      portalEndpoint: (json['portalEndpoint'] as String?) ?? '',
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
class DeletePortalResponse {
  DeletePortalResponse();

  factory DeletePortalResponse.fromJson(Map<String, dynamic> _) {
    return DeletePortalResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
      browserSettingsArn: (json['browserSettingsArn'] as String?) ?? '',
      portalArn: (json['portalArn'] as String?) ?? '',
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

/// @nodoc
class AssociateDataProtectionSettingsResponse {
  /// The ARN of the data protection settings resource.
  final String dataProtectionSettingsArn;

  /// The ARN of the web portal.
  final String portalArn;

  AssociateDataProtectionSettingsResponse({
    required this.dataProtectionSettingsArn,
    required this.portalArn,
  });

  factory AssociateDataProtectionSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateDataProtectionSettingsResponse(
      dataProtectionSettingsArn:
          (json['dataProtectionSettingsArn'] as String?) ?? '',
      portalArn: (json['portalArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final dataProtectionSettingsArn = this.dataProtectionSettingsArn;
    final portalArn = this.portalArn;
    return {
      'dataProtectionSettingsArn': dataProtectionSettingsArn,
      'portalArn': portalArn,
    };
  }
}

/// @nodoc
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
      ipAccessSettingsArn: (json['ipAccessSettingsArn'] as String?) ?? '',
      portalArn: (json['portalArn'] as String?) ?? '',
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

/// @nodoc
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
      networkSettingsArn: (json['networkSettingsArn'] as String?) ?? '',
      portalArn: (json['portalArn'] as String?) ?? '',
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

/// @nodoc
class AssociateSessionLoggerResponse {
  /// The ARN of the portal.
  final String portalArn;

  /// The ARN of the session logger.
  final String sessionLoggerArn;

  AssociateSessionLoggerResponse({
    required this.portalArn,
    required this.sessionLoggerArn,
  });

  factory AssociateSessionLoggerResponse.fromJson(Map<String, dynamic> json) {
    return AssociateSessionLoggerResponse(
      portalArn: (json['portalArn'] as String?) ?? '',
      sessionLoggerArn: (json['sessionLoggerArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final portalArn = this.portalArn;
    final sessionLoggerArn = this.sessionLoggerArn;
    return {
      'portalArn': portalArn,
      'sessionLoggerArn': sessionLoggerArn,
    };
  }
}

/// @nodoc
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
      portalArn: (json['portalArn'] as String?) ?? '',
      trustStoreArn: (json['trustStoreArn'] as String?) ?? '',
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

/// @nodoc
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
      portalArn: (json['portalArn'] as String?) ?? '',
      userAccessLoggingSettingsArn:
          (json['userAccessLoggingSettingsArn'] as String?) ?? '',
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

/// @nodoc
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
      portalArn: (json['portalArn'] as String?) ?? '',
      userSettingsArn: (json['userSettingsArn'] as String?) ?? '',
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

/// @nodoc
class DisassociateBrowserSettingsResponse {
  DisassociateBrowserSettingsResponse();

  factory DisassociateBrowserSettingsResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateBrowserSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DisassociateDataProtectionSettingsResponse {
  DisassociateDataProtectionSettingsResponse();

  factory DisassociateDataProtectionSettingsResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateDataProtectionSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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

/// @nodoc
class DisassociateNetworkSettingsResponse {
  DisassociateNetworkSettingsResponse();

  factory DisassociateNetworkSettingsResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateNetworkSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DisassociateSessionLoggerResponse {
  DisassociateSessionLoggerResponse();

  factory DisassociateSessionLoggerResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateSessionLoggerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DisassociateTrustStoreResponse {
  DisassociateTrustStoreResponse();

  factory DisassociateTrustStoreResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateTrustStoreResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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

/// @nodoc
class DisassociateUserSettingsResponse {
  DisassociateUserSettingsResponse();

  factory DisassociateUserSettingsResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateUserSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
      portalArn: (json['portalArn'] as String?) ?? '',
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

/// @nodoc
class CreateSessionLoggerResponse {
  /// The ARN of the session logger.
  final String sessionLoggerArn;

  CreateSessionLoggerResponse({
    required this.sessionLoggerArn,
  });

  factory CreateSessionLoggerResponse.fromJson(Map<String, dynamic> json) {
    return CreateSessionLoggerResponse(
      sessionLoggerArn: (json['sessionLoggerArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final sessionLoggerArn = this.sessionLoggerArn;
    return {
      'sessionLoggerArn': sessionLoggerArn,
    };
  }
}

/// @nodoc
class GetSessionLoggerResponse {
  /// The session logger details.
  final SessionLogger? sessionLogger;

  GetSessionLoggerResponse({
    this.sessionLogger,
  });

  factory GetSessionLoggerResponse.fromJson(Map<String, dynamic> json) {
    return GetSessionLoggerResponse(
      sessionLogger: json['sessionLogger'] != null
          ? SessionLogger.fromJson(
              json['sessionLogger'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionLogger = this.sessionLogger;
    return {
      if (sessionLogger != null) 'sessionLogger': sessionLogger,
    };
  }
}

/// @nodoc
class UpdateSessionLoggerResponse {
  /// The updated details of the session logger.
  final SessionLogger sessionLogger;

  UpdateSessionLoggerResponse({
    required this.sessionLogger,
  });

  factory UpdateSessionLoggerResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSessionLoggerResponse(
      sessionLogger: SessionLogger.fromJson(
          (json['sessionLogger'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final sessionLogger = this.sessionLogger;
    return {
      'sessionLogger': sessionLogger,
    };
  }
}

/// @nodoc
class DeleteSessionLoggerResponse {
  DeleteSessionLoggerResponse();

  factory DeleteSessionLoggerResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSessionLoggerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListSessionLoggersResponse {
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  /// The list of session loggers, including summaries of their details.
  final List<SessionLoggerSummary>? sessionLoggers;

  ListSessionLoggersResponse({
    this.nextToken,
    this.sessionLoggers,
  });

  factory ListSessionLoggersResponse.fromJson(Map<String, dynamic> json) {
    return ListSessionLoggersResponse(
      nextToken: json['nextToken'] as String?,
      sessionLoggers: (json['sessionLoggers'] as List?)
          ?.nonNulls
          .map((e) => SessionLoggerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sessionLoggers = this.sessionLoggers;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (sessionLoggers != null) 'sessionLoggers': sessionLoggers,
    };
  }
}

/// @nodoc
class CreateTrustStoreResponse {
  /// The ARN of the trust store.
  final String trustStoreArn;

  CreateTrustStoreResponse({
    required this.trustStoreArn,
  });

  factory CreateTrustStoreResponse.fromJson(Map<String, dynamic> json) {
    return CreateTrustStoreResponse(
      trustStoreArn: (json['trustStoreArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final trustStoreArn = this.trustStoreArn;
    return {
      'trustStoreArn': trustStoreArn,
    };
  }
}

/// @nodoc
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

/// @nodoc
class UpdateTrustStoreResponse {
  /// The ARN of the trust store.
  final String trustStoreArn;

  UpdateTrustStoreResponse({
    required this.trustStoreArn,
  });

  factory UpdateTrustStoreResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTrustStoreResponse(
      trustStoreArn: (json['trustStoreArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final trustStoreArn = this.trustStoreArn;
    return {
      'trustStoreArn': trustStoreArn,
    };
  }
}

/// @nodoc
class DeleteTrustStoreResponse {
  DeleteTrustStoreResponse();

  factory DeleteTrustStoreResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTrustStoreResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
      trustStoreArn: (json['trustStoreArn'] as String?) ?? '',
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

/// @nodoc
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
      trustStoreArn: (json['trustStoreArn'] as String?) ?? '',
      certificateList: (json['certificateList'] as List?)
          ?.nonNulls
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

/// @nodoc
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
          (json['userAccessLoggingSettingsArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final userAccessLoggingSettingsArn = this.userAccessLoggingSettingsArn;
    return {
      'userAccessLoggingSettingsArn': userAccessLoggingSettingsArn,
    };
  }
}

/// @nodoc
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

/// @nodoc
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
          (json['userAccessLoggingSettings'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final userAccessLoggingSettings = this.userAccessLoggingSettings;
    return {
      'userAccessLoggingSettings': userAccessLoggingSettings,
    };
  }
}

/// @nodoc
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class CreateUserSettingsResponse {
  /// The ARN of the user settings.
  final String userSettingsArn;

  CreateUserSettingsResponse({
    required this.userSettingsArn,
  });

  factory CreateUserSettingsResponse.fromJson(Map<String, dynamic> json) {
    return CreateUserSettingsResponse(
      userSettingsArn: (json['userSettingsArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final userSettingsArn = this.userSettingsArn;
    return {
      'userSettingsArn': userSettingsArn,
    };
  }
}

/// @nodoc
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

/// @nodoc
class UpdateUserSettingsResponse {
  /// The user settings.
  final UserSettings userSettings;

  UpdateUserSettingsResponse({
    required this.userSettings,
  });

  factory UpdateUserSettingsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateUserSettingsResponse(
      userSettings: UserSettings.fromJson(
          (json['userSettings'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final userSettings = this.userSettings;
    return {
      'userSettings': userSettings,
    };
  }
}

/// @nodoc
class DeleteUserSettingsResponse {
  DeleteUserSettingsResponse();

  factory DeleteUserSettingsResponse.fromJson(Map<String, dynamic> _) {
    return DeleteUserSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// The summary of user settings.
///
/// @nodoc
class UserSettingsSummary {
  /// The ARN of the user settings.
  final String userSettingsArn;

  /// The branding configuration output that customizes the appearance of the web
  /// portal for end users.
  final BrandingConfiguration? brandingConfiguration;

  /// The configuration that specifies which cookies should be synchronized from
  /// the end user's local browser to the remote browser.
  final CookieSynchronizationConfiguration? cookieSynchronizationConfiguration;

  /// Specifies whether the user can copy text from the streaming session to the
  /// local device.
  final EnabledType? copyAllowed;

  /// Specifies whether the user can use deep links that open automatically when
  /// connecting to a session.
  final EnabledType? deepLinkAllowed;

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

  /// The configuration of the toolbar. This allows administrators to select the
  /// toolbar type and visual mode, set maximum display resolution for sessions,
  /// and choose which items are visible to end users during their sessions. If
  /// administrators do not modify these settings, end users retain control over
  /// their toolbar preferences.
  final ToolbarConfiguration? toolbarConfiguration;

  /// Specifies whether the user can upload files from the local device to the
  /// streaming session.
  final EnabledType? uploadAllowed;

  /// Specifies whether the user can use WebAuthn redirection for passwordless
  /// login to websites within the streaming session.
  final EnabledType? webAuthnAllowed;

  UserSettingsSummary({
    required this.userSettingsArn,
    this.brandingConfiguration,
    this.cookieSynchronizationConfiguration,
    this.copyAllowed,
    this.deepLinkAllowed,
    this.disconnectTimeoutInMinutes,
    this.downloadAllowed,
    this.idleDisconnectTimeoutInMinutes,
    this.pasteAllowed,
    this.printAllowed,
    this.toolbarConfiguration,
    this.uploadAllowed,
    this.webAuthnAllowed,
  });

  factory UserSettingsSummary.fromJson(Map<String, dynamic> json) {
    return UserSettingsSummary(
      userSettingsArn: (json['userSettingsArn'] as String?) ?? '',
      brandingConfiguration: json['brandingConfiguration'] != null
          ? BrandingConfiguration.fromJson(
              json['brandingConfiguration'] as Map<String, dynamic>)
          : null,
      cookieSynchronizationConfiguration:
          json['cookieSynchronizationConfiguration'] != null
              ? CookieSynchronizationConfiguration.fromJson(
                  json['cookieSynchronizationConfiguration']
                      as Map<String, dynamic>)
              : null,
      copyAllowed:
          (json['copyAllowed'] as String?)?.let(EnabledType.fromString),
      deepLinkAllowed:
          (json['deepLinkAllowed'] as String?)?.let(EnabledType.fromString),
      disconnectTimeoutInMinutes: json['disconnectTimeoutInMinutes'] as int?,
      downloadAllowed:
          (json['downloadAllowed'] as String?)?.let(EnabledType.fromString),
      idleDisconnectTimeoutInMinutes:
          json['idleDisconnectTimeoutInMinutes'] as int?,
      pasteAllowed:
          (json['pasteAllowed'] as String?)?.let(EnabledType.fromString),
      printAllowed:
          (json['printAllowed'] as String?)?.let(EnabledType.fromString),
      toolbarConfiguration: json['toolbarConfiguration'] != null
          ? ToolbarConfiguration.fromJson(
              json['toolbarConfiguration'] as Map<String, dynamic>)
          : null,
      uploadAllowed:
          (json['uploadAllowed'] as String?)?.let(EnabledType.fromString),
      webAuthnAllowed:
          (json['webAuthnAllowed'] as String?)?.let(EnabledType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final userSettingsArn = this.userSettingsArn;
    final brandingConfiguration = this.brandingConfiguration;
    final cookieSynchronizationConfiguration =
        this.cookieSynchronizationConfiguration;
    final copyAllowed = this.copyAllowed;
    final deepLinkAllowed = this.deepLinkAllowed;
    final disconnectTimeoutInMinutes = this.disconnectTimeoutInMinutes;
    final downloadAllowed = this.downloadAllowed;
    final idleDisconnectTimeoutInMinutes = this.idleDisconnectTimeoutInMinutes;
    final pasteAllowed = this.pasteAllowed;
    final printAllowed = this.printAllowed;
    final toolbarConfiguration = this.toolbarConfiguration;
    final uploadAllowed = this.uploadAllowed;
    final webAuthnAllowed = this.webAuthnAllowed;
    return {
      'userSettingsArn': userSettingsArn,
      if (brandingConfiguration != null)
        'brandingConfiguration': brandingConfiguration,
      if (cookieSynchronizationConfiguration != null)
        'cookieSynchronizationConfiguration':
            cookieSynchronizationConfiguration,
      if (copyAllowed != null) 'copyAllowed': copyAllowed.value,
      if (deepLinkAllowed != null) 'deepLinkAllowed': deepLinkAllowed.value,
      if (disconnectTimeoutInMinutes != null)
        'disconnectTimeoutInMinutes': disconnectTimeoutInMinutes,
      if (downloadAllowed != null) 'downloadAllowed': downloadAllowed.value,
      if (idleDisconnectTimeoutInMinutes != null)
        'idleDisconnectTimeoutInMinutes': idleDisconnectTimeoutInMinutes,
      if (pasteAllowed != null) 'pasteAllowed': pasteAllowed.value,
      if (printAllowed != null) 'printAllowed': printAllowed.value,
      if (toolbarConfiguration != null)
        'toolbarConfiguration': toolbarConfiguration,
      if (uploadAllowed != null) 'uploadAllowed': uploadAllowed.value,
      if (webAuthnAllowed != null) 'webAuthnAllowed': webAuthnAllowed.value,
    };
  }
}

/// @nodoc
class EnabledType {
  static const disabled = EnabledType._('Disabled');
  static const enabled = EnabledType._('Enabled');

  final String value;

  const EnabledType._(this.value);

  static const values = [disabled, enabled];

  static EnabledType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EnabledType._(value));

  @override
  bool operator ==(other) => other is EnabledType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration that specifies which cookies should be synchronized from
/// the end user's local browser to the remote browser.
///
/// @nodoc
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
      allowlist: ((json['allowlist'] as List?) ?? const [])
          .nonNulls
          .map((e) => CookieSpecification.fromJson(e as Map<String, dynamic>))
          .toList(),
      blocklist: (json['blocklist'] as List?)
          ?.nonNulls
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

/// The configuration of the toolbar. This allows administrators to select the
/// toolbar type and visual mode, set maximum display resolution for sessions,
/// and choose which items are visible to end users during their sessions. If
/// administrators do not modify these settings, end users retain control over
/// their toolbar preferences.
///
/// @nodoc
class ToolbarConfiguration {
  /// The list of toolbar items to be hidden.
  final List<ToolbarItem>? hiddenToolbarItems;

  /// The maximum display resolution that is allowed for the session.
  final MaxDisplayResolution? maxDisplayResolution;

  /// The type of toolbar displayed during the session.
  final ToolbarType? toolbarType;

  /// The visual mode of the toolbar.
  final VisualMode? visualMode;

  ToolbarConfiguration({
    this.hiddenToolbarItems,
    this.maxDisplayResolution,
    this.toolbarType,
    this.visualMode,
  });

  factory ToolbarConfiguration.fromJson(Map<String, dynamic> json) {
    return ToolbarConfiguration(
      hiddenToolbarItems: (json['hiddenToolbarItems'] as List?)
          ?.nonNulls
          .map((e) => ToolbarItem.fromString((e as String)))
          .toList(),
      maxDisplayResolution: (json['maxDisplayResolution'] as String?)
          ?.let(MaxDisplayResolution.fromString),
      toolbarType:
          (json['toolbarType'] as String?)?.let(ToolbarType.fromString),
      visualMode: (json['visualMode'] as String?)?.let(VisualMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final hiddenToolbarItems = this.hiddenToolbarItems;
    final maxDisplayResolution = this.maxDisplayResolution;
    final toolbarType = this.toolbarType;
    final visualMode = this.visualMode;
    return {
      if (hiddenToolbarItems != null)
        'hiddenToolbarItems': hiddenToolbarItems.map((e) => e.value).toList(),
      if (maxDisplayResolution != null)
        'maxDisplayResolution': maxDisplayResolution.value,
      if (toolbarType != null) 'toolbarType': toolbarType.value,
      if (visualMode != null) 'visualMode': visualMode.value,
    };
  }
}

/// The branding configuration output including custom images metadata,
/// localized strings, color theme, and terms of service.
///
/// @nodoc
class BrandingConfiguration {
  /// The color theme for components on the web portal.
  final ColorTheme colorTheme;

  /// Metadata for the favicon image file, including the MIME type, file
  /// extension, and upload timestamp.
  final ImageMetadata favicon;

  /// A map of localized text strings for different languages, allowing the portal
  /// to display content in the user's preferred language.
  final Map<Locale, LocalizedBrandingStrings> localizedStrings;

  /// Metadata for the logo image file, including the MIME type, file extension,
  /// and upload timestamp.
  final ImageMetadata logo;

  /// The terms of service text in Markdown format that users must accept before
  /// accessing the portal.
  final String? termsOfService;

  /// Metadata for the wallpaper image file, including the MIME type, file
  /// extension, and upload timestamp.
  final ImageMetadata? wallpaper;

  BrandingConfiguration({
    required this.colorTheme,
    required this.favicon,
    required this.localizedStrings,
    required this.logo,
    this.termsOfService,
    this.wallpaper,
  });

  factory BrandingConfiguration.fromJson(Map<String, dynamic> json) {
    return BrandingConfiguration(
      colorTheme: ColorTheme.fromString((json['colorTheme'] as String?) ?? ''),
      favicon: ImageMetadata.fromJson(
          (json['favicon'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      localizedStrings: ((json['localizedStrings'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(Locale.fromString(k),
              LocalizedBrandingStrings.fromJson(e as Map<String, dynamic>))),
      logo: ImageMetadata.fromJson(
          (json['logo'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
      termsOfService: json['termsOfService'] as String?,
      wallpaper: json['wallpaper'] != null
          ? ImageMetadata.fromJson(json['wallpaper'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final colorTheme = this.colorTheme;
    final favicon = this.favicon;
    final localizedStrings = this.localizedStrings;
    final logo = this.logo;
    final termsOfService = this.termsOfService;
    final wallpaper = this.wallpaper;
    return {
      'colorTheme': colorTheme.value,
      'favicon': favicon,
      'localizedStrings': localizedStrings.map((k, e) => MapEntry(k.value, e)),
      'logo': logo,
      if (termsOfService != null) 'termsOfService': termsOfService,
      if (wallpaper != null) 'wallpaper': wallpaper,
    };
  }
}

/// Metadata information about an uploaded image file.
///
/// @nodoc
class ImageMetadata {
  /// The file extension of the image.
  final String fileExtension;

  /// The timestamp when the image was last uploaded.
  final DateTime lastUploadTimestamp;

  /// The MIME type of the image.
  final MimeType mimeType;

  ImageMetadata({
    required this.fileExtension,
    required this.lastUploadTimestamp,
    required this.mimeType,
  });

  factory ImageMetadata.fromJson(Map<String, dynamic> json) {
    return ImageMetadata(
      fileExtension: (json['fileExtension'] as String?) ?? '',
      lastUploadTimestamp:
          nonNullableTimeStampFromJson(json['lastUploadTimestamp'] ?? 0),
      mimeType: MimeType.fromString((json['mimeType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final fileExtension = this.fileExtension;
    final lastUploadTimestamp = this.lastUploadTimestamp;
    final mimeType = this.mimeType;
    return {
      'fileExtension': fileExtension,
      'lastUploadTimestamp': unixTimestampToJson(lastUploadTimestamp),
      'mimeType': mimeType.value,
    };
  }
}

/// @nodoc
class ColorTheme {
  static const light = ColorTheme._('Light');
  static const dark = ColorTheme._('Dark');

  final String value;

  const ColorTheme._(this.value);

  static const values = [light, dark];

  static ColorTheme fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ColorTheme._(value));

  @override
  bool operator ==(other) => other is ColorTheme && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Locale {
  static const deDe = Locale._('de-DE');
  static const enUs = Locale._('en-US');
  static const esEs = Locale._('es-ES');
  static const frFr = Locale._('fr-FR');
  static const idId = Locale._('id-ID');
  static const itIt = Locale._('it-IT');
  static const jaJp = Locale._('ja-JP');
  static const koKr = Locale._('ko-KR');
  static const ptBr = Locale._('pt-BR');
  static const zhCn = Locale._('zh-CN');
  static const zhTw = Locale._('zh-TW');

  final String value;

  const Locale._(this.value);

  static const values = [
    deDe,
    enUs,
    esEs,
    frFr,
    idId,
    itIt,
    jaJp,
    koKr,
    ptBr,
    zhCn,
    zhTw
  ];

  static Locale fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Locale._(value));

  @override
  bool operator ==(other) => other is Locale && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Localized text strings for a specific language that customize the web
/// portal.
///
/// @nodoc
class LocalizedBrandingStrings {
  /// The text displayed in the browser tab title.
  final String browserTabTitle;

  /// The welcome text displayed on the sign-in page.
  final String welcomeText;

  /// The text displayed on the contact button. This field is optional and
  /// defaults to "Contact us".
  final String? contactButtonText;

  /// A contact link URL. The URL must start with <code>https://</code> or
  /// <code>mailto:</code>. If not provided, the contact button will be hidden
  /// from the web portal screen.
  final String? contactLink;

  /// The text displayed during session loading. This field is optional and
  /// defaults to "Loading your session".
  final String? loadingText;

  /// The text displayed on the login button. This field is optional and defaults
  /// to "Sign In".
  final String? loginButtonText;

  /// The description text for the login section. This field is optional and
  /// defaults to "Sign in to your session".
  final String? loginDescription;

  /// The title text for the login section. This field is optional and defaults to
  /// "Sign In".
  final String? loginTitle;

  LocalizedBrandingStrings({
    required this.browserTabTitle,
    required this.welcomeText,
    this.contactButtonText,
    this.contactLink,
    this.loadingText,
    this.loginButtonText,
    this.loginDescription,
    this.loginTitle,
  });

  factory LocalizedBrandingStrings.fromJson(Map<String, dynamic> json) {
    return LocalizedBrandingStrings(
      browserTabTitle: (json['browserTabTitle'] as String?) ?? '',
      welcomeText: (json['welcomeText'] as String?) ?? '',
      contactButtonText: json['contactButtonText'] as String?,
      contactLink: json['contactLink'] as String?,
      loadingText: json['loadingText'] as String?,
      loginButtonText: json['loginButtonText'] as String?,
      loginDescription: json['loginDescription'] as String?,
      loginTitle: json['loginTitle'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final browserTabTitle = this.browserTabTitle;
    final welcomeText = this.welcomeText;
    final contactButtonText = this.contactButtonText;
    final contactLink = this.contactLink;
    final loadingText = this.loadingText;
    final loginButtonText = this.loginButtonText;
    final loginDescription = this.loginDescription;
    final loginTitle = this.loginTitle;
    return {
      'browserTabTitle': browserTabTitle,
      'welcomeText': welcomeText,
      if (contactButtonText != null) 'contactButtonText': contactButtonText,
      if (contactLink != null) 'contactLink': contactLink,
      if (loadingText != null) 'loadingText': loadingText,
      if (loginButtonText != null) 'loginButtonText': loginButtonText,
      if (loginDescription != null) 'loginDescription': loginDescription,
      if (loginTitle != null) 'loginTitle': loginTitle,
    };
  }
}

/// @nodoc
class MimeType {
  static const imagePng = MimeType._('image/png');
  static const imageJpeg = MimeType._('image/jpeg');
  static const imageXIcon = MimeType._('image/x-icon');

  final String value;

  const MimeType._(this.value);

  static const values = [imagePng, imageJpeg, imageXIcon];

  static MimeType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MimeType._(value));

  @override
  bool operator ==(other) => other is MimeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ToolbarType {
  static const floating = ToolbarType._('Floating');
  static const docked = ToolbarType._('Docked');

  final String value;

  const ToolbarType._(this.value);

  static const values = [floating, docked];

  static ToolbarType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ToolbarType._(value));

  @override
  bool operator ==(other) => other is ToolbarType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class VisualMode {
  static const dark = VisualMode._('Dark');
  static const light = VisualMode._('Light');

  final String value;

  const VisualMode._(this.value);

  static const values = [dark, light];

  static VisualMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => VisualMode._(value));

  @override
  bool operator ==(other) => other is VisualMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MaxDisplayResolution {
  static const size4096X2160 = MaxDisplayResolution._('size4096X2160');
  static const size3840X2160 = MaxDisplayResolution._('size3840X2160');
  static const size3440X1440 = MaxDisplayResolution._('size3440X1440');
  static const size2560X1440 = MaxDisplayResolution._('size2560X1440');
  static const size1920X1080 = MaxDisplayResolution._('size1920X1080');
  static const size1280X720 = MaxDisplayResolution._('size1280X720');
  static const size1024X768 = MaxDisplayResolution._('size1024X768');
  static const size800X600 = MaxDisplayResolution._('size800X600');

  final String value;

  const MaxDisplayResolution._(this.value);

  static const values = [
    size4096X2160,
    size3840X2160,
    size3440X1440,
    size2560X1440,
    size1920X1080,
    size1280X720,
    size1024X768,
    size800X600
  ];

  static MaxDisplayResolution fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MaxDisplayResolution._(value));

  @override
  bool operator ==(other) =>
      other is MaxDisplayResolution && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ToolbarItem {
  static const windows = ToolbarItem._('Windows');
  static const dualMonitor = ToolbarItem._('DualMonitor');
  static const fullScreen = ToolbarItem._('FullScreen');
  static const webcam = ToolbarItem._('Webcam');
  static const microphone = ToolbarItem._('Microphone');

  final String value;

  const ToolbarItem._(this.value);

  static const values = [windows, dualMonitor, fullScreen, webcam, microphone];

  static ToolbarItem fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ToolbarItem._(value));

  @override
  bool operator ==(other) => other is ToolbarItem && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies a single cookie or set of cookies in an end user's browser.
///
/// @nodoc
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
      domain: (json['domain'] as String?) ?? '',
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

/// A user settings resource that can be associated with a web portal. Once
/// associated with a web portal, user settings control how users can transfer
/// data between a streaming session and the their local devices.
///
/// @nodoc
class UserSettings {
  /// The ARN of the user settings.
  final String userSettingsArn;

  /// The additional encryption context of the user settings.
  final Map<String, String>? additionalEncryptionContext;

  /// A list of web portal ARNs that this user settings is associated with.
  final List<String>? associatedPortalArns;

  /// The branding configuration output that customizes the appearance of the web
  /// portal for end users.
  final BrandingConfiguration? brandingConfiguration;

  /// The configuration that specifies which cookies should be synchronized from
  /// the end user's local browser to the remote browser.
  final CookieSynchronizationConfiguration? cookieSynchronizationConfiguration;

  /// Specifies whether the user can copy text from the streaming session to the
  /// local device.
  final EnabledType? copyAllowed;

  /// The customer managed key used to encrypt sensitive information in the user
  /// settings.
  final String? customerManagedKey;

  /// Specifies whether the user can use deep links that open automatically when
  /// connecting to a session.
  final EnabledType? deepLinkAllowed;

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

  /// The configuration of the toolbar. This allows administrators to select the
  /// toolbar type and visual mode, set maximum display resolution for sessions,
  /// and choose which items are visible to end users during their sessions. If
  /// administrators do not modify these settings, end users retain control over
  /// their toolbar preferences.
  final ToolbarConfiguration? toolbarConfiguration;

  /// Specifies whether the user can upload files from the local device to the
  /// streaming session.
  final EnabledType? uploadAllowed;

  /// Specifies whether the user can use WebAuthn redirection for passwordless
  /// login to websites within the streaming session.
  final EnabledType? webAuthnAllowed;

  UserSettings({
    required this.userSettingsArn,
    this.additionalEncryptionContext,
    this.associatedPortalArns,
    this.brandingConfiguration,
    this.cookieSynchronizationConfiguration,
    this.copyAllowed,
    this.customerManagedKey,
    this.deepLinkAllowed,
    this.disconnectTimeoutInMinutes,
    this.downloadAllowed,
    this.idleDisconnectTimeoutInMinutes,
    this.pasteAllowed,
    this.printAllowed,
    this.toolbarConfiguration,
    this.uploadAllowed,
    this.webAuthnAllowed,
  });

  factory UserSettings.fromJson(Map<String, dynamic> json) {
    return UserSettings(
      userSettingsArn: (json['userSettingsArn'] as String?) ?? '',
      additionalEncryptionContext:
          (json['additionalEncryptionContext'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      associatedPortalArns: (json['associatedPortalArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      brandingConfiguration: json['brandingConfiguration'] != null
          ? BrandingConfiguration.fromJson(
              json['brandingConfiguration'] as Map<String, dynamic>)
          : null,
      cookieSynchronizationConfiguration:
          json['cookieSynchronizationConfiguration'] != null
              ? CookieSynchronizationConfiguration.fromJson(
                  json['cookieSynchronizationConfiguration']
                      as Map<String, dynamic>)
              : null,
      copyAllowed:
          (json['copyAllowed'] as String?)?.let(EnabledType.fromString),
      customerManagedKey: json['customerManagedKey'] as String?,
      deepLinkAllowed:
          (json['deepLinkAllowed'] as String?)?.let(EnabledType.fromString),
      disconnectTimeoutInMinutes: json['disconnectTimeoutInMinutes'] as int?,
      downloadAllowed:
          (json['downloadAllowed'] as String?)?.let(EnabledType.fromString),
      idleDisconnectTimeoutInMinutes:
          json['idleDisconnectTimeoutInMinutes'] as int?,
      pasteAllowed:
          (json['pasteAllowed'] as String?)?.let(EnabledType.fromString),
      printAllowed:
          (json['printAllowed'] as String?)?.let(EnabledType.fromString),
      toolbarConfiguration: json['toolbarConfiguration'] != null
          ? ToolbarConfiguration.fromJson(
              json['toolbarConfiguration'] as Map<String, dynamic>)
          : null,
      uploadAllowed:
          (json['uploadAllowed'] as String?)?.let(EnabledType.fromString),
      webAuthnAllowed:
          (json['webAuthnAllowed'] as String?)?.let(EnabledType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final userSettingsArn = this.userSettingsArn;
    final additionalEncryptionContext = this.additionalEncryptionContext;
    final associatedPortalArns = this.associatedPortalArns;
    final brandingConfiguration = this.brandingConfiguration;
    final cookieSynchronizationConfiguration =
        this.cookieSynchronizationConfiguration;
    final copyAllowed = this.copyAllowed;
    final customerManagedKey = this.customerManagedKey;
    final deepLinkAllowed = this.deepLinkAllowed;
    final disconnectTimeoutInMinutes = this.disconnectTimeoutInMinutes;
    final downloadAllowed = this.downloadAllowed;
    final idleDisconnectTimeoutInMinutes = this.idleDisconnectTimeoutInMinutes;
    final pasteAllowed = this.pasteAllowed;
    final printAllowed = this.printAllowed;
    final toolbarConfiguration = this.toolbarConfiguration;
    final uploadAllowed = this.uploadAllowed;
    final webAuthnAllowed = this.webAuthnAllowed;
    return {
      'userSettingsArn': userSettingsArn,
      if (additionalEncryptionContext != null)
        'additionalEncryptionContext': additionalEncryptionContext,
      if (associatedPortalArns != null)
        'associatedPortalArns': associatedPortalArns,
      if (brandingConfiguration != null)
        'brandingConfiguration': brandingConfiguration,
      if (cookieSynchronizationConfiguration != null)
        'cookieSynchronizationConfiguration':
            cookieSynchronizationConfiguration,
      if (copyAllowed != null) 'copyAllowed': copyAllowed.value,
      if (customerManagedKey != null) 'customerManagedKey': customerManagedKey,
      if (deepLinkAllowed != null) 'deepLinkAllowed': deepLinkAllowed.value,
      if (disconnectTimeoutInMinutes != null)
        'disconnectTimeoutInMinutes': disconnectTimeoutInMinutes,
      if (downloadAllowed != null) 'downloadAllowed': downloadAllowed.value,
      if (idleDisconnectTimeoutInMinutes != null)
        'idleDisconnectTimeoutInMinutes': idleDisconnectTimeoutInMinutes,
      if (pasteAllowed != null) 'pasteAllowed': pasteAllowed.value,
      if (printAllowed != null) 'printAllowed': printAllowed.value,
      if (toolbarConfiguration != null)
        'toolbarConfiguration': toolbarConfiguration,
      if (uploadAllowed != null) 'uploadAllowed': uploadAllowed.value,
      if (webAuthnAllowed != null) 'webAuthnAllowed': webAuthnAllowed.value,
    };
  }
}

/// The input configuration for updating branding settings. All fields are
/// optional when updating existing branding.
///
/// @nodoc
class BrandingConfigurationUpdateInput {
  /// The color theme for components on the web portal. Choose <code>Light</code>
  /// if you upload a dark wallpaper, or <code>Dark</code> for a light wallpaper.
  final ColorTheme? colorTheme;

  /// The favicon image for the portal. Provide either a binary image file or an
  /// S3 URI pointing to the image file. Maximum 100 KB in JPEG, PNG, or ICO
  /// format.
  final IconImageInput? favicon;

  /// A map of localized text strings for different supported languages. Each
  /// locale must provide the required fields <code>browserTabTitle</code> and
  /// <code>welcomeText</code>.
  final Map<Locale, LocalizedBrandingStrings>? localizedStrings;

  /// The logo image for the portal. Provide either a binary image file or an S3
  /// URI pointing to the image file. Maximum 100 KB in JPEG, PNG, or ICO format.
  final IconImageInput? logo;

  /// The terms of service text in Markdown format. To remove existing terms of
  /// service, provide an empty string.
  final String? termsOfService;

  /// The wallpaper image for the portal. Provide either a binary image file or an
  /// S3 URI pointing to the image file. Maximum 5 MB in JPEG or PNG format.
  final WallpaperImageInput? wallpaper;

  BrandingConfigurationUpdateInput({
    this.colorTheme,
    this.favicon,
    this.localizedStrings,
    this.logo,
    this.termsOfService,
    this.wallpaper,
  });

  Map<String, dynamic> toJson() {
    final colorTheme = this.colorTheme;
    final favicon = this.favicon;
    final localizedStrings = this.localizedStrings;
    final logo = this.logo;
    final termsOfService = this.termsOfService;
    final wallpaper = this.wallpaper;
    return {
      if (colorTheme != null) 'colorTheme': colorTheme.value,
      if (favicon != null) 'favicon': favicon,
      if (localizedStrings != null)
        'localizedStrings':
            localizedStrings.map((k, e) => MapEntry(k.value, e)),
      if (logo != null) 'logo': logo,
      if (termsOfService != null) 'termsOfService': termsOfService,
      if (wallpaper != null) 'wallpaper': wallpaper,
    };
  }
}

/// The input for an icon image (logo or favicon). Provide either a binary image
/// file or an S3 URI pointing to the image file. Maximum 100 KB in JPEG, PNG,
/// or ICO format.
///
/// @nodoc
class IconImageInput {
  /// The image provided as a binary image file.
  final Uint8List? blob;

  /// The S3 URI pointing to the image file. The URI must use the format
  /// <code>s3://bucket-name/key-name</code>. You must have read access to the S3
  /// object.
  final String? s3Uri;

  IconImageInput({
    this.blob,
    this.s3Uri,
  });

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final s3Uri = this.s3Uri;
    return {
      if (blob != null) 'blob': base64Encode(blob),
      if (s3Uri != null) 's3Uri': s3Uri,
    };
  }
}

/// The input for a wallpaper image. Provide the image as either a binary image
/// file or an S3 URI. Maximum 5 MB in JPEG or PNG format.
///
/// @nodoc
class WallpaperImageInput {
  /// The image provided as a binary image file.
  final Uint8List? blob;

  /// The S3 URI pointing to the image file. The URI must use the format
  /// <code>s3://bucket-name/key-name</code>. You must have read access to the S3
  /// object.
  final String? s3Uri;

  WallpaperImageInput({
    this.blob,
    this.s3Uri,
  });

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final s3Uri = this.s3Uri;
    return {
      if (blob != null) 'blob': base64Encode(blob),
      if (s3Uri != null) 's3Uri': s3Uri,
    };
  }
}

/// The input configuration for creating branding settings.
///
/// @nodoc
class BrandingConfigurationCreateInput {
  /// The color theme for components on the web portal. Choose <code>Light</code>
  /// if you upload a dark wallpaper, or <code>Dark</code> for a light wallpaper.
  final ColorTheme colorTheme;

  /// The favicon image for the portal. Provide either a binary image file or an
  /// S3 URI pointing to the image file. Maximum 100 KB in JPEG, PNG, or ICO
  /// format.
  final IconImageInput favicon;

  /// A map of localized text strings for different supported languages. Each
  /// locale must provide the required fields <code>browserTabTitle</code> and
  /// <code>welcomeText</code>.
  final Map<Locale, LocalizedBrandingStrings> localizedStrings;

  /// The logo image for the portal. Provide either a binary image file or an S3
  /// URI pointing to the image file. Maximum 100 KB in JPEG, PNG, or ICO format.
  final IconImageInput logo;

  /// The terms of service text in Markdown format. Users will be presented with
  /// the terms of service after successfully signing in.
  final String? termsOfService;

  /// The wallpaper image for the portal. Provide either a binary image file or an
  /// S3 URI pointing to the image file. Maximum 5 MB in JPEG or PNG format. If
  /// not provided, a default wallpaper will be used as the background image.
  final WallpaperImageInput? wallpaper;

  BrandingConfigurationCreateInput({
    required this.colorTheme,
    required this.favicon,
    required this.localizedStrings,
    required this.logo,
    this.termsOfService,
    this.wallpaper,
  });

  Map<String, dynamic> toJson() {
    final colorTheme = this.colorTheme;
    final favicon = this.favicon;
    final localizedStrings = this.localizedStrings;
    final logo = this.logo;
    final termsOfService = this.termsOfService;
    final wallpaper = this.wallpaper;
    return {
      'colorTheme': colorTheme.value,
      'favicon': favicon,
      'localizedStrings': localizedStrings.map((k, e) => MapEntry(k.value, e)),
      'logo': logo,
      if (termsOfService != null) 'termsOfService': termsOfService,
      if (wallpaper != null) 'wallpaper': wallpaper,
    };
  }
}

/// The tag.
///
/// @nodoc
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
      key: (json['Key'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
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

/// The summary of user access logging settings.
///
/// @nodoc
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
          (json['userAccessLoggingSettingsArn'] as String?) ?? '',
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

/// A user access logging settings resource that can be associated with a web
/// portal.
///
/// @nodoc
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
          (json['userAccessLoggingSettingsArn'] as String?) ?? '',
      associatedPortalArns: (json['associatedPortalArns'] as List?)
          ?.nonNulls
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

/// The summary of the certificate.
///
/// @nodoc
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

/// The certificate.
///
/// @nodoc
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

/// The summary of the trust store.
///
/// @nodoc
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

/// A trust store that can be associated with a web portal. A trust store
/// contains certificate authority (CA) certificates. Once associated with a web
/// portal, the browser in a streaming session will recognize certificates that
/// have been issued using any of the CAs in the trust store. If your
/// organization has internal websites that use certificates issued by private
/// CAs, you should add the private CA certificate to the trust store.
///
/// @nodoc
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
      trustStoreArn: (json['trustStoreArn'] as String?) ?? '',
      associatedPortalArns: (json['associatedPortalArns'] as List?)
          ?.nonNulls
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

/// The summary of the session logger resource.
///
/// @nodoc
class SessionLoggerSummary {
  /// The ARN of the session logger resource.
  final String sessionLoggerArn;

  /// The date the session logger resource was created.
  final DateTime? creationDate;

  /// The human-readable display name.
  final String? displayName;

  /// The configuration that specifies where the logs are fowarded.
  final LogConfiguration? logConfiguration;

  SessionLoggerSummary({
    required this.sessionLoggerArn,
    this.creationDate,
    this.displayName,
    this.logConfiguration,
  });

  factory SessionLoggerSummary.fromJson(Map<String, dynamic> json) {
    return SessionLoggerSummary(
      sessionLoggerArn: (json['sessionLoggerArn'] as String?) ?? '',
      creationDate: timeStampFromJson(json['creationDate']),
      displayName: json['displayName'] as String?,
      logConfiguration: json['logConfiguration'] != null
          ? LogConfiguration.fromJson(
              json['logConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionLoggerArn = this.sessionLoggerArn;
    final creationDate = this.creationDate;
    final displayName = this.displayName;
    final logConfiguration = this.logConfiguration;
    return {
      'sessionLoggerArn': sessionLoggerArn,
      if (creationDate != null)
        'creationDate': unixTimestampToJson(creationDate),
      if (displayName != null) 'displayName': displayName,
      if (logConfiguration != null) 'logConfiguration': logConfiguration,
    };
  }
}

/// The configuration of the log.
///
/// @nodoc
class LogConfiguration {
  /// The configuration for delivering the logs to S3.
  final S3LogConfiguration? s3;

  LogConfiguration({
    this.s3,
  });

  factory LogConfiguration.fromJson(Map<String, dynamic> json) {
    return LogConfiguration(
      s3: json['s3'] != null
          ? S3LogConfiguration.fromJson(json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3 = this.s3;
    return {
      if (s3 != null) 's3': s3,
    };
  }
}

/// The S3 log configuration.
///
/// @nodoc
class S3LogConfiguration {
  /// The S3 bucket name where logs are delivered.
  final String bucket;

  /// The folder structure that defines the organizational structure for log files
  /// in S3.
  final FolderStructure folderStructure;

  /// The format of the LogFile that is written to S3.
  final LogFileFormat logFileFormat;

  /// The expected bucket owner of the target S3 bucket. The caller must have
  /// permissions to write to the target bucket.
  final String? bucketOwner;

  /// The S3 path prefix that determines where log files are stored.
  final String? keyPrefix;

  S3LogConfiguration({
    required this.bucket,
    required this.folderStructure,
    required this.logFileFormat,
    this.bucketOwner,
    this.keyPrefix,
  });

  factory S3LogConfiguration.fromJson(Map<String, dynamic> json) {
    return S3LogConfiguration(
      bucket: (json['bucket'] as String?) ?? '',
      folderStructure: FolderStructure.fromString(
          (json['folderStructure'] as String?) ?? ''),
      logFileFormat:
          LogFileFormat.fromString((json['logFileFormat'] as String?) ?? ''),
      bucketOwner: json['bucketOwner'] as String?,
      keyPrefix: json['keyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final folderStructure = this.folderStructure;
    final logFileFormat = this.logFileFormat;
    final bucketOwner = this.bucketOwner;
    final keyPrefix = this.keyPrefix;
    return {
      'bucket': bucket,
      'folderStructure': folderStructure.value,
      'logFileFormat': logFileFormat.value,
      if (bucketOwner != null) 'bucketOwner': bucketOwner,
      if (keyPrefix != null) 'keyPrefix': keyPrefix,
    };
  }
}

/// @nodoc
class LogFileFormat {
  static const jSONLines = LogFileFormat._('JSONLines');
  static const json = LogFileFormat._('Json');

  final String value;

  const LogFileFormat._(this.value);

  static const values = [jSONLines, json];

  static LogFileFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LogFileFormat._(value));

  @override
  bool operator ==(other) => other is LogFileFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FolderStructure {
  static const flat = FolderStructure._('Flat');
  static const nestedByDate = FolderStructure._('NestedByDate');

  final String value;

  const FolderStructure._(this.value);

  static const values = [flat, nestedByDate];

  static FolderStructure fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FolderStructure._(value));

  @override
  bool operator ==(other) => other is FolderStructure && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The session logger resource.
///
/// @nodoc
class SessionLogger {
  /// The ARN of the session logger resource.
  final String sessionLoggerArn;

  /// The additional encryption context of the session logger.
  final Map<String, String>? additionalEncryptionContext;

  /// The associated portal ARN.
  final List<String>? associatedPortalArns;

  /// The date the session logger resource was created.
  final DateTime? creationDate;

  /// The custom managed key of the session logger.
  final String? customerManagedKey;

  /// The human-readable display name.
  final String? displayName;

  /// The filter that specifies which events to monitor.
  final EventFilter? eventFilter;

  /// The configuration that specifies where logs are fowarded.
  final LogConfiguration? logConfiguration;

  SessionLogger({
    required this.sessionLoggerArn,
    this.additionalEncryptionContext,
    this.associatedPortalArns,
    this.creationDate,
    this.customerManagedKey,
    this.displayName,
    this.eventFilter,
    this.logConfiguration,
  });

  factory SessionLogger.fromJson(Map<String, dynamic> json) {
    return SessionLogger(
      sessionLoggerArn: (json['sessionLoggerArn'] as String?) ?? '',
      additionalEncryptionContext:
          (json['additionalEncryptionContext'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      associatedPortalArns: (json['associatedPortalArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      creationDate: timeStampFromJson(json['creationDate']),
      customerManagedKey: json['customerManagedKey'] as String?,
      displayName: json['displayName'] as String?,
      eventFilter: json['eventFilter'] != null
          ? EventFilter.fromJson(json['eventFilter'] as Map<String, dynamic>)
          : null,
      logConfiguration: json['logConfiguration'] != null
          ? LogConfiguration.fromJson(
              json['logConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionLoggerArn = this.sessionLoggerArn;
    final additionalEncryptionContext = this.additionalEncryptionContext;
    final associatedPortalArns = this.associatedPortalArns;
    final creationDate = this.creationDate;
    final customerManagedKey = this.customerManagedKey;
    final displayName = this.displayName;
    final eventFilter = this.eventFilter;
    final logConfiguration = this.logConfiguration;
    return {
      'sessionLoggerArn': sessionLoggerArn,
      if (additionalEncryptionContext != null)
        'additionalEncryptionContext': additionalEncryptionContext,
      if (associatedPortalArns != null)
        'associatedPortalArns': associatedPortalArns,
      if (creationDate != null)
        'creationDate': unixTimestampToJson(creationDate),
      if (customerManagedKey != null) 'customerManagedKey': customerManagedKey,
      if (displayName != null) 'displayName': displayName,
      if (eventFilter != null) 'eventFilter': eventFilter,
      if (logConfiguration != null) 'logConfiguration': logConfiguration,
    };
  }
}

/// The filter that specifies the events to monitor.
///
/// @nodoc
class EventFilter {
  /// The filter that monitors all of the available events, including any new
  /// events emitted in the future.
  final Unit? all;

  /// The filter that monitors only the listed set of events. New events are not
  /// auto-monitored.
  final List<Event>? include;

  EventFilter({
    this.all,
    this.include,
  });

  factory EventFilter.fromJson(Map<String, dynamic> json) {
    return EventFilter(
      all: json['all'] != null
          ? Unit.fromJson(json['all'] as Map<String, dynamic>)
          : null,
      include: (json['include'] as List?)
          ?.nonNulls
          .map((e) => Event.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final all = this.all;
    final include = this.include;
    return {
      if (all != null) 'all': all,
      if (include != null) 'include': include.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class Event {
  static const websiteInteract = Event._('WebsiteInteract');
  static const fileDownloadFromSecureBrowserToRemoteDisk =
      Event._('FileDownloadFromSecureBrowserToRemoteDisk');
  static const fileTransferFromRemoteToLocalDisk =
      Event._('FileTransferFromRemoteToLocalDisk');
  static const fileTransferFromLocalToRemoteDisk =
      Event._('FileTransferFromLocalToRemoteDisk');
  static const fileUploadFromRemoteDiskToSecureBrowser =
      Event._('FileUploadFromRemoteDiskToSecureBrowser');
  static const contentPasteToWebsite = Event._('ContentPasteToWebsite');
  static const contentTransferFromLocalToRemoteClipboard =
      Event._('ContentTransferFromLocalToRemoteClipboard');
  static const contentCopyFromWebsite = Event._('ContentCopyFromWebsite');
  static const urlLoad = Event._('UrlLoad');
  static const tabOpen = Event._('TabOpen');
  static const tabClose = Event._('TabClose');
  static const printJobSubmit = Event._('PrintJobSubmit');
  static const sessionConnect = Event._('SessionConnect');
  static const sessionStart = Event._('SessionStart');
  static const sessionDisconnect = Event._('SessionDisconnect');
  static const sessionEnd = Event._('SessionEnd');
  static const urlBlockByContentFilter = Event._('UrlBlockByContentFilter');

  final String value;

  const Event._(this.value);

  static const values = [
    websiteInteract,
    fileDownloadFromSecureBrowserToRemoteDisk,
    fileTransferFromRemoteToLocalDisk,
    fileTransferFromLocalToRemoteDisk,
    fileUploadFromRemoteDiskToSecureBrowser,
    contentPasteToWebsite,
    contentTransferFromLocalToRemoteClipboard,
    contentCopyFromWebsite,
    urlLoad,
    tabOpen,
    tabClose,
    printJobSubmit,
    sessionConnect,
    sessionStart,
    sessionDisconnect,
    sessionEnd,
    urlBlockByContentFilter
  ];

  static Event fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Event._(value));

  @override
  bool operator ==(other) => other is Event && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The summary of the portal.
///
/// @nodoc
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
  /// Identity Center. Identity sources (including external identity provider
  /// integration), plus user and group access to your web portal, can be
  /// configured in the IAM Identity Center.
  final AuthenticationType? authenticationType;

  /// The ARN of the browser settings that is associated with the web portal.
  final String? browserSettingsArn;

  /// The browser type of the web portal.
  final BrowserType? browserType;

  /// The creation date of the web portal.
  final DateTime? creationDate;

  /// The ARN of the data protection settings.
  final String? dataProtectionSettingsArn;

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

  /// The custom domain of the web portal that users access in order to start
  /// streaming sessions.
  final String? portalCustomDomain;

  /// The endpoint URL of the web portal that users access in order to start
  /// streaming sessions.
  final String? portalEndpoint;

  /// The status of the web portal.
  final PortalStatus? portalStatus;

  /// The renderer that is used in streaming sessions.
  final RendererType? rendererType;

  /// The ARN of the session logger that is assocaited with the portal.
  final String? sessionLoggerArn;

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
    this.dataProtectionSettingsArn,
    this.displayName,
    this.instanceType,
    this.ipAccessSettingsArn,
    this.maxConcurrentSessions,
    this.networkSettingsArn,
    this.portalCustomDomain,
    this.portalEndpoint,
    this.portalStatus,
    this.rendererType,
    this.sessionLoggerArn,
    this.trustStoreArn,
    this.userAccessLoggingSettingsArn,
    this.userSettingsArn,
  });

  factory PortalSummary.fromJson(Map<String, dynamic> json) {
    return PortalSummary(
      portalArn: (json['portalArn'] as String?) ?? '',
      authenticationType: (json['authenticationType'] as String?)
          ?.let(AuthenticationType.fromString),
      browserSettingsArn: json['browserSettingsArn'] as String?,
      browserType:
          (json['browserType'] as String?)?.let(BrowserType.fromString),
      creationDate: timeStampFromJson(json['creationDate']),
      dataProtectionSettingsArn: json['dataProtectionSettingsArn'] as String?,
      displayName: json['displayName'] as String?,
      instanceType:
          (json['instanceType'] as String?)?.let(InstanceType.fromString),
      ipAccessSettingsArn: json['ipAccessSettingsArn'] as String?,
      maxConcurrentSessions: json['maxConcurrentSessions'] as int?,
      networkSettingsArn: json['networkSettingsArn'] as String?,
      portalCustomDomain: json['portalCustomDomain'] as String?,
      portalEndpoint: json['portalEndpoint'] as String?,
      portalStatus:
          (json['portalStatus'] as String?)?.let(PortalStatus.fromString),
      rendererType:
          (json['rendererType'] as String?)?.let(RendererType.fromString),
      sessionLoggerArn: json['sessionLoggerArn'] as String?,
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
    final dataProtectionSettingsArn = this.dataProtectionSettingsArn;
    final displayName = this.displayName;
    final instanceType = this.instanceType;
    final ipAccessSettingsArn = this.ipAccessSettingsArn;
    final maxConcurrentSessions = this.maxConcurrentSessions;
    final networkSettingsArn = this.networkSettingsArn;
    final portalCustomDomain = this.portalCustomDomain;
    final portalEndpoint = this.portalEndpoint;
    final portalStatus = this.portalStatus;
    final rendererType = this.rendererType;
    final sessionLoggerArn = this.sessionLoggerArn;
    final trustStoreArn = this.trustStoreArn;
    final userAccessLoggingSettingsArn = this.userAccessLoggingSettingsArn;
    final userSettingsArn = this.userSettingsArn;
    return {
      'portalArn': portalArn,
      if (authenticationType != null)
        'authenticationType': authenticationType.value,
      if (browserSettingsArn != null) 'browserSettingsArn': browserSettingsArn,
      if (browserType != null) 'browserType': browserType.value,
      if (creationDate != null)
        'creationDate': unixTimestampToJson(creationDate),
      if (dataProtectionSettingsArn != null)
        'dataProtectionSettingsArn': dataProtectionSettingsArn,
      if (displayName != null) 'displayName': displayName,
      if (instanceType != null) 'instanceType': instanceType.value,
      if (ipAccessSettingsArn != null)
        'ipAccessSettingsArn': ipAccessSettingsArn,
      if (maxConcurrentSessions != null)
        'maxConcurrentSessions': maxConcurrentSessions,
      if (networkSettingsArn != null) 'networkSettingsArn': networkSettingsArn,
      if (portalCustomDomain != null) 'portalCustomDomain': portalCustomDomain,
      if (portalEndpoint != null) 'portalEndpoint': portalEndpoint,
      if (portalStatus != null) 'portalStatus': portalStatus.value,
      if (rendererType != null) 'rendererType': rendererType.value,
      if (sessionLoggerArn != null) 'sessionLoggerArn': sessionLoggerArn,
      if (trustStoreArn != null) 'trustStoreArn': trustStoreArn,
      if (userAccessLoggingSettingsArn != null)
        'userAccessLoggingSettingsArn': userAccessLoggingSettingsArn,
      if (userSettingsArn != null) 'userSettingsArn': userSettingsArn,
    };
  }
}

/// @nodoc
class RendererType {
  static const appStream = RendererType._('AppStream');

  final String value;

  const RendererType._(this.value);

  static const values = [appStream];

  static RendererType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RendererType._(value));

  @override
  bool operator ==(other) => other is RendererType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class BrowserType {
  static const chrome = BrowserType._('Chrome');

  final String value;

  const BrowserType._(this.value);

  static const values = [chrome];

  static BrowserType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => BrowserType._(value));

  @override
  bool operator ==(other) => other is BrowserType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PortalStatus {
  static const incomplete = PortalStatus._('Incomplete');
  static const pending = PortalStatus._('Pending');
  static const active = PortalStatus._('Active');

  final String value;

  const PortalStatus._(this.value);

  static const values = [incomplete, pending, active];

  static PortalStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PortalStatus._(value));

  @override
  bool operator ==(other) => other is PortalStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AuthenticationType {
  static const standard = AuthenticationType._('Standard');
  static const iamIdentityCenter = AuthenticationType._('IAM_Identity_Center');

  final String value;

  const AuthenticationType._(this.value);

  static const values = [standard, iamIdentityCenter];

  static AuthenticationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AuthenticationType._(value));

  @override
  bool operator ==(other) =>
      other is AuthenticationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class InstanceType {
  static const standardRegular = InstanceType._('standard.regular');
  static const standardLarge = InstanceType._('standard.large');
  static const standardXlarge = InstanceType._('standard.xlarge');

  final String value;

  const InstanceType._(this.value);

  static const values = [standardRegular, standardLarge, standardXlarge];

  static InstanceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => InstanceType._(value));

  @override
  bool operator ==(other) => other is InstanceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The web portal.
///
/// @nodoc
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
  /// Identity Center. Identity sources (including external identity provider
  /// integration), plus user and group access to your web portal, can be
  /// configured in the IAM Identity Center.
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

  /// The ARN of the data protection settings.
  final String? dataProtectionSettingsArn;

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

  /// The custom domain of the web portal that users access in order to start
  /// streaming sessions.
  final String? portalCustomDomain;

  /// The endpoint URL of the web portal that users access in order to start
  /// streaming sessions.
  final String? portalEndpoint;

  /// The status of the web portal.
  final PortalStatus? portalStatus;

  /// The renderer that is used in streaming sessions.
  final RendererType? rendererType;

  /// The ARN of the session logger that is assocaited with the portal.
  final String? sessionLoggerArn;

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
    this.dataProtectionSettingsArn,
    this.displayName,
    this.instanceType,
    this.ipAccessSettingsArn,
    this.maxConcurrentSessions,
    this.networkSettingsArn,
    this.portalCustomDomain,
    this.portalEndpoint,
    this.portalStatus,
    this.rendererType,
    this.sessionLoggerArn,
    this.statusReason,
    this.trustStoreArn,
    this.userAccessLoggingSettingsArn,
    this.userSettingsArn,
  });

  factory Portal.fromJson(Map<String, dynamic> json) {
    return Portal(
      portalArn: (json['portalArn'] as String?) ?? '',
      additionalEncryptionContext:
          (json['additionalEncryptionContext'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      authenticationType: (json['authenticationType'] as String?)
          ?.let(AuthenticationType.fromString),
      browserSettingsArn: json['browserSettingsArn'] as String?,
      browserType:
          (json['browserType'] as String?)?.let(BrowserType.fromString),
      creationDate: timeStampFromJson(json['creationDate']),
      customerManagedKey: json['customerManagedKey'] as String?,
      dataProtectionSettingsArn: json['dataProtectionSettingsArn'] as String?,
      displayName: json['displayName'] as String?,
      instanceType:
          (json['instanceType'] as String?)?.let(InstanceType.fromString),
      ipAccessSettingsArn: json['ipAccessSettingsArn'] as String?,
      maxConcurrentSessions: json['maxConcurrentSessions'] as int?,
      networkSettingsArn: json['networkSettingsArn'] as String?,
      portalCustomDomain: json['portalCustomDomain'] as String?,
      portalEndpoint: json['portalEndpoint'] as String?,
      portalStatus:
          (json['portalStatus'] as String?)?.let(PortalStatus.fromString),
      rendererType:
          (json['rendererType'] as String?)?.let(RendererType.fromString),
      sessionLoggerArn: json['sessionLoggerArn'] as String?,
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
    final dataProtectionSettingsArn = this.dataProtectionSettingsArn;
    final displayName = this.displayName;
    final instanceType = this.instanceType;
    final ipAccessSettingsArn = this.ipAccessSettingsArn;
    final maxConcurrentSessions = this.maxConcurrentSessions;
    final networkSettingsArn = this.networkSettingsArn;
    final portalCustomDomain = this.portalCustomDomain;
    final portalEndpoint = this.portalEndpoint;
    final portalStatus = this.portalStatus;
    final rendererType = this.rendererType;
    final sessionLoggerArn = this.sessionLoggerArn;
    final statusReason = this.statusReason;
    final trustStoreArn = this.trustStoreArn;
    final userAccessLoggingSettingsArn = this.userAccessLoggingSettingsArn;
    final userSettingsArn = this.userSettingsArn;
    return {
      'portalArn': portalArn,
      if (additionalEncryptionContext != null)
        'additionalEncryptionContext': additionalEncryptionContext,
      if (authenticationType != null)
        'authenticationType': authenticationType.value,
      if (browserSettingsArn != null) 'browserSettingsArn': browserSettingsArn,
      if (browserType != null) 'browserType': browserType.value,
      if (creationDate != null)
        'creationDate': unixTimestampToJson(creationDate),
      if (customerManagedKey != null) 'customerManagedKey': customerManagedKey,
      if (dataProtectionSettingsArn != null)
        'dataProtectionSettingsArn': dataProtectionSettingsArn,
      if (displayName != null) 'displayName': displayName,
      if (instanceType != null) 'instanceType': instanceType.value,
      if (ipAccessSettingsArn != null)
        'ipAccessSettingsArn': ipAccessSettingsArn,
      if (maxConcurrentSessions != null)
        'maxConcurrentSessions': maxConcurrentSessions,
      if (networkSettingsArn != null) 'networkSettingsArn': networkSettingsArn,
      if (portalCustomDomain != null) 'portalCustomDomain': portalCustomDomain,
      if (portalEndpoint != null) 'portalEndpoint': portalEndpoint,
      if (portalStatus != null) 'portalStatus': portalStatus.value,
      if (rendererType != null) 'rendererType': rendererType.value,
      if (sessionLoggerArn != null) 'sessionLoggerArn': sessionLoggerArn,
      if (statusReason != null) 'statusReason': statusReason,
      if (trustStoreArn != null) 'trustStoreArn': trustStoreArn,
      if (userAccessLoggingSettingsArn != null)
        'userAccessLoggingSettingsArn': userAccessLoggingSettingsArn,
      if (userSettingsArn != null) 'userSettingsArn': userSettingsArn,
    };
  }
}

/// The summary of network settings.
///
/// @nodoc
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
      networkSettingsArn: (json['networkSettingsArn'] as String?) ?? '',
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

/// A network settings resource that can be associated with a web portal. Once
/// associated with a web portal, network settings define how streaming
/// instances will connect with your specified VPC.
///
/// @nodoc
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
      networkSettingsArn: (json['networkSettingsArn'] as String?) ?? '',
      associatedPortalArns: (json['associatedPortalArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.nonNulls
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

/// The summary of IP access settings.
///
/// @nodoc
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
      ipAccessSettingsArn: (json['ipAccessSettingsArn'] as String?) ?? '',
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

/// The IP access settings resource that can be associated with a web portal.
///
/// @nodoc
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
      ipAccessSettingsArn: (json['ipAccessSettingsArn'] as String?) ?? '',
      additionalEncryptionContext:
          (json['additionalEncryptionContext'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      associatedPortalArns: (json['associatedPortalArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      creationDate: timeStampFromJson(json['creationDate']),
      customerManagedKey: json['customerManagedKey'] as String?,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      ipRules: (json['ipRules'] as List?)
          ?.nonNulls
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

/// The IP rules of the IP access settings.
///
/// @nodoc
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
      ipRange: (json['ipRange'] as String?) ?? '',
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

/// The summary of the identity provider.
///
/// @nodoc
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
      identityProviderArn: (json['identityProviderArn'] as String?) ?? '',
      identityProviderName: json['identityProviderName'] as String?,
      identityProviderType: (json['identityProviderType'] as String?)
          ?.let(IdentityProviderType.fromString),
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
        'identityProviderType': identityProviderType.value,
    };
  }
}

/// @nodoc
class IdentityProviderType {
  static const saml = IdentityProviderType._('SAML');
  static const facebook = IdentityProviderType._('Facebook');
  static const google = IdentityProviderType._('Google');
  static const loginWithAmazon = IdentityProviderType._('LoginWithAmazon');
  static const signInWithApple = IdentityProviderType._('SignInWithApple');
  static const oidc = IdentityProviderType._('OIDC');

  final String value;

  const IdentityProviderType._(this.value);

  static const values = [
    saml,
    facebook,
    google,
    loginWithAmazon,
    signInWithApple,
    oidc
  ];

  static IdentityProviderType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IdentityProviderType._(value));

  @override
  bool operator ==(other) =>
      other is IdentityProviderType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The identity provider.
///
/// @nodoc
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
      identityProviderArn: (json['identityProviderArn'] as String?) ?? '',
      identityProviderDetails:
          (json['identityProviderDetails'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      identityProviderName: json['identityProviderName'] as String?,
      identityProviderType: (json['identityProviderType'] as String?)
          ?.let(IdentityProviderType.fromString),
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
        'identityProviderType': identityProviderType.value,
    };
  }
}

/// The summary of the data protection settings.
///
/// @nodoc
class DataProtectionSettingsSummary {
  /// The ARN of the data protection settings.
  final String dataProtectionSettingsArn;

  /// The creation date timestamp of the data protection settings.
  final DateTime? creationDate;

  /// The description of the data protection settings.
  final String? description;

  /// The display name of the data protection settings.
  final String? displayName;

  DataProtectionSettingsSummary({
    required this.dataProtectionSettingsArn,
    this.creationDate,
    this.description,
    this.displayName,
  });

  factory DataProtectionSettingsSummary.fromJson(Map<String, dynamic> json) {
    return DataProtectionSettingsSummary(
      dataProtectionSettingsArn:
          (json['dataProtectionSettingsArn'] as String?) ?? '',
      creationDate: timeStampFromJson(json['creationDate']),
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataProtectionSettingsArn = this.dataProtectionSettingsArn;
    final creationDate = this.creationDate;
    final description = this.description;
    final displayName = this.displayName;
    return {
      'dataProtectionSettingsArn': dataProtectionSettingsArn,
      if (creationDate != null)
        'creationDate': unixTimestampToJson(creationDate),
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
    };
  }
}

/// The data protection settings resource that can be associated with a web
/// portal.
///
/// @nodoc
class DataProtectionSettings {
  /// The ARN of the data protection settings resource.
  final String dataProtectionSettingsArn;

  /// The additional encryption context of the data protection settings.
  final Map<String, String>? additionalEncryptionContext;

  /// A list of web portal ARNs that this data protection settings resource is
  /// associated with.
  final List<String>? associatedPortalArns;

  /// The creation date timestamp of the data protection settings.
  final DateTime? creationDate;

  /// The customer managed key used to encrypt sensitive information in the data
  /// protection settings.
  final String? customerManagedKey;

  /// The description of the data protection settings.
  final String? description;

  /// The display name of the data protection settings.
  final String? displayName;

  /// The inline redaction configuration for the data protection settings.
  final InlineRedactionConfiguration? inlineRedactionConfiguration;

  DataProtectionSettings({
    required this.dataProtectionSettingsArn,
    this.additionalEncryptionContext,
    this.associatedPortalArns,
    this.creationDate,
    this.customerManagedKey,
    this.description,
    this.displayName,
    this.inlineRedactionConfiguration,
  });

  factory DataProtectionSettings.fromJson(Map<String, dynamic> json) {
    return DataProtectionSettings(
      dataProtectionSettingsArn:
          (json['dataProtectionSettingsArn'] as String?) ?? '',
      additionalEncryptionContext:
          (json['additionalEncryptionContext'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      associatedPortalArns: (json['associatedPortalArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      creationDate: timeStampFromJson(json['creationDate']),
      customerManagedKey: json['customerManagedKey'] as String?,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      inlineRedactionConfiguration: json['inlineRedactionConfiguration'] != null
          ? InlineRedactionConfiguration.fromJson(
              json['inlineRedactionConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataProtectionSettingsArn = this.dataProtectionSettingsArn;
    final additionalEncryptionContext = this.additionalEncryptionContext;
    final associatedPortalArns = this.associatedPortalArns;
    final creationDate = this.creationDate;
    final customerManagedKey = this.customerManagedKey;
    final description = this.description;
    final displayName = this.displayName;
    final inlineRedactionConfiguration = this.inlineRedactionConfiguration;
    return {
      'dataProtectionSettingsArn': dataProtectionSettingsArn,
      if (additionalEncryptionContext != null)
        'additionalEncryptionContext': additionalEncryptionContext,
      if (associatedPortalArns != null)
        'associatedPortalArns': associatedPortalArns,
      if (creationDate != null)
        'creationDate': unixTimestampToJson(creationDate),
      if (customerManagedKey != null) 'customerManagedKey': customerManagedKey,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (inlineRedactionConfiguration != null)
        'inlineRedactionConfiguration': inlineRedactionConfiguration,
    };
  }
}

/// The configuration for in-session inline redaction.
///
/// @nodoc
class InlineRedactionConfiguration {
  /// The inline redaction patterns to be enabled for the inline redaction
  /// configuration.
  final List<InlineRedactionPattern> inlineRedactionPatterns;

  /// The global confidence level for the inline redaction configuration. This
  /// indicates the certainty of data type matches in the redaction process.
  /// Confidence level 3 means high confidence, and requires a formatted text
  /// pattern match in order for content to be redacted. Confidence level 2 means
  /// medium confidence, and redaction considers both formatted and unformatted
  /// text, and adds keyword associate to the logic. Confidence level 1 means low
  /// confidence, and redaction is enforced for both formatted pattern +
  /// unformatted pattern without keyword. This is applied to patterns that do not
  /// have a pattern-level confidence level. Defaults to confidence level 2.
  final int? globalConfidenceLevel;

  /// The global enforced URL configuration for the inline redaction
  /// configuration. This is applied to patterns that do not have a pattern-level
  /// enforced URL list.
  final List<String>? globalEnforcedUrls;

  /// The global exempt URL configuration for the inline redaction configuration.
  /// This is applied to patterns that do not have a pattern-level exempt URL
  /// list.
  final List<String>? globalExemptUrls;

  InlineRedactionConfiguration({
    required this.inlineRedactionPatterns,
    this.globalConfidenceLevel,
    this.globalEnforcedUrls,
    this.globalExemptUrls,
  });

  factory InlineRedactionConfiguration.fromJson(Map<String, dynamic> json) {
    return InlineRedactionConfiguration(
      inlineRedactionPatterns: ((json['inlineRedactionPatterns'] as List?) ??
              const [])
          .nonNulls
          .map(
              (e) => InlineRedactionPattern.fromJson(e as Map<String, dynamic>))
          .toList(),
      globalConfidenceLevel: json['globalConfidenceLevel'] as int?,
      globalEnforcedUrls: (json['globalEnforcedUrls'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      globalExemptUrls: (json['globalExemptUrls'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final inlineRedactionPatterns = this.inlineRedactionPatterns;
    final globalConfidenceLevel = this.globalConfidenceLevel;
    final globalEnforcedUrls = this.globalEnforcedUrls;
    final globalExemptUrls = this.globalExemptUrls;
    return {
      'inlineRedactionPatterns': inlineRedactionPatterns,
      if (globalConfidenceLevel != null)
        'globalConfidenceLevel': globalConfidenceLevel,
      if (globalEnforcedUrls != null) 'globalEnforcedUrls': globalEnforcedUrls,
      if (globalExemptUrls != null) 'globalExemptUrls': globalExemptUrls,
    };
  }
}

/// The set of patterns that determine the data types redacted in session.
///
/// @nodoc
class InlineRedactionPattern {
  /// The redaction placeholder that will replace the redacted text in session for
  /// the inline redaction pattern.
  final RedactionPlaceHolder redactionPlaceHolder;

  /// The built-in pattern from the list of preconfigured patterns. Either a
  /// customPattern or builtInPatternId is required.
  final String? builtInPatternId;

  /// The confidence level for inline redaction pattern. This indicates the
  /// certainty of data type matches in the redaction process. Confidence level 3
  /// means high confidence, and requires a formatted text pattern match in order
  /// for content to be redacted. Confidence level 2 means medium confidence, and
  /// redaction considers both formatted and unformatted text, and adds keyword
  /// associate to the logic. Confidence level 1 means low confidence, and
  /// redaction is enforced for both formatted pattern + unformatted pattern
  /// without keyword. This overrides the global confidence level.
  final int? confidenceLevel;

  /// &gt;The configuration for a custom pattern. Either a customPattern or
  /// builtInPatternId is required.
  final CustomPattern? customPattern;

  /// The enforced URL configuration for the inline redaction pattern. This will
  /// override the global enforced URL configuration.
  final List<String>? enforcedUrls;

  /// The exempt URL configuration for the inline redaction pattern. This will
  /// override the global exempt URL configuration for the inline redaction
  /// pattern.
  final List<String>? exemptUrls;

  InlineRedactionPattern({
    required this.redactionPlaceHolder,
    this.builtInPatternId,
    this.confidenceLevel,
    this.customPattern,
    this.enforcedUrls,
    this.exemptUrls,
  });

  factory InlineRedactionPattern.fromJson(Map<String, dynamic> json) {
    return InlineRedactionPattern(
      redactionPlaceHolder: RedactionPlaceHolder.fromJson(
          (json['redactionPlaceHolder'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      builtInPatternId: json['builtInPatternId'] as String?,
      confidenceLevel: json['confidenceLevel'] as int?,
      customPattern: json['customPattern'] != null
          ? CustomPattern.fromJson(
              json['customPattern'] as Map<String, dynamic>)
          : null,
      enforcedUrls: (json['enforcedUrls'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      exemptUrls: (json['exemptUrls'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final redactionPlaceHolder = this.redactionPlaceHolder;
    final builtInPatternId = this.builtInPatternId;
    final confidenceLevel = this.confidenceLevel;
    final customPattern = this.customPattern;
    final enforcedUrls = this.enforcedUrls;
    final exemptUrls = this.exemptUrls;
    return {
      'redactionPlaceHolder': redactionPlaceHolder,
      if (builtInPatternId != null) 'builtInPatternId': builtInPatternId,
      if (confidenceLevel != null) 'confidenceLevel': confidenceLevel,
      if (customPattern != null) 'customPattern': customPattern,
      if (enforcedUrls != null) 'enforcedUrls': enforcedUrls,
      if (exemptUrls != null) 'exemptUrls': exemptUrls,
    };
  }
}

/// The pattern configuration for redacting custom data types in session.
///
/// @nodoc
class CustomPattern {
  /// The pattern name for the custom pattern.
  final String patternName;

  /// The pattern regex for the customer pattern. The format must follow
  /// JavaScript regex format. The pattern must be enclosed between slashes, and
  /// can have flags behind the second slash. For example: “/ab+c/gi”.
  final String patternRegex;

  /// The keyword regex for the customer pattern. After there is a match to the
  /// pattern regex, the keyword regex is used to search within the proximity of
  /// the match. If there is a keyword match, then the match is confirmed. If no
  /// keyword regex is provided, the pattern regex match will automatically be
  /// confirmed. The format must follow JavaScript regex format. The pattern must
  /// be enclosed between slashes, and can have flags behind the second slash. For
  /// example, “/ab+c/gi”
  final String? keywordRegex;

  /// The pattern description for the customer pattern.
  final String? patternDescription;

  CustomPattern({
    required this.patternName,
    required this.patternRegex,
    this.keywordRegex,
    this.patternDescription,
  });

  factory CustomPattern.fromJson(Map<String, dynamic> json) {
    return CustomPattern(
      patternName: (json['patternName'] as String?) ?? '',
      patternRegex: (json['patternRegex'] as String?) ?? '',
      keywordRegex: json['keywordRegex'] as String?,
      patternDescription: json['patternDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final patternName = this.patternName;
    final patternRegex = this.patternRegex;
    final keywordRegex = this.keywordRegex;
    final patternDescription = this.patternDescription;
    return {
      'patternName': patternName,
      'patternRegex': patternRegex,
      if (keywordRegex != null) 'keywordRegex': keywordRegex,
      if (patternDescription != null) 'patternDescription': patternDescription,
    };
  }
}

/// The redaction placeholder that will replace the redacted text in session.
///
/// @nodoc
class RedactionPlaceHolder {
  /// The redaction placeholder type that will replace the redacted text in
  /// session.
  final RedactionPlaceHolderType redactionPlaceHolderType;

  /// The redaction placeholder text that will replace the redacted text in
  /// session for the custom text redaction placeholder type.
  final String? redactionPlaceHolderText;

  RedactionPlaceHolder({
    required this.redactionPlaceHolderType,
    this.redactionPlaceHolderText,
  });

  factory RedactionPlaceHolder.fromJson(Map<String, dynamic> json) {
    return RedactionPlaceHolder(
      redactionPlaceHolderType: RedactionPlaceHolderType.fromString(
          (json['redactionPlaceHolderType'] as String?) ?? ''),
      redactionPlaceHolderText: json['redactionPlaceHolderText'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final redactionPlaceHolderType = this.redactionPlaceHolderType;
    final redactionPlaceHolderText = this.redactionPlaceHolderText;
    return {
      'redactionPlaceHolderType': redactionPlaceHolderType.value,
      if (redactionPlaceHolderText != null)
        'redactionPlaceHolderText': redactionPlaceHolderText,
    };
  }
}

/// @nodoc
class RedactionPlaceHolderType {
  static const customText = RedactionPlaceHolderType._('CustomText');

  final String value;

  const RedactionPlaceHolderType._(this.value);

  static const values = [customText];

  static RedactionPlaceHolderType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RedactionPlaceHolderType._(value));

  @override
  bool operator ==(other) =>
      other is RedactionPlaceHolderType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The summary for browser settings.
///
/// @nodoc
class BrowserSettingsSummary {
  /// The ARN of the browser settings.
  final String browserSettingsArn;

  BrowserSettingsSummary({
    required this.browserSettingsArn,
  });

  factory BrowserSettingsSummary.fromJson(Map<String, dynamic> json) {
    return BrowserSettingsSummary(
      browserSettingsArn: (json['browserSettingsArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final browserSettingsArn = this.browserSettingsArn;
    return {
      'browserSettingsArn': browserSettingsArn,
    };
  }
}

/// The browser settings resource that can be associated with a web portal. Once
/// associated with a web portal, browser settings control how the browser will
/// behave once a user starts a streaming session for the web portal.
///
/// @nodoc
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

  /// The policy that specifies which URLs end users are allowed to access or
  /// which URLs or domain categories they are restricted from accessing for
  /// enhanced security.
  final WebContentFilteringPolicy? webContentFilteringPolicy;

  BrowserSettings({
    required this.browserSettingsArn,
    this.additionalEncryptionContext,
    this.associatedPortalArns,
    this.browserPolicy,
    this.customerManagedKey,
    this.webContentFilteringPolicy,
  });

  factory BrowserSettings.fromJson(Map<String, dynamic> json) {
    return BrowserSettings(
      browserSettingsArn: (json['browserSettingsArn'] as String?) ?? '',
      additionalEncryptionContext:
          (json['additionalEncryptionContext'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      associatedPortalArns: (json['associatedPortalArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      browserPolicy: json['browserPolicy'] as String?,
      customerManagedKey: json['customerManagedKey'] as String?,
      webContentFilteringPolicy: json['webContentFilteringPolicy'] != null
          ? WebContentFilteringPolicy.fromJson(
              json['webContentFilteringPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final browserSettingsArn = this.browserSettingsArn;
    final additionalEncryptionContext = this.additionalEncryptionContext;
    final associatedPortalArns = this.associatedPortalArns;
    final browserPolicy = this.browserPolicy;
    final customerManagedKey = this.customerManagedKey;
    final webContentFilteringPolicy = this.webContentFilteringPolicy;
    return {
      'browserSettingsArn': browserSettingsArn,
      if (additionalEncryptionContext != null)
        'additionalEncryptionContext': additionalEncryptionContext,
      if (associatedPortalArns != null)
        'associatedPortalArns': associatedPortalArns,
      if (browserPolicy != null) 'browserPolicy': browserPolicy,
      if (customerManagedKey != null) 'customerManagedKey': customerManagedKey,
      if (webContentFilteringPolicy != null)
        'webContentFilteringPolicy': webContentFilteringPolicy,
    };
  }
}

/// The policy that specifies which URLs end users are allowed to access or
/// which URLs or domain categories they are restricted from accessing for
/// enhanced security.
///
/// @nodoc
class WebContentFilteringPolicy {
  /// URLs and domains that are always accessible to end users.
  final List<String>? allowedUrls;

  /// Categories of websites that are blocked on the end user’s browsers.
  final List<Category>? blockedCategories;

  /// URLs and domains that end users cannot access.
  final List<String>? blockedUrls;

  WebContentFilteringPolicy({
    this.allowedUrls,
    this.blockedCategories,
    this.blockedUrls,
  });

  factory WebContentFilteringPolicy.fromJson(Map<String, dynamic> json) {
    return WebContentFilteringPolicy(
      allowedUrls: (json['allowedUrls'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      blockedCategories: (json['blockedCategories'] as List?)
          ?.nonNulls
          .map((e) => Category.fromString((e as String)))
          .toList(),
      blockedUrls: (json['blockedUrls'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedUrls = this.allowedUrls;
    final blockedCategories = this.blockedCategories;
    final blockedUrls = this.blockedUrls;
    return {
      if (allowedUrls != null) 'allowedUrls': allowedUrls,
      if (blockedCategories != null)
        'blockedCategories': blockedCategories.map((e) => e.value).toList(),
      if (blockedUrls != null) 'blockedUrls': blockedUrls,
    };
  }
}

/// @nodoc
class Category {
  static const cults = Category._('Cults');
  static const gambling = Category._('Gambling');
  static const nudity = Category._('Nudity');
  static const pornography = Category._('Pornography');
  static const sexEducation = Category._('SexEducation');
  static const tasteless = Category._('Tasteless');
  static const violence = Category._('Violence');
  static const downloadSites = Category._('DownloadSites');
  static const imageSharing = Category._('ImageSharing');
  static const peerToPeer = Category._('PeerToPeer');
  static const streamingMediaAndDownloads =
      Category._('StreamingMediaAndDownloads');
  static const generativeAI = Category._('GenerativeAI');
  static const criminalActivity = Category._('CriminalActivity');
  static const hacking = Category._('Hacking');
  static const hateAndIntolerance = Category._('HateAndIntolerance');
  static const illegalDrug = Category._('IllegalDrug');
  static const illegalSoftware = Category._('IllegalSoftware');
  static const schoolCheating = Category._('SchoolCheating');
  static const selfHarm = Category._('SelfHarm');
  static const weapons = Category._('Weapons');
  static const chat = Category._('Chat');
  static const games = Category._('Games');
  static const instantMessaging = Category._('InstantMessaging');
  static const professionalNetwork = Category._('ProfessionalNetwork');
  static const socialNetworking = Category._('SocialNetworking');
  static const webBasedEmail = Category._('WebBasedEmail');
  static const parkedDomains = Category._('ParkedDomains');

  final String value;

  const Category._(this.value);

  static const values = [
    cults,
    gambling,
    nudity,
    pornography,
    sexEducation,
    tasteless,
    violence,
    downloadSites,
    imageSharing,
    peerToPeer,
    streamingMediaAndDownloads,
    generativeAI,
    criminalActivity,
    hacking,
    hateAndIntolerance,
    illegalDrug,
    illegalSoftware,
    schoolCheating,
    selfHarm,
    weapons,
    chat,
    games,
    instantMessaging,
    professionalNetwork,
    socialNetworking,
    webBasedEmail,
    parkedDomains
  ];

  static Category fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Category._(value));

  @override
  bool operator ==(other) => other is Category && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about a secure browser session.
///
/// @nodoc
class SessionSummary {
  /// The end time of the session.
  final DateTime? endTime;

  /// The ARN of the web portal.
  final String? portalArn;

  /// The ID of the session.
  final String? sessionId;

  /// The start time of the session.
  final DateTime? startTime;

  /// The status of the session.
  final SessionStatus? status;

  /// The username of the session.
  final String? username;

  SessionSummary({
    this.endTime,
    this.portalArn,
    this.sessionId,
    this.startTime,
    this.status,
    this.username,
  });

  factory SessionSummary.fromJson(Map<String, dynamic> json) {
    return SessionSummary(
      endTime: timeStampFromJson(json['endTime']),
      portalArn: json['portalArn'] as String?,
      sessionId: json['sessionId'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.let(SessionStatus.fromString),
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final portalArn = this.portalArn;
    final sessionId = this.sessionId;
    final startTime = this.startTime;
    final status = this.status;
    final username = this.username;
    return {
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (portalArn != null) 'portalArn': portalArn,
      if (sessionId != null) 'sessionId': sessionId,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.value,
      if (username != null) 'username': username,
    };
  }
}

/// @nodoc
class SessionStatus {
  static const active = SessionStatus._('Active');
  static const terminated = SessionStatus._('Terminated');

  final String value;

  const SessionStatus._(this.value);

  static const values = [active, terminated];

  static SessionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SessionStatus._(value));

  @override
  bool operator ==(other) => other is SessionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SessionSortBy {
  static const startTimeAscending = SessionSortBy._('StartTimeAscending');
  static const startTimeDescending = SessionSortBy._('StartTimeDescending');

  final String value;

  const SessionSortBy._(this.value);

  static const values = [startTimeAscending, startTimeDescending];

  static SessionSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SessionSortBy._(value));

  @override
  bool operator ==(other) => other is SessionSortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about a secure browser session.
///
/// @nodoc
class Session {
  /// The IP address of the client.
  final List<String>? clientIpAddresses;

  /// The end time of the session.
  final DateTime? endTime;

  /// The ARN of the web portal.
  final String? portalArn;

  /// The ID of the session.
  final String? sessionId;

  /// The start time of the session.
  final DateTime? startTime;

  /// The status of the session.
  final SessionStatus? status;

  /// The username of the session.
  final String? username;

  Session({
    this.clientIpAddresses,
    this.endTime,
    this.portalArn,
    this.sessionId,
    this.startTime,
    this.status,
    this.username,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      clientIpAddresses: (json['clientIpAddresses'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      endTime: timeStampFromJson(json['endTime']),
      portalArn: json['portalArn'] as String?,
      sessionId: json['sessionId'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.let(SessionStatus.fromString),
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientIpAddresses = this.clientIpAddresses;
    final endTime = this.endTime;
    final portalArn = this.portalArn;
    final sessionId = this.sessionId;
    final startTime = this.startTime;
    final status = this.status;
    final username = this.username;
    return {
      if (clientIpAddresses != null) 'clientIpAddresses': clientIpAddresses,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (portalArn != null) 'portalArn': portalArn,
      if (sessionId != null) 'sessionId': sessionId,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.value,
      if (username != null) 'username': username,
    };
  }
}

/// @nodoc
class Unit {
  Unit();

  factory Unit.fromJson(Map<String, dynamic> _) {
    return Unit();
  }

  Map<String, dynamic> toJson() {
    return {};
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
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
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
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
