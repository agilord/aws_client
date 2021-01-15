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

part '2020-07-29.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String eventBridgeBus,
    @_s.required EventFilter eventFilter,
    @_s.required String name,
    String clientToken,
    String description,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(eventBridgeBus, 'eventBridgeBus');
    _s.validateStringLength(
      'eventBridgeBus',
      eventBridgeBus,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'eventBridgeBus',
      eventBridgeBus,
      r'''^[a-zA-Z0-9\/\._\-]+$''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9\/\._\-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''.*''',
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1000,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''.*''',
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
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9\/\._\-]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/eventIntegrations/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteEventIntegrationResponse.fromJson(response);
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
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9\/\._\-]+$''',
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
    @_s.required String eventIntegrationName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(eventIntegrationName, 'eventIntegrationName');
    _s.validateStringLength(
      'eventIntegrationName',
      eventIntegrationName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'eventIntegrationName',
      eventIntegrationName,
      r'''^[a-zA-Z0-9\/\._\-]+$''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
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
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$''',
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$''',
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
    return TagResourceResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws:[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
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
    @_s.required String name,
    String description,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9\/\._\-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1000,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''.*''',
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
    return UpdateEventIntegrationResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateEventIntegrationResponse {
  /// The Amazon Resource Name (ARN) of the event integration.
  @_s.JsonKey(name: 'EventIntegrationArn')
  final String eventIntegrationArn;

  CreateEventIntegrationResponse({
    this.eventIntegrationArn,
  });
  factory CreateEventIntegrationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateEventIntegrationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteEventIntegrationResponse {
  DeleteEventIntegrationResponse();
  factory DeleteEventIntegrationResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteEventIntegrationResponseFromJson(json);
}

/// The Amazon AppIntegrations APIs are in preview release and are subject to
/// change.
///
/// The event filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EventFilter {
  /// The source of the events.
  @_s.JsonKey(name: 'Source')
  final String source;

  EventFilter({
    @_s.required this.source,
  });
  factory EventFilter.fromJson(Map<String, dynamic> json) =>
      _$EventFilterFromJson(json);

  Map<String, dynamic> toJson() => _$EventFilterToJson(this);
}

/// The Amazon AppIntegrations APIs are in preview release and are subject to
/// change.
///
/// The event integration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventIntegration {
  /// The event integration description.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The Amazon Eventbridge bus for the event integration.
  @_s.JsonKey(name: 'EventBridgeBus')
  final String eventBridgeBus;

  /// The event integration filter.
  @_s.JsonKey(name: 'EventFilter')
  final EventFilter eventFilter;

  /// The Amazon Resource Name (ARN) of the event integration.
  @_s.JsonKey(name: 'EventIntegrationArn')
  final String eventIntegrationArn;

  /// The name of the event integration.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The tags.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  EventIntegration({
    this.description,
    this.eventBridgeBus,
    this.eventFilter,
    this.eventIntegrationArn,
    this.name,
    this.tags,
  });
  factory EventIntegration.fromJson(Map<String, dynamic> json) =>
      _$EventIntegrationFromJson(json);
}

/// The Amazon AppIntegrations APIs are in preview release and are subject to
/// change.
///
/// The event integration association.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventIntegrationAssociation {
  /// The metadata associated with the client.
  @_s.JsonKey(name: 'ClientAssociationMetadata')
  final Map<String, String> clientAssociationMetadata;

  /// The identifier for the client that is associated with the event integration.
  @_s.JsonKey(name: 'ClientId')
  final String clientId;

  /// The name of the Eventbridge rule.
  @_s.JsonKey(name: 'EventBridgeRuleName')
  final String eventBridgeRuleName;

  /// The Amazon Resource Name (ARN) for the event integration association.
  @_s.JsonKey(name: 'EventIntegrationAssociationArn')
  final String eventIntegrationAssociationArn;

  /// The identifier for the event integration association.
  @_s.JsonKey(name: 'EventIntegrationAssociationId')
  final String eventIntegrationAssociationId;

  /// The name of the event integration.
  @_s.JsonKey(name: 'EventIntegrationName')
  final String eventIntegrationName;

  EventIntegrationAssociation({
    this.clientAssociationMetadata,
    this.clientId,
    this.eventBridgeRuleName,
    this.eventIntegrationAssociationArn,
    this.eventIntegrationAssociationId,
    this.eventIntegrationName,
  });
  factory EventIntegrationAssociation.fromJson(Map<String, dynamic> json) =>
      _$EventIntegrationAssociationFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEventIntegrationResponse {
  /// The description of the event integration.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The Eventbridge bus.
  @_s.JsonKey(name: 'EventBridgeBus')
  final String eventBridgeBus;

  /// The event filter.
  @_s.JsonKey(name: 'EventFilter')
  final EventFilter eventFilter;

  /// The Amazon Resource Name (ARN) for the event integration.
  @_s.JsonKey(name: 'EventIntegrationArn')
  final String eventIntegrationArn;

  /// The name of the event integration.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// One or more tags.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  GetEventIntegrationResponse({
    this.description,
    this.eventBridgeBus,
    this.eventFilter,
    this.eventIntegrationArn,
    this.name,
    this.tags,
  });
  factory GetEventIntegrationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEventIntegrationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEventIntegrationAssociationsResponse {
  /// The event integration associations.
  @_s.JsonKey(name: 'EventIntegrationAssociations')
  final List<EventIntegrationAssociation> eventIntegrationAssociations;

  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListEventIntegrationAssociationsResponse({
    this.eventIntegrationAssociations,
    this.nextToken,
  });
  factory ListEventIntegrationAssociationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListEventIntegrationAssociationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEventIntegrationsResponse {
  /// The event integrations.
  @_s.JsonKey(name: 'EventIntegrations')
  final List<EventIntegration> eventIntegrations;

  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListEventIntegrationsResponse({
    this.eventIntegrations,
    this.nextToken,
  });
  factory ListEventIntegrationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListEventIntegrationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// Information about the tags.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateEventIntegrationResponse {
  UpdateEventIntegrationResponse();
  factory UpdateEventIntegrationResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateEventIntegrationResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class DuplicateResourceException extends _s.GenericAwsException {
  DuplicateResourceException({String type, String message})
      : super(type: type, code: 'DuplicateResourceException', message: message);
}

class InternalServiceError extends _s.GenericAwsException {
  InternalServiceError({String type, String message})
      : super(type: type, code: 'InternalServiceError', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceQuotaExceededException extends _s.GenericAwsException {
  ResourceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ResourceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
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
