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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// AWS IoT Events monitors your equipment or device fleets for failures or
/// changes in operation, and triggers actions when such events occur. AWS IoT
/// Events Data API commands enable you to send inputs to detectors, list
/// detectors, and view or update a detector's status.
class IoTEventsData {
  final _s.RestJsonProtocol _protocol;
  IoTEventsData({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'data.iotevents',
            signingName: 'ioteventsdata',
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

  /// Sends a set of messages to the AWS IoT Events system. Each message payload
  /// is transformed into the input you specify (<code>"inputName"</code>) and
  /// ingested into any detectors that monitor that input. If multiple messages
  /// are sent, the order in which the messages are processed isn't guaranteed.
  /// To guarantee ordering, you must send messages one at a time and wait for a
  /// successful response.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [messages] :
  /// The list of messages to send. Each message has the following format:
  /// <code>'{ "messageId": "string", "inputName": "string", "payload":
  /// "string"}'</code>
  Future<BatchPutMessageResponse> batchPutMessage({
    required List<Message> messages,
  }) async {
    ArgumentError.checkNotNull(messages, 'messages');
    final $payload = <String, dynamic>{
      'messages': messages,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/inputs/messages',
      exceptionFnMap: _exceptionFns,
    );
    return BatchPutMessageResponse.fromJson(response);
  }

  /// Updates the state, variable values, and timer settings of one or more
  /// detectors (instances) of a specified detector model.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [detectors] :
  /// The list of detectors (instances) to update, along with the values to
  /// update.
  Future<BatchUpdateDetectorResponse> batchUpdateDetector({
    required List<UpdateDetectorRequest> detectors,
  }) async {
    ArgumentError.checkNotNull(detectors, 'detectors');
    final $payload = <String, dynamic>{
      'detectors': detectors,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detectors',
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpdateDetectorResponse.fromJson(response);
  }

  /// Returns information about the specified detector (instance).
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [detectorModelName] :
  /// The name of the detector model whose detectors (instances) you want
  /// information about.
  ///
  /// Parameter [keyValue] :
  /// A filter used to limit results to detectors (instances) created because of
  /// the given key ID.
  Future<DescribeDetectorResponse> describeDetector({
    required String detectorModelName,
    String? keyValue,
  }) async {
    ArgumentError.checkNotNull(detectorModelName, 'detectorModelName');
    _s.validateStringLength(
      'detectorModelName',
      detectorModelName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'keyValue',
      keyValue,
      1,
      128,
    );
    final $query = <String, List<String>>{
      if (keyValue != null) 'keyValue': [keyValue],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/detectors/${Uri.encodeComponent(detectorModelName)}/keyValues/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDetectorResponse.fromJson(response);
  }

  /// Lists detectors (the instances of a detector model).
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [detectorModelName] :
  /// The name of the detector model whose detectors (instances) are listed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [stateName] :
  /// A filter that limits results to those detectors (instances) in the given
  /// state.
  Future<ListDetectorsResponse> listDetectors({
    required String detectorModelName,
    int? maxResults,
    String? nextToken,
    String? stateName,
  }) async {
    ArgumentError.checkNotNull(detectorModelName, 'detectorModelName');
    _s.validateStringLength(
      'detectorModelName',
      detectorModelName,
      1,
      128,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'stateName',
      stateName,
      1,
      128,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (stateName != null) 'stateName': [stateName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/detectors/${Uri.encodeComponent(detectorModelName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDetectorsResponse.fromJson(response);
  }
}

/// Contains information about the errors encountered.
class BatchPutMessageErrorEntry {
  /// The code associated with the error.
  final ErrorCode? errorCode;

  /// More information about the error.
  final String? errorMessage;

  /// The ID of the message that caused the error. (See the value corresponding to
  /// the <code>"messageId"</code> key in the <code>"message"</code> object.)
  final String? messageId;

  BatchPutMessageErrorEntry({
    this.errorCode,
    this.errorMessage,
    this.messageId,
  });
  factory BatchPutMessageErrorEntry.fromJson(Map<String, dynamic> json) {
    return BatchPutMessageErrorEntry(
      errorCode: (json['errorCode'] as String?)?.toErrorCode(),
      errorMessage: json['errorMessage'] as String?,
      messageId: json['messageId'] as String?,
    );
  }
}

class BatchPutMessageResponse {
  /// A list of any errors encountered when sending the messages.
  final List<BatchPutMessageErrorEntry>? batchPutMessageErrorEntries;

  BatchPutMessageResponse({
    this.batchPutMessageErrorEntries,
  });
  factory BatchPutMessageResponse.fromJson(Map<String, dynamic> json) {
    return BatchPutMessageResponse(
      batchPutMessageErrorEntries:
          (json['BatchPutMessageErrorEntries'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  BatchPutMessageErrorEntry.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }
}

/// Information about the error that occured when attempting to update a
/// detector.
class BatchUpdateDetectorErrorEntry {
  /// The code of the error.
  final ErrorCode? errorCode;

  /// A message describing the error.
  final String? errorMessage;

  /// The <code>"messageId"</code> of the update request that caused the error.
  /// (The value of the <code>"messageId"</code> in the update request
  /// <code>"Detector"</code> object.)
  final String? messageId;

  BatchUpdateDetectorErrorEntry({
    this.errorCode,
    this.errorMessage,
    this.messageId,
  });
  factory BatchUpdateDetectorErrorEntry.fromJson(Map<String, dynamic> json) {
    return BatchUpdateDetectorErrorEntry(
      errorCode: (json['errorCode'] as String?)?.toErrorCode(),
      errorMessage: json['errorMessage'] as String?,
      messageId: json['messageId'] as String?,
    );
  }
}

class BatchUpdateDetectorResponse {
  /// A list of those detector updates that resulted in errors. (If an error is
  /// listed here, the specific update did not occur.)
  final List<BatchUpdateDetectorErrorEntry>? batchUpdateDetectorErrorEntries;

  BatchUpdateDetectorResponse({
    this.batchUpdateDetectorErrorEntries,
  });
  factory BatchUpdateDetectorResponse.fromJson(Map<String, dynamic> json) {
    return BatchUpdateDetectorResponse(
      batchUpdateDetectorErrorEntries: (json['batchUpdateDetectorErrorEntries']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchUpdateDetectorErrorEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DescribeDetectorResponse {
  /// Information about the detector (instance).
  final Detector? detector;

  DescribeDetectorResponse({
    this.detector,
  });
  factory DescribeDetectorResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDetectorResponse(
      detector: json['detector'] != null
          ? Detector.fromJson(json['detector'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Information about the detector (instance).
class Detector {
  /// The time the detector (instance) was created.
  final DateTime? creationTime;

  /// The name of the detector model that created this detector (instance).
  final String? detectorModelName;

  /// The version of the detector model that created this detector (instance).
  final String? detectorModelVersion;

  /// The value of the key (identifying the device or system) that caused the
  /// creation of this detector (instance).
  final String? keyValue;

  /// The time the detector (instance) was last updated.
  final DateTime? lastUpdateTime;

  /// The current state of the detector (instance).
  final DetectorState? state;

  Detector({
    this.creationTime,
    this.detectorModelName,
    this.detectorModelVersion,
    this.keyValue,
    this.lastUpdateTime,
    this.state,
  });
  factory Detector.fromJson(Map<String, dynamic> json) {
    return Detector(
      creationTime: timeStampFromJson(json['creationTime']),
      detectorModelName: json['detectorModelName'] as String?,
      detectorModelVersion: json['detectorModelVersion'] as String?,
      keyValue: json['keyValue'] as String?,
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      state: json['state'] != null
          ? DetectorState.fromJson(json['state'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Information about the current state of the detector instance.
class DetectorState {
  /// The name of the state.
  final String stateName;

  /// The current state of the detector's timers.
  final List<Timer> timers;

  /// The current values of the detector's variables.
  final List<Variable> variables;

  DetectorState({
    required this.stateName,
    required this.timers,
    required this.variables,
  });
  factory DetectorState.fromJson(Map<String, dynamic> json) {
    return DetectorState(
      stateName: json['stateName'] as String,
      timers: (json['timers'] as List)
          .whereNotNull()
          .map((e) => Timer.fromJson(e as Map<String, dynamic>))
          .toList(),
      variables: (json['variables'] as List)
          .whereNotNull()
          .map((e) => Variable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The new state, variable values, and timer settings of the detector
/// (instance).
class DetectorStateDefinition {
  /// The name of the new state of the detector (instance).
  final String stateName;

  /// The new values of the detector's timers. Any timer whose value isn't
  /// specified is cleared, and its timeout event won't occur.
  final List<TimerDefinition> timers;

  /// The new values of the detector's variables. Any variable whose value isn't
  /// specified is cleared.
  final List<VariableDefinition> variables;

  DetectorStateDefinition({
    required this.stateName,
    required this.timers,
    required this.variables,
  });
  Map<String, dynamic> toJson() {
    final stateName = this.stateName;
    final timers = this.timers;
    final variables = this.variables;
    return {
      'stateName': stateName,
      'timers': timers,
      'variables': variables,
    };
  }
}

/// Information about the detector state.
class DetectorStateSummary {
  /// The name of the state.
  final String? stateName;

  DetectorStateSummary({
    this.stateName,
  });
  factory DetectorStateSummary.fromJson(Map<String, dynamic> json) {
    return DetectorStateSummary(
      stateName: json['stateName'] as String?,
    );
  }
}

/// Information about the detector (instance).
class DetectorSummary {
  /// The time the detector (instance) was created.
  final DateTime? creationTime;

  /// The name of the detector model that created this detector (instance).
  final String? detectorModelName;

  /// The version of the detector model that created this detector (instance).
  final String? detectorModelVersion;

  /// The value of the key (identifying the device or system) that caused the
  /// creation of this detector (instance).
  final String? keyValue;

  /// The time the detector (instance) was last updated.
  final DateTime? lastUpdateTime;

  /// The current state of the detector (instance).
  final DetectorStateSummary? state;

  DetectorSummary({
    this.creationTime,
    this.detectorModelName,
    this.detectorModelVersion,
    this.keyValue,
    this.lastUpdateTime,
    this.state,
  });
  factory DetectorSummary.fromJson(Map<String, dynamic> json) {
    return DetectorSummary(
      creationTime: timeStampFromJson(json['creationTime']),
      detectorModelName: json['detectorModelName'] as String?,
      detectorModelVersion: json['detectorModelVersion'] as String?,
      keyValue: json['keyValue'] as String?,
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      state: json['state'] != null
          ? DetectorStateSummary.fromJson(json['state'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum ErrorCode {
  resourceNotFoundException,
  invalidRequestException,
  internalFailureException,
  serviceUnavailableException,
  throttlingException,
}

extension ErrorCodeValue on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.resourceNotFoundException:
        return 'ResourceNotFoundException';
      case ErrorCode.invalidRequestException:
        return 'InvalidRequestException';
      case ErrorCode.internalFailureException:
        return 'InternalFailureException';
      case ErrorCode.serviceUnavailableException:
        return 'ServiceUnavailableException';
      case ErrorCode.throttlingException:
        return 'ThrottlingException';
    }
  }
}

extension ErrorCodeFromString on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'ResourceNotFoundException':
        return ErrorCode.resourceNotFoundException;
      case 'InvalidRequestException':
        return ErrorCode.invalidRequestException;
      case 'InternalFailureException':
        return ErrorCode.internalFailureException;
      case 'ServiceUnavailableException':
        return ErrorCode.serviceUnavailableException;
      case 'ThrottlingException':
        return ErrorCode.throttlingException;
    }
    throw Exception('$this is not known in enum ErrorCode');
  }
}

class ListDetectorsResponse {
  /// A list of summary information about the detectors (instances).
  final List<DetectorSummary>? detectorSummaries;

  /// A token to retrieve the next set of results, or <code>null</code> if there
  /// are no additional results.
  final String? nextToken;

  ListDetectorsResponse({
    this.detectorSummaries,
    this.nextToken,
  });
  factory ListDetectorsResponse.fromJson(Map<String, dynamic> json) {
    return ListDetectorsResponse(
      detectorSummaries: (json['detectorSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => DetectorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

/// Information about a message.
class Message {
  /// The name of the input into which the message payload is transformed.
  final String inputName;

  /// The ID to assign to the message. Within each batch sent, each
  /// <code>"messageId"</code> must be unique.
  final String messageId;

  /// The payload of the message. This can be a JSON string or a Base-64-encoded
  /// string representing binary data (in which case you must decode it).
  final Uint8List payload;

  Message({
    required this.inputName,
    required this.messageId,
    required this.payload,
  });
  Map<String, dynamic> toJson() {
    final inputName = this.inputName;
    final messageId = this.messageId;
    final payload = this.payload;
    return {
      'inputName': inputName,
      'messageId': messageId,
      'payload': base64Encode(payload),
    };
  }
}

/// The current state of a timer.
class Timer {
  /// The name of the timer.
  final String name;

  /// The number of seconds which have elapsed on the timer.
  final DateTime timestamp;

  Timer({
    required this.name,
    required this.timestamp,
  });
  factory Timer.fromJson(Map<String, dynamic> json) {
    return Timer(
      name: json['name'] as String,
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] as Object),
    );
  }
}

/// The new setting of a timer.
class TimerDefinition {
  /// The name of the timer.
  final String name;

  /// The new setting of the timer (the number of seconds before the timer
  /// elapses).
  final int seconds;

  TimerDefinition({
    required this.name,
    required this.seconds,
  });
  Map<String, dynamic> toJson() {
    final name = this.name;
    final seconds = this.seconds;
    return {
      'name': name,
      'seconds': seconds,
    };
  }
}

/// Information used to update the detector (instance).
class UpdateDetectorRequest {
  /// The name of the detector model that created the detectors (instances).
  final String detectorModelName;

  /// The ID to assign to the detector update <code>"message"</code>. Each
  /// <code>"messageId"</code> must be unique within each batch sent.
  final String messageId;

  /// The new state, variable values, and timer settings of the detector
  /// (instance).
  final DetectorStateDefinition state;

  /// The value of the input key attribute (identifying the device or system) that
  /// caused the creation of this detector (instance).
  final String? keyValue;

  UpdateDetectorRequest({
    required this.detectorModelName,
    required this.messageId,
    required this.state,
    this.keyValue,
  });
  Map<String, dynamic> toJson() {
    final detectorModelName = this.detectorModelName;
    final messageId = this.messageId;
    final state = this.state;
    final keyValue = this.keyValue;
    return {
      'detectorModelName': detectorModelName,
      'messageId': messageId,
      'state': state,
      if (keyValue != null) 'keyValue': keyValue,
    };
  }
}

/// The current state of the variable.
class Variable {
  /// The name of the variable.
  final String name;

  /// The current value of the variable.
  final String value;

  Variable({
    required this.name,
    required this.value,
  });
  factory Variable.fromJson(Map<String, dynamic> json) {
    return Variable(
      name: json['name'] as String,
      value: json['value'] as String,
    );
  }
}

/// The new value of the variable.
class VariableDefinition {
  /// The name of the variable.
  final String name;

  /// The new value of the variable.
  final String value;

  VariableDefinition({
    required this.name,
    required this.value,
  });
  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
  }
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
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

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
