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
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
  /// Parameter [connectionToken] :
  /// The authentication token associated with the participant's connection.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<void> completeAttachmentUpload({
    required List<String> attachmentIds,
    required String connectionToken,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(attachmentIds, 'attachmentIds');
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
      1,
      500,
    );
    final headers = <String, String>{
      'X-Amz-Bearer': connectionToken.toString(),
    };
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
    required String participantToken,
    required List<ConnectionType> type,
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
    final headers = <String, String>{
      'X-Amz-Bearer': participantToken.toString(),
    };
    final $payload = <String, dynamic>{
      'Type': type.map((e) => e.toValue()).toList(),
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
    required String connectionToken,
    String? clientToken,
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
    final headers = <String, String>{
      'X-Amz-Bearer': connectionToken.toString(),
    };
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
    required String attachmentId,
    required String connectionToken,
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
    final headers = <String, String>{
      'X-Amz-Bearer': connectionToken.toString(),
    };
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
    required String connectionToken,
    String? contactId,
    int? maxResults,
    String? nextToken,
    ScanDirection? scanDirection,
    SortKey? sortOrder,
    StartPosition? startPosition,
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
    final headers = <String, String>{
      'X-Amz-Bearer': connectionToken.toString(),
    };
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
    required String connectionToken,
    required String contentType,
    String? clientToken,
    String? content,
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
    final headers = <String, String>{
      'X-Amz-Bearer': connectionToken.toString(),
    };
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
    required String connectionToken,
    required String content,
    required String contentType,
    String? clientToken,
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
    final headers = <String, String>{
      'X-Amz-Bearer': connectionToken.toString(),
    };
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
  /// Parameter [connectionToken] :
  /// The authentication token associated with the participant's connection.
  ///
  /// Parameter [contentType] :
  /// Describes the MIME file type of the attachment. For a list of supported
  /// file types, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#feature-limits">Feature
  /// specifications</a> in the <i>Amazon Connect Administrator Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A unique case sensitive identifier to support idempotency of request.
  Future<StartAttachmentUploadResponse> startAttachmentUpload({
    required String attachmentName,
    required int attachmentSizeInBytes,
    required String connectionToken,
    required String contentType,
    String? clientToken,
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
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      500,
    );
    final headers = <String, String>{
      'X-Amz-Bearer': connectionToken.toString(),
    };
    final $payload = <String, dynamic>{
      'AttachmentName': attachmentName,
      'AttachmentSizeInBytes': attachmentSizeInBytes,
      'ContentType': contentType,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
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
  approved,
  rejected,
  inProgress,
}

extension on ArtifactStatus {
  String toValue() {
    switch (this) {
      case ArtifactStatus.approved:
        return 'APPROVED';
      case ArtifactStatus.rejected:
        return 'REJECTED';
      case ArtifactStatus.inProgress:
        return 'IN_PROGRESS';
    }
  }
}

extension on String {
  ArtifactStatus toArtifactStatus() {
    switch (this) {
      case 'APPROVED':
        return ArtifactStatus.approved;
      case 'REJECTED':
        return ArtifactStatus.rejected;
      case 'IN_PROGRESS':
        return ArtifactStatus.inProgress;
    }
    throw Exception('$this is not known in enum ArtifactStatus');
  }
}

/// The case-insensitive input to indicate standard MIME type that describes the
/// format of the file that will be uploaded.
class AttachmentItem {
  /// A unique identifier for the attachment.
  final String? attachmentId;

  /// A case-sensitive name of the attachment being uploaded.
  final String? attachmentName;

  /// Describes the MIME file type of the attachment. For a list of supported file
  /// types, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#feature-limits">Feature
  /// specifications</a> in the <i>Amazon Connect Administrator Guide</i>.
  final String? contentType;

  /// Status of the attachment.
  final ArtifactStatus? status;

  AttachmentItem({
    this.attachmentId,
    this.attachmentName,
    this.contentType,
    this.status,
  });

  factory AttachmentItem.fromJson(Map<String, dynamic> json) {
    return AttachmentItem(
      attachmentId: json['AttachmentId'] as String?,
      attachmentName: json['AttachmentName'] as String?,
      contentType: json['ContentType'] as String?,
      status: (json['Status'] as String?)?.toArtifactStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentId = this.attachmentId;
    final attachmentName = this.attachmentName;
    final contentType = this.contentType;
    final status = this.status;
    return {
      if (attachmentId != null) 'AttachmentId': attachmentId,
      if (attachmentName != null) 'AttachmentName': attachmentName,
      if (contentType != null) 'ContentType': contentType,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum ChatItemType {
  typing,
  participantJoined,
  participantLeft,
  chatEnded,
  transferSucceeded,
  transferFailed,
  message,
  event,
  attachment,
  connectionAck,
}

extension on ChatItemType {
  String toValue() {
    switch (this) {
      case ChatItemType.typing:
        return 'TYPING';
      case ChatItemType.participantJoined:
        return 'PARTICIPANT_JOINED';
      case ChatItemType.participantLeft:
        return 'PARTICIPANT_LEFT';
      case ChatItemType.chatEnded:
        return 'CHAT_ENDED';
      case ChatItemType.transferSucceeded:
        return 'TRANSFER_SUCCEEDED';
      case ChatItemType.transferFailed:
        return 'TRANSFER_FAILED';
      case ChatItemType.message:
        return 'MESSAGE';
      case ChatItemType.event:
        return 'EVENT';
      case ChatItemType.attachment:
        return 'ATTACHMENT';
      case ChatItemType.connectionAck:
        return 'CONNECTION_ACK';
    }
  }
}

extension on String {
  ChatItemType toChatItemType() {
    switch (this) {
      case 'TYPING':
        return ChatItemType.typing;
      case 'PARTICIPANT_JOINED':
        return ChatItemType.participantJoined;
      case 'PARTICIPANT_LEFT':
        return ChatItemType.participantLeft;
      case 'CHAT_ENDED':
        return ChatItemType.chatEnded;
      case 'TRANSFER_SUCCEEDED':
        return ChatItemType.transferSucceeded;
      case 'TRANSFER_FAILED':
        return ChatItemType.transferFailed;
      case 'MESSAGE':
        return ChatItemType.message;
      case 'EVENT':
        return ChatItemType.event;
      case 'ATTACHMENT':
        return ChatItemType.attachment;
      case 'CONNECTION_ACK':
        return ChatItemType.connectionAck;
    }
    throw Exception('$this is not known in enum ChatItemType');
  }
}

class CompleteAttachmentUploadResponse {
  CompleteAttachmentUploadResponse();

  factory CompleteAttachmentUploadResponse.fromJson(Map<String, dynamic> _) {
    return CompleteAttachmentUploadResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Connection credentials.
class ConnectionCredentials {
  /// The connection token.
  final String? connectionToken;

  /// The expiration of the token.
  ///
  /// It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example,
  /// 2019-11-08T02:41:28.172Z.
  final String? expiry;

  ConnectionCredentials({
    this.connectionToken,
    this.expiry,
  });

  factory ConnectionCredentials.fromJson(Map<String, dynamic> json) {
    return ConnectionCredentials(
      connectionToken: json['ConnectionToken'] as String?,
      expiry: json['Expiry'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionToken = this.connectionToken;
    final expiry = this.expiry;
    return {
      if (connectionToken != null) 'ConnectionToken': connectionToken,
      if (expiry != null) 'Expiry': expiry,
    };
  }
}

enum ConnectionType {
  websocket,
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
  }
}

extension on String {
  ConnectionType toConnectionType() {
    switch (this) {
      case 'WEBSOCKET':
        return ConnectionType.websocket;
      case 'CONNECTION_CREDENTIALS':
        return ConnectionType.connectionCredentials;
    }
    throw Exception('$this is not known in enum ConnectionType');
  }
}

class CreateParticipantConnectionResponse {
  /// Creates the participant's connection credentials. The authentication token
  /// associated with the participant's connection.
  final ConnectionCredentials? connectionCredentials;

  /// Creates the participant's websocket connection.
  final Websocket? websocket;

  CreateParticipantConnectionResponse({
    this.connectionCredentials,
    this.websocket,
  });

  factory CreateParticipantConnectionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateParticipantConnectionResponse(
      connectionCredentials: json['ConnectionCredentials'] != null
          ? ConnectionCredentials.fromJson(
              json['ConnectionCredentials'] as Map<String, dynamic>)
          : null,
      websocket: json['Websocket'] != null
          ? Websocket.fromJson(json['Websocket'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionCredentials = this.connectionCredentials;
    final websocket = this.websocket;
    return {
      if (connectionCredentials != null)
        'ConnectionCredentials': connectionCredentials,
      if (websocket != null) 'Websocket': websocket,
    };
  }
}

class DisconnectParticipantResponse {
  DisconnectParticipantResponse();

  factory DisconnectParticipantResponse.fromJson(Map<String, dynamic> _) {
    return DisconnectParticipantResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetAttachmentResponse {
  /// The pre-signed URL using which file would be downloaded from Amazon S3 by
  /// the API caller.
  final String? url;

  /// The expiration time of the URL in ISO timestamp. It's specified in ISO 8601
  /// format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.
  final String? urlExpiry;

  GetAttachmentResponse({
    this.url,
    this.urlExpiry,
  });

  factory GetAttachmentResponse.fromJson(Map<String, dynamic> json) {
    return GetAttachmentResponse(
      url: json['Url'] as String?,
      urlExpiry: json['UrlExpiry'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final url = this.url;
    final urlExpiry = this.urlExpiry;
    return {
      if (url != null) 'Url': url,
      if (urlExpiry != null) 'UrlExpiry': urlExpiry,
    };
  }
}

class GetTranscriptResponse {
  /// The initial contact ID for the contact.
  final String? initialContactId;

  /// The pagination token. Use the value returned previously in the next
  /// subsequent request to retrieve the next set of results.
  final String? nextToken;

  /// The list of messages in the session.
  final List<Item>? transcript;

  GetTranscriptResponse({
    this.initialContactId,
    this.nextToken,
    this.transcript,
  });

  factory GetTranscriptResponse.fromJson(Map<String, dynamic> json) {
    return GetTranscriptResponse(
      initialContactId: json['InitialContactId'] as String?,
      nextToken: json['NextToken'] as String?,
      transcript: (json['Transcript'] as List?)
          ?.whereNotNull()
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final initialContactId = this.initialContactId;
    final nextToken = this.nextToken;
    final transcript = this.transcript;
    return {
      if (initialContactId != null) 'InitialContactId': initialContactId,
      if (nextToken != null) 'NextToken': nextToken,
      if (transcript != null) 'Transcript': transcript,
    };
  }
}

/// An item - message or event - that has been sent.
class Item {
  /// The time when the message or event was sent.
  ///
  /// It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example,
  /// 2019-11-08T02:41:28.172Z.
  final String? absoluteTime;

  /// Provides information about the attachments.
  final List<AttachmentItem>? attachments;

  /// The content of the message or event.
  final String? content;

  /// The type of content of the item.
  final String? contentType;

  /// The chat display name of the sender.
  final String? displayName;

  /// The ID of the item.
  final String? id;

  /// The ID of the sender in the session.
  final String? participantId;

  /// The role of the sender. For example, is it a customer, agent, or system.
  final ParticipantRole? participantRole;

  /// Type of the item: message or event.
  final ChatItemType? type;

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

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      absoluteTime: json['AbsoluteTime'] as String?,
      attachments: (json['Attachments'] as List?)
          ?.whereNotNull()
          .map((e) => AttachmentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      content: json['Content'] as String?,
      contentType: json['ContentType'] as String?,
      displayName: json['DisplayName'] as String?,
      id: json['Id'] as String?,
      participantId: json['ParticipantId'] as String?,
      participantRole:
          (json['ParticipantRole'] as String?)?.toParticipantRole(),
      type: (json['Type'] as String?)?.toChatItemType(),
    );
  }

  Map<String, dynamic> toJson() {
    final absoluteTime = this.absoluteTime;
    final attachments = this.attachments;
    final content = this.content;
    final contentType = this.contentType;
    final displayName = this.displayName;
    final id = this.id;
    final participantId = this.participantId;
    final participantRole = this.participantRole;
    final type = this.type;
    return {
      if (absoluteTime != null) 'AbsoluteTime': absoluteTime,
      if (attachments != null) 'Attachments': attachments,
      if (content != null) 'Content': content,
      if (contentType != null) 'ContentType': contentType,
      if (displayName != null) 'DisplayName': displayName,
      if (id != null) 'Id': id,
      if (participantId != null) 'ParticipantId': participantId,
      if (participantRole != null) 'ParticipantRole': participantRole.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum ParticipantRole {
  agent,
  customer,
  system,
}

extension on ParticipantRole {
  String toValue() {
    switch (this) {
      case ParticipantRole.agent:
        return 'AGENT';
      case ParticipantRole.customer:
        return 'CUSTOMER';
      case ParticipantRole.system:
        return 'SYSTEM';
    }
  }
}

extension on String {
  ParticipantRole toParticipantRole() {
    switch (this) {
      case 'AGENT':
        return ParticipantRole.agent;
      case 'CUSTOMER':
        return ParticipantRole.customer;
      case 'SYSTEM':
        return ParticipantRole.system;
    }
    throw Exception('$this is not known in enum ParticipantRole');
  }
}

enum ScanDirection {
  forward,
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
  }
}

extension on String {
  ScanDirection toScanDirection() {
    switch (this) {
      case 'FORWARD':
        return ScanDirection.forward;
      case 'BACKWARD':
        return ScanDirection.backward;
    }
    throw Exception('$this is not known in enum ScanDirection');
  }
}

class SendEventResponse {
  /// The time when the event was sent.
  ///
  /// It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example,
  /// 2019-11-08T02:41:28.172Z.
  final String? absoluteTime;

  /// The ID of the response.
  final String? id;

  SendEventResponse({
    this.absoluteTime,
    this.id,
  });

  factory SendEventResponse.fromJson(Map<String, dynamic> json) {
    return SendEventResponse(
      absoluteTime: json['AbsoluteTime'] as String?,
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final absoluteTime = this.absoluteTime;
    final id = this.id;
    return {
      if (absoluteTime != null) 'AbsoluteTime': absoluteTime,
      if (id != null) 'Id': id,
    };
  }
}

class SendMessageResponse {
  /// The time when the message was sent.
  ///
  /// It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example,
  /// 2019-11-08T02:41:28.172Z.
  final String? absoluteTime;

  /// The ID of the message.
  final String? id;

  SendMessageResponse({
    this.absoluteTime,
    this.id,
  });

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) {
    return SendMessageResponse(
      absoluteTime: json['AbsoluteTime'] as String?,
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final absoluteTime = this.absoluteTime;
    final id = this.id;
    return {
      if (absoluteTime != null) 'AbsoluteTime': absoluteTime,
      if (id != null) 'Id': id,
    };
  }
}

enum SortKey {
  descending,
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
  }
}

extension on String {
  SortKey toSortKey() {
    switch (this) {
      case 'DESCENDING':
        return SortKey.descending;
      case 'ASCENDING':
        return SortKey.ascending;
    }
    throw Exception('$this is not known in enum SortKey');
  }
}

class StartAttachmentUploadResponse {
  /// A unique identifier for the attachment.
  final String? attachmentId;

  /// Fields to be used while uploading the attachment.
  final UploadMetadata? uploadMetadata;

  StartAttachmentUploadResponse({
    this.attachmentId,
    this.uploadMetadata,
  });

  factory StartAttachmentUploadResponse.fromJson(Map<String, dynamic> json) {
    return StartAttachmentUploadResponse(
      attachmentId: json['AttachmentId'] as String?,
      uploadMetadata: json['UploadMetadata'] != null
          ? UploadMetadata.fromJson(
              json['UploadMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentId = this.attachmentId;
    final uploadMetadata = this.uploadMetadata;
    return {
      if (attachmentId != null) 'AttachmentId': attachmentId,
      if (uploadMetadata != null) 'UploadMetadata': uploadMetadata,
    };
  }
}

/// A filtering option for where to start. For example, if you sent 100
/// messages, start with message 50.
class StartPosition {
  /// The time in ISO format where to start.
  ///
  /// It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example,
  /// 2019-11-08T02:41:28.172Z.
  final String? absoluteTime;

  /// The ID of the message or event where to start.
  final String? id;

  /// The start position of the most recent message where you want to start.
  final int? mostRecent;

  StartPosition({
    this.absoluteTime,
    this.id,
    this.mostRecent,
  });

  factory StartPosition.fromJson(Map<String, dynamic> json) {
    return StartPosition(
      absoluteTime: json['AbsoluteTime'] as String?,
      id: json['Id'] as String?,
      mostRecent: json['MostRecent'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final absoluteTime = this.absoluteTime;
    final id = this.id;
    final mostRecent = this.mostRecent;
    return {
      if (absoluteTime != null) 'AbsoluteTime': absoluteTime,
      if (id != null) 'Id': id,
      if (mostRecent != null) 'MostRecent': mostRecent,
    };
  }
}

/// Fields to be used while uploading the attachment.
class UploadMetadata {
  /// The headers to be provided while uploading the file to the URL.
  final Map<String, String>? headersToInclude;

  /// The pre-signed URL using which file would be downloaded from Amazon S3 by
  /// the API caller.
  final String? url;

  /// The expiration time of the URL in ISO timestamp. It's specified in ISO 8601
  /// format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.
  final String? urlExpiry;

  UploadMetadata({
    this.headersToInclude,
    this.url,
    this.urlExpiry,
  });

  factory UploadMetadata.fromJson(Map<String, dynamic> json) {
    return UploadMetadata(
      headersToInclude: (json['HeadersToInclude'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      url: json['Url'] as String?,
      urlExpiry: json['UrlExpiry'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final headersToInclude = this.headersToInclude;
    final url = this.url;
    final urlExpiry = this.urlExpiry;
    return {
      if (headersToInclude != null) 'HeadersToInclude': headersToInclude,
      if (url != null) 'Url': url,
      if (urlExpiry != null) 'UrlExpiry': urlExpiry,
    };
  }
}

/// The websocket for the participant's connection.
class Websocket {
  /// The URL expiration timestamp in ISO date format.
  ///
  /// It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example,
  /// 2019-11-08T02:41:28.172Z.
  final String? connectionExpiry;

  /// The URL of the websocket.
  final String? url;

  Websocket({
    this.connectionExpiry,
    this.url,
  });

  factory Websocket.fromJson(Map<String, dynamic> json) {
    return Websocket(
      connectionExpiry: json['ConnectionExpiry'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionExpiry = this.connectionExpiry;
    final url = this.url;
    return {
      if (connectionExpiry != null) 'ConnectionExpiry': connectionExpiry,
      if (url != null) 'Url': url,
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
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
