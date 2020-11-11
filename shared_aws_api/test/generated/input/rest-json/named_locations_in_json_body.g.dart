// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'named_locations_in_json_body.dart';

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

  writeNotNull('timestamp_location', unixTimestampToJson(instance.timeArg));
  return val;
}
