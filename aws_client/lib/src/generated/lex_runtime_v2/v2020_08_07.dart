// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// This section contains documentation for the Amazon Lex V2 Runtime V2 API
/// operations.
class LexRuntimeV2 {
  final _s.RestJsonProtocol _protocol;
  LexRuntimeV2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'runtime-v2-lex',
            signingName: 'lex',
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

  /// Removes session information for a specified bot, alias, and user ID.
  ///
  /// You can use this operation to restart a conversation with a bot. When you
  /// remove a session, the entire history of the session is removed so that you
  /// can start again.
  ///
  /// You don't need to delete a session. Sessions have a time limit and will
  /// expire. Set the session time limit when you create the bot. The default is
  /// 5 minutes, but you can specify anything between 1 minute and 24 hours.
  ///
  /// If you specify a bot or alias ID that doesn't exist, you receive a
  /// <code>BadRequestException.</code>
  ///
  /// If the locale doesn't exist in the bot, or if the locale hasn't been
  /// enables for the alias, you receive a <code>BadRequestException</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [botAliasId] :
  /// The alias identifier in use for the bot that contains the session data.
  ///
  /// Parameter [botId] :
  /// The identifier of the bot that contains the session data.
  ///
  /// Parameter [localeId] :
  /// The locale where the session is in use.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the session to delete.
  Future<DeleteSessionResponse> deleteSession({
    required String botAliasId,
    required String botId,
    required String localeId,
    required String sessionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botAliases/${Uri.encodeComponent(botAliasId)}/botLocales/${Uri.encodeComponent(localeId)}/sessions/${Uri.encodeComponent(sessionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSessionResponse.fromJson(response);
  }

  /// Returns session information for a specified bot, alias, and user.
  ///
  /// For example, you can use this operation to retrieve session information
  /// for a user that has left a long-running session in use.
  ///
  /// If the bot, alias, or session identifier doesn't exist, Amazon Lex V2
  /// returns a <code>BadRequestException</code>. If the locale doesn't exist or
  /// is not enabled for the alias, you receive a
  /// <code>BadRequestException</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [botAliasId] :
  /// The alias identifier in use for the bot that contains the session data.
  ///
  /// Parameter [botId] :
  /// The identifier of the bot that contains the session data.
  ///
  /// Parameter [localeId] :
  /// The locale where the session is in use.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the session to return.
  Future<GetSessionResponse> getSession({
    required String botAliasId,
    required String botId,
    required String localeId,
    required String sessionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botAliases/${Uri.encodeComponent(botAliasId)}/botLocales/${Uri.encodeComponent(localeId)}/sessions/${Uri.encodeComponent(sessionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSessionResponse.fromJson(response);
  }

  /// Creates a new session or modifies an existing session with an Amazon Lex
  /// V2 bot. Use this operation to enable your application to set the state of
  /// the bot.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadGatewayException].
  /// May throw [ConflictException].
  /// May throw [DependencyFailedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [botAliasId] :
  /// The alias identifier of the bot that receives the session data.
  ///
  /// Parameter [botId] :
  /// The identifier of the bot that receives the session data.
  ///
  /// Parameter [localeId] :
  /// The locale where the session is in use.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the session that receives the session data.
  ///
  /// Parameter [sessionState] :
  /// Sets the state of the session with the user. You can use this to set the
  /// current intent, attributes, context, and dialog action. Use the dialog
  /// action to determine the next step that Amazon Lex V2 should use in the
  /// conversation with the user.
  ///
  /// Parameter [messages] :
  /// A list of messages to send to the user. Messages are sent in the order
  /// that they are defined in the list.
  ///
  /// Parameter [requestAttributes] :
  /// Request-specific information passed between Amazon Lex V2 and the client
  /// application.
  ///
  /// The namespace <code>x-amz-lex:</code> is reserved for special attributes.
  /// Don't create any request attributes with the prefix
  /// <code>x-amz-lex:</code>.
  ///
  /// Parameter [responseContentType] :
  /// The message that Amazon Lex V2 returns in the response can be either text
  /// or speech depending on the value of this parameter.
  ///
  /// <ul>
  /// <li>
  /// If the value is <code>text/plain; charset=utf-8</code>, Amazon Lex V2
  /// returns text in the response.
  /// </li>
  /// </ul>
  Future<PutSessionResponse> putSession({
    required String botAliasId,
    required String botId,
    required String localeId,
    required String sessionId,
    required SessionState sessionState,
    List<Message>? messages,
    Map<String, String>? requestAttributes,
    String? responseContentType,
  }) async {
    final headers = <String, String>{
      if (responseContentType != null)
        'ResponseContentType': responseContentType.toString(),
    };
    final $payload = <String, dynamic>{
      'sessionState': sessionState,
      if (messages != null) 'messages': messages,
      if (requestAttributes != null) 'requestAttributes': requestAttributes,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botAliases/${Uri.encodeComponent(botAliasId)}/botLocales/${Uri.encodeComponent(localeId)}/sessions/${Uri.encodeComponent(sessionId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return PutSessionResponse(
      audioStream: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      messages:
          _s.extractHeaderStringValue(response.headers, 'x-amz-lex-messages'),
      requestAttributes: _s.extractHeaderStringValue(
          response.headers, 'x-amz-lex-request-attributes'),
      sessionId:
          _s.extractHeaderStringValue(response.headers, 'x-amz-lex-session-id'),
      sessionState: _s.extractHeaderStringValue(
          response.headers, 'x-amz-lex-session-state'),
    );
  }

  /// Sends user input to Amazon Lex V2. Client applications use this API to
  /// send requests to Amazon Lex V2 at runtime. Amazon Lex V2 then interprets
  /// the user input using the machine learning model that it build for the bot.
  ///
  /// In response, Amazon Lex V2 returns the next message to convey to the user
  /// and an optional response card to display.
  ///
  /// If the optional post-fulfillment response is specified, the messages are
  /// returned as follows. For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/API_PostFulfillmentStatusSpecification.html">PostFulfillmentStatusSpecification</a>.
  ///
  /// <ul>
  /// <li>
  /// <b>Success message</b> - Returned if the Lambda function completes
  /// successfully and the intent state is fulfilled or ready fulfillment if the
  /// message is present.
  /// </li>
  /// <li>
  /// <b>Failed message</b> - The failed message is returned if the Lambda
  /// function throws an exception or if the Lambda function returns a failed
  /// intent state without a message.
  /// </li>
  /// <li>
  /// <b>Timeout message</b> - If you don't configure a timeout message and a
  /// timeout, and the Lambda function doesn't return within 30 seconds, the
  /// timeout message is returned. If you configure a timeout, the timeout
  /// message is returned when the period times out.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/streaming-progress.html#progress-complete.html">Completion
  /// message</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadGatewayException].
  /// May throw [ConflictException].
  /// May throw [DependencyFailedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [botAliasId] :
  /// The alias identifier in use for the bot that processes the request.
  ///
  /// Parameter [botId] :
  /// The identifier of the bot that processes the request.
  ///
  /// Parameter [localeId] :
  /// The locale where the session is in use.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the user session that is having the conversation.
  ///
  /// Parameter [text] :
  /// The text that the user entered. Amazon Lex V2 interprets this text.
  ///
  /// Parameter [requestAttributes] :
  /// Request-specific information passed between the client application and
  /// Amazon Lex V2
  ///
  /// The namespace <code>x-amz-lex:</code> is reserved for special attributes.
  /// Don't create any request attributes with the prefix
  /// <code>x-amz-lex:</code>.
  ///
  /// Parameter [sessionState] :
  /// The current state of the dialog between the user and the bot.
  Future<RecognizeTextResponse> recognizeText({
    required String botAliasId,
    required String botId,
    required String localeId,
    required String sessionId,
    required String text,
    Map<String, String>? requestAttributes,
    SessionState? sessionState,
  }) async {
    final $payload = <String, dynamic>{
      'text': text,
      if (requestAttributes != null) 'requestAttributes': requestAttributes,
      if (sessionState != null) 'sessionState': sessionState,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botAliases/${Uri.encodeComponent(botAliasId)}/botLocales/${Uri.encodeComponent(localeId)}/sessions/${Uri.encodeComponent(sessionId)}/text',
      exceptionFnMap: _exceptionFns,
    );
    return RecognizeTextResponse.fromJson(response);
  }

  /// Sends user input to Amazon Lex V2. You can send text or speech. Clients
  /// use this API to send text and audio requests to Amazon Lex V2 at runtime.
  /// Amazon Lex V2 interprets the user input using the machine learning model
  /// built for the bot.
  ///
  /// The following request fields must be compressed with gzip and then base64
  /// encoded before you send them to Amazon Lex V2.
  ///
  /// <ul>
  /// <li>
  /// requestAttributes
  /// </li>
  /// <li>
  /// sessionState
  /// </li>
  /// </ul>
  /// The following response fields are compressed using gzip and then base64
  /// encoded by Amazon Lex V2. Before you can use these fields, you must decode
  /// and decompress them.
  ///
  /// <ul>
  /// <li>
  /// inputTranscript
  /// </li>
  /// <li>
  /// interpretations
  /// </li>
  /// <li>
  /// messages
  /// </li>
  /// <li>
  /// requestAttributes
  /// </li>
  /// <li>
  /// sessionState
  /// </li>
  /// </ul>
  /// The example contains a Java application that compresses and encodes a Java
  /// object to send to Amazon Lex V2, and a second that decodes and
  /// decompresses a response from Amazon Lex V2.
  ///
  /// If the optional post-fulfillment response is specified, the messages are
  /// returned as follows. For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/API_PostFulfillmentStatusSpecification.html">PostFulfillmentStatusSpecification</a>.
  ///
  /// <ul>
  /// <li>
  /// <b>Success message</b> - Returned if the Lambda function completes
  /// successfully and the intent state is fulfilled or ready fulfillment if the
  /// message is present.
  /// </li>
  /// <li>
  /// <b>Failed message</b> - The failed message is returned if the Lambda
  /// function throws an exception or if the Lambda function returns a failed
  /// intent state without a message.
  /// </li>
  /// <li>
  /// <b>Timeout message</b> - If you don't configure a timeout message and a
  /// timeout, and the Lambda function doesn't return within 30 seconds, the
  /// timeout message is returned. If you configure a timeout, the timeout
  /// message is returned when the period times out.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/streaming-progress.html#progress-complete.html">Completion
  /// message</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadGatewayException].
  /// May throw [ConflictException].
  /// May throw [DependencyFailedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [botAliasId] :
  /// The alias identifier in use for the bot that should receive the request.
  ///
  /// Parameter [botId] :
  /// The identifier of the bot that should receive the request.
  ///
  /// Parameter [localeId] :
  /// The locale where the session is in use.
  ///
  /// Parameter [requestContentType] :
  /// Indicates the format for audio input or that the content is text. The
  /// header must start with one of the following prefixes:
  ///
  /// <ul>
  /// <li>
  /// PCM format, audio data must be in little-endian byte order.
  ///
  /// <ul>
  /// <li>
  /// audio/l16; rate=16000; channels=1
  /// </li>
  /// <li>
  /// audio/x-l16; sample-rate=16000; channel-count=1
  /// </li>
  /// <li>
  /// audio/lpcm; sample-rate=8000; sample-size-bits=16; channel-count=1;
  /// is-big-endian=false
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Opus format
  ///
  /// <ul>
  /// <li>
  /// audio/x-cbr-opus-with-preamble;preamble-size=0;bit-rate=256000;frame-size-milliseconds=4
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Text format
  ///
  /// <ul>
  /// <li>
  /// text/plain; charset=utf-8
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [sessionId] :
  /// The identifier of the session in use.
  ///
  /// Parameter [inputStream] :
  /// User input in PCM or Opus audio format or text format as described in the
  /// <code>requestContentType</code> parameter.
  ///
  /// Parameter [requestAttributes] :
  /// Request-specific information passed between the client application and
  /// Amazon Lex V2
  ///
  /// The namespace <code>x-amz-lex:</code> is reserved for special attributes.
  /// Don't create any request attributes for prefix <code>x-amz-lex:</code>.
  ///
  /// The <code>requestAttributes</code> field must be compressed using gzip and
  /// then base64 encoded before sending to Amazon Lex V2.
  ///
  /// Parameter [responseContentType] :
  /// The message that Amazon Lex V2 returns in the response can be either text
  /// or speech based on the <code>responseContentType</code> value.
  ///
  /// <ul>
  /// <li>
  /// If the value is <code>text/plain;charset=utf-8</code>, Amazon Lex V2
  /// returns text in the response.
  /// </li>
  /// <li>
  /// If the value begins with <code>audio/</code>, Amazon Lex V2 returns speech
  /// in the response. Amazon Lex V2 uses Amazon Polly to generate the speech
  /// using the configuration that you specified in the
  /// <code>responseContentType</code> parameter. For example, if you specify
  /// <code>audio/mpeg</code> as the value, Amazon Lex V2 returns speech in the
  /// MPEG format.
  /// </li>
  /// <li>
  /// If the value is <code>audio/pcm</code>, the speech returned is
  /// <code>audio/pcm</code> at 16 KHz in 16-bit, little-endian format.
  /// </li>
  /// <li>
  /// The following are the accepted values:
  ///
  /// <ul>
  /// <li>
  /// audio/mpeg
  /// </li>
  /// <li>
  /// audio/ogg
  /// </li>
  /// <li>
  /// audio/pcm (16 KHz)
  /// </li>
  /// <li>
  /// audio/* (defaults to mpeg)
  /// </li>
  /// <li>
  /// text/plain; charset=utf-8
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [sessionState] :
  /// Sets the state of the session with the user. You can use this to set the
  /// current intent, attributes, context, and dialog action. Use the dialog
  /// action to determine the next step that Amazon Lex V2 should use in the
  /// conversation with the user.
  ///
  /// The <code>sessionState</code> field must be compressed using gzip and then
  /// base64 encoded before sending to Amazon Lex V2.
  Future<RecognizeUtteranceResponse> recognizeUtterance({
    required String botAliasId,
    required String botId,
    required String localeId,
    required String requestContentType,
    required String sessionId,
    Uint8List? inputStream,
    String? requestAttributes,
    String? responseContentType,
    String? sessionState,
  }) async {
    final headers = <String, String>{
      'Content-Type': requestContentType.toString(),
      if (requestAttributes != null)
        'x-amz-lex-request-attributes': requestAttributes.toString(),
      if (responseContentType != null)
        'Response-Content-Type': responseContentType.toString(),
      if (sessionState != null)
        'x-amz-lex-session-state': sessionState.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: inputStream,
      method: 'POST',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botAliases/${Uri.encodeComponent(botAliasId)}/botLocales/${Uri.encodeComponent(localeId)}/sessions/${Uri.encodeComponent(sessionId)}/utterance',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return RecognizeUtteranceResponse(
      audioStream: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      inputMode:
          _s.extractHeaderStringValue(response.headers, 'x-amz-lex-input-mode'),
      inputTranscript: _s.extractHeaderStringValue(
          response.headers, 'x-amz-lex-input-transcript'),
      interpretations: _s.extractHeaderStringValue(
          response.headers, 'x-amz-lex-interpretations'),
      messages:
          _s.extractHeaderStringValue(response.headers, 'x-amz-lex-messages'),
      recognizedBotMember: _s.extractHeaderStringValue(
          response.headers, 'x-amz-lex-recognized-bot-member'),
      requestAttributes: _s.extractHeaderStringValue(
          response.headers, 'x-amz-lex-request-attributes'),
      sessionId:
          _s.extractHeaderStringValue(response.headers, 'x-amz-lex-session-id'),
      sessionState: _s.extractHeaderStringValue(
          response.headers, 'x-amz-lex-session-state'),
    );
  }

  /// Starts an HTTP/2 bidirectional event stream that enables you to send
  /// audio, text, or DTMF input in real time. After your application starts a
  /// conversation, users send input to Amazon Lex V2 as a stream of events.
  /// Amazon Lex V2 processes the incoming events and responds with streaming
  /// text or audio events.
  ///
  /// Audio input must be in the following format: <code>audio/lpcm
  /// sample-rate=8000 sample-size-bits=16 channel-count=1;
  /// is-big-endian=false</code>.
  ///
  /// If the optional post-fulfillment response is specified, the messages are
  /// returned as follows. For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/API_PostFulfillmentStatusSpecification.html">PostFulfillmentStatusSpecification</a>.
  ///
  /// <ul>
  /// <li>
  /// <b>Success message</b> - Returned if the Lambda function completes
  /// successfully and the intent state is fulfilled or ready fulfillment if the
  /// message is present.
  /// </li>
  /// <li>
  /// <b>Failed message</b> - The failed message is returned if the Lambda
  /// function throws an exception or if the Lambda function returns a failed
  /// intent state without a message.
  /// </li>
  /// <li>
  /// <b>Timeout message</b> - If you don't configure a timeout message and a
  /// timeout, and the Lambda function doesn't return within 30 seconds, the
  /// timeout message is returned. If you configure a timeout, the timeout
  /// message is returned when the period times out.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/streaming-progress.html#progress-complete.html">Completion
  /// message</a>.
  ///
  /// If the optional update message is configured, it is played at the
  /// specified frequency while the Lambda function is running and the update
  /// message state is active. If the fulfillment update message is not active,
  /// the Lambda function runs with a 30 second timeout.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/streaming-progress.html#progress-update.html">Update
  /// message </a>
  ///
  /// The <code>StartConversation</code> operation is supported only in the
  /// following SDKs:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/goto/SdkForCpp/runtime.lex.v2-2020-08-07/StartConversation">AWS
  /// SDK for C++</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/goto/SdkForJavaV2/runtime.lex.v2-2020-08-07/StartConversation">AWS
  /// SDK for Java V2</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/goto/SdkForRubyV3/runtime.lex.v2-2020-08-07/StartConversation">AWS
  /// SDK for Ruby V3</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [botAliasId] :
  /// The alias identifier in use for the bot that processes the request.
  ///
  /// Parameter [botId] :
  /// The identifier of the bot to process the request.
  ///
  /// Parameter [localeId] :
  /// The locale where the session is in use.
  ///
  /// Parameter [requestEventStream] :
  /// Represents the stream of events to Amazon Lex V2 from your application.
  /// The events are encoded as HTTP/2 data frames.
  ///
  /// Parameter [sessionId] :
  /// The identifier of the user session that is having the conversation.
  ///
  /// Parameter [conversationMode] :
  /// The conversation type that you are using the Amazon Lex V2. If the
  /// conversation mode is <code>AUDIO</code> you can send both audio and DTMF
  /// information. If the mode is <code>TEXT</code> you can only send text.
  Future<StartConversationResponse> startConversation({
    required String botAliasId,
    required String botId,
    required String localeId,
    required StartConversationRequestEventStream requestEventStream,
    required String sessionId,
    ConversationMode? conversationMode,
  }) async {
    final headers = <String, String>{
      if (conversationMode != null)
        'x-amz-lex-conversation-mode': conversationMode.value,
    };
    final response = await _protocol.sendRaw(
      payload: requestEventStream,
      method: 'POST',
      requestUri:
          '/bots/${Uri.encodeComponent(botId)}/botAliases/${Uri.encodeComponent(botAliasId)}/botLocales/${Uri.encodeComponent(localeId)}/sessions/${Uri.encodeComponent(sessionId)}/conversation',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return StartConversationResponse(
      responseEventStream: StartConversationResponseEventStream.fromJson($json),
    );
  }
}

class DeleteSessionResponse {
  /// The alias identifier in use for the bot that contained the session data.
  final String? botAliasId;

  /// The identifier of the bot that contained the session data.
  final String? botId;

  /// The locale where the session was used.
  final String? localeId;

  /// The identifier of the deleted session.
  final String? sessionId;

  DeleteSessionResponse({
    this.botAliasId,
    this.botId,
    this.localeId,
    this.sessionId,
  });

  factory DeleteSessionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSessionResponse(
      botAliasId: json['botAliasId'] as String?,
      botId: json['botId'] as String?,
      localeId: json['localeId'] as String?,
      sessionId: json['sessionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botAliasId = this.botAliasId;
    final botId = this.botId;
    final localeId = this.localeId;
    final sessionId = this.sessionId;
    return {
      if (botAliasId != null) 'botAliasId': botAliasId,
      if (botId != null) 'botId': botId,
      if (localeId != null) 'localeId': localeId,
      if (sessionId != null) 'sessionId': sessionId,
    };
  }
}

///
class AccessDeniedException implements _s.AwsException {
  final String? message;

  AccessDeniedException({
    this.message,
  });

  factory AccessDeniedException.fromJson(Map<String, dynamic> json) {
    return AccessDeniedException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

///
class ConflictException implements _s.AwsException {
  final String? message;

  ConflictException({
    this.message,
  });

  factory ConflictException.fromJson(Map<String, dynamic> json) {
    return ConflictException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

///
class InternalServerException implements _s.AwsException {
  final String? message;

  InternalServerException({
    this.message,
  });

  factory InternalServerException.fromJson(Map<String, dynamic> json) {
    return InternalServerException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

///
class ResourceNotFoundException implements _s.AwsException {
  final String? message;

  ResourceNotFoundException({
    this.message,
  });

  factory ResourceNotFoundException.fromJson(Map<String, dynamic> json) {
    return ResourceNotFoundException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

///
class ThrottlingException implements _s.AwsException {
  final String? message;

  ThrottlingException({
    this.message,
  });

  factory ThrottlingException.fromJson(Map<String, dynamic> json) {
    return ThrottlingException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

///
class ValidationException implements _s.AwsException {
  final String? message;

  ValidationException({
    this.message,
  });

  factory ValidationException.fromJson(Map<String, dynamic> json) {
    return ValidationException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

class GetSessionResponse {
  /// A list of intents that Amazon Lex V2 determined might satisfy the user's
  /// utterance.
  ///
  /// Each interpretation includes the intent, a score that indicates how
  /// confident Amazon Lex V2 is that the interpretation is the correct one, and
  /// an optional sentiment response that indicates the sentiment expressed in the
  /// utterance.
  final List<Interpretation>? interpretations;

  /// A list of messages that were last sent to the user. The messages are ordered
  /// based on the order that your returned the messages from your Lambda function
  /// or the order that messages are defined in the bot.
  final List<Message>? messages;

  /// The identifier of the returned session.
  final String? sessionId;

  /// Represents the current state of the dialog between the user and the bot.
  ///
  /// You can use this to determine the progress of the conversation and what the
  /// next action might be.
  final SessionState? sessionState;

  GetSessionResponse({
    this.interpretations,
    this.messages,
    this.sessionId,
    this.sessionState,
  });

  factory GetSessionResponse.fromJson(Map<String, dynamic> json) {
    return GetSessionResponse(
      interpretations: (json['interpretations'] as List?)
          ?.nonNulls
          .map((e) => Interpretation.fromJson(e as Map<String, dynamic>))
          .toList(),
      messages: (json['messages'] as List?)
          ?.nonNulls
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      sessionId: json['sessionId'] as String?,
      sessionState: json['sessionState'] != null
          ? SessionState.fromJson(json['sessionState'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final interpretations = this.interpretations;
    final messages = this.messages;
    final sessionId = this.sessionId;
    final sessionState = this.sessionState;
    return {
      if (interpretations != null) 'interpretations': interpretations,
      if (messages != null) 'messages': messages,
      if (sessionId != null) 'sessionId': sessionId,
      if (sessionState != null) 'sessionState': sessionState,
    };
  }
}

class PutSessionResponse {
  /// If the requested content type was audio, the audio version of the message to
  /// convey to the user.
  final Uint8List? audioStream;

  /// The type of response. Same as the type specified in the
  /// <code>responseContentType</code> field in the request.
  final String? contentType;

  /// A list of messages that were last sent to the user. The messages are ordered
  /// based on how you return the messages from you Lambda function or the order
  /// that the messages are defined in the bot.
  final String? messages;

  /// A base-64-encoded gzipped field that provides request-specific information
  /// passed between the client application and Amazon Lex V2. These are the same
  /// as the <code>requestAttribute</code> parameter in the call to the
  /// <code>PutSession</code> operation.
  final String? requestAttributes;

  /// The identifier of the session that received the data.
  final String? sessionId;

  /// A base-64-encoded gzipped field that represents the current state of the
  /// dialog between the user and the bot. Use this to determine the progress of
  /// the conversation and what the next action may be.
  final String? sessionState;

  PutSessionResponse({
    this.audioStream,
    this.contentType,
    this.messages,
    this.requestAttributes,
    this.sessionId,
    this.sessionState,
  });

  Map<String, dynamic> toJson() {
    final audioStream = this.audioStream;
    final contentType = this.contentType;
    final messages = this.messages;
    final requestAttributes = this.requestAttributes;
    final sessionId = this.sessionId;
    final sessionState = this.sessionState;
    return {
      if (audioStream != null) 'audioStream': base64Encode(audioStream),
    };
  }
}

///
class BadGatewayException implements _s.AwsException {
  final String? message;

  BadGatewayException({
    this.message,
  });

  factory BadGatewayException.fromJson(Map<String, dynamic> json) {
    return BadGatewayException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

///
class DependencyFailedException implements _s.AwsException {
  final String? message;

  DependencyFailedException({
    this.message,
  });

  factory DependencyFailedException.fromJson(Map<String, dynamic> json) {
    return DependencyFailedException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

class RecognizeTextResponse {
  /// A list of intents that Amazon Lex V2 determined might satisfy the user's
  /// utterance.
  ///
  /// Each interpretation includes the intent, a score that indicates now
  /// confident Amazon Lex V2 is that the interpretation is the correct one, and
  /// an optional sentiment response that indicates the sentiment expressed in the
  /// utterance.
  final List<Interpretation>? interpretations;

  /// A list of messages last sent to the user. The messages are ordered based on
  /// the order that you returned the messages from your Lambda function or the
  /// order that the messages are defined in the bot.
  final List<Message>? messages;

  /// The bot member that recognized the text.
  final RecognizedBotMember? recognizedBotMember;

  /// The attributes sent in the request.
  final Map<String, String>? requestAttributes;

  /// The identifier of the session in use.
  final String? sessionId;

  /// Represents the current state of the dialog between the user and the bot.
  ///
  /// Use this to determine the progress of the conversation and what the next
  /// action may be.
  final SessionState? sessionState;

  RecognizeTextResponse({
    this.interpretations,
    this.messages,
    this.recognizedBotMember,
    this.requestAttributes,
    this.sessionId,
    this.sessionState,
  });

  factory RecognizeTextResponse.fromJson(Map<String, dynamic> json) {
    return RecognizeTextResponse(
      interpretations: (json['interpretations'] as List?)
          ?.nonNulls
          .map((e) => Interpretation.fromJson(e as Map<String, dynamic>))
          .toList(),
      messages: (json['messages'] as List?)
          ?.nonNulls
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      recognizedBotMember: json['recognizedBotMember'] != null
          ? RecognizedBotMember.fromJson(
              json['recognizedBotMember'] as Map<String, dynamic>)
          : null,
      requestAttributes: (json['requestAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      sessionId: json['sessionId'] as String?,
      sessionState: json['sessionState'] != null
          ? SessionState.fromJson(json['sessionState'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final interpretations = this.interpretations;
    final messages = this.messages;
    final recognizedBotMember = this.recognizedBotMember;
    final requestAttributes = this.requestAttributes;
    final sessionId = this.sessionId;
    final sessionState = this.sessionState;
    return {
      if (interpretations != null) 'interpretations': interpretations,
      if (messages != null) 'messages': messages,
      if (recognizedBotMember != null)
        'recognizedBotMember': recognizedBotMember,
      if (requestAttributes != null) 'requestAttributes': requestAttributes,
      if (sessionId != null) 'sessionId': sessionId,
      if (sessionState != null) 'sessionState': sessionState,
    };
  }
}

class RecognizeUtteranceResponse {
  /// The prompt or statement to send to the user. This is based on the bot
  /// configuration and context. For example, if Amazon Lex V2 did not understand
  /// the user intent, it sends the <code>clarificationPrompt</code> configured
  /// for the bot. If the intent requires confirmation before taking the
  /// fulfillment action, it sends the <code>confirmationPrompt</code>. Another
  /// example: Suppose that the Lambda function successfully fulfilled the intent,
  /// and sent a message to convey to the user. Then Amazon Lex V2 sends that
  /// message in the response.
  final Uint8List? audioStream;

  /// Content type as specified in the <code>responseContentType</code> in the
  /// request.
  final String? contentType;

  /// Indicates whether the input mode to the operation was text, speech, or from
  /// a touch-tone keypad.
  final String? inputMode;

  /// The text used to process the request.
  ///
  /// If the input was an audio stream, the <code>inputTranscript</code> field
  /// contains the text extracted from the audio stream. This is the text that is
  /// actually processed to recognize intents and slot values. You can use this
  /// information to determine if Amazon Lex V2 is correctly processing the audio
  /// that you send.
  ///
  /// The <code>inputTranscript</code> field is compressed with gzip and then
  /// base64 encoded. Before you can use the contents of the field, you must
  /// decode and decompress the contents. See the example for a simple function to
  /// decode and decompress the contents.
  final String? inputTranscript;

  /// A list of intents that Amazon Lex V2 determined might satisfy the user's
  /// utterance.
  ///
  /// Each interpretation includes the intent, a score that indicates how
  /// confident Amazon Lex V2 is that the interpretation is the correct one, and
  /// an optional sentiment response that indicates the sentiment expressed in the
  /// utterance.
  ///
  /// The <code>interpretations</code> field is compressed with gzip and then
  /// base64 encoded. Before you can use the contents of the field, you must
  /// decode and decompress the contents. See the example for a simple function to
  /// decode and decompress the contents.
  final String? interpretations;

  /// A list of messages that were last sent to the user. The messages are ordered
  /// based on the order that you returned the messages from your Lambda function
  /// or the order that the messages are defined in the bot.
  ///
  /// The <code>messages</code> field is compressed with gzip and then base64
  /// encoded. Before you can use the contents of the field, you must decode and
  /// decompress the contents. See the example for a simple function to decode and
  /// decompress the contents.
  final String? messages;

  /// The bot member that recognized the utterance.
  final String? recognizedBotMember;

  /// The attributes sent in the request.
  ///
  /// The <code>requestAttributes</code> field is compressed with gzip and then
  /// base64 encoded. Before you can use the contents of the field, you must
  /// decode and decompress the contents.
  final String? requestAttributes;

  /// The identifier of the session in use.
  final String? sessionId;

  /// Represents the current state of the dialog between the user and the bot.
  ///
  /// Use this to determine the progress of the conversation and what the next
  /// action might be.
  ///
  /// The <code>sessionState</code> field is compressed with gzip and then base64
  /// encoded. Before you can use the contents of the field, you must decode and
  /// decompress the contents. See the example for a simple function to decode and
  /// decompress the contents.
  final String? sessionState;

  RecognizeUtteranceResponse({
    this.audioStream,
    this.contentType,
    this.inputMode,
    this.inputTranscript,
    this.interpretations,
    this.messages,
    this.recognizedBotMember,
    this.requestAttributes,
    this.sessionId,
    this.sessionState,
  });

  Map<String, dynamic> toJson() {
    final audioStream = this.audioStream;
    final contentType = this.contentType;
    final inputMode = this.inputMode;
    final inputTranscript = this.inputTranscript;
    final interpretations = this.interpretations;
    final messages = this.messages;
    final recognizedBotMember = this.recognizedBotMember;
    final requestAttributes = this.requestAttributes;
    final sessionId = this.sessionId;
    final sessionState = this.sessionState;
    return {
      if (audioStream != null) 'audioStream': base64Encode(audioStream),
    };
  }
}

class StartConversationResponse {
  /// Represents the stream of events from Amazon Lex V2 to your application. The
  /// events are encoded as HTTP/2 data frames.
  final StartConversationResponseEventStream? responseEventStream;

  StartConversationResponse({
    this.responseEventStream,
  });

  Map<String, dynamic> toJson() {
    final responseEventStream = this.responseEventStream;
    return {
      if (responseEventStream != null)
        'responseEventStream': responseEventStream,
    };
  }
}

/// Represents a stream of events between Amazon Lex V2 and your application.
class StartConversationResponseEventStream {
  /// Exception thrown when the credentials passed with the request are invalid or
  /// expired. Also thrown when the credentials in the request do not have
  /// permission to access the <code>StartConversation</code> operation.
  final AccessDeniedException? accessDeniedException;
  final AudioResponseEvent? audioResponseEvent;
  final BadGatewayException? badGatewayException;

  /// Exception thrown when two clients are using the same AWS account, Amazon Lex
  /// V2 bot, and session ID.
  final ConflictException? conflictException;
  final DependencyFailedException? dependencyFailedException;
  final HeartbeatEvent? heartbeatEvent;

  /// Event sent from Amazon Lex V2 to the client application containing the
  /// current state of the conversation between the user and Amazon Lex V2.
  final IntentResultEvent? intentResultEvent;

  /// An error occurred with Amazon Lex V2.
  final InternalServerException? internalServerException;
  final PlaybackInterruptionEvent? playbackInterruptionEvent;

  /// Exception thrown if one of the input parameters points to a resource that
  /// does not exist. For example, if the bot ID specified does not exist.
  final ResourceNotFoundException? resourceNotFoundException;
  final TextResponseEvent? textResponseEvent;

  /// Exception thrown when your application exceeds the maximum number of
  /// concurrent requests.
  final ThrottlingException? throttlingException;
  final TranscriptEvent? transcriptEvent;

  /// Exception thrown when one or more parameters could not be validated. The
  /// <code>message</code> contains the name of the field that isn't valid.
  final ValidationException? validationException;

  StartConversationResponseEventStream({
    this.accessDeniedException,
    this.audioResponseEvent,
    this.badGatewayException,
    this.conflictException,
    this.dependencyFailedException,
    this.heartbeatEvent,
    this.intentResultEvent,
    this.internalServerException,
    this.playbackInterruptionEvent,
    this.resourceNotFoundException,
    this.textResponseEvent,
    this.throttlingException,
    this.transcriptEvent,
    this.validationException,
  });

  factory StartConversationResponseEventStream.fromJson(
      Map<String, dynamic> json) {
    return StartConversationResponseEventStream(
      accessDeniedException: json['AccessDeniedException'] != null
          ? AccessDeniedException.fromJson(
              json['AccessDeniedException'] as Map<String, dynamic>)
          : null,
      audioResponseEvent: json['AudioResponseEvent'] != null
          ? AudioResponseEvent.fromJson(
              json['AudioResponseEvent'] as Map<String, dynamic>)
          : null,
      badGatewayException: json['BadGatewayException'] != null
          ? BadGatewayException.fromJson(
              json['BadGatewayException'] as Map<String, dynamic>)
          : null,
      conflictException: json['ConflictException'] != null
          ? ConflictException.fromJson(
              json['ConflictException'] as Map<String, dynamic>)
          : null,
      dependencyFailedException: json['DependencyFailedException'] != null
          ? DependencyFailedException.fromJson(
              json['DependencyFailedException'] as Map<String, dynamic>)
          : null,
      heartbeatEvent: json['HeartbeatEvent'] != null
          ? HeartbeatEvent.fromJson(
              json['HeartbeatEvent'] as Map<String, dynamic>)
          : null,
      intentResultEvent: json['IntentResultEvent'] != null
          ? IntentResultEvent.fromJson(
              json['IntentResultEvent'] as Map<String, dynamic>)
          : null,
      internalServerException: json['InternalServerException'] != null
          ? InternalServerException.fromJson(
              json['InternalServerException'] as Map<String, dynamic>)
          : null,
      playbackInterruptionEvent: json['PlaybackInterruptionEvent'] != null
          ? PlaybackInterruptionEvent.fromJson(
              json['PlaybackInterruptionEvent'] as Map<String, dynamic>)
          : null,
      resourceNotFoundException: json['ResourceNotFoundException'] != null
          ? ResourceNotFoundException.fromJson(
              json['ResourceNotFoundException'] as Map<String, dynamic>)
          : null,
      textResponseEvent: json['TextResponseEvent'] != null
          ? TextResponseEvent.fromJson(
              json['TextResponseEvent'] as Map<String, dynamic>)
          : null,
      throttlingException: json['ThrottlingException'] != null
          ? ThrottlingException.fromJson(
              json['ThrottlingException'] as Map<String, dynamic>)
          : null,
      transcriptEvent: json['TranscriptEvent'] != null
          ? TranscriptEvent.fromJson(
              json['TranscriptEvent'] as Map<String, dynamic>)
          : null,
      validationException: json['ValidationException'] != null
          ? ValidationException.fromJson(
              json['ValidationException'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessDeniedException = this.accessDeniedException;
    final audioResponseEvent = this.audioResponseEvent;
    final badGatewayException = this.badGatewayException;
    final conflictException = this.conflictException;
    final dependencyFailedException = this.dependencyFailedException;
    final heartbeatEvent = this.heartbeatEvent;
    final intentResultEvent = this.intentResultEvent;
    final internalServerException = this.internalServerException;
    final playbackInterruptionEvent = this.playbackInterruptionEvent;
    final resourceNotFoundException = this.resourceNotFoundException;
    final textResponseEvent = this.textResponseEvent;
    final throttlingException = this.throttlingException;
    final transcriptEvent = this.transcriptEvent;
    final validationException = this.validationException;
    return {
      if (accessDeniedException != null)
        'AccessDeniedException': accessDeniedException,
      if (audioResponseEvent != null) 'AudioResponseEvent': audioResponseEvent,
      if (badGatewayException != null)
        'BadGatewayException': badGatewayException,
      if (conflictException != null) 'ConflictException': conflictException,
      if (dependencyFailedException != null)
        'DependencyFailedException': dependencyFailedException,
      if (heartbeatEvent != null) 'HeartbeatEvent': heartbeatEvent,
      if (intentResultEvent != null) 'IntentResultEvent': intentResultEvent,
      if (internalServerException != null)
        'InternalServerException': internalServerException,
      if (playbackInterruptionEvent != null)
        'PlaybackInterruptionEvent': playbackInterruptionEvent,
      if (resourceNotFoundException != null)
        'ResourceNotFoundException': resourceNotFoundException,
      if (textResponseEvent != null) 'TextResponseEvent': textResponseEvent,
      if (throttlingException != null)
        'ThrottlingException': throttlingException,
      if (transcriptEvent != null) 'TranscriptEvent': transcriptEvent,
      if (validationException != null)
        'ValidationException': validationException,
    };
  }
}

/// Event sent from Amazon Lex V2 to indicate to the client application should
/// stop playback of audio. For example, if the client is playing a prompt that
/// asks for the user's telephone number, the user might start to say the phone
/// number before the prompt is complete. Amazon Lex V2 sends this event to the
/// client application to indicate that the user is responding and that Amazon
/// Lex V2 is processing their input.
class PlaybackInterruptionEvent {
  /// The identifier of the event that contained the audio, DTMF, or text that
  /// caused the interruption.
  final String? causedByEventId;

  /// A unique identifier of the event sent by Amazon Lex V2. The identifier is in
  /// the form <code>RESPONSE-N</code>, where N is a number starting with one and
  /// incremented for each event sent by Amazon Lex V2 in the current session.
  final String? eventId;

  /// Indicates the type of user input that Amazon Lex V2 detected.
  final PlaybackInterruptionReason? eventReason;

  PlaybackInterruptionEvent({
    this.causedByEventId,
    this.eventId,
    this.eventReason,
  });

  factory PlaybackInterruptionEvent.fromJson(Map<String, dynamic> json) {
    return PlaybackInterruptionEvent(
      causedByEventId: json['causedByEventId'] as String?,
      eventId: json['eventId'] as String?,
      eventReason: (json['eventReason'] as String?)
          ?.let(PlaybackInterruptionReason.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final causedByEventId = this.causedByEventId;
    final eventId = this.eventId;
    final eventReason = this.eventReason;
    return {
      if (causedByEventId != null) 'causedByEventId': causedByEventId,
      if (eventId != null) 'eventId': eventId,
      if (eventReason != null) 'eventReason': eventReason.value,
    };
  }
}

/// Event sent from Amazon Lex V2 to your client application that contains a
/// transcript of voice audio.
class TranscriptEvent {
  /// A unique identifier of the event sent by Amazon Lex V2. The identifier is in
  /// the form <code>RESPONSE-N</code>, where N is a number starting with one and
  /// incremented for each event sent by Amazon Lex V2 in the current session.
  final String? eventId;

  /// The transcript of the voice audio from the user.
  final String? transcript;

  TranscriptEvent({
    this.eventId,
    this.transcript,
  });

  factory TranscriptEvent.fromJson(Map<String, dynamic> json) {
    return TranscriptEvent(
      eventId: json['eventId'] as String?,
      transcript: json['transcript'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventId = this.eventId;
    final transcript = this.transcript;
    return {
      if (eventId != null) 'eventId': eventId,
      if (transcript != null) 'transcript': transcript,
    };
  }
}

/// Contains the current state of the conversation between the client
/// application and Amazon Lex V2.
class IntentResultEvent {
  /// A unique identifier of the event sent by Amazon Lex V2. The identifier is in
  /// the form <code>RESPONSE-N</code>, where N is a number starting with one and
  /// incremented for each event sent by Amazon Lex V2 in the current session.
  final String? eventId;

  /// Indicates whether the input to the operation was text, speech, or from a
  /// touch-tone keypad.
  final InputMode? inputMode;

  /// A list of intents that Amazon Lex V2 determined might satisfy the user's
  /// utterance.
  ///
  /// Each interpretation includes the intent, a score that indicates how
  /// confident Amazon Lex V2 is that the interpretation is the correct one, and
  /// an optional sentiment response that indicates the sentiment expressed in the
  /// utterance.
  final List<Interpretation>? interpretations;

  /// The bot member that is processing the intent.
  final RecognizedBotMember? recognizedBotMember;

  /// The attributes sent in the request.
  final Map<String, String>? requestAttributes;

  /// The identifier of the session in use.
  final String? sessionId;
  final SessionState? sessionState;

  IntentResultEvent({
    this.eventId,
    this.inputMode,
    this.interpretations,
    this.recognizedBotMember,
    this.requestAttributes,
    this.sessionId,
    this.sessionState,
  });

  factory IntentResultEvent.fromJson(Map<String, dynamic> json) {
    return IntentResultEvent(
      eventId: json['eventId'] as String?,
      inputMode: (json['inputMode'] as String?)?.let(InputMode.fromString),
      interpretations: (json['interpretations'] as List?)
          ?.nonNulls
          .map((e) => Interpretation.fromJson(e as Map<String, dynamic>))
          .toList(),
      recognizedBotMember: json['recognizedBotMember'] != null
          ? RecognizedBotMember.fromJson(
              json['recognizedBotMember'] as Map<String, dynamic>)
          : null,
      requestAttributes: (json['requestAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      sessionId: json['sessionId'] as String?,
      sessionState: json['sessionState'] != null
          ? SessionState.fromJson(json['sessionState'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eventId = this.eventId;
    final inputMode = this.inputMode;
    final interpretations = this.interpretations;
    final recognizedBotMember = this.recognizedBotMember;
    final requestAttributes = this.requestAttributes;
    final sessionId = this.sessionId;
    final sessionState = this.sessionState;
    return {
      if (eventId != null) 'eventId': eventId,
      if (inputMode != null) 'inputMode': inputMode.value,
      if (interpretations != null) 'interpretations': interpretations,
      if (recognizedBotMember != null)
        'recognizedBotMember': recognizedBotMember,
      if (requestAttributes != null) 'requestAttributes': requestAttributes,
      if (sessionId != null) 'sessionId': sessionId,
      if (sessionState != null) 'sessionState': sessionState,
    };
  }
}

/// The event sent from Amazon Lex V2 to your application with text to present
/// to the user.
class TextResponseEvent {
  /// A unique identifier of the event sent by Amazon Lex V2. The identifier is in
  /// the form <code>RESPONSE-N</code>, where N is a number starting with one and
  /// incremented for each event sent by Amazon Lex V2 in the current session.
  final String? eventId;

  /// A list of messages to send to the user. Messages are ordered based on the
  /// order that you returned the messages from your Lambda function or the order
  /// that the messages are defined in the bot.
  final List<Message>? messages;

  TextResponseEvent({
    this.eventId,
    this.messages,
  });

  factory TextResponseEvent.fromJson(Map<String, dynamic> json) {
    return TextResponseEvent(
      eventId: json['eventId'] as String?,
      messages: (json['messages'] as List?)
          ?.nonNulls
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final eventId = this.eventId;
    final messages = this.messages;
    return {
      if (eventId != null) 'eventId': eventId,
      if (messages != null) 'messages': messages,
    };
  }
}

/// An event sent from Amazon Lex V2 to your client application containing audio
/// to play to the user.
class AudioResponseEvent {
  /// A chunk of the audio to play.
  final Uint8List? audioChunk;

  /// The encoding of the audio chunk. This is the same as the encoding configure
  /// in the <code>contentType</code> field of the
  /// <code>ConfigurationEvent</code>.
  final String? contentType;

  /// A unique identifier of the event sent by Amazon Lex V2. The identifier is in
  /// the form <code>RESPONSE-N</code>, where N is a number starting with one and
  /// incremented for each event sent by Amazon Lex V2 in the current session.
  final String? eventId;

  AudioResponseEvent({
    this.audioChunk,
    this.contentType,
    this.eventId,
  });

  factory AudioResponseEvent.fromJson(Map<String, dynamic> json) {
    return AudioResponseEvent(
      audioChunk: _s.decodeNullableUint8List(json['audioChunk'] as String?),
      contentType: json['contentType'] as String?,
      eventId: json['eventId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final audioChunk = this.audioChunk;
    final contentType = this.contentType;
    final eventId = this.eventId;
    return {
      if (audioChunk != null) 'audioChunk': base64Encode(audioChunk),
      if (contentType != null) 'contentType': contentType,
      if (eventId != null) 'eventId': eventId,
    };
  }
}

/// Event that Amazon Lex V2 sends to indicate that the stream is still open
/// between the client application and Amazon Lex V2
class HeartbeatEvent {
  /// A unique identifier of the event sent by Amazon Lex V2. The identifier is in
  /// the form <code>RESPONSE-N</code>, where N is a number starting with one and
  /// incremented for each event sent by Amazon Lex V2 in the current session.
  final String? eventId;

  HeartbeatEvent({
    this.eventId,
  });

  factory HeartbeatEvent.fromJson(Map<String, dynamic> json) {
    return HeartbeatEvent(
      eventId: json['eventId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventId = this.eventId;
    return {
      if (eventId != null) 'eventId': eventId,
    };
  }
}

/// Container for text that is returned to the customer..
class Message {
  /// Indicates the type of response.
  final MessageContentType contentType;

  /// The text of the message.
  final String? content;
  final ImageResponseCard? imageResponseCard;

  Message({
    required this.contentType,
    this.content,
    this.imageResponseCard,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      contentType:
          MessageContentType.fromString((json['contentType'] as String?) ?? ''),
      content: json['content'] as String?,
      imageResponseCard: json['imageResponseCard'] != null
          ? ImageResponseCard.fromJson(
              json['imageResponseCard'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final content = this.content;
    final imageResponseCard = this.imageResponseCard;
    return {
      'contentType': contentType.value,
      if (content != null) 'content': content,
      if (imageResponseCard != null) 'imageResponseCard': imageResponseCard,
    };
  }
}

class MessageContentType {
  static const customPayload = MessageContentType._('CustomPayload');
  static const imageResponseCard = MessageContentType._('ImageResponseCard');
  static const plainText = MessageContentType._('PlainText');
  static const ssml = MessageContentType._('SSML');

  final String value;

  const MessageContentType._(this.value);

  static const values = [customPayload, imageResponseCard, plainText, ssml];

  static MessageContentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MessageContentType._(value));

  @override
  bool operator ==(other) =>
      other is MessageContentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A card that is shown to the user by a messaging platform. You define the
/// contents of the card, the card is displayed by the platform.
///
/// When you use a response card, the response from the user is constrained to
/// the text associated with a button on the card.
class ImageResponseCard {
  /// The title to display on the response card. The format of the title is
  /// determined by the platform displaying the response card.
  final String title;

  /// A list of buttons that should be displayed on the response card. The
  /// arrangement of the buttons is determined by the platform that displays the
  /// button.
  final List<Button>? buttons;

  /// The URL of an image to display on the response card. The image URL must be
  /// publicly available so that the platform displaying the response card has
  /// access to the image.
  final String? imageUrl;

  /// The subtitle to display on the response card. The format of the subtitle is
  /// determined by the platform displaying the response card.
  final String? subtitle;

  ImageResponseCard({
    required this.title,
    this.buttons,
    this.imageUrl,
    this.subtitle,
  });

  factory ImageResponseCard.fromJson(Map<String, dynamic> json) {
    return ImageResponseCard(
      title: (json['title'] as String?) ?? '',
      buttons: (json['buttons'] as List?)
          ?.nonNulls
          .map((e) => Button.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageUrl: json['imageUrl'] as String?,
      subtitle: json['subtitle'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final title = this.title;
    final buttons = this.buttons;
    final imageUrl = this.imageUrl;
    final subtitle = this.subtitle;
    return {
      'title': title,
      if (buttons != null) 'buttons': buttons,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (subtitle != null) 'subtitle': subtitle,
    };
  }
}

/// A button that appears on a response card show to the user.
class Button {
  /// The text that is displayed on the button.
  final String text;

  /// The value returned to Amazon Lex V2 when a user chooses the button.
  final String value;

  Button({
    required this.text,
    required this.value,
  });

  factory Button.fromJson(Map<String, dynamic> json) {
    return Button(
      text: (json['text'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final value = this.value;
    return {
      'text': text,
      'value': value,
    };
  }
}

class InputMode {
  static const text = InputMode._('Text');
  static const speech = InputMode._('Speech');
  static const dtmf = InputMode._('DTMF');

  final String value;

  const InputMode._(this.value);

  static const values = [text, speech, dtmf];

  static InputMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => InputMode._(value));

  @override
  bool operator ==(other) => other is InputMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The state of the user's session with Amazon Lex V2.
class SessionState {
  /// One or more contexts that indicate to Amazon Lex V2 the context of a
  /// request. When a context is active, Amazon Lex V2 considers intents with the
  /// matching context as a trigger as the next intent in a session.
  final List<ActiveContext>? activeContexts;

  /// The next step that Amazon Lex V2 should take in the conversation with a
  /// user.
  final DialogAction? dialogAction;

  /// The active intent that Amazon Lex V2 is processing.
  final Intent? intent;

  /// A unique identifier for a specific request.
  final String? originatingRequestId;

  /// Hints for phrases that a customer is likely to use for a slot. Amazon Lex V2
  /// uses the hints to help determine the correct value of a slot.
  final RuntimeHints? runtimeHints;

  /// Map of key/value pairs representing session-specific context information. It
  /// contains application information passed between Amazon Lex V2 and a client
  /// application.
  final Map<String, String>? sessionAttributes;

  SessionState({
    this.activeContexts,
    this.dialogAction,
    this.intent,
    this.originatingRequestId,
    this.runtimeHints,
    this.sessionAttributes,
  });

  factory SessionState.fromJson(Map<String, dynamic> json) {
    return SessionState(
      activeContexts: (json['activeContexts'] as List?)
          ?.nonNulls
          .map((e) => ActiveContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      dialogAction: json['dialogAction'] != null
          ? DialogAction.fromJson(json['dialogAction'] as Map<String, dynamic>)
          : null,
      intent: json['intent'] != null
          ? Intent.fromJson(json['intent'] as Map<String, dynamic>)
          : null,
      originatingRequestId: json['originatingRequestId'] as String?,
      runtimeHints: json['runtimeHints'] != null
          ? RuntimeHints.fromJson(json['runtimeHints'] as Map<String, dynamic>)
          : null,
      sessionAttributes: (json['sessionAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final activeContexts = this.activeContexts;
    final dialogAction = this.dialogAction;
    final intent = this.intent;
    final originatingRequestId = this.originatingRequestId;
    final runtimeHints = this.runtimeHints;
    final sessionAttributes = this.sessionAttributes;
    return {
      if (activeContexts != null) 'activeContexts': activeContexts,
      if (dialogAction != null) 'dialogAction': dialogAction,
      if (intent != null) 'intent': intent,
      if (originatingRequestId != null)
        'originatingRequestId': originatingRequestId,
      if (runtimeHints != null) 'runtimeHints': runtimeHints,
      if (sessionAttributes != null) 'sessionAttributes': sessionAttributes,
    };
  }
}

/// The bot member that processes the request.
class RecognizedBotMember {
  /// The identifier of the bot member that processes the request.
  final String botId;

  /// The name of the bot member that processes the request.
  final String? botName;

  RecognizedBotMember({
    required this.botId,
    this.botName,
  });

  factory RecognizedBotMember.fromJson(Map<String, dynamic> json) {
    return RecognizedBotMember(
      botId: (json['botId'] as String?) ?? '',
      botName: json['botName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final botName = this.botName;
    return {
      'botId': botId,
      if (botName != null) 'botName': botName,
    };
  }
}

/// The next action that Amazon Lex V2 should take.
class DialogAction {
  /// The next action that the bot should take in its interaction with the user.
  /// The following values are possible:
  ///
  /// <ul>
  /// <li>
  /// <code>Close</code> – Indicates that there will not be a response from the
  /// user. For example, the statement "Your order has been placed" does not
  /// require a response.
  /// </li>
  /// <li>
  /// <code>ConfirmIntent</code> – The next action is asking the user if the
  /// intent is complete and ready to be fulfilled. This is a yes/no question such
  /// as "Place the order?"
  /// </li>
  /// <li>
  /// <code>Delegate</code> – The next action is determined by Amazon Lex V2.
  /// </li>
  /// <li>
  /// <code>ElicitIntent</code> – The next action is to elicit an intent from the
  /// user.
  /// </li>
  /// <li>
  /// <code>ElicitSlot</code> – The next action is to elicit a slot value from the
  /// user.
  /// </li>
  /// </ul>
  final DialogActionType type;

  /// Configures the slot to use spell-by-letter or spell-by-word style. When you
  /// use a style on a slot, users can spell out their input to make it clear to
  /// your bot.
  ///
  /// <ul>
  /// <li>
  /// Spell by letter - "b" "o" "b"
  /// </li>
  /// <li>
  /// Spell by word - "b as in boy" "o as in oscar" "b as in boy"
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/spelling-styles.html">
  /// Using spelling to enter slot values </a>.
  final StyleType? slotElicitationStyle;

  /// The name of the slot that should be elicited from the user.
  final String? slotToElicit;

  /// The name of the constituent sub slot of the composite slot specified in
  /// slotToElicit that should be elicited from the user.
  final ElicitSubSlot? subSlotToElicit;

  DialogAction({
    required this.type,
    this.slotElicitationStyle,
    this.slotToElicit,
    this.subSlotToElicit,
  });

  factory DialogAction.fromJson(Map<String, dynamic> json) {
    return DialogAction(
      type: DialogActionType.fromString((json['type'] as String?) ?? ''),
      slotElicitationStyle:
          (json['slotElicitationStyle'] as String?)?.let(StyleType.fromString),
      slotToElicit: json['slotToElicit'] as String?,
      subSlotToElicit: json['subSlotToElicit'] != null
          ? ElicitSubSlot.fromJson(
              json['subSlotToElicit'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final slotElicitationStyle = this.slotElicitationStyle;
    final slotToElicit = this.slotToElicit;
    final subSlotToElicit = this.subSlotToElicit;
    return {
      'type': type.value,
      if (slotElicitationStyle != null)
        'slotElicitationStyle': slotElicitationStyle.value,
      if (slotToElicit != null) 'slotToElicit': slotToElicit,
      if (subSlotToElicit != null) 'subSlotToElicit': subSlotToElicit,
    };
  }
}

/// The current intent that Amazon Lex V2 is attempting to fulfill.
class Intent {
  /// The name of the intent.
  final String name;

  /// Indicates whether the intent has been <code>Confirmed</code>,
  /// <code>Denied</code>, or <code>None</code> if the confirmation stage has not
  /// yet been reached.
  final ConfirmationState? confirmationState;

  /// A map of all of the slots for the intent. The name of the slot maps to the
  /// value of the slot. If a slot has not been filled, the value is null.
  final Map<String, Slot>? slots;

  /// Indicates the fulfillment state for the intent. The meanings of each value
  /// are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>Failed</code> – The bot failed to fulfill the intent.
  /// </li>
  /// <li>
  /// <code>Fulfilled</code> – The bot has completed fulfillment of the intent.
  /// </li>
  /// <li>
  /// <code>FulfillmentInProgress</code> – The bot is in the middle of fulfilling
  /// the intent.
  /// </li>
  /// <li>
  /// <code>InProgress</code> – The bot is in the middle of eliciting the slot
  /// values that are necessary to fulfill the intent.
  /// </li>
  /// <li>
  /// <code>ReadyForFulfillment</code> – The bot has elicited all the slot values
  /// for the intent and is ready to fulfill the intent.
  /// </li>
  /// <li>
  /// <code>Waiting</code> – The bot is waiting for a response from the user
  /// (limited to streaming conversations).
  /// </li>
  /// </ul>
  final IntentState? state;

  Intent({
    required this.name,
    this.confirmationState,
    this.slots,
    this.state,
  });

  factory Intent.fromJson(Map<String, dynamic> json) {
    return Intent(
      name: (json['name'] as String?) ?? '',
      confirmationState: (json['confirmationState'] as String?)
          ?.let(ConfirmationState.fromString),
      slots: (json['slots'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, Slot.fromJson(e as Map<String, dynamic>))),
      state: (json['state'] as String?)?.let(IntentState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final confirmationState = this.confirmationState;
    final slots = this.slots;
    final state = this.state;
    return {
      'name': name,
      if (confirmationState != null)
        'confirmationState': confirmationState.value,
      if (slots != null) 'slots': slots,
      if (state != null) 'state': state.value,
    };
  }
}

/// You can provide Amazon Lex V2 with hints to the phrases that a customer is
/// likely to use for a slot. When a slot with hints is resolved, the phrases in
/// the runtime hints are preferred in the resolution. You can provide hints for
/// a maximum of 100 intents. You can provide a maximum of 100 slots.
///
/// Before you can use runtime hints with an existing bot, you must first
/// rebuild the bot.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/lexv2/latest/dg/using-hints.html">Using
/// runtime hints to improve recognition of slot values</a>.
class RuntimeHints {
  /// A list of the slots in the intent that should have runtime hints added, and
  /// the phrases that should be added for each slot.
  ///
  /// The first level of the <code>slotHints</code> map is the name of the intent.
  /// The second level is the name of the slot within the intent. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/using-hints.html">Using
  /// hints to improve accuracy</a>.
  ///
  /// The intent name and slot name must exist.
  final Map<String, Map<String, RuntimeHintDetails>>? slotHints;

  RuntimeHints({
    this.slotHints,
  });

  factory RuntimeHints.fromJson(Map<String, dynamic> json) {
    return RuntimeHints(
      slotHints: (json['slotHints'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              (e as Map<String, dynamic>).map((k, e) => MapEntry(
                  k, RuntimeHintDetails.fromJson(e as Map<String, dynamic>))))),
    );
  }

  Map<String, dynamic> toJson() {
    final slotHints = this.slotHints;
    return {
      if (slotHints != null) 'slotHints': slotHints,
    };
  }
}

/// Provides an array of phrases that should be given preference when resolving
/// values for a slot.
class RuntimeHintDetails {
  /// One or more strings that Amazon Lex V2 should look for in the input to the
  /// bot. Each phrase is given preference when deciding on slot values.
  final List<RuntimeHintValue>? runtimeHintValues;

  /// A map of constituent sub slot names inside a composite slot in the intent
  /// and the phrases that should be added for each sub slot. Inside each
  /// composite slot hints, this structure provides a mechanism to add granular
  /// sub slot phrases. Only sub slot hints are supported for composite slots. The
  /// intent name, composite slot name and the constituent sub slot names must
  /// exist.
  final Map<String, RuntimeHintDetails>? subSlotHints;

  RuntimeHintDetails({
    this.runtimeHintValues,
    this.subSlotHints,
  });

  factory RuntimeHintDetails.fromJson(Map<String, dynamic> json) {
    return RuntimeHintDetails(
      runtimeHintValues: (json['runtimeHintValues'] as List?)
          ?.nonNulls
          .map((e) => RuntimeHintValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      subSlotHints: (json['subSlotHints'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, RuntimeHintDetails.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final runtimeHintValues = this.runtimeHintValues;
    final subSlotHints = this.subSlotHints;
    return {
      if (runtimeHintValues != null) 'runtimeHintValues': runtimeHintValues,
      if (subSlotHints != null) 'subSlotHints': subSlotHints,
    };
  }
}

/// Provides the phrase that Amazon Lex V2 should look for in the user's input
/// to the bot.
class RuntimeHintValue {
  /// The phrase that Amazon Lex V2 should look for in the user's input to the
  /// bot.
  final String phrase;

  RuntimeHintValue({
    required this.phrase,
  });

  factory RuntimeHintValue.fromJson(Map<String, dynamic> json) {
    return RuntimeHintValue(
      phrase: (json['phrase'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final phrase = this.phrase;
    return {
      'phrase': phrase,
    };
  }
}

/// Contains information about the contexts that a user is using in a session.
/// You can configure Amazon Lex V2 to set a context when an intent is
/// fulfilled, or you can set a context using the , , or operations.
///
/// Use a context to indicate to Amazon Lex V2 intents that should be used as
/// follow-up intents. For example, if the active context is
/// <code>order-fulfilled</code>, only intents that have
/// <code>order-fulfilled</code> configured as a trigger are considered for
/// follow up.
class ActiveContext {
  /// A list of contexts active for the request. A context can be activated when a
  /// previous intent is fulfilled, or by including the context in the request.
  ///
  /// If you don't specify a list of contexts, Amazon Lex V2 will use the current
  /// list of contexts for the session. If you specify an empty list, all contexts
  /// for the session are cleared.
  final Map<String, String> contextAttributes;

  /// The name of the context.
  final String name;

  /// Indicates the number of turns or seconds that the context is active. Once
  /// the time to live expires, the context is no longer returned in a response.
  final ActiveContextTimeToLive timeToLive;

  ActiveContext({
    required this.contextAttributes,
    required this.name,
    required this.timeToLive,
  });

  factory ActiveContext.fromJson(Map<String, dynamic> json) {
    return ActiveContext(
      contextAttributes:
          ((json['contextAttributes'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
      name: (json['name'] as String?) ?? '',
      timeToLive: ActiveContextTimeToLive.fromJson(
          (json['timeToLive'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final contextAttributes = this.contextAttributes;
    final name = this.name;
    final timeToLive = this.timeToLive;
    return {
      'contextAttributes': contextAttributes,
      'name': name,
      'timeToLive': timeToLive,
    };
  }
}

/// The time that a context is active. You can specify the time to live in
/// seconds or in conversation turns.
class ActiveContextTimeToLive {
  /// The number of seconds that the context is active. You can specify between 5
  /// and 86400 seconds (24 hours).
  final int timeToLiveInSeconds;

  /// The number of turns that the context is active. You can specify up to 20
  /// turns. Each request and response from the bot is a turn.
  final int turnsToLive;

  ActiveContextTimeToLive({
    required this.timeToLiveInSeconds,
    required this.turnsToLive,
  });

  factory ActiveContextTimeToLive.fromJson(Map<String, dynamic> json) {
    return ActiveContextTimeToLive(
      timeToLiveInSeconds: (json['timeToLiveInSeconds'] as int?) ?? 0,
      turnsToLive: (json['turnsToLive'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final timeToLiveInSeconds = this.timeToLiveInSeconds;
    final turnsToLive = this.turnsToLive;
    return {
      'timeToLiveInSeconds': timeToLiveInSeconds,
      'turnsToLive': turnsToLive,
    };
  }
}

class IntentState {
  static const failed = IntentState._('Failed');
  static const fulfilled = IntentState._('Fulfilled');
  static const inProgress = IntentState._('InProgress');
  static const readyForFulfillment = IntentState._('ReadyForFulfillment');
  static const waiting = IntentState._('Waiting');
  static const fulfillmentInProgress = IntentState._('FulfillmentInProgress');

  final String value;

  const IntentState._(this.value);

  static const values = [
    failed,
    fulfilled,
    inProgress,
    readyForFulfillment,
    waiting,
    fulfillmentInProgress
  ];

  static IntentState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => IntentState._(value));

  @override
  bool operator ==(other) => other is IntentState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ConfirmationState {
  static const confirmed = ConfirmationState._('Confirmed');
  static const denied = ConfirmationState._('Denied');
  static const none = ConfirmationState._('None');

  final String value;

  const ConfirmationState._(this.value);

  static const values = [confirmed, denied, none];

  static ConfirmationState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfirmationState._(value));

  @override
  bool operator ==(other) => other is ConfirmationState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A value that Amazon Lex V2 uses to fulfill an intent.
class Slot {
  /// When the <code>shape</code> value is <code>List</code>, it indicates that
  /// the <code>values</code> field contains a list of slot values. When the value
  /// is <code>Scalar</code>, it indicates that the <code>value</code> field
  /// contains a single value.
  final Shape? shape;

  /// The constituent sub slots of a composite slot.
  final Map<String, Slot>? subSlots;

  /// The current value of the slot.
  final Value? value;

  /// A list of one or more values that the user provided for the slot. For
  /// example, if a for a slot that elicits pizza toppings, the values might be
  /// "pepperoni" and "pineapple."
  final List<Slot>? values;

  Slot({
    this.shape,
    this.subSlots,
    this.value,
    this.values,
  });

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
      shape: (json['shape'] as String?)?.let(Shape.fromString),
      subSlots: (json['subSlots'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, Slot.fromJson(e as Map<String, dynamic>))),
      value: json['value'] != null
          ? Value.fromJson(json['value'] as Map<String, dynamic>)
          : null,
      values: (json['values'] as List?)
          ?.nonNulls
          .map((e) => Slot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final shape = this.shape;
    final subSlots = this.subSlots;
    final value = this.value;
    final values = this.values;
    return {
      if (shape != null) 'shape': shape.value,
      if (subSlots != null) 'subSlots': subSlots,
      if (value != null) 'value': value,
      if (values != null) 'values': values,
    };
  }
}

/// Information about the value provided for a slot and Amazon Lex V2's
/// interpretation.
class Value {
  /// The value that Amazon Lex V2 determines for the slot, given the user input.
  /// The actual value depends on the setting of the value selection strategy for
  /// the bot. You can choose to use the value entered by the user, or you can
  /// have Amazon Lex V2 choose the first value in the <code>resolvedValues</code>
  /// list.
  final String interpretedValue;

  /// The part of the user's response to the slot elicitation that Amazon Lex V2
  /// determines is relevant to the slot value.
  final String? originalValue;

  /// A list of values that Amazon Lex V2 determines are possible resolutions for
  /// the user input. The first value matches the <code>interpretedValue</code>.
  final List<String>? resolvedValues;

  Value({
    required this.interpretedValue,
    this.originalValue,
    this.resolvedValues,
  });

  factory Value.fromJson(Map<String, dynamic> json) {
    return Value(
      interpretedValue: (json['interpretedValue'] as String?) ?? '',
      originalValue: json['originalValue'] as String?,
      resolvedValues: (json['resolvedValues'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final interpretedValue = this.interpretedValue;
    final originalValue = this.originalValue;
    final resolvedValues = this.resolvedValues;
    return {
      'interpretedValue': interpretedValue,
      if (originalValue != null) 'originalValue': originalValue,
      if (resolvedValues != null) 'resolvedValues': resolvedValues,
    };
  }
}

class Shape {
  static const scalar = Shape._('Scalar');
  static const list = Shape._('List');
  static const composite = Shape._('Composite');

  final String value;

  const Shape._(this.value);

  static const values = [scalar, list, composite];

  static Shape fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Shape._(value));

  @override
  bool operator ==(other) => other is Shape && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class DialogActionType {
  static const close = DialogActionType._('Close');
  static const confirmIntent = DialogActionType._('ConfirmIntent');
  static const delegate = DialogActionType._('Delegate');
  static const elicitIntent = DialogActionType._('ElicitIntent');
  static const elicitSlot = DialogActionType._('ElicitSlot');
  static const none = DialogActionType._('None');

  final String value;

  const DialogActionType._(this.value);

  static const values = [
    close,
    confirmIntent,
    delegate,
    elicitIntent,
    elicitSlot,
    none
  ];

  static DialogActionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DialogActionType._(value));

  @override
  bool operator ==(other) => other is DialogActionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class StyleType {
  static const $default = StyleType._('Default');
  static const spellByLetter = StyleType._('SpellByLetter');
  static const spellByWord = StyleType._('SpellByWord');

  final String value;

  const StyleType._(this.value);

  static const values = [$default, spellByLetter, spellByWord];

  static StyleType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StyleType._(value));

  @override
  bool operator ==(other) => other is StyleType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The specific constituent sub slot of the composite slot to elicit in dialog
/// action.
class ElicitSubSlot {
  /// The name of the slot that should be elicited from the user.
  final String name;

  /// The field is not supported.
  final ElicitSubSlot? subSlotToElicit;

  ElicitSubSlot({
    required this.name,
    this.subSlotToElicit,
  });

  factory ElicitSubSlot.fromJson(Map<String, dynamic> json) {
    return ElicitSubSlot(
      name: (json['name'] as String?) ?? '',
      subSlotToElicit: json['subSlotToElicit'] != null
          ? ElicitSubSlot.fromJson(
              json['subSlotToElicit'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final subSlotToElicit = this.subSlotToElicit;
    return {
      'name': name,
      if (subSlotToElicit != null) 'subSlotToElicit': subSlotToElicit,
    };
  }
}

/// An object containing information about an intent that Amazon Lex V2
/// determined might satisfy the user's utterance. The intents are ordered by
/// the confidence score.
class Interpretation {
  /// A list of intents that might satisfy the user's utterance. The intents are
  /// ordered by the confidence score.
  final Intent? intent;

  /// Specifies the service that interpreted the input.
  final InterpretationSource? interpretationSource;

  /// Determines the threshold where Amazon Lex V2 will insert the
  /// <code>AMAZON.FallbackIntent</code>, <code>AMAZON.KendraSearchIntent</code>,
  /// or both when returning alternative intents in a response.
  /// <code>AMAZON.FallbackIntent</code> and
  /// <code>AMAZON.KendraSearchIntent</code> are only inserted if they are
  /// configured for the bot.
  final ConfidenceScore? nluConfidence;

  /// The sentiment expressed in an utterance.
  ///
  /// When the bot is configured to send utterances to Amazon Comprehend for
  /// sentiment analysis, this field contains the result of the analysis.
  final SentimentResponse? sentimentResponse;

  Interpretation({
    this.intent,
    this.interpretationSource,
    this.nluConfidence,
    this.sentimentResponse,
  });

  factory Interpretation.fromJson(Map<String, dynamic> json) {
    return Interpretation(
      intent: json['intent'] != null
          ? Intent.fromJson(json['intent'] as Map<String, dynamic>)
          : null,
      interpretationSource: (json['interpretationSource'] as String?)
          ?.let(InterpretationSource.fromString),
      nluConfidence: json['nluConfidence'] != null
          ? ConfidenceScore.fromJson(
              json['nluConfidence'] as Map<String, dynamic>)
          : null,
      sentimentResponse: json['sentimentResponse'] != null
          ? SentimentResponse.fromJson(
              json['sentimentResponse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final intent = this.intent;
    final interpretationSource = this.interpretationSource;
    final nluConfidence = this.nluConfidence;
    final sentimentResponse = this.sentimentResponse;
    return {
      if (intent != null) 'intent': intent,
      if (interpretationSource != null)
        'interpretationSource': interpretationSource.value,
      if (nluConfidence != null) 'nluConfidence': nluConfidence,
      if (sentimentResponse != null) 'sentimentResponse': sentimentResponse,
    };
  }
}

/// Provides a score that indicates the confidence that Amazon Lex V2 has that
/// an intent is the one that satisfies the user's intent.
class ConfidenceScore {
  /// A score that indicates how confident Amazon Lex V2 is that an intent
  /// satisfies the user's intent. Ranges between 0.00 and 1.00. Higher scores
  /// indicate higher confidence.
  final double? score;

  ConfidenceScore({
    this.score,
  });

  factory ConfidenceScore.fromJson(Map<String, dynamic> json) {
    return ConfidenceScore(
      score: json['score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final score = this.score;
    return {
      if (score != null) 'score': score,
    };
  }
}

/// Provides information about the sentiment expressed in a user's response in a
/// conversation. Sentiments are determined using Amazon Comprehend. Sentiments
/// are only returned if they are enabled for the bot.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/comprehend/latest/dg/how-sentiment.html">
/// Determine Sentiment </a> in the <i>Amazon Comprehend developer guide</i>.
class SentimentResponse {
  /// The overall sentiment expressed in the user's response. This is the
  /// sentiment most likely expressed by the user based on the analysis by Amazon
  /// Comprehend.
  final SentimentType? sentiment;
  final SentimentScore? sentimentScore;

  SentimentResponse({
    this.sentiment,
    this.sentimentScore,
  });

  factory SentimentResponse.fromJson(Map<String, dynamic> json) {
    return SentimentResponse(
      sentiment: (json['sentiment'] as String?)?.let(SentimentType.fromString),
      sentimentScore: json['sentimentScore'] != null
          ? SentimentScore.fromJson(
              json['sentimentScore'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sentiment = this.sentiment;
    final sentimentScore = this.sentimentScore;
    return {
      if (sentiment != null) 'sentiment': sentiment.value,
      if (sentimentScore != null) 'sentimentScore': sentimentScore,
    };
  }
}

class InterpretationSource {
  static const bedrock = InterpretationSource._('Bedrock');
  static const lex = InterpretationSource._('Lex');

  final String value;

  const InterpretationSource._(this.value);

  static const values = [bedrock, lex];

  static InterpretationSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InterpretationSource._(value));

  @override
  bool operator ==(other) =>
      other is InterpretationSource && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SentimentType {
  static const mixed = SentimentType._('MIXED');
  static const negative = SentimentType._('NEGATIVE');
  static const neutral = SentimentType._('NEUTRAL');
  static const positive = SentimentType._('POSITIVE');

  final String value;

  const SentimentType._(this.value);

  static const values = [mixed, negative, neutral, positive];

  static SentimentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SentimentType._(value));

  @override
  bool operator ==(other) => other is SentimentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The individual sentiment responses for the utterance.
class SentimentScore {
  /// The level of confidence that Amazon Comprehend has in the accuracy of its
  /// detection of the <code>MIXED</code> sentiment.
  final double? mixed;

  /// The level of confidence that Amazon Comprehend has in the accuracy of its
  /// detection of the <code>NEGATIVE</code> sentiment.
  final double? negative;

  /// The level of confidence that Amazon Comprehend has in the accuracy of its
  /// detection of the <code>NEUTRAL</code> sentiment.
  final double? neutral;

  /// The level of confidence that Amazon Comprehend has in the accuracy of its
  /// detection of the <code>POSITIVE</code> sentiment.
  final double? positive;

  SentimentScore({
    this.mixed,
    this.negative,
    this.neutral,
    this.positive,
  });

  factory SentimentScore.fromJson(Map<String, dynamic> json) {
    return SentimentScore(
      mixed: json['mixed'] as double?,
      negative: json['negative'] as double?,
      neutral: json['neutral'] as double?,
      positive: json['positive'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final mixed = this.mixed;
    final negative = this.negative;
    final neutral = this.neutral;
    final positive = this.positive;
    return {
      if (mixed != null) 'mixed': mixed,
      if (negative != null) 'negative': negative,
      if (neutral != null) 'neutral': neutral,
      if (positive != null) 'positive': positive,
    };
  }
}

class PlaybackInterruptionReason {
  static const dtmfStartDetected =
      PlaybackInterruptionReason._('DTMF_START_DETECTED');
  static const textDetected = PlaybackInterruptionReason._('TEXT_DETECTED');
  static const voiceStartDetected =
      PlaybackInterruptionReason._('VOICE_START_DETECTED');

  final String value;

  const PlaybackInterruptionReason._(this.value);

  static const values = [dtmfStartDetected, textDetected, voiceStartDetected];

  static PlaybackInterruptionReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PlaybackInterruptionReason._(value));

  @override
  bool operator ==(other) =>
      other is PlaybackInterruptionReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ConversationMode {
  static const audio = ConversationMode._('AUDIO');
  static const text = ConversationMode._('TEXT');

  final String value;

  const ConversationMode._(this.value);

  static const values = [audio, text];

  static ConversationMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConversationMode._(value));

  @override
  bool operator ==(other) => other is ConversationMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a stream of events between your application and Amazon Lex V2.
class StartConversationRequestEventStream {
  /// Speech audio sent from your client application to Amazon Lex V2. Audio
  /// starts accumulating when Amazon Lex V2 identifies a voice and continues
  /// until a natural pause in the speech is found before processing.
  final AudioInputEvent? audioInputEvent;

  /// Configuration information sent from your client application to Amazon Lex V2
  final ConfigurationEvent? configurationEvent;

  /// DTMF information sent to Amazon Lex V2 by your application. Amazon Lex V2
  /// accumulates the DMTF information from when the user sends the first
  /// character and ends
  ///
  /// <ul>
  /// <li>
  /// when there's a pause longer that the value configured for the end timeout.
  /// </li>
  /// <li>
  /// when there's a digit that is the configured end character.
  /// </li>
  /// <li>
  /// when Amazon Lex V2 accumulates characters equal to the maximum DTMF
  /// character configuration.
  /// </li>
  /// </ul>
  final DTMFInputEvent? dTMFInputEvent;

  /// Event sent from the client application to indicate to Amazon Lex V2 that the
  /// conversation is over.
  final DisconnectionEvent? disconnectionEvent;

  /// Event sent from the client application to Amazon Lex V2 to indicate that it
  /// has finished playing audio and that Amazon Lex V2 should start listening for
  /// user input.
  final PlaybackCompletionEvent? playbackCompletionEvent;

  /// Text sent from your client application to Amazon Lex V2. Each
  /// <code>TextInputEvent</code> is processed individually.
  final TextInputEvent? textInputEvent;

  StartConversationRequestEventStream({
    this.audioInputEvent,
    this.configurationEvent,
    this.dTMFInputEvent,
    this.disconnectionEvent,
    this.playbackCompletionEvent,
    this.textInputEvent,
  });

  Map<String, dynamic> toJson() {
    final audioInputEvent = this.audioInputEvent;
    final configurationEvent = this.configurationEvent;
    final dTMFInputEvent = this.dTMFInputEvent;
    final disconnectionEvent = this.disconnectionEvent;
    final playbackCompletionEvent = this.playbackCompletionEvent;
    final textInputEvent = this.textInputEvent;
    return {
      if (audioInputEvent != null) 'AudioInputEvent': audioInputEvent,
      if (configurationEvent != null) 'ConfigurationEvent': configurationEvent,
      if (dTMFInputEvent != null) 'DTMFInputEvent': dTMFInputEvent,
      if (disconnectionEvent != null) 'DisconnectionEvent': disconnectionEvent,
      if (playbackCompletionEvent != null)
        'PlaybackCompletionEvent': playbackCompletionEvent,
      if (textInputEvent != null) 'TextInputEvent': textInputEvent,
    };
  }
}

/// The initial event sent from the application to Amazon Lex V2 to configure
/// the conversation, including session and request attributes and the response
/// content type.
class ConfigurationEvent {
  /// The message that Amazon Lex V2 returns in the response can be either text or
  /// speech based on the <code>responseContentType</code> value.
  ///
  /// <ul>
  /// <li>
  /// If the value is <code>text/plain;charset=utf-8</code>, Amazon Lex V2 returns
  /// text in the response.
  /// </li>
  /// <li>
  /// If the value begins with <code>audio/</code>, Amazon Lex V2 returns speech
  /// in the response. Amazon Lex V2 uses Amazon Polly to generate the speech
  /// using the configuration that you specified in the
  /// <code>requestContentType</code> parameter. For example, if you specify
  /// <code>audio/mpeg</code> as the value, Amazon Lex V2 returns speech in the
  /// MPEG format.
  /// </li>
  /// <li>
  /// If the value is <code>audio/pcm</code>, the speech returned is audio/pcm in
  /// 16-bit, little-endian format.
  /// </li>
  /// <li>
  /// The following are the accepted values:
  ///
  /// <ul>
  /// <li>
  /// audio/mpeg
  /// </li>
  /// <li>
  /// audio/ogg
  /// </li>
  /// <li>
  /// audio/pcm
  /// </li>
  /// <li>
  /// audio/* (defaults to mpeg)
  /// </li>
  /// <li>
  /// text/plain; charset=utf-8
  /// </li>
  /// </ul> </li>
  /// </ul>
  final String responseContentType;

  /// A timestamp set by the client of the date and time that the event was sent
  /// to Amazon Lex V2.
  final int? clientTimestampMillis;

  /// Determines whether Amazon Lex V2 should send audio responses to the client
  /// application.
  ///
  /// Set this field to false when the client is operating in a playback mode
  /// where audio responses are played to the user. If the client isn't operating
  /// in playback mode, such as a text chat application, set this to true so that
  /// Amazon Lex V2 doesn't wait for the prompt to finish playing on the client.
  final bool? disablePlayback;

  /// A unique identifier that your application assigns to the event. You can use
  /// this to identify events in logs.
  final String? eventId;

  /// Request-specific information passed between the client application and
  /// Amazon Lex V2.
  ///
  /// The namespace <code>x-amz-lex:</code> is reserved for special attributes.
  /// Don't create any request attributes for prefix <code>x-amz-lex:</code>.
  final Map<String, String>? requestAttributes;
  final SessionState? sessionState;

  /// A list of messages to send to the user.
  ///
  /// If you set the <code>welcomeMessage</code> field, you must also set the <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/API_runtime_DialogAction.html">
  /// <code>DialogAction</code> </a> structure's <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/API_runtime_DialogAction.html#lexv2-Type-runtime_DialogAction-type">
  /// <code>type</code> </a> field.
  final List<Message>? welcomeMessages;

  ConfigurationEvent({
    required this.responseContentType,
    this.clientTimestampMillis,
    this.disablePlayback,
    this.eventId,
    this.requestAttributes,
    this.sessionState,
    this.welcomeMessages,
  });

  Map<String, dynamic> toJson() {
    final responseContentType = this.responseContentType;
    final clientTimestampMillis = this.clientTimestampMillis;
    final disablePlayback = this.disablePlayback;
    final eventId = this.eventId;
    final requestAttributes = this.requestAttributes;
    final sessionState = this.sessionState;
    final welcomeMessages = this.welcomeMessages;
    return {
      'responseContentType': responseContentType,
      if (clientTimestampMillis != null)
        'clientTimestampMillis': clientTimestampMillis,
      if (disablePlayback != null) 'disablePlayback': disablePlayback,
      if (eventId != null) 'eventId': eventId,
      if (requestAttributes != null) 'requestAttributes': requestAttributes,
      if (sessionState != null) 'sessionState': sessionState,
      if (welcomeMessages != null) 'welcomeMessages': welcomeMessages,
    };
  }
}

/// Represents a chunk of audio sent from the client application to Amazon Lex
/// V2. The audio is all or part of an utterance from the user.
///
/// Amazon Lex V2 accumulates audio chunks until it recognizes a natural pause
/// in speech before processing the input.
class AudioInputEvent {
  /// The encoding used for the audio chunk. You must use 8 KHz PCM 16-bit
  /// mono-channel little-endian format. The value of the field should be:
  ///
  /// <code>audio/lpcm; sample-rate=8000; sample-size-bits=16; channel-count=1;
  /// is-big-endian=false</code>
  final String contentType;

  /// An encoded stream of audio.
  final Uint8List? audioChunk;

  /// A timestamp set by the client of the date and time that the event was sent
  /// to Amazon Lex V2.
  final int? clientTimestampMillis;

  /// A unique identifier that your application assigns to the event. You can use
  /// this to identify events in logs.
  final String? eventId;

  AudioInputEvent({
    required this.contentType,
    this.audioChunk,
    this.clientTimestampMillis,
    this.eventId,
  });

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final audioChunk = this.audioChunk;
    final clientTimestampMillis = this.clientTimestampMillis;
    final eventId = this.eventId;
    return {
      'contentType': contentType,
      if (audioChunk != null) 'audioChunk': base64Encode(audioChunk),
      if (clientTimestampMillis != null)
        'clientTimestampMillis': clientTimestampMillis,
      if (eventId != null) 'eventId': eventId,
    };
  }
}

/// A DTMF character sent from the client application. DTMF characters are
/// typically sent from a phone keypad to represent numbers. For example, you
/// can have Amazon Lex V2 process a credit card number input from a phone.
class DTMFInputEvent {
  /// The DTMF character that the user pressed. The allowed characters are A - D,
  /// 0 - 9, # and *.
  final String inputCharacter;

  /// A timestamp set by the client of the date and time that the event was sent
  /// to Amazon Lex V2.
  final int? clientTimestampMillis;

  /// A unique identifier that your application assigns to the event. You can use
  /// this to identify events in logs.
  final String? eventId;

  DTMFInputEvent({
    required this.inputCharacter,
    this.clientTimestampMillis,
    this.eventId,
  });

  Map<String, dynamic> toJson() {
    final inputCharacter = this.inputCharacter;
    final clientTimestampMillis = this.clientTimestampMillis;
    final eventId = this.eventId;
    return {
      'inputCharacter': inputCharacter,
      if (clientTimestampMillis != null)
        'clientTimestampMillis': clientTimestampMillis,
      if (eventId != null) 'eventId': eventId,
    };
  }
}

/// The event sent from your client application to Amazon Lex V2 with text input
/// from the user.
class TextInputEvent {
  /// The text from the user. Amazon Lex V2 processes this as a complete
  /// statement.
  final String text;

  /// A timestamp set by the client of the date and time that the event was sent
  /// to Amazon Lex V2.
  final int? clientTimestampMillis;

  /// A unique identifier that your application assigns to the event. You can use
  /// this to identify events in logs.
  final String? eventId;

  TextInputEvent({
    required this.text,
    this.clientTimestampMillis,
    this.eventId,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    final clientTimestampMillis = this.clientTimestampMillis;
    final eventId = this.eventId;
    return {
      'text': text,
      if (clientTimestampMillis != null)
        'clientTimestampMillis': clientTimestampMillis,
      if (eventId != null) 'eventId': eventId,
    };
  }
}

/// Event sent from the client application to Amazon Lex V2 to indicate that
/// playback of audio is complete and that Amazon Lex V2 should start processing
/// the user's input.
class PlaybackCompletionEvent {
  /// A timestamp set by the client of the date and time that the event was sent
  /// to Amazon Lex V2.
  final int? clientTimestampMillis;

  /// A unique identifier that your application assigns to the event. You can use
  /// this to identify events in logs.
  final String? eventId;

  PlaybackCompletionEvent({
    this.clientTimestampMillis,
    this.eventId,
  });

  Map<String, dynamic> toJson() {
    final clientTimestampMillis = this.clientTimestampMillis;
    final eventId = this.eventId;
    return {
      if (clientTimestampMillis != null)
        'clientTimestampMillis': clientTimestampMillis,
      if (eventId != null) 'eventId': eventId,
    };
  }
}

/// A notification from the client that it is disconnecting from Amazon Lex V2.
/// Sending a <code>DisconnectionEvent</code> event is optional, but can help
/// identify a conversation in logs.
class DisconnectionEvent {
  /// A timestamp set by the client of the date and time that the event was sent
  /// to Amazon Lex V2.
  final int? clientTimestampMillis;

  /// A unique identifier that your application assigns to the event. You can use
  /// this to identify events in logs.
  final String? eventId;

  DisconnectionEvent({
    this.clientTimestampMillis,
    this.eventId,
  });

  Map<String, dynamic> toJson() {
    final clientTimestampMillis = this.clientTimestampMillis;
    final eventId = this.eventId;
    return {
      if (clientTimestampMillis != null)
        'clientTimestampMillis': clientTimestampMillis,
      if (eventId != null) 'eventId': eventId,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(message: message),
  'BadGatewayException': (type, message) =>
      BadGatewayException(message: message),
  'ConflictException': (type, message) => ConflictException(message: message),
  'DependencyFailedException': (type, message) =>
      DependencyFailedException(message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(message: message),
  'ValidationException': (type, message) =>
      ValidationException(message: message),
};
