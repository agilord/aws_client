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

part '2018-10-23.g.dart';

/// AWS IoT Events monitors your equipment or device fleets for failures or
/// changes in operation, and triggers actions when such events occur. AWS IoT
/// Events Data API commands enable you to send inputs to detectors, list
/// detectors, and view or update a detector's status.
class IoTEventsData {
  final _s.RestJsonProtocol _protocol;
  IoTEventsData({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'data.iotevents',
            signingName: 'ioteventsdata',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required List<Message> messages,
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
    @_s.required List<UpdateDetectorRequest> detectors,
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
    @_s.required String detectorModelName,
    String keyValue,
  }) async {
    ArgumentError.checkNotNull(detectorModelName, 'detectorModelName');
    _s.validateStringLength(
      'detectorModelName',
      detectorModelName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorModelName',
      detectorModelName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'keyValue',
      keyValue,
      1,
      128,
    );
    _s.validateStringPattern(
      'keyValue',
      keyValue,
      r'''^[a-zA-Z0-9\-_:]+$''',
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
    @_s.required String detectorModelName,
    int maxResults,
    String nextToken,
    String stateName,
  }) async {
    ArgumentError.checkNotNull(detectorModelName, 'detectorModelName');
    _s.validateStringLength(
      'detectorModelName',
      detectorModelName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorModelName',
      detectorModelName,
      r'''^[a-zA-Z0-9_-]+$''',
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchPutMessageErrorEntry {
  /// The code associated with the error.
  @_s.JsonKey(name: 'errorCode')
  final ErrorCode errorCode;

  /// More information about the error.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// The ID of the message that caused the error. (See the value corresponding to
  /// the <code>"messageId"</code> key in the <code>"message"</code> object.)
  @_s.JsonKey(name: 'messageId')
  final String messageId;

  BatchPutMessageErrorEntry({
    this.errorCode,
    this.errorMessage,
    this.messageId,
  });
  factory BatchPutMessageErrorEntry.fromJson(Map<String, dynamic> json) =>
      _$BatchPutMessageErrorEntryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchPutMessageResponse {
  /// A list of any errors encountered when sending the messages.
  @_s.JsonKey(name: 'BatchPutMessageErrorEntries')
  final List<BatchPutMessageErrorEntry> batchPutMessageErrorEntries;

  BatchPutMessageResponse({
    this.batchPutMessageErrorEntries,
  });
  factory BatchPutMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchPutMessageResponseFromJson(json);
}

/// Information about the error that occured when attempting to update a
/// detector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchUpdateDetectorErrorEntry {
  /// The code of the error.
  @_s.JsonKey(name: 'errorCode')
  final ErrorCode errorCode;

  /// A message describing the error.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// The <code>"messageId"</code> of the update request that caused the error.
  /// (The value of the <code>"messageId"</code> in the update request
  /// <code>"Detector"</code> object.)
  @_s.JsonKey(name: 'messageId')
  final String messageId;

  BatchUpdateDetectorErrorEntry({
    this.errorCode,
    this.errorMessage,
    this.messageId,
  });
  factory BatchUpdateDetectorErrorEntry.fromJson(Map<String, dynamic> json) =>
      _$BatchUpdateDetectorErrorEntryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchUpdateDetectorResponse {
  /// A list of those detector updates that resulted in errors. (If an error is
  /// listed here, the specific update did not occur.)
  @_s.JsonKey(name: 'batchUpdateDetectorErrorEntries')
  final List<BatchUpdateDetectorErrorEntry> batchUpdateDetectorErrorEntries;

  BatchUpdateDetectorResponse({
    this.batchUpdateDetectorErrorEntries,
  });
  factory BatchUpdateDetectorResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchUpdateDetectorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDetectorResponse {
  /// Information about the detector (instance).
  @_s.JsonKey(name: 'detector')
  final Detector detector;

  DescribeDetectorResponse({
    this.detector,
  });
  factory DescribeDetectorResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDetectorResponseFromJson(json);
}

/// Information about the detector (instance).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Detector {
  /// The time the detector (instance) was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The name of the detector model that created this detector (instance).
  @_s.JsonKey(name: 'detectorModelName')
  final String detectorModelName;

  /// The version of the detector model that created this detector (instance).
  @_s.JsonKey(name: 'detectorModelVersion')
  final String detectorModelVersion;

  /// The value of the key (identifying the device or system) that caused the
  /// creation of this detector (instance).
  @_s.JsonKey(name: 'keyValue')
  final String keyValue;

  /// The time the detector (instance) was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateTime')
  final DateTime lastUpdateTime;

  /// The current state of the detector (instance).
  @_s.JsonKey(name: 'state')
  final DetectorState state;

  Detector({
    this.creationTime,
    this.detectorModelName,
    this.detectorModelVersion,
    this.keyValue,
    this.lastUpdateTime,
    this.state,
  });
  factory Detector.fromJson(Map<String, dynamic> json) =>
      _$DetectorFromJson(json);
}

/// Information about the current state of the detector instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectorState {
  /// The name of the state.
  @_s.JsonKey(name: 'stateName')
  final String stateName;

  /// The current state of the detector's timers.
  @_s.JsonKey(name: 'timers')
  final List<Timer> timers;

  /// The current values of the detector's variables.
  @_s.JsonKey(name: 'variables')
  final List<Variable> variables;

  DetectorState({
    @_s.required this.stateName,
    @_s.required this.timers,
    @_s.required this.variables,
  });
  factory DetectorState.fromJson(Map<String, dynamic> json) =>
      _$DetectorStateFromJson(json);
}

/// The new state, variable values, and timer settings of the detector
/// (instance).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DetectorStateDefinition {
  /// The name of the new state of the detector (instance).
  @_s.JsonKey(name: 'stateName')
  final String stateName;

  /// The new values of the detector's timers. Any timer whose value isn't
  /// specified is cleared, and its timeout event won't occur.
  @_s.JsonKey(name: 'timers')
  final List<TimerDefinition> timers;

  /// The new values of the detector's variables. Any variable whose value isn't
  /// specified is cleared.
  @_s.JsonKey(name: 'variables')
  final List<VariableDefinition> variables;

  DetectorStateDefinition({
    @_s.required this.stateName,
    @_s.required this.timers,
    @_s.required this.variables,
  });
  Map<String, dynamic> toJson() => _$DetectorStateDefinitionToJson(this);
}

/// Information about the detector state.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectorStateSummary {
  /// The name of the state.
  @_s.JsonKey(name: 'stateName')
  final String stateName;

  DetectorStateSummary({
    this.stateName,
  });
  factory DetectorStateSummary.fromJson(Map<String, dynamic> json) =>
      _$DetectorStateSummaryFromJson(json);
}

/// Information about the detector (instance).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectorSummary {
  /// The time the detector (instance) was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The name of the detector model that created this detector (instance).
  @_s.JsonKey(name: 'detectorModelName')
  final String detectorModelName;

