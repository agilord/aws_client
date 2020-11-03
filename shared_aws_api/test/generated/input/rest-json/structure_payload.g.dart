// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structure_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$FooShapeToJson(FooShape instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('baz', instance.baz);
  return val;
}
