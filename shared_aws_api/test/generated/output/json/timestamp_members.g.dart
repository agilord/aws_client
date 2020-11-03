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
    timeCustom: unixTimestampFromJson(json['TimeCustom']),
    timeFormat: iso8601FromJson(json['TimeFormat'] as String),
  );
}

TimeContainer _$TimeContainerFromJson(Map<String, dynamic> json) {
  return TimeContainer(
    bar: iso8601FromJson(json['bar'] as String),
    foo: unixTimestampFromJson(json['foo']),
  );
}