  /// The version of the detector model that created this detector (instance).
  @_s.JsonKey(name: 'detectorModelVersion')
  final String detectorModelVersion;

  /// The value of the key (identifying the device or system) that caused the
  /// creation of this detector (instance).
  @_s.JsonKey(name: 'keyValue')
  final String keyValue;

  /// The time the detector (instance) was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateTime')
  final DateTime lastUpdateTime;

  /// The current state of the detector (instance).
  @_s.JsonKey(name: 'state')
  final DetectorStateSummary state;

  DetectorSummary({
    this.creationTime,
    this.detectorModelName,
    this.detectorModelVersion,
    this.keyValue,
    this.lastUpdateTime,
    this.state,
  });
  factory DetectorSummary.fromJson(Map<String, dynamic> json) =>
      _$DetectorSummaryFromJson(json);
}

enum ErrorCode {
  @_s.JsonValue('ResourceNotFoundException')
  resourceNotFoundException,
  @_s.JsonValue('InvalidRequestException')
  invalidRequestException,
  @_s.JsonValue('InternalFailureException')
  internalFailureException,
  @_s.JsonValue('ServiceUnavailableException')
  serviceUnavailableException,
  @_s.JsonValue('ThrottlingException')
  throttlingException,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDetectorsResponse {
  /// A list of summary information about the detectors (instances).
  @_s.JsonKey(name: 'detectorSummaries')
  final List<DetectorSummary> detectorSummaries;

  /// A token to retrieve the next set of results, or <code>null</code> if there
  /// are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDetectorsResponse({
    this.detectorSummaries,
    this.nextToken,
  });
  factory ListDetectorsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDetectorsResponseFromJson(json);
}

