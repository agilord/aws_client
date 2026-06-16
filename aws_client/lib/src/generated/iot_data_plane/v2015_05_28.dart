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

/// IoT data enables secure, bi-directional communication between
/// Internet-connected things (such as sensors, actuators, embedded devices, or
/// smart appliances) and the Amazon Web Services cloud. It implements a broker
/// for applications and things to publish messages over HTTP (Publish) and
/// retrieve, update, and delete shadows. A shadow is a persistent
/// representation of your things and their state in the Amazon Web Services
/// cloud.
class IoTDataPlane {
  final _s.RestJsonProtocol _protocol;
  IoTDataPlane({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'data-ats.iot',
            signingName: 'iotdata',
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

  /// Disconnects a connected MQTT client from Amazon Web Services IoT Core.
  /// When you disconnect a client, Amazon Web Services IoT Core closes the
  /// client's network connection and optionally cleans the session state.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteConnection</a>
  /// action.
  ///
  /// May throw [ForbiddenException].
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [clientId] :
  /// The unique identifier of the MQTT client to disconnect. The client ID
  /// can't start with a dollar sign ($).
  ///
  /// MQTT client IDs must be URL encoded (percent-encoded) when they contain
  /// characters that are not valid in HTTP requests, such as spaces, forward
  /// slashes (/), and UTF-8 characters.
  ///
  /// Parameter [cleanSession] :
  /// Specifies whether to remove the client's persistent session state when
  /// disconnecting. Set to <code>TRUE</code> to delete all session information,
  /// including subscriptions and queued messages. Set to <code>FALSE</code> to
  /// preserve the session state for <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/mqtt.html#mqtt-persistent-sessions">persistent
  /// sessions</a>. For clean sessions this parameter will be ignored. By
  /// default, this is set to <code>FALSE</code> (preserves the session state).
  ///
  /// Parameter [preventWillMessage] :
  /// Controls if Amazon Web Services IoT Core publishes the client's Last Will
  /// and Testament (LWT) message upon disconnection. Set to <code>TRUE</code>
  /// to prevent publishing the LWT message. Set to <code>FALSE</code> to ensure
  /// that LWT is published. By default, this is set to <code>FALSE</code> (LWT
  /// message is published).
  Future<void> deleteConnection({
    required String clientId,
    bool? cleanSession,
    bool? preventWillMessage,
  }) async {
    final $query = <String, List<String>>{
      if (cleanSession != null) 'cleanSession': [cleanSession.toString()],
      if (preventWillMessage != null)
        'preventWillMessage': [preventWillMessage.toString()],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/connections/${Uri.encodeComponent(clientId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the shadow for the specified thing.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteThingShadow</a>
  /// action.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/iot/latest/developerguide/API_DeleteThingShadow.html">DeleteThingShadow</a>
  /// in the IoT Developer Guide.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [MethodNotAllowedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [UnsupportedDocumentEncodingException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing.
  ///
  /// Parameter [shadowName] :
  /// The name of the shadow.
  Future<DeleteThingShadowResponse> deleteThingShadow({
    required String thingName,
    String? shadowName,
  }) async {
    final $query = <String, List<String>>{
      if (shadowName != null) 'name': [shadowName],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/shadow',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteThingShadowResponse(
      payload: await response.stream.toBytes(),
    );
  }

  /// Retrieves connection information for the specified MQTT client.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetConnection</a>
  /// action.
  ///
  /// May throw [ForbiddenException].
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [clientId] :
  /// The unique identifier of the MQTT client to retrieve connection
  /// information. The client ID can't start with a dollar sign ($).
  ///
  /// MQTT client IDs must be URL encoded (percent-encoded) when they contain
  /// characters that are not valid in HTTP requests, such as spaces, forward
  /// slashes (/), and UTF-8 characters.
  ///
  /// Parameter [includeSocketInformation] :
  /// Specifies if socket information (sourcePort, targetPort, sourceIp,
  /// targetIp) should be included in the GetConnection response. Set to
  /// <code>TRUE</code> to include socket information. Set to <code>FALSE</code>
  /// to omit socket information. By default, this is set to <code>FALSE</code>.
  /// See the <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/mqtt.html#mqtt-client-disconnect">developer
  /// guide</a> for how to authorize this parameter.
  Future<GetConnectionResponse> getConnection({
    required String clientId,
    bool? includeSocketInformation,
  }) async {
    final $query = <String, List<String>>{
      if (includeSocketInformation != null)
        'includeSocketInformation': [includeSocketInformation.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/connections/${Uri.encodeComponent(clientId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetConnectionResponse.fromJson(response);
  }

  /// Gets the details of a single retained message for the specified topic.
  ///
  /// This action returns the message payload of the retained message, which can
  /// incur messaging costs. To list only the topic names of the retained
  /// messages, call <a
  /// href="https://docs.aws.amazon.com/iot/latest/apireference/API_iotdata_ListRetainedMessages.html">ListRetainedMessages</a>.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html">GetRetainedMessage</a>
  /// action.
  ///
  /// For more information about messaging costs, see <a
  /// href="http://aws.amazon.com/iot-core/pricing/#Messaging">Amazon Web
  /// Services IoT Core pricing - Messaging</a>.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [MethodNotAllowedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [topic] :
  /// The topic name of the retained message to retrieve.
  Future<GetRetainedMessageResponse> getRetainedMessage({
    required String topic,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/retainedMessage/${Uri.encodeComponent(topic)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRetainedMessageResponse.fromJson(response);
  }

  /// Gets the shadow for the specified thing.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetThingShadow</a>
  /// action.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/iot/latest/developerguide/API_GetThingShadow.html">GetThingShadow</a>
  /// in the IoT Developer Guide.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [MethodNotAllowedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [UnsupportedDocumentEncodingException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing.
  ///
  /// Parameter [shadowName] :
  /// The name of the shadow.
  Future<GetThingShadowResponse> getThingShadow({
    required String thingName,
    String? shadowName,
  }) async {
    final $query = <String, List<String>>{
      if (shadowName != null) 'name': [shadowName],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/shadow',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetThingShadowResponse(
      payload: await response.stream.toBytes(),
    );
  }

  /// Lists the shadows for the specified thing.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListNamedShadowsForThing</a>
  /// action.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [MethodNotAllowedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The result page size.
  Future<ListNamedShadowsForThingResponse> listNamedShadowsForThing({
    required String thingName,
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api/things/shadow/ListNamedShadowsForThing/${Uri.encodeComponent(thingName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNamedShadowsForThingResponse.fromJson(response);
  }

  /// Lists summary information about the retained messages stored for the
  /// account.
  ///
  /// This action returns only the topic names of the retained messages. It
  /// doesn't return any message payloads. Although this action doesn't return a
  /// message payload, it can still incur messaging costs.
  ///
  /// To get the message payload of a retained message, call <a
  /// href="https://docs.aws.amazon.com/iot/latest/apireference/API_iotdata_GetRetainedMessage.html">GetRetainedMessage</a>
  /// with the topic name of the retained message.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html">ListRetainedMessages</a>
  /// action.
  ///
  /// For more information about messaging costs, see <a
  /// href="http://aws.amazon.com/iot-core/pricing/#Messaging">Amazon Web
  /// Services IoT Core pricing - Messaging</a>.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [MethodNotAllowedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListRetainedMessagesResponse> listRetainedMessages({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/retainedMessage',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRetainedMessagesResponse.fromJson(response);
  }

  /// Returns a list of all subscriptions for MQTT clients with active sessions,
  /// including offline clients with persistent sessions.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListSubscriptions</a>
  /// action.
  ///
  /// May throw [ForbiddenException].
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [clientId] :
  /// The unique identifier of the MQTT client to list subscriptions for. The
  /// client ID can't start with a dollar sign ($).
  ///
  /// MQTT client IDs must be URL encoded (percent-encoded) when they contain
  /// characters that are not valid in HTTP requests, such as spaces, forward
  /// slashes (/), and UTF-8 characters.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of subscriptions to return in a single request. By
  /// default, this is set to 20.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListSubscriptionsResponse> listSubscriptions({
    required String clientId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/connections/${Uri.encodeComponent(clientId)}/subscriptions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSubscriptionsResponse.fromJson(response);
  }

  /// Publishes an MQTT message.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">Publish</a>
  /// action.
  ///
  /// For more information about MQTT messages, see <a
  /// href="http://docs.aws.amazon.com/iot/latest/developerguide/mqtt.html">MQTT
  /// Protocol</a> in the IoT Developer Guide.
  ///
  /// For more information about messaging costs, see <a
  /// href="http://aws.amazon.com/iot-core/pricing/#Messaging">Amazon Web
  /// Services IoT Core pricing - Messaging</a>.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [MethodNotAllowedException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [topic] :
  /// The name of the MQTT topic.
  ///
  /// Parameter [contentType] :
  /// A UTF-8 encoded string that describes the content of the publishing
  /// message.
  ///
  /// Parameter [correlationData] :
  /// The base64-encoded binary data used by the sender of the request message
  /// to identify which request the response message is for when it's received.
  /// <code>correlationData</code> is an HTTP header value in the API.
  ///
  /// Parameter [messageExpiry] :
  /// A user-defined integer value that represents the message expiry interval
  /// in seconds. If absent, the message doesn't expire. For more information
  /// about the limits of <code>messageExpiry</code>, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/iot-core.html#message-broker-limits">Amazon
  /// Web Services IoT Core message broker and protocol limits and quotas </a>
  /// from the Amazon Web Services Reference Guide.
  ///
  /// Parameter [payload] :
  /// The message body. MQTT accepts text, binary, and empty (null) message
  /// payloads.
  ///
  /// Publishing an empty (null) payload with <b>retain</b> = <code>true</code>
  /// deletes the retained message identified by <b>topic</b> from Amazon Web
  /// Services IoT Core.
  ///
  /// Parameter [payloadFormatIndicator] :
  /// An <code>Enum</code> string value that indicates whether the payload is
  /// formatted as UTF-8. <code>payloadFormatIndicator</code> is an HTTP header
  /// value in the API.
  ///
  /// Parameter [qos] :
  /// The Quality of Service (QoS) level. The default QoS level is 0.
  ///
  /// Parameter [responseTopic] :
  /// A UTF-8 encoded string that's used as the topic name for a response
  /// message. The response topic is used to describe the topic which the
  /// receiver should publish to as part of the request-response flow. The topic
  /// must not contain wildcard characters.
  ///
  /// Parameter [retain] :
  /// A Boolean value that determines whether to set the RETAIN flag when the
  /// message is published.
  ///
  /// Setting the RETAIN flag causes the message to be retained and sent to new
  /// subscribers to the topic.
  ///
  /// Valid values: <code>true</code> | <code>false</code>
  ///
  /// Default value: <code>false</code>
  ///
  /// Parameter [userProperties] :
  /// A JSON string that contains an array of JSON objects. If you don’t use
  /// Amazon Web Services SDK or CLI, you must encode the JSON string to base64
  /// format before adding it to the HTTP header. <code>userProperties</code> is
  /// an HTTP header value in the API.
  ///
  /// The following example <code>userProperties</code> parameter is a JSON
  /// string which represents two User Properties. Note that it needs to be
  /// base64-encoded:
  ///
  /// <code>[{"deviceName": "alpha"}, {"deviceCnt": "45"}]</code>
  Future<void> publish({
    required String topic,
    String? contentType,
    String? correlationData,
    int? messageExpiry,
    Uint8List? payload,
    PayloadFormatIndicator? payloadFormatIndicator,
    int? qos,
    String? responseTopic,
    bool? retain,
    Object? userProperties,
  }) async {
    _s.validateNumRange(
      'qos',
      qos,
      0,
      1,
    );
    final headers = <String, String>{
      if (correlationData != null)
        'x-amz-mqtt5-correlation-data': correlationData.toString(),
      if (payloadFormatIndicator != null)
        'x-amz-mqtt5-payload-format-indicator': payloadFormatIndicator.value,
      if (userProperties != null)
        'x-amz-mqtt5-user-properties':
            base64Encode(utf8.encode(jsonEncode(userProperties))),
    };
    final $query = <String, List<String>>{
      if (contentType != null) 'contentType': [contentType],
      if (messageExpiry != null) 'messageExpiry': [messageExpiry.toString()],
      if (qos != null) 'qos': [qos.toString()],
      if (responseTopic != null) 'responseTopic': [responseTopic],
      if (retain != null) 'retain': [retain.toString()],
    };
    await _protocol.send(
      payload: payload,
      method: 'POST',
      requestUri: '/topics/${Uri.encodeComponent(topic)}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sends an MQTT message directly to a specific client identified by its
  /// client ID.
  ///
  /// <code>SendDirectMessage</code> targets a single client ID. The receiving
  /// client does not need to subscribe to the topic, but the receiver's policy
  /// must allow <code>iot:Receive</code> on the specified topic.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">SendDirectMessage</a>
  /// action.
  ///
  /// For more information about messaging costs, see <a
  /// href="http://aws.amazon.com/iot-core/pricing/">Amazon Web Services IoT
  /// Core pricing</a>.
  ///
  /// May throw [ForbiddenException].
  /// May throw [GatewayTimeoutException].
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [RequestEntityTooLargeException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [clientId] :
  /// The unique identifier of the MQTT client to send the message to.
  ///
  /// Client IDs must not exceed 128 characters and can't start with a dollar
  /// sign ($). MQTT client IDs must be URL encoded (percent-encoded) when they
  /// contain characters that are not valid in HTTP requests, such as spaces,
  /// forward slashes (/), and UTF-8 characters. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/iot-core.html#message-broker-limits">Amazon
  /// Web Services IoT Core message broker and protocol limits and quotas</a>.
  ///
  /// Parameter [topic] :
  /// The topic of the outbound MQTT Publish message to the receiving client.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/iot-core.html#message-broker-limits">Amazon
  /// Web Services IoT Core message broker and protocol limits and quotas</a>.
  ///
  /// Parameter [confirmation] :
  /// A Boolean value that specifies whether to wait for delivery confirmation
  /// from the receiving client.
  ///
  /// When set to <code>true</code>, the API delivers the message at QoS 1 and
  /// waits for the client to send a delivery confirmation (PUBACK) before
  /// returning a successful response. If delivery confirmation is not received
  /// within the specified <code>timeout</code> period, the API returns HTTP
  /// 504.
  ///
  /// When set to <code>false</code>, the API delivers the message at QoS 0 and
  /// returns after Amazon Web Services IoT Core attempts to deliver the
  /// message.
  ///
  /// Valid values: <code>true</code> | <code>false</code>
  ///
  /// Default value: <code>false</code>
  ///
  /// Parameter [contentType] :
  /// The MQTT5 content type property forwarded to the receiving client (for
  /// example, <code>application/json</code>).
  ///
  /// Parameter [correlationData] :
  /// The base64-encoded binary data used by the sender of the request message
  /// to identify which request the response message is for when it's received.
  /// <code>correlationData</code> is an HTTP header value in the API.
  ///
  /// Parameter [payload] :
  /// The message body. MQTT accepts text, binary, and empty (null) message
  /// payloads.
  ///
  /// Parameter [payloadFormatIndicator] :
  /// An <code>Enum</code> string value that indicates whether the payload is
  /// formatted as UTF-8. <code>payloadFormatIndicator</code> is an HTTP header
  /// value in the API.
  ///
  /// Parameter [responseTopic] :
  /// A UTF-8 encoded string that's used as the topic name for a response
  /// message. The response topic describes the topic which the receiver should
  /// publish to as part of the request-response flow. The topic must not
  /// contain wildcard characters. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/iot-core.html#message-broker-limits">Amazon
  /// Web Services IoT Core message broker and protocol limits and quotas</a>.
  ///
  /// Parameter [timeout] :
  /// An integer that represents the maximum time, in seconds, to wait for a
  /// delivery confirmation (PUBACK) from the receiving client after the message
  /// has been delivered. This parameter is only used when
  /// <code>confirmation</code> is set to <code>true</code>. If
  /// <code>confirmation</code> is <code>false</code>, this parameter is
  /// ignored.
  ///
  /// The total API response time may be higher than this value due to internal
  /// processing. Set your HTTP client timeout to a value greater than this
  /// parameter.
  ///
  /// Valid range: 1 to 15 seconds.
  ///
  /// Default value: <code>5</code> seconds.
  ///
  /// Parameter [userProperties] :
  /// A JSON string that contains an array of JSON objects. If you don't use
  /// Amazon Web Services SDK or CLI, you must encode the JSON string to base64
  /// format before adding it to the HTTP header. <code>userProperties</code> is
  /// an HTTP header value in the API.
  ///
  /// For MQTT 3.1.1 clients, user properties are silently dropped.
  ///
  /// The following example <code>userProperties</code> parameter is a JSON
  /// string which represents two User Properties. Note that it needs to be
  /// base64-encoded:
  ///
  /// <code>[{"deviceName": "alpha"}, {"deviceCnt": "45"}]</code>
  Future<SendDirectMessageResponse> sendDirectMessage({
    required String clientId,
    required String topic,
    bool? confirmation,
    String? contentType,
    String? correlationData,
    Uint8List? payload,
    PayloadFormatIndicator? payloadFormatIndicator,
    String? responseTopic,
    int? timeout,
    Object? userProperties,
  }) async {
    final headers = <String, String>{
      if (correlationData != null)
        'x-amz-mqtt5-correlation-data': correlationData.toString(),
      if (payloadFormatIndicator != null)
        'x-amz-mqtt5-payload-format-indicator': payloadFormatIndicator.value,
      if (userProperties != null)
        'x-amz-mqtt5-user-properties':
            base64Encode(utf8.encode(jsonEncode(userProperties))),
    };
    final $query = <String, List<String>>{
      'topic': [topic],
      if (confirmation != null) 'confirmation': [confirmation.toString()],
      if (contentType != null) 'contentType': [contentType],
      if (responseTopic != null) 'responseTopic': [responseTopic],
      if (timeout != null) 'timeout': [timeout.toString()],
    };
    final response = await _protocol.send(
      payload: payload,
      method: 'POST',
      requestUri: '/connections/${Uri.encodeComponent(clientId)}/messages',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return SendDirectMessageResponse.fromJson(response);
  }

  /// Updates the shadow for the specified thing.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateThingShadow</a>
  /// action.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/iot/latest/developerguide/API_UpdateThingShadow.html">UpdateThingShadow</a>
  /// in the IoT Developer Guide.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [MethodNotAllowedException].
  /// May throw [RequestEntityTooLargeException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [UnsupportedDocumentEncodingException].
  ///
  /// Parameter [payload] :
  /// The state information, in JSON format.
  ///
  /// Parameter [thingName] :
  /// The name of the thing.
  ///
  /// Parameter [shadowName] :
  /// The name of the shadow.
  Future<UpdateThingShadowResponse> updateThingShadow({
    required Uint8List payload,
    required String thingName,
    String? shadowName,
  }) async {
    final $query = <String, List<String>>{
      if (shadowName != null) 'name': [shadowName],
    };
    final response = await _protocol.sendRaw(
      payload: payload,
      method: 'POST',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/shadow',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateThingShadowResponse(
      payload: await response.stream.toBytes(),
    );
  }
}

/// The output from the DeleteThingShadow operation.
class DeleteThingShadowResponse {
  /// The state information, in JSON format.
  final Uint8List payload;

  DeleteThingShadowResponse({
    required this.payload,
  });

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    return {
      'payload': base64Encode(payload),
    };
  }
}

class GetConnectionResponse {
  /// Indicates whether the client is using a clean session. Returns
  /// <code>true</code> for clean sessions or <code>false</code> for persistent
  /// sessions.
  final bool? cleanSession;

  /// The unique identifier of the MQTT client. This is the same client ID that
  /// was used when the client established the connection.
  final String? clientId;

  /// The connection state of the client. Returns <code>true</code> if the client
  /// is currently connected, or <code>false</code> if the client is not
  /// connected.
  final bool? connected;

  /// Unix timestamp (in milliseconds) indicating when the client connected.
  /// Present only when connected is true.
  final int? connectedSince;

  /// The reason for the last disconnection, if the client is currently
  /// disconnected. See the <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/life-cycle-events.html#connect-disconnect">developer
  /// guide</a> for valid disconnect reasons.
  final String? disconnectReason;

  /// Unix timestamp (in milliseconds) indicating when the client disconnected.
  /// Present only when connected is false. This information is available for 30
  /// minutes after the client disconnects.
  final int? disconnectedSince;

  /// The keep-alive interval in seconds that the client specified when
  /// establishing the connection.
  final int? keepAliveDuration;

  /// The session expiry interval in seconds for the MQTT client connection. This
  /// is configured by the user. This value indicates how long the session will
  /// remain active after the client disconnects.
  final int? sessionExpiry;

  /// The IP address of the client that initiated the connection.
  final String? sourceIp;

  /// The client's source port.
  final int? sourcePort;

  /// The IP address of the Amazon Web Services IoT Core endpoint that the client
  /// connected to. For clients connected to VPC endpoints, this is the private IP
  /// address of the network interface the client is connected to.
  final String? targetIp;

  /// The port number of the Amazon Web Services IoT Core endpoint that the client
  /// connected to.
  final int? targetPort;

  /// The name of the thing associated with the principal of the MQTT client, if
  /// applicable.
  final String? thingName;

  /// The ID of the VPC endpoint. Present for clients connected to IoT Core via a
  /// <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/IoTCore-VPC.html">VPC
  /// endpoint</a>.
  final String? vpcEndpointId;

  GetConnectionResponse({
    this.cleanSession,
    this.clientId,
    this.connected,
    this.connectedSince,
    this.disconnectReason,
    this.disconnectedSince,
    this.keepAliveDuration,
    this.sessionExpiry,
    this.sourceIp,
    this.sourcePort,
    this.targetIp,
    this.targetPort,
    this.thingName,
    this.vpcEndpointId,
  });

  factory GetConnectionResponse.fromJson(Map<String, dynamic> json) {
    return GetConnectionResponse(
      cleanSession: json['cleanSession'] as bool?,
      clientId: json['clientId'] as String?,
      connected: json['connected'] as bool?,
      connectedSince: json['connectedSince'] as int?,
      disconnectReason: json['disconnectReason'] as String?,
      disconnectedSince: json['disconnectedSince'] as int?,
      keepAliveDuration: json['keepAliveDuration'] as int?,
      sessionExpiry: json['sessionExpiry'] as int?,
      sourceIp: json['sourceIp'] as String?,
      sourcePort: json['sourcePort'] as int?,
      targetIp: json['targetIp'] as String?,
      targetPort: json['targetPort'] as int?,
      thingName: json['thingName'] as String?,
      vpcEndpointId: json['vpcEndpointId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cleanSession = this.cleanSession;
    final clientId = this.clientId;
    final connected = this.connected;
    final connectedSince = this.connectedSince;
    final disconnectReason = this.disconnectReason;
    final disconnectedSince = this.disconnectedSince;
    final keepAliveDuration = this.keepAliveDuration;
    final sessionExpiry = this.sessionExpiry;
    final sourceIp = this.sourceIp;
    final sourcePort = this.sourcePort;
    final targetIp = this.targetIp;
    final targetPort = this.targetPort;
    final thingName = this.thingName;
    final vpcEndpointId = this.vpcEndpointId;
    return {
      if (cleanSession != null) 'cleanSession': cleanSession,
      if (clientId != null) 'clientId': clientId,
      if (connected != null) 'connected': connected,
      if (connectedSince != null) 'connectedSince': connectedSince,
      if (disconnectReason != null) 'disconnectReason': disconnectReason,
      if (disconnectedSince != null) 'disconnectedSince': disconnectedSince,
      if (keepAliveDuration != null) 'keepAliveDuration': keepAliveDuration,
      if (sessionExpiry != null) 'sessionExpiry': sessionExpiry,
      if (sourceIp != null) 'sourceIp': sourceIp,
      if (sourcePort != null) 'sourcePort': sourcePort,
      if (targetIp != null) 'targetIp': targetIp,
      if (targetPort != null) 'targetPort': targetPort,
      if (thingName != null) 'thingName': thingName,
      if (vpcEndpointId != null) 'vpcEndpointId': vpcEndpointId,
    };
  }
}

/// The output from the GetRetainedMessage operation.
class GetRetainedMessageResponse {
  /// The Epoch date and time, in milliseconds, when the retained message was
  /// stored by IoT.
  final int? lastModifiedTime;

  /// The Base64-encoded message payload of the retained message body.
  final Uint8List? payload;

  /// The quality of service (QoS) level used to publish the retained message.
  final int? qos;

  /// The topic name to which the retained message was published.
  final String? topic;

  /// A base64-encoded JSON string that includes an array of JSON objects, or null
  /// if the retained message doesn't include any user properties.
  ///
  /// The following example <code>userProperties</code> parameter is a JSON string
  /// that represents two user properties. Note that it will be base64-encoded:
  ///
  /// <code>[{"deviceName": "alpha"}, {"deviceCnt": "45"}]</code>
  final Uint8List? userProperties;

  GetRetainedMessageResponse({
    this.lastModifiedTime,
    this.payload,
    this.qos,
    this.topic,
    this.userProperties,
  });

  factory GetRetainedMessageResponse.fromJson(Map<String, dynamic> json) {
    return GetRetainedMessageResponse(
      lastModifiedTime: json['lastModifiedTime'] as int?,
      payload: _s.decodeNullableUint8List(json['payload'] as String?),
      qos: json['qos'] as int?,
      topic: json['topic'] as String?,
      userProperties:
          _s.decodeNullableUint8List(json['userProperties'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final lastModifiedTime = this.lastModifiedTime;
    final payload = this.payload;
    final qos = this.qos;
    final topic = this.topic;
    final userProperties = this.userProperties;
    return {
      if (lastModifiedTime != null) 'lastModifiedTime': lastModifiedTime,
      if (payload != null) 'payload': base64Encode(payload),
      if (qos != null) 'qos': qos,
      if (topic != null) 'topic': topic,
      if (userProperties != null)
        'userProperties': base64Encode(userProperties),
    };
  }
}

/// The output from the GetThingShadow operation.
class GetThingShadowResponse {
  /// The state information, in JSON format.
  final Uint8List? payload;

  GetThingShadowResponse({
    this.payload,
  });

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    return {
      if (payload != null) 'payload': base64Encode(payload),
    };
  }
}

class ListNamedShadowsForThingResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  /// The list of shadows for the specified thing.
  final List<String>? results;

  /// The Epoch date and time the response was generated by IoT.
  final int? timestamp;

  ListNamedShadowsForThingResponse({
    this.nextToken,
    this.results,
    this.timestamp,
  });

  factory ListNamedShadowsForThingResponse.fromJson(Map<String, dynamic> json) {
    return ListNamedShadowsForThingResponse(
      nextToken: json['nextToken'] as String?,
      results:
          (json['results'] as List?)?.nonNulls.map((e) => e as String).toList(),
      timestamp: json['timestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final results = this.results;
    final timestamp = this.timestamp;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (results != null) 'results': results,
      if (timestamp != null) 'timestamp': timestamp,
    };
  }
}

class ListRetainedMessagesResponse {
  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  /// A summary list the account's retained messages. The information returned
  /// doesn't include the message payloads of the retained messages.
  final List<RetainedMessageSummary>? retainedTopics;

  ListRetainedMessagesResponse({
    this.nextToken,
    this.retainedTopics,
  });

  factory ListRetainedMessagesResponse.fromJson(Map<String, dynamic> json) {
    return ListRetainedMessagesResponse(
      nextToken: json['nextToken'] as String?,
      retainedTopics: (json['retainedTopics'] as List?)
          ?.nonNulls
          .map(
              (e) => RetainedMessageSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final retainedTopics = this.retainedTopics;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (retainedTopics != null) 'retainedTopics': retainedTopics,
    };
  }
}

class ListSubscriptionsResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  /// A list of topic filters and their associated Quality of Service (QoS) levels
  /// that the client is subscribed to.
  final List<SubscriptionSummary>? subscriptions;

  ListSubscriptionsResponse({
    this.nextToken,
    this.subscriptions,
  });

  factory ListSubscriptionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSubscriptionsResponse(
      nextToken: json['nextToken'] as String?,
      subscriptions: (json['subscriptions'] as List?)
          ?.nonNulls
          .map((e) => SubscriptionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final subscriptions = this.subscriptions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (subscriptions != null) 'subscriptions': subscriptions,
    };
  }
}

/// The output from the SendDirectMessage operation.
class SendDirectMessageResponse {
  /// The status message indicating the result of the operation.
  final String? message;

  /// A unique identifier for the request. Include this value when contacting
  /// Amazon Web Services Support for troubleshooting.
  final String? traceId;

  SendDirectMessageResponse({
    this.message,
    this.traceId,
  });

  factory SendDirectMessageResponse.fromJson(Map<String, dynamic> json) {
    return SendDirectMessageResponse(
      message: json['message'] as String?,
      traceId: json['traceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final traceId = this.traceId;
    return {
      if (message != null) 'message': message,
      if (traceId != null) 'traceId': traceId,
    };
  }
}

/// The output from the UpdateThingShadow operation.
class UpdateThingShadowResponse {
  /// The state information, in JSON format.
  final Uint8List? payload;

  UpdateThingShadowResponse({
    this.payload,
  });

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    return {
      if (payload != null) 'payload': base64Encode(payload),
    };
  }
}

class PayloadFormatIndicator {
  static const unspecifiedBytes = PayloadFormatIndicator._('UNSPECIFIED_BYTES');
  static const utf8Data = PayloadFormatIndicator._('UTF8_DATA');

  final String value;

  const PayloadFormatIndicator._(this.value);

  static const values = [unspecifiedBytes, utf8Data];

  static PayloadFormatIndicator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PayloadFormatIndicator._(value));

  @override
  bool operator ==(other) =>
      other is PayloadFormatIndicator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about a subscription for an MQTT client, including the
/// topic filter and Quality of Service (QoS) level.
class SubscriptionSummary {
  /// The Quality of Service (QoS) level for the subscription. Valid values are 0
  /// (at most once) and 1 (at least once).
  final int qos;

  /// The topic filter pattern that the client is subscribed to. May include MQTT
  /// wildcards such as + (single-level) and # (multi-level).
  final String topicFilter;

  SubscriptionSummary({
    required this.qos,
    required this.topicFilter,
  });

  factory SubscriptionSummary.fromJson(Map<String, dynamic> json) {
    return SubscriptionSummary(
      qos: (json['qos'] as int?) ?? 0,
      topicFilter: (json['topicFilter'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final qos = this.qos;
    final topicFilter = this.topicFilter;
    return {
      'qos': qos,
      'topicFilter': topicFilter,
    };
  }
}

/// Information about a single retained message.
class RetainedMessageSummary {
  /// The Epoch date and time, in milliseconds, when the retained message was
  /// stored by IoT.
  final int? lastModifiedTime;

  /// The size of the retained message's payload in bytes.
  final int? payloadSize;

  /// The quality of service (QoS) level used to publish the retained message.
  final int? qos;

  /// The topic name to which the retained message was published.
  final String? topic;

  RetainedMessageSummary({
    this.lastModifiedTime,
    this.payloadSize,
    this.qos,
    this.topic,
  });

  factory RetainedMessageSummary.fromJson(Map<String, dynamic> json) {
    return RetainedMessageSummary(
      lastModifiedTime: json['lastModifiedTime'] as int?,
      payloadSize: json['payloadSize'] as int?,
      qos: json['qos'] as int?,
      topic: json['topic'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastModifiedTime = this.lastModifiedTime;
    final payloadSize = this.payloadSize;
    final qos = this.qos;
    final topic = this.topic;
    return {
      if (lastModifiedTime != null) 'lastModifiedTime': lastModifiedTime,
      if (payloadSize != null) 'payloadSize': payloadSize,
      if (qos != null) 'qos': qos,
      if (topic != null) 'topic': topic,
    };
  }
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class GatewayTimeoutException extends _s.GenericAwsException {
  GatewayTimeoutException({String? type, String? message})
      : super(type: type, code: 'GatewayTimeoutException', message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class MethodNotAllowedException extends _s.GenericAwsException {
  MethodNotAllowedException({String? type, String? message})
      : super(type: type, code: 'MethodNotAllowedException', message: message);
}

class RequestEntityTooLargeException extends _s.GenericAwsException {
  RequestEntityTooLargeException({String? type, String? message})
      : super(
            type: type,
            code: 'RequestEntityTooLargeException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

class UnsupportedDocumentEncodingException extends _s.GenericAwsException {
  UnsupportedDocumentEncodingException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedDocumentEncodingException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'GatewayTimeoutException': (type, message) =>
      GatewayTimeoutException(type: type, message: message),
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'MethodNotAllowedException': (type, message) =>
      MethodNotAllowedException(type: type, message: message),
  'RequestEntityTooLargeException': (type, message) =>
      RequestEntityTooLargeException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
  'UnsupportedDocumentEncodingException': (type, message) =>
      UnsupportedDocumentEncodingException(type: type, message: message),
};
