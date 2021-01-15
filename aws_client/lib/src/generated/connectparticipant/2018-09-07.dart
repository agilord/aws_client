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

part '2018-09-07.g.dart';

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

  /// Allows you to confirm that the attachment has been uploaded using the
  /// pre-signed URL provided in StartAttachmentUpload API.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [attachmentIds] :
  /// A list of unique identifiers for the attachments.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [connectionToken] :
  /// The authentication token associated with the participant's connection.
  Future<void> completeAttachmentUpload({
    @_s.required List<String> attachmentIds,
    @_s.required String clientToken,
    @_s.required String connectionToken,
  }) async {
    ArgumentError.checkNotNull(attachmentIds, 'attachmentIds');
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(connectionToken, 'connectionToken');
    _s.validateStringLength(
      'connectionToken',
      connectionToken,
      1,
      1000,
      isRequired: true,
    );
    final headers = <String, String>{};
    connectionToken?.let((v) => headers['X-Amz-Bearer'] = v.toString());
    final $payload = <String, dynamic>{
      'AttachmentIds': attachmentIds,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/participant/complete-attachment-upload',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CompleteAttachmentUploadResponse.fromJson(response);
  }

  /// Creates the participant's connection. Note that ParticipantToken is used
  /// for invoking this API instead of ConnectionToken.
  ///
  /// The participant token is valid for the lifetime of the participant – until
  /// they are part of a contact.
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
  /// <note>
  /// The Amazon Connect Participant Service APIs do not use <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4 authentication</a>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [participantToken] :
  /// This is a header parameter.
  ///
  /// The Participant Token as obtained from <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_StartChatContact.html">StartChatContact</a>
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
  /// The Amazon Connect Participant Service APIs do not use <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4 authentication</a>.
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
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
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

  /// Provides a pre-signed URL for download of a completed attachment. This is
  /// an asynchronous API for use with active contacts.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [attachmentId] :
  /// A unique identifier for the attachment.
  ///
  /// Parameter [connectionToken] :
  /// The authentication token associated with the participant's connection.
  Future<GetAttachmentResponse> getAttachment({
    @_s.required String attachmentId,
    @_s.required String connectionToken,
  }) async {
    ArgumentError.checkNotNull(attachmentId, 'attachmentId');
    _s.validateStringLength(
      'attachmentId',
      attachmentId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(connectionToken, 'connectionToken');
    _s.validateStringLength(
      'connectionToken',
      connectionToken,
      1,
      1000,
      isRequired: true,
    );
    final headers = <String, String>{};
    connectionToken?.let((v) => headers['X-Amz-Bearer'] = v.toString());
    final $payload = <String, dynamic>{
      'AttachmentId': attachmentId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/participant/attachment',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetAttachmentResponse.fromJson(response);
  }

  /// Retrieves a transcript of the session, including details about any
  /// attachments. Note that ConnectionToken is used for invoking this API
  /// instead of ParticipantToken.
  ///
  /// The Amazon Connect Participant Service APIs do not use <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4 authentication</a>.
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
  /// The Amazon Connect Participant Service APIs do not use <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4 authentication</a>.
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
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
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
  /// <note>
  /// The Amazon Connect Participant Service APIs do not use <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4 authentication</a>.
  /// </note>
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
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
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

  /// Provides a pre-signed Amazon S3 URL in response for uploading the file
  /// directly to S3.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [attachmentName] :
  /// A case-sensitive name of the attachment being uploaded.
  ///
  /// Parameter [attachmentSizeInBytes] :
  /// The size of the attachment in bytes.
  ///
  /// Parameter [clientToken] :
  /// A unique case sensitive identifier to support idempotency of request.
  ///
  /// Parameter [connectionToken] :
  /// The authentication token associated with the participant's connection.
  ///
  /// Parameter [contentType] :
  /// Describes the MIME file type of the attachment. For a list of supported
  /// file types, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#feature-limits">Feature
  /// specifications</a> in the <i>Amazon Connect Administrator Guide</i>.
  Future<StartAttachmentUploadResponse> startAttachmentUpload({
    @_s.required String attachmentName,
    @_s.required int attachmentSizeInBytes,
    @_s.required String clientToken,
    @_s.required String connectionToken,
    @_s.required String contentType,
  }) async {
    ArgumentError.checkNotNull(attachmentName, 'attachmentName');
    _s.validateStringLength(
      'attachmentName',
      attachmentName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(attachmentSizeInBytes, 'attachmentSizeInBytes');
    _s.validateNumRange(
      'attachmentSizeInBytes',
      attachmentSizeInBytes,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      500,
      isRequired: true,
    );
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
      255,
      isRequired: true,
    );
    final headers = <String, String>{};
    connectionToken?.let((v) => headers['X-Amz-Bearer'] = v.toString());
    final $payload = <String, dynamic>{
      'AttachmentName': attachmentName,
      'AttachmentSizeInBytes': attachmentSizeInBytes,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      'ContentType': contentType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/participant/start-attachment-upload',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return StartAttachmentUploadResponse.fromJson(response);
  }
}

enum ArtifactStatus {
  @_s.JsonValue('APPROVED')
  approved,
  @_s.JsonValue('REJECTED')
  rejected,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
}

/// The case-insensitive input to indicate standard MIME type that describes the
/// format of the file that will be uploaded.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttachmentItem {
  /// A unique identifier for the attachment.
  @_s.JsonKey(name: 'AttachmentId')
  final String attachmentId;

  /// A case-sensitive name of the attachment being uploaded.
  @_s.JsonKey(name: 'AttachmentName')
  final String attachmentName;

  /// Describes the MIME file type of the attachment. For a list of supported file
  /// types, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#feature-limits">Feature
  /// specifications</a> in the <i>Amazon Connect Administrator Guide</i>.
  @_s.JsonKey(name: 'ContentType')
  final String contentType;

  /// Status of the attachment.
  @_s.JsonKey(name: 'Status')
  final ArtifactStatus status;

  AttachmentItem({
    this.attachmentId,
    this.attachmentName,
    this.contentType,
    this.status,
  });
  factory AttachmentItem.fromJson(Map<String, dynamic> json) =>
      _$AttachmentItemFromJson(json);
}

enum ChatItemType {
  @_s.JsonValue('TYPING')
  typing,
  @_s.JsonValue('PARTICIPANT_JOINED')
  participantJoined,
  @_s.JsonValue('PARTICIPANT_LEFT')
  participantLeft,
  @_s.JsonValue('CHAT_ENDED')
  chatEnded,
  @_s.JsonValue('TRANSFER_SUCCEEDED')
  transferSucceeded,
  @_s.JsonValue('TRANSFER_FAILED')
  transferFailed,
  @_s.JsonValue('MESSAGE')
  message,
  @_s.JsonValue('EVENT')
  event,
  @_s.JsonValue('ATTACHMENT')
  attachment,
  @_s.JsonValue('CONNECTION_ACK')
  connectionAck,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CompleteAttachmentUploadResponse {
  CompleteAttachmentUploadResponse();
  factory CompleteAttachmentUploadResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CompleteAttachmentUploadResponseFromJson(json);
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
class GetAttachmentResponse {
  /// The pre-signed URL using which file would be downloaded from Amazon S3 by
  /// the API caller.
  @_s.JsonKey(name: 'Url')
  final String url;

  /// The expiration time of the URL in ISO timestamp. It's specified in ISO 8601
  /// format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.
  @_s.JsonKey(name: 'UrlExpiry')
  final String urlExpiry;

  GetAttachmentResponse({
    this.url,
    this.urlExpiry,
  });
  factory GetAttachmentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAttachmentResponseFromJson(json);
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

  /// Provides information about the attachments.
  @_s.JsonKey(name: 'Attachments')
  final List<AttachmentItem> attachments;

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
    this.attachments,
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartAttachmentUploadResponse {
  /// A unique identifier for the attachment.
  @_s.JsonKey(name: 'AttachmentId')
  final String attachmentId;

  /// Fields to be used while uploading the attachment.
  @_s.JsonKey(name: 'UploadMetadata')
  final UploadMetadata uploadMetadata;

  StartAttachmentUploadResponse({
    this.attachmentId,
    this.uploadMetadata,
  });
  factory StartAttachmentUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$StartAttachmentUploadResponseFromJson(json);
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

/// Fields to be used while uploading the attachment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UploadMetadata {
  /// The headers to be provided while uploading the file to the URL.
  @_s.JsonKey(name: 'HeadersToInclude')
  final Map<String, String> headersToInclude;

  /// The pre-signed URL using which file would be downloaded from Amazon S3 by
  /// the API caller.
  @_s.JsonKey(name: 'Url')
  final String url;

  /// The expiration time of the URL in ISO timestamp. It's specified in ISO 8601
  /// format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.
  @_s.JsonKey(name: 'UrlExpiry')
  final String urlExpiry;

  UploadMetadata({
    this.headersToInclude,
    this.url,
    this.urlExpiry,
  });
  factory UploadMetadata.fromJson(Map<String, dynamic> json) =>
      _$UploadMetadataFromJson(json);
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

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
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
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
