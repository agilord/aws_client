// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supports_header_maps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutputShape _$OutputShapeFromJson(Map<String, dynamic> json) {
  return OutputShape(
    allHeaders: (json['AllHeaders'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    prefixedHeaders: (json['X-'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}
