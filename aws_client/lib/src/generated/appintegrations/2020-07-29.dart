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

/// The Amazon AppIntegrations APIs are in preview release and are subject to
/// change.
///
/// The Amazon AppIntegrations service enables you to configure and reuse
/// connections to external applications.
///
/// For information about how you can use external applications with Amazon
/// Connect, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/crm.html">Set up
/// pre-built integrations</a> in the <i>Amazon Connect Administrator Guide</i>.
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

  /// The Amazon AppIntegrations APIs are in preview release and are subject to
  /// change.
  ///
  /// Creates an EventIntegration, given a specified name, description, and a
  /// reference to an Amazon Eventbridge bus in your account and a partner event
  /// source that will push events to that bus. No objects are created in the
  /// your account, only metadata that is persisted on the EventIntegration
  /// control plane.
  ///
  /// May throw [InternalServiceError].
  /// May throw [ResourceQuotaExceededException].
  /// May throw [DuplicateResourceException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [eventBridgeBus] :
  /// The Eventbridge bus.
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
    _s.validateStringLength(
      'eventBridgeBus',
      eventBridgeBus,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(eventFilter, 'eventFilter');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      2048,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1000,
    );
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

  /// The Amazon AppIntegrations APIs are in preview release and are subject to
  /// change.
  ///
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
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/eventIntegrations/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The Amazon AppIntegrations APIs are in preview release and are subject to
  /// change.
  ///
  /// Return information about the event integration.
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
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/eventIntegrations/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEventIntegrationResponse.fromJson(response);
  }

  /// The Amazon AppIntegrations APIs are in preview release and are subject to
  /// change.
  ///
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
    _s.validateStringLength(
      'eventIntegrationName',
      eventIntegrationName,
      1,
      255,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1000,
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

  /// The Amazon AppIntegrations APIs are in preview release and are subject to
  /// change.
  ///
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1000,
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

  /// The Amazon AppIntegrations APIs are in preview release and are subject to
  /// change.
  ///
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
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      2048,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// The Amazon AppIntegrations APIs are in preview release and are subject to
  /// change.
  ///
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
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      2048,
      isRequired: true,
    );
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

  /// The Amazon AppIntegrations APIs are in preview release and are subject to
  /// change.
  ///
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
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      2048,
      isRequired: true,
    );
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

  /// The Amazon AppIntegrations APIs are in preview release and are subject to
  /// change.
  ///
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
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1000,
    );
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

class DeleteEventIntegrationResponse {
  DeleteEventIntegrationResponse();

  factory DeleteEventIntegrationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEventIntegrationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The Amazon AppIntegrations APIs are in preview release and are subject to
/// change.
///
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

/// The Amazon AppIntegrations APIs are in preview release and are subject to
/// change.
///
/// The event integration.
class EventIntegration {
  /// The event integration description.
  final String? description;

  /// The Amazon Eventbridge bus for the event integration.
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

/// The Amazon AppIntegrations APIs are in preview release and are subject to
/// change.
///
/// The event integration association.
class EventIntegrationAssociation {
  /// The metadata associated with the client.
  final Map<String, String>? clientAssociationMetadata;

  /// The identifier for the client that is associated with the event integration.
  final String? clientId;

  /// The name of the Eventbridge rule.
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

class GetEventIntegrationResponse {
  /// The description of the event integration.
  final String? description;

  /// The Eventbridge bus.
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
