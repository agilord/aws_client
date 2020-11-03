// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_value_trait.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutputShape _$OutputShapeFromJson(Map<String, dynamic> json) {
  return OutputShape(
    bodyField: json['BodyField'] as String,
    bodyListField:
        (json['BodyListField'] as List)?.map((e) => e as String)?.toList(),
    headerField: json['X-Amz-Foo'] as String,
  );
}
