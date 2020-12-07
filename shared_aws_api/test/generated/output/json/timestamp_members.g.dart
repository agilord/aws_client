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
    timeArg: timeStampFromJson(json['TimeArg']),
    timeCustom: timeStampFromJson(json['TimeCustom']),
    timeFormat: timeStampFromJson(json['TimeFormat']),
  );
}

TimeContainer _$TimeContainerFromJson(Map<String, dynamic> json) {
  return TimeContainer(
    bar: timeStampFromJson(json['bar']),
    foo: timeStampFromJson(json['foo']),
  );
}
