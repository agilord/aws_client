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

/// Amazon Lex provides both build and runtime endpoints. Each endpoint provides
/// a set of operations (API). Your conversational bot uses the runtime API to
/// understand user utterances (user input text or voice). For example, suppose
/// a user says "I want pizza", your bot sends this input to Amazon Lex using
/// the runtime API. Amazon Lex recognizes that the user request is for the
/// OrderPizza intent (one of the intents defined in the bot). Then Amazon Lex
/// engages in user conversation on behalf of the bot to elicit required
/// information (slot values, such as pizza size and crust type), and then
/// performs fulfillment activity (that you configured when you created the
/// bot). You use the build-time API to create and manage your Amazon Lex bot.
/// For a list of build-time operations, see the build-time API, .
class LexRuntime {
  final _s.RestJsonProtocol _protocol;
  LexRuntime({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'runtime.lex',
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
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [botAlias] :
  /// The alias in use for the bot that contains the session data.
  ///
  /// Parameter [botName] :
  /// The name of the bot that contains the session data.
  ///
  /// Parameter [userId] :
  /// The identifier of the user associated with the session data.
  Future<DeleteSessionResponse> deleteSession({
    required String botAlias,
    required String botName,
    required String userId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/bot/${Uri.encodeComponent(botName)}/alias/${Uri.encodeComponent(botAlias)}/user/${Uri.encodeComponent(userId)}/session',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSessionResponse.fromJson(response);
  }

  /// Returns session information for a specified bot, alias, and user ID.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [botAlias] :
  /// The alias in use for the bot that contains the session data.
  ///
  /// Parameter [botName] :
  /// The name of the bot that contains the session data.
  ///
  /// Parameter [userId] :
  /// The ID of the client application user. Amazon Lex uses this to identify a
  /// user's conversation with your bot.
  ///
  /// Parameter [checkpointLabelFilter] :
  /// A string used to filter the intents returned in the
  /// <code>recentIntentSummaryView</code> structure.
  ///
  /// When you specify a filter, only intents with their
  /// <code>checkpointLabel</code> field set to that string are returned.
  Future<GetSessionResponse> getSession({
    required String botAlias,
    required String botName,
    required String userId,
    String? checkpointLabelFilter,
  }) async {
    final $query = <String, List<String>>{
      if (checkpointLabelFilter != null)
        'checkpointLabelFilter': [checkpointLabelFilter],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/bot/${Uri.encodeComponent(botName)}/alias/${Uri.encodeComponent(botAlias)}/user/${Uri.encodeComponent(userId)}/session/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetSessionResponse.fromJson(response);
  }

  /// Sends user input (text or speech) to Amazon Lex. Clients use this API to
  /// send text and audio requests to Amazon Lex at runtime. Amazon Lex
  /// interprets the user input using the machine learning model that it built
  /// for the bot.
  ///
  /// The <code>PostContent</code> operation supports audio input at 8kHz and
  /// 16kHz. You can use 8kHz audio to achieve higher speech recognition
  /// accuracy in telephone audio applications.
  ///
  /// In response, Amazon Lex returns the next message to convey to the user.
  /// Consider the following example messages:
  ///
  /// <ul>
  /// <li>
  /// For a user input "I would like a pizza," Amazon Lex might return a
  /// response with a message eliciting slot data (for example,
  /// <code>PizzaSize</code>): "What size pizza would you like?".
  /// </li>
  /// <li>
  /// After the user provides all of the pizza order information, Amazon Lex
  /// might return a response with a message to get user confirmation: "Order
  /// the pizza?".
  /// </li>
  /// <li>
  /// After the user replies "Yes" to the confirmation prompt, Amazon Lex might
  /// return a conclusion statement: "Thank you, your cheese pizza has been
  /// ordered.".
  /// </li>
  /// </ul>
  /// Not all Amazon Lex messages require a response from the user. For example,
  /// conclusion statements do not require a response. Some messages require
  /// only a yes or no response. In addition to the <code>message</code>, Amazon
  /// Lex provides additional context about the message in the response that you
  /// can use to enhance client behavior, such as displaying the appropriate
  /// client user interface. Consider the following examples:
  ///
  /// <ul>
  /// <li>
  /// If the message is to elicit slot data, Amazon Lex returns the following
  /// context information:
  ///
  /// <ul>
  /// <li>
  /// <code>x-amz-lex-dialog-state</code> header set to <code>ElicitSlot</code>
  /// </li>
  /// <li>
  /// <code>x-amz-lex-intent-name</code> header set to the intent name in the
  /// current context
  /// </li>
  /// <li>
  /// <code>x-amz-lex-slot-to-elicit</code> header set to the slot name for
  /// which the <code>message</code> is eliciting information
  /// </li>
  /// <li>
  /// <code>x-amz-lex-slots</code> header set to a map of slots configured for
  /// the intent with their current values
  /// </li>
  /// </ul> </li>
  /// <li>
  /// If the message is a confirmation prompt, the
  /// <code>x-amz-lex-dialog-state</code> header is set to
  /// <code>Confirmation</code> and the <code>x-amz-lex-slot-to-elicit</code>
  /// header is omitted.
  /// </li>
  /// <li>
  /// If the message is a clarification prompt configured for the intent,
  /// indicating that the user intent is not understood, the
  /// <code>x-amz-dialog-state</code> header is set to <code>ElicitIntent</code>
  /// and the <code>x-amz-slot-to-elicit</code> header is omitted.
  /// </li>
  /// </ul>
  /// In addition, Amazon Lex also returns your application-specific
  /// <code>sessionAttributes</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html">Managing
  /// Conversation Context</a>.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  /// May throw [UnsupportedMediaTypeException].
  /// May throw [NotAcceptableException].
  /// May throw [RequestTimeoutException].
  /// May throw [DependencyFailedException].
  /// May throw [BadGatewayException].
  /// May throw [LoopDetectedException].
  ///
  /// Parameter [botAlias] :
  /// Alias of the Amazon Lex bot.
  ///
  /// Parameter [botName] :
  /// Name of the Amazon Lex bot.
  ///
  /// Parameter [contentType] :
  /// You pass this value as the <code>Content-Type</code> HTTP header.
  ///
  /// Indicates the audio format or text. The header value must start with one
  /// of the following prefixes:
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
  /// audio/x-cbr-opus-with-preamble; preamble-size=0; bit-rate=256000;
  /// frame-size-milliseconds=4
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
  /// Parameter [inputStream] :
  /// User input in PCM or Opus audio format or text format as described in the
  /// <code>Content-Type</code> HTTP header.
  ///
  /// You can stream audio data to Amazon Lex or you can create a local buffer
  /// that captures all of the audio data before sending. In general, you get
  /// better performance if you stream audio data rather than buffering the data
  /// locally.
  ///
  /// Parameter [userId] :
  /// The ID of the client application user. Amazon Lex uses this to identify a
  /// user's conversation with your bot. At runtime, each request must contain
  /// the <code>userID</code> field.
  ///
  /// To decide the user ID to use for your application, consider the following
  /// factors.
  ///
  /// <ul>
  /// <li>
  /// The <code>userID</code> field must not contain any personally identifiable
  /// information of the user, for example, name, personal identification
  /// numbers, or other end user personal information.
  /// </li>
  /// <li>
  /// If you want a user to start a conversation on one device and continue on
  /// another device, use a user-specific identifier.
  /// </li>
  /// <li>
  /// If you want the same user to be able to have two independent conversations
  /// on two different devices, choose a device-specific identifier.
  /// </li>
  /// <li>
  /// A user can't have two independent conversations with two different
  /// versions of the same bot. For example, a user can't have a conversation
  /// with the PROD and BETA versions of the same bot. If you anticipate that a
  /// user will need to have conversation with two different versions, for
  /// example, while testing, include the bot alias in the user ID to separate
  /// the two conversations.
  /// </li>
  /// </ul>
  ///
  /// Parameter [accept] :
  /// You pass this value as the <code>Accept</code> HTTP header.
  ///
  /// The message Amazon Lex returns in the response can be either text or
  /// speech based on the <code>Accept</code> HTTP header value in the request.
  ///
  /// <ul>
  /// <li>
  /// If the value is <code>text/plain; charset=utf-8</code>, Amazon Lex returns
  /// text in the response.
  /// </li>
  /// <li>
  /// If the value begins with <code>audio/</code>, Amazon Lex returns speech in
  /// the response. Amazon Lex uses Amazon Polly to generate the speech (using
  /// the configuration you specified in the <code>Accept</code> header). For
  /// example, if you specify <code>audio/mpeg</code> as the value, Amazon Lex
  /// returns speech in the MPEG format.
  /// </li>
  /// <li>
  /// If the value is <code>audio/pcm</code>, the speech returned is
  /// <code>audio/pcm</code> in 16-bit, little endian format.
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
  /// text/plain; charset=utf-8
  /// </li>
  /// <li>
  /// audio/* (defaults to mpeg)
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [activeContexts] :
  /// A list of contexts active for the request. A context can be activated when
  /// a previous intent is fulfilled, or by including the context in the
  /// request,
  ///
  /// If you don't specify a list of contexts, Amazon Lex will use the current
  /// list of contexts for the session. If you specify an empty list, all
  /// contexts for the session are cleared.
  ///
  /// Parameter [requestAttributes] :
  /// You pass this value as the <code>x-amz-lex-request-attributes</code> HTTP
  /// header.
  ///
  /// Request-specific information passed between Amazon Lex and a client
  /// application. The value must be a JSON serialized and base64 encoded map
  /// with string keys and values. The total size of the
  /// <code>requestAttributes</code> and <code>sessionAttributes</code> headers
  /// is limited to 12 KB.
  ///
  /// The namespace <code>x-amz-lex:</code> is reserved for special attributes.
  /// Don't create any request attributes with the prefix
  /// <code>x-amz-lex:</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html#context-mgmt-request-attribs">Setting
  /// Request Attributes</a>.
  ///
  /// Parameter [sessionAttributes] :
  /// You pass this value as the <code>x-amz-lex-session-attributes</code> HTTP
  /// header.
  ///
  /// Application-specific information passed between Amazon Lex and a client
  /// application. The value must be a JSON serialized and base64 encoded map
  /// with string keys and values. The total size of the
  /// <code>sessionAttributes</code> and <code>requestAttributes</code> headers
  /// is limited to 12 KB.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html#context-mgmt-session-attribs">Setting
  /// Session Attributes</a>.
  Future<PostContentResponse> postContent({
    required String botAlias,
    required String botName,
    required String contentType,
    required Uint8List inputStream,
    required String userId,
    String? accept,
    Object? activeContexts,
    Object? requestAttributes,
    Object? sessionAttributes,
  }) async {
    final headers = <String, String>{
      'Content-Type': contentType.toString(),
      if (accept != null) 'Accept': accept.toString(),
      if (activeContexts != null)
        'x-amz-lex-active-contexts':
            base64Encode(utf8.encode(jsonEncode(activeContexts))),
      if (requestAttributes != null)
        'x-amz-lex-request-attributes':
            base64Encode(utf8.encode(jsonEncode(requestAttributes))),
      if (sessionAttributes != null)
        'x-amz-lex-session-attributes':
            base64Encode(utf8.encode(jsonEncode(sessionAttributes))),
    };
    final response = await _protocol.sendRaw(
      payload: inputStream,
      method: 'POST',
      requestUri:
          '/bot/${Uri.encodeComponent(botName)}/alias/${Uri.encodeComponent(botAlias)}/user/${Uri.encodeComponent(userId)}/content',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return PostContentResponse(
      audioStream: await response.stream.toBytes(),
      activeContexts: _s.extractHeaderJsonValue(
          response.headers, 'x-amz-lex-active-contexts'),
      alternativeIntents: _s.extractHeaderJsonValue(
          response.headers, 'x-amz-lex-alternative-intents'),
      botVersion: _s.extractHeaderStringValue(
          response.headers, 'x-amz-lex-bot-version'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      dialogState: _s
          .extractHeaderStringValue(response.headers, 'x-amz-lex-dialog-state')
          ?.toDialogState(),
      encodedInputTranscript: _s.extractHeaderStringValue(
          response.headers, 'x-amz-lex-encoded-input-transcript'),
      encodedMessage: _s.extractHeaderStringValue(
          response.headers, 'x-amz-lex-encoded-message'),
      inputTranscript: _s.extractHeaderStringValue(
          response.headers, 'x-amz-lex-input-transcript'),
      intentName: _s.extractHeaderStringValue(
          response.headers, 'x-amz-lex-intent-name'),
      message:
          _s.extractHeaderStringValue(response.headers, 'x-amz-lex-message'),
      messageFormat: _s
          .extractHeaderStringValue(
              response.headers, 'x-amz-lex-message-format')
          ?.toMessageFormatType(),
      nluIntentConfidence: _s.extractHeaderJsonValue(
          response.headers, 'x-amz-lex-nlu-intent-confidence'),
      sentimentResponse:
          _s.extractHeaderStringValue(response.headers, 'x-amz-lex-sentiment'),
      sessionAttributes: _s.extractHeaderJsonValue(
          response.headers, 'x-amz-lex-session-attributes'),
      sessionId:
          _s.extractHeaderStringValue(response.headers, 'x-amz-lex-session-id'),
      slotToElicit: _s.extractHeaderStringValue(
          response.headers, 'x-amz-lex-slot-to-elicit'),
      slots: _s.extractHeaderJsonValue(response.headers, 'x-amz-lex-slots'),
    );
  }

  /// Sends user input to Amazon Lex. Client applications can use this API to
  /// send requests to Amazon Lex at runtime. Amazon Lex then interprets the
  /// user input using the machine learning model it built for the bot.
  ///
  /// In response, Amazon Lex returns the next <code>message</code> to convey to
  /// the user an optional <code>responseCard</code> to display. Consider the
  /// following example messages:
  ///
  /// <ul>
  /// <li>
  /// For a user input "I would like a pizza", Amazon Lex might return a
  /// response with a message eliciting slot data (for example, PizzaSize):
  /// "What size pizza would you like?"
  /// </li>
  /// <li>
  /// After the user provides all of the pizza order information, Amazon Lex
  /// might return a response with a message to obtain user confirmation
  /// "Proceed with the pizza order?".
  /// </li>
  /// <li>
  /// After the user replies to a confirmation prompt with a "yes", Amazon Lex
  /// might return a conclusion statement: "Thank you, your cheese pizza has
  /// been ordered.".
  /// </li>
  /// </ul>
  /// Not all Amazon Lex messages require a user response. For example, a
  /// conclusion statement does not require a response. Some messages require
  /// only a "yes" or "no" user response. In addition to the
  /// <code>message</code>, Amazon Lex provides additional context about the
  /// message in the response that you might use to enhance client behavior, for
  /// example, to display the appropriate client user interface. These are the
  /// <code>slotToElicit</code>, <code>dialogState</code>,
  /// <code>intentName</code>, and <code>slots</code> fields in the response.
  /// Consider the following examples:
  ///
  /// <ul>
  /// <li>
  /// If the message is to elicit slot data, Amazon Lex returns the following
  /// context information:
  ///
  /// <ul>
  /// <li>
  /// <code>dialogState</code> set to ElicitSlot
  /// </li>
  /// <li>
  /// <code>intentName</code> set to the intent name in the current context
  /// </li>
  /// <li>
  /// <code>slotToElicit</code> set to the slot name for which the
  /// <code>message</code> is eliciting information
  /// </li>
  /// <li>
  /// <code>slots</code> set to a map of slots, configured for the intent, with
  /// currently known values
  /// </li>
  /// </ul> </li>
  /// <li>
  /// If the message is a confirmation prompt, the <code>dialogState</code> is
  /// set to ConfirmIntent and <code>SlotToElicit</code> is set to null.
  /// </li>
  /// <li>
  /// If the message is a clarification prompt (configured for the intent) that
  /// indicates that user intent is not understood, the <code>dialogState</code>
  /// is set to ElicitIntent and <code>slotToElicit</code> is set to null.
  /// </li>
  /// </ul>
  /// In addition, Amazon Lex also returns your application-specific
  /// <code>sessionAttributes</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html">Managing
  /// Conversation Context</a>.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  /// May throw [DependencyFailedException].
  /// May throw [BadGatewayException].
  /// May throw [LoopDetectedException].
  ///
  /// Parameter [botAlias] :
  /// The alias of the Amazon Lex bot.
  ///
  /// Parameter [botName] :
  /// The name of the Amazon Lex bot.
  ///
  /// Parameter [inputText] :
  /// The text that the user entered (Amazon Lex interprets this text).
  ///
  /// Parameter [userId] :
  /// The ID of the client application user. Amazon Lex uses this to identify a
  /// user's conversation with your bot. At runtime, each request must contain
  /// the <code>userID</code> field.
  ///
  /// To decide the user ID to use for your application, consider the following
  /// factors.
  ///
  /// <ul>
  /// <li>
  /// The <code>userID</code> field must not contain any personally identifiable
  /// information of the user, for example, name, personal identification
  /// numbers, or other end user personal information.
  /// </li>
  /// <li>
  /// If you want a user to start a conversation on one device and continue on
  /// another device, use a user-specific identifier.
  /// </li>
  /// <li>
  /// If you want the same user to be able to have two independent conversations
  /// on two different devices, choose a device-specific identifier.
  /// </li>
  /// <li>
  /// A user can't have two independent conversations with two different
  /// versions of the same bot. For example, a user can't have a conversation
  /// with the PROD and BETA versions of the same bot. If you anticipate that a
  /// user will need to have conversation with two different versions, for
  /// example, while testing, include the bot alias in the user ID to separate
  /// the two conversations.
  /// </li>
  /// </ul>
  ///
  /// Parameter [activeContexts] :
  /// A list of contexts active for the request. A context can be activated when
  /// a previous intent is fulfilled, or by including the context in the
  /// request,
  ///
  /// If you don't specify a list of contexts, Amazon Lex will use the current
  /// list of contexts for the session. If you specify an empty list, all
  /// contexts for the session are cleared.
  ///
  /// Parameter [requestAttributes] :
  /// Request-specific information passed between Amazon Lex and a client
  /// application.
  ///
  /// The namespace <code>x-amz-lex:</code> is reserved for special attributes.
  /// Don't create any request attributes with the prefix
  /// <code>x-amz-lex:</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html#context-mgmt-request-attribs">Setting
  /// Request Attributes</a>.
  ///
  /// Parameter [sessionAttributes] :
  /// Application-specific information passed between Amazon Lex and a client
  /// application.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html#context-mgmt-session-attribs">Setting
  /// Session Attributes</a>.
  Future<PostTextResponse> postText({
    required String botAlias,
    required String botName,
    required String inputText,
    required String userId,
    List<ActiveContext>? activeContexts,
    Map<String, String>? requestAttributes,
    Map<String, String>? sessionAttributes,
  }) async {
    final $payload = <String, dynamic>{
      'inputText': inputText,
      if (activeContexts != null) 'activeContexts': activeContexts,
      if (requestAttributes != null) 'requestAttributes': requestAttributes,
      if (sessionAttributes != null) 'sessionAttributes': sessionAttributes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/bot/${Uri.encodeComponent(botName)}/alias/${Uri.encodeComponent(botAlias)}/user/${Uri.encodeComponent(userId)}/text',
      exceptionFnMap: _exceptionFns,
    );
    return PostTextResponse.fromJson(response);
  }

  /// Creates a new session or modifies an existing session with an Amazon Lex
  /// bot. Use this operation to enable your application to set the state of the
  /// bot.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/how-session-api.html">Managing
  /// Sessions</a>.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  /// May throw [NotAcceptableException].
  /// May throw [DependencyFailedException].
  /// May throw [BadGatewayException].
  ///
  /// Parameter [botAlias] :
  /// The alias in use for the bot that contains the session data.
  ///
  /// Parameter [botName] :
  /// The name of the bot that contains the session data.
  ///
  /// Parameter [userId] :
  /// The ID of the client application user. Amazon Lex uses this to identify a
  /// user's conversation with your bot.
  ///
  /// Parameter [accept] :
  /// The message that Amazon Lex returns in the response can be either text or
  /// speech based depending on the value of this field.
  ///
  /// <ul>
  /// <li>
  /// If the value is <code>text/plain; charset=utf-8</code>, Amazon Lex returns
  /// text in the response.
  /// </li>
  /// <li>
  /// If the value begins with <code>audio/</code>, Amazon Lex returns speech in
  /// the response. Amazon Lex uses Amazon Polly to generate the speech in the
  /// configuration that you specify. For example, if you specify
  /// <code>audio/mpeg</code> as the value, Amazon Lex returns speech in the
  /// MPEG format.
  /// </li>
  /// <li>
  /// If the value is <code>audio/pcm</code>, the speech is returned as
  /// <code>audio/pcm</code> in 16-bit, little endian format.
  /// </li>
  /// <li>
  /// The following are the accepted values:
  ///
  /// <ul>
  /// <li>
  /// <code>audio/mpeg</code>
  /// </li>
  /// <li>
  /// <code>audio/ogg</code>
  /// </li>
  /// <li>
  /// <code>audio/pcm</code>
  /// </li>
  /// <li>
  /// <code>audio/*</code> (defaults to mpeg)
  /// </li>
  /// <li>
  /// <code>text/plain; charset=utf-8</code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [activeContexts] :
  /// A list of contexts active for the request. A context can be activated when
  /// a previous intent is fulfilled, or by including the context in the
  /// request,
  ///
  /// If you don't specify a list of contexts, Amazon Lex will use the current
  /// list of contexts for the session. If you specify an empty list, all
  /// contexts for the session are cleared.
  ///
  /// Parameter [dialogAction] :
  /// Sets the next action that the bot should take to fulfill the conversation.
  ///
  /// Parameter [recentIntentSummaryView] :
  /// A summary of the recent intents for the bot. You can use the intent
  /// summary view to set a checkpoint label on an intent and modify attributes
  /// of intents. You can also use it to remove or add intent summary objects to
  /// the list.
  ///
  /// An intent that you modify or add to the list must make sense for the bot.
  /// For example, the intent name must be valid for the bot. You must provide
  /// valid values for:
  ///
  /// <ul>
  /// <li>
  /// <code>intentName</code>
  /// </li>
  /// <li>
  /// slot names
  /// </li>
  /// <li>
  /// <code>slotToElict</code>
  /// </li>
  /// </ul>
  /// If you send the <code>recentIntentSummaryView</code> parameter in a
  /// <code>PutSession</code> request, the contents of the new summary view
  /// replaces the old summary view. For example, if a <code>GetSession</code>
  /// request returns three intents in the summary view and you call
  /// <code>PutSession</code> with one intent in the summary view, the next call
  /// to <code>GetSession</code> will only return one intent.
  ///
  /// Parameter [sessionAttributes] :
  /// Map of key/value pairs representing the session-specific context
  /// information. It contains application information passed between Amazon Lex
  /// and a client application.
  Future<PutSessionResponse> putSession({
    required String botAlias,
    required String botName,
    required String userId,
    String? accept,
    List<ActiveContext>? activeContexts,
    DialogAction? dialogAction,
    List<IntentSummary>? recentIntentSummaryView,
    Map<String, String>? sessionAttributes,
  }) async {
    final headers = <String, String>{
      if (accept != null) 'Accept': accept.toString(),
    };
    final $payload = <String, dynamic>{
      if (activeContexts != null) 'activeContexts': activeContexts,
      if (dialogAction != null) 'dialogAction': dialogAction,
      if (recentIntentSummaryView != null)
        'recentIntentSummaryView': recentIntentSummaryView,
      if (sessionAttributes != null) 'sessionAttributes': sessionAttributes,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/bot/${Uri.encodeComponent(botName)}/alias/${Uri.encodeComponent(botAlias)}/user/${Uri.encodeComponent(userId)}/session',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return PutSessionResponse(
      audioStream: await response.stream.toBytes(),
      activeContexts: _s.extractHeaderJsonValue(
          response.headers, 'x-amz-lex-active-contexts'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      dialogState: _s
          .extractHeaderStringValue(response.headers, 'x-amz-lex-dialog-state')
          ?.toDialogState(),
      encodedMessage: _s.extractHeaderStringValue(
          response.headers, 'x-amz-lex-encoded-message'),
      intentName: _s.extractHeaderStringValue(
          response.headers, 'x-amz-lex-intent-name'),
      message:
          _s.extractHeaderStringValue(response.headers, 'x-amz-lex-message'),
      messageFormat: _s
          .extractHeaderStringValue(
              response.headers, 'x-amz-lex-message-format')
          ?.toMessageFormatType(),
      sessionAttributes: _s.extractHeaderJsonValue(
          response.headers, 'x-amz-lex-session-attributes'),
      sessionId:
          _s.extractHeaderStringValue(response.headers, 'x-amz-lex-session-id'),
      slotToElicit: _s.extractHeaderStringValue(
          response.headers, 'x-amz-lex-slot-to-elicit'),
      slots: _s.extractHeaderJsonValue(response.headers, 'x-amz-lex-slots'),
    );
  }
}

/// A context is a variable that contains information about the current state of
/// the conversation between a user and Amazon Lex. Context can be set
/// automatically by Amazon Lex when an intent is fulfilled, or it can be set at
/// runtime using the <code>PutContent</code>, <code>PutText</code>, or
/// <code>PutSession</code> operation.
class ActiveContext {
  /// The name of the context.
  final String name;

  /// State variables for the current context. You can use these values as default
  /// values for slots in subsequent events.
  final Map<String, String> parameters;

  /// The length of time or number of turns that a context remains active.
  final ActiveContextTimeToLive timeToLive;

  ActiveContext({
    required this.name,
    required this.parameters,
    required this.timeToLive,
  });

  factory ActiveContext.fromJson(Map<String, dynamic> json) {
    return ActiveContext(
      name: json['name'] as String,
      parameters: (json['parameters'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      timeToLive: ActiveContextTimeToLive.fromJson(
          json['timeToLive'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final parameters = this.parameters;
    final timeToLive = this.timeToLive;
    return {
      'name': name,
      'parameters': parameters,
      'timeToLive': timeToLive,
    };
  }
}

/// The length of time or number of turns that a context remains active.
class ActiveContextTimeToLive {
  /// The number of seconds that the context should be active after it is first
  /// sent in a <code>PostContent</code> or <code>PostText</code> response. You
  /// can set the value between 5 and 86,400 seconds (24 hours).
  final int? timeToLiveInSeconds;

  /// The number of conversation turns that the context should be active. A
  /// conversation turn is one <code>PostContent</code> or <code>PostText</code>
  /// request and the corresponding response from Amazon Lex.
  final int? turnsToLive;

  ActiveContextTimeToLive({
    this.timeToLiveInSeconds,
    this.turnsToLive,
  });

  factory ActiveContextTimeToLive.fromJson(Map<String, dynamic> json) {
    return ActiveContextTimeToLive(
      timeToLiveInSeconds: json['timeToLiveInSeconds'] as int?,
      turnsToLive: json['turnsToLive'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final timeToLiveInSeconds = this.timeToLiveInSeconds;
    final turnsToLive = this.turnsToLive;
    return {
      if (timeToLiveInSeconds != null)
        'timeToLiveInSeconds': timeToLiveInSeconds,
      if (turnsToLive != null) 'turnsToLive': turnsToLive,
    };
  }
}

/// Represents an option to be shown on the client platform (Facebook, Slack,
/// etc.)
class Button {
  /// Text that is visible to the user on the button.
  final String text;

  /// The value sent to Amazon Lex when a user chooses the button. For example,
  /// consider button text "NYC." When the user chooses the button, the value sent
  /// can be "New York City."
  final String value;

  Button({
    required this.text,
    required this.value,
  });

  factory Button.fromJson(Map<String, dynamic> json) {
    return Button(
      text: json['text'] as String,
      value: json['value'] as String,
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

enum ConfirmationStatus {
  none,
  confirmed,
  denied,
}

extension ConfirmationStatusValueExtension on ConfirmationStatus {
  String toValue() {
    switch (this) {
      case ConfirmationStatus.none:
        return 'None';
      case ConfirmationStatus.confirmed:
        return 'Confirmed';
      case ConfirmationStatus.denied:
        return 'Denied';
    }
  }
}

extension ConfirmationStatusFromString on String {
  ConfirmationStatus toConfirmationStatus() {
    switch (this) {
      case 'None':
        return ConfirmationStatus.none;
      case 'Confirmed':
        return ConfirmationStatus.confirmed;
      case 'Denied':
        return ConfirmationStatus.denied;
    }
    throw Exception('$this is not known in enum ConfirmationStatus');
  }
}

enum ContentType {
  applicationVndAmazonawsCardGeneric,
}

extension ContentTypeValueExtension on ContentType {
  String toValue() {
    switch (this) {
      case ContentType.applicationVndAmazonawsCardGeneric:
        return 'application/vnd.amazonaws.card.generic';
    }
  }
}

extension ContentTypeFromString on String {
  ContentType toContentType() {
    switch (this) {
      case 'application/vnd.amazonaws.card.generic':
        return ContentType.applicationVndAmazonawsCardGeneric;
    }
    throw Exception('$this is not known in enum ContentType');
  }
}

class DeleteSessionResponse {
  /// The alias in use for the bot associated with the session data.
  final String? botAlias;

  /// The name of the bot associated with the session data.
  final String? botName;

  /// The unique identifier for the session.
  final String? sessionId;

  /// The ID of the client application user.
  final String? userId;

  DeleteSessionResponse({
    this.botAlias,
    this.botName,
    this.sessionId,
    this.userId,
  });

  factory DeleteSessionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSessionResponse(
      botAlias: json['botAlias'] as String?,
      botName: json['botName'] as String?,
      sessionId: json['sessionId'] as String?,
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botAlias = this.botAlias;
    final botName = this.botName;
    final sessionId = this.sessionId;
    final userId = this.userId;
    return {
      if (botAlias != null) 'botAlias': botAlias,
      if (botName != null) 'botName': botName,
      if (sessionId != null) 'sessionId': sessionId,
      if (userId != null) 'userId': userId,
    };
  }
}

/// Describes the next action that the bot should take in its interaction with
/// the user and provides information about the context in which the action
/// takes place. Use the <code>DialogAction</code> data type to set the
/// interaction to a specific state, or to return the interaction to a previous
/// state.
class DialogAction {
  /// The next action that the bot should take in its interaction with the user.
  /// The possible values are:
  ///
  /// <ul>
  /// <li>
  /// <code>ConfirmIntent</code> - The next action is asking the user if the
  /// intent is complete and ready to be fulfilled. This is a yes/no question such
  /// as "Place the order?"
  /// </li>
  /// <li>
  /// <code>Close</code> - Indicates that the there will not be a response from
  /// the user. For example, the statement "Your order has been placed" does not
  /// require a response.
  /// </li>
  /// <li>
  /// <code>Delegate</code> - The next action is determined by Amazon Lex.
  /// </li>
  /// <li>
  /// <code>ElicitIntent</code> - The next action is to determine the intent that
  /// the user wants to fulfill.
  /// </li>
  /// <li>
  /// <code>ElicitSlot</code> - The next action is to elicit a slot value from the
  /// user.
  /// </li>
  /// </ul>
  final DialogActionType type;

  /// The fulfillment state of the intent. The possible values are:
  ///
  /// <ul>
  /// <li>
  /// <code>Failed</code> - The Lambda function associated with the intent failed
  /// to fulfill the intent.
  /// </li>
  /// <li>
  /// <code>Fulfilled</code> - The intent has fulfilled by the Lambda function
  /// associated with the intent.
  /// </li>
  /// <li>
  /// <code>ReadyForFulfillment</code> - All of the information necessary for the
  /// intent is present and the intent ready to be fulfilled by the client
  /// application.
  /// </li>
  /// </ul>
  final FulfillmentState? fulfillmentState;

  /// The name of the intent.
  final String? intentName;

  /// The message that should be shown to the user. If you don't specify a
  /// message, Amazon Lex will use the message configured for the intent.
  final String? message;

  /// <ul>
  /// <li>
  /// <code>PlainText</code> - The message contains plain UTF-8 text.
  /// </li>
  /// <li>
  /// <code>CustomPayload</code> - The message is a custom format for the client.
  /// </li>
  /// <li>
  /// <code>SSML</code> - The message contains text formatted for voice output.
  /// </li>
  /// <li>
  /// <code>Composite</code> - The message contains an escaped JSON object
  /// containing one or more messages. For more information, see <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/howitworks-manage-prompts.html">Message
  /// Groups</a>.
  /// </li>
  /// </ul>
  final MessageFormatType? messageFormat;

  /// The name of the slot that should be elicited from the user.
  final String? slotToElicit;

  /// Map of the slots that have been gathered and their values.
  final Map<String, String>? slots;

  DialogAction({
    required this.type,
    this.fulfillmentState,
    this.intentName,
    this.message,
    this.messageFormat,
    this.slotToElicit,
    this.slots,
  });

  factory DialogAction.fromJson(Map<String, dynamic> json) {
    return DialogAction(
      type: (json['type'] as String).toDialogActionType(),
      fulfillmentState:
          (json['fulfillmentState'] as String?)?.toFulfillmentState(),
      intentName: json['intentName'] as String?,
      message: json['message'] as String?,
      messageFormat: (json['messageFormat'] as String?)?.toMessageFormatType(),
      slotToElicit: json['slotToElicit'] as String?,
      slots: (json['slots'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final fulfillmentState = this.fulfillmentState;
    final intentName = this.intentName;
    final message = this.message;
    final messageFormat = this.messageFormat;
    final slotToElicit = this.slotToElicit;
    final slots = this.slots;
    return {
      'type': type.toValue(),
      if (fulfillmentState != null)
        'fulfillmentState': fulfillmentState.toValue(),
      if (intentName != null) 'intentName': intentName,
      if (message != null) 'message': message,
      if (messageFormat != null) 'messageFormat': messageFormat.toValue(),
      if (slotToElicit != null) 'slotToElicit': slotToElicit,
      if (slots != null) 'slots': slots,
    };
  }
}

enum DialogActionType {
  elicitIntent,
  confirmIntent,
  elicitSlot,
  close,
  delegate,
}

extension DialogActionTypeValueExtension on DialogActionType {
  String toValue() {
    switch (this) {
      case DialogActionType.elicitIntent:
        return 'ElicitIntent';
      case DialogActionType.confirmIntent:
        return 'ConfirmIntent';
      case DialogActionType.elicitSlot:
        return 'ElicitSlot';
      case DialogActionType.close:
        return 'Close';
      case DialogActionType.delegate:
        return 'Delegate';
    }
  }
}

extension DialogActionTypeFromString on String {
  DialogActionType toDialogActionType() {
    switch (this) {
      case 'ElicitIntent':
        return DialogActionType.elicitIntent;
      case 'ConfirmIntent':
        return DialogActionType.confirmIntent;
      case 'ElicitSlot':
        return DialogActionType.elicitSlot;
      case 'Close':
        return DialogActionType.close;
      case 'Delegate':
        return DialogActionType.delegate;
    }
    throw Exception('$this is not known in enum DialogActionType');
  }
}

enum DialogState {
  elicitIntent,
  confirmIntent,
  elicitSlot,
  fulfilled,
  readyForFulfillment,
  failed,
}

extension DialogStateValueExtension on DialogState {
  String toValue() {
    switch (this) {
      case DialogState.elicitIntent:
        return 'ElicitIntent';
      case DialogState.confirmIntent:
        return 'ConfirmIntent';
      case DialogState.elicitSlot:
        return 'ElicitSlot';
      case DialogState.fulfilled:
        return 'Fulfilled';
      case DialogState.readyForFulfillment:
        return 'ReadyForFulfillment';
      case DialogState.failed:
        return 'Failed';
    }
  }
}

extension DialogStateFromString on String {
  DialogState toDialogState() {
    switch (this) {
      case 'ElicitIntent':
        return DialogState.elicitIntent;
      case 'ConfirmIntent':
        return DialogState.confirmIntent;
      case 'ElicitSlot':
        return DialogState.elicitSlot;
      case 'Fulfilled':
        return DialogState.fulfilled;
      case 'ReadyForFulfillment':
        return DialogState.readyForFulfillment;
      case 'Failed':
        return DialogState.failed;
    }
    throw Exception('$this is not known in enum DialogState');
  }
}

enum FulfillmentState {
  fulfilled,
  failed,
  readyForFulfillment,
}

extension FulfillmentStateValueExtension on FulfillmentState {
  String toValue() {
    switch (this) {
      case FulfillmentState.fulfilled:
        return 'Fulfilled';
      case FulfillmentState.failed:
        return 'Failed';
      case FulfillmentState.readyForFulfillment:
        return 'ReadyForFulfillment';
    }
  }
}

extension FulfillmentStateFromString on String {
  FulfillmentState toFulfillmentState() {
    switch (this) {
      case 'Fulfilled':
        return FulfillmentState.fulfilled;
      case 'Failed':
        return FulfillmentState.failed;
      case 'ReadyForFulfillment':
        return FulfillmentState.readyForFulfillment;
    }
    throw Exception('$this is not known in enum FulfillmentState');
  }
}

/// Represents an option rendered to the user when a prompt is shown. It could
/// be an image, a button, a link, or text.
class GenericAttachment {
  /// The URL of an attachment to the response card.
  final String? attachmentLinkUrl;

  /// The list of options to show to the user.
  final List<Button>? buttons;

  /// The URL of an image that is displayed to the user.
  final String? imageUrl;

  /// The subtitle shown below the title.
  final String? subTitle;

  /// The title of the option.
  final String? title;

  GenericAttachment({
    this.attachmentLinkUrl,
    this.buttons,
    this.imageUrl,
    this.subTitle,
    this.title,
  });

  factory GenericAttachment.fromJson(Map<String, dynamic> json) {
    return GenericAttachment(
      attachmentLinkUrl: json['attachmentLinkUrl'] as String?,
      buttons: (json['buttons'] as List?)
          ?.whereNotNull()
          .map((e) => Button.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageUrl: json['imageUrl'] as String?,
      subTitle: json['subTitle'] as String?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentLinkUrl = this.attachmentLinkUrl;
    final buttons = this.buttons;
    final imageUrl = this.imageUrl;
    final subTitle = this.subTitle;
    final title = this.title;
    return {
      if (attachmentLinkUrl != null) 'attachmentLinkUrl': attachmentLinkUrl,
      if (buttons != null) 'buttons': buttons,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (subTitle != null) 'subTitle': subTitle,
      if (title != null) 'title': title,
    };
  }
}

class GetSessionResponse {
  /// A list of active contexts for the session. A context can be set when an
  /// intent is fulfilled or by calling the <code>PostContent</code>,
  /// <code>PostText</code>, or <code>PutSession</code> operation.
  ///
  /// You can use a context to control the intents that can follow up an intent,
  /// or to modify the operation of your application.
  final List<ActiveContext>? activeContexts;

  /// Describes the current state of the bot.
  final DialogAction? dialogAction;

  /// An array of information about the intents used in the session. The array can
  /// contain a maximum of three summaries. If more than three intents are used in
  /// the session, the <code>recentIntentSummaryView</code> operation contains
  /// information about the last three intents used.
  ///
  /// If you set the <code>checkpointLabelFilter</code> parameter in the request,
  /// the array contains only the intents with the specified label.
  final List<IntentSummary>? recentIntentSummaryView;

  /// Map of key/value pairs representing the session-specific context
  /// information. It contains application information passed between Amazon Lex
  /// and a client application.
  final Map<String, String>? sessionAttributes;

  /// A unique identifier for the session.
  final String? sessionId;

  GetSessionResponse({
    this.activeContexts,
    this.dialogAction,
    this.recentIntentSummaryView,
    this.sessionAttributes,
    this.sessionId,
  });

  factory GetSessionResponse.fromJson(Map<String, dynamic> json) {
    return GetSessionResponse(
      activeContexts: (json['activeContexts'] as List?)
          ?.whereNotNull()
          .map((e) => ActiveContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      dialogAction: json['dialogAction'] != null
          ? DialogAction.fromJson(json['dialogAction'] as Map<String, dynamic>)
          : null,
      recentIntentSummaryView: (json['recentIntentSummaryView'] as List?)
          ?.whereNotNull()
          .map((e) => IntentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      sessionAttributes: (json['sessionAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      sessionId: json['sessionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeContexts = this.activeContexts;
    final dialogAction = this.dialogAction;
    final recentIntentSummaryView = this.recentIntentSummaryView;
    final sessionAttributes = this.sessionAttributes;
    final sessionId = this.sessionId;
    return {
      if (activeContexts != null) 'activeContexts': activeContexts,
      if (dialogAction != null) 'dialogAction': dialogAction,
      if (recentIntentSummaryView != null)
        'recentIntentSummaryView': recentIntentSummaryView,
      if (sessionAttributes != null) 'sessionAttributes': sessionAttributes,
      if (sessionId != null) 'sessionId': sessionId,
    };
  }
}

/// Provides a score that indicates the confidence that Amazon Lex has that an
/// intent is the one that satisfies the user's intent.
class IntentConfidence {
  /// A score that indicates how confident Amazon Lex is that an intent satisfies
  /// the user's intent. Ranges between 0.00 and 1.00. Higher scores indicate
  /// higher confidence.
  final double? score;

  IntentConfidence({
    this.score,
  });

  factory IntentConfidence.fromJson(Map<String, dynamic> json) {
    return IntentConfidence(
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

/// Provides information about the state of an intent. You can use this
/// information to get the current state of an intent so that you can process
/// the intent, or so that you can return the intent to its previous state.
class IntentSummary {
  /// The next action that the bot should take in its interaction with the user.
  /// The possible values are:
  ///
  /// <ul>
  /// <li>
  /// <code>ConfirmIntent</code> - The next action is asking the user if the
  /// intent is complete and ready to be fulfilled. This is a yes/no question such
  /// as "Place the order?"
  /// </li>
  /// <li>
  /// <code>Close</code> - Indicates that the there will not be a response from
  /// the user. For example, the statement "Your order has been placed" does not
  /// require a response.
  /// </li>
  /// <li>
  /// <code>ElicitIntent</code> - The next action is to determine the intent that
  /// the user wants to fulfill.
  /// </li>
  /// <li>
  /// <code>ElicitSlot</code> - The next action is to elicit a slot value from the
  /// user.
  /// </li>
  /// </ul>
  final DialogActionType dialogActionType;

  /// A user-defined label that identifies a particular intent. You can use this
  /// label to return to a previous intent.
  ///
  /// Use the <code>checkpointLabelFilter</code> parameter of the
  /// <code>GetSessionRequest</code> operation to filter the intents returned by
  /// the operation to those with only the specified label.
  final String? checkpointLabel;

  /// The status of the intent after the user responds to the confirmation prompt.
  /// If the user confirms the intent, Amazon Lex sets this field to
  /// <code>Confirmed</code>. If the user denies the intent, Amazon Lex sets this
  /// value to <code>Denied</code>. The possible values are:
  ///
  /// <ul>
  /// <li>
  /// <code>Confirmed</code> - The user has responded "Yes" to the confirmation
  /// prompt, confirming that the intent is complete and that it is ready to be
  /// fulfilled.
  /// </li>
  /// <li>
  /// <code>Denied</code> - The user has responded "No" to the confirmation
  /// prompt.
  /// </li>
  /// <li>
  /// <code>None</code> - The user has never been prompted for confirmation; or,
  /// the user was prompted but did not confirm or deny the prompt.
  /// </li>
  /// </ul>
  final ConfirmationStatus? confirmationStatus;

  /// The fulfillment state of the intent. The possible values are:
  ///
  /// <ul>
  /// <li>
  /// <code>Failed</code> - The Lambda function associated with the intent failed
  /// to fulfill the intent.
  /// </li>
  /// <li>
  /// <code>Fulfilled</code> - The intent has fulfilled by the Lambda function
  /// associated with the intent.
  /// </li>
  /// <li>
  /// <code>ReadyForFulfillment</code> - All of the information necessary for the
  /// intent is present and the intent ready to be fulfilled by the client
  /// application.
  /// </li>
  /// </ul>
  final FulfillmentState? fulfillmentState;

  /// The name of the intent.
  final String? intentName;

  /// The next slot to elicit from the user. If there is not slot to elicit, the
  /// field is blank.
  final String? slotToElicit;

  /// Map of the slots that have been gathered and their values.
  final Map<String, String>? slots;

  IntentSummary({
    required this.dialogActionType,
    this.checkpointLabel,
    this.confirmationStatus,
    this.fulfillmentState,
    this.intentName,
    this.slotToElicit,
    this.slots,
  });

  factory IntentSummary.fromJson(Map<String, dynamic> json) {
    return IntentSummary(
      dialogActionType:
          (json['dialogActionType'] as String).toDialogActionType(),
      checkpointLabel: json['checkpointLabel'] as String?,
      confirmationStatus:
          (json['confirmationStatus'] as String?)?.toConfirmationStatus(),
      fulfillmentState:
          (json['fulfillmentState'] as String?)?.toFulfillmentState(),
      intentName: json['intentName'] as String?,
      slotToElicit: json['slotToElicit'] as String?,
      slots: (json['slots'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final dialogActionType = this.dialogActionType;
    final checkpointLabel = this.checkpointLabel;
    final confirmationStatus = this.confirmationStatus;
    final fulfillmentState = this.fulfillmentState;
    final intentName = this.intentName;
    final slotToElicit = this.slotToElicit;
    final slots = this.slots;
    return {
      'dialogActionType': dialogActionType.toValue(),
      if (checkpointLabel != null) 'checkpointLabel': checkpointLabel,
      if (confirmationStatus != null)
        'confirmationStatus': confirmationStatus.toValue(),
      if (fulfillmentState != null)
        'fulfillmentState': fulfillmentState.toValue(),
      if (intentName != null) 'intentName': intentName,
      if (slotToElicit != null) 'slotToElicit': slotToElicit,
      if (slots != null) 'slots': slots,
    };
  }
}

enum MessageFormatType {
  plainText,
  customPayload,
  ssml,
  composite,
}

extension MessageFormatTypeValueExtension on MessageFormatType {
  String toValue() {
    switch (this) {
      case MessageFormatType.plainText:
        return 'PlainText';
      case MessageFormatType.customPayload:
        return 'CustomPayload';
      case MessageFormatType.ssml:
        return 'SSML';
      case MessageFormatType.composite:
        return 'Composite';
    }
  }
}

extension MessageFormatTypeFromString on String {
  MessageFormatType toMessageFormatType() {
    switch (this) {
      case 'PlainText':
        return MessageFormatType.plainText;
      case 'CustomPayload':
        return MessageFormatType.customPayload;
      case 'SSML':
        return MessageFormatType.ssml;
      case 'Composite':
        return MessageFormatType.composite;
    }
    throw Exception('$this is not known in enum MessageFormatType');
  }
}

class PostContentResponse {
  /// A list of active contexts for the session. A context can be set when an
  /// intent is fulfilled or by calling the <code>PostContent</code>,
  /// <code>PostText</code>, or <code>PutSession</code> operation.
  ///
  /// You can use a context to control the intents that can follow up an intent,
  /// or to modify the operation of your application.
  final Object? activeContexts;

  /// One to four alternative intents that may be applicable to the user's intent.
  ///
  /// Each alternative includes a score that indicates how confident Amazon Lex is
  /// that the intent matches the user's intent. The intents are sorted by the
  /// confidence score.
  final Object? alternativeIntents;

  /// The prompt (or statement) to convey to the user. This is based on the bot
  /// configuration and context. For example, if Amazon Lex did not understand the
  /// user intent, it sends the <code>clarificationPrompt</code> configured for
  /// the bot. If the intent requires confirmation before taking the fulfillment
  /// action, it sends the <code>confirmationPrompt</code>. Another example:
  /// Suppose that the Lambda function successfully fulfilled the intent, and sent
  /// a message to convey to the user. Then Amazon Lex sends that message in the
  /// response.
  final Uint8List? audioStream;

  /// The version of the bot that responded to the conversation. You can use this
  /// information to help determine if one version of a bot is performing better
  /// than another version.
  final String? botVersion;

  /// Content type as specified in the <code>Accept</code> HTTP header in the
  /// request.
  final String? contentType;

  /// Identifies the current state of the user interaction. Amazon Lex returns one
  /// of the following values as <code>dialogState</code>. The client can
  /// optionally use this information to customize the user interface.
  ///
  /// <ul>
  /// <li>
  /// <code>ElicitIntent</code> - Amazon Lex wants to elicit the user's intent.
  /// Consider the following examples:
  ///
  /// For example, a user might utter an intent ("I want to order a pizza"). If
  /// Amazon Lex cannot infer the user intent from this utterance, it will return
  /// this dialog state.
  /// </li>
  /// <li>
  /// <code>ConfirmIntent</code> - Amazon Lex is expecting a "yes" or "no"
  /// response.
  ///
  /// For example, Amazon Lex wants user confirmation before fulfilling an intent.
  /// Instead of a simple "yes" or "no" response, a user might respond with
  /// additional information. For example, "yes, but make it a thick crust pizza"
  /// or "no, I want to order a drink." Amazon Lex can process such additional
  /// information (in these examples, update the crust type slot or change the
  /// intent from OrderPizza to OrderDrink).
  /// </li>
  /// <li>
  /// <code>ElicitSlot</code> - Amazon Lex is expecting the value of a slot for
  /// the current intent.
  ///
  /// For example, suppose that in the response Amazon Lex sends this message:
  /// "What size pizza would you like?". A user might reply with the slot value
  /// (e.g., "medium"). The user might also provide additional information in the
  /// response (e.g., "medium thick crust pizza"). Amazon Lex can process such
  /// additional information appropriately.
  /// </li>
  /// <li>
  /// <code>Fulfilled</code> - Conveys that the Lambda function has successfully
  /// fulfilled the intent.
  /// </li>
  /// <li>
  /// <code>ReadyForFulfillment</code> - Conveys that the client has to fulfill
  /// the request.
  /// </li>
  /// <li>
  /// <code>Failed</code> - Conveys that the conversation with the user failed.
  ///
  /// This can happen for various reasons, including that the user does not
  /// provide an appropriate response to prompts from the service (you can
  /// configure how many times Amazon Lex can prompt a user for specific
  /// information), or if the Lambda function fails to fulfill the intent.
  /// </li>
  /// </ul>
  final DialogState? dialogState;

  /// The text used to process the request.
  ///
  /// If the input was an audio stream, the <code>encodedInputTranscript</code>
  /// field contains the text extracted from the audio stream. This is the text
  /// that is actually processed to recognize intents and slot values. You can use
  /// this information to determine if Amazon Lex is correctly processing the
  /// audio that you send.
  ///
  /// The <code>encodedInputTranscript</code> field is base-64 encoded. You must
  /// decode the field before you can use the value.
  final String? encodedInputTranscript;

  /// The message to convey to the user. The message can come from the bot's
  /// configuration or from a Lambda function.
  ///
  /// If the intent is not configured with a Lambda function, or if the Lambda
  /// function returned <code>Delegate</code> as the
  /// <code>dialogAction.type</code> in its response, Amazon Lex decides on the
  /// next course of action and selects an appropriate message from the bot's
  /// configuration based on the current interaction context. For example, if
  /// Amazon Lex isn't able to understand user input, it uses a clarification
  /// prompt message.
  ///
  /// When you create an intent you can assign messages to groups. When messages
  /// are assigned to groups Amazon Lex returns one message from each group in the
  /// response. The message field is an escaped JSON string containing the
  /// messages. For more information about the structure of the JSON string
  /// returned, see <a>msg-prompts-formats</a>.
  ///
  /// If the Lambda function returns a message, Amazon Lex passes it to the client
  /// in its response.
  ///
  /// The <code>encodedMessage</code> field is base-64 encoded. You must decode
  /// the field before you can use the value.
  final String? encodedMessage;

  /// The text used to process the request.
  ///
  /// You can use this field only in the de-DE, en-AU, en-GB, en-US, es-419,
  /// es-ES, es-US, fr-CA, fr-FR, and it-IT locales. In all other locales, the
  /// <code>inputTranscript</code> field is null. You should use the
  /// <code>encodedInputTranscript</code> field instead.
  ///
  /// If the input was an audio stream, the <code>inputTranscript</code> field
  /// contains the text extracted from the audio stream. This is the text that is
  /// actually processed to recognize intents and slot values. You can use this
  /// information to determine if Amazon Lex is correctly processing the audio
  /// that you send.
  final String? inputTranscript;

  /// Current user intent that Amazon Lex is aware of.
  final String? intentName;

  /// You can only use this field in the de-DE, en-AU, en-GB, en-US, es-419,
  /// es-ES, es-US, fr-CA, fr-FR, and it-IT locales. In all other locales, the
  /// <code>message</code> field is null. You should use the
  /// <code>encodedMessage</code> field instead.
  ///
  /// The message to convey to the user. The message can come from the bot's
  /// configuration or from a Lambda function.
  ///
  /// If the intent is not configured with a Lambda function, or if the Lambda
  /// function returned <code>Delegate</code> as the
  /// <code>dialogAction.type</code> in its response, Amazon Lex decides on the
  /// next course of action and selects an appropriate message from the bot's
  /// configuration based on the current interaction context. For example, if
  /// Amazon Lex isn't able to understand user input, it uses a clarification
  /// prompt message.
  ///
  /// When you create an intent you can assign messages to groups. When messages
  /// are assigned to groups Amazon Lex returns one message from each group in the
  /// response. The message field is an escaped JSON string containing the
  /// messages. For more information about the structure of the JSON string
  /// returned, see <a>msg-prompts-formats</a>.
  ///
  /// If the Lambda function returns a message, Amazon Lex passes it to the client
  /// in its response.
  final String? message;

  /// The format of the response message. One of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>PlainText</code> - The message contains plain UTF-8 text.
  /// </li>
  /// <li>
  /// <code>CustomPayload</code> - The message is a custom format for the client.
  /// </li>
  /// <li>
  /// <code>SSML</code> - The message contains text formatted for voice output.
  /// </li>
  /// <li>
  /// <code>Composite</code> - The message contains an escaped JSON object
  /// containing one or more messages from the groups that messages were assigned
  /// to when the intent was created.
  /// </li>
  /// </ul>
  final MessageFormatType? messageFormat;

  /// Provides a score that indicates how confident Amazon Lex is that the
  /// returned intent is the one that matches the user's intent. The score is
  /// between 0.0 and 1.0.
  ///
  /// The score is a relative score, not an absolute score. The score may change
  /// based on improvements to Amazon Lex.
  final Object? nluIntentConfidence;

  /// The sentiment expressed in an utterance.
  ///
  /// When the bot is configured to send utterances to Amazon Comprehend for
  /// sentiment analysis, this field contains the result of the analysis.
  final String? sentimentResponse;

  /// Map of key/value pairs representing the session-specific context
  /// information.
  final Object? sessionAttributes;

  /// The unique identifier for the session.
  final String? sessionId;

  /// If the <code>dialogState</code> value is <code>ElicitSlot</code>, returns
  /// the name of the slot for which Amazon Lex is eliciting a value.
  final String? slotToElicit;

  /// Map of zero or more intent slots (name/value pairs) Amazon Lex detected from
  /// the user input during the conversation. The field is base-64 encoded.
  ///
  /// Amazon Lex creates a resolution list containing likely values for a slot.
  /// The value that it returns is determined by the
  /// <code>valueSelectionStrategy</code> selected when the slot type was created
  /// or updated. If <code>valueSelectionStrategy</code> is set to
  /// <code>ORIGINAL_VALUE</code>, the value provided by the user is returned, if
  /// the user value is similar to the slot values. If
  /// <code>valueSelectionStrategy</code> is set to <code>TOP_RESOLUTION</code>
  /// Amazon Lex returns the first value in the resolution list or, if there is no
  /// resolution list, null. If you don't specify a
  /// <code>valueSelectionStrategy</code>, the default is
  /// <code>ORIGINAL_VALUE</code>.
  final Object? slots;

  PostContentResponse({
    this.activeContexts,
    this.alternativeIntents,
    this.audioStream,
    this.botVersion,
    this.contentType,
    this.dialogState,
    this.encodedInputTranscript,
    this.encodedMessage,
    this.inputTranscript,
    this.intentName,
    this.message,
    this.messageFormat,
    this.nluIntentConfidence,
    this.sentimentResponse,
    this.sessionAttributes,
    this.sessionId,
    this.slotToElicit,
    this.slots,
  });

  Map<String, dynamic> toJson() {
    final activeContexts = this.activeContexts;
    final alternativeIntents = this.alternativeIntents;
    final audioStream = this.audioStream;
    final botVersion = this.botVersion;
    final contentType = this.contentType;
    final dialogState = this.dialogState;
    final encodedInputTranscript = this.encodedInputTranscript;
    final encodedMessage = this.encodedMessage;
    final inputTranscript = this.inputTranscript;
    final intentName = this.intentName;
    final message = this.message;
    final messageFormat = this.messageFormat;
    final nluIntentConfidence = this.nluIntentConfidence;
    final sentimentResponse = this.sentimentResponse;
    final sessionAttributes = this.sessionAttributes;
    final sessionId = this.sessionId;
    final slotToElicit = this.slotToElicit;
    final slots = this.slots;
    return {
      if (audioStream != null) 'audioStream': base64Encode(audioStream),
    };
  }
}

class PostTextResponse {
  /// A list of active contexts for the session. A context can be set when an
  /// intent is fulfilled or by calling the <code>PostContent</code>,
  /// <code>PostText</code>, or <code>PutSession</code> operation.
  ///
  /// You can use a context to control the intents that can follow up an intent,
  /// or to modify the operation of your application.
  final List<ActiveContext>? activeContexts;

  /// One to four alternative intents that may be applicable to the user's intent.
  ///
  /// Each alternative includes a score that indicates how confident Amazon Lex is
  /// that the intent matches the user's intent. The intents are sorted by the
  /// confidence score.
  final List<PredictedIntent>? alternativeIntents;

  /// The version of the bot that responded to the conversation. You can use this
  /// information to help determine if one version of a bot is performing better
  /// than another version.
  final String? botVersion;

  /// Identifies the current state of the user interaction. Amazon Lex returns one
  /// of the following values as <code>dialogState</code>. The client can
  /// optionally use this information to customize the user interface.
  ///
  /// <ul>
  /// <li>
  /// <code>ElicitIntent</code> - Amazon Lex wants to elicit user intent.
  ///
  /// For example, a user might utter an intent ("I want to order a pizza"). If
  /// Amazon Lex cannot infer the user intent from this utterance, it will return
  /// this dialogState.
  /// </li>
  /// <li>
  /// <code>ConfirmIntent</code> - Amazon Lex is expecting a "yes" or "no"
  /// response.
  ///
  /// For example, Amazon Lex wants user confirmation before fulfilling an intent.
  ///
  /// Instead of a simple "yes" or "no," a user might respond with additional
  /// information. For example, "yes, but make it thick crust pizza" or "no, I
  /// want to order a drink". Amazon Lex can process such additional information
  /// (in these examples, update the crust type slot value, or change intent from
  /// OrderPizza to OrderDrink).
  /// </li>
  /// <li>
  /// <code>ElicitSlot</code> - Amazon Lex is expecting a slot value for the
  /// current intent.
  ///
  /// For example, suppose that in the response Amazon Lex sends this message:
  /// "What size pizza would you like?". A user might reply with the slot value
  /// (e.g., "medium"). The user might also provide additional information in the
  /// response (e.g., "medium thick crust pizza"). Amazon Lex can process such
  /// additional information appropriately.
  /// </li>
  /// <li>
  /// <code>Fulfilled</code> - Conveys that the Lambda function configured for the
  /// intent has successfully fulfilled the intent.
  /// </li>
  /// <li>
  /// <code>ReadyForFulfillment</code> - Conveys that the client has to fulfill
  /// the intent.
  /// </li>
  /// <li>
  /// <code>Failed</code> - Conveys that the conversation with the user failed.
  ///
  /// This can happen for various reasons including that the user did not provide
  /// an appropriate response to prompts from the service (you can configure how
  /// many times Amazon Lex can prompt a user for specific information), or the
  /// Lambda function failed to fulfill the intent.
  /// </li>
  /// </ul>
  final DialogState? dialogState;

  /// The current user intent that Amazon Lex is aware of.
  final String? intentName;

  /// The message to convey to the user. The message can come from the bot's
  /// configuration or from a Lambda function.
  ///
  /// If the intent is not configured with a Lambda function, or if the Lambda
  /// function returned <code>Delegate</code> as the
  /// <code>dialogAction.type</code> its response, Amazon Lex decides on the next
  /// course of action and selects an appropriate message from the bot's
  /// configuration based on the current interaction context. For example, if
  /// Amazon Lex isn't able to understand user input, it uses a clarification
  /// prompt message.
  ///
  /// When you create an intent you can assign messages to groups. When messages
  /// are assigned to groups Amazon Lex returns one message from each group in the
  /// response. The message field is an escaped JSON string containing the
  /// messages. For more information about the structure of the JSON string
  /// returned, see <a>msg-prompts-formats</a>.
  ///
  /// If the Lambda function returns a message, Amazon Lex passes it to the client
  /// in its response.
  final String? message;

  /// The format of the response message. One of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>PlainText</code> - The message contains plain UTF-8 text.
  /// </li>
  /// <li>
  /// <code>CustomPayload</code> - The message is a custom format defined by the
  /// Lambda function.
  /// </li>
  /// <li>
  /// <code>SSML</code> - The message contains text formatted for voice output.
  /// </li>
  /// <li>
  /// <code>Composite</code> - The message contains an escaped JSON object
  /// containing one or more messages from the groups that messages were assigned
  /// to when the intent was created.
  /// </li>
  /// </ul>
  final MessageFormatType? messageFormat;

  /// Provides a score that indicates how confident Amazon Lex is that the
  /// returned intent is the one that matches the user's intent. The score is
  /// between 0.0 and 1.0. For more information, see <a
  /// href="https://docs.aws.amazon.com/lex/latest/dg/confidence-scores.html">Confidence
  /// Scores</a>.
  ///
  /// The score is a relative score, not an absolute score. The score may change
  /// based on improvements to Amazon Lex.
  final IntentConfidence? nluIntentConfidence;

  /// Represents the options that the user has to respond to the current prompt.
  /// Response Card can come from the bot configuration (in the Amazon Lex
  /// console, choose the settings button next to a slot) or from a code hook
  /// (Lambda function).
  final ResponseCard? responseCard;

  /// The sentiment expressed in and utterance.
  ///
  /// When the bot is configured to send utterances to Amazon Comprehend for
  /// sentiment analysis, this field contains the result of the analysis.
  final SentimentResponse? sentimentResponse;

  /// A map of key-value pairs representing the session-specific context
  /// information.
  final Map<String, String>? sessionAttributes;

  /// A unique identifier for the session.
  final String? sessionId;

  /// If the <code>dialogState</code> value is <code>ElicitSlot</code>, returns
  /// the name of the slot for which Amazon Lex is eliciting a value.
  final String? slotToElicit;

  /// The intent slots that Amazon Lex detected from the user input in the
  /// conversation.
  ///
  /// Amazon Lex creates a resolution list containing likely values for a slot.
  /// The value that it returns is determined by the
  /// <code>valueSelectionStrategy</code> selected when the slot type was created
  /// or updated. If <code>valueSelectionStrategy</code> is set to
  /// <code>ORIGINAL_VALUE</code>, the value provided by the user is returned, if
  /// the user value is similar to the slot values. If
  /// <code>valueSelectionStrategy</code> is set to <code>TOP_RESOLUTION</code>
  /// Amazon Lex returns the first value in the resolution list or, if there is no
  /// resolution list, null. If you don't specify a
  /// <code>valueSelectionStrategy</code>, the default is
  /// <code>ORIGINAL_VALUE</code>.
  final Map<String, String>? slots;

  PostTextResponse({
    this.activeContexts,
    this.alternativeIntents,
    this.botVersion,
    this.dialogState,
    this.intentName,
    this.message,
    this.messageFormat,
    this.nluIntentConfidence,
    this.responseCard,
    this.sentimentResponse,
    this.sessionAttributes,
    this.sessionId,
    this.slotToElicit,
    this.slots,
  });

  factory PostTextResponse.fromJson(Map<String, dynamic> json) {
    return PostTextResponse(
      activeContexts: (json['activeContexts'] as List?)
          ?.whereNotNull()
          .map((e) => ActiveContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      alternativeIntents: (json['alternativeIntents'] as List?)
          ?.whereNotNull()
          .map((e) => PredictedIntent.fromJson(e as Map<String, dynamic>))
          .toList(),
      botVersion: json['botVersion'] as String?,
      dialogState: (json['dialogState'] as String?)?.toDialogState(),
      intentName: json['intentName'] as String?,
      message: json['message'] as String?,
      messageFormat: (json['messageFormat'] as String?)?.toMessageFormatType(),
      nluIntentConfidence: json['nluIntentConfidence'] != null
          ? IntentConfidence.fromJson(
              json['nluIntentConfidence'] as Map<String, dynamic>)
          : null,
      responseCard: json['responseCard'] != null
          ? ResponseCard.fromJson(json['responseCard'] as Map<String, dynamic>)
          : null,
      sentimentResponse: json['sentimentResponse'] != null
          ? SentimentResponse.fromJson(
              json['sentimentResponse'] as Map<String, dynamic>)
          : null,
      sessionAttributes: (json['sessionAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      sessionId: json['sessionId'] as String?,
      slotToElicit: json['slotToElicit'] as String?,
      slots: (json['slots'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final activeContexts = this.activeContexts;
    final alternativeIntents = this.alternativeIntents;
    final botVersion = this.botVersion;
    final dialogState = this.dialogState;
    final intentName = this.intentName;
    final message = this.message;
    final messageFormat = this.messageFormat;
    final nluIntentConfidence = this.nluIntentConfidence;
    final responseCard = this.responseCard;
    final sentimentResponse = this.sentimentResponse;
    final sessionAttributes = this.sessionAttributes;
    final sessionId = this.sessionId;
    final slotToElicit = this.slotToElicit;
    final slots = this.slots;
    return {
      if (activeContexts != null) 'activeContexts': activeContexts,
      if (alternativeIntents != null) 'alternativeIntents': alternativeIntents,
      if (botVersion != null) 'botVersion': botVersion,
      if (dialogState != null) 'dialogState': dialogState.toValue(),
      if (intentName != null) 'intentName': intentName,
      if (message != null) 'message': message,
      if (messageFormat != null) 'messageFormat': messageFormat.toValue(),
      if (nluIntentConfidence != null)
        'nluIntentConfidence': nluIntentConfidence,
      if (responseCard != null) 'responseCard': responseCard,
      if (sentimentResponse != null) 'sentimentResponse': sentimentResponse,
      if (sessionAttributes != null) 'sessionAttributes': sessionAttributes,
      if (sessionId != null) 'sessionId': sessionId,
      if (slotToElicit != null) 'slotToElicit': slotToElicit,
      if (slots != null) 'slots': slots,
    };
  }
}

/// An intent that Amazon Lex suggests satisfies the user's intent. Includes the
/// name of the intent, the confidence that Amazon Lex has that the user's
/// intent is satisfied, and the slots defined for the intent.
class PredictedIntent {
  /// The name of the intent that Amazon Lex suggests satisfies the user's intent.
  final String? intentName;

  /// Indicates how confident Amazon Lex is that an intent satisfies the user's
  /// intent.
  final IntentConfidence? nluIntentConfidence;

  /// The slot and slot values associated with the predicted intent.
  final Map<String, String>? slots;

  PredictedIntent({
    this.intentName,
    this.nluIntentConfidence,
    this.slots,
  });

  factory PredictedIntent.fromJson(Map<String, dynamic> json) {
    return PredictedIntent(
      intentName: json['intentName'] as String?,
      nluIntentConfidence: json['nluIntentConfidence'] != null
          ? IntentConfidence.fromJson(
              json['nluIntentConfidence'] as Map<String, dynamic>)
          : null,
      slots: (json['slots'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final intentName = this.intentName;
    final nluIntentConfidence = this.nluIntentConfidence;
    final slots = this.slots;
    return {
      if (intentName != null) 'intentName': intentName,
      if (nluIntentConfidence != null)
        'nluIntentConfidence': nluIntentConfidence,
      if (slots != null) 'slots': slots,
    };
  }
}

class PutSessionResponse {
  /// A list of active contexts for the session.
  final Object? activeContexts;

  /// The audio version of the message to convey to the user.
  final Uint8List? audioStream;

  /// Content type as specified in the <code>Accept</code> HTTP header in the
  /// request.
  final String? contentType;

  /// <p/>
  /// <ul>
  /// <li>
  /// <code>ConfirmIntent</code> - Amazon Lex is expecting a "yes" or "no"
  /// response to confirm the intent before fulfilling an intent.
  /// </li>
  /// <li>
  /// <code>ElicitIntent</code> - Amazon Lex wants to elicit the user's intent.
  /// </li>
  /// <li>
  /// <code>ElicitSlot</code> - Amazon Lex is expecting the value of a slot for
  /// the current intent.
  /// </li>
  /// <li>
  /// <code>Failed</code> - Conveys that the conversation with the user has
  /// failed. This can happen for various reasons, including the user does not
  /// provide an appropriate response to prompts from the service, or if the
  /// Lambda function fails to fulfill the intent.
  /// </li>
  /// <li>
  /// <code>Fulfilled</code> - Conveys that the Lambda function has sucessfully
  /// fulfilled the intent.
  /// </li>
  /// <li>
  /// <code>ReadyForFulfillment</code> - Conveys that the client has to fulfill
  /// the intent.
  /// </li>
  /// </ul>
  final DialogState? dialogState;

  /// The next message that should be presented to the user.
  ///
  /// The <code>encodedMessage</code> field is base-64 encoded. You must decode
  /// the field before you can use the value.
  final String? encodedMessage;

  /// The name of the current intent.
  final String? intentName;

  /// The next message that should be presented to the user.
  ///
  /// You can only use this field in the de-DE, en-AU, en-GB, en-US, es-419,
  /// es-ES, es-US, fr-CA, fr-FR, and it-IT locales. In all other locales, the
  /// <code>message</code> field is null. You should use the
  /// <code>encodedMessage</code> field instead.
  final String? message;

  /// The format of the response message. One of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>PlainText</code> - The message contains plain UTF-8 text.
  /// </li>
  /// <li>
  /// <code>CustomPayload</code> - The message is a custom format for the client.
  /// </li>
  /// <li>
  /// <code>SSML</code> - The message contains text formatted for voice output.
  /// </li>
  /// <li>
  /// <code>Composite</code> - The message contains an escaped JSON object
  /// containing one or more messages from the groups that messages were assigned
  /// to when the intent was created.
  /// </li>
  /// </ul>
  final MessageFormatType? messageFormat;

  /// Map of key/value pairs representing session-specific context information.
  final Object? sessionAttributes;

  /// A unique identifier for the session.
  final String? sessionId;

  /// If the <code>dialogState</code> is <code>ElicitSlot</code>, returns the name
  /// of the slot for which Amazon Lex is eliciting a value.
  final String? slotToElicit;

  /// Map of zero or more intent slots Amazon Lex detected from the user input
  /// during the conversation.
  ///
  /// Amazon Lex creates a resolution list containing likely values for a slot.
  /// The value that it returns is determined by the
  /// <code>valueSelectionStrategy</code> selected when the slot type was created
  /// or updated. If <code>valueSelectionStrategy</code> is set to
  /// <code>ORIGINAL_VALUE</code>, the value provided by the user is returned, if
  /// the user value is similar to the slot values. If
  /// <code>valueSelectionStrategy</code> is set to <code>TOP_RESOLUTION</code>
  /// Amazon Lex returns the first value in the resolution list or, if there is no
  /// resolution list, null. If you don't specify a
  /// <code>valueSelectionStrategy</code> the default is
  /// <code>ORIGINAL_VALUE</code>.
  final Object? slots;

  PutSessionResponse({
    this.activeContexts,
    this.audioStream,
    this.contentType,
    this.dialogState,
    this.encodedMessage,
    this.intentName,
    this.message,
    this.messageFormat,
    this.sessionAttributes,
    this.sessionId,
    this.slotToElicit,
    this.slots,
  });

  Map<String, dynamic> toJson() {
    final activeContexts = this.activeContexts;
    final audioStream = this.audioStream;
    final contentType = this.contentType;
    final dialogState = this.dialogState;
    final encodedMessage = this.encodedMessage;
    final intentName = this.intentName;
    final message = this.message;
    final messageFormat = this.messageFormat;
    final sessionAttributes = this.sessionAttributes;
    final sessionId = this.sessionId;
    final slotToElicit = this.slotToElicit;
    final slots = this.slots;
    return {
      if (audioStream != null) 'audioStream': base64Encode(audioStream),
    };
  }
}

/// If you configure a response card when creating your bots, Amazon Lex
/// substitutes the session attributes and slot values that are available, and
/// then returns it. The response card can also come from a Lambda function (
/// <code>dialogCodeHook</code> and <code>fulfillmentActivity</code> on an
/// intent).
class ResponseCard {
  /// The content type of the response.
  final ContentType? contentType;

  /// An array of attachment objects representing options.
  final List<GenericAttachment>? genericAttachments;

  /// The version of the response card format.
  final String? version;

  ResponseCard({
    this.contentType,
    this.genericAttachments,
    this.version,
  });

  factory ResponseCard.fromJson(Map<String, dynamic> json) {
    return ResponseCard(
      contentType: (json['contentType'] as String?)?.toContentType(),
      genericAttachments: (json['genericAttachments'] as List?)
          ?.whereNotNull()
          .map((e) => GenericAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final genericAttachments = this.genericAttachments;
    final version = this.version;
    return {
      if (contentType != null) 'contentType': contentType.toValue(),
      if (genericAttachments != null) 'genericAttachments': genericAttachments,
      if (version != null) 'version': version,
    };
  }
}

/// The sentiment expressed in an utterance.
///
/// When the bot is configured to send utterances to Amazon Comprehend for
/// sentiment analysis, this field structure contains the result of the
/// analysis.
class SentimentResponse {
  /// The inferred sentiment that Amazon Comprehend has the highest confidence in.
  final String? sentimentLabel;

  /// The likelihood that the sentiment was correctly inferred.
  final String? sentimentScore;

  SentimentResponse({
    this.sentimentLabel,
    this.sentimentScore,
  });

  factory SentimentResponse.fromJson(Map<String, dynamic> json) {
    return SentimentResponse(
      sentimentLabel: json['sentimentLabel'] as String?,
      sentimentScore: json['sentimentScore'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sentimentLabel = this.sentimentLabel;
    final sentimentScore = this.sentimentScore;
    return {
      if (sentimentLabel != null) 'sentimentLabel': sentimentLabel,
      if (sentimentScore != null) 'sentimentScore': sentimentScore,
    };
  }
}

class BadGatewayException extends _s.GenericAwsException {
  BadGatewayException({String? type, String? message})
      : super(type: type, code: 'BadGatewayException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class DependencyFailedException extends _s.GenericAwsException {
  DependencyFailedException({String? type, String? message})
      : super(type: type, code: 'DependencyFailedException', message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class LoopDetectedException extends _s.GenericAwsException {
  LoopDetectedException({String? type, String? message})
      : super(type: type, code: 'LoopDetectedException', message: message);
}

class NotAcceptableException extends _s.GenericAwsException {
  NotAcceptableException({String? type, String? message})
      : super(type: type, code: 'NotAcceptableException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class RequestTimeoutException extends _s.GenericAwsException {
  RequestTimeoutException({String? type, String? message})
      : super(type: type, code: 'RequestTimeoutException', message: message);
}

class UnsupportedMediaTypeException extends _s.GenericAwsException {
  UnsupportedMediaTypeException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedMediaTypeException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadGatewayException': (type, message) =>
      BadGatewayException(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'DependencyFailedException': (type, message) =>
      DependencyFailedException(type: type, message: message),
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'LoopDetectedException': (type, message) =>
      LoopDetectedException(type: type, message: message),
  'NotAcceptableException': (type, message) =>
      NotAcceptableException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'RequestTimeoutException': (type, message) =>
      RequestTimeoutException(type: type, message: message),
  'UnsupportedMediaTypeException': (type, message) =>
      UnsupportedMediaTypeException(type: type, message: message),
};
