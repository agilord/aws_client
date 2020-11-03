// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_structure_members.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$StructTypeToJson(StructType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ScalarArg', instance.scalarArg);
  return val;
}
