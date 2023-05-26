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

/// IoT Events monitors your equipment or device fleets for failures or changes
/// in operation, and triggers actions when such events occur. You can use IoT
/// Events Data API commands to send inputs to detectors, list detectors, and
/// view or update a detector's status.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/what-is-iotevents.html">What
/// is IoT Events?</a> in the <i>IoT Events Developer Guide</i>.
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

  /// Acknowledges one or more alarms. The alarms change to the
  /// <code>ACKNOWLEDGED</code> state after you acknowledge them.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [acknowledgeActionRequests] :
  /// The list of acknowledge action requests. You can specify up to 10 requests
  /// per operation.
  Future<BatchAcknowledgeAlarmResponse> batchAcknowledgeAlarm({
    required List<AcknowledgeAlarmActionRequest> acknowledgeActionRequests,
  }) async {
    final $payload = <String, dynamic>{
      'acknowledgeActionRequests': acknowledgeActionRequests,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/alarms/acknowledge',
      exceptionFnMap: _exceptionFns,
    );
    return BatchAcknowledgeAlarmResponse.fromJson(response);
  }

  /// Deletes one or more detectors that were created. When a detector is
  /// deleted, its state will be cleared and the detector will be removed from
  /// the list of detectors. The deleted detector will no longer appear if
  /// referenced in the <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_iotevents-data_ListDetectors.html">ListDetectors</a>
  /// API call.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [detectors] :
  /// The list of one or more detectors to be deleted.
  Future<BatchDeleteDetectorResponse> batchDeleteDetector({
    required List<DeleteDetectorRequest> detectors,
  }) async {
    final $payload = <String, dynamic>{
      'detectors': detectors,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detectors/delete',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteDetectorResponse.fromJson(response);
  }

  /// Disables one or more alarms. The alarms change to the
  /// <code>DISABLED</code> state after you disable them.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [disableActionRequests] :
  /// The list of disable action requests. You can specify up to 10 requests per
  /// operation.
  Future<BatchDisableAlarmResponse> batchDisableAlarm({
    required List<DisableAlarmActionRequest> disableActionRequests,
  }) async {
    final $payload = <String, dynamic>{
      'disableActionRequests': disableActionRequests,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/alarms/disable',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDisableAlarmResponse.fromJson(response);
  }

  /// Enables one or more alarms. The alarms change to the <code>NORMAL</code>
  /// state after you enable them.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [enableActionRequests] :
  /// The list of enable action requests. You can specify up to 10 requests per
  /// operation.
  Future<BatchEnableAlarmResponse> batchEnableAlarm({
    required List<EnableAlarmActionRequest> enableActionRequests,
  }) async {
    final $payload = <String, dynamic>{
      'enableActionRequests': enableActionRequests,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/alarms/enable',
      exceptionFnMap: _exceptionFns,
    );
    return BatchEnableAlarmResponse.fromJson(response);
  }

  /// Sends a set of messages to the IoT Events system. Each message payload is
  /// transformed into the input you specify (<code>"inputName"</code>) and
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

  /// Resets one or more alarms. The alarms return to the <code>NORMAL</code>
  /// state after you reset them.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resetActionRequests] :
  /// The list of reset action requests. You can specify up to 10 requests per
  /// operation.
  Future<BatchResetAlarmResponse> batchResetAlarm({
    required List<ResetAlarmActionRequest> resetActionRequests,
  }) async {
    final $payload = <String, dynamic>{
      'resetActionRequests': resetActionRequests,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/alarms/reset',
      exceptionFnMap: _exceptionFns,
    );
    return BatchResetAlarmResponse.fromJson(response);
  }

  /// Changes one or more alarms to the snooze mode. The alarms change to the
  /// <code>SNOOZE_DISABLED</code> state after you set them to the snooze mode.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [snoozeActionRequests] :
  /// The list of snooze action requests. You can specify up to 10 requests per
  /// operation.
  Future<BatchSnoozeAlarmResponse> batchSnoozeAlarm({
    required List<SnoozeAlarmActionRequest> snoozeActionRequests,
  }) async {
    final $payload = <String, dynamic>{
      'snoozeActionRequests': snoozeActionRequests,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/alarms/snooze',
      exceptionFnMap: _exceptionFns,
    );
    return BatchSnoozeAlarmResponse.fromJson(response);
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

  /// Retrieves information about an alarm.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [alarmModelName] :
  /// The name of the alarm model.
  ///
  /// Parameter [keyValue] :
  /// The value of the key used as a filter to select only the alarms associated
  /// with the <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_CreateAlarmModel.html#iotevents-CreateAlarmModel-request-key">key</a>.
  Future<DescribeAlarmResponse> describeAlarm({
    required String alarmModelName,
    String? keyValue,
  }) async {
    final $query = <String, List<String>>{
      if (keyValue != null) 'keyValue': [keyValue],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/alarms/${Uri.encodeComponent(alarmModelName)}/keyValues/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAlarmResponse.fromJson(response);
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

  /// Lists one or more alarms. The operation returns only the metadata
  /// associated with each alarm.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [alarmModelName] :
  /// The name of the alarm model.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token that you can use to return the next set of results.
  Future<ListAlarmsResponse> listAlarms({
    required String alarmModelName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/alarms/${Uri.encodeComponent(alarmModelName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAlarmsResponse.fromJson(response);
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
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token that you can use to return the next set of results.
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
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

/// Contains the configuration information of an acknowledge action.
class AcknowledgeActionConfiguration {
  /// The note that you can leave when you acknowledge the alarm.
  final String? note;

  AcknowledgeActionConfiguration({
    this.note,
  });

  factory AcknowledgeActionConfiguration.fromJson(Map<String, dynamic> json) {
    return AcknowledgeActionConfiguration(
      note: json['note'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final note = this.note;
    return {
      if (note != null) 'note': note,
    };
  }
}

/// Information needed to acknowledge the alarm.
class AcknowledgeAlarmActionRequest {
  /// The name of the alarm model.
  final String alarmModelName;

  /// The request ID. Each ID must be unique within each batch.
  final String requestId;

  /// The value of the key used as a filter to select only the alarms associated
  /// with the <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_CreateAlarmModel.html#iotevents-CreateAlarmModel-request-key">key</a>.
  final String? keyValue;

  /// The note that you can leave when you acknowledge the alarm.
  final String? note;

  AcknowledgeAlarmActionRequest({
    required this.alarmModelName,
    required this.requestId,
    this.keyValue,
    this.note,
  });

  Map<String, dynamic> toJson() {
    final alarmModelName = this.alarmModelName;
    final requestId = this.requestId;
    final keyValue = this.keyValue;
    final note = this.note;
    return {
      'alarmModelName': alarmModelName,
      'requestId': requestId,
      if (keyValue != null) 'keyValue': keyValue,
      if (note != null) 'note': note,
    };
  }
}

/// Contains information about an alarm.
class Alarm {
  /// The name of the alarm model.
  final String? alarmModelName;

  /// The version of the alarm model.
  final String? alarmModelVersion;

  /// Contains information about the current state of the alarm.
  final AlarmState? alarmState;

  /// The time the alarm was created, in the Unix epoch format.
  final DateTime? creationTime;

  /// The value of the key used as a filter to select only the alarms associated
  /// with the <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_CreateAlarmModel.html#iotevents-CreateAlarmModel-request-key">key</a>.
  final String? keyValue;

  /// The time the alarm was last updated, in the Unix epoch format.
  final DateTime? lastUpdateTime;

  /// A non-negative integer that reflects the severity level of the alarm.
  final int? severity;

  Alarm({
    this.alarmModelName,
    this.alarmModelVersion,
    this.alarmState,
    this.creationTime,
    this.keyValue,
    this.lastUpdateTime,
    this.severity,
  });

  factory Alarm.fromJson(Map<String, dynamic> json) {
    return Alarm(
      alarmModelName: json['alarmModelName'] as String?,
      alarmModelVersion: json['alarmModelVersion'] as String?,
      alarmState: json['alarmState'] != null
          ? AlarmState.fromJson(json['alarmState'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['creationTime']),
      keyValue: json['keyValue'] as String?,
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      severity: json['severity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final alarmModelName = this.alarmModelName;
    final alarmModelVersion = this.alarmModelVersion;
    final alarmState = this.alarmState;
    final creationTime = this.creationTime;
    final keyValue = this.keyValue;
    final lastUpdateTime = this.lastUpdateTime;
    final severity = this.severity;
    return {
      if (alarmModelName != null) 'alarmModelName': alarmModelName,
      if (alarmModelVersion != null) 'alarmModelVersion': alarmModelVersion,
      if (alarmState != null) 'alarmState': alarmState,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (keyValue != null) 'keyValue': keyValue,
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (severity != null) 'severity': severity,
    };
  }
}

/// Contains information about the current state of the alarm.
class AlarmState {
  /// Contains information about the action that you can take to respond to the
  /// alarm.
  final CustomerAction? customerAction;

  /// Information needed to evaluate data.
  final RuleEvaluation? ruleEvaluation;

  /// The name of the alarm state. The state name can be one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>DISABLED</code> - When the alarm is in the <code>DISABLED</code>
  /// state, it isn't ready to evaluate data. To enable the alarm, you must change
  /// the alarm to the <code>NORMAL</code> state.
  /// </li>
  /// <li>
  /// <code>NORMAL</code> - When the alarm is in the <code>NORMAL</code> state,
  /// it's ready to evaluate data.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - If the alarm is in the <code>ACTIVE</code> state, the
  /// alarm is invoked.
  /// </li>
  /// <li>
  /// <code>ACKNOWLEDGED</code> - When the alarm is in the
  /// <code>ACKNOWLEDGED</code> state, the alarm was invoked and you acknowledged
  /// the alarm.
  /// </li>
  /// <li>
  /// <code>SNOOZE_DISABLED</code> - When the alarm is in the
  /// <code>SNOOZE_DISABLED</code> state, the alarm is disabled for a specified
  /// period of time. After the snooze time, the alarm automatically changes to
  /// the <code>NORMAL</code> state.
  /// </li>
  /// <li>
  /// <code>LATCHED</code> - When the alarm is in the <code>LATCHED</code> state,
  /// the alarm was invoked. However, the data that the alarm is currently
  /// evaluating is within the specified range. To change the alarm to the
  /// <code>NORMAL</code> state, you must acknowledge the alarm.
  /// </li>
  /// </ul>
  final AlarmStateName? stateName;

  /// Contains information about alarm state changes.
  final SystemEvent? systemEvent;

  AlarmState({
    this.customerAction,
    this.ruleEvaluation,
    this.stateName,
    this.systemEvent,
  });

  factory AlarmState.fromJson(Map<String, dynamic> json) {
    return AlarmState(
      customerAction: json['customerAction'] != null
          ? CustomerAction.fromJson(
              json['customerAction'] as Map<String, dynamic>)
          : null,
      ruleEvaluation: json['ruleEvaluation'] != null
          ? RuleEvaluation.fromJson(
              json['ruleEvaluation'] as Map<String, dynamic>)
          : null,
      stateName: (json['stateName'] as String?)?.toAlarmStateName(),
      systemEvent: json['systemEvent'] != null
          ? SystemEvent.fromJson(json['systemEvent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customerAction = this.customerAction;
    final ruleEvaluation = this.ruleEvaluation;
    final stateName = this.stateName;
    final systemEvent = this.systemEvent;
    return {
      if (customerAction != null) 'customerAction': customerAction,
      if (ruleEvaluation != null) 'ruleEvaluation': ruleEvaluation,
      if (stateName != null) 'stateName': stateName.toValue(),
      if (systemEvent != null) 'systemEvent': systemEvent,
    };
  }
}

enum AlarmStateName {
  disabled,
  normal,
  active,
  acknowledged,
  snoozeDisabled,
  latched,
}

extension AlarmStateNameValueExtension on AlarmStateName {
  String toValue() {
    switch (this) {
      case AlarmStateName.disabled:
        return 'DISABLED';
      case AlarmStateName.normal:
        return 'NORMAL';
      case AlarmStateName.active:
        return 'ACTIVE';
      case AlarmStateName.acknowledged:
        return 'ACKNOWLEDGED';
      case AlarmStateName.snoozeDisabled:
        return 'SNOOZE_DISABLED';
      case AlarmStateName.latched:
        return 'LATCHED';
    }
  }
}

extension AlarmStateNameFromString on String {
  AlarmStateName toAlarmStateName() {
    switch (this) {
      case 'DISABLED':
        return AlarmStateName.disabled;
      case 'NORMAL':
        return AlarmStateName.normal;
      case 'ACTIVE':
        return AlarmStateName.active;
      case 'ACKNOWLEDGED':
        return AlarmStateName.acknowledged;
      case 'SNOOZE_DISABLED':
        return AlarmStateName.snoozeDisabled;
      case 'LATCHED':
        return AlarmStateName.latched;
    }
    throw Exception('$this is not known in enum AlarmStateName');
  }
}

/// Contains a summary of an alarm.
class AlarmSummary {
  /// The name of the alarm model.
  final String? alarmModelName;

  /// The version of the alarm model.
  final String? alarmModelVersion;

  /// The time the alarm was created, in the Unix epoch format.
  final DateTime? creationTime;

  /// The value of the key used as a filter to select only the alarms associated
  /// with the <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_CreateAlarmModel.html#iotevents-CreateAlarmModel-request-key">key</a>.
  final String? keyValue;

  /// The time the alarm was last updated, in the Unix epoch format.
  final DateTime? lastUpdateTime;

  /// The name of the alarm state. The state name can be one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>DISABLED</code> - When the alarm is in the <code>DISABLED</code>
  /// state, it isn't ready to evaluate data. To enable the alarm, you must change
  /// the alarm to the <code>NORMAL</code> state.
  /// </li>
  /// <li>
  /// <code>NORMAL</code> - When the alarm is in the <code>NORMAL</code> state,
  /// it's ready to evaluate data.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - If the alarm is in the <code>ACTIVE</code> state, the
  /// alarm is invoked.
  /// </li>
  /// <li>
  /// <code>ACKNOWLEDGED</code> - When the alarm is in the
  /// <code>ACKNOWLEDGED</code> state, the alarm was invoked and you acknowledged
  /// the alarm.
  /// </li>
  /// <li>
  /// <code>SNOOZE_DISABLED</code> - When the alarm is in the
  /// <code>SNOOZE_DISABLED</code> state, the alarm is disabled for a specified
  /// period of time. After the snooze time, the alarm automatically changes to
  /// the <code>NORMAL</code> state.
  /// </li>
  /// <li>
  /// <code>LATCHED</code> - When the alarm is in the <code>LATCHED</code> state,
  /// the alarm was invoked. However, the data that the alarm is currently
  /// evaluating is within the specified range. To change the alarm to the
  /// <code>NORMAL</code> state, you must acknowledge the alarm.
  /// </li>
  /// </ul>
  final AlarmStateName? stateName;

  AlarmSummary({
    this.alarmModelName,
    this.alarmModelVersion,
    this.creationTime,
    this.keyValue,
    this.lastUpdateTime,
    this.stateName,
  });

  factory AlarmSummary.fromJson(Map<String, dynamic> json) {
    return AlarmSummary(
      alarmModelName: json['alarmModelName'] as String?,
      alarmModelVersion: json['alarmModelVersion'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      keyValue: json['keyValue'] as String?,
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      stateName: (json['stateName'] as String?)?.toAlarmStateName(),
    );
  }

  Map<String, dynamic> toJson() {
    final alarmModelName = this.alarmModelName;
    final alarmModelVersion = this.alarmModelVersion;
    final creationTime = this.creationTime;
    final keyValue = this.keyValue;
    final lastUpdateTime = this.lastUpdateTime;
    final stateName = this.stateName;
    return {
      if (alarmModelName != null) 'alarmModelName': alarmModelName,
      if (alarmModelVersion != null) 'alarmModelVersion': alarmModelVersion,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (keyValue != null) 'keyValue': keyValue,
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (stateName != null) 'stateName': stateName.toValue(),
    };
  }
}

class BatchAcknowledgeAlarmResponse {
  /// A list of errors associated with the request, or <code>null</code> if there
  /// are no errors. Each error entry contains an entry ID that helps you identify
  /// the entry that failed.
  final List<BatchAlarmActionErrorEntry>? errorEntries;

  BatchAcknowledgeAlarmResponse({
    this.errorEntries,
  });

  factory BatchAcknowledgeAlarmResponse.fromJson(Map<String, dynamic> json) {
    return BatchAcknowledgeAlarmResponse(
      errorEntries: (json['errorEntries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchAlarmActionErrorEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorEntries = this.errorEntries;
    return {
      if (errorEntries != null) 'errorEntries': errorEntries,
    };
  }
}

/// Contains error messages associated with one of the following requests:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_iotevents-data_BatchAcknowledgeAlarm.html">BatchAcknowledgeAlarm</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_iotevents-data_BatchDisableAlarm.html">BatchDisableAlarm</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_iotevents-data_BatchEnableAlarm.html">BatchEnableAlarm</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_iotevents-data_BatchResetAlarm.html">BatchResetAlarm</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_iotevents-data_BatchSnoozeAlarm.html">BatchSnoozeAlarm</a>
/// </li>
/// </ul>
class BatchAlarmActionErrorEntry {
  /// The error code.
  final ErrorCode? errorCode;

  /// A message that describes the error.
  final String? errorMessage;

  /// The request ID. Each ID must be unique within each batch.
  final String? requestId;

  BatchAlarmActionErrorEntry({
    this.errorCode,
    this.errorMessage,
    this.requestId,
  });

  factory BatchAlarmActionErrorEntry.fromJson(Map<String, dynamic> json) {
    return BatchAlarmActionErrorEntry(
      errorCode: (json['errorCode'] as String?)?.toErrorCode(),
      errorMessage: json['errorMessage'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final requestId = this.requestId;
    return {
      if (errorCode != null) 'errorCode': errorCode.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

/// Contains error messages associated with the deletion request.
class BatchDeleteDetectorErrorEntry {
  /// The error code.
  final ErrorCode? errorCode;

  /// A message that describes the error.
  final String? errorMessage;

  /// The ID of the message that caused the error. (See the value of the
  /// <code>"messageId"</code> in the <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_iotevents-data_BatchDeleteDetector.html#iotevents-iotevents-data_BatchDeleteDetector-request-detectors">detectors</a>
  /// object of the <code>DeleteDetectorRequest</code>.)
  final String? messageId;

  BatchDeleteDetectorErrorEntry({
    this.errorCode,
    this.errorMessage,
    this.messageId,
  });

  factory BatchDeleteDetectorErrorEntry.fromJson(Map<String, dynamic> json) {
    return BatchDeleteDetectorErrorEntry(
      errorCode: (json['errorCode'] as String?)?.toErrorCode(),
      errorMessage: json['errorMessage'] as String?,
      messageId: json['messageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final messageId = this.messageId;
    return {
      if (errorCode != null) 'errorCode': errorCode.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (messageId != null) 'messageId': messageId,
    };
  }
}

class BatchDeleteDetectorResponse {
  /// A list of errors associated with the request, or an empty array
  /// (<code>[]</code>) if there are no errors. Each error entry contains a
  /// <code>messageId</code> that helps you identify the entry that failed.
  final List<BatchDeleteDetectorErrorEntry>? batchDeleteDetectorErrorEntries;

  BatchDeleteDetectorResponse({
    this.batchDeleteDetectorErrorEntries,
  });

  factory BatchDeleteDetectorResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeleteDetectorResponse(
      batchDeleteDetectorErrorEntries: (json['batchDeleteDetectorErrorEntries']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchDeleteDetectorErrorEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final batchDeleteDetectorErrorEntries =
        this.batchDeleteDetectorErrorEntries;
    return {
      if (batchDeleteDetectorErrorEntries != null)
        'batchDeleteDetectorErrorEntries': batchDeleteDetectorErrorEntries,
    };
  }
}

class BatchDisableAlarmResponse {
  /// A list of errors associated with the request, or <code>null</code> if there
  /// are no errors. Each error entry contains an entry ID that helps you identify
  /// the entry that failed.
  final List<BatchAlarmActionErrorEntry>? errorEntries;

  BatchDisableAlarmResponse({
    this.errorEntries,
  });

  factory BatchDisableAlarmResponse.fromJson(Map<String, dynamic> json) {
    return BatchDisableAlarmResponse(
      errorEntries: (json['errorEntries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchAlarmActionErrorEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorEntries = this.errorEntries;
    return {
      if (errorEntries != null) 'errorEntries': errorEntries,
    };
  }
}

class BatchEnableAlarmResponse {
  /// A list of errors associated with the request, or <code>null</code> if there
  /// are no errors. Each error entry contains an entry ID that helps you identify
  /// the entry that failed.
  final List<BatchAlarmActionErrorEntry>? errorEntries;

  BatchEnableAlarmResponse({
    this.errorEntries,
  });

  factory BatchEnableAlarmResponse.fromJson(Map<String, dynamic> json) {
    return BatchEnableAlarmResponse(
      errorEntries: (json['errorEntries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchAlarmActionErrorEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorEntries = this.errorEntries;
    return {
      if (errorEntries != null) 'errorEntries': errorEntries,
    };
  }
}

/// Contains information about the errors encountered.
class BatchPutMessageErrorEntry {
  /// The error code.
  final ErrorCode? errorCode;

  /// A message that describes the error.
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

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final messageId = this.messageId;
    return {
      if (errorCode != null) 'errorCode': errorCode.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (messageId != null) 'messageId': messageId,
    };
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

  Map<String, dynamic> toJson() {
    final batchPutMessageErrorEntries = this.batchPutMessageErrorEntries;
    return {
      if (batchPutMessageErrorEntries != null)
        'BatchPutMessageErrorEntries': batchPutMessageErrorEntries,
    };
  }
}

class BatchResetAlarmResponse {
  /// A list of errors associated with the request, or <code>null</code> if there
  /// are no errors. Each error entry contains an entry ID that helps you identify
  /// the entry that failed.
  final List<BatchAlarmActionErrorEntry>? errorEntries;

  BatchResetAlarmResponse({
    this.errorEntries,
  });

  factory BatchResetAlarmResponse.fromJson(Map<String, dynamic> json) {
    return BatchResetAlarmResponse(
      errorEntries: (json['errorEntries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchAlarmActionErrorEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorEntries = this.errorEntries;
    return {
      if (errorEntries != null) 'errorEntries': errorEntries,
    };
  }
}

class BatchSnoozeAlarmResponse {
  /// A list of errors associated with the request, or <code>null</code> if there
  /// are no errors. Each error entry contains an entry ID that helps you identify
  /// the entry that failed.
  final List<BatchAlarmActionErrorEntry>? errorEntries;

  BatchSnoozeAlarmResponse({
    this.errorEntries,
  });

  factory BatchSnoozeAlarmResponse.fromJson(Map<String, dynamic> json) {
    return BatchSnoozeAlarmResponse(
      errorEntries: (json['errorEntries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchAlarmActionErrorEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorEntries = this.errorEntries;
    return {
      if (errorEntries != null) 'errorEntries': errorEntries,
    };
  }
}

/// Information about the error that occurred when attempting to update a
/// detector.
class BatchUpdateDetectorErrorEntry {
  /// The error code.
  final ErrorCode? errorCode;

  /// A message that describes the error.
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

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final messageId = this.messageId;
    return {
      if (errorCode != null) 'errorCode': errorCode.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (messageId != null) 'messageId': messageId,
    };
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

  Map<String, dynamic> toJson() {
    final batchUpdateDetectorErrorEntries =
        this.batchUpdateDetectorErrorEntries;
    return {
      if (batchUpdateDetectorErrorEntries != null)
        'batchUpdateDetectorErrorEntries': batchUpdateDetectorErrorEntries,
    };
  }
}

enum ComparisonOperator {
  greater,
  greaterOrEqual,
  less,
  lessOrEqual,
  equal,
  notEqual,
}

extension ComparisonOperatorValueExtension on ComparisonOperator {
  String toValue() {
    switch (this) {
      case ComparisonOperator.greater:
        return 'GREATER';
      case ComparisonOperator.greaterOrEqual:
        return 'GREATER_OR_EQUAL';
      case ComparisonOperator.less:
        return 'LESS';
      case ComparisonOperator.lessOrEqual:
        return 'LESS_OR_EQUAL';
      case ComparisonOperator.equal:
        return 'EQUAL';
      case ComparisonOperator.notEqual:
        return 'NOT_EQUAL';
    }
  }
}

extension ComparisonOperatorFromString on String {
  ComparisonOperator toComparisonOperator() {
    switch (this) {
      case 'GREATER':
        return ComparisonOperator.greater;
      case 'GREATER_OR_EQUAL':
        return ComparisonOperator.greaterOrEqual;
      case 'LESS':
        return ComparisonOperator.less;
      case 'LESS_OR_EQUAL':
        return ComparisonOperator.lessOrEqual;
      case 'EQUAL':
        return ComparisonOperator.equal;
      case 'NOT_EQUAL':
        return ComparisonOperator.notEqual;
    }
    throw Exception('$this is not known in enum ComparisonOperator');
  }
}

/// Contains information about the action that you can take to respond to the
/// alarm.
class CustomerAction {
  /// Contains the configuration information of an acknowledge action.
  final AcknowledgeActionConfiguration? acknowledgeActionConfiguration;

  /// The name of the action. The action name can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>SNOOZE</code> - When you snooze the alarm, the alarm state changes to
  /// <code>SNOOZE_DISABLED</code>.
  /// </li>
  /// <li>
  /// <code>ENABLE</code> - When you enable the alarm, the alarm state changes to
  /// <code>NORMAL</code>.
  /// </li>
  /// <li>
  /// <code>DISABLE</code> - When you disable the alarm, the alarm state changes
  /// to <code>DISABLED</code>.
  /// </li>
  /// <li>
  /// <code>ACKNOWLEDGE</code> - When you acknowledge the alarm, the alarm state
  /// changes to <code>ACKNOWLEDGED</code>.
  /// </li>
  /// <li>
  /// <code>RESET</code> - When you reset the alarm, the alarm state changes to
  /// <code>NORMAL</code>.
  /// </li>
  /// </ul>
  /// For more information, see the <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_iotevents-data_AlarmState.html">AlarmState</a>
  /// API.
  final CustomerActionName? actionName;

  /// Contains the configuration information of a disable action.
  final DisableActionConfiguration? disableActionConfiguration;

  /// Contains the configuration information of an enable action.
  final EnableActionConfiguration? enableActionConfiguration;

  /// Contains the configuration information of a reset action.
  final ResetActionConfiguration? resetActionConfiguration;

  /// Contains the configuration information of a snooze action.
  final SnoozeActionConfiguration? snoozeActionConfiguration;

  CustomerAction({
    this.acknowledgeActionConfiguration,
    this.actionName,
    this.disableActionConfiguration,
    this.enableActionConfiguration,
    this.resetActionConfiguration,
    this.snoozeActionConfiguration,
  });

  factory CustomerAction.fromJson(Map<String, dynamic> json) {
    return CustomerAction(
      acknowledgeActionConfiguration: json['acknowledgeActionConfiguration'] !=
              null
          ? AcknowledgeActionConfiguration.fromJson(
              json['acknowledgeActionConfiguration'] as Map<String, dynamic>)
          : null,
      actionName: (json['actionName'] as String?)?.toCustomerActionName(),
      disableActionConfiguration: json['disableActionConfiguration'] != null
          ? DisableActionConfiguration.fromJson(
              json['disableActionConfiguration'] as Map<String, dynamic>)
          : null,
      enableActionConfiguration: json['enableActionConfiguration'] != null
          ? EnableActionConfiguration.fromJson(
              json['enableActionConfiguration'] as Map<String, dynamic>)
          : null,
      resetActionConfiguration: json['resetActionConfiguration'] != null
          ? ResetActionConfiguration.fromJson(
              json['resetActionConfiguration'] as Map<String, dynamic>)
          : null,
      snoozeActionConfiguration: json['snoozeActionConfiguration'] != null
          ? SnoozeActionConfiguration.fromJson(
              json['snoozeActionConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final acknowledgeActionConfiguration = this.acknowledgeActionConfiguration;
    final actionName = this.actionName;
    final disableActionConfiguration = this.disableActionConfiguration;
    final enableActionConfiguration = this.enableActionConfiguration;
    final resetActionConfiguration = this.resetActionConfiguration;
    final snoozeActionConfiguration = this.snoozeActionConfiguration;
    return {
      if (acknowledgeActionConfiguration != null)
        'acknowledgeActionConfiguration': acknowledgeActionConfiguration,
      if (actionName != null) 'actionName': actionName.toValue(),
      if (disableActionConfiguration != null)
        'disableActionConfiguration': disableActionConfiguration,
      if (enableActionConfiguration != null)
        'enableActionConfiguration': enableActionConfiguration,
      if (resetActionConfiguration != null)
        'resetActionConfiguration': resetActionConfiguration,
      if (snoozeActionConfiguration != null)
        'snoozeActionConfiguration': snoozeActionConfiguration,
    };
  }
}

enum CustomerActionName {
  snooze,
  enable,
  disable,
  acknowledge,
  reset,
}

extension CustomerActionNameValueExtension on CustomerActionName {
  String toValue() {
    switch (this) {
      case CustomerActionName.snooze:
        return 'SNOOZE';
      case CustomerActionName.enable:
        return 'ENABLE';
      case CustomerActionName.disable:
        return 'DISABLE';
      case CustomerActionName.acknowledge:
        return 'ACKNOWLEDGE';
      case CustomerActionName.reset:
        return 'RESET';
    }
  }
}

extension CustomerActionNameFromString on String {
  CustomerActionName toCustomerActionName() {
    switch (this) {
      case 'SNOOZE':
        return CustomerActionName.snooze;
      case 'ENABLE':
        return CustomerActionName.enable;
      case 'DISABLE':
        return CustomerActionName.disable;
      case 'ACKNOWLEDGE':
        return CustomerActionName.acknowledge;
      case 'RESET':
        return CustomerActionName.reset;
    }
    throw Exception('$this is not known in enum CustomerActionName');
  }
}

/// Information used to delete the detector model.
class DeleteDetectorRequest {
  /// The name of the detector model that was used to create the detector
  /// instance.
  final String detectorModelName;

  /// The ID to assign to the <code>DeleteDetectorRequest</code>. Each
  /// <code>"messageId"</code> must be unique within each batch sent.
  final String messageId;

  /// The value of the <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_CreateDetectorModel.html#iotevents-CreateDetectorModel-request-key">key</a>
  /// used to identify the detector.
  final String? keyValue;

  DeleteDetectorRequest({
    required this.detectorModelName,
    required this.messageId,
    this.keyValue,
  });

  Map<String, dynamic> toJson() {
    final detectorModelName = this.detectorModelName;
    final messageId = this.messageId;
    final keyValue = this.keyValue;
    return {
      'detectorModelName': detectorModelName,
      'messageId': messageId,
      if (keyValue != null) 'keyValue': keyValue,
    };
  }
}

class DescribeAlarmResponse {
  /// Contains information about an alarm.
  final Alarm? alarm;

  DescribeAlarmResponse({
    this.alarm,
  });

  factory DescribeAlarmResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAlarmResponse(
      alarm: json['alarm'] != null
          ? Alarm.fromJson(json['alarm'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final alarm = this.alarm;
    return {
      if (alarm != null) 'alarm': alarm,
    };
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

  Map<String, dynamic> toJson() {
    final detector = this.detector;
    return {
      if (detector != null) 'detector': detector,
    };
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

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final detectorModelName = this.detectorModelName;
    final detectorModelVersion = this.detectorModelVersion;
    final keyValue = this.keyValue;
    final lastUpdateTime = this.lastUpdateTime;
    final state = this.state;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (detectorModelName != null) 'detectorModelName': detectorModelName,
      if (detectorModelVersion != null)
        'detectorModelVersion': detectorModelVersion,
      if (keyValue != null) 'keyValue': keyValue,
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (state != null) 'state': state,
    };
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

  Map<String, dynamic> toJson() {
    final stateName = this.stateName;
    return {
      if (stateName != null) 'stateName': stateName,
    };
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

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final detectorModelName = this.detectorModelName;
    final detectorModelVersion = this.detectorModelVersion;
    final keyValue = this.keyValue;
    final lastUpdateTime = this.lastUpdateTime;
    final state = this.state;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (detectorModelName != null) 'detectorModelName': detectorModelName,
      if (detectorModelVersion != null)
        'detectorModelVersion': detectorModelVersion,
      if (keyValue != null) 'keyValue': keyValue,
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (state != null) 'state': state,
    };
  }
}

/// Contains the configuration information of a disable action.
class DisableActionConfiguration {
  /// The note that you can leave when you disable the alarm.
  final String? note;

  DisableActionConfiguration({
    this.note,
  });

  factory DisableActionConfiguration.fromJson(Map<String, dynamic> json) {
    return DisableActionConfiguration(
      note: json['note'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final note = this.note;
    return {
      if (note != null) 'note': note,
    };
  }
}

/// Information used to disable the alarm.
class DisableAlarmActionRequest {
  /// The name of the alarm model.
  final String alarmModelName;

  /// The request ID. Each ID must be unique within each batch.
  final String requestId;

  /// The value of the key used as a filter to select only the alarms associated
  /// with the <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_CreateAlarmModel.html#iotevents-CreateAlarmModel-request-key">key</a>.
  final String? keyValue;

  /// The note that you can leave when you disable the alarm.
  final String? note;

  DisableAlarmActionRequest({
    required this.alarmModelName,
    required this.requestId,
    this.keyValue,
    this.note,
  });

  Map<String, dynamic> toJson() {
    final alarmModelName = this.alarmModelName;
    final requestId = this.requestId;
    final keyValue = this.keyValue;
    final note = this.note;
    return {
      'alarmModelName': alarmModelName,
      'requestId': requestId,
      if (keyValue != null) 'keyValue': keyValue,
      if (note != null) 'note': note,
    };
  }
}

/// Contains the configuration information of an enable action.
class EnableActionConfiguration {
  /// The note that you can leave when you enable the alarm.
  final String? note;

  EnableActionConfiguration({
    this.note,
  });

  factory EnableActionConfiguration.fromJson(Map<String, dynamic> json) {
    return EnableActionConfiguration(
      note: json['note'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final note = this.note;
    return {
      if (note != null) 'note': note,
    };
  }
}

/// Information needed to enable the alarm.
class EnableAlarmActionRequest {
  /// The name of the alarm model.
  final String alarmModelName;

  /// The request ID. Each ID must be unique within each batch.
  final String requestId;

  /// The value of the key used as a filter to select only the alarms associated
  /// with the <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_CreateAlarmModel.html#iotevents-CreateAlarmModel-request-key">key</a>.
  final String? keyValue;

  /// The note that you can leave when you enable the alarm.
  final String? note;

  EnableAlarmActionRequest({
    required this.alarmModelName,
    required this.requestId,
    this.keyValue,
    this.note,
  });

  Map<String, dynamic> toJson() {
    final alarmModelName = this.alarmModelName;
    final requestId = this.requestId;
    final keyValue = this.keyValue;
    final note = this.note;
    return {
      'alarmModelName': alarmModelName,
      'requestId': requestId,
      if (keyValue != null) 'keyValue': keyValue,
      if (note != null) 'note': note,
    };
  }
}

enum ErrorCode {
  resourceNotFoundException,
  invalidRequestException,
  internalFailureException,
  serviceUnavailableException,
  throttlingException,
}

extension ErrorCodeValueExtension on ErrorCode {
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

enum EventType {
  stateChange,
}

extension EventTypeValueExtension on EventType {
  String toValue() {
    switch (this) {
      case EventType.stateChange:
        return 'STATE_CHANGE';
    }
  }
}

extension EventTypeFromString on String {
  EventType toEventType() {
    switch (this) {
      case 'STATE_CHANGE':
        return EventType.stateChange;
    }
    throw Exception('$this is not known in enum EventType');
  }
}

class ListAlarmsResponse {
  /// A list that summarizes each alarm.
  final List<AlarmSummary>? alarmSummaries;

  /// The token that you can use to return the next set of results, or
  /// <code>null</code> if there are no more results.
  final String? nextToken;

  ListAlarmsResponse({
    this.alarmSummaries,
    this.nextToken,
  });

  factory ListAlarmsResponse.fromJson(Map<String, dynamic> json) {
    return ListAlarmsResponse(
      alarmSummaries: (json['alarmSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => AlarmSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alarmSummaries = this.alarmSummaries;
    final nextToken = this.nextToken;
    return {
      if (alarmSummaries != null) 'alarmSummaries': alarmSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDetectorsResponse {
  /// A list of summary information about the detectors (instances).
  final List<DetectorSummary>? detectorSummaries;

  /// The token that you can use to return the next set of results, or
  /// <code>null</code> if there are no more results.
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

  Map<String, dynamic> toJson() {
    final detectorSummaries = this.detectorSummaries;
    final nextToken = this.nextToken;
    return {
      if (detectorSummaries != null) 'detectorSummaries': detectorSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
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

  /// The timestamp associated with the message.
  final TimestampValue? timestamp;

  Message({
    required this.inputName,
    required this.messageId,
    required this.payload,
    this.timestamp,
  });

  Map<String, dynamic> toJson() {
    final inputName = this.inputName;
    final messageId = this.messageId;
    final payload = this.payload;
    final timestamp = this.timestamp;
    return {
      'inputName': inputName,
      'messageId': messageId,
      'payload': base64Encode(payload),
      if (timestamp != null) 'timestamp': timestamp,
    };
  }
}

/// Contains the configuration information of a reset action.
class ResetActionConfiguration {
  /// The note that you can leave when you reset the alarm.
  final String? note;

  ResetActionConfiguration({
    this.note,
  });

  factory ResetActionConfiguration.fromJson(Map<String, dynamic> json) {
    return ResetActionConfiguration(
      note: json['note'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final note = this.note;
    return {
      if (note != null) 'note': note,
    };
  }
}

/// Information needed to reset the alarm.
class ResetAlarmActionRequest {
  /// The name of the alarm model.
  final String alarmModelName;

  /// The request ID. Each ID must be unique within each batch.
  final String requestId;

  /// The value of the key used as a filter to select only the alarms associated
  /// with the <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_CreateAlarmModel.html#iotevents-CreateAlarmModel-request-key">key</a>.
  final String? keyValue;

  /// The note that you can leave when you reset the alarm.
  final String? note;

  ResetAlarmActionRequest({
    required this.alarmModelName,
    required this.requestId,
    this.keyValue,
    this.note,
  });

  Map<String, dynamic> toJson() {
    final alarmModelName = this.alarmModelName;
    final requestId = this.requestId;
    final keyValue = this.keyValue;
    final note = this.note;
    return {
      'alarmModelName': alarmModelName,
      'requestId': requestId,
      if (keyValue != null) 'keyValue': keyValue,
      if (note != null) 'note': note,
    };
  }
}

/// Information needed to evaluate data.
class RuleEvaluation {
  /// Information needed to compare two values with a comparison operator.
  final SimpleRuleEvaluation? simpleRuleEvaluation;

  RuleEvaluation({
    this.simpleRuleEvaluation,
  });

  factory RuleEvaluation.fromJson(Map<String, dynamic> json) {
    return RuleEvaluation(
      simpleRuleEvaluation: json['simpleRuleEvaluation'] != null
          ? SimpleRuleEvaluation.fromJson(
              json['simpleRuleEvaluation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final simpleRuleEvaluation = this.simpleRuleEvaluation;
    return {
      if (simpleRuleEvaluation != null)
        'simpleRuleEvaluation': simpleRuleEvaluation,
    };
  }
}

/// Information needed to compare two values with a comparison operator.
class SimpleRuleEvaluation {
  /// The value of the input property, on the left side of the comparison
  /// operator.
  final String? inputPropertyValue;

  /// The comparison operator.
  final ComparisonOperator? operator;

  /// The threshold value, on the right side of the comparison operator.
  final String? thresholdValue;

  SimpleRuleEvaluation({
    this.inputPropertyValue,
    this.operator,
    this.thresholdValue,
  });

  factory SimpleRuleEvaluation.fromJson(Map<String, dynamic> json) {
    return SimpleRuleEvaluation(
      inputPropertyValue: json['inputPropertyValue'] as String?,
      operator: (json['operator'] as String?)?.toComparisonOperator(),
      thresholdValue: json['thresholdValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputPropertyValue = this.inputPropertyValue;
    final operator = this.operator;
    final thresholdValue = this.thresholdValue;
    return {
      if (inputPropertyValue != null) 'inputPropertyValue': inputPropertyValue,
      if (operator != null) 'operator': operator.toValue(),
      if (thresholdValue != null) 'thresholdValue': thresholdValue,
    };
  }
}

/// Contains the configuration information of a snooze action.
class SnoozeActionConfiguration {
  /// The note that you can leave when you snooze the alarm.
  final String? note;

  /// The snooze time in seconds. The alarm automatically changes to the
  /// <code>NORMAL</code> state after this duration.
  final int? snoozeDuration;

  SnoozeActionConfiguration({
    this.note,
    this.snoozeDuration,
  });

  factory SnoozeActionConfiguration.fromJson(Map<String, dynamic> json) {
    return SnoozeActionConfiguration(
      note: json['note'] as String?,
      snoozeDuration: json['snoozeDuration'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final note = this.note;
    final snoozeDuration = this.snoozeDuration;
    return {
      if (note != null) 'note': note,
      if (snoozeDuration != null) 'snoozeDuration': snoozeDuration,
    };
  }
}

/// Information needed to snooze the alarm.
class SnoozeAlarmActionRequest {
  /// The name of the alarm model.
  final String alarmModelName;

  /// The request ID. Each ID must be unique within each batch.
  final String requestId;

  /// The snooze time in seconds. The alarm automatically changes to the
  /// <code>NORMAL</code> state after this duration.
  final int snoozeDuration;

  /// The value of the key used as a filter to select only the alarms associated
  /// with the <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_CreateAlarmModel.html#iotevents-CreateAlarmModel-request-key">key</a>.
  final String? keyValue;

  /// The note that you can leave when you snooze the alarm.
  final String? note;

  SnoozeAlarmActionRequest({
    required this.alarmModelName,
    required this.requestId,
    required this.snoozeDuration,
    this.keyValue,
    this.note,
  });

  Map<String, dynamic> toJson() {
    final alarmModelName = this.alarmModelName;
    final requestId = this.requestId;
    final snoozeDuration = this.snoozeDuration;
    final keyValue = this.keyValue;
    final note = this.note;
    return {
      'alarmModelName': alarmModelName,
      'requestId': requestId,
      'snoozeDuration': snoozeDuration,
      if (keyValue != null) 'keyValue': keyValue,
      if (note != null) 'note': note,
    };
  }
}

/// Contains the configuration information of alarm state changes.
class StateChangeConfiguration {
  /// The trigger type. If the value is <code>SNOOZE_TIMEOUT</code>, the snooze
  /// duration ends and the alarm automatically changes to the <code>NORMAL</code>
  /// state.
  final TriggerType? triggerType;

  StateChangeConfiguration({
    this.triggerType,
  });

  factory StateChangeConfiguration.fromJson(Map<String, dynamic> json) {
    return StateChangeConfiguration(
      triggerType: (json['triggerType'] as String?)?.toTriggerType(),
    );
  }

  Map<String, dynamic> toJson() {
    final triggerType = this.triggerType;
    return {
      if (triggerType != null) 'triggerType': triggerType.toValue(),
    };
  }
}

/// Contains information about alarm state changes.
class SystemEvent {
  /// The event type. If the value is <code>STATE_CHANGE</code>, the event
  /// contains information about alarm state changes.
  final EventType? eventType;

  /// Contains the configuration information of alarm state changes.
  final StateChangeConfiguration? stateChangeConfiguration;

  SystemEvent({
    this.eventType,
    this.stateChangeConfiguration,
  });

  factory SystemEvent.fromJson(Map<String, dynamic> json) {
    return SystemEvent(
      eventType: (json['eventType'] as String?)?.toEventType(),
      stateChangeConfiguration: json['stateChangeConfiguration'] != null
          ? StateChangeConfiguration.fromJson(
              json['stateChangeConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eventType = this.eventType;
    final stateChangeConfiguration = this.stateChangeConfiguration;
    return {
      if (eventType != null) 'eventType': eventType.toValue(),
      if (stateChangeConfiguration != null)
        'stateChangeConfiguration': stateChangeConfiguration,
    };
  }
}

/// The current state of a timer.
class Timer {
  /// The name of the timer.
  final String name;

  /// The expiration time for the timer.
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

  Map<String, dynamic> toJson() {
    final name = this.name;
    final timestamp = this.timestamp;
    return {
      'name': name,
      'timestamp': unixTimestampToJson(timestamp),
    };
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

/// Contains information about a timestamp.
class TimestampValue {
  /// The value of the timestamp, in the Unix epoch format.
  final int? timeInMillis;

  TimestampValue({
    this.timeInMillis,
  });

  Map<String, dynamic> toJson() {
    final timeInMillis = this.timeInMillis;
    return {
      if (timeInMillis != null) 'timeInMillis': timeInMillis,
    };
  }
}

enum TriggerType {
  snoozeTimeout,
}

extension TriggerTypeValueExtension on TriggerType {
  String toValue() {
    switch (this) {
      case TriggerType.snoozeTimeout:
        return 'SNOOZE_TIMEOUT';
    }
  }
}

extension TriggerTypeFromString on String {
  TriggerType toTriggerType() {
    switch (this) {
      case 'SNOOZE_TIMEOUT':
        return TriggerType.snoozeTimeout;
    }
    throw Exception('$this is not known in enum TriggerType');
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

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
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
