// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-10-23.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchPutMessageErrorEntry _$BatchPutMessageErrorEntryFromJson(
    Map<String, dynamic> json) {
  return BatchPutMessageErrorEntry(
    errorCode: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['errorCode']),
    errorMessage: json['errorMessage'] as String,
    messageId: json['messageId'] as String,
  );
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
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
    batchPutMessageErrorEntries: (json['BatchPutMessageErrorEntries'] as List)
        ?.map((e) => e == null
            ? null
            : BatchPutMessageErrorEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchUpdateDetectorErrorEntry _$BatchUpdateDetectorErrorEntryFromJson(
    Map<String, dynamic> json) {
  return BatchUpdateDetectorErrorEntry(
    errorCode: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['errorCode']),
    errorMessage: json['errorMessage'] as String,
    messageId: json['messageId'] as String,
  );
}

BatchUpdateDetectorResponse _$BatchUpdateDetectorResponseFromJson(
    Map<String, dynamic> json) {
  return BatchUpdateDetectorResponse(
    batchUpdateDetectorErrorEntries: (json['batchUpdateDetectorErrorEntries']
            as List)
        ?.map((e) => e == null
            ? null
            : BatchUpdateDetectorErrorEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
    detectorModelName: json['detectorModelName'] as String,
    detectorModelVersion: json['detectorModelVersion'] as String,
    keyValue: json['keyValue'] as String,
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
    timers: (json['timers'] as List)
        ?.map(
            (e) => e == null ? null : Timer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    variables: (json['variables'] as List)
        ?.map((e) =>
            e == null ? null : Variable.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DetectorStateDefinitionToJson(
    DetectorStateDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('stateName', instance.stateName);
  writeNotNull('timers', instance.timers?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'variables', instance.variables?.map((e) => e?.toJson())?.toList());
  return val;
}

DetectorStateSummary _$DetectorStateSummaryFromJson(Map<String, dynamic> json) {
  return DetectorStateSummary(
    stateName: json['stateName'] as String,
  );
}

DetectorSummary _$DetectorSummaryFromJson(Map<String, dynamic> json) {
  return DetectorSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['creationTime']),
    detectorModelName: json['detectorModelName'] as String,
    detectorModelVersion: json['detectorModelVersion'] as String,
    keyValue: json['keyValue'] as String,
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
    detectorSummaries: (json['detectorSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : DetectorSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('inputName', instance.inputName);
  writeNotNull('messageId', instance.messageId);
  writeNotNull('payload', const Uint8ListConverter().toJson(instance.payload));
  return val;
}

Timer _$TimerFromJson(Map<String, dynamic> json) {
  return Timer(
    name: json['name'] as String,
    timestamp: const UnixDateTimeConverter().fromJson(json['timestamp']),
  );
}

Map<String, dynamic> _$TimerDefinitionToJson(TimerDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('seconds', instance.seconds);
  return val;
}

Map<String, dynamic> _$UpdateDetectorRequestToJson(
    UpdateDetectorRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('detectorModelName', instance.detectorModelName);
  writeNotNull('messageId', instance.messageId);
  writeNotNull('state', instance.state?.toJson());
  writeNotNull('keyValue', instance.keyValue);
  return val;
}

Variable _$VariableFromJson(Map<String, dynamic> json) {
  return Variable(
    name: json['name'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$VariableDefinitionToJson(VariableDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('value', instance.value);
  return val;
}
