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
          endpointUrl: endpointUrl,
        );

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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [MethodNotAllowedException].
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
    ArgumentError.checkNotNull(thingName, 'thingName');
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

  /// Gets the details of a single retained message for the specified topic.
  ///
  /// This action returns the message payload of the retained message, which can
  /// incur messaging costs. To list only the topic names of the retained
  /// messages, call <a
  /// href="/iot/latest/developerguide/API_iotdata_ListRetainedMessages.html">ListRetainedMessages</a>.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiotfleethubfordevicemanagement.html#awsiotfleethubfordevicemanagement-actions-as-permissions">GetRetainedMessage</a>
  /// action.
  ///
  /// For more information about messaging costs, see <a
  /// href="http://aws.amazon.com/iot-core/pricing/#Messaging">Amazon Web
  /// Services IoT Core pricing - Messaging</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [MethodNotAllowedException].
  ///
  /// Parameter [topic] :
  /// The topic name of the retained message to retrieve.
  Future<GetRetainedMessageResponse> getRetainedMessage({
    required String topic,
  }) async {
    ArgumentError.checkNotNull(topic, 'topic');
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
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [MethodNotAllowedException].
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
    ArgumentError.checkNotNull(thingName, 'thingName');
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [MethodNotAllowedException].
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
    ArgumentError.checkNotNull(thingName, 'thingName');
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
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/API_iotdata_GetRetainedMessage.html">GetRetainedMessage</a>
  /// with the topic name of the retained message.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiotfleethubfordevicemanagement.html#awsiotfleethubfordevicemanagement-actions-as-permissions">ListRetainedMessages</a>
  /// action.
  ///
  /// For more information about messaging costs, see <a
  /// href="http://aws.amazon.com/iot-core/pricing/#Messaging">Amazon Web
  /// Services IoT Core pricing - Messaging</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [MethodNotAllowedException].
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
  /// May throw [UnauthorizedException].
  /// May throw [MethodNotAllowedException].
  ///
  /// Parameter [topic] :
  /// The name of the MQTT topic.
  ///
  /// Parameter [payload] :
  /// The message body. MQTT accepts text, binary, and empty (null) message
  /// payloads.
  ///
  /// Publishing an empty (null) payload with <b>retain</b> = <code>true</code>
  /// deletes the retained message identified by <b>topic</b> from Amazon Web
  /// Services IoT Core.
  ///
  /// Parameter [qos] :
  /// The Quality of Service (QoS) level.
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
  Future<void> publish({
    required String topic,
    Uint8List? payload,
    int? qos,
    bool? retain,
  }) async {
    ArgumentError.checkNotNull(topic, 'topic');
    _s.validateNumRange(
      'qos',
      qos,
      0,
      1,
    );
    final $query = <String, List<String>>{
      if (qos != null) 'qos': [qos.toString()],
      if (retain != null) 'retain': [retain.toString()],
    };
    await _protocol.send(
      payload: payload,
      method: 'POST',
      requestUri: '/topics/${Uri.encodeComponent(topic)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
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
  /// May throw [RequestEntityTooLargeException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [MethodNotAllowedException].
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
    ArgumentError.checkNotNull(payload, 'payload');
    ArgumentError.checkNotNull(thingName, 'thingName');
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

  factory DeleteThingShadowResponse.fromJson(Map<String, dynamic> json) {
    return DeleteThingShadowResponse(
      payload: _s.decodeUint8List(json['payload']! as String),
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    return {
      'payload': base64Encode(payload),
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

  GetRetainedMessageResponse({
    this.lastModifiedTime,
    this.payload,
    this.qos,
    this.topic,
  });

  factory GetRetainedMessageResponse.fromJson(Map<String, dynamic> json) {
    return GetRetainedMessageResponse(
      lastModifiedTime: json['lastModifiedTime'] as int?,
      payload: _s.decodeNullableUint8List(json['payload'] as String?),
      qos: json['qos'] as int?,
      topic: json['topic'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastModifiedTime = this.lastModifiedTime;
    final payload = this.payload;
    final qos = this.qos;
    final topic = this.topic;
    return {
      if (lastModifiedTime != null) 'lastModifiedTime': lastModifiedTime,
      if (payload != null) 'payload': base64Encode(payload),
      if (qos != null) 'qos': qos,
      if (topic != null) 'topic': topic,
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

  factory GetThingShadowResponse.fromJson(Map<String, dynamic> json) {
    return GetThingShadowResponse(
      payload: _s.decodeNullableUint8List(json['payload'] as String?),
    );
  }

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
      results: (json['results'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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
          ?.whereNotNull()
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

/// The output from the UpdateThingShadow operation.
class UpdateThingShadowResponse {
  /// The state information, in JSON format.
  final Uint8List? payload;

  UpdateThingShadowResponse({
    this.payload,
  });

  factory UpdateThingShadowResponse.fromJson(Map<String, dynamic> json) {
    return UpdateThingShadowResponse(
      payload: _s.decodeNullableUint8List(json['payload'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    return {
      if (payload != null) 'payload': base64Encode(payload),
    };
  }
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
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
