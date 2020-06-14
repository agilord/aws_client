// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'descriptor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Descriptor _$DescriptorFromJson(Map<String, dynamic> json) {
  return Descriptor(
    json['shape'] as String,
  );
}

Map<String, dynamic> _$DescriptorToJson(Descriptor instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shape', instance.shape);
  return val;
}
