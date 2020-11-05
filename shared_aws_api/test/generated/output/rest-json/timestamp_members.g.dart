// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timestamp_members.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutputShape _$OutputShapeFromJson(Map<String, dynamic> json) {
  return OutputShape(
    structMember: json['StructMember'] == null
        ? null
        : TimeContainer.fromJson(json['StructMember'] as Map<String, dynamic>),
    timeArg: unixTimestampFromJson(json['TimeArg']),
    timeArgInHeader: rfc822FromJson(json['x-amz-timearg'] as String),
    timeCustom: rfc822FromJson(json['TimeCustom'] as String),
    timeCustomInHeader: unixTimestampFromJson(json['x-amz-timecustom']),
    timeFormat: iso8601FromJson(json['TimeFormat'] as String),
    timeFormatInHeader: iso8601FromJson(json['x-amz-timeformat'] as String),
  );
}

TimeContainer _$TimeContainerFromJson(Map<String, dynamic> json) {
  return TimeContainer(
    bar: iso8601FromJson(json['bar'] as String),
    foo: unixTimestampFromJson(json['foo']),
  );
}
