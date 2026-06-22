// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2018_09_07.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_Operations_Amazon_Connect_Participant_Service.html">Participant
/// Service actions</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_Types_Amazon_Connect_Participant_Service.html">Participant
/// Service data types</a>
/// </li>
/// </ul>
/// Connect Customer is an easy-to-use omnichannel cloud contact center service
/// that enables companies of any size to deliver superior customer service at a
/// lower cost. Connect Customer communications capabilities make it easy for
/// companies to deliver personalized interactions across communication
/// channels, including chat.
///
/// Use the Connect Customer Participant Service to manage participants (for
/// example, agents, customers, and managers listening in), and to send messages
/// and events within a chat contact. The APIs in the service enable the
/// following: sending chat messages, attachment sharing, managing a
/// participant's connection state and message events, and retrieving chat
/// transcripts.
class ConnectParticipant {
  final _s.RestJsonProtocol _protocol;
  factory ConnectParticipant({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'participant.connect',
      signingName: 'execute-api',
    );
    return ConnectParticipant._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  ConnectParticipant._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Cancels the authentication session. The opted out branch of the
  /// Authenticate Customer flow block will be taken.
  /// <note>
  /// The current supported channel is chat. This API is not supported for Apple
  /// Messages for Business, WhatsApp, or SMS chats.
  /// </note> <note>
  /// <code>ConnectionToken</code> is used for invoking this API instead of
  /// <code>ParticipantToken</code>.
  /// </note>
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
  /// Parameter [sessionId] :
  /// The <code>sessionId</code> provided in the
  /// <code>authenticationInitiated</code> event.
  Future<void> cancelParticipantAuthentication({
    required String connectionToken,
    required String sessionId,
  }) async {
    final headers = <String, String>{
      'X-Amz-Bearer': connectionToken.toString(),
    };
    final $payload = <String, dynamic>{
      'SessionId': sessionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/participant/cancel-authentication',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Allows you to confirm that the attachment has been uploaded using the
  /// pre-signed URL provided in StartAttachmentUpload API. A conflict exception
  /// is thrown when an attachment with that identifier is already being
  /// uploaded.
  ///
  /// For security recommendations, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/security-best-practices.html#bp-security-chat">Connect
  /// Customer Chat security best practices</a>.
  /// <note>
  /// <code>ConnectionToken</code> is used for invoking this API instead of
  /// <code>ParticipantToken</code>.
  /// </note>
  /// The Amazon Connect Participant Service APIs do not use <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4 authentication</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [attachmentIds] :
  /// A list of unique identifiers for the attachments.
  ///
  /// Parameter [connectionToken] :
  /// The authentication token associated with the participant's connection.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  Future<void> completeAttachmentUpload({
    required List<String> attachmentIds,
    required String connectionToken,
    String? clientToken,
  }) async {
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

  /// Creates the participant's connection.
  ///
  /// For security recommendations, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/security-best-practices.html#bp-security-chat">Connect
  /// Customer Chat security best practices</a>.
  ///
  /// For WebRTC security recommendations, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/security-best-practices.html#bp-webrtc-security">Connect
  /// Customer WebRTC security best practices</a>.
  /// <note>
  /// <code>ParticipantToken</code> is used for invoking this API instead of
  /// <code>ConnectionToken</code>.
  /// </note>
  /// The participant token is valid for the lifetime of the participant – until
  /// they are part of a contact. For WebRTC participants, if they leave or are
  /// disconnected for 60 seconds, a new participant needs to be created using
  /// the <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_CreateParticipant.html">CreateParticipant</a>
  /// API.
  ///
  /// <b>For <code>WEBSOCKET</code> Type</b>:
  ///
  /// The response URL for has a connect expiry timeout of 100s. Clients must
  /// manually connect to the returned websocket URL and subscribe to the
  /// desired topic.
  ///
  /// For chat, you need to publish the following on the established websocket
  /// connection:
  ///
  /// <code>{"topic":"aws/subscribe","content":{"topics":\["aws/chat"\]}}</code>
  ///
  /// Upon websocket URL expiry, as specified in the response ConnectionExpiry
  /// parameter, clients need to call this API again to obtain a new websocket
  /// URL and perform the same steps as before.
  ///
  /// The expiry time for the connection token is different than the
  /// <code>ChatDurationInMinutes</code>. Expiry time for the connection token
  /// is 1 day.
  ///
  /// <b>For <code>WEBRTC_CONNECTION</code> Type</b>:
  ///
  /// The response includes connection data required for the client application
  /// to join the call using the Amazon Chime SDK client libraries. The
  /// WebRTCConnection response contains Meeting and Attendee information needed
  /// to establish the media connection.
  ///
  /// The attendee join token in WebRTCConnection response is valid for the
  /// lifetime of the participant in the call. If a participant leaves or is
  /// disconnected for 60 seconds, their participant credentials will no longer
  /// be valid, and a new participant will need to be created to rejoin the
  /// call.
  ///
  /// <b>Message streaming support</b>: This API can also be used together with
  /// the <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_StartContactStreaming.html">StartContactStreaming</a>
  /// API to create a participant connection for chat contacts that are not
  /// using a websocket. For more information about message streaming, <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/chat-message-streaming.html">Enable
  /// real-time chat message streaming</a> in the <i>Amazon Connect
  /// Administrator Guide</i>.
  ///
  /// <b>Multi-user web, in-app, video calling support</b>:
  ///
  /// For WebRTC calls, this API is used in conjunction with the
  /// CreateParticipant API to enable multi-party calling. The
  /// StartWebRTCContact API creates the initial contact and routes it to an
  /// agent, while CreateParticipant adds additional participants to the ongoing
  /// call. For more information about multi-party WebRTC calls, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/enable-multiuser-inapp.html">Enable
  /// multi-user web, in-app, and video calling</a> in the <i>Amazon Connect
  /// Administrator Guide</i>.
  ///
  /// <b>Feature specifications</b>: For information about feature
  /// specifications, such as the allowed number of open websocket connections
  /// per participant or maximum number of WebRTC participants, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#feature-limits">Feature
  /// specifications</a> in the <i>Amazon Connect Administrator Guide</i>.
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
  /// The ParticipantToken as obtained from <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_StartChatContact.html">StartChatContact</a>
  /// API response.
  ///
  /// Parameter [connectParticipant] :
  /// Amazon Connect Participant is used to mark the participant as connected
  /// for customer participant in message streaming, as well as for agent or
  /// manager participant in non-streaming chats.
  ///
  /// Parameter [type] :
  /// Type of connection information required. If you need
  /// <code>CONNECTION_CREDENTIALS</code> along with marking participant as
  /// connected, pass <code>CONNECTION_CREDENTIALS</code> in <code>Type</code>.
  Future<CreateParticipantConnectionResponse> createParticipantConnection({
    required String participantToken,
    bool? connectParticipant,
    List<ConnectionType>? type,
  }) async {
    final headers = <String, String>{
      'X-Amz-Bearer': participantToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (connectParticipant != null) 'ConnectParticipant': connectParticipant,
      if (type != null) 'Type': type.map((e) => e.value).toList(),
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

  /// Retrieves the view for the specified view token.
  ///
  /// For security recommendations, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/security-best-practices.html#bp-security-chat">Connect
  /// Customer Chat security best practices</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [connectionToken] :
  /// The connection token.
  ///
  /// Parameter [viewToken] :
  /// An encrypted token originating from the interactive message of a ShowView
  /// block operation. Represents the desired view.
  Future<DescribeViewResponse> describeView({
    required String connectionToken,
    required String viewToken,
  }) async {
    final headers = <String, String>{
      'X-Amz-Bearer': connectionToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/participant/views/${Uri.encodeComponent(viewToken)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeViewResponse.fromJson(response);
  }

  /// Disconnects a participant.
  ///
  /// For security recommendations, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/security-best-practices.html#bp-security-chat">Connect
  /// Customer Chat security best practices</a>.
  /// <note>
  /// <code>ConnectionToken</code> is used for invoking this API instead of
  /// <code>ParticipantToken</code>.
  /// </note>
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
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  Future<void> disconnectParticipant({
    required String connectionToken,
    String? clientToken,
  }) async {
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
  /// For security recommendations, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/security-best-practices.html#bp-security-chat">Connect
  /// Customer Chat security best practices</a>.
  /// <note>
  /// <ul>
  /// <li>
  /// The participant role <code>CUSTOM_BOT</code> is not permitted to access
  /// attachments customers may upload. An <code>AccessDeniedException</code>
  /// can indicate that the participant may be a CUSTOM_BOT, and it doesn't have
  /// access to attachments.
  /// </li>
  /// <li>
  /// <code>ConnectionToken</code> is used for invoking this API instead of
  /// <code>ParticipantToken</code>.
  /// </li>
  /// </ul> </note>
  /// The Amazon Connect Participant Service APIs do not use <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4 authentication</a>.
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
  ///
  /// Parameter [urlExpiryInSeconds] :
  /// The expiration time of the URL in ISO timestamp. It's specified in ISO
  /// 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example,
  /// 2019-11-08T02:41:28.172Z.
  Future<GetAttachmentResponse> getAttachment({
    required String attachmentId,
    required String connectionToken,
    int? urlExpiryInSeconds,
  }) async {
    _s.validateNumRange(
      'urlExpiryInSeconds',
      urlExpiryInSeconds,
      5,
      300,
    );
    final headers = <String, String>{
      'X-Amz-Bearer': connectionToken.toString(),
    };
    final $payload = <String, dynamic>{
      'AttachmentId': attachmentId,
      if (urlExpiryInSeconds != null) 'UrlExpiryInSeconds': urlExpiryInSeconds,
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

  /// Retrieves the AuthenticationUrl for the current authentication session for
  /// the AuthenticateCustomer flow block.
  ///
  /// For security recommendations, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/security-best-practices.html#bp-security-chat">Connect
  /// Customer Chat security best practices</a>.
  /// <note>
  /// <ul>
  /// <li>
  /// This API can only be called within one minute of receiving the
  /// authenticationInitiated event.
  /// </li>
  /// <li>
  /// The current supported channel is chat. This API is not supported for Apple
  /// Messages for Business, WhatsApp, or SMS chats.
  /// </li>
  /// </ul> </note> <note>
  /// <code>ConnectionToken</code> is used for invoking this API instead of
  /// <code>ParticipantToken</code>.
  /// </note>
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
  /// Parameter [redirectUri] :
  /// The URL where the customer will be redirected after Amazon Cognito
  /// authorizes the user.
  ///
  /// Parameter [sessionId] :
  /// The sessionId provided in the authenticationInitiated event.
  Future<GetAuthenticationUrlResponse> getAuthenticationUrl({
    required String connectionToken,
    required String redirectUri,
    required String sessionId,
  }) async {
    final headers = <String, String>{
      'X-Amz-Bearer': connectionToken.toString(),
    };
    final $payload = <String, dynamic>{
      'RedirectUri': redirectUri,
      'SessionId': sessionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/participant/authentication-url',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetAuthenticationUrlResponse.fromJson(response);
  }

  /// Retrieves a transcript of the session, including details about any
  /// attachments. For information about accessing past chat contact transcripts
  /// for a persistent chat, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/chat-persistence.html">Enable
  /// persistent chat</a>.
  ///
  /// For security recommendations, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/security-best-practices.html#bp-security-chat">Connect
  /// Customer Chat security best practices</a>.
  ///
  /// If you have a process that consumes events in the transcript of an chat
  /// that has ended, note that chat transcripts contain the following event
  /// content types if the event has occurred during the chat session:
  ///
  /// <ul>
  /// <li>
  /// <code>application/vnd.amazonaws.connect.event.participant.invited</code>
  /// </li>
  /// <li>
  /// <code>application/vnd.amazonaws.connect.event.participant.joined</code>
  /// </li>
  /// <li>
  /// <code>application/vnd.amazonaws.connect.event.participant.left</code>
  /// </li>
  /// <li>
  /// <code>application/vnd.amazonaws.connect.event.chat.ended</code>
  /// </li>
  /// <li>
  /// <code>application/vnd.amazonaws.connect.event.transfer.succeeded</code>
  /// </li>
  /// <li>
  /// <code>application/vnd.amazonaws.connect.event.transfer.failed</code>
  /// </li>
  /// </ul> <note>
  /// <code>ConnectionToken</code> is used for invoking this API instead of
  /// <code>ParticipantToken</code>.
  /// </note>
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final headers = <String, String>{
      'X-Amz-Bearer': connectionToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (contactId != null) 'ContactId': contactId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (scanDirection != null) 'ScanDirection': scanDirection.value,
      if (sortOrder != null) 'SortOrder': sortOrder.value,
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

  /// <note>
  /// The
  /// <code>application/vnd.amazonaws.connect.event.connection.acknowledged</code>
  /// ContentType is no longer maintained since December 31, 2024. This event
  /// has been migrated to the <a
  /// href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a>
  /// API using the <code>ConnectParticipant</code> field.
  /// </note>
  /// Sends an event. Message receipts are not supported when there are more
  /// than two active participants in the chat. Using the SendEvent API for
  /// message receipts when a supervisor is barged-in will result in a conflict
  /// exception.
  ///
  /// For security recommendations, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/security-best-practices.html#bp-security-chat">Connect
  /// Customer Chat security best practices</a>.
  /// <note>
  /// <code>ConnectionToken</code> is used for invoking this API instead of
  /// <code>ParticipantToken</code>.
  /// </note>
  /// The Amazon Connect Participant Service APIs do not use <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4 authentication</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
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
  /// application/vnd.amazonaws.connect.event.connection.acknowledged (is no
  /// longer maintained since December 31, 2024)
  /// </li>
  /// <li>
  /// application/vnd.amazonaws.connect.event.message.delivered
  /// </li>
  /// <li>
  /// application/vnd.amazonaws.connect.event.message.read
  /// </li>
  /// </ul>
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  ///
  /// Parameter [content] :
  /// The content of the event to be sent (for example, message text). For
  /// content related to message receipts, this is supported in the form of a
  /// JSON string.
  ///
  /// Sample Content: "{\"messageId\":\"11111111-aaaa-bbbb-cccc-EXAMPLE01234\"}"
  Future<SendEventResponse> sendEvent({
    required String connectionToken,
    required String contentType,
    String? clientToken,
    String? content,
  }) async {
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

  /// Sends a message.
  ///
  /// For security recommendations, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/security-best-practices.html#bp-security-chat">Connect
  /// Customer Chat security best practices</a>.
  /// <note>
  /// <code>ConnectionToken</code> is used for invoking this API instead of
  /// <code>ParticipantToken</code>.
  /// </note>
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
  /// The authentication token associated with the connection.
  ///
  /// Parameter [content] :
  /// The content of the message.
  ///
  /// <ul>
  /// <li>
  /// For <code>text/plain</code> and <code>text/markdown</code>, the Length
  /// Constraints are Minimum of 1, Maximum of 1024.
  /// </li>
  /// <li>
  /// For <code>application/json</code>, the Length Constraints are Minimum of
  /// 1, Maximum of 12000.
  /// </li>
  /// <li>
  /// For
  /// <code>application/vnd.amazonaws.connect.message.interactive.response</code>,
  /// the Length Constraints are Minimum of 1, Maximum of 12288.
  /// </li>
  /// </ul>
  ///
  /// Parameter [contentType] :
  /// The type of the content. Possible types are <code>text/plain</code>,
  /// <code>text/markdown</code>, <code>application/json</code>, and
  /// <code>application/vnd.amazonaws.connect.message.interactive.response</code>.
  ///
  /// Supported types on the contact are configured through
  /// <code>SupportedMessagingContentTypes</code> on <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_StartChatContact.html">StartChatContact</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_StartOutboundChatContact.html">StartOutboundChatContact</a>.
  ///
  /// For Apple Messages for Business, SMS, and WhatsApp Business Messaging
  /// contacts, only <code>text/plain</code> is supported.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  Future<SendMessageResponse> sendMessage({
    required String connectionToken,
    required String content,
    required String contentType,
    String? clientToken,
  }) async {
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
  /// For security recommendations, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/security-best-practices.html#bp-security-chat">Connect
  /// Customer Chat security best practices</a>.
  /// <note>
  /// <code>ConnectionToken</code> is used for invoking this API instead of
  /// <code>ParticipantToken</code>.
  /// </note>
  /// The Amazon Connect Participant Service APIs do not use <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4 authentication</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/feature-limits.html">Feature
  /// specifications</a> in the <i>Amazon Connect Administrator Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services SDK
  /// populates this field. For more information about idempotency, see <a
  /// href="https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/">Making
  /// retries safe with idempotent APIs</a>.
  Future<StartAttachmentUploadResponse> startAttachmentUpload({
    required String attachmentName,
    required int attachmentSizeInBytes,
    required String connectionToken,
    required String contentType,
    String? clientToken,
  }) async {
    _s.validateNumRange(
      'attachmentSizeInBytes',
      attachmentSizeInBytes,
      1,
      1152921504606846976,
      isRequired: true,
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

/// @nodoc
class CancelParticipantAuthenticationResponse {
  CancelParticipantAuthenticationResponse();

  factory CancelParticipantAuthenticationResponse.fromJson(
      Map<String, dynamic> _) {
    return CancelParticipantAuthenticationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CompleteAttachmentUploadResponse {
  CompleteAttachmentUploadResponse();

  factory CompleteAttachmentUploadResponse.fromJson(Map<String, dynamic> _) {
    return CompleteAttachmentUploadResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateParticipantConnectionResponse {
  /// Creates the participant's connection credentials. The authentication token
  /// associated with the participant's connection.
  final ConnectionCredentials? connectionCredentials;

  /// Creates the participant's WebRTC connection data required for the client
  /// application (mobile application or website) to connect to the call.
  final WebRTCConnection? webRTCConnection;

  /// Creates the participant's websocket connection.
  final Websocket? websocket;

  CreateParticipantConnectionResponse({
    this.connectionCredentials,
    this.webRTCConnection,
    this.websocket,
  });

  factory CreateParticipantConnectionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateParticipantConnectionResponse(
      connectionCredentials: json['ConnectionCredentials'] != null
          ? ConnectionCredentials.fromJson(
              json['ConnectionCredentials'] as Map<String, dynamic>)
          : null,
      webRTCConnection: json['WebRTCConnection'] != null
          ? WebRTCConnection.fromJson(
              json['WebRTCConnection'] as Map<String, dynamic>)
          : null,
      websocket: json['Websocket'] != null
          ? Websocket.fromJson(json['Websocket'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionCredentials = this.connectionCredentials;
    final webRTCConnection = this.webRTCConnection;
    final websocket = this.websocket;
    return {
      if (connectionCredentials != null)
        'ConnectionCredentials': connectionCredentials,
      if (webRTCConnection != null) 'WebRTCConnection': webRTCConnection,
      if (websocket != null) 'Websocket': websocket,
    };
  }
}

/// @nodoc
class DescribeViewResponse {
  /// A view resource object. Contains metadata and content necessary to render
  /// the view.
  final View? view;

  DescribeViewResponse({
    this.view,
  });

  factory DescribeViewResponse.fromJson(Map<String, dynamic> json) {
    return DescribeViewResponse(
      view: json['View'] != null
          ? View.fromJson(json['View'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final view = this.view;
    return {
      if (view != null) 'View': view,
    };
  }
}

/// @nodoc
class DisconnectParticipantResponse {
  DisconnectParticipantResponse();

  factory DisconnectParticipantResponse.fromJson(Map<String, dynamic> _) {
    return DisconnectParticipantResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetAttachmentResponse {
  /// The size of the attachment in bytes.
  final int attachmentSizeInBytes;

  /// This is the pre-signed URL that can be used for uploading the file to Amazon
  /// S3 when used in response to <a
  /// href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_StartAttachmentUpload.html">StartAttachmentUpload</a>.
  final String? url;

  /// The expiration time of the URL in ISO timestamp. It's specified in ISO 8601
  /// format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.
  final String? urlExpiry;

  GetAttachmentResponse({
    required this.attachmentSizeInBytes,
    this.url,
    this.urlExpiry,
  });

  factory GetAttachmentResponse.fromJson(Map<String, dynamic> json) {
    return GetAttachmentResponse(
      attachmentSizeInBytes: (json['AttachmentSizeInBytes'] as int?) ?? 0,
      url: json['Url'] as String?,
      urlExpiry: json['UrlExpiry'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentSizeInBytes = this.attachmentSizeInBytes;
    final url = this.url;
    final urlExpiry = this.urlExpiry;
    return {
      'AttachmentSizeInBytes': attachmentSizeInBytes,
      if (url != null) 'Url': url,
      if (urlExpiry != null) 'UrlExpiry': urlExpiry,
    };
  }
}

/// @nodoc
class GetAuthenticationUrlResponse {
  /// The URL where the customer will sign in to the identity provider. This URL
  /// contains the authorize endpoint for the Cognito UserPool used in the
  /// authentication.
  final String? authenticationUrl;

  GetAuthenticationUrlResponse({
    this.authenticationUrl,
  });

  factory GetAuthenticationUrlResponse.fromJson(Map<String, dynamic> json) {
    return GetAuthenticationUrlResponse(
      authenticationUrl: json['AuthenticationUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationUrl = this.authenticationUrl;
    return {
      if (authenticationUrl != null) 'AuthenticationUrl': authenticationUrl,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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

/// @nodoc
class SendMessageResponse {
  /// The time when the message was sent.
  ///
  /// It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example,
  /// 2019-11-08T02:41:28.172Z.
  final String? absoluteTime;

  /// The ID of the message.
  final String? id;

  /// Contains metadata for the message.
  final MessageProcessingMetadata? messageMetadata;

  SendMessageResponse({
    this.absoluteTime,
    this.id,
    this.messageMetadata,
  });

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) {
    return SendMessageResponse(
      absoluteTime: json['AbsoluteTime'] as String?,
      id: json['Id'] as String?,
      messageMetadata: json['MessageMetadata'] != null
          ? MessageProcessingMetadata.fromJson(
              json['MessageMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final absoluteTime = this.absoluteTime;
    final id = this.id;
    final messageMetadata = this.messageMetadata;
    return {
      if (absoluteTime != null) 'AbsoluteTime': absoluteTime,
      if (id != null) 'Id': id,
      if (messageMetadata != null) 'MessageMetadata': messageMetadata,
    };
  }
}

/// @nodoc
class StartAttachmentUploadResponse {
  /// A unique identifier for the attachment.
  final String? attachmentId;

  /// The headers to be provided while uploading the file to the URL.
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

/// Fields to be used while uploading the attachment.
///
/// @nodoc
class UploadMetadata {
  /// The headers to be provided while uploading the file to the URL.
  final Map<String, String>? headersToInclude;

  /// This is the pre-signed URL that can be used for uploading the file to Amazon
  /// S3 when used in response to <a
  /// href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_StartAttachmentUpload.html">StartAttachmentUpload</a>.
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

/// Contains metadata for chat messages.
///
/// @nodoc
class MessageProcessingMetadata {
  /// The status of Message Processing for the message.
  final MessageProcessingStatus? messageProcessingStatus;

  MessageProcessingMetadata({
    this.messageProcessingStatus,
  });

  factory MessageProcessingMetadata.fromJson(Map<String, dynamic> json) {
    return MessageProcessingMetadata(
      messageProcessingStatus: (json['MessageProcessingStatus'] as String?)
          ?.let(MessageProcessingStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final messageProcessingStatus = this.messageProcessingStatus;
    return {
      if (messageProcessingStatus != null)
        'MessageProcessingStatus': messageProcessingStatus.value,
    };
  }
}

/// @nodoc
class MessageProcessingStatus {
  static const processing = MessageProcessingStatus._('PROCESSING');
  static const failed = MessageProcessingStatus._('FAILED');
  static const rejected = MessageProcessingStatus._('REJECTED');

  final String value;

  const MessageProcessingStatus._(this.value);

  static const values = [processing, failed, rejected];

  static MessageProcessingStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MessageProcessingStatus._(value));

  @override
  bool operator ==(other) =>
      other is MessageProcessingStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An item - message or event - that has been sent.
///
/// @nodoc
class Item {
  /// The time when the message or event was sent.
  ///
  /// It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example,
  /// 2019-11-08T02:41:28.172Z.
  final String? absoluteTime;

  /// Provides information about the attachments.
  final List<AttachmentItem>? attachments;

  /// The contactId on which the transcript item was originally sent. This field
  /// is populated only when the transcript item is from the current chat session.
  final String? contactId;

  /// The content of the message or event.
  final String? content;

  /// The type of content of the item.
  final String? contentType;

  /// The chat display name of the sender.
  final String? displayName;

  /// The ID of the item.
  final String? id;

  /// The metadata related to the message. Currently this supports only
  /// information related to message receipts.
  final MessageMetadata? messageMetadata;

  /// The ID of the sender in the session.
  final String? participantId;

  /// The role of the sender. For example, is it a customer, agent, or system.
  final ParticipantRole? participantRole;

  /// The contactId on which the transcript item was originally sent. This field
  /// is only populated for persistent chats when the transcript item is from the
  /// past chat session. For more information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/chat-persistence.html">Enable
  /// persistent chat</a>.
  final String? relatedContactId;

  /// Type of the item: message or event.
  final ChatItemType? type;

  Item({
    this.absoluteTime,
    this.attachments,
    this.contactId,
    this.content,
    this.contentType,
    this.displayName,
    this.id,
    this.messageMetadata,
    this.participantId,
    this.participantRole,
    this.relatedContactId,
    this.type,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      absoluteTime: json['AbsoluteTime'] as String?,
      attachments: (json['Attachments'] as List?)
          ?.nonNulls
          .map((e) => AttachmentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      contactId: json['ContactId'] as String?,
      content: json['Content'] as String?,
      contentType: json['ContentType'] as String?,
      displayName: json['DisplayName'] as String?,
      id: json['Id'] as String?,
      messageMetadata: json['MessageMetadata'] != null
          ? MessageMetadata.fromJson(
              json['MessageMetadata'] as Map<String, dynamic>)
          : null,
      participantId: json['ParticipantId'] as String?,
      participantRole:
          (json['ParticipantRole'] as String?)?.let(ParticipantRole.fromString),
      relatedContactId: json['RelatedContactId'] as String?,
      type: (json['Type'] as String?)?.let(ChatItemType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final absoluteTime = this.absoluteTime;
    final attachments = this.attachments;
    final contactId = this.contactId;
    final content = this.content;
    final contentType = this.contentType;
    final displayName = this.displayName;
    final id = this.id;
    final messageMetadata = this.messageMetadata;
    final participantId = this.participantId;
    final participantRole = this.participantRole;
    final relatedContactId = this.relatedContactId;
    final type = this.type;
    return {
      if (absoluteTime != null) 'AbsoluteTime': absoluteTime,
      if (attachments != null) 'Attachments': attachments,
      if (contactId != null) 'ContactId': contactId,
      if (content != null) 'Content': content,
      if (contentType != null) 'ContentType': contentType,
      if (displayName != null) 'DisplayName': displayName,
      if (id != null) 'Id': id,
      if (messageMetadata != null) 'MessageMetadata': messageMetadata,
      if (participantId != null) 'ParticipantId': participantId,
      if (participantRole != null) 'ParticipantRole': participantRole.value,
      if (relatedContactId != null) 'RelatedContactId': relatedContactId,
      if (type != null) 'Type': type.value,
    };
  }
}

/// @nodoc
class ChatItemType {
  static const typing = ChatItemType._('TYPING');
  static const participantJoined = ChatItemType._('PARTICIPANT_JOINED');
  static const participantLeft = ChatItemType._('PARTICIPANT_LEFT');
  static const chatEnded = ChatItemType._('CHAT_ENDED');
  static const transferSucceeded = ChatItemType._('TRANSFER_SUCCEEDED');
  static const transferFailed = ChatItemType._('TRANSFER_FAILED');
  static const message = ChatItemType._('MESSAGE');
  static const event = ChatItemType._('EVENT');
  static const attachment = ChatItemType._('ATTACHMENT');
  static const connectionAck = ChatItemType._('CONNECTION_ACK');
  static const messageDelivered = ChatItemType._('MESSAGE_DELIVERED');
  static const messageRead = ChatItemType._('MESSAGE_READ');

  final String value;

  const ChatItemType._(this.value);

  static const values = [
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
    messageDelivered,
    messageRead
  ];

  static ChatItemType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ChatItemType._(value));

  @override
  bool operator ==(other) => other is ChatItemType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ParticipantRole {
  static const agent = ParticipantRole._('AGENT');
  static const customer = ParticipantRole._('CUSTOMER');
  static const system = ParticipantRole._('SYSTEM');
  static const customBot = ParticipantRole._('CUSTOM_BOT');
  static const supervisor = ParticipantRole._('SUPERVISOR');

  final String value;

  const ParticipantRole._(this.value);

  static const values = [agent, customer, system, customBot, supervisor];

  static ParticipantRole fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ParticipantRole._(value));

  @override
  bool operator ==(other) => other is ParticipantRole && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains metadata related to a message.
///
/// @nodoc
class MessageMetadata {
  /// The identifier of the message that contains the metadata information.
  final String? messageId;

  /// The status of Message Processing for the message.
  final MessageProcessingStatus? messageProcessingStatus;

  /// The list of receipt information for a message for different recipients.
  final List<Receipt>? receipts;

  MessageMetadata({
    this.messageId,
    this.messageProcessingStatus,
    this.receipts,
  });

  factory MessageMetadata.fromJson(Map<String, dynamic> json) {
    return MessageMetadata(
      messageId: json['MessageId'] as String?,
      messageProcessingStatus: (json['MessageProcessingStatus'] as String?)
          ?.let(MessageProcessingStatus.fromString),
      receipts: (json['Receipts'] as List?)
          ?.nonNulls
          .map((e) => Receipt.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final messageId = this.messageId;
    final messageProcessingStatus = this.messageProcessingStatus;
    final receipts = this.receipts;
    return {
      if (messageId != null) 'MessageId': messageId,
      if (messageProcessingStatus != null)
        'MessageProcessingStatus': messageProcessingStatus.value,
      if (receipts != null) 'Receipts': receipts,
    };
  }
}

/// The receipt for the message delivered to the recipient.
///
/// @nodoc
class Receipt {
  /// The time when the message was delivered to the recipient.
  final String? deliveredTimestamp;

  /// The time when the message was read by the recipient.
  final String? readTimestamp;

  /// The identifier of the recipient of the message.
  final String? recipientParticipantId;

  Receipt({
    this.deliveredTimestamp,
    this.readTimestamp,
    this.recipientParticipantId,
  });

  factory Receipt.fromJson(Map<String, dynamic> json) {
    return Receipt(
      deliveredTimestamp: json['DeliveredTimestamp'] as String?,
      readTimestamp: json['ReadTimestamp'] as String?,
      recipientParticipantId: json['RecipientParticipantId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveredTimestamp = this.deliveredTimestamp;
    final readTimestamp = this.readTimestamp;
    final recipientParticipantId = this.recipientParticipantId;
    return {
      if (deliveredTimestamp != null) 'DeliveredTimestamp': deliveredTimestamp,
      if (readTimestamp != null) 'ReadTimestamp': readTimestamp,
      if (recipientParticipantId != null)
        'RecipientParticipantId': recipientParticipantId,
    };
  }
}

/// The case-insensitive input to indicate standard MIME type that describes the
/// format of the file that will be uploaded.
///
/// @nodoc
class AttachmentItem {
  /// A unique identifier for the attachment.
  final String? attachmentId;

  /// A case-sensitive name of the attachment being uploaded.
  final String? attachmentName;

  /// Describes the MIME file type of the attachment. For a list of supported file
  /// types, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/feature-limits.html">Feature
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
      status: (json['Status'] as String?)?.let(ArtifactStatus.fromString),
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
      if (status != null) 'Status': status.value,
    };
  }
}

/// @nodoc
class ArtifactStatus {
  static const approved = ArtifactStatus._('APPROVED');
  static const rejected = ArtifactStatus._('REJECTED');
  static const inProgress = ArtifactStatus._('IN_PROGRESS');

  final String value;

  const ArtifactStatus._(this.value);

  static const values = [approved, rejected, inProgress];

  static ArtifactStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ArtifactStatus._(value));

  @override
  bool operator ==(other) => other is ArtifactStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ScanDirection {
  static const forward = ScanDirection._('FORWARD');
  static const backward = ScanDirection._('BACKWARD');

  final String value;

  const ScanDirection._(this.value);

  static const values = [forward, backward];

  static ScanDirection fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScanDirection._(value));

  @override
  bool operator ==(other) => other is ScanDirection && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SortKey {
  static const descending = SortKey._('DESCENDING');
  static const ascending = SortKey._('ASCENDING');

  final String value;

  const SortKey._(this.value);

  static const values = [descending, ascending];

  static SortKey fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SortKey._(value));

  @override
  bool operator ==(other) => other is SortKey && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A filtering option for where to start. For example, if you sent 100
/// messages, start with message 50.
///
/// @nodoc
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

/// A view resource object. Contains metadata and content necessary to render
/// the view.
///
/// @nodoc
class View {
  /// The Amazon Resource Name (ARN) of the view.
  final String? arn;

  /// View content containing all content necessary to render a view except for
  /// runtime input data.
  final ViewContent? content;

  /// The identifier of the view.
  final String? id;

  /// The name of the view.
  final String? name;

  /// The current version of the view.
  final int? version;

  View({
    this.arn,
    this.content,
    this.id,
    this.name,
    this.version,
  });

  factory View.fromJson(Map<String, dynamic> json) {
    return View(
      arn: json['Arn'] as String?,
      content: json['Content'] != null
          ? ViewContent.fromJson(json['Content'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final content = this.content;
    final id = this.id;
    final name = this.name;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (content != null) 'Content': content,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (version != null) 'Version': version,
    };
  }
}

/// View content containing all content necessary to render a view except for
/// runtime input data.
///
/// @nodoc
class ViewContent {
  /// A list of actions possible from the view
  final List<String>? actions;

  /// The schema representing the input data that the view template must be
  /// supplied to render.
  final String? inputSchema;

  /// The view template representing the structure of the view.
  final String? template;

  ViewContent({
    this.actions,
    this.inputSchema,
    this.template,
  });

  factory ViewContent.fromJson(Map<String, dynamic> json) {
    return ViewContent(
      actions:
          (json['Actions'] as List?)?.nonNulls.map((e) => e as String).toList(),
      inputSchema: json['InputSchema'] as String?,
      template: json['Template'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final inputSchema = this.inputSchema;
    final template = this.template;
    return {
      if (actions != null) 'Actions': actions,
      if (inputSchema != null) 'InputSchema': inputSchema,
      if (template != null) 'Template': template,
    };
  }
}

/// The websocket for the participant's connection.
///
/// @nodoc
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

/// Connection credentials.
///
/// @nodoc
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

/// Creates the participant’s WebRTC connection data required for the client
/// application (mobile or web) to connect to the call.
///
/// @nodoc
class WebRTCConnection {
  final Attendee? attendee;

  /// A meeting created using the Amazon Chime SDK.
  final WebRTCMeeting? meeting;

  WebRTCConnection({
    this.attendee,
    this.meeting,
  });

  factory WebRTCConnection.fromJson(Map<String, dynamic> json) {
    return WebRTCConnection(
      attendee: json['Attendee'] != null
          ? Attendee.fromJson(json['Attendee'] as Map<String, dynamic>)
          : null,
      meeting: json['Meeting'] != null
          ? WebRTCMeeting.fromJson(json['Meeting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attendee = this.attendee;
    final meeting = this.meeting;
    return {
      if (attendee != null) 'Attendee': attendee,
      if (meeting != null) 'Meeting': meeting,
    };
  }
}

/// The attendee information, including attendee ID and join token.
///
/// @nodoc
class Attendee {
  /// The Amazon Chime SDK attendee ID.
  final String? attendeeId;

  /// The join token used by the Amazon Chime SDK attendee.
  final String? joinToken;

  Attendee({
    this.attendeeId,
    this.joinToken,
  });

  factory Attendee.fromJson(Map<String, dynamic> json) {
    return Attendee(
      attendeeId: json['AttendeeId'] as String?,
      joinToken: json['JoinToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attendeeId = this.attendeeId;
    final joinToken = this.joinToken;
    return {
      if (attendeeId != null) 'AttendeeId': attendeeId,
      if (joinToken != null) 'JoinToken': joinToken,
    };
  }
}

/// A meeting created using the Amazon Chime SDK.
///
/// @nodoc
class WebRTCMeeting {
  /// The media placement for the meeting.
  final WebRTCMediaPlacement? mediaPlacement;
  final MeetingFeaturesConfiguration? meetingFeatures;

  /// The Amazon Chime SDK meeting ID.
  final String? meetingId;

  WebRTCMeeting({
    this.mediaPlacement,
    this.meetingFeatures,
    this.meetingId,
  });

  factory WebRTCMeeting.fromJson(Map<String, dynamic> json) {
    return WebRTCMeeting(
      mediaPlacement: json['MediaPlacement'] != null
          ? WebRTCMediaPlacement.fromJson(
              json['MediaPlacement'] as Map<String, dynamic>)
          : null,
      meetingFeatures: json['MeetingFeatures'] != null
          ? MeetingFeaturesConfiguration.fromJson(
              json['MeetingFeatures'] as Map<String, dynamic>)
          : null,
      meetingId: json['MeetingId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaPlacement = this.mediaPlacement;
    final meetingFeatures = this.meetingFeatures;
    final meetingId = this.meetingId;
    return {
      if (mediaPlacement != null) 'MediaPlacement': mediaPlacement,
      if (meetingFeatures != null) 'MeetingFeatures': meetingFeatures,
      if (meetingId != null) 'MeetingId': meetingId,
    };
  }
}

/// A set of endpoints used by clients to connect to the media service group for
/// an Amazon Chime SDK meeting.
///
/// @nodoc
class WebRTCMediaPlacement {
  /// The audio fallback URL.
  final String? audioFallbackUrl;

  /// The audio host URL.
  final String? audioHostUrl;

  /// The event ingestion URL to which you send client meeting events.
  final String? eventIngestionUrl;

  /// The signaling URL.
  final String? signalingUrl;

  WebRTCMediaPlacement({
    this.audioFallbackUrl,
    this.audioHostUrl,
    this.eventIngestionUrl,
    this.signalingUrl,
  });

  factory WebRTCMediaPlacement.fromJson(Map<String, dynamic> json) {
    return WebRTCMediaPlacement(
      audioFallbackUrl: json['AudioFallbackUrl'] as String?,
      audioHostUrl: json['AudioHostUrl'] as String?,
      eventIngestionUrl: json['EventIngestionUrl'] as String?,
      signalingUrl: json['SignalingUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final audioFallbackUrl = this.audioFallbackUrl;
    final audioHostUrl = this.audioHostUrl;
    final eventIngestionUrl = this.eventIngestionUrl;
    final signalingUrl = this.signalingUrl;
    return {
      if (audioFallbackUrl != null) 'AudioFallbackUrl': audioFallbackUrl,
      if (audioHostUrl != null) 'AudioHostUrl': audioHostUrl,
      if (eventIngestionUrl != null) 'EventIngestionUrl': eventIngestionUrl,
      if (signalingUrl != null) 'SignalingUrl': signalingUrl,
    };
  }
}

/// The configuration settings of the features available to a meeting.
///
/// @nodoc
class MeetingFeaturesConfiguration {
  /// The configuration settings for the audio features available to a meeting.
  final AudioFeatures? audio;

  MeetingFeaturesConfiguration({
    this.audio,
  });

  factory MeetingFeaturesConfiguration.fromJson(Map<String, dynamic> json) {
    return MeetingFeaturesConfiguration(
      audio: json['Audio'] != null
          ? AudioFeatures.fromJson(json['Audio'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audio = this.audio;
    return {
      if (audio != null) 'Audio': audio,
    };
  }
}

/// Has audio-specific configurations as the operating parameter for Echo
/// Reduction.
///
/// @nodoc
class AudioFeatures {
  /// Makes echo reduction available to clients who connect to the meeting.
  final MeetingFeatureStatus? echoReduction;

  AudioFeatures({
    this.echoReduction,
  });

  factory AudioFeatures.fromJson(Map<String, dynamic> json) {
    return AudioFeatures(
      echoReduction: (json['EchoReduction'] as String?)
          ?.let(MeetingFeatureStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final echoReduction = this.echoReduction;
    return {
      if (echoReduction != null) 'EchoReduction': echoReduction.value,
    };
  }
}

/// @nodoc
class MeetingFeatureStatus {
  static const available = MeetingFeatureStatus._('AVAILABLE');
  static const unavailable = MeetingFeatureStatus._('UNAVAILABLE');

  final String value;

  const MeetingFeatureStatus._(this.value);

  static const values = [available, unavailable];

  static MeetingFeatureStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MeetingFeatureStatus._(value));

  @override
  bool operator ==(other) =>
      other is MeetingFeatureStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ConnectionType {
  static const websocket = ConnectionType._('WEBSOCKET');
  static const connectionCredentials =
      ConnectionType._('CONNECTION_CREDENTIALS');
  static const webrtcConnection = ConnectionType._('WEBRTC_CONNECTION');

  final String value;

  const ConnectionType._(this.value);

  static const values = [websocket, connectionCredentials, webrtcConnection];

  static ConnectionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectionType._(value));

  @override
  bool operator ==(other) => other is ConnectionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
