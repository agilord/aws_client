// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'descriptor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Descriptor _$DescriptorFromJson(Map<String, dynamic> json) => Descriptor(
      json['shape'] as String,
      json['locationName'] as String?,
    );

Map<String, dynamic> _$DescriptorToJson(Descriptor instance) {
  final val = <String, dynamic>{
    'shape': instance.shape,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('locationName', instance.locationName);
  return val;
}
