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

/// The Amazon AppIntegrations service enables you to configure and reuse
/// connections to external applications.
///
/// For information about how you can use external applications with Amazon
/// Connect, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/crm.html">Set up
/// pre-built integrations</a> and <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-wisdom.html">Deliver
/// information to agents using Amazon Connect Wisdom</a> in the <i>Amazon
/// Connect Administrator Guide</i>.
class AppIntegrations {
  final _s.RestJsonProtocol _protocol;
  AppIntegrations({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'app-integrations',
            signingName: 'app-integrations',
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

  /// This API is in preview release and subject to change.
  ///
  /// Creates and persists an Application resource.
  ///
  /// May throw [InternalServiceError].
  /// May throw [ResourceQuotaExceededException].
  /// May throw [DuplicateResourceException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationSourceConfig] :
  /// The configuration for where the application should be loaded from.
  ///
  /// Parameter [name] :
  /// The name of the application.
  ///
  /// Parameter [namespace] :
  /// The namespace of the application.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  ///
  /// Parameter [description] :
  /// The description of the application.
  ///
  /// Parameter [permissions] :
  /// The configuration of events or requests that the application has access
  /// to.
  ///
  /// Parameter [publications] :
  /// The events that the application publishes.
  ///
  /// Parameter [subscriptions] :
  /// The events that the application subscribes.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<CreateApplicationResponse> createApplication({
    required ApplicationSourceConfig applicationSourceConfig,
    required String name,
    required String namespace,
    String? clientToken,
    String? description,
    List<String>? permissions,
    List<Publication>? publications,
    List<Subscription>? subscriptions,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ApplicationSourceConfig': applicationSourceConfig,
      'Name': name,
      'Namespace': namespace,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (permissions != null) 'Permissions': permissions,
      if (publications != null) 'Publications': publications,
      if (subscriptions != null) 'Subscriptions': subscriptions,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/applications',
      exceptionFnMap: _exceptionFns,
    );
    return CreateApplicationResponse.fromJson(response);
  }

