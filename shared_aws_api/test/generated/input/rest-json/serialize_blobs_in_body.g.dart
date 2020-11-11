// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serialize_blobs_in_body.dart';

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

  writeNotNull('Bar', const Uint8ListConverter().toJson(instance.bar));
  return val;
}
