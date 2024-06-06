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

/// Amazon Web Services AppFabric quickly connects software as a service (SaaS)
/// applications across your organization. This allows IT and security teams to
/// easily manage and secure applications using a standard schema, and employees
/// can complete everyday tasks faster using generative artificial intelligence
/// (AI). You can use these APIs to complete AppFabric tasks, such as setting up
/// audit log ingestions or viewing user access. For more information about
/// AppFabric, including the required permissions to use the service, see the <a
/// href="https://docs.aws.amazon.com/appfabric/latest/adminguide/">Amazon Web
/// Services AppFabric Administration Guide</a>. For more information about
/// using the Command Line Interface (CLI) to manage your AppFabric resources,
/// see the <a
/// href="https://docs.aws.amazon.com/cli/latest/reference/appfabric/index.html">AppFabric
/// section of the CLI Reference</a>.
class AppFabric {
  final _s.RestJsonProtocol _protocol;
  AppFabric({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'appfabric',
            signingName: 'appfabric',
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

  /// Gets user access details in a batch request.
  ///
  /// This action polls data from the tasks that are kicked off by the
  /// <code>StartUserAccessTasks</code> action.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle to use for the request.
  ///
  /// Parameter [taskIdList] :
  /// The tasks IDs to use for the request.
  Future<BatchGetUserAccessTasksResponse> batchGetUserAccessTasks({
    required String appBundleIdentifier,
    required List<String> taskIdList,
  }) async {
    final $payload = <String, dynamic>{
      'appBundleIdentifier': appBundleIdentifier,
      'taskIdList': taskIdList,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/useraccess/batchget',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetUserAccessTasksResponse.fromJson(response);
  }

  /// Establishes a connection between Amazon Web Services AppFabric and an
  /// application, which allows AppFabric to call the APIs of the application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appAuthorizationIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app authorization to use for the request.
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle that contains the app authorization to use for the request.
  ///
  /// Parameter [authRequest] :
  /// Contains OAuth2 authorization information.
  ///
  /// This is required if the app authorization for the request is configured
  /// with an OAuth2 (<code>oauth2</code>) authorization type.
  Future<ConnectAppAuthorizationResponse> connectAppAuthorization({
    required String appAuthorizationIdentifier,
    required String appBundleIdentifier,
    AuthRequest? authRequest,
  }) async {
    final $payload = <String, dynamic>{
      if (authRequest != null) 'authRequest': authRequest,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/appbundles/${Uri.encodeComponent(appBundleIdentifier)}/appauthorizations/${Uri.encodeComponent(appAuthorizationIdentifier)}/connect',
      exceptionFnMap: _exceptionFns,
    );
    return ConnectAppAuthorizationResponse.fromJson(response);
  }

  /// Creates an app authorization within an app bundle, which allows AppFabric
  /// to connect to an application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [app] :
  /// The name of the application.
  ///
  /// Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>SLACK</code>
  /// </li>
  /// <li>
  /// <code>ASANA</code>
  /// </li>
  /// <li>
  /// <code>JIRA</code>
  /// </li>
  /// <li>
  /// <code>M365</code>
  /// </li>
  /// <li>
  /// <code>M365AUDITLOGS</code>
  /// </li>
  /// <li>
  /// <code>ZOOM</code>
  /// </li>
  /// <li>
  /// <code>ZENDESK</code>
  /// </li>
  /// <li>
  /// <code>OKTA</code>
  /// </li>
  /// <li>
  /// <code>GOOGLE</code>
  /// </li>
  /// <li>
  /// <code>DROPBOX</code>
  /// </li>
  /// <li>
  /// <code>SMARTSHEET</code>
  /// </li>
  /// <li>
  /// <code>CISCO</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle to use for the request.
  ///
  /// Parameter [authType] :
  /// The authorization type for the app authorization.
  ///
  /// Parameter [credential] :
  /// Contains credentials for the application, such as an API key or OAuth2
  /// client ID and secret.
  ///
  /// Specify credentials that match the authorization type for your request.
  /// For example, if the authorization type for your request is OAuth2
  /// (<code>oauth2</code>), then you should provide only the OAuth2
  /// credentials.
  ///
  /// Parameter [tenant] :
  /// Contains information about an application tenant, such as the application
  /// display name and identifier.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign to the resource.
  Future<CreateAppAuthorizationResponse> createAppAuthorization({
    required String app,
    required String appBundleIdentifier,
    required AuthType authType,
    required Credential credential,
    required Tenant tenant,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'app': app,
      'authType': authType.toValue(),
      'credential': credential,
      'tenant': tenant,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/appbundles/${Uri.encodeComponent(appBundleIdentifier)}/appauthorizations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAppAuthorizationResponse.fromJson(response);
  }

  /// Creates an app bundle to collect data from an application using AppFabric.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  ///
  /// Parameter [customerManagedKeyIdentifier] :
  /// The Amazon Resource Name (ARN) of the Key Management Service (KMS) key to
  /// use to encrypt the application data. If this is not specified, an Amazon
  /// Web Services owned key is used for encryption.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign to the resource.
  Future<CreateAppBundleResponse> createAppBundle({
    String? clientToken,
    String? customerManagedKeyIdentifier,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (customerManagedKeyIdentifier != null)
        'customerManagedKeyIdentifier': customerManagedKeyIdentifier,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/appbundles',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAppBundleResponse.fromJson(response);
  }

  /// Creates a data ingestion for an application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [app] :
  /// The name of the application.
  ///
  /// Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>SLACK</code>
  /// </li>
  /// <li>
  /// <code>ASANA</code>
  /// </li>
  /// <li>
  /// <code>JIRA</code>
  /// </li>
  /// <li>
  /// <code>M365</code>
  /// </li>
  /// <li>
  /// <code>M365AUDITLOGS</code>
  /// </li>
  /// <li>
  /// <code>ZOOM</code>
  /// </li>
  /// <li>
  /// <code>ZENDESK</code>
  /// </li>
  /// <li>
  /// <code>OKTA</code>
  /// </li>
  /// <li>
  /// <code>GOOGLE</code>
  /// </li>
  /// <li>
  /// <code>DROPBOX</code>
  /// </li>
  /// <li>
  /// <code>SMARTSHEET</code>
  /// </li>
  /// <li>
  /// <code>CISCO</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle to use for the request.
  ///
  /// Parameter [ingestionType] :
  /// The ingestion type.
  ///
  /// Parameter [tenantId] :
  /// The ID of the application tenant.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign to the resource.
  Future<CreateIngestionResponse> createIngestion({
    required String app,
    required String appBundleIdentifier,
    required IngestionType ingestionType,
    required String tenantId,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'app': app,
      'ingestionType': ingestionType.toValue(),
      'tenantId': tenantId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/appbundles/${Uri.encodeComponent(appBundleIdentifier)}/ingestions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIngestionResponse.fromJson(response);
  }

  /// Creates an ingestion destination, which specifies how an application's
  /// ingested data is processed by Amazon Web Services AppFabric and where it's
  /// delivered.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle to use for the request.
  ///
  /// Parameter [destinationConfiguration] :
  /// Contains information about the destination of ingested data.
  ///
  /// Parameter [ingestionIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the ingestion to use for the request.
  ///
  /// Parameter [processingConfiguration] :
  /// Contains information about how ingested data is processed.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotentParameterMismatch</code> error.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign to the resource.
  Future<CreateIngestionDestinationResponse> createIngestionDestination({
    required String appBundleIdentifier,
    required DestinationConfiguration destinationConfiguration,
    required String ingestionIdentifier,
    required ProcessingConfiguration processingConfiguration,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'destinationConfiguration': destinationConfiguration,
      'processingConfiguration': processingConfiguration,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/appbundles/${Uri.encodeComponent(appBundleIdentifier)}/ingestions/${Uri.encodeComponent(ingestionIdentifier)}/ingestiondestinations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIngestionDestinationResponse.fromJson(response);
  }

  /// Deletes an app authorization. You must delete the associated ingestion
  /// before you can delete an app authorization.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appAuthorizationIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app authorization to use for the request.
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle to use for the request.
  Future<void> deleteAppAuthorization({
    required String appAuthorizationIdentifier,
    required String appBundleIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/appbundles/${Uri.encodeComponent(appBundleIdentifier)}/appauthorizations/${Uri.encodeComponent(appAuthorizationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an app bundle. You must delete all associated app authorizations
  /// before you can delete an app bundle.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appBundleIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the app bundle that needs to be
  /// deleted.
  Future<void> deleteAppBundle({
    required String appBundleIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/appbundles/${Uri.encodeComponent(appBundleIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an ingestion. You must stop (disable) the ingestion and you must
  /// delete all associated ingestion destinations before you can delete an app
  /// ingestion.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle to use for the request.
  ///
  /// Parameter [ingestionIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the ingestion to use for the request.
  Future<void> deleteIngestion({
    required String appBundleIdentifier,
    required String ingestionIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/appbundles/${Uri.encodeComponent(appBundleIdentifier)}/ingestions/${Uri.encodeComponent(ingestionIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an ingestion destination.
  ///
  /// This deletes the association between an ingestion and it's destination. It
  /// doesn't delete previously ingested data or the storage destination, such
  /// as the Amazon S3 bucket where the data is delivered. If the ingestion
  /// destination is deleted while the associated ingestion is enabled, the
  /// ingestion will fail and is eventually disabled.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle to use for the request.
  ///
  /// Parameter [ingestionDestinationIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the ingestion destination to use for the request.
  ///
  /// Parameter [ingestionIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the ingestion to use for the request.
  Future<void> deleteIngestionDestination({
    required String appBundleIdentifier,
    required String ingestionDestinationIdentifier,
    required String ingestionIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/appbundles/${Uri.encodeComponent(appBundleIdentifier)}/ingestions/${Uri.encodeComponent(ingestionIdentifier)}/ingestiondestinations/${Uri.encodeComponent(ingestionDestinationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns information about an app authorization.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appAuthorizationIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app authorization to use for the request.
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle to use for the request.
  Future<GetAppAuthorizationResponse> getAppAuthorization({
    required String appAuthorizationIdentifier,
    required String appBundleIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/appbundles/${Uri.encodeComponent(appBundleIdentifier)}/appauthorizations/${Uri.encodeComponent(appAuthorizationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAppAuthorizationResponse.fromJson(response);
  }

  /// Returns information about an app bundle.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle to use for the request.
  Future<GetAppBundleResponse> getAppBundle({
    required String appBundleIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/appbundles/${Uri.encodeComponent(appBundleIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAppBundleResponse.fromJson(response);
  }

  /// Returns information about an ingestion.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle to use for the request.
  ///
  /// Parameter [ingestionIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the ingestion to use for the request.
  Future<GetIngestionResponse> getIngestion({
    required String appBundleIdentifier,
    required String ingestionIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/appbundles/${Uri.encodeComponent(appBundleIdentifier)}/ingestions/${Uri.encodeComponent(ingestionIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetIngestionResponse.fromJson(response);
  }

  /// Returns information about an ingestion destination.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle to use for the request.
  ///
  /// Parameter [ingestionDestinationIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the ingestion destination to use for the request.
  ///
  /// Parameter [ingestionIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the ingestion to use for the request.
  Future<GetIngestionDestinationResponse> getIngestionDestination({
    required String appBundleIdentifier,
    required String ingestionDestinationIdentifier,
    required String ingestionIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/appbundles/${Uri.encodeComponent(appBundleIdentifier)}/ingestions/${Uri.encodeComponent(ingestionIdentifier)}/ingestiondestinations/${Uri.encodeComponent(ingestionDestinationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetIngestionDestinationResponse.fromJson(response);
  }

  /// Returns a list of all app authorizations configured for an app bundle.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle to use for the request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken error</i>.
  Future<ListAppAuthorizationsResponse> listAppAuthorizations({
    required String appBundleIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/appbundles/${Uri.encodeComponent(appBundleIdentifier)}/appauthorizations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAppAuthorizationsResponse.fromJson(response);
  }

  /// Returns a list of app bundles.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken error</i>.
  Future<ListAppBundlesResponse> listAppBundles({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/appbundles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAppBundlesResponse.fromJson(response);
  }

  /// Returns a list of all ingestion destinations configured for an ingestion.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle to use for the request.
  ///
  /// Parameter [ingestionIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the ingestion to use for the request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken error</i>.
  Future<ListIngestionDestinationsResponse> listIngestionDestinations({
    required String appBundleIdentifier,
    required String ingestionIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/appbundles/${Uri.encodeComponent(appBundleIdentifier)}/ingestions/${Uri.encodeComponent(ingestionIdentifier)}/ingestiondestinations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIngestionDestinationsResponse.fromJson(response);
  }

  /// Returns a list of all ingestions configured for an app bundle.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle to use for the request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken error</i>.
  Future<ListIngestionsResponse> listIngestions({
    required String appBundleIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/appbundles/${Uri.encodeComponent(appBundleIdentifier)}/ingestions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIngestionsResponse.fromJson(response);
  }

  /// Returns a list of tags for a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which you want to
  /// retrieve tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Starts (enables) an ingestion, which collects data from an application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle to use for the request.
  ///
  /// Parameter [ingestionIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the ingestion to use for the request.
  Future<void> startIngestion({
    required String appBundleIdentifier,
    required String ingestionIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/appbundles/${Uri.encodeComponent(appBundleIdentifier)}/ingestions/${Uri.encodeComponent(ingestionIdentifier)}/start',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts the tasks to search user access status for a specific email
  /// address.
  ///
  /// The tasks are stopped when the user access status data is found. The tasks
  /// are terminated when the API calls to the application time out.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle to use for the request.
  ///
  /// Parameter [email] :
  /// The email address of the target user.
  Future<StartUserAccessTasksResponse> startUserAccessTasks({
    required String appBundleIdentifier,
    required String email,
  }) async {
    final $payload = <String, dynamic>{
      'appBundleIdentifier': appBundleIdentifier,
      'email': email,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/useraccess/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartUserAccessTasksResponse.fromJson(response);
  }

  /// Stops (disables) an ingestion.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle to use for the request.
  ///
  /// Parameter [ingestionIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the ingestion to use for the request.
  Future<void> stopIngestion({
    required String appBundleIdentifier,
    required String ingestionIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/appbundles/${Uri.encodeComponent(appBundleIdentifier)}/ingestions/${Uri.encodeComponent(ingestionIdentifier)}/stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Assigns one or more tags (key-value pairs) to the specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to tag.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs of the tag or tags to assign to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a tag or tags from a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to untag.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the key-value pairs for the tag or tags you want to remove
  /// from the specified resource.
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
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an app authorization within an app bundle, which allows AppFabric
  /// to connect to an application.
  ///
  /// If the app authorization was in a <code>connected</code> state, updating
  /// the app authorization will set it back to a <code>PendingConnect</code>
  /// state.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appAuthorizationIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app authorization to use for the request.
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle to use for the request.
  ///
  /// Parameter [credential] :
  /// Contains credentials for the application, such as an API key or OAuth2
  /// client ID and secret.
  ///
  /// Specify credentials that match the authorization type of the app
  /// authorization to update. For example, if the authorization type of the app
  /// authorization is OAuth2 (<code>oauth2</code>), then you should provide
  /// only the OAuth2 credentials.
  ///
  /// Parameter [tenant] :
  /// Contains information about an application tenant, such as the application
  /// display name and identifier.
  Future<UpdateAppAuthorizationResponse> updateAppAuthorization({
    required String appAuthorizationIdentifier,
    required String appBundleIdentifier,
    Credential? credential,
    Tenant? tenant,
  }) async {
    final $payload = <String, dynamic>{
      if (credential != null) 'credential': credential,
      if (tenant != null) 'tenant': tenant,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/appbundles/${Uri.encodeComponent(appBundleIdentifier)}/appauthorizations/${Uri.encodeComponent(appAuthorizationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAppAuthorizationResponse.fromJson(response);
  }

  /// Updates an ingestion destination, which specifies how an application's
  /// ingested data is processed by Amazon Web Services AppFabric and where it's
  /// delivered.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appBundleIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the app bundle to use for the request.
  ///
  /// Parameter [destinationConfiguration] :
  /// Contains information about the destination of ingested data.
  ///
  /// Parameter [ingestionDestinationIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the ingestion destination to use for the request.
  ///
  /// Parameter [ingestionIdentifier] :
  /// The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of
  /// the ingestion to use for the request.
  Future<UpdateIngestionDestinationResponse> updateIngestionDestination({
    required String appBundleIdentifier,
    required DestinationConfiguration destinationConfiguration,
    required String ingestionDestinationIdentifier,
    required String ingestionIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'destinationConfiguration': destinationConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/appbundles/${Uri.encodeComponent(appBundleIdentifier)}/ingestions/${Uri.encodeComponent(ingestionIdentifier)}/ingestiondestinations/${Uri.encodeComponent(ingestionDestinationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateIngestionDestinationResponse.fromJson(response);
  }
}

/// Contains API key credential information.
class ApiKeyCredential {
  /// An API key for an application.
  final String apiKey;

  ApiKeyCredential({
    required this.apiKey,
  });

  Map<String, dynamic> toJson() {
    final apiKey = this.apiKey;
    return {
      'apiKey': apiKey,
    };
  }
}

/// Contains information about an app authorization.
class AppAuthorization {
  /// The name of the application.
  final String app;

  /// The Amazon Resource Name (ARN) of the app authorization.
  final String appAuthorizationArn;

  /// The Amazon Resource Name (ARN) of the app bundle for the app authorization.
  final String appBundleArn;

  /// The authorization type.
  final AuthType authType;

  /// The timestamp of when the app authorization was created.
  final DateTime createdAt;

  /// The state of the app authorization.
  ///
  /// The following states are possible:
  ///
  /// <ul>
  /// <li>
  /// <code>PendingConnect</code>: The initial state of the app authorization. The
  /// app authorization is created but not yet connected.
  /// </li>
  /// <li>
  /// <code>Connected</code>: The app authorization is connected to the
  /// application, and is ready to be used.
  /// </li>
  /// <li>
  /// <code>ConnectionValidationFailed</code>: The app authorization received a
  /// validation exception when trying to connect to the application. If the app
  /// authorization is in this state, you should verify the configured credentials
  /// and try to connect the app authorization again.
  /// </li>
  /// <li>
  /// <code>TokenAutoRotationFailed</code>: AppFabric failed to refresh the access
  /// token. If the app authorization is in this state, you should try to
  /// reconnect the app authorization.
  /// </li>
  /// </ul>
  final AppAuthorizationStatus status;

  /// Contains information about an application tenant, such as the application
  /// display name and identifier.
  final Tenant tenant;

  /// The timestamp of when the app authorization was last updated.
  final DateTime updatedAt;

  /// The application URL for the OAuth flow.
  final String? authUrl;

  /// The user persona of the app authorization.
  ///
  /// This field should always be <code>admin</code>.
  final Persona? persona;

  AppAuthorization({
    required this.app,
    required this.appAuthorizationArn,
    required this.appBundleArn,
    required this.authType,
    required this.createdAt,
    required this.status,
    required this.tenant,
    required this.updatedAt,
    this.authUrl,
    this.persona,
  });

  factory AppAuthorization.fromJson(Map<String, dynamic> json) {
    return AppAuthorization(
      app: json['app'] as String,
      appAuthorizationArn: json['appAuthorizationArn'] as String,
      appBundleArn: json['appBundleArn'] as String,
      authType: (json['authType'] as String).toAuthType(),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      status: (json['status'] as String).toAppAuthorizationStatus(),
      tenant: Tenant.fromJson(json['tenant'] as Map<String, dynamic>),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      authUrl: json['authUrl'] as String?,
      persona: (json['persona'] as String?)?.toPersona(),
    );
  }

  Map<String, dynamic> toJson() {
    final app = this.app;
    final appAuthorizationArn = this.appAuthorizationArn;
    final appBundleArn = this.appBundleArn;
    final authType = this.authType;
    final createdAt = this.createdAt;
    final status = this.status;
    final tenant = this.tenant;
    final updatedAt = this.updatedAt;
    final authUrl = this.authUrl;
    final persona = this.persona;
    return {
      'app': app,
      'appAuthorizationArn': appAuthorizationArn,
      'appBundleArn': appBundleArn,
      'authType': authType.toValue(),
      'createdAt': iso8601ToJson(createdAt),
      'status': status.toValue(),
      'tenant': tenant,
      'updatedAt': iso8601ToJson(updatedAt),
      if (authUrl != null) 'authUrl': authUrl,
      if (persona != null) 'persona': persona.toValue(),
    };
  }
}

enum AppAuthorizationStatus {
  pendingConnect,
  connected,
  connectionValidationFailed,
  tokenAutoRotationFailed,
}

extension AppAuthorizationStatusValueExtension on AppAuthorizationStatus {
  String toValue() {
    switch (this) {
      case AppAuthorizationStatus.pendingConnect:
        return 'PendingConnect';
      case AppAuthorizationStatus.connected:
        return 'Connected';
      case AppAuthorizationStatus.connectionValidationFailed:
        return 'ConnectionValidationFailed';
      case AppAuthorizationStatus.tokenAutoRotationFailed:
        return 'TokenAutoRotationFailed';
    }
  }
}

extension AppAuthorizationStatusFromString on String {
  AppAuthorizationStatus toAppAuthorizationStatus() {
    switch (this) {
      case 'PendingConnect':
        return AppAuthorizationStatus.pendingConnect;
      case 'Connected':
        return AppAuthorizationStatus.connected;
      case 'ConnectionValidationFailed':
        return AppAuthorizationStatus.connectionValidationFailed;
      case 'TokenAutoRotationFailed':
        return AppAuthorizationStatus.tokenAutoRotationFailed;
    }
    throw Exception('$this is not known in enum AppAuthorizationStatus');
  }
}

/// Contains a summary of an app authorization.
class AppAuthorizationSummary {
  /// The name of the application.
  final String app;

  /// The Amazon Resource Name (ARN) of the app authorization.
  final String appAuthorizationArn;

  /// The Amazon Resource Name (ARN) of the app bundle for the app authorization.
  final String appBundleArn;

  /// The state of the app authorization.
  ///
  /// The following states are possible:
  ///
  /// <ul>
  /// <li>
  /// <code>PendingConnect</code>: The initial state of the app authorization. The
  /// app authorization is created but not yet connected.
  /// </li>
  /// <li>
  /// <code>Connected</code>: The app authorization is connected to the
  /// application, and is ready to be used.
  /// </li>
  /// <li>
  /// <code>ConnectionValidationFailed</code>: The app authorization received a
  /// validation exception when trying to connect to the application. If the app
  /// authorization is in this state, you should verify the configured credentials
  /// and try to connect the app authorization again.
  /// </li>
  /// <li>
  /// <code>TokenAutoRotationFailed</code>: AppFabric failed to refresh the access
  /// token. If the app authorization is in this state, you should try to
  /// reconnect the app authorization.
  /// </li>
  /// </ul>
  final AppAuthorizationStatus status;

  /// Contains information about an application tenant, such as the application
  /// display name and identifier.
  final Tenant tenant;

  /// Timestamp for when the app authorization was last updated.
  final DateTime updatedAt;

  AppAuthorizationSummary({
    required this.app,
    required this.appAuthorizationArn,
    required this.appBundleArn,
    required this.status,
    required this.tenant,
    required this.updatedAt,
  });

  factory AppAuthorizationSummary.fromJson(Map<String, dynamic> json) {
    return AppAuthorizationSummary(
      app: json['app'] as String,
      appAuthorizationArn: json['appAuthorizationArn'] as String,
      appBundleArn: json['appBundleArn'] as String,
      status: (json['status'] as String).toAppAuthorizationStatus(),
      tenant: Tenant.fromJson(json['tenant'] as Map<String, dynamic>),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final app = this.app;
    final appAuthorizationArn = this.appAuthorizationArn;
    final appBundleArn = this.appBundleArn;
    final status = this.status;
    final tenant = this.tenant;
    final updatedAt = this.updatedAt;
    return {
      'app': app,
      'appAuthorizationArn': appAuthorizationArn,
      'appBundleArn': appBundleArn,
      'status': status.toValue(),
      'tenant': tenant,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Contains information about an app bundle.
class AppBundle {
  /// The Amazon Resource Name (ARN) of the app bundle.
  final String arn;

  /// The Amazon Resource Name (ARN) of the Key Management Service (KMS) key used
  /// to encrypt the application data.
  final String? customerManagedKeyArn;

  AppBundle({
    required this.arn,
    this.customerManagedKeyArn,
  });

  factory AppBundle.fromJson(Map<String, dynamic> json) {
    return AppBundle(
      arn: json['arn'] as String,
      customerManagedKeyArn: json['customerManagedKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final customerManagedKeyArn = this.customerManagedKeyArn;
    return {
      'arn': arn,
      if (customerManagedKeyArn != null)
        'customerManagedKeyArn': customerManagedKeyArn,
    };
  }
}

/// Contains a summary of an app bundle.
class AppBundleSummary {
  /// The Amazon Resource Name (ARN) of the app bundle.
  final String arn;

  AppBundleSummary({
    required this.arn,
  });

  factory AppBundleSummary.fromJson(Map<String, dynamic> json) {
    return AppBundleSummary(
      arn: json['arn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// Contains information about an audit log destination configuration.
class AuditLogDestinationConfiguration {
  /// Contains information about an audit log destination.
  final Destination destination;

  AuditLogDestinationConfiguration({
    required this.destination,
  });

  factory AuditLogDestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return AuditLogDestinationConfiguration(
      destination:
          Destination.fromJson(json['destination'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    return {
      'destination': destination,
    };
  }
}

/// Contains information about an audit log processing configuration.
class AuditLogProcessingConfiguration {
  /// The format in which the audit logs need to be formatted.
  final Format format;

  /// The event schema in which the audit logs need to be formatted.
  final Schema schema;

  AuditLogProcessingConfiguration({
    required this.format,
    required this.schema,
  });

  factory AuditLogProcessingConfiguration.fromJson(Map<String, dynamic> json) {
    return AuditLogProcessingConfiguration(
      format: (json['format'] as String).toFormat(),
      schema: (json['schema'] as String).toSchema(),
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final schema = this.schema;
    return {
      'format': format.toValue(),
      'schema': schema.toValue(),
    };
  }
}

/// Contains authorization request information, which is required for Amazon Web
/// Services AppFabric to get the OAuth2 access token for an application.
class AuthRequest {
  /// The authorization code returned by the application after permission is
  /// granted in the application OAuth page (after clicking on the AuthURL).
  final String code;

  /// The redirect URL that is specified in the AuthURL and the application
  /// client.
  final String redirectUri;

  AuthRequest({
    required this.code,
    required this.redirectUri,
  });

  Map<String, dynamic> toJson() {
    final code = this.code;
    final redirectUri = this.redirectUri;
    return {
      'code': code,
      'redirectUri': redirectUri,
    };
  }
}

enum AuthType {
  oauth2,
  apiKey,
}

extension AuthTypeValueExtension on AuthType {
  String toValue() {
    switch (this) {
      case AuthType.oauth2:
        return 'oauth2';
      case AuthType.apiKey:
        return 'apiKey';
    }
  }
}

extension AuthTypeFromString on String {
  AuthType toAuthType() {
    switch (this) {
      case 'oauth2':
        return AuthType.oauth2;
      case 'apiKey':
        return AuthType.apiKey;
    }
    throw Exception('$this is not known in enum AuthType');
  }
}

class BatchGetUserAccessTasksResponse {
  /// Contains a list of user access results.
  final List<UserAccessResultItem>? userAccessResultsList;

  BatchGetUserAccessTasksResponse({
    this.userAccessResultsList,
  });

  factory BatchGetUserAccessTasksResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetUserAccessTasksResponse(
      userAccessResultsList: (json['userAccessResultsList'] as List?)
          ?.whereNotNull()
          .map((e) => UserAccessResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final userAccessResultsList = this.userAccessResultsList;
    return {
      if (userAccessResultsList != null)
        'userAccessResultsList': userAccessResultsList,
    };
  }
}

class ConnectAppAuthorizationResponse {
  /// Contains a summary of the app authorization.
  final AppAuthorizationSummary appAuthorizationSummary;

  ConnectAppAuthorizationResponse({
    required this.appAuthorizationSummary,
  });

  factory ConnectAppAuthorizationResponse.fromJson(Map<String, dynamic> json) {
    return ConnectAppAuthorizationResponse(
      appAuthorizationSummary: AppAuthorizationSummary.fromJson(
          json['appAuthorizationSummary'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final appAuthorizationSummary = this.appAuthorizationSummary;
    return {
      'appAuthorizationSummary': appAuthorizationSummary,
    };
  }
}

class CreateAppAuthorizationResponse {
  /// Contains information about an app authorization.
  final AppAuthorization appAuthorization;

  CreateAppAuthorizationResponse({
    required this.appAuthorization,
  });

  factory CreateAppAuthorizationResponse.fromJson(Map<String, dynamic> json) {
    return CreateAppAuthorizationResponse(
      appAuthorization: AppAuthorization.fromJson(
          json['appAuthorization'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final appAuthorization = this.appAuthorization;
    return {
      'appAuthorization': appAuthorization,
    };
  }
}

class CreateAppBundleResponse {
  /// Contains information about an app bundle.
  final AppBundle appBundle;

  CreateAppBundleResponse({
    required this.appBundle,
  });

  factory CreateAppBundleResponse.fromJson(Map<String, dynamic> json) {
    return CreateAppBundleResponse(
      appBundle: AppBundle.fromJson(json['appBundle'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final appBundle = this.appBundle;
    return {
      'appBundle': appBundle,
    };
  }
}

class CreateIngestionDestinationResponse {
  /// Contains information about an ingestion destination.
  final IngestionDestination ingestionDestination;

  CreateIngestionDestinationResponse({
    required this.ingestionDestination,
  });

  factory CreateIngestionDestinationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateIngestionDestinationResponse(
      ingestionDestination: IngestionDestination.fromJson(
          json['ingestionDestination'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final ingestionDestination = this.ingestionDestination;
    return {
      'ingestionDestination': ingestionDestination,
    };
  }
}

class CreateIngestionResponse {
  /// Contains information about an ingestion.
  final Ingestion ingestion;

  CreateIngestionResponse({
    required this.ingestion,
  });

  factory CreateIngestionResponse.fromJson(Map<String, dynamic> json) {
    return CreateIngestionResponse(
      ingestion: Ingestion.fromJson(json['ingestion'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final ingestion = this.ingestion;
    return {
      'ingestion': ingestion,
    };
  }
}

/// Contains credential information for an application.
class Credential {
  /// Contains API key credential information.
  final ApiKeyCredential? apiKeyCredential;

  /// Contains OAuth2 client credential information.
  final Oauth2Credential? oauth2Credential;

  Credential({
    this.apiKeyCredential,
    this.oauth2Credential,
  });

  Map<String, dynamic> toJson() {
    final apiKeyCredential = this.apiKeyCredential;
    final oauth2Credential = this.oauth2Credential;
    return {
      if (apiKeyCredential != null) 'apiKeyCredential': apiKeyCredential,
      if (oauth2Credential != null) 'oauth2Credential': oauth2Credential,
    };
  }
}

class DeleteAppAuthorizationResponse {
  DeleteAppAuthorizationResponse();

  factory DeleteAppAuthorizationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAppAuthorizationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAppBundleResponse {
  DeleteAppBundleResponse();

  factory DeleteAppBundleResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAppBundleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteIngestionDestinationResponse {
  DeleteIngestionDestinationResponse();

  factory DeleteIngestionDestinationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteIngestionDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteIngestionResponse {
  DeleteIngestionResponse();

  factory DeleteIngestionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteIngestionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains information about an audit log destination.
class Destination {
  /// Contains information about an Amazon Kinesis Data Firehose delivery stream.
  final FirehoseStream? firehoseStream;

  /// Contains information about an Amazon S3 bucket.
  final S3Bucket? s3Bucket;

  Destination({
    this.firehoseStream,
    this.s3Bucket,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      firehoseStream: json['firehoseStream'] != null
          ? FirehoseStream.fromJson(
              json['firehoseStream'] as Map<String, dynamic>)
          : null,
      s3Bucket: json['s3Bucket'] != null
          ? S3Bucket.fromJson(json['s3Bucket'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final firehoseStream = this.firehoseStream;
    final s3Bucket = this.s3Bucket;
    return {
      if (firehoseStream != null) 'firehoseStream': firehoseStream,
      if (s3Bucket != null) 's3Bucket': s3Bucket,
    };
  }
}

/// Contains information about the destination of ingested data.
class DestinationConfiguration {
  /// Contains information about an audit log destination configuration.
  final AuditLogDestinationConfiguration? auditLog;

  DestinationConfiguration({
    this.auditLog,
  });

  factory DestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return DestinationConfiguration(
      auditLog: json['auditLog'] != null
          ? AuditLogDestinationConfiguration.fromJson(
              json['auditLog'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final auditLog = this.auditLog;
    return {
      if (auditLog != null) 'auditLog': auditLog,
    };
  }
}

/// Contains information about an Amazon Kinesis Data Firehose delivery stream.
class FirehoseStream {
  /// The name of the Amazon Kinesis Data Firehose delivery stream.
  final String streamName;

  FirehoseStream({
    required this.streamName,
  });

  factory FirehoseStream.fromJson(Map<String, dynamic> json) {
    return FirehoseStream(
      streamName: json['streamName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final streamName = this.streamName;
    return {
      'streamName': streamName,
    };
  }
}

enum Format {
  json,
  parquet,
}

extension FormatValueExtension on Format {
  String toValue() {
    switch (this) {
      case Format.json:
        return 'json';
      case Format.parquet:
        return 'parquet';
    }
  }
}

extension FormatFromString on String {
  Format toFormat() {
    switch (this) {
      case 'json':
        return Format.json;
      case 'parquet':
        return Format.parquet;
    }
    throw Exception('$this is not known in enum Format');
  }
}

class GetAppAuthorizationResponse {
  /// Contains information about an app authorization.
  final AppAuthorization appAuthorization;

  GetAppAuthorizationResponse({
    required this.appAuthorization,
  });

  factory GetAppAuthorizationResponse.fromJson(Map<String, dynamic> json) {
    return GetAppAuthorizationResponse(
      appAuthorization: AppAuthorization.fromJson(
          json['appAuthorization'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final appAuthorization = this.appAuthorization;
    return {
      'appAuthorization': appAuthorization,
    };
  }
}

class GetAppBundleResponse {
  /// Contains information about an app bundle.
  final AppBundle appBundle;

  GetAppBundleResponse({
    required this.appBundle,
  });

  factory GetAppBundleResponse.fromJson(Map<String, dynamic> json) {
    return GetAppBundleResponse(
      appBundle: AppBundle.fromJson(json['appBundle'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final appBundle = this.appBundle;
    return {
      'appBundle': appBundle,
    };
  }
}

class GetIngestionDestinationResponse {
  /// Contains information about an ingestion destination.
  final IngestionDestination ingestionDestination;

  GetIngestionDestinationResponse({
    required this.ingestionDestination,
  });

  factory GetIngestionDestinationResponse.fromJson(Map<String, dynamic> json) {
    return GetIngestionDestinationResponse(
      ingestionDestination: IngestionDestination.fromJson(
          json['ingestionDestination'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final ingestionDestination = this.ingestionDestination;
    return {
      'ingestionDestination': ingestionDestination,
    };
  }
}

class GetIngestionResponse {
  /// Contains information about an ingestion.
  final Ingestion ingestion;

  GetIngestionResponse({
    required this.ingestion,
  });

  factory GetIngestionResponse.fromJson(Map<String, dynamic> json) {
    return GetIngestionResponse(
      ingestion: Ingestion.fromJson(json['ingestion'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final ingestion = this.ingestion;
    return {
      'ingestion': ingestion,
    };
  }
}

/// Contains information about an ingestion.
class Ingestion {
  /// The name of the application.
  final String app;

  /// The Amazon Resource Name (ARN) of the app bundle for the ingestion.
  final String appBundleArn;

  /// The Amazon Resource Name (ARN) of the ingestion.
  final String arn;

  /// The timestamp of when the ingestion was created.
  final DateTime createdAt;

  /// The type of the ingestion.
  final IngestionType ingestionType;

  /// The status of the ingestion.
  final IngestionState state;

  /// The ID of the application tenant.
  final String tenantId;

  /// The timestamp of when the ingestion was last updated.
  final DateTime updatedAt;

  Ingestion({
    required this.app,
    required this.appBundleArn,
    required this.arn,
    required this.createdAt,
    required this.ingestionType,
    required this.state,
    required this.tenantId,
    required this.updatedAt,
  });

  factory Ingestion.fromJson(Map<String, dynamic> json) {
    return Ingestion(
      app: json['app'] as String,
      appBundleArn: json['appBundleArn'] as String,
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      ingestionType: (json['ingestionType'] as String).toIngestionType(),
      state: (json['state'] as String).toIngestionState(),
      tenantId: json['tenantId'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final app = this.app;
    final appBundleArn = this.appBundleArn;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final ingestionType = this.ingestionType;
    final state = this.state;
    final tenantId = this.tenantId;
    final updatedAt = this.updatedAt;
    return {
      'app': app,
      'appBundleArn': appBundleArn,
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'ingestionType': ingestionType.toValue(),
      'state': state.toValue(),
      'tenantId': tenantId,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Contains information about an ingestion destination.
class IngestionDestination {
  /// The Amazon Resource Name (ARN) of the ingestion destination.
  final String arn;

  /// Contains information about the destination of ingested data.
  final DestinationConfiguration destinationConfiguration;

  /// The Amazon Resource Name (ARN) of the ingestion.
  final String ingestionArn;

  /// Contains information about how ingested data is processed.
  final ProcessingConfiguration processingConfiguration;

  /// The timestamp of when the ingestion destination was created.
  final DateTime? createdAt;

  /// The state of the ingestion destination.
  ///
  /// The following states are possible:
  ///
  /// <ul>
  /// <li>
  /// <code>Active</code>: The ingestion destination is active and is ready to be
  /// used.
  /// </li>
  /// <li>
  /// <code>Failed</code>: The ingestion destination has failed. If the ingestion
  /// destination is in this state, you should verify the ingestion destination
  /// configuration and try again.
  /// </li>
  /// </ul>
  final IngestionDestinationStatus? status;

  /// The reason for the current status of the ingestion destination.
  ///
  /// Only present when the <code>status</code> of ingestion destination is
  /// <code>Failed</code>.
  final String? statusReason;

  /// The timestamp of when the ingestion destination was last updated.
  final DateTime? updatedAt;

  IngestionDestination({
    required this.arn,
    required this.destinationConfiguration,
    required this.ingestionArn,
    required this.processingConfiguration,
    this.createdAt,
    this.status,
    this.statusReason,
    this.updatedAt,
  });

  factory IngestionDestination.fromJson(Map<String, dynamic> json) {
    return IngestionDestination(
      arn: json['arn'] as String,
      destinationConfiguration: DestinationConfiguration.fromJson(
          json['destinationConfiguration'] as Map<String, dynamic>),
      ingestionArn: json['ingestionArn'] as String,
      processingConfiguration: ProcessingConfiguration.fromJson(
          json['processingConfiguration'] as Map<String, dynamic>),
      createdAt: timeStampFromJson(json['createdAt']),
      status: (json['status'] as String?)?.toIngestionDestinationStatus(),
      statusReason: json['statusReason'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final destinationConfiguration = this.destinationConfiguration;
    final ingestionArn = this.ingestionArn;
    final processingConfiguration = this.processingConfiguration;
    final createdAt = this.createdAt;
    final status = this.status;
    final statusReason = this.statusReason;
    final updatedAt = this.updatedAt;
    return {
      'arn': arn,
      'destinationConfiguration': destinationConfiguration,
      'ingestionArn': ingestionArn,
      'processingConfiguration': processingConfiguration,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

enum IngestionDestinationStatus {
  active,
  failed,
}

extension IngestionDestinationStatusValueExtension
    on IngestionDestinationStatus {
  String toValue() {
    switch (this) {
      case IngestionDestinationStatus.active:
        return 'Active';
      case IngestionDestinationStatus.failed:
        return 'Failed';
    }
  }
}

extension IngestionDestinationStatusFromString on String {
  IngestionDestinationStatus toIngestionDestinationStatus() {
    switch (this) {
      case 'Active':
        return IngestionDestinationStatus.active;
      case 'Failed':
        return IngestionDestinationStatus.failed;
    }
    throw Exception('$this is not known in enum IngestionDestinationStatus');
  }
}

/// Contains a summary of an ingestion destination.
class IngestionDestinationSummary {
  /// The Amazon Resource Name (ARN) of the ingestion destination.
  final String arn;

  IngestionDestinationSummary({
    required this.arn,
  });

  factory IngestionDestinationSummary.fromJson(Map<String, dynamic> json) {
    return IngestionDestinationSummary(
      arn: json['arn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

enum IngestionState {
  enabled,
  disabled,
}

extension IngestionStateValueExtension on IngestionState {
  String toValue() {
    switch (this) {
      case IngestionState.enabled:
        return 'enabled';
      case IngestionState.disabled:
        return 'disabled';
    }
  }
}

extension IngestionStateFromString on String {
  IngestionState toIngestionState() {
    switch (this) {
      case 'enabled':
        return IngestionState.enabled;
      case 'disabled':
        return IngestionState.disabled;
    }
    throw Exception('$this is not known in enum IngestionState');
  }
}

/// Contains a summary of an ingestion.
class IngestionSummary {
  /// The name of the application.
  final String app;

  /// The Amazon Resource Name (ARN) of the ingestion.
  final String arn;

  /// The status of the ingestion.
  final IngestionState state;

  /// The ID of the application tenant.
  final String tenantId;

  IngestionSummary({
    required this.app,
    required this.arn,
    required this.state,
    required this.tenantId,
  });

  factory IngestionSummary.fromJson(Map<String, dynamic> json) {
    return IngestionSummary(
      app: json['app'] as String,
      arn: json['arn'] as String,
      state: (json['state'] as String).toIngestionState(),
      tenantId: json['tenantId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final app = this.app;
    final arn = this.arn;
    final state = this.state;
    final tenantId = this.tenantId;
    return {
      'app': app,
      'arn': arn,
      'state': state.toValue(),
      'tenantId': tenantId,
    };
  }
}

enum IngestionType {
  auditLog,
}

extension IngestionTypeValueExtension on IngestionType {
  String toValue() {
    switch (this) {
      case IngestionType.auditLog:
        return 'auditLog';
    }
  }
}

extension IngestionTypeFromString on String {
  IngestionType toIngestionType() {
    switch (this) {
      case 'auditLog':
        return IngestionType.auditLog;
    }
    throw Exception('$this is not known in enum IngestionType');
  }
}

class ListAppAuthorizationsResponse {
  /// Contains a list of app authorization summaries.
  final List<AppAuthorizationSummary> appAuthorizationSummaryList;

  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  /// Using an expired pagination token will return an <i>HTTP 400 InvalidToken
  /// error</i>.
  final String? nextToken;

  ListAppAuthorizationsResponse({
    required this.appAuthorizationSummaryList,
    this.nextToken,
  });

  factory ListAppAuthorizationsResponse.fromJson(Map<String, dynamic> json) {
    return ListAppAuthorizationsResponse(
      appAuthorizationSummaryList: (json['appAuthorizationSummaryList'] as List)
          .whereNotNull()
          .map((e) =>
              AppAuthorizationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appAuthorizationSummaryList = this.appAuthorizationSummaryList;
    final nextToken = this.nextToken;
    return {
      'appAuthorizationSummaryList': appAuthorizationSummaryList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAppBundlesResponse {
  /// Contains a list of app bundle summaries.
  final List<AppBundleSummary> appBundleSummaryList;

  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  /// Using an expired pagination token will return an <i>HTTP 400 InvalidToken
  /// error</i>.
  final String? nextToken;

  ListAppBundlesResponse({
    required this.appBundleSummaryList,
    this.nextToken,
  });

  factory ListAppBundlesResponse.fromJson(Map<String, dynamic> json) {
    return ListAppBundlesResponse(
      appBundleSummaryList: (json['appBundleSummaryList'] as List)
          .whereNotNull()
          .map((e) => AppBundleSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appBundleSummaryList = this.appBundleSummaryList;
    final nextToken = this.nextToken;
    return {
      'appBundleSummaryList': appBundleSummaryList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListIngestionDestinationsResponse {
  /// Contains a list of ingestion destination summaries.
  final List<IngestionDestinationSummary> ingestionDestinations;

  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  /// Using an expired pagination token will return an <i>HTTP 400 InvalidToken
  /// error</i>.
  final String? nextToken;

  ListIngestionDestinationsResponse({
    required this.ingestionDestinations,
    this.nextToken,
  });

  factory ListIngestionDestinationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListIngestionDestinationsResponse(
      ingestionDestinations: (json['ingestionDestinations'] as List)
          .whereNotNull()
          .map((e) =>
              IngestionDestinationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ingestionDestinations = this.ingestionDestinations;
    final nextToken = this.nextToken;
    return {
      'ingestionDestinations': ingestionDestinations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListIngestionsResponse {
  /// Contains a list of ingestion summaries.
  final List<IngestionSummary> ingestions;

  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  /// Using an expired pagination token will return an <i>HTTP 400 InvalidToken
  /// error</i>.
  final String? nextToken;

  ListIngestionsResponse({
    required this.ingestions,
    this.nextToken,
  });

  factory ListIngestionsResponse.fromJson(Map<String, dynamic> json) {
    return ListIngestionsResponse(
      ingestions: (json['ingestions'] as List)
          .whereNotNull()
          .map((e) => IngestionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ingestions = this.ingestions;
    final nextToken = this.nextToken;
    return {
      'ingestions': ingestions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// A map of the key-value pairs for the tag or tags assigned to the specified
  /// resource.
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

/// Contains OAuth2 client credential information.
class Oauth2Credential {
  /// The client ID of the client application.
  final String clientId;

  /// The client secret of the client application.
  final String clientSecret;

  Oauth2Credential({
    required this.clientId,
    required this.clientSecret,
  });

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final clientSecret = this.clientSecret;
    return {
      'clientId': clientId,
      'clientSecret': clientSecret,
    };
  }
}

enum Persona {
  admin,
  endUser,
}

extension PersonaValueExtension on Persona {
  String toValue() {
    switch (this) {
      case Persona.admin:
        return 'admin';
      case Persona.endUser:
        return 'endUser';
    }
  }
}

extension PersonaFromString on String {
  Persona toPersona() {
    switch (this) {
      case 'admin':
        return Persona.admin;
      case 'endUser':
        return Persona.endUser;
    }
    throw Exception('$this is not known in enum Persona');
  }
}

/// Contains information about how ingested data is processed.
class ProcessingConfiguration {
  /// Contains information about an audit log processing configuration.
  final AuditLogProcessingConfiguration? auditLog;

  ProcessingConfiguration({
    this.auditLog,
  });

  factory ProcessingConfiguration.fromJson(Map<String, dynamic> json) {
    return ProcessingConfiguration(
      auditLog: json['auditLog'] != null
          ? AuditLogProcessingConfiguration.fromJson(
              json['auditLog'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final auditLog = this.auditLog;
    return {
      if (auditLog != null) 'auditLog': auditLog,
    };
  }
}

enum ResultStatus {
  inProgress,
  completed,
  failed,
  expired,
}

extension ResultStatusValueExtension on ResultStatus {
  String toValue() {
    switch (this) {
      case ResultStatus.inProgress:
        return 'IN_PROGRESS';
      case ResultStatus.completed:
        return 'COMPLETED';
      case ResultStatus.failed:
        return 'FAILED';
      case ResultStatus.expired:
        return 'EXPIRED';
    }
  }
}

extension ResultStatusFromString on String {
  ResultStatus toResultStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return ResultStatus.inProgress;
      case 'COMPLETED':
        return ResultStatus.completed;
      case 'FAILED':
        return ResultStatus.failed;
      case 'EXPIRED':
        return ResultStatus.expired;
    }
    throw Exception('$this is not known in enum ResultStatus');
  }
}

/// Contains information about an Amazon S3 bucket.
class S3Bucket {
  /// The name of the Amazon S3 bucket.
  final String bucketName;

  /// The object key to use.
  final String? prefix;

  S3Bucket({
    required this.bucketName,
    this.prefix,
  });

  factory S3Bucket.fromJson(Map<String, dynamic> json) {
    return S3Bucket(
      bucketName: json['bucketName'] as String,
      prefix: json['prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final prefix = this.prefix;
    return {
      'bucketName': bucketName,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

enum Schema {
  ocsf,
  raw,
}

extension SchemaValueExtension on Schema {
  String toValue() {
    switch (this) {
      case Schema.ocsf:
        return 'ocsf';
      case Schema.raw:
        return 'raw';
    }
  }
}

extension SchemaFromString on String {
  Schema toSchema() {
    switch (this) {
      case 'ocsf':
        return Schema.ocsf;
      case 'raw':
        return Schema.raw;
    }
    throw Exception('$this is not known in enum Schema');
  }
}

class StartIngestionResponse {
  StartIngestionResponse();

  factory StartIngestionResponse.fromJson(Map<String, dynamic> _) {
    return StartIngestionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StartUserAccessTasksResponse {
  /// Contains a list of user access task information.
  final List<UserAccessTaskItem>? userAccessTasksList;

  StartUserAccessTasksResponse({
    this.userAccessTasksList,
  });

  factory StartUserAccessTasksResponse.fromJson(Map<String, dynamic> json) {
    return StartUserAccessTasksResponse(
      userAccessTasksList: (json['userAccessTasksList'] as List?)
          ?.whereNotNull()
          .map((e) => UserAccessTaskItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final userAccessTasksList = this.userAccessTasksList;
    return {
      if (userAccessTasksList != null)
        'userAccessTasksList': userAccessTasksList,
    };
  }
}

class StopIngestionResponse {
  StopIngestionResponse();

  factory StopIngestionResponse.fromJson(Map<String, dynamic> _) {
    return StopIngestionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The key or keys of the key-value pairs for the tag or tags assigned to a
/// resource.
class Tag {
  /// Tag key.
  final String key;

  /// Tag value.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
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

/// Contains information about an error returned from a user access task.
class TaskError {
  /// The code of the error.
  final String? errorCode;

  /// The message of the error.
  final String? errorMessage;

  TaskError({
    this.errorCode,
    this.errorMessage,
  });

  factory TaskError.fromJson(Map<String, dynamic> json) {
    return TaskError(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

/// Contains information about an application tenant.
class Tenant {
  /// The display name of the tenant.
  final String tenantDisplayName;

  /// The ID of the application tenant.
  final String tenantIdentifier;

  Tenant({
    required this.tenantDisplayName,
    required this.tenantIdentifier,
  });

  factory Tenant.fromJson(Map<String, dynamic> json) {
    return Tenant(
      tenantDisplayName: json['tenantDisplayName'] as String,
      tenantIdentifier: json['tenantIdentifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final tenantDisplayName = this.tenantDisplayName;
    final tenantIdentifier = this.tenantIdentifier;
    return {
      'tenantDisplayName': tenantDisplayName,
      'tenantIdentifier': tenantIdentifier,
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

class UpdateAppAuthorizationResponse {
  /// Contains information about an app authorization.
  final AppAuthorization appAuthorization;

  UpdateAppAuthorizationResponse({
    required this.appAuthorization,
  });

  factory UpdateAppAuthorizationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAppAuthorizationResponse(
      appAuthorization: AppAuthorization.fromJson(
          json['appAuthorization'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final appAuthorization = this.appAuthorization;
    return {
      'appAuthorization': appAuthorization,
    };
  }
}

class UpdateIngestionDestinationResponse {
  /// Contains information about an ingestion destination.
  final IngestionDestination ingestionDestination;

  UpdateIngestionDestinationResponse({
    required this.ingestionDestination,
  });

  factory UpdateIngestionDestinationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateIngestionDestinationResponse(
      ingestionDestination: IngestionDestination.fromJson(
          json['ingestionDestination'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final ingestionDestination = this.ingestionDestination;
    return {
      'ingestionDestination': ingestionDestination,
    };
  }
}

/// Contains information about a user's access to an application.
class UserAccessResultItem {
  /// The name of the application.
  final String? app;

  /// The email address of the target user.
  final String? email;

  /// The status of the user access result item.
  ///
  /// The following states are possible:
  ///
  /// <ul>
  /// <li>
  /// <code>IN_PROGRESS</code>: The user access task is in progress.
  /// </li>
  /// <li>
  /// <code>COMPLETED</code>: The user access task completed successfully.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: The user access task failed.
  /// </li>
  /// <li>
  /// <code>EXPIRED</code>: The user access task expired.
  /// </li>
  /// </ul>
  final ResultStatus? resultStatus;

  /// Contains information about an error returned from a user access task.
  final TaskError? taskError;

  /// The unique ID of the task.
  final String? taskId;

  /// The display name of the tenant.
  final String? tenantDisplayName;

  /// The ID of the application tenant.
  final String? tenantId;

  /// The first name of the user.
  final String? userFirstName;

  /// The full name of the user.
  final String? userFullName;

  /// The unique ID of user.
  final String? userId;

  /// The last name of the user.
  final String? userLastName;

  /// The status of the user returned by the application.
  final String? userStatus;

  UserAccessResultItem({
    this.app,
    this.email,
    this.resultStatus,
    this.taskError,
    this.taskId,
    this.tenantDisplayName,
    this.tenantId,
    this.userFirstName,
    this.userFullName,
    this.userId,
    this.userLastName,
    this.userStatus,
  });

  factory UserAccessResultItem.fromJson(Map<String, dynamic> json) {
    return UserAccessResultItem(
      app: json['app'] as String?,
      email: json['email'] as String?,
      resultStatus: (json['resultStatus'] as String?)?.toResultStatus(),
      taskError: json['taskError'] != null
          ? TaskError.fromJson(json['taskError'] as Map<String, dynamic>)
          : null,
      taskId: json['taskId'] as String?,
      tenantDisplayName: json['tenantDisplayName'] as String?,
      tenantId: json['tenantId'] as String?,
      userFirstName: json['userFirstName'] as String?,
      userFullName: json['userFullName'] as String?,
      userId: json['userId'] as String?,
      userLastName: json['userLastName'] as String?,
      userStatus: json['userStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final app = this.app;
    final email = this.email;
    final resultStatus = this.resultStatus;
    final taskError = this.taskError;
    final taskId = this.taskId;
    final tenantDisplayName = this.tenantDisplayName;
    final tenantId = this.tenantId;
    final userFirstName = this.userFirstName;
    final userFullName = this.userFullName;
    final userId = this.userId;
    final userLastName = this.userLastName;
    final userStatus = this.userStatus;
    return {
      if (app != null) 'app': app,
      if (email != null) 'email': email,
      if (resultStatus != null) 'resultStatus': resultStatus.toValue(),
      if (taskError != null) 'taskError': taskError,
      if (taskId != null) 'taskId': taskId,
      if (tenantDisplayName != null) 'tenantDisplayName': tenantDisplayName,
      if (tenantId != null) 'tenantId': tenantId,
      if (userFirstName != null) 'userFirstName': userFirstName,
      if (userFullName != null) 'userFullName': userFullName,
      if (userId != null) 'userId': userId,
      if (userLastName != null) 'userLastName': userLastName,
      if (userStatus != null) 'userStatus': userStatus,
    };
  }
}

/// Contains information about a user access task.
class UserAccessTaskItem {
  /// The name of the application.
  final String app;

  /// The ID of the application tenant.
  final String tenantId;

  /// Error from the task, if any.
  final TaskError? error;

  /// The unique ID of the task.
  final String? taskId;

  UserAccessTaskItem({
    required this.app,
    required this.tenantId,
    this.error,
    this.taskId,
  });

  factory UserAccessTaskItem.fromJson(Map<String, dynamic> json) {
    return UserAccessTaskItem(
      app: json['app'] as String,
      tenantId: json['tenantId'] as String,
      error: json['error'] != null
          ? TaskError.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      taskId: json['taskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final app = this.app;
    final tenantId = this.tenantId;
    final error = this.error;
    final taskId = this.taskId;
    return {
      'app': app,
      'tenantId': tenantId,
      if (error != null) 'error': error,
      if (taskId != null) 'taskId': taskId,
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
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
