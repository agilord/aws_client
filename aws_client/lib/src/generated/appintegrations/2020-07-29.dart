// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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
          endpointUrl: endpointUrl,
        );

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
  /// Parameter [name] :
  /// The name of the DataIntegration.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [description] :
  /// A description of the DataIntegration.
  ///
  /// Parameter [kmsKey] :
  /// The KMS key for the DataIntegration.
  ///
  /// Parameter [scheduleConfig] :
  /// The name of the data and how often it should be pulled from the source.
  ///
  /// Parameter [sourceURI] :
  /// The URI of the data source.
  ///
  /// Parameter [tags] :
  /// One or more tags.
  Future<CreateDataIntegrationResponse> createDataIntegration({
    required String name,
    String? clientToken,
    String? description,
    String? kmsKey,
    ScheduleConfiguration? scheduleConfig,
    String? sourceURI,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'Name': name,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (kmsKey != null) 'KmsKey': kmsKey,
      if (scheduleConfig != null) 'ScheduleConfig': scheduleConfig,
      if (sourceURI != null) 'SourceURI': sourceURI,
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
  /// idempotency of the request.
  ///
  /// Parameter [description] :
  /// The description of the event integration.
  ///
  /// Parameter [tags] :
  /// One or more tags.
  Future<CreateEventIntegrationResponse> createEventIntegration({
    required String eventBridgeBus,
    required EventFilter eventFilter,
    required String name,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(eventBridgeBus, 'eventBridgeBus');
    ArgumentError.checkNotNull(eventFilter, 'eventFilter');
    ArgumentError.checkNotNull(name, 'name');
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
    ArgumentError.checkNotNull(
        dataIntegrationIdentifier, 'dataIntegrationIdentifier');
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
    ArgumentError.checkNotNull(name, 'name');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/eventIntegrations/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
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
    ArgumentError.checkNotNull(identifier, 'identifier');
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
    ArgumentError.checkNotNull(name, 'name');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/eventIntegrations/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEventIntegrationResponse.fromJson(response);
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
    ArgumentError.checkNotNull(
        dataIntegrationIdentifier, 'dataIntegrationIdentifier');
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
    ArgumentError.checkNotNull(eventIntegrationName, 'eventIntegrationName');
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
  /// One or more tags.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
    ArgumentError.checkNotNull(identifier, 'identifier');
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
  /// The description of the event inegration.
  Future<void> updateEventIntegration({
    required String name,
    String? description,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
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

class CreateDataIntegrationResponse {
  /// The Amazon Resource Name (ARN)
  final String? arn;

  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String? clientToken;

  /// A description of the DataIntegration.
  final String? description;

  /// A unique identifier.
  final String? id;

  /// The KMS key for the DataIntegration.
  final String? kmsKey;

  /// The name of the DataIntegration.
  final String? name;

  /// The name of the data and how often it should be pulled from the source.
  final ScheduleConfiguration? scheduleConfiguration;

  /// The URI of the data source.
  final String? sourceURI;

  /// One or more tags.
  final Map<String, String>? tags;

  CreateDataIntegrationResponse({
    this.arn,
    this.clientToken,
    this.description,
    this.id,
    this.kmsKey,
    this.name,
    this.scheduleConfiguration,
    this.sourceURI,
    this.tags,
  });

  factory CreateDataIntegrationResponse.fromJson(Map<String, dynamic> json) {
    return CreateDataIntegrationResponse(
      arn: json['Arn'] as String?,
      clientToken: json['ClientToken'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      kmsKey: json['KmsKey'] as String?,
      name: json['Name'] as String?,
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
    final id = this.id;
    final kmsKey = this.kmsKey;
    final name = this.name;
    final scheduleConfiguration = this.scheduleConfiguration;
    final sourceURI = this.sourceURI;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (clientToken != null) 'ClientToken': clientToken,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (kmsKey != null) 'KmsKey': kmsKey,
      if (name != null) 'Name': name,
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
  /// The identifier for teh client that is associated with the DataIntegration
  /// association.
  final String? clientId;

  /// The Amazon Resource Name (ARN)of the DataIntegration.
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

  /// The tags.
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

class GetDataIntegrationResponse {
  /// The Amazon Resource Name (ARN) for the DataIntegration.
  final String? arn;

  /// The KMS key for the DataIntegration.
  final String? description;

  /// A unique identifier.
  final String? id;

  /// The KMS key for the DataIntegration.
  final String? kmsKey;

  /// The name of the DataIntegration.
  final String? name;

  /// The name of the data and how often it should be pulled from the source.
  final ScheduleConfiguration? scheduleConfiguration;

  /// The URI of the data source.
  final String? sourceURI;

  /// One or more tags.
  final Map<String, String>? tags;

  GetDataIntegrationResponse({
    this.arn,
    this.description,
    this.id,
    this.kmsKey,
    this.name,
    this.scheduleConfiguration,
    this.sourceURI,
    this.tags,
  });

  factory GetDataIntegrationResponse.fromJson(Map<String, dynamic> json) {
    return GetDataIntegrationResponse(
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      kmsKey: json['KmsKey'] as String?,
      name: json['Name'] as String?,
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
    final id = this.id;
    final kmsKey = this.kmsKey;
    final name = this.name;
    final scheduleConfiguration = this.scheduleConfiguration;
    final sourceURI = this.sourceURI;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (kmsKey != null) 'KmsKey': kmsKey,
      if (name != null) 'Name': name,
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

  /// One or more tags.
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

/// The name of the data and how often it should be pulled from the source.
class ScheduleConfiguration {
  /// The start date for objects to import in the first flow run.
  final String? firstExecutionFrom;

  /// The name of the object to pull from the data source.
  final String? object;

  /// How often the data should be pulled from data source.
  final String? scheduleExpression;

  ScheduleConfiguration({
    this.firstExecutionFrom,
    this.object,
    this.scheduleExpression,
  });

  factory ScheduleConfiguration.fromJson(Map<String, dynamic> json) {
    return ScheduleConfiguration(
      firstExecutionFrom: json['FirstExecutionFrom'] as String?,
      object: json['Object'] as String?,
      scheduleExpression: json['ScheduleExpression'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firstExecutionFrom = this.firstExecutionFrom;
    final object = this.object;
    final scheduleExpression = this.scheduleExpression;
    return {
      if (firstExecutionFrom != null) 'FirstExecutionFrom': firstExecutionFrom,
      if (object != null) 'Object': object,
      if (scheduleExpression != null) 'ScheduleExpression': scheduleExpression,
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
};
