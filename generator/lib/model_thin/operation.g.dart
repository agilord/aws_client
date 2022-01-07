// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Operation _$OperationFromJson(Map<String, dynamic> json) => Operation(
      json['name'] as String,
      json['input'] == null
          ? null
          : Descriptor.fromJson(json['input'] as Map<String, dynamic>),
      json['output'] == null
          ? null
          : Descriptor.fromJson(json['output'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OperationToJson(Operation instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('input', instance.input);
  writeNotNull('output', instance.output);
  return val;
}
