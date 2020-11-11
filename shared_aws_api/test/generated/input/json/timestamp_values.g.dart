// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timestamp_values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$InputShapeToJson(InputShape instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TimeArg', unixTimestampToJson(instance.timeArg));
  writeNotNull('TimeCustom', rfc822ToJson(instance.timeCustom));
  writeNotNull('TimeFormat', rfc822ToJson(instance.timeFormat));
  return val;
}