  /// Creates and persists a DataIntegration resource.
  /// <note>
  /// You cannot create a DataIntegration association for a DataIntegration that
  /// has been previously associated. Use a different DataIntegration, or
  /// recreate the DataIntegration using the <code>CreateDataIntegration</code>
  /// API.
  /// </note>
  ///
  /// May throw [InternalServiceError].
  /// May throw [ResourceQuotaExceededException].
  /// May throw [DuplicateResourceException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [kmsKey] :
  /// The KMS key for the DataIntegration.
  ///
  /// Parameter [name] :
  /// The name of the DataIntegration.
  ///
  /// Parameter [sourceURI] :
  /// The URI of the data source.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  ///
  /// Parameter [description] :
  /// A description of the DataIntegration.
  ///
  /// Parameter [fileConfiguration] :
  /// The configuration for what files should be pulled from the source.
  ///
  /// Parameter [objectConfiguration] :
  /// The configuration for what data should be pulled from the source.
  ///
  /// Parameter [scheduleConfig] :
  /// The name of the data and how often it should be pulled from the source.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<CreateDataIntegrationResponse> createDataIntegration({
    required String kmsKey,
    required String name,
    required String sourceURI,
    String? clientToken,
    String? description,
    FileConfiguration? fileConfiguration,
    Map<String, Map<String, List<String>>>? objectConfiguration,
    ScheduleConfiguration? scheduleConfig,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'KmsKey': kmsKey,
      'Name': name,
      'SourceURI': sourceURI,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (fileConfiguration != null) 'FileConfiguration': fileConfiguration,
      if (objectConfiguration != null)
        'ObjectConfiguration': objectConfiguration,
      if (scheduleConfig != null) 'ScheduleConfig': scheduleConfig,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/dataIntegrations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataIntegrationResponse.fromJson(response);
  }

  /// Creates an EventIntegration, given a specified name, description, and a
  /// reference to an Amazon EventBridge bus in your account and a partner event
  /// source that pushes events to that bus. No objects are created in the your
  /// account, only metadata that is persisted on the EventIntegration control
  /// plane.
  ///
  /// May throw [InternalServiceError].
  /// May throw [ResourceQuotaExceededException].
  /// May throw [DuplicateResourceException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [eventBridgeBus] :
  /// The EventBridge bus.
  ///
  /// Parameter [eventFilter] :
  /// The event filter.
  ///
  /// Parameter [name] :
  /// The name of the event integration.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  ///
  /// Parameter [description] :
  /// The description of the event integration.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<CreateEventIntegrationResponse> createEventIntegration({
    required String eventBridgeBus,
    required EventFilter eventFilter,
    required String name,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'EventBridgeBus': eventBridgeBus,
      'EventFilter': eventFilter,
      'Name': name,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/eventIntegrations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEventIntegrationResponse.fromJson(response);
  }

  /// Deletes the Application. Only Applications that don't have any Application
  /// Associations can be deleted.
  ///
  /// May throw [InternalServiceError].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the Application.
  Future<void> deleteApplication({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/applications/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the DataIntegration. Only DataIntegrations that don't have any
  /// DataIntegrationAssociations can be deleted. Deleting a DataIntegration
  /// also deletes the underlying Amazon AppFlow flow and service linked role.
  /// <note>
  /// You cannot create a DataIntegration association for a DataIntegration that
  /// has been previously associated. Use a different DataIntegration, or
  /// recreate the DataIntegration using the <a
  /// href="https://docs.aws.amazon.com/appintegrations/latest/APIReference/API_CreateDataIntegration.html">CreateDataIntegration</a>
  /// API.
  /// </note>
  ///
  /// May throw [InternalServiceError].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [dataIntegrationIdentifier] :
  /// A unique identifier for the DataIntegration.
  Future<void> deleteDataIntegration({
    required String dataIntegrationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/dataIntegrations/${Uri.encodeComponent(dataIntegrationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified existing event integration. If the event integration
  /// is associated with clients, the request is rejected.
  ///
  /// May throw [InternalServiceError].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the event integration.
  Future<void> deleteEventIntegration({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/eventIntegrations/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release and subject to change.
  ///
  /// Get an Application resource.
  ///
  /// May throw [InternalServiceError].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the Application.
  Future<GetApplicationResponse> getApplication({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetApplicationResponse.fromJson(response);
  }

  /// Returns information about the DataIntegration.
  /// <note>
  /// You cannot create a DataIntegration association for a DataIntegration that
  /// has been previously associated. Use a different DataIntegration, or
  /// recreate the DataIntegration using the <a
  /// href="https://docs.aws.amazon.com/appintegrations/latest/APIReference/API_CreateDataIntegration.html">CreateDataIntegration</a>
  /// API.
  /// </note>
  ///
  /// May throw [InternalServiceError].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [identifier] :
  /// A unique identifier.
  Future<GetDataIntegrationResponse> getDataIntegration({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/dataIntegrations/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataIntegrationResponse.fromJson(response);
  }

  /// Returns information about the event integration.
  ///
  /// May throw [InternalServiceError].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the event integration.
  Future<GetEventIntegrationResponse> getEventIntegration({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/eventIntegrations/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEventIntegrationResponse.fromJson(response);
  }

  /// Returns a paginated list of application associations for an application.
  ///
  /// May throw [InternalServiceError].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [applicationId] :
  /// A unique identifier for the Application.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListApplicationAssociationsResponse> listApplicationAssociations({
    required String applicationId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationAssociationsResponse.fromJson(response);
  }

  /// This API is in preview release and subject to change.
  ///
  /// Lists applications in the account.
  ///
  /// May throw [InternalServiceError].
  /// May throw [ThrottlingException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListApplicationsResponse> listApplications({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationsResponse.fromJson(response);
  }

  /// Returns a paginated list of DataIntegration associations in the account.
  /// <note>
  /// You cannot create a DataIntegration association for a DataIntegration that
  /// has been previously associated. Use a different DataIntegration, or
  /// recreate the DataIntegration using the <a
  /// href="https://docs.aws.amazon.com/appintegrations/latest/APIReference/API_CreateDataIntegration.html">CreateDataIntegration</a>
  /// API.
  /// </note>
  ///
  /// May throw [InternalServiceError].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [dataIntegrationIdentifier] :
  /// A unique identifier for the DataIntegration.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListDataIntegrationAssociationsResponse>
      listDataIntegrationAssociations({
    required String dataIntegrationIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/dataIntegrations/${Uri.encodeComponent(dataIntegrationIdentifier)}/associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataIntegrationAssociationsResponse.fromJson(response);
  }

  /// Returns a paginated list of DataIntegrations in the account.
  /// <note>
  /// You cannot create a DataIntegration association for a DataIntegration that
  /// has been previously associated. Use a different DataIntegration, or
  /// recreate the DataIntegration using the <a
  /// href="https://docs.aws.amazon.com/appintegrations/latest/APIReference/API_CreateDataIntegration.html">CreateDataIntegration</a>
  /// API.
  /// </note>
  ///
  /// May throw [InternalServiceError].
  /// May throw [ThrottlingException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListDataIntegrationsResponse> listDataIntegrations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/dataIntegrations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataIntegrationsResponse.fromJson(response);
  }

  /// Returns a paginated list of event integration associations in the account.
  ///
  /// May throw [InternalServiceError].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [eventIntegrationName] :
  /// The name of the event integration.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListEventIntegrationAssociationsResponse>
      listEventIntegrationAssociations({
    required String eventIntegrationName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/eventIntegrations/${Uri.encodeComponent(eventIntegrationName)}/associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEventIntegrationAssociationsResponse.fromJson(response);
  }

  /// Returns a paginated list of event integrations in the account.
  ///
  /// May throw [InternalServiceError].
  /// May throw [ThrottlingException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListEventIntegrationsResponse> listEventIntegrations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/eventIntegrations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEventIntegrationsResponse.fromJson(response);
  }

  /// Lists the tags for the specified resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
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

  /// Adds the specified tags to the specified resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
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

  /// Removes the specified tags from the specified resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceError].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys.
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

  /// This API is in preview release and subject to change.
  ///
  /// Updates and persists an Application resource.
  ///
  /// May throw [InternalServiceError].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the Application.
  ///
  /// Parameter [applicationSourceConfig] :
  /// The configuration for where the application should be loaded from.
  ///
  /// Parameter [description] :
  /// The description of the application.
  ///
  /// Parameter [name] :
  /// The name of the application.
  ///
  /// Parameter [permissions] :
  /// The configuration of events or requests that the application has access
  /// to.
  ///
  /// Parameter [publications] :
  /// The events that the application publishes.
  ///
  /// Parameter [subscriptions] :
  /// The events that the application subscribes.
  Future<void> updateApplication({
    required String arn,
    ApplicationSourceConfig? applicationSourceConfig,
    String? description,
    String? name,
    List<String>? permissions,
    List<Publication>? publications,
    List<Subscription>? subscriptions,
  }) async {
    final $payload = <String, dynamic>{
      if (applicationSourceConfig != null)
        'ApplicationSourceConfig': applicationSourceConfig,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (permissions != null) 'Permissions': permissions,
      if (publications != null) 'Publications': publications,
      if (subscriptions != null) 'Subscriptions': subscriptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/applications/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the description of a DataIntegration.
  /// <note>
  /// You cannot create a DataIntegration association for a DataIntegration that
  /// has been previously associated. Use a different DataIntegration, or
  /// recreate the DataIntegration using the <a
  /// href="https://docs.aws.amazon.com/appintegrations/latest/APIReference/API_CreateDataIntegration.html">CreateDataIntegration</a>
  /// API.
  /// </note>
  ///
  /// May throw [InternalServiceError].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [identifier] :
  /// A unique identifier for the DataIntegration.
  ///
  /// Parameter [description] :
  /// A description of the DataIntegration.
  ///
  /// Parameter [name] :
  /// The name of the DataIntegration.
  Future<void> updateDataIntegration({
    required String identifier,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/dataIntegrations/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the description of an event integration.
  ///
  /// May throw [InternalServiceError].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the event integration.
  ///
  /// Parameter [description] :
  /// The description of the event integration.
  Future<void> updateEventIntegration({
    required String name,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/eventIntegrations/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// Summary information about the Application Association.
class ApplicationAssociationSummary {
  /// The Amazon Resource Name (ARN) of the Application.
  final String? applicationArn;

  /// The Amazon Resource Name (ARN) of the Application Association.
  final String? applicationAssociationArn;

  /// The identifier for the client that is associated with the Application
  /// Association.
  final String? clientId;

  ApplicationAssociationSummary({
    this.applicationArn,
    this.applicationAssociationArn,
    this.clientId,
  });

  factory ApplicationAssociationSummary.fromJson(Map<String, dynamic> json) {
    return ApplicationAssociationSummary(
      applicationArn: json['ApplicationArn'] as String?,
      applicationAssociationArn: json['ApplicationAssociationArn'] as String?,
      clientId: json['ClientId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final applicationAssociationArn = this.applicationAssociationArn;
    final clientId = this.clientId;
    return {
      if (applicationArn != null) 'ApplicationArn': applicationArn,
      if (applicationAssociationArn != null)
        'ApplicationAssociationArn': applicationAssociationArn,
      if (clientId != null) 'ClientId': clientId,
    };
  }
}

/// The configuration for where the application should be loaded from.
class ApplicationSourceConfig {
  /// The external URL source for the application.
  final ExternalUrlConfig? externalUrlConfig;

  ApplicationSourceConfig({
    this.externalUrlConfig,
  });

  factory ApplicationSourceConfig.fromJson(Map<String, dynamic> json) {
    return ApplicationSourceConfig(
      externalUrlConfig: json['ExternalUrlConfig'] != null
          ? ExternalUrlConfig.fromJson(
              json['ExternalUrlConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final externalUrlConfig = this.externalUrlConfig;
    return {
      if (externalUrlConfig != null) 'ExternalUrlConfig': externalUrlConfig,
    };
  }
}

/// Summary information about the Application.
class ApplicationSummary {
  /// The Amazon Resource Name (ARN) of the Application.
  final String? arn;

  /// The time when the application was created.
  final DateTime? createdTime;

  /// A unique identifier for the Application.
  final String? id;

  /// The time when the application was last modified.
  final DateTime? lastModifiedTime;

  /// The name of the application.
  final String? name;

  /// The namespace of the application.
  final String? namespace;

  ApplicationSummary({
    this.arn,
    this.createdTime,
    this.id,
    this.lastModifiedTime,
    this.name,
    this.namespace,
  });

  factory ApplicationSummary.fromJson(Map<String, dynamic> json) {
    return ApplicationSummary(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      id: json['Id'] as String?,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      name: json['Name'] as String?,
      namespace: json['Namespace'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final id = this.id;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final namespace = this.namespace;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (id != null) 'Id': id,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
      if (namespace != null) 'Namespace': namespace,
    };
  }
}

class CreateApplicationResponse {
  /// The Amazon Resource Name (ARN) of the Application.
  final String? arn;

  /// A unique identifier for the Application.
  final String? id;

  CreateApplicationResponse({
    this.arn,
    this.id,
  });

  factory CreateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return CreateApplicationResponse(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
    };
  }
}

class CreateDataIntegrationResponse {
  /// The Amazon Resource Name (ARN)
  final String? arn;

  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  final String? clientToken;

  /// A description of the DataIntegration.
  final String? description;

  /// The configuration for what files should be pulled from the source.
  final FileConfiguration? fileConfiguration;

  /// A unique identifier.
  final String? id;

  /// The KMS key for the DataIntegration.
  final String? kmsKey;

  /// The name of the DataIntegration.
  final String? name;

  /// The configuration for what data should be pulled from the source.
  final Map<String, Map<String, List<String>>>? objectConfiguration;

  /// The name of the data and how often it should be pulled from the source.
  final ScheduleConfiguration? scheduleConfiguration;

  /// The URI of the data source.
  final String? sourceURI;

  /// The tags used to organize, track, or control access for this resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  final Map<String, String>? tags;

  CreateDataIntegrationResponse({
    this.arn,
    this.clientToken,
    this.description,
    this.fileConfiguration,
    this.id,
    this.kmsKey,
    this.name,
    this.objectConfiguration,
    this.scheduleConfiguration,
    this.sourceURI,
    this.tags,
  });

  factory CreateDataIntegrationResponse.fromJson(Map<String, dynamic> json) {
    return CreateDataIntegrationResponse(
      arn: json['Arn'] as String?,
      clientToken: json['ClientToken'] as String?,
      description: json['Description'] as String?,
      fileConfiguration: json['FileConfiguration'] != null
          ? FileConfiguration.fromJson(
              json['FileConfiguration'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      kmsKey: json['KmsKey'] as String?,
      name: json['Name'] as String?,
      objectConfiguration:
          (json['ObjectConfiguration'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(
                  k,
                  (e as Map<String, dynamic>).map((k, e) => MapEntry(
                      k,
                      (e as List)
                          .whereNotNull()
                          .map((e) => e as String)
                          .toList())))),
      scheduleConfiguration: json['ScheduleConfiguration'] != null
          ? ScheduleConfiguration.fromJson(
              json['ScheduleConfiguration'] as Map<String, dynamic>)
          : null,
      sourceURI: json['SourceURI'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientToken = this.clientToken;
    final description = this.description;
    final fileConfiguration = this.fileConfiguration;
    final id = this.id;
    final kmsKey = this.kmsKey;
    final name = this.name;
    final objectConfiguration = this.objectConfiguration;
    final scheduleConfiguration = this.scheduleConfiguration;
    final sourceURI = this.sourceURI;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (clientToken != null) 'ClientToken': clientToken,
      if (description != null) 'Description': description,
      if (fileConfiguration != null) 'FileConfiguration': fileConfiguration,
      if (id != null) 'Id': id,
      if (kmsKey != null) 'KmsKey': kmsKey,
      if (name != null) 'Name': name,
      if (objectConfiguration != null)
        'ObjectConfiguration': objectConfiguration,
      if (scheduleConfiguration != null)
        'ScheduleConfiguration': scheduleConfiguration,
      if (sourceURI != null) 'SourceURI': sourceURI,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateEventIntegrationResponse {
  /// The Amazon Resource Name (ARN) of the event integration.
  final String? eventIntegrationArn;

  CreateEventIntegrationResponse({
    this.eventIntegrationArn,
  });

  factory CreateEventIntegrationResponse.fromJson(Map<String, dynamic> json) {
    return CreateEventIntegrationResponse(
      eventIntegrationArn: json['EventIntegrationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventIntegrationArn = this.eventIntegrationArn;
    return {
      if (eventIntegrationArn != null)
        'EventIntegrationArn': eventIntegrationArn,
    };
  }
}

/// Summary information about the DataIntegration association.
class DataIntegrationAssociationSummary {
  /// The identifier for the client that is associated with the DataIntegration
  /// association.
  final String? clientId;

  /// The Amazon Resource Name (ARN) of the DataIntegration.
  final String? dataIntegrationArn;

  /// The Amazon Resource Name (ARN) of the DataIntegration association.
  final String? dataIntegrationAssociationArn;

  DataIntegrationAssociationSummary({
    this.clientId,
    this.dataIntegrationArn,
    this.dataIntegrationAssociationArn,
  });

  factory DataIntegrationAssociationSummary.fromJson(
      Map<String, dynamic> json) {
    return DataIntegrationAssociationSummary(
      clientId: json['ClientId'] as String?,
      dataIntegrationArn: json['DataIntegrationArn'] as String?,
      dataIntegrationAssociationArn:
          json['DataIntegrationAssociationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final dataIntegrationArn = this.dataIntegrationArn;
    final dataIntegrationAssociationArn = this.dataIntegrationAssociationArn;
    return {
      if (clientId != null) 'ClientId': clientId,
      if (dataIntegrationArn != null) 'DataIntegrationArn': dataIntegrationArn,
      if (dataIntegrationAssociationArn != null)
        'DataIntegrationAssociationArn': dataIntegrationAssociationArn,
    };
  }
}

/// Summary information about the DataIntegration.
class DataIntegrationSummary {
  /// The Amazon Resource Name (ARN) of the DataIntegration.
  final String? arn;

  /// The name of the DataIntegration.
  final String? name;

  /// The URI of the data source.
  final String? sourceURI;

  DataIntegrationSummary({
    this.arn,
    this.name,
    this.sourceURI,
  });

  factory DataIntegrationSummary.fromJson(Map<String, dynamic> json) {
    return DataIntegrationSummary(
      arn: json['Arn'] as String?,
      name: json['Name'] as String?,
      sourceURI: json['SourceURI'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final sourceURI = this.sourceURI;
    return {
      if (arn != null) 'Arn': arn,
      if (name != null) 'Name': name,
      if (sourceURI != null) 'SourceURI': sourceURI,
    };
  }
}

class DeleteApplicationResponse {
  DeleteApplicationResponse();

  factory DeleteApplicationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDataIntegrationResponse {
  DeleteDataIntegrationResponse();

  factory DeleteDataIntegrationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDataIntegrationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteEventIntegrationResponse {
  DeleteEventIntegrationResponse();

  factory DeleteEventIntegrationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEventIntegrationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The event filter.
class EventFilter {
  /// The source of the events.
  final String source;

  EventFilter({
    required this.source,
  });

  factory EventFilter.fromJson(Map<String, dynamic> json) {
    return EventFilter(
      source: json['Source'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    return {
      'Source': source,
    };
  }
}

/// The event integration.
class EventIntegration {
  /// The event integration description.
  final String? description;

  /// The Amazon EventBridge bus for the event integration.
  final String? eventBridgeBus;

  /// The event integration filter.
  final EventFilter? eventFilter;

  /// The Amazon Resource Name (ARN) of the event integration.
  final String? eventIntegrationArn;

  /// The name of the event integration.
  final String? name;

  /// The tags used to organize, track, or control access for this resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  final Map<String, String>? tags;

  EventIntegration({
    this.description,
    this.eventBridgeBus,
    this.eventFilter,
    this.eventIntegrationArn,
    this.name,
    this.tags,
  });

  factory EventIntegration.fromJson(Map<String, dynamic> json) {
    return EventIntegration(
      description: json['Description'] as String?,
      eventBridgeBus: json['EventBridgeBus'] as String?,
      eventFilter: json['EventFilter'] != null
          ? EventFilter.fromJson(json['EventFilter'] as Map<String, dynamic>)
          : null,
      eventIntegrationArn: json['EventIntegrationArn'] as String?,
      name: json['Name'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final eventBridgeBus = this.eventBridgeBus;
    final eventFilter = this.eventFilter;
    final eventIntegrationArn = this.eventIntegrationArn;
    final name = this.name;
    final tags = this.tags;
    return {
      if (description != null) 'Description': description,
      if (eventBridgeBus != null) 'EventBridgeBus': eventBridgeBus,
      if (eventFilter != null) 'EventFilter': eventFilter,
      if (eventIntegrationArn != null)
        'EventIntegrationArn': eventIntegrationArn,
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// The event integration association.
class EventIntegrationAssociation {
  /// The metadata associated with the client.
  final Map<String, String>? clientAssociationMetadata;

  /// The identifier for the client that is associated with the event integration.
  final String? clientId;

  /// The name of the EventBridge rule.
  final String? eventBridgeRuleName;

  /// The Amazon Resource Name (ARN) for the event integration association.
  final String? eventIntegrationAssociationArn;

  /// The identifier for the event integration association.
  final String? eventIntegrationAssociationId;

  /// The name of the event integration.
  final String? eventIntegrationName;

  EventIntegrationAssociation({
    this.clientAssociationMetadata,
    this.clientId,
    this.eventBridgeRuleName,
    this.eventIntegrationAssociationArn,
    this.eventIntegrationAssociationId,
    this.eventIntegrationName,
  });

  factory EventIntegrationAssociation.fromJson(Map<String, dynamic> json) {
    return EventIntegrationAssociation(
      clientAssociationMetadata:
          (json['ClientAssociationMetadata'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      clientId: json['ClientId'] as String?,
      eventBridgeRuleName: json['EventBridgeRuleName'] as String?,
      eventIntegrationAssociationArn:
          json['EventIntegrationAssociationArn'] as String?,
      eventIntegrationAssociationId:
          json['EventIntegrationAssociationId'] as String?,
      eventIntegrationName: json['EventIntegrationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientAssociationMetadata = this.clientAssociationMetadata;
    final clientId = this.clientId;
    final eventBridgeRuleName = this.eventBridgeRuleName;
    final eventIntegrationAssociationArn = this.eventIntegrationAssociationArn;
    final eventIntegrationAssociationId = this.eventIntegrationAssociationId;
    final eventIntegrationName = this.eventIntegrationName;
    return {
      if (clientAssociationMetadata != null)
        'ClientAssociationMetadata': clientAssociationMetadata,
      if (clientId != null) 'ClientId': clientId,
      if (eventBridgeRuleName != null)
        'EventBridgeRuleName': eventBridgeRuleName,
      if (eventIntegrationAssociationArn != null)
        'EventIntegrationAssociationArn': eventIntegrationAssociationArn,
      if (eventIntegrationAssociationId != null)
        'EventIntegrationAssociationId': eventIntegrationAssociationId,
      if (eventIntegrationName != null)
        'EventIntegrationName': eventIntegrationName,
    };
  }
}

/// The external URL source for the application.
class ExternalUrlConfig {
  /// The URL to access the application.
  final String accessUrl;

  /// Additional URLs to allow list if different than the access URL.
  final List<String>? approvedOrigins;

  ExternalUrlConfig({
    required this.accessUrl,
    this.approvedOrigins,
  });

  factory ExternalUrlConfig.fromJson(Map<String, dynamic> json) {
    return ExternalUrlConfig(
      accessUrl: json['AccessUrl'] as String,
      approvedOrigins: (json['ApprovedOrigins'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessUrl = this.accessUrl;
    final approvedOrigins = this.approvedOrigins;
    return {
      'AccessUrl': accessUrl,
      if (approvedOrigins != null) 'ApprovedOrigins': approvedOrigins,
    };
  }
}

/// The configuration for what files should be pulled from the source.
class FileConfiguration {
  /// Identifiers for the source folders to pull all files from recursively.
  final List<String> folders;

  /// Restrictions for what files should be pulled from the source.
  final Map<String, List<String>>? filters;

  FileConfiguration({
    required this.folders,
    this.filters,
  });

  factory FileConfiguration.fromJson(Map<String, dynamic> json) {
    return FileConfiguration(
      folders: (json['Folders'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      filters: (json['Filters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final folders = this.folders;
    final filters = this.filters;
    return {
      'Folders': folders,
      if (filters != null) 'Filters': filters,
    };
  }
}

class GetApplicationResponse {
  /// The configuration for where the application should be loaded from.
  final ApplicationSourceConfig? applicationSourceConfig;

  /// The Amazon Resource Name (ARN) of the Application.
  final String? arn;

  /// The created time of the Application.
  final DateTime? createdTime;

  /// The description of the application.
  final String? description;

  /// A unique identifier for the Application.
  final String? id;

  /// The last modified time of the Application.
  final DateTime? lastModifiedTime;

  /// The name of the application.
  final String? name;

  /// The namespace of the application.
  final String? namespace;

  /// The configuration of events or requests that the application has access to.
  final List<String>? permissions;

  /// The events that the application publishes.
  final List<Publication>? publications;

  /// The events that the application subscribes.
  final List<Subscription>? subscriptions;

  /// The tags used to organize, track, or control access for this resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  final Map<String, String>? tags;

  GetApplicationResponse({
    this.applicationSourceConfig,
    this.arn,
    this.createdTime,
    this.description,
    this.id,
    this.lastModifiedTime,
    this.name,
    this.namespace,
    this.permissions,
    this.publications,
    this.subscriptions,
    this.tags,
  });

  factory GetApplicationResponse.fromJson(Map<String, dynamic> json) {
    return GetApplicationResponse(
      applicationSourceConfig: json['ApplicationSourceConfig'] != null
          ? ApplicationSourceConfig.fromJson(
              json['ApplicationSourceConfig'] as Map<String, dynamic>)
          : null,
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      name: json['Name'] as String?,
      namespace: json['Namespace'] as String?,
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      publications: (json['Publications'] as List?)
          ?.whereNotNull()
          .map((e) => Publication.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscriptions: (json['Subscriptions'] as List?)
          ?.whereNotNull()
          .map((e) => Subscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationSourceConfig = this.applicationSourceConfig;
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final id = this.id;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final namespace = this.namespace;
    final permissions = this.permissions;
    final publications = this.publications;
    final subscriptions = this.subscriptions;
    final tags = this.tags;
    return {
      if (applicationSourceConfig != null)
        'ApplicationSourceConfig': applicationSourceConfig,
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
      if (namespace != null) 'Namespace': namespace,
      if (permissions != null) 'Permissions': permissions,
      if (publications != null) 'Publications': publications,
      if (subscriptions != null) 'Subscriptions': subscriptions,
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetDataIntegrationResponse {
  /// The Amazon Resource Name (ARN) for the DataIntegration.
  final String? arn;

  /// The KMS key for the DataIntegration.
  final String? description;

  /// The configuration for what files should be pulled from the source.
  final FileConfiguration? fileConfiguration;

  /// A unique identifier.
  final String? id;

  /// The KMS key for the DataIntegration.
  final String? kmsKey;

  /// The name of the DataIntegration.
  final String? name;

  /// The configuration for what data should be pulled from the source.
  final Map<String, Map<String, List<String>>>? objectConfiguration;

  /// The name of the data and how often it should be pulled from the source.
  final ScheduleConfiguration? scheduleConfiguration;

  /// The URI of the data source.
  final String? sourceURI;

  /// The tags used to organize, track, or control access for this resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  final Map<String, String>? tags;

  GetDataIntegrationResponse({
    this.arn,
    this.description,
    this.fileConfiguration,
    this.id,
    this.kmsKey,
    this.name,
    this.objectConfiguration,
    this.scheduleConfiguration,
    this.sourceURI,
    this.tags,
  });

  factory GetDataIntegrationResponse.fromJson(Map<String, dynamic> json) {
    return GetDataIntegrationResponse(
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      fileConfiguration: json['FileConfiguration'] != null
          ? FileConfiguration.fromJson(
              json['FileConfiguration'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      kmsKey: json['KmsKey'] as String?,
      name: json['Name'] as String?,
      objectConfiguration:
          (json['ObjectConfiguration'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(
                  k,
                  (e as Map<String, dynamic>).map((k, e) => MapEntry(
                      k,
                      (e as List)
                          .whereNotNull()
                          .map((e) => e as String)
                          .toList())))),
      scheduleConfiguration: json['ScheduleConfiguration'] != null
          ? ScheduleConfiguration.fromJson(
              json['ScheduleConfiguration'] as Map<String, dynamic>)
          : null,
      sourceURI: json['SourceURI'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final fileConfiguration = this.fileConfiguration;
    final id = this.id;
    final kmsKey = this.kmsKey;
    final name = this.name;
    final objectConfiguration = this.objectConfiguration;
    final scheduleConfiguration = this.scheduleConfiguration;
    final sourceURI = this.sourceURI;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (description != null) 'Description': description,
      if (fileConfiguration != null) 'FileConfiguration': fileConfiguration,
      if (id != null) 'Id': id,
      if (kmsKey != null) 'KmsKey': kmsKey,
      if (name != null) 'Name': name,
      if (objectConfiguration != null)
        'ObjectConfiguration': objectConfiguration,
      if (scheduleConfiguration != null)
        'ScheduleConfiguration': scheduleConfiguration,
      if (sourceURI != null) 'SourceURI': sourceURI,
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetEventIntegrationResponse {
  /// The description of the event integration.
  final String? description;

  /// The EventBridge bus.
  final String? eventBridgeBus;

  /// The event filter.
  final EventFilter? eventFilter;

  /// The Amazon Resource Name (ARN) for the event integration.
  final String? eventIntegrationArn;

  /// The name of the event integration.
  final String? name;

  /// The tags used to organize, track, or control access for this resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  final Map<String, String>? tags;

  GetEventIntegrationResponse({
    this.description,
    this.eventBridgeBus,
    this.eventFilter,
    this.eventIntegrationArn,
    this.name,
    this.tags,
  });

  factory GetEventIntegrationResponse.fromJson(Map<String, dynamic> json) {
    return GetEventIntegrationResponse(
      description: json['Description'] as String?,
      eventBridgeBus: json['EventBridgeBus'] as String?,
      eventFilter: json['EventFilter'] != null
          ? EventFilter.fromJson(json['EventFilter'] as Map<String, dynamic>)
          : null,
      eventIntegrationArn: json['EventIntegrationArn'] as String?,
      name: json['Name'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final eventBridgeBus = this.eventBridgeBus;
    final eventFilter = this.eventFilter;
    final eventIntegrationArn = this.eventIntegrationArn;
    final name = this.name;
    final tags = this.tags;
    return {
      if (description != null) 'Description': description,
      if (eventBridgeBus != null) 'EventBridgeBus': eventBridgeBus,
      if (eventFilter != null) 'EventFilter': eventFilter,
      if (eventIntegrationArn != null)
        'EventIntegrationArn': eventIntegrationArn,
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListApplicationAssociationsResponse {
  /// List of Application Associations for the Application.
  final List<ApplicationAssociationSummary>? applicationAssociations;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListApplicationAssociationsResponse({
    this.applicationAssociations,
    this.nextToken,
  });

  factory ListApplicationAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListApplicationAssociationsResponse(
      applicationAssociations: (json['ApplicationAssociations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ApplicationAssociationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationAssociations = this.applicationAssociations;
    final nextToken = this.nextToken;
    return {
      if (applicationAssociations != null)
        'ApplicationAssociations': applicationAssociations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListApplicationsResponse {
  /// The Applications associated with this account.
  final List<ApplicationSummary>? applications;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListApplicationsResponse({
    this.applications,
    this.nextToken,
  });

  factory ListApplicationsResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationsResponse(
      applications: (json['Applications'] as List?)
          ?.whereNotNull()
          .map((e) => ApplicationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applications = this.applications;
    final nextToken = this.nextToken;
    return {
      if (applications != null) 'Applications': applications,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDataIntegrationAssociationsResponse {
  /// The Amazon Resource Name (ARN) and unique ID of the DataIntegration
  /// association.
  final List<DataIntegrationAssociationSummary>? dataIntegrationAssociations;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListDataIntegrationAssociationsResponse({
    this.dataIntegrationAssociations,
    this.nextToken,
  });

  factory ListDataIntegrationAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDataIntegrationAssociationsResponse(
      dataIntegrationAssociations:
          (json['DataIntegrationAssociations'] as List?)
              ?.whereNotNull()
              .map((e) => DataIntegrationAssociationSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataIntegrationAssociations = this.dataIntegrationAssociations;
    final nextToken = this.nextToken;
    return {
      if (dataIntegrationAssociations != null)
        'DataIntegrationAssociations': dataIntegrationAssociations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDataIntegrationsResponse {
  /// The DataIntegrations associated with this account.
  final List<DataIntegrationSummary>? dataIntegrations;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListDataIntegrationsResponse({
    this.dataIntegrations,
    this.nextToken,
  });

  factory ListDataIntegrationsResponse.fromJson(Map<String, dynamic> json) {
    return ListDataIntegrationsResponse(
      dataIntegrations: (json['DataIntegrations'] as List?)
          ?.whereNotNull()
          .map(
              (e) => DataIntegrationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataIntegrations = this.dataIntegrations;
    final nextToken = this.nextToken;
    return {
      if (dataIntegrations != null) 'DataIntegrations': dataIntegrations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListEventIntegrationAssociationsResponse {
  /// The event integration associations.
  final List<EventIntegrationAssociation>? eventIntegrationAssociations;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListEventIntegrationAssociationsResponse({
    this.eventIntegrationAssociations,
    this.nextToken,
  });

  factory ListEventIntegrationAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListEventIntegrationAssociationsResponse(
      eventIntegrationAssociations: (json['EventIntegrationAssociations']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              EventIntegrationAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventIntegrationAssociations = this.eventIntegrationAssociations;
    final nextToken = this.nextToken;
    return {
      if (eventIntegrationAssociations != null)
        'EventIntegrationAssociations': eventIntegrationAssociations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListEventIntegrationsResponse {
  /// The event integrations.
  final List<EventIntegration>? eventIntegrations;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListEventIntegrationsResponse({
    this.eventIntegrations,
    this.nextToken,
  });

  factory ListEventIntegrationsResponse.fromJson(Map<String, dynamic> json) {
    return ListEventIntegrationsResponse(
      eventIntegrations: (json['EventIntegrations'] as List?)
          ?.whereNotNull()
          .map((e) => EventIntegration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventIntegrations = this.eventIntegrations;
    final nextToken = this.nextToken;
    return {
      if (eventIntegrations != null) 'EventIntegrations': eventIntegrations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// Information about the tags.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

/// The configuration of an event that the application publishes.
class Publication {
  /// The name of the publication.
  final String event;

  /// The JSON schema of the publication event.
  final String schema;

  /// The description of the publication.
  final String? description;

  Publication({
    required this.event,
    required this.schema,
    this.description,
  });

  factory Publication.fromJson(Map<String, dynamic> json) {
    return Publication(
      event: json['Event'] as String,
      schema: json['Schema'] as String,
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final event = this.event;
    final schema = this.schema;
    final description = this.description;
    return {
      'Event': event,
      'Schema': schema,
      if (description != null) 'Description': description,
    };
  }
}

/// The name of the data and how often it should be pulled from the source.
class ScheduleConfiguration {
  /// How often the data should be pulled from data source.
  final String scheduleExpression;

  /// The start date for objects to import in the first flow run as an Unix/epoch
  /// timestamp in milliseconds or in ISO-8601 format.
  final String? firstExecutionFrom;

  /// The name of the object to pull from the data source.
  final String? object;

  ScheduleConfiguration({
    required this.scheduleExpression,
    this.firstExecutionFrom,
    this.object,
  });

  factory ScheduleConfiguration.fromJson(Map<String, dynamic> json) {
    return ScheduleConfiguration(
      scheduleExpression: json['ScheduleExpression'] as String,
      firstExecutionFrom: json['FirstExecutionFrom'] as String?,
      object: json['Object'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduleExpression = this.scheduleExpression;
    final firstExecutionFrom = this.firstExecutionFrom;
    final object = this.object;
    return {
      'ScheduleExpression': scheduleExpression,
      if (firstExecutionFrom != null) 'FirstExecutionFrom': firstExecutionFrom,
      if (object != null) 'Object': object,
    };
  }
}

/// The configuration of an event that the application subscribes.
class Subscription {
  /// The name of the subscription.
  final String event;

  /// The description of the subscription.
  final String? description;

  Subscription({
    required this.event,
    this.description,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      event: json['Event'] as String,
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final event = this.event;
    final description = this.description;
    return {
      'Event': event,
      if (description != null) 'Description': description,
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateApplicationResponse {
  UpdateApplicationResponse();

  factory UpdateApplicationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateDataIntegrationResponse {
  UpdateDataIntegrationResponse();

  factory UpdateDataIntegrationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDataIntegrationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateEventIntegrationResponse {
  UpdateEventIntegrationResponse();

  factory UpdateEventIntegrationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateEventIntegrationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class DuplicateResourceException extends _s.GenericAwsException {
  DuplicateResourceException({String? type, String? message})
      : super(type: type, code: 'DuplicateResourceException', message: message);
}

class InternalServiceError extends _s.GenericAwsException {
  InternalServiceError({String? type, String? message})
      : super(type: type, code: 'InternalServiceError', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceQuotaExceededException extends _s.GenericAwsException {
  ResourceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedOperationException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'DuplicateResourceException': (type, message) =>
      DuplicateResourceException(type: type, message: message),
  'InternalServiceError': (type, message) =>
      InternalServiceError(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceQuotaExceededException': (type, message) =>
      ResourceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnsupportedOperationException': (type, message) =>
      UnsupportedOperationException(type: type, message: message),
};
