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
    timeArg: const UnixDateTimeConverter().fromJson(json['TimeArg']),
    timeCustom: const RfcDateTimeConverter().fromJson(json['TimeCustom']),
    timeFormat: const IsoDateTimeConverter().fromJson(json['TimeFormat']),
  );
}

TimeContainer _$TimeContainerFromJson(Map<String, dynamic> json) {
  return TimeContainer(
    bar: const IsoDateTimeConverter().fromJson(json['bar']),
    foo: const UnixDateTimeConverter().fromJson(json['foo']),
  );
}
