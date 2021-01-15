// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_value_trait.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutputShape _$OutputShapeFromJson(Map<String, dynamic> json) {
  return OutputShape(
    bodyField: json['BodyField'],
    bodyListField: json['BodyListField'] as List,
    headerField:
        const Base64JsonConverter().fromJson(json['X-Amz-Foo'] as String),
  );
}
