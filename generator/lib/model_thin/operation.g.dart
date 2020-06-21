// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Operation _$OperationFromJson(Map<String, dynamic> json) {
  return Operation(
    json['name'] as String,
    json['input'] == null
        ? null
        : Descriptor.fromJson(json['input'] as Map<String, dynamic>),
    json['output'] == null
        ? null
        : Descriptor.fromJson(json['output'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OperationToJson(Operation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('input', instance.input);
  writeNotNull('output', instance.output);
  return val;
}