/// Information about a message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Message {
  /// The name of the input into which the message payload is transformed.
  @_s.JsonKey(name: 'inputName')
  final String inputName;

  /// The ID to assign to the message. Within each batch sent, each
  /// <code>"messageId"</code> must be unique.
  @_s.JsonKey(name: 'messageId')
  final String messageId;

  /// The payload of the message. This can be a JSON string or a Base-64-encoded
  /// string representing binary data (in which case you must decode it).
  @Uint8ListConverter()
  @_s.JsonKey(name: 'payload')
  final Uint8List payload;

  Message({
    @_s.required this.inputName,
    @_s.required this.messageId,
    @_s.required this.payload,
  });
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

/// The current state of a timer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Timer {
  /// The name of the timer.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The number of seconds which have elapsed on the timer.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'timestamp')
  final DateTime timestamp;

  Timer({
    @_s.required this.name,
    @_s.required this.timestamp,
  });
  factory Timer.fromJson(Map<String, dynamic> json) => _$TimerFromJson(json);
}

/// The new setting of a timer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TimerDefinition {
  /// The name of the timer.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The new setting of the timer (the number of seconds before the timer
  /// elapses).
  @_s.JsonKey(name: 'seconds')
  final int seconds;

  TimerDefinition({
    @_s.required this.name,
    @_s.required this.seconds,
  });
  Map<String, dynamic> toJson() => _$TimerDefinitionToJson(this);
}

/// Information used to update the detector (instance).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateDetectorRequest {
  /// The name of the detector model that created the detectors (instances).
  @_s.JsonKey(name: 'detectorModelName')
  final String detectorModelName;

  /// The ID to assign to the detector update <code>"message"</code>. Each
  /// <code>"messageId"</code> must be unique within each batch sent.
  @_s.JsonKey(name: 'messageId')
  final String messageId;

  /// The new state, variable values, and timer settings of the detector
  /// (instance).
  @_s.JsonKey(name: 'state')
  final DetectorStateDefinition state;

  /// The value of the input key attribute (identifying the device or system) that
  /// caused the creation of this detector (instance).
  @_s.JsonKey(name: 'keyValue')
  final String keyValue;

  UpdateDetectorRequest({
    @_s.required this.detectorModelName,
    @_s.required this.messageId,
    @_s.required this.state,
    this.keyValue,
  });
  Map<String, dynamic> toJson() => _$UpdateDetectorRequestToJson(this);
}

/// The current state of the variable.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Variable {
  /// The name of the variable.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The current value of the variable.
  @_s.JsonKey(name: 'value')
  final String value;

  Variable({
    @_s.required this.name,
    @_s.required this.value,
  });
  factory Variable.fromJson(Map<String, dynamic> json) =>
      _$VariableFromJson(json);
}

/// The new value of the variable.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VariableDefinition {
  /// The name of the variable.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The new value of the variable.
  @_s.JsonKey(name: 'value')
  final String value;

  VariableDefinition({
    @_s.required this.name,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$VariableDefinitionToJson(this);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String type, String message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
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
