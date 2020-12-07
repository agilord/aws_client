// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'connectparticipant-2018-09-07.g.dart';

/// Amazon Connect is a cloud-based contact center solution that makes it easy
/// to set up and manage a customer contact center and provide reliable customer
/// engagement at any scale.
///
/// Amazon Connect enables customer contacts through voice or chat.
///
/// The APIs described here are used by chat participants, such as agents and
/// customers.
class ConnectParticipant {
  final _s.RestJsonProtocol _protocol;
  ConnectParticipant({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'participant.connect',
            signingName: 'execute-api',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates the participant's connection. Note that ParticipantToken is used
  /// for invoking this API instead of ConnectionToken.
  ///
  /// The participant token is valid for the lifetime of the participant – until
  /// the they are part of a contact.
  ///
  /// The response URL for <code>WEBSOCKET</code> Type has a connect expiry
  /// timeout of 100s. Clients must manually connect to the returned websocket
  /// URL and subscribe to the desired topic.
  ///
  /// For chat, you need to publish the following on the established websocket
  /// connection:
  ///
  /// <code>{"topic":"aws/subscribe","content":{"topics":["aws/chat"]}}</code>
  ///
  /// Upon websocket URL expiry, as specified in the response ConnectionExpiry
  /// parameter, clients need to call this API again to obtain a new websocket
  /// URL and perform the same steps as before.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [participantToken] :
  /// Participant Token as obtained from <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_StartChatContactResponse.html">StartChatContact</a>
  /// API response.
  ///
  /// Parameter [type] :
  /// Type of connection information required.
  Future<CreateParticipantConnectionResponse> createParticipantConnection({
    @_s.required String participantToken,
    @_s.required List<ConnectionType> type,
  }) async {
    ArgumentError.checkNotNull(participantToken, 'participantToken');
    _s.validateStringLength(
      'participantToken',
      participantToken,
      1,
      1000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    final headers = <String, String>{};
    participantToken?.let((v) => headers['X-Amz-Bearer'] = v.toString());
    final $payload = <String, dynamic>{
      'Type': type?.map((e) => e?.toValue() ?? '')?.toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/participant/connection',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateParticipantConnectionResponse.fromJson(response);
  }

  /// Disconnects a participant. Note that ConnectionToken is used for invoking
  /// this API instead of ParticipantToken.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [connectionToken] :
  /// The authentication token associated with the participant's connection.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<void> disconnectParticipant({
    @_s.required String connectionToken,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(connectionToken, 'connectionToken');
    _s.validateStringLength(
      'connectionToken',
      connectionToken,
      1,
      1000,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      0,
      500,
    );
    final headers = <String, String>{};
    connectionToken?.let((v) => headers['X-Amz-Bearer'] = v.toString());
    final $payload = <String, dynamic>{
      if (clientToken != null) 'ClientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/participant/disconnect',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DisconnectParticipantResponse.fromJson(response);
  }

  /// Retrieves a transcript of the session. Note that ConnectionToken is used
  /// for invoking this API instead of ParticipantToken.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [connectionToken] :
  /// The authentication token associated with the participant's connection.
  ///
  /// Parameter [contactId] :
  /// The contactId from the current contact chain for which transcript is
  /// needed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the page. Default: 10.
  ///
  /// Parameter [nextToken] :
  /// The pagination token. Use the value returned previously in the next
  /// subsequent request to retrieve the next set of results.
  ///
  /// Parameter [scanDirection] :
  /// The direction from StartPosition from which to retrieve message. Default:
  /// BACKWARD when no StartPosition is provided, FORWARD with StartPosition.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for the records. Default: DESCENDING.
  ///
  /// Parameter [startPosition] :
  /// A filtering option for where to start.
  Future<GetTranscriptResponse> getTranscript({
    @_s.required String connectionToken,
    String contactId,
    int maxResults,
    String nextToken,
    ScanDirection scanDirection,
    SortKey sortOrder,
    StartPosition startPosition,
  }) async {
    ArgumentError.checkNotNull(connectionToken, 'connectionToken');
    _s.validateStringLength(
      'connectionToken',
      connectionToken,
      1,
      1000,
      isRequired: true,
    );
    _s.validateStringLength(
      'contactId',
      contactId,
      1,
      256,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1000,
    );
    final headers = <String, String>{};
    connectionToken?.let((v) => headers['X-Amz-Bearer'] = v.toString());
    final $payload = <String, dynamic>{
      if (contactId != null) 'ContactId': contactId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (scanDirection != null) 'ScanDirection': scanDirection.toValue(),
      if (sortOrder != null) 'SortOrder': sortOrder.toValue(),
      if (startPosition != null) 'StartPosition': startPosition,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/participant/transcript',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetTranscriptResponse.fromJson(response);
  }

  /// Sends an event. Note that ConnectionToken is used for invoking this API
  /// instead of ParticipantToken.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [connectionToken] :
  /// The authentication token associated with the participant's connection.
  ///
  /// Parameter [contentType] :
  /// The content type of the request. Supported types are:
  ///
  /// <ul>
  /// <li>
  /// application/vnd.amazonaws.connect.event.typing
  /// </li>
  /// <li>
  /// application/vnd.amazonaws.connect.event.connection.acknowledged
  /// </li>
  /// </ul>
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [content] :
  /// The content of the event to be sent (for example, message text). This is
  /// not yet supported.
  Future<SendEventResponse> sendEvent({
    @_s.required String connectionToken,
    @_s.required String contentType,
    String clientToken,
    String content,
  }) async {
    ArgumentError.checkNotNull(connectionToken, 'connectionToken');
    _s.validateStringLength(
      'connectionToken',
      connectionToken,
      1,
      1000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(contentType, 'contentType');
    _s.validateStringLength(
      'contentType',
      contentType,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      0,
      500,
    );
    _s.validateStringLength(
      'content',
      content,
      1,
      1024,
    );
    final headers = <String, String>{};
    connectionToken?.let((v) => headers['X-Amz-Bearer'] = v.toString());
    final $payload = <String, dynamic>{
      'ContentType': contentType,
      if (clientToken != null) 'ClientToken': clientToken,
      if (content != null) 'Content': content,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/participant/event',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return SendEventResponse.fromJson(response);
  }

  /// Sends a message. Note that ConnectionToken is used for invoking this API
  /// instead of ParticipantToken.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [connectionToken] :
  /// The authentication token associated with the connection.
  ///
  /// Parameter [content] :
  /// The content of the message.
  ///
  /// Parameter [contentType] :
  /// The type of the content. Supported types are text/plain.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<SendMessageResponse> sendMessage({
    @_s.required String connectionToken,
    @_s.required String content,
    @_s.required String contentType,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(connectionToken, 'connectionToken');
    _s.validateStringLength(
      'connectionToken',
      connectionToken,
      1,
      1000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(content, 'content');
    _s.validateStringLength(
      'content',
      content,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(contentType, 'contentType');
    _s.validateStringLength(
      'contentType',
      contentType,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      0,
      500,
    );
    final headers = <String, String>{};
    connectionToken?.let((v) => headers['X-Amz-Bearer'] = v.toString());
    final $payload = <String, dynamic>{
      'Content': content,
      'ContentType': contentType,
      if (clientToken != null) 'ClientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/participant/message',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return SendMessageResponse.fromJson(response);
  }
}

enum ChatItemType {
  @_s.JsonValue('MESSAGE')
  message,
  @_s.JsonValue('EVENT')
  event,
  @_s.JsonValue('CONNECTION_ACK')
  connectionAck,
}

/// Connection credentials.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConnectionCredentials {
  /// The connection token.
  @_s.JsonKey(name: 'ConnectionToken')
  final String connectionToken;

  /// The expiration of the token.
  ///
  /// It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example,
  /// 2019-11-08T02:41:28.172Z.
  @_s.JsonKey(name: 'Expiry')
  final String expiry;

  ConnectionCredentials({
    this.connectionToken,
    this.expiry,
  });
  factory ConnectionCredentials.fromJson(Map<String, dynamic> json) =>
      _$ConnectionCredentialsFromJson(json);
}

enum ConnectionType {
  @_s.JsonValue('WEBSOCKET')
  websocket,
  @_s.JsonValue('CONNECTION_CREDENTIALS')
  connectionCredentials,
}

extension on ConnectionType {
  String toValue() {
    switch (this) {
      case ConnectionType.websocket:
        return 'WEBSOCKET';
      case ConnectionType.connectionCredentials:
        return 'CONNECTION_CREDENTIALS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateParticipantConnectionResponse {
  /// Creates the participant's connection credentials. The authentication token
  /// associated with the participant's connection.
  @_s.JsonKey(name: 'ConnectionCredentials')
  final ConnectionCredentials connectionCredentials;

  /// Creates the participant's websocket connection.
  @_s.JsonKey(name: 'Websocket')
  final Websocket websocket;

  CreateParticipantConnectionResponse({
    this.connectionCredentials,
    this.websocket,
  });
  factory CreateParticipantConnectionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateParticipantConnectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisconnectParticipantResponse {
  DisconnectParticipantResponse();
  factory DisconnectParticipantResponse.fromJson(Map<String, dynamic> json) =>
      _$DisconnectParticipantResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTranscriptResponse {
  /// The initial contact ID for the contact.
  @_s.JsonKey(name: 'InitialContactId')
  final String initialContactId;

  /// The pagination token. Use the value returned previously in the next
  /// subsequent request to retrieve the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of messages in the session.
  @_s.JsonKey(name: 'Transcript')
  final List<Item> transcript;

  GetTranscriptResponse({
    this.initialContactId,
    this.nextToken,
    this.transcript,
  });
  factory GetTranscriptResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTranscriptResponseFromJson(json);
}

/// An item - message or event - that has been sent.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Item {
  /// The time when the message or event was sent.
  ///
  /// It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example,
  /// 2019-11-08T02:41:28.172Z.
  @_s.JsonKey(name: 'AbsoluteTime')
  final String absoluteTime;

  /// The content of the message or event.
  @_s.JsonKey(name: 'Content')
  final String content;

  /// The type of content of the item.
  @_s.JsonKey(name: 'ContentType')
  final String contentType;

  /// The chat display name of the sender.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The ID of the item.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The ID of the sender in the session.
  @_s.JsonKey(name: 'ParticipantId')
  final String participantId;

  /// The role of the sender. For example, is it a customer, agent, or system.
  @_s.JsonKey(name: 'ParticipantRole')
  final ParticipantRole participantRole;

  /// Type of the item: message or event.
  @_s.JsonKey(name: 'Type')
  final ChatItemType type;

  Item({
    this.absoluteTime,
    this.content,
    this.contentType,
    this.displayName,
    this.id,
    this.participantId,
    this.participantRole,
    this.type,
  });
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

enum ParticipantRole {
  @_s.JsonValue('AGENT')
  agent,
  @_s.JsonValue('CUSTOMER')
  customer,
  @_s.JsonValue('SYSTEM')
  system,
}

enum ScanDirection {
  @_s.JsonValue('FORWARD')
  forward,
  @_s.JsonValue('BACKWARD')
  backward,
}

extension on ScanDirection {
  String toValue() {
    switch (this) {
      case ScanDirection.forward:
        return 'FORWARD';
      case ScanDirection.backward:
        return 'BACKWARD';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendEventResponse {
  /// The time when the event was sent.
  ///
  /// It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example,
  /// 2019-11-08T02:41:28.172Z.
  @_s.JsonKey(name: 'AbsoluteTime')
  final String absoluteTime;

  /// The ID of the response.
  @_s.JsonKey(name: 'Id')
  final String id;

  SendEventResponse({
    this.absoluteTime,
    this.id,
  });
  factory SendEventResponse.fromJson(Map<String, dynamic> json) =>
      _$SendEventResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendMessageResponse {
  /// The time when the message was sent.
  ///
  /// It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example,
  /// 2019-11-08T02:41:28.172Z.
  @_s.JsonKey(name: 'AbsoluteTime')
  final String absoluteTime;

  /// The ID of the message.
  @_s.JsonKey(name: 'Id')
  final String id;

  SendMessageResponse({
    this.absoluteTime,
    this.id,
  });
  factory SendMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$SendMessageResponseFromJson(json);
}

enum SortKey {
  @_s.JsonValue('DESCENDING')
  descending,
  @_s.JsonValue('ASCENDING')
  ascending,
}

extension on SortKey {
  String toValue() {
    switch (this) {
      case SortKey.descending:
        return 'DESCENDING';
      case SortKey.ascending:
        return 'ASCENDING';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A filtering option for where to start. For example, if you sent 100
/// messages, start with message 50.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartPosition {
  /// The time in ISO format where to start.
  ///
  /// It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example,
  /// 2019-11-08T02:41:28.172Z.
  @_s.JsonKey(name: 'AbsoluteTime')
  final String absoluteTime;

  /// The ID of the message or event where to start.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The start position of the most recent message where you want to start.
  @_s.JsonKey(name: 'MostRecent')
  final int mostRecent;

  StartPosition({
    this.absoluteTime,
    this.id,
    this.mostRecent,
  });
  Map<String, dynamic> toJson() => _$StartPositionToJson(this);
}

/// The websocket for the participant's connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Websocket {
  /// The URL expiration timestamp in ISO date format.
  ///
  /// It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example,
  /// 2019-11-08T02:41:28.172Z.
  @_s.JsonKey(name: 'ConnectionExpiry')
  final String connectionExpiry;

  /// The URL of the websocket.
  @_s.JsonKey(name: 'Url')
  final String url;

  Websocket({
    this.connectionExpiry,
    this.url,
  });
  factory Websocket.fromJson(Map<String, dynamic> json) =>
      _$WebsocketFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
