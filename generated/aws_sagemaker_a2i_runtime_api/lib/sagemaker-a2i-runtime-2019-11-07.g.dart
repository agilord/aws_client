// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sagemaker-a2i-runtime-2019-11-07.dart';

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
    creationTime: DateTime.parse(json['CreationTime'] as String),
    flowDefinitionArn: json['FlowDefinitionArn'] as String,
    humanLoopArn: json['HumanLoopArn'] as String,
    humanLoopName: json['HumanLoopName'] as String,
    humanLoopStatus:
        _$enumDecode(_$HumanLoopStatusEnumMap, json['HumanLoopStatus']),
    failureCode: json['FailureCode'] as String?,
    failureReason: json['FailureReason'] as String?,
    humanLoopOutput: json['HumanLoopOutput'] == null
        ? null
        : HumanLoopOutput.fromJson(
            json['HumanLoopOutput'] as Map<String, dynamic>),
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

const _$HumanLoopStatusEnumMap = {
  HumanLoopStatus.inProgress: 'InProgress',
  HumanLoopStatus.failed: 'Failed',
  HumanLoopStatus.completed: 'Completed',
  HumanLoopStatus.stopped: 'Stopped',
  HumanLoopStatus.stopping: 'Stopping',
};

Map<String, dynamic> _$HumanLoopDataAttributesToJson(
        HumanLoopDataAttributes instance) =>
    <String, dynamic>{
      'ContentClassifiers': instance.contentClassifiers
          .map((e) => _$ContentClassifierEnumMap[e])
          .toList(),
    };

const _$ContentClassifierEnumMap = {
  ContentClassifier.freeOfPersonallyIdentifiableInformation:
      'FreeOfPersonallyIdentifiableInformation',
  ContentClassifier.freeOfAdultContent: 'FreeOfAdultContent',
};

Map<String, dynamic> _$HumanLoopInputToJson(HumanLoopInput instance) =>
    <String, dynamic>{
      'InputContent': instance.inputContent,
    };

HumanLoopOutput _$HumanLoopOutputFromJson(Map<String, dynamic> json) {
  return HumanLoopOutput(
    outputS3Uri: json['OutputS3Uri'] as String,
  );
}

HumanLoopSummary _$HumanLoopSummaryFromJson(Map<String, dynamic> json) {
  return HumanLoopSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    failureReason: json['FailureReason'] as String?,
    flowDefinitionArn: json['FlowDefinitionArn'] as String?,
    humanLoopName: json['HumanLoopName'] as String?,
    humanLoopStatus:
        _$enumDecodeNullable(_$HumanLoopStatusEnumMap, json['HumanLoopStatus']),
  );
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

ListHumanLoopsResponse _$ListHumanLoopsResponseFromJson(
    Map<String, dynamic> json) {
  return ListHumanLoopsResponse(
    humanLoopSummaries: (json['HumanLoopSummaries'] as List<dynamic>)
        .map((e) => HumanLoopSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

StartHumanLoopResponse _$StartHumanLoopResponseFromJson(
    Map<String, dynamic> json) {
  return StartHumanLoopResponse(
    humanLoopArn: json['HumanLoopArn'] as String?,
  );
}

StopHumanLoopResponse _$StopHumanLoopResponseFromJson(
    Map<String, dynamic> json) {
  return StopHumanLoopResponse();
}
