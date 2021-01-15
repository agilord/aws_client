// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-11-07.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteHumanLoopResponse _$DeleteHumanLoopResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteHumanLoopResponse();
}

DescribeHumanLoopResponse _$DescribeHumanLoopResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeHumanLoopResponse(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    flowDefinitionArn: json['FlowDefinitionArn'] as String,
    humanLoopArn: json['HumanLoopArn'] as String,
    humanLoopName: json['HumanLoopName'] as String,
    humanLoopStatus:
        _$enumDecodeNullable(_$HumanLoopStatusEnumMap, json['HumanLoopStatus']),
    failureCode: json['FailureCode'] as String,
    failureReason: json['FailureReason'] as String,
    humanLoopOutput: json['HumanLoopOutput'] == null
        ? null
        : HumanLoopOutput.fromJson(
            json['HumanLoopOutput'] as Map<String, dynamic>),
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

const _$HumanLoopStatusEnumMap = {
  HumanLoopStatus.inProgress: 'InProgress',
  HumanLoopStatus.failed: 'Failed',
  HumanLoopStatus.completed: 'Completed',
  HumanLoopStatus.stopped: 'Stopped',
  HumanLoopStatus.stopping: 'Stopping',
};

Map<String, dynamic> _$HumanLoopDataAttributesToJson(
    HumanLoopDataAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ContentClassifiers',
      instance.contentClassifiers
          ?.map((e) => _$ContentClassifierEnumMap[e])
          ?.toList());
  return val;
}

const _$ContentClassifierEnumMap = {
  ContentClassifier.freeOfPersonallyIdentifiableInformation:
      'FreeOfPersonallyIdentifiableInformation',
  ContentClassifier.freeOfAdultContent: 'FreeOfAdultContent',
};

Map<String, dynamic> _$HumanLoopInputToJson(HumanLoopInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InputContent', instance.inputContent);
  return val;
}

HumanLoopOutput _$HumanLoopOutputFromJson(Map<String, dynamic> json) {
  return HumanLoopOutput(
    outputS3Uri: json['OutputS3Uri'] as String,
  );
}

HumanLoopSummary _$HumanLoopSummaryFromJson(Map<String, dynamic> json) {
  return HumanLoopSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    failureReason: json['FailureReason'] as String,
    flowDefinitionArn: json['FlowDefinitionArn'] as String,
    humanLoopName: json['HumanLoopName'] as String,
    humanLoopStatus:
        _$enumDecodeNullable(_$HumanLoopStatusEnumMap, json['HumanLoopStatus']),
  );
}

ListHumanLoopsResponse _$ListHumanLoopsResponseFromJson(
    Map<String, dynamic> json) {
  return ListHumanLoopsResponse(
    humanLoopSummaries: (json['HumanLoopSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : HumanLoopSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

StartHumanLoopResponse _$StartHumanLoopResponseFromJson(
    Map<String, dynamic> json) {
  return StartHumanLoopResponse(
    humanLoopArn: json['HumanLoopArn'] as String,
  );
}

StopHumanLoopResponse _$StopHumanLoopResponseFromJson(
    Map<String, dynamic> json) {
  return StopHumanLoopResponse();
}
