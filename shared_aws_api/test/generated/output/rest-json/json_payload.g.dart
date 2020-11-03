// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutputShape _$OutputShapeFromJson(Map<String, dynamic> json) {
  return OutputShape(
    data: json['Data'] == null
        ? null
        : BodyStructure.fromJson(json['Data'] as Map<String, dynamic>),
    header: json['X-Foo'] as String,
  );
}

BodyStructure _$BodyStructureFromJson(Map<String, dynamic> json) {
  return BodyStructure(
    foo: json['Foo'] as String,
  );
}
