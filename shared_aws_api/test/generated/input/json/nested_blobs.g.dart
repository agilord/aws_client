// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_blobs.dart';

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

  writeNotNull('ListParam',
      instance.listParam?.map(const Uint8ListConverter().toJson)?.toList());
  return val;
}
