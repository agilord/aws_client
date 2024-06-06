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

/// <b>Introduction</b>
///
/// The Amazon IVS Chat control-plane API enables you to create and manage
/// Amazon IVS Chat resources. You also need to integrate with the <a
/// href="https://docs.aws.amazon.com/ivs/latest/chatmsgapireference/chat-messaging-api.html">
/// Amazon IVS Chat Messaging API</a>, to enable users to interact with chat
/// rooms in real time.
///
/// The API is an AWS regional service. For a list of supported regions and
/// Amazon IVS Chat HTTPS service endpoints, see the Amazon IVS Chat information
/// on the <a
/// href="https://docs.aws.amazon.com/general/latest/gr/ivs.html">Amazon IVS
/// page</a> in the <i>AWS General Reference</i>.
///
/// <b>Notes on terminology:</b>
///
/// <ul>
/// <li>
/// You create service applications using the Amazon IVS Chat API. We refer to
/// these as <i>applications</i>.
/// </li>
/// <li>
/// You create front-end client applications (browser and Android/iOS apps)
/// using the Amazon IVS Chat Messaging API. We refer to these as
/// <i>clients</i>.
/// </li>
/// </ul>
/// <b>Key Concepts</b>
///
/// <ul>
/// <li>
/// <b>LoggingConfiguration</b> — A configuration that allows customers to store
/// and record sent messages in a chat room.
/// </li>
/// <li>
/// <b>Room</b> — The central Amazon IVS Chat resource through which clients
/// connect to and exchange chat messages.
/// </li>
/// </ul>
/// <b>Tagging</b>
///
/// A <i>tag</i> is a metadata label that you assign to an AWS resource. A tag
/// comprises a <i>key</i> and a <i>value</i>, both set by you. For example, you
/// might set a tag as <code>topic:nature</code> to label a particular video
/// category. See <a
/// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
/// AWS Resources</a> for more information, including restrictions that apply to
/// tags and "Tag naming limits and requirements"; Amazon IVS Chat has no
/// service-specific constraints beyond what is documented there.
///
/// Tags can help you identify and organize your AWS resources. For example, you
/// can use the same tag for different resources to indicate that they are
/// related. You can also use tags to manage access (see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Access
/// Tags</a>).
///
/// The Amazon IVS Chat API has these tag-related endpoints: <a>TagResource</a>,
/// <a>UntagResource</a>, and <a>ListTagsForResource</a>. The following resource
/// supports tagging: Room.
///
/// At most 50 tags can be applied to a resource.
///
/// <b>API Access Security</b>
///
/// Your Amazon IVS Chat applications (service applications and clients) must be
/// authenticated and authorized to access Amazon IVS Chat resources. Note the
/// differences between these concepts:
///
/// <ul>
/// <li>
/// <i>Authentication</i> is about verifying identity. Requests to the Amazon
/// IVS Chat API must be signed to verify your identity.
/// </li>
/// <li>
/// <i>Authorization</i> is about granting permissions. Your IAM roles need to
/// have permissions for Amazon IVS Chat API requests.
/// </li>
/// </ul>
/// Users (viewers) connect to a room using secure access tokens that you create
/// using the <a>CreateChatToken</a> endpoint through the AWS SDK. You call
/// CreateChatToken for every user’s chat session, passing identity and
/// authorization information about the user.
///
/// <b>Signing API Requests</b>
///
/// HTTP API requests must be signed with an AWS SigV4 signature using your AWS
/// security credentials. The AWS Command Line Interface (CLI) and the AWS SDKs
/// take care of signing the underlying API calls for you. However, if your
/// application calls the Amazon IVS Chat HTTP API directly, it’s your
/// responsibility to sign the requests.
///
/// You generate a signature using valid AWS credentials for an IAM role that
/// has permission to perform the requested action. For example, DeleteMessage
/// requests must be made using an IAM role that has the
/// <code>ivschat:DeleteMessage</code> permission.
///
/// For more information:
///
/// <ul>
/// <li>
/// Authentication and generating signatures — See <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html">Authenticating
/// Requests (Amazon Web Services Signature Version 4)</a> in the <i>Amazon Web
/// Services General Reference</i>.
/// </li>
/// <li>
/// Managing Amazon IVS permissions — See <a
/// href="https://docs.aws.amazon.com/ivs/latest/userguide/security-iam.html">Identity
/// and Access Management</a> on the Security page of the <i>Amazon IVS User
/// Guide</i>.
/// </li>
/// </ul>
/// <b>Amazon Resource Names (ARNs)</b>
///
/// ARNs uniquely identify AWS resources. An ARN is required when you need to
/// specify a resource unambiguously across all of AWS, such as in IAM policies
/// and API calls. For more information, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
/// Resource Names</a> in the <i>AWS General Reference</i>.
///
/// <b>Messaging Endpoints</b>
///
/// <ul>
/// <li>
/// <a>DeleteMessage</a> — Sends an event to a specific room which directs
/// clients to delete a specific message; that is, unrender it from view and
/// delete it from the client’s chat history. This event’s
/// <code>EventName</code> is <code>aws:DELETE_MESSAGE</code>. This replicates
/// the <a
/// href="https://docs.aws.amazon.com/ivs/latest/chatmsgapireference/actions-deletemessage-publish.html">
/// DeleteMessage</a> WebSocket operation in the Amazon IVS Chat Messaging API.
/// </li>
/// <li>
/// <a>DisconnectUser</a> — Disconnects all connections using a specified user
/// ID from a room. This replicates the <a
/// href="https://docs.aws.amazon.com/ivs/latest/chatmsgapireference/actions-disconnectuser-publish.html">
/// DisconnectUser</a> WebSocket operation in the Amazon IVS Chat Messaging API.
/// </li>
/// <li>
/// <a>SendEvent</a> — Sends an event to a room. Use this within your
/// application’s business logic to send events to clients of a room; e.g., to
/// notify clients to change the way the chat UI is rendered.
/// </li>
/// </ul>
/// <b>Chat Token Endpoint</b>
///
/// <ul>
/// <li>
/// <a>CreateChatToken</a> — Creates an encrypted token that is used by a chat
/// participant to establish an individual WebSocket chat connection to a room.
/// When the token is used to connect to chat, the connection is valid for the
/// session duration specified in the request. The token becomes invalid at the
/// token-expiration timestamp included in the response.
/// </li>
/// </ul>
/// <b>Room Endpoints</b>
///
/// <ul>
/// <li>
/// <a>CreateRoom</a> — Creates a room that allows clients to connect and pass
/// messages.
/// </li>
/// <li>
/// <a>DeleteRoom</a> — Deletes the specified room.
/// </li>
/// <li>
/// <a>GetRoom</a> — Gets the specified room.
/// </li>
/// <li>
/// <a>ListRooms</a> — Gets summary information about all your rooms in the AWS
/// region where the API request is processed.
/// </li>
/// <li>
/// <a>UpdateRoom</a> — Updates a room’s configuration.
/// </li>
/// </ul>
/// <b>Logging Configuration Endpoints</b>
///
/// <ul>
/// <li>
/// <a>CreateLoggingConfiguration</a> — Creates a logging configuration that
/// allows clients to store and record sent messages.
/// </li>
/// <li>
/// <a>DeleteLoggingConfiguration</a> — Deletes the specified logging
/// configuration.
/// </li>
/// <li>
/// <a>GetLoggingConfiguration</a> — Gets the specified logging configuration.
/// </li>
/// <li>
/// <a>ListLoggingConfigurations</a> — Gets summary information about all your
/// logging configurations in the AWS region where the API request is processed.
/// </li>
/// <li>
/// <a>UpdateLoggingConfiguration</a> — Updates a specified logging
/// configuration.
/// </li>
/// </ul>
/// <b>Tags Endpoints</b>
///
/// <ul>
/// <li>
/// <a>ListTagsForResource</a> — Gets information about AWS tags for the
/// specified ARN.
/// </li>
/// <li>
/// <a>TagResource</a> — Adds or updates tags for the AWS resource with the
/// specified ARN.
/// </li>
/// <li>
/// <a>UntagResource</a> — Removes tags from the resource with the specified
/// ARN.
/// </li>
/// </ul>
/// All the above are HTTP operations. There is a separate <i>messaging</i> API
/// for managing Chat resources; see the <a
/// href="https://docs.aws.amazon.com/ivs/latest/chatmsgapireference/chat-messaging-api.html">
/// Amazon IVS Chat Messaging API Reference</a>.
class Ivschat {
  final _s.RestJsonProtocol _protocol;
  Ivschat({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ivschat',
            signingName: 'ivschat',
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

  /// Creates an encrypted token that is used by a chat participant to establish
  /// an individual WebSocket chat connection to a room. When the token is used
  /// to connect to chat, the connection is valid for the session duration
  /// specified in the request. The token becomes invalid at the
  /// token-expiration timestamp included in the response.
  ///
  /// Use the <code>capabilities</code> field to permit an end user to send
  /// messages or moderate a room.
  ///
  /// The <code>attributes</code> field securely attaches structured data to the
  /// chat session; the data is included within each message sent by the end
  /// user and received by other participants in the room. Common use cases for
  /// attributes include passing end-user profile data like an icon, display
  /// name, colors, badges, and other display features.
  ///
  /// Encryption keys are owned by Amazon IVS Chat and never used directly by
  /// your application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [PendingVerification].
  /// May throw [ValidationException].
  ///
  /// Parameter [roomIdentifier] :
  /// Identifier of the room that the client is trying to access. Currently this
  /// must be an ARN.
  ///
  /// Parameter [userId] :
  /// Application-provided ID that uniquely identifies the user associated with
  /// this token. This can be any UTF-8 encoded text.
  ///
  /// Parameter [attributes] :
  /// Application-provided attributes to encode into the token and attach to a
  /// chat session. Map keys and values can contain UTF-8 encoded text. The
  /// maximum length of this field is 1 KB total.
  ///
  /// Parameter [capabilities] :
  /// Set of capabilities that the user is allowed to perform in the room.
  /// Default: None (the capability to view messages is implicitly included in
  /// all requests).
  ///
  /// Parameter [sessionDurationInMinutes] :
  /// Session duration (in minutes), after which the session expires. Default:
  /// 60 (1 hour).
  Future<CreateChatTokenResponse> createChatToken({
    required String roomIdentifier,
    required String userId,
    Map<String, String>? attributes,
    List<ChatTokenCapability>? capabilities,
    int? sessionDurationInMinutes,
  }) async {
    _s.validateNumRange(
      'sessionDurationInMinutes',
      sessionDurationInMinutes,
      1,
      180,
    );
    final $payload = <String, dynamic>{
      'roomIdentifier': roomIdentifier,
      'userId': userId,
      if (attributes != null) 'attributes': attributes,
      if (capabilities != null)
        'capabilities': capabilities.map((e) => e.toValue()).toList(),
      if (sessionDurationInMinutes != null)
        'sessionDurationInMinutes': sessionDurationInMinutes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateChatToken',
      exceptionFnMap: _exceptionFns,
    );
    return CreateChatTokenResponse.fromJson(response);
  }

  /// Creates a logging configuration that allows clients to store and record
  /// sent messages.
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [PendingVerification].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationConfiguration] :
  /// A complex type that contains a destination configuration for where chat
  /// content will be logged. There can be only one type of destination
  /// (<code>cloudWatchLogs</code>, <code>firehose</code>, or <code>s3</code>)
  /// in a <code>destinationConfiguration</code>.
  ///
  /// Parameter [name] :
  /// Logging-configuration name. The value does not need to be unique.
  ///
  /// Parameter [tags] :
  /// Tags to attach to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags
  /// and "Tag naming limits and requirements"; Amazon IVS Chat has no
  /// constraints on tags beyond what is documented there.
  Future<CreateLoggingConfigurationResponse> createLoggingConfiguration({
    required DestinationConfiguration destinationConfiguration,
    String? name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'destinationConfiguration': destinationConfiguration,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateLoggingConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLoggingConfigurationResponse.fromJson(response);
  }

  /// Creates a room that allows clients to connect and pass messages.
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [PendingVerification].
  /// May throw [ValidationException].
  ///
  /// Parameter [loggingConfigurationIdentifiers] :
  /// Array of logging-configuration identifiers attached to the room.
  ///
  /// Parameter [maximumMessageLength] :
  /// Maximum number of characters in a single message. Messages are expected to
  /// be UTF-8 encoded and this limit applies specifically to rune/code-point
  /// count, not number of bytes. Default: 500.
  ///
  /// Parameter [maximumMessageRatePerSecond] :
  /// Maximum number of messages per second that can be sent to the room (by all
  /// clients). Default: 10.
  ///
  /// Parameter [messageReviewHandler] :
  /// Configuration information for optional review of messages.
  ///
  /// Parameter [name] :
  /// Room name. The value does not need to be unique.
  ///
  /// Parameter [tags] :
  /// Tags to attach to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags
  /// and "Tag naming limits and requirements"; Amazon IVS Chat has no
  /// constraints beyond what is documented there.
  Future<CreateRoomResponse> createRoom({
    List<String>? loggingConfigurationIdentifiers,
    int? maximumMessageLength,
    int? maximumMessageRatePerSecond,
    MessageReviewHandler? messageReviewHandler,
    String? name,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'maximumMessageLength',
      maximumMessageLength,
      1,
      500,
    );
    _s.validateNumRange(
      'maximumMessageRatePerSecond',
      maximumMessageRatePerSecond,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (loggingConfigurationIdentifiers != null)
        'loggingConfigurationIdentifiers': loggingConfigurationIdentifiers,
      if (maximumMessageLength != null)
        'maximumMessageLength': maximumMessageLength,
      if (maximumMessageRatePerSecond != null)
        'maximumMessageRatePerSecond': maximumMessageRatePerSecond,
      if (messageReviewHandler != null)
        'messageReviewHandler': messageReviewHandler,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateRoom',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRoomResponse.fromJson(response);
  }

  /// Deletes the specified logging configuration.
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [PendingVerification].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// Identifier of the logging configuration to be deleted.
  Future<void> deleteLoggingConfiguration({
    required String identifier,
  }) async {
    final $payload = <String, dynamic>{
      'identifier': identifier,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteLoggingConfiguration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sends an event to a specific room which directs clients to delete a
  /// specific message; that is, unrender it from view and delete it from the
  /// client’s chat history. This event’s <code>EventName</code> is
  /// <code>aws:DELETE_MESSAGE</code>. This replicates the <a
  /// href="https://docs.aws.amazon.com/ivs/latest/chatmsgapireference/actions-deletemessage-publish.html">
  /// DeleteMessage</a> WebSocket operation in the Amazon IVS Chat Messaging
  /// API.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [PendingVerification].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// ID of the message to be deleted. This is the <code>Id</code> field in the
  /// received message (see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/chatmsgapireference/actions-message-subscribe.html">
  /// Message (Subscribe)</a> in the Chat Messaging API).
  ///
  /// Parameter [roomIdentifier] :
  /// Identifier of the room where the message should be deleted. Currently this
  /// must be an ARN.
  ///
  /// Parameter [reason] :
  /// Reason for deleting the message.
  Future<DeleteMessageResponse> deleteMessage({
    required String id,
    required String roomIdentifier,
    String? reason,
  }) async {
    final $payload = <String, dynamic>{
      'id': id,
      'roomIdentifier': roomIdentifier,
      if (reason != null) 'reason': reason,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteMessage',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteMessageResponse.fromJson(response);
  }

  /// Deletes the specified room.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [PendingVerification].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// Identifier of the room to be deleted. Currently this must be an ARN.
  Future<void> deleteRoom({
    required String identifier,
  }) async {
    final $payload = <String, dynamic>{
      'identifier': identifier,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteRoom',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disconnects all connections using a specified user ID from a room. This
  /// replicates the <a
  /// href="https://docs.aws.amazon.com/ivs/latest/chatmsgapireference/actions-disconnectuser-publish.html">
  /// DisconnectUser</a> WebSocket operation in the Amazon IVS Chat Messaging
  /// API.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [PendingVerification].
  /// May throw [ValidationException].
  ///
  /// Parameter [roomIdentifier] :
  /// Identifier of the room from which the user's clients should be
  /// disconnected. Currently this must be an ARN.
  ///
  /// Parameter [userId] :
  /// ID of the user (connection) to disconnect from the room.
  ///
  /// Parameter [reason] :
  /// Reason for disconnecting the user.
  Future<void> disconnectUser({
    required String roomIdentifier,
    required String userId,
    String? reason,
  }) async {
    final $payload = <String, dynamic>{
      'roomIdentifier': roomIdentifier,
      'userId': userId,
      if (reason != null) 'reason': reason,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DisconnectUser',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets the specified logging configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// Identifier of the logging configuration to be retrieved.
  Future<GetLoggingConfigurationResponse> getLoggingConfiguration({
    required String identifier,
  }) async {
    final $payload = <String, dynamic>{
      'identifier': identifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetLoggingConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return GetLoggingConfigurationResponse.fromJson(response);
  }

  /// Gets the specified room.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// Identifier of the room for which the configuration is to be retrieved.
  /// Currently this must be an ARN.
  Future<GetRoomResponse> getRoom({
    required String identifier,
  }) async {
    final $payload = <String, dynamic>{
      'identifier': identifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetRoom',
      exceptionFnMap: _exceptionFns,
    );
    return GetRoomResponse.fromJson(response);
  }

  /// Gets summary information about all your logging configurations in the AWS
  /// region where the API request is processed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of logging configurations to return. Default: 50.
  ///
  /// Parameter [nextToken] :
  /// The first logging configurations to retrieve. This is used for pagination;
  /// see the <code>nextToken</code> response field.
  Future<ListLoggingConfigurationsResponse> listLoggingConfigurations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListLoggingConfigurations',
      exceptionFnMap: _exceptionFns,
    );
    return ListLoggingConfigurationsResponse.fromJson(response);
  }

  /// Gets summary information about all your rooms in the AWS region where the
  /// API request is processed. Results are sorted in descending order of
  /// <code>updateTime</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [loggingConfigurationIdentifier] :
  /// Logging-configuration identifier.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of rooms to return. Default: 50.
  ///
  /// Parameter [messageReviewHandlerUri] :
  /// Filters the list to match the specified message review handler URI.
  ///
  /// Parameter [name] :
  /// Filters the list to match the specified room name.
  ///
  /// Parameter [nextToken] :
  /// The first room to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListRoomsResponse> listRooms({
    String? loggingConfigurationIdentifier,
    int? maxResults,
    String? messageReviewHandlerUri,
    String? name,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (loggingConfigurationIdentifier != null)
        'loggingConfigurationIdentifier': loggingConfigurationIdentifier,
      if (maxResults != null) 'maxResults': maxResults,
      if (messageReviewHandlerUri != null)
        'messageReviewHandlerUri': messageReviewHandlerUri,
      if (name != null) 'name': name,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListRooms',
      exceptionFnMap: _exceptionFns,
    );
    return ListRoomsResponse.fromJson(response);
  }

  /// Gets information about AWS tags for the specified ARN.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to be retrieved. The ARN must be URL-encoded.
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

  /// Sends an event to a room. Use this within your application’s business
  /// logic to send events to clients of a room; e.g., to notify clients to
  /// change the way the chat UI is rendered.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [PendingVerification].
  /// May throw [ValidationException].
  ///
  /// Parameter [eventName] :
  /// Application-defined name of the event to send to clients.
  ///
  /// Parameter [roomIdentifier] :
  /// Identifier of the room to which the event will be sent. Currently this
  /// must be an ARN.
  ///
  /// Parameter [attributes] :
  /// Application-defined metadata to attach to the event sent to clients. The
  /// maximum length of the metadata is 1 KB total.
  Future<SendEventResponse> sendEvent({
    required String eventName,
    required String roomIdentifier,
    Map<String, String>? attributes,
  }) async {
    final $payload = <String, dynamic>{
      'eventName': eventName,
      'roomIdentifier': roomIdentifier,
      if (attributes != null) 'attributes': attributes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/SendEvent',
      exceptionFnMap: _exceptionFns,
    );
    return SendEventResponse.fromJson(response);
  }

  /// Adds or updates tags for the AWS resource with the specified ARN.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to be tagged. The ARN must be URL-encoded.
  ///
  /// Parameter [tags] :
  /// Array of tags to be added or updated. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags
  /// and "Tag naming limits and requirements"; Amazon IVS Chat has no
  /// constraints beyond what is documented there.
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

  /// Removes tags from the resource with the specified ARN.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to be untagged. The ARN must be URL-encoded.
  ///
  /// Parameter [tagKeys] :
  /// Array of tags to be removed. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags
  /// and "Tag naming limits and requirements"; Amazon IVS Chat has no
  /// constraints beyond what is documented there.
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

  /// Updates a specified logging configuration.
  ///
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [PendingVerification].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// Identifier of the logging configuration to be updated.
  ///
  /// Parameter [destinationConfiguration] :
  /// A complex type that contains a destination configuration for where chat
  /// content will be logged. There can be only one type of destination
  /// (<code>cloudWatchLogs</code>, <code>firehose</code>, or <code>s3</code>)
  /// in a <code>destinationConfiguration</code>.
  ///
  /// Parameter [name] :
  /// Logging-configuration name. The value does not need to be unique.
  Future<UpdateLoggingConfigurationResponse> updateLoggingConfiguration({
    required String identifier,
    DestinationConfiguration? destinationConfiguration,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      'identifier': identifier,
      if (destinationConfiguration != null)
        'destinationConfiguration': destinationConfiguration,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateLoggingConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLoggingConfigurationResponse.fromJson(response);
  }

  /// Updates a room’s configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [PendingVerification].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// Identifier of the room to be updated. Currently this must be an ARN.
  ///
  /// Parameter [loggingConfigurationIdentifiers] :
  /// Array of logging-configuration identifiers attached to the room.
  ///
  /// Parameter [maximumMessageLength] :
  /// The maximum number of characters in a single message. Messages are
  /// expected to be UTF-8 encoded and this limit applies specifically to
  /// rune/code-point count, not number of bytes. Default: 500.
  ///
  /// Parameter [maximumMessageRatePerSecond] :
  /// Maximum number of messages per second that can be sent to the room (by all
  /// clients). Default: 10.
  ///
  /// Parameter [messageReviewHandler] :
  /// Configuration information for optional review of messages. Specify an
  /// empty <code>uri</code> string to disassociate a message review handler
  /// from the specified room.
  ///
  /// Parameter [name] :
  /// Room name. The value does not need to be unique.
  Future<UpdateRoomResponse> updateRoom({
    required String identifier,
    List<String>? loggingConfigurationIdentifiers,
    int? maximumMessageLength,
    int? maximumMessageRatePerSecond,
    MessageReviewHandler? messageReviewHandler,
    String? name,
  }) async {
    _s.validateNumRange(
      'maximumMessageLength',
      maximumMessageLength,
      1,
      500,
    );
    _s.validateNumRange(
      'maximumMessageRatePerSecond',
      maximumMessageRatePerSecond,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'identifier': identifier,
      if (loggingConfigurationIdentifiers != null)
        'loggingConfigurationIdentifiers': loggingConfigurationIdentifiers,
      if (maximumMessageLength != null)
        'maximumMessageLength': maximumMessageLength,
      if (maximumMessageRatePerSecond != null)
        'maximumMessageRatePerSecond': maximumMessageRatePerSecond,
      if (messageReviewHandler != null)
        'messageReviewHandler': messageReviewHandler,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateRoom',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRoomResponse.fromJson(response);
  }
}

enum ChatTokenCapability {
  sendMessage,
  disconnectUser,
  deleteMessage,
}

extension ChatTokenCapabilityValueExtension on ChatTokenCapability {
  String toValue() {
    switch (this) {
      case ChatTokenCapability.sendMessage:
        return 'SEND_MESSAGE';
      case ChatTokenCapability.disconnectUser:
        return 'DISCONNECT_USER';
      case ChatTokenCapability.deleteMessage:
        return 'DELETE_MESSAGE';
    }
  }
}

extension ChatTokenCapabilityFromString on String {
  ChatTokenCapability toChatTokenCapability() {
    switch (this) {
      case 'SEND_MESSAGE':
        return ChatTokenCapability.sendMessage;
      case 'DISCONNECT_USER':
        return ChatTokenCapability.disconnectUser;
      case 'DELETE_MESSAGE':
        return ChatTokenCapability.deleteMessage;
    }
    throw Exception('$this is not known in enum ChatTokenCapability');
  }
}

/// Specifies a CloudWatch Logs location where chat logs will be stored.
class CloudWatchLogsDestinationConfiguration {
  /// Name of the Amazon Cloudwatch Logs destination where chat activity will be
  /// logged.
  final String logGroupName;

  CloudWatchLogsDestinationConfiguration({
    required this.logGroupName,
  });

  factory CloudWatchLogsDestinationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return CloudWatchLogsDestinationConfiguration(
      logGroupName: json['logGroupName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupName = this.logGroupName;
    return {
      'logGroupName': logGroupName,
    };
  }
}

class CreateChatTokenResponse {
  /// Time after which an end user's session is no longer valid. This is an ISO
  /// 8601 timestamp; <i>note that this is returned as a string</i>.
  final DateTime? sessionExpirationTime;

  /// The issued client token, encrypted.
  final String? token;

  /// Time after which the token is no longer valid and cannot be used to connect
  /// to a room. This is an ISO 8601 timestamp; <i>note that this is returned as a
  /// string</i>.
  final DateTime? tokenExpirationTime;

  CreateChatTokenResponse({
    this.sessionExpirationTime,
    this.token,
    this.tokenExpirationTime,
  });

  factory CreateChatTokenResponse.fromJson(Map<String, dynamic> json) {
    return CreateChatTokenResponse(
      sessionExpirationTime: timeStampFromJson(json['sessionExpirationTime']),
      token: json['token'] as String?,
      tokenExpirationTime: timeStampFromJson(json['tokenExpirationTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final sessionExpirationTime = this.sessionExpirationTime;
    final token = this.token;
    final tokenExpirationTime = this.tokenExpirationTime;
    return {
      if (sessionExpirationTime != null)
        'sessionExpirationTime': iso8601ToJson(sessionExpirationTime),
      if (token != null) 'token': token,
      if (tokenExpirationTime != null)
        'tokenExpirationTime': iso8601ToJson(tokenExpirationTime),
    };
  }
}

class CreateLoggingConfigurationResponse {
  /// Logging-configuration ARN, assigned by the system.
  final String? arn;

  /// Time when the logging configuration was created. This is an ISO 8601
  /// timestamp; <i>note that this is returned as a string</i>.
  final DateTime? createTime;

  /// A complex type that contains a destination configuration for where chat
  /// content will be logged, from the request. There is only one type of
  /// destination (<code>cloudWatchLogs</code>, <code>firehose</code>, or
  /// <code>s3</code>) in a <code>destinationConfiguration</code>.
  final DestinationConfiguration? destinationConfiguration;

  /// Logging-configuration ID, generated by the system. This is a relative
  /// identifier, the part of the ARN that uniquely identifies the logging
  /// configuration.
  final String? id;

  /// Logging-configuration name, from the request (if specified).
  final String? name;

  /// The state of the logging configuration. When the state is
  /// <code>ACTIVE</code>, the configuration is ready to log chat content.
  final CreateLoggingConfigurationState? state;

  /// Tags attached to the resource, from the request (if specified). Array of
  /// maps, each of the form <code>string:string (key:value)</code>.
  final Map<String, String>? tags;

  /// Time of the logging configuration’s last update. This is an ISO 8601
  /// timestamp; <i>note that this is returned as a string</i>.
  final DateTime? updateTime;

  CreateLoggingConfigurationResponse({
    this.arn,
    this.createTime,
    this.destinationConfiguration,
    this.id,
    this.name,
    this.state,
    this.tags,
    this.updateTime,
  });

  factory CreateLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateLoggingConfigurationResponse(
      arn: json['arn'] as String?,
      createTime: timeStampFromJson(json['createTime']),
      destinationConfiguration: json['destinationConfiguration'] != null
          ? DestinationConfiguration.fromJson(
              json['destinationConfiguration'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      name: json['name'] as String?,
      state: (json['state'] as String?)?.toCreateLoggingConfigurationState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updateTime: timeStampFromJson(json['updateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createTime = this.createTime;
    final destinationConfiguration = this.destinationConfiguration;
    final id = this.id;
    final name = this.name;
    final state = this.state;
    final tags = this.tags;
    final updateTime = this.updateTime;
    return {
      if (arn != null) 'arn': arn,
      if (createTime != null) 'createTime': iso8601ToJson(createTime),
      if (destinationConfiguration != null)
        'destinationConfiguration': destinationConfiguration,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (updateTime != null) 'updateTime': iso8601ToJson(updateTime),
    };
  }
}

enum CreateLoggingConfigurationState {
  active,
}

extension CreateLoggingConfigurationStateValueExtension
    on CreateLoggingConfigurationState {
  String toValue() {
    switch (this) {
      case CreateLoggingConfigurationState.active:
        return 'ACTIVE';
    }
  }
}

extension CreateLoggingConfigurationStateFromString on String {
  CreateLoggingConfigurationState toCreateLoggingConfigurationState() {
    switch (this) {
      case 'ACTIVE':
        return CreateLoggingConfigurationState.active;
    }
    throw Exception(
        '$this is not known in enum CreateLoggingConfigurationState');
  }
}

class CreateRoomResponse {
  /// Room ARN, assigned by the system.
  final String? arn;

  /// Time when the room was created. This is an ISO 8601 timestamp; <i>note that
  /// this is returned as a string</i>.
  final DateTime? createTime;

  /// Room ID, generated by the system. This is a relative identifier, the part of
  /// the ARN that uniquely identifies the room.
  final String? id;

  /// Array of logging configurations attached to the room, from the request (if
  /// specified).
  final List<String>? loggingConfigurationIdentifiers;

  /// Maximum number of characters in a single message, from the request (if
  /// specified).
  final int? maximumMessageLength;

  /// Maximum number of messages per second that can be sent to the room (by all
  /// clients), from the request (if specified).
  final int? maximumMessageRatePerSecond;

  /// Configuration information for optional review of messages.
  final MessageReviewHandler? messageReviewHandler;

  /// Room name, from the request (if specified).
  final String? name;

  /// Tags attached to the resource, from the request (if specified).
  final Map<String, String>? tags;

  /// Time of the room’s last update. This is an ISO 8601 timestamp; <i>note that
  /// this is returned as a string</i>.
  final DateTime? updateTime;

  CreateRoomResponse({
    this.arn,
    this.createTime,
    this.id,
    this.loggingConfigurationIdentifiers,
    this.maximumMessageLength,
    this.maximumMessageRatePerSecond,
    this.messageReviewHandler,
    this.name,
    this.tags,
    this.updateTime,
  });

  factory CreateRoomResponse.fromJson(Map<String, dynamic> json) {
    return CreateRoomResponse(
      arn: json['arn'] as String?,
      createTime: timeStampFromJson(json['createTime']),
      id: json['id'] as String?,
      loggingConfigurationIdentifiers:
          (json['loggingConfigurationIdentifiers'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      maximumMessageLength: json['maximumMessageLength'] as int?,
      maximumMessageRatePerSecond: json['maximumMessageRatePerSecond'] as int?,
      messageReviewHandler: json['messageReviewHandler'] != null
          ? MessageReviewHandler.fromJson(
              json['messageReviewHandler'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updateTime: timeStampFromJson(json['updateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createTime = this.createTime;
    final id = this.id;
    final loggingConfigurationIdentifiers =
        this.loggingConfigurationIdentifiers;
    final maximumMessageLength = this.maximumMessageLength;
    final maximumMessageRatePerSecond = this.maximumMessageRatePerSecond;
    final messageReviewHandler = this.messageReviewHandler;
    final name = this.name;
    final tags = this.tags;
    final updateTime = this.updateTime;
    return {
      if (arn != null) 'arn': arn,
      if (createTime != null) 'createTime': iso8601ToJson(createTime),
      if (id != null) 'id': id,
      if (loggingConfigurationIdentifiers != null)
        'loggingConfigurationIdentifiers': loggingConfigurationIdentifiers,
      if (maximumMessageLength != null)
        'maximumMessageLength': maximumMessageLength,
      if (maximumMessageRatePerSecond != null)
        'maximumMessageRatePerSecond': maximumMessageRatePerSecond,
      if (messageReviewHandler != null)
        'messageReviewHandler': messageReviewHandler,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
      if (updateTime != null) 'updateTime': iso8601ToJson(updateTime),
    };
  }
}

class DeleteMessageResponse {
  /// Operation identifier, generated by Amazon IVS Chat.
  final String? id;

  DeleteMessageResponse({
    this.id,
  });

  factory DeleteMessageResponse.fromJson(Map<String, dynamic> json) {
    return DeleteMessageResponse(
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'id': id,
    };
  }
}

/// A complex type that describes a location where chat logs will be stored.
/// Each member represents the configuration of one log destination. For
/// logging, you define only one type of destination (for CloudWatch Logs,
/// Kinesis Firehose, or S3).
class DestinationConfiguration {
  /// An Amazon CloudWatch Logs destination configuration where chat activity will
  /// be logged.
  final CloudWatchLogsDestinationConfiguration? cloudWatchLogs;

  /// An Amazon Kinesis Data Firehose destination configuration where chat
  /// activity will be logged.
  final FirehoseDestinationConfiguration? firehose;

  /// An Amazon S3 destination configuration where chat activity will be logged.
  final S3DestinationConfiguration? s3;

  DestinationConfiguration({
    this.cloudWatchLogs,
    this.firehose,
    this.s3,
  });

  factory DestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return DestinationConfiguration(
      cloudWatchLogs: json['cloudWatchLogs'] != null
          ? CloudWatchLogsDestinationConfiguration.fromJson(
              json['cloudWatchLogs'] as Map<String, dynamic>)
          : null,
      firehose: json['firehose'] != null
          ? FirehoseDestinationConfiguration.fromJson(
              json['firehose'] as Map<String, dynamic>)
          : null,
      s3: json['s3'] != null
          ? S3DestinationConfiguration.fromJson(
              json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogs = this.cloudWatchLogs;
    final firehose = this.firehose;
    final s3 = this.s3;
    return {
      if (cloudWatchLogs != null) 'cloudWatchLogs': cloudWatchLogs,
      if (firehose != null) 'firehose': firehose,
      if (s3 != null) 's3': s3,
    };
  }
}

class DisconnectUserResponse {
  DisconnectUserResponse();

  factory DisconnectUserResponse.fromJson(Map<String, dynamic> _) {
    return DisconnectUserResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum FallbackResult {
  allow,
  deny,
}

extension FallbackResultValueExtension on FallbackResult {
  String toValue() {
    switch (this) {
      case FallbackResult.allow:
        return 'ALLOW';
      case FallbackResult.deny:
        return 'DENY';
    }
  }
}

extension FallbackResultFromString on String {
  FallbackResult toFallbackResult() {
    switch (this) {
      case 'ALLOW':
        return FallbackResult.allow;
      case 'DENY':
        return FallbackResult.deny;
    }
    throw Exception('$this is not known in enum FallbackResult');
  }
}

/// Specifies a Kinesis Firehose location where chat logs will be stored.
class FirehoseDestinationConfiguration {
  /// Name of the Amazon Kinesis Firehose delivery stream where chat activity will
  /// be logged.
  final String deliveryStreamName;

  FirehoseDestinationConfiguration({
    required this.deliveryStreamName,
  });

  factory FirehoseDestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return FirehoseDestinationConfiguration(
      deliveryStreamName: json['deliveryStreamName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryStreamName = this.deliveryStreamName;
    return {
      'deliveryStreamName': deliveryStreamName,
    };
  }
}

class GetLoggingConfigurationResponse {
  /// Logging-configuration ARN, from the request (if <code>identifier</code> was
  /// an ARN).
  final String? arn;

  /// Time when the logging configuration was created. This is an ISO 8601
  /// timestamp; <i>note that this is returned as a string</i>.
  final DateTime? createTime;

  /// A complex type that contains a destination configuration for where chat
  /// content will be logged. There is only one type of destination
  /// (<code>cloudWatchLogs</code>, <code>firehose</code>, or <code>s3</code>) in
  /// a <code>destinationConfiguration</code>.
  final DestinationConfiguration? destinationConfiguration;

  /// Logging-configuration ID, generated by the system. This is a relative
  /// identifier, the part of the ARN that uniquely identifies the logging
  /// configuration.
  final String? id;

  /// Logging-configuration name. This value does not need to be unique.
  final String? name;

  /// The state of the logging configuration. When the state is
  /// <code>ACTIVE</code>, the configuration is ready to log chat content.
  final LoggingConfigurationState? state;

  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>.
  final Map<String, String>? tags;

  /// Time of the logging configuration’s last update. This is an ISO 8601
  /// timestamp; <i>note that this is returned as a string</i>.
  final DateTime? updateTime;

  GetLoggingConfigurationResponse({
    this.arn,
    this.createTime,
    this.destinationConfiguration,
    this.id,
    this.name,
    this.state,
    this.tags,
    this.updateTime,
  });

  factory GetLoggingConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetLoggingConfigurationResponse(
      arn: json['arn'] as String?,
      createTime: timeStampFromJson(json['createTime']),
      destinationConfiguration: json['destinationConfiguration'] != null
          ? DestinationConfiguration.fromJson(
              json['destinationConfiguration'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      name: json['name'] as String?,
      state: (json['state'] as String?)?.toLoggingConfigurationState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updateTime: timeStampFromJson(json['updateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createTime = this.createTime;
    final destinationConfiguration = this.destinationConfiguration;
    final id = this.id;
    final name = this.name;
    final state = this.state;
    final tags = this.tags;
    final updateTime = this.updateTime;
    return {
      if (arn != null) 'arn': arn,
      if (createTime != null) 'createTime': iso8601ToJson(createTime),
      if (destinationConfiguration != null)
        'destinationConfiguration': destinationConfiguration,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (updateTime != null) 'updateTime': iso8601ToJson(updateTime),
    };
  }
}

class GetRoomResponse {
  /// Room ARN, from the request (if <code>identifier</code> was an ARN).
  final String? arn;

  /// Time when the room was created. This is an ISO 8601 timestamp; <i>note that
  /// this is returned as a string</i>.
  final DateTime? createTime;

  /// Room ID, generated by the system. This is a relative identifier, the part of
  /// the ARN that uniquely identifies the room.
  final String? id;

  /// Array of logging configurations attached to the room.
  final List<String>? loggingConfigurationIdentifiers;

  /// Maximum number of characters in a single message. Messages are expected to
  /// be UTF-8 encoded and this limit applies specifically to rune/code-point
  /// count, not number of bytes. Default: 500.
  final int? maximumMessageLength;

  /// Maximum number of messages per second that can be sent to the room (by all
  /// clients). Default: 10.
  final int? maximumMessageRatePerSecond;

  /// Configuration information for optional review of messages.
  final MessageReviewHandler? messageReviewHandler;

  /// Room name. The value does not need to be unique.
  final String? name;

  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>.
  final Map<String, String>? tags;

  /// Time of the room’s last update. This is an ISO 8601 timestamp; <i>note that
  /// this is returned as a string</i>.
  final DateTime? updateTime;

  GetRoomResponse({
    this.arn,
    this.createTime,
    this.id,
    this.loggingConfigurationIdentifiers,
    this.maximumMessageLength,
    this.maximumMessageRatePerSecond,
    this.messageReviewHandler,
    this.name,
    this.tags,
    this.updateTime,
  });

  factory GetRoomResponse.fromJson(Map<String, dynamic> json) {
    return GetRoomResponse(
      arn: json['arn'] as String?,
      createTime: timeStampFromJson(json['createTime']),
      id: json['id'] as String?,
      loggingConfigurationIdentifiers:
          (json['loggingConfigurationIdentifiers'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      maximumMessageLength: json['maximumMessageLength'] as int?,
      maximumMessageRatePerSecond: json['maximumMessageRatePerSecond'] as int?,
      messageReviewHandler: json['messageReviewHandler'] != null
          ? MessageReviewHandler.fromJson(
              json['messageReviewHandler'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updateTime: timeStampFromJson(json['updateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createTime = this.createTime;
    final id = this.id;
    final loggingConfigurationIdentifiers =
        this.loggingConfigurationIdentifiers;
    final maximumMessageLength = this.maximumMessageLength;
    final maximumMessageRatePerSecond = this.maximumMessageRatePerSecond;
    final messageReviewHandler = this.messageReviewHandler;
    final name = this.name;
    final tags = this.tags;
    final updateTime = this.updateTime;
    return {
      if (arn != null) 'arn': arn,
      if (createTime != null) 'createTime': iso8601ToJson(createTime),
      if (id != null) 'id': id,
      if (loggingConfigurationIdentifiers != null)
        'loggingConfigurationIdentifiers': loggingConfigurationIdentifiers,
      if (maximumMessageLength != null)
        'maximumMessageLength': maximumMessageLength,
      if (maximumMessageRatePerSecond != null)
        'maximumMessageRatePerSecond': maximumMessageRatePerSecond,
      if (messageReviewHandler != null)
        'messageReviewHandler': messageReviewHandler,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
      if (updateTime != null) 'updateTime': iso8601ToJson(updateTime),
    };
  }
}

class ListLoggingConfigurationsResponse {
  /// List of the matching logging configurations (summary information only).
  /// There is only one type of destination (<code>cloudWatchLogs</code>,
  /// <code>firehose</code>, or <code>s3</code>) in a
  /// <code>destinationConfiguration</code>.
  final List<LoggingConfigurationSummary> loggingConfigurations;

  /// If there are more logging configurations than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListLoggingConfigurationsResponse({
    required this.loggingConfigurations,
    this.nextToken,
  });

  factory ListLoggingConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListLoggingConfigurationsResponse(
      loggingConfigurations: (json['loggingConfigurations'] as List)
          .whereNotNull()
          .map((e) =>
              LoggingConfigurationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final loggingConfigurations = this.loggingConfigurations;
    final nextToken = this.nextToken;
    return {
      'loggingConfigurations': loggingConfigurations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListRoomsResponse {
  /// List of the matching rooms (summary information only).
  final List<RoomSummary> rooms;

  /// If there are more rooms than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListRoomsResponse({
    required this.rooms,
    this.nextToken,
  });

  factory ListRoomsResponse.fromJson(Map<String, dynamic> json) {
    return ListRoomsResponse(
      rooms: (json['rooms'] as List)
          .whereNotNull()
          .map((e) => RoomSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final rooms = this.rooms;
    final nextToken = this.nextToken;
    return {
      'rooms': rooms,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'tags': tags,
    };
  }
}

enum LoggingConfigurationState {
  creating,
  createFailed,
  deleting,
  deleteFailed,
  updating,
  updateFailed,
  active,
}

extension LoggingConfigurationStateValueExtension on LoggingConfigurationState {
  String toValue() {
    switch (this) {
      case LoggingConfigurationState.creating:
        return 'CREATING';
      case LoggingConfigurationState.createFailed:
        return 'CREATE_FAILED';
      case LoggingConfigurationState.deleting:
        return 'DELETING';
      case LoggingConfigurationState.deleteFailed:
        return 'DELETE_FAILED';
      case LoggingConfigurationState.updating:
        return 'UPDATING';
      case LoggingConfigurationState.updateFailed:
        return 'UPDATE_FAILED';
      case LoggingConfigurationState.active:
        return 'ACTIVE';
    }
  }
}

extension LoggingConfigurationStateFromString on String {
  LoggingConfigurationState toLoggingConfigurationState() {
    switch (this) {
      case 'CREATING':
        return LoggingConfigurationState.creating;
      case 'CREATE_FAILED':
        return LoggingConfigurationState.createFailed;
      case 'DELETING':
        return LoggingConfigurationState.deleting;
      case 'DELETE_FAILED':
        return LoggingConfigurationState.deleteFailed;
      case 'UPDATING':
        return LoggingConfigurationState.updating;
      case 'UPDATE_FAILED':
        return LoggingConfigurationState.updateFailed;
      case 'ACTIVE':
        return LoggingConfigurationState.active;
    }
    throw Exception('$this is not known in enum LoggingConfigurationState');
  }
}

/// Summary information about a logging configuration.
class LoggingConfigurationSummary {
  /// Logging-configuration ARN.
  final String? arn;

  /// Time when the logging configuration was created. This is an ISO 8601
  /// timestamp; <i>note that this is returned as a string</i>.
  final DateTime? createTime;

  /// A complex type that contains a destination configuration for where chat
  /// content will be logged.
  final DestinationConfiguration? destinationConfiguration;

  /// Logging-configuration ID, generated by the system. This is a relative
  /// identifier, the part of the ARN that uniquely identifies the room.
  final String? id;

  /// Logging-configuration name. The value does not need to be unique.
  final String? name;

  /// The state of the logging configuration. When this is <code>ACTIVE</code>,
  /// the configuration is ready for logging chat content.
  final LoggingConfigurationState? state;

  /// Tags to attach to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS Chat has no constraints on
  /// tags beyond what is documented there.
  final Map<String, String>? tags;

  /// Time of the logging configuration’s last update. This is an ISO 8601
  /// timestamp; <i>note that this is returned as a string</i>.
  final DateTime? updateTime;

  LoggingConfigurationSummary({
    this.arn,
    this.createTime,
    this.destinationConfiguration,
    this.id,
    this.name,
    this.state,
    this.tags,
    this.updateTime,
  });

  factory LoggingConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return LoggingConfigurationSummary(
      arn: json['arn'] as String?,
      createTime: timeStampFromJson(json['createTime']),
      destinationConfiguration: json['destinationConfiguration'] != null
          ? DestinationConfiguration.fromJson(
              json['destinationConfiguration'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      name: json['name'] as String?,
      state: (json['state'] as String?)?.toLoggingConfigurationState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updateTime: timeStampFromJson(json['updateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createTime = this.createTime;
    final destinationConfiguration = this.destinationConfiguration;
    final id = this.id;
    final name = this.name;
    final state = this.state;
    final tags = this.tags;
    final updateTime = this.updateTime;
    return {
      if (arn != null) 'arn': arn,
      if (createTime != null) 'createTime': iso8601ToJson(createTime),
      if (destinationConfiguration != null)
        'destinationConfiguration': destinationConfiguration,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (updateTime != null) 'updateTime': iso8601ToJson(updateTime),
    };
  }
}

/// Configuration information for optional message review.
class MessageReviewHandler {
  /// Specifies the fallback behavior (whether the message is allowed or denied)
  /// if the handler does not return a valid response, encounters an error, or
  /// times out. (For the timeout period, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/userguide/service-quotas.html">
  /// Service Quotas</a>.) If allowed, the message is delivered with returned
  /// content to all users connected to the room. If denied, the message is not
  /// delivered to any user. Default: <code>ALLOW</code>.
  final FallbackResult? fallbackResult;

  /// Identifier of the message review handler. Currently this must be an ARN of a
  /// lambda function.
  final String? uri;

  MessageReviewHandler({
    this.fallbackResult,
    this.uri,
  });

  factory MessageReviewHandler.fromJson(Map<String, dynamic> json) {
    return MessageReviewHandler(
      fallbackResult: (json['fallbackResult'] as String?)?.toFallbackResult(),
      uri: json['uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fallbackResult = this.fallbackResult;
    final uri = this.uri;
    return {
      if (fallbackResult != null) 'fallbackResult': fallbackResult.toValue(),
      if (uri != null) 'uri': uri,
    };
  }
}

/// Summary information about a room.
class RoomSummary {
  /// Room ARN.
  final String? arn;

  /// Time when the room was created. This is an ISO 8601 timestamp; <i>note that
  /// this is returned as a string</i>.
  final DateTime? createTime;

  /// Room ID, generated by the system. This is a relative identifier, the part of
  /// the ARN that uniquely identifies the room.
  final String? id;

  /// List of logging-configuration identifiers attached to the room.
  final List<String>? loggingConfigurationIdentifiers;

  /// Configuration information for optional review of messages.
  final MessageReviewHandler? messageReviewHandler;

  /// Room name. The value does not need to be unique.
  final String? name;

  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS Chat has no constraints
  /// beyond what is documented there.
  final Map<String, String>? tags;

  /// Time of the room’s last update. This is an ISO 8601 timestamp; <i>note that
  /// this is returned as a string</i>.
  final DateTime? updateTime;

  RoomSummary({
    this.arn,
    this.createTime,
    this.id,
    this.loggingConfigurationIdentifiers,
    this.messageReviewHandler,
    this.name,
    this.tags,
    this.updateTime,
  });

  factory RoomSummary.fromJson(Map<String, dynamic> json) {
    return RoomSummary(
      arn: json['arn'] as String?,
      createTime: timeStampFromJson(json['createTime']),
      id: json['id'] as String?,
      loggingConfigurationIdentifiers:
          (json['loggingConfigurationIdentifiers'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      messageReviewHandler: json['messageReviewHandler'] != null
          ? MessageReviewHandler.fromJson(
              json['messageReviewHandler'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updateTime: timeStampFromJson(json['updateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createTime = this.createTime;
    final id = this.id;
    final loggingConfigurationIdentifiers =
        this.loggingConfigurationIdentifiers;
    final messageReviewHandler = this.messageReviewHandler;
    final name = this.name;
    final tags = this.tags;
    final updateTime = this.updateTime;
    return {
      if (arn != null) 'arn': arn,
      if (createTime != null) 'createTime': iso8601ToJson(createTime),
      if (id != null) 'id': id,
      if (loggingConfigurationIdentifiers != null)
        'loggingConfigurationIdentifiers': loggingConfigurationIdentifiers,
      if (messageReviewHandler != null)
        'messageReviewHandler': messageReviewHandler,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
      if (updateTime != null) 'updateTime': iso8601ToJson(updateTime),
    };
  }
}

/// Specifies an S3 location where chat logs will be stored.
class S3DestinationConfiguration {
  /// Name of the Amazon S3 bucket where chat activity will be logged.
  final String bucketName;

  S3DestinationConfiguration({
    required this.bucketName,
  });

  factory S3DestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return S3DestinationConfiguration(
      bucketName: json['bucketName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    return {
      'bucketName': bucketName,
    };
  }
}

class SendEventResponse {
  /// An identifier generated by Amazon IVS Chat. This identifier must be used in
  /// subsequent operations for this message, such as DeleteMessage.
  final String? id;

  SendEventResponse({
    this.id,
  });

  factory SendEventResponse.fromJson(Map<String, dynamic> json) {
    return SendEventResponse(
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'id': id,
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

class UpdateLoggingConfigurationResponse {
  /// Logging-configuration ARN, from the request (if <code>identifier</code> was
  /// an ARN).
  final String? arn;

  /// Time when the logging configuration was created. This is an ISO 8601
  /// timestamp; <i>note that this is returned as a string</i>.
  final DateTime? createTime;

  /// A complex type that contains a destination configuration for where chat
  /// content will be logged, from the request. There is only one type of
  /// destination (<code>cloudWatchLogs</code>, <code>firehose</code>, or
  /// <code>s3</code>) in a <code>destinationConfiguration</code>.
  final DestinationConfiguration? destinationConfiguration;

  /// Logging-configuration ID, generated by the system. This is a relative
  /// identifier, the part of the ARN that uniquely identifies the room.
  final String? id;

  /// Logging-configuration name, from the request (if specified).
  final String? name;

  /// The state of the logging configuration. When the state is
  /// <code>ACTIVE</code>, the configuration is ready to log chat content.
  final UpdateLoggingConfigurationState? state;

  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>.
  final Map<String, String>? tags;

  /// Time of the logging configuration’s last update. This is an ISO 8601
  /// timestamp; <i>note that this is returned as a string</i>.
  final DateTime? updateTime;

  UpdateLoggingConfigurationResponse({
    this.arn,
    this.createTime,
    this.destinationConfiguration,
    this.id,
    this.name,
    this.state,
    this.tags,
    this.updateTime,
  });

  factory UpdateLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateLoggingConfigurationResponse(
      arn: json['arn'] as String?,
      createTime: timeStampFromJson(json['createTime']),
      destinationConfiguration: json['destinationConfiguration'] != null
          ? DestinationConfiguration.fromJson(
              json['destinationConfiguration'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      name: json['name'] as String?,
      state: (json['state'] as String?)?.toUpdateLoggingConfigurationState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updateTime: timeStampFromJson(json['updateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createTime = this.createTime;
    final destinationConfiguration = this.destinationConfiguration;
    final id = this.id;
    final name = this.name;
    final state = this.state;
    final tags = this.tags;
    final updateTime = this.updateTime;
    return {
      if (arn != null) 'arn': arn,
      if (createTime != null) 'createTime': iso8601ToJson(createTime),
      if (destinationConfiguration != null)
        'destinationConfiguration': destinationConfiguration,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (updateTime != null) 'updateTime': iso8601ToJson(updateTime),
    };
  }
}

enum UpdateLoggingConfigurationState {
  active,
}

extension UpdateLoggingConfigurationStateValueExtension
    on UpdateLoggingConfigurationState {
  String toValue() {
    switch (this) {
      case UpdateLoggingConfigurationState.active:
        return 'ACTIVE';
    }
  }
}

extension UpdateLoggingConfigurationStateFromString on String {
  UpdateLoggingConfigurationState toUpdateLoggingConfigurationState() {
    switch (this) {
      case 'ACTIVE':
        return UpdateLoggingConfigurationState.active;
    }
    throw Exception(
        '$this is not known in enum UpdateLoggingConfigurationState');
  }
}

class UpdateRoomResponse {
  /// Room ARN, from the request (if <code>identifier</code> was an ARN).
  final String? arn;

  /// Time when the room was created. This is an ISO 8601 timestamp; <i>note that
  /// this is returned as a string</i>.
  final DateTime? createTime;

  /// Room ID, generated by the system. This is a relative identifier, the part of
  /// the ARN that uniquely identifies the room.
  final String? id;

  /// Array of logging configurations attached to the room, from the request (if
  /// specified).
  final List<String>? loggingConfigurationIdentifiers;

  /// Maximum number of characters in a single message, from the request (if
  /// specified).
  final int? maximumMessageLength;

  /// Maximum number of messages per second that can be sent to the room (by all
  /// clients), from the request (if specified).
  final int? maximumMessageRatePerSecond;

  /// Configuration information for optional review of messages.
  final MessageReviewHandler? messageReviewHandler;

  /// Room name, from the request (if specified).
  final String? name;

  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>.
  final Map<String, String>? tags;

  /// Time of the room’s last update. This is an ISO 8601 timestamp; <i>note that
  /// this is returned as a string</i>.
  final DateTime? updateTime;

  UpdateRoomResponse({
    this.arn,
    this.createTime,
    this.id,
    this.loggingConfigurationIdentifiers,
    this.maximumMessageLength,
    this.maximumMessageRatePerSecond,
    this.messageReviewHandler,
    this.name,
    this.tags,
    this.updateTime,
  });

  factory UpdateRoomResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRoomResponse(
      arn: json['arn'] as String?,
      createTime: timeStampFromJson(json['createTime']),
      id: json['id'] as String?,
      loggingConfigurationIdentifiers:
          (json['loggingConfigurationIdentifiers'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      maximumMessageLength: json['maximumMessageLength'] as int?,
      maximumMessageRatePerSecond: json['maximumMessageRatePerSecond'] as int?,
      messageReviewHandler: json['messageReviewHandler'] != null
          ? MessageReviewHandler.fromJson(
              json['messageReviewHandler'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updateTime: timeStampFromJson(json['updateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createTime = this.createTime;
    final id = this.id;
    final loggingConfigurationIdentifiers =
        this.loggingConfigurationIdentifiers;
    final maximumMessageLength = this.maximumMessageLength;
    final maximumMessageRatePerSecond = this.maximumMessageRatePerSecond;
    final messageReviewHandler = this.messageReviewHandler;
    final name = this.name;
    final tags = this.tags;
    final updateTime = this.updateTime;
    return {
      if (arn != null) 'arn': arn,
      if (createTime != null) 'createTime': iso8601ToJson(createTime),
      if (id != null) 'id': id,
      if (loggingConfigurationIdentifiers != null)
        'loggingConfigurationIdentifiers': loggingConfigurationIdentifiers,
      if (maximumMessageLength != null)
        'maximumMessageLength': maximumMessageLength,
      if (maximumMessageRatePerSecond != null)
        'maximumMessageRatePerSecond': maximumMessageRatePerSecond,
      if (messageReviewHandler != null)
        'messageReviewHandler': messageReviewHandler,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
      if (updateTime != null) 'updateTime': iso8601ToJson(updateTime),
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

class PendingVerification extends _s.GenericAwsException {
  PendingVerification({String? type, String? message})
      : super(type: type, code: 'PendingVerification', message: message);
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
  'PendingVerification': (type, message) =>
      PendingVerification(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
