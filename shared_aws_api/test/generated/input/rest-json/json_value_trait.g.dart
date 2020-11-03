// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_value_trait.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$BodyStructureToJson(BodyStructure instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BodyField', instance.bodyField);
  writeNotNull('BodyListField', instance.bodyListField);
  return val;
}
