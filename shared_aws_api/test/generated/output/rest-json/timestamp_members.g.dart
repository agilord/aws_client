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
    timeArgInHeader:
        const RfcDateTimeConverter().fromJson(json['x-amz-timearg']),
    timeCustom: const RfcDateTimeConverter().fromJson(json['TimeCustom']),
    timeCustomInHeader:
        const UnixDateTimeConverter().fromJson(json['x-amz-timecustom']),
    timeFormat: const IsoDateTimeConverter().fromJson(json['TimeFormat']),
    timeFormatInHeader:
        const IsoDateTimeConverter().fromJson(json['x-amz-timeformat']),
  );
}

TimeContainer _$TimeContainerFromJson(Map<String, dynamic> json) {
  return TimeContainer(
    bar: const IsoDateTimeConverter().fromJson(json['bar']),
    foo: const UnixDateTimeConverter().fromJson(json['foo']),
  );
}
