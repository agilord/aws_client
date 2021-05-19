// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iotevents-data-2018-10-23.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchPutMessageErrorEntry _$BatchPutMessageErrorEntryFromJson(
    Map<String, dynamic> json) {
  return BatchPutMessageErrorEntry(
    errorCode: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['errorCode']),
    errorMessage: json['errorMessage'] as String?,
    messageId: json['messageId'] as String?,
  );
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$ErrorCodeEnumMap = {
  ErrorCode.resourceNotFoundException: 'ResourceNotFoundException',
  ErrorCode.invalidRequestException: 'InvalidRequestException',
  ErrorCode.internalFailureException: 'InternalFailureException',
  ErrorCode.serviceUnavailableException: 'ServiceUnavailableException',
  ErrorCode.throttlingException: 'ThrottlingException',
};

BatchPutMessageResponse _$BatchPutMessageResponseFromJson(
    Map<String, dynamic> json) {
  return BatchPutMessageResponse(
    batchPutMessageErrorEntries:
        (json['BatchPutMessageErrorEntries'] as List<dynamic>?)
            ?.map((e) =>
                BatchPutMessageErrorEntry.fromJson(e as Map<String, dynamic>))
            .toList(),
  );
}

BatchUpdateDetectorErrorEntry _$BatchUpdateDetectorErrorEntryFromJson(
    Map<String, dynamic> json) {
  return BatchUpdateDetectorErrorEntry(
    errorCode: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['errorCode']),
    errorMessage: json['errorMessage'] as String?,
    messageId: json['messageId'] as String?,
  );
}

BatchUpdateDetectorResponse _$BatchUpdateDetectorResponseFromJson(
    Map<String, dynamic> json) {
  return BatchUpdateDetectorResponse(
    batchUpdateDetectorErrorEntries: (json['batchUpdateDetectorErrorEntries']
            as List<dynamic>?)
        ?.map((e) =>
            BatchUpdateDetectorErrorEntry.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

DescribeDetectorResponse _$DescribeDetectorResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDetectorResponse(
    detector: json['detector'] == null
        ? null
        : Detector.fromJson(json['detector'] as Map<String, dynamic>),
  );
}

Detector _$DetectorFromJson(Map<String, dynamic> json) {
  return Detector(
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    detectorModelName: json['detectorModelName'] as String?,
    detectorModelVersion: json['detectorModelVersion'] as String?,
    keyValue: json['keyValue'] as String?,
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdateTime']),
    state: json['state'] == null
        ? null
        : DetectorState.fromJson(json['state'] as Map<String, dynamic>),
  );
}

DetectorState _$DetectorStateFromJson(Map<String, dynamic> json) {
  return DetectorState(
    stateName: json['stateName'] as String,
    timers: (json['timers'] as List<dynamic>)
        .map((e) => Timer.fromJson(e as Map<String, dynamic>))
        .toList(),
    variables: (json['variables'] as List<dynamic>)
        .map((e) => Variable.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DetectorStateDefinitionToJson(
        DetectorStateDefinition instance) =>
    <String, dynamic>{
      'stateName': instance.stateName,
      'timers': instance.timers.map((e) => e.toJson()).toList(),
      'variables': instance.variables.map((e) => e.toJson()).toList(),
    };

DetectorStateSummary _$DetectorStateSummaryFromJson(Map<String, dynamic> json) {
  return DetectorStateSummary(
    stateName: json['stateName'] as String?,
  );
}

DetectorSummary _$DetectorSummaryFromJson(Map<String, dynamic> json) {
  return DetectorSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    detectorModelName: json['detectorModelName'] as String?,
    detectorModelVersion: json['detectorModelVersion'] as String?,
    keyValue: json['keyValue'] as String?,
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['lastUpdateTime']),
    state: json['state'] == null
        ? null
        : DetectorStateSummary.fromJson(json['state'] as Map<String, dynamic>),
  );
}

ListDetectorsResponse _$ListDetectorsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDetectorsResponse(
    detectorSummaries: (json['detectorSummaries'] as List<dynamic>?)
        ?.map((e) => DetectorSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) {
  final val = <String, dynamic>{
    'inputName': instance.inputName,
    'messageId': instance.messageId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('payload', const Uint8ListConverter().toJson(instance.payload));
  return val;
}

Timer _$TimerFromJson(Map<String, dynamic> json) {
  return Timer(
    name: json['name'] as String,
    timestamp: DateTime.parse(json['timestamp'] as String),
  );
}

Map<String, dynamic> _$TimerDefinitionToJson(TimerDefinition instance) =>
    <String, dynamic>{
      'name': instance.name,
      'seconds': instance.seconds,
    };

Map<String, dynamic> _$UpdateDetectorRequestToJson(
    UpdateDetectorRequest instance) {
  final val = <String, dynamic>{
    'detectorModelName': instance.detectorModelName,
    'messageId': instance.messageId,
    'state': instance.state.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('keyValue', instance.keyValue);
  return val;
}

Variable _$VariableFromJson(Map<String, dynamic> json) {
  return Variable(
    name: json['name'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$VariableDefinitionToJson(VariableDefinition instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
