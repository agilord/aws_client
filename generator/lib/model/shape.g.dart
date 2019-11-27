// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shape.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shape _$ShapeFromJson(Map<String, dynamic> json) {
  return Shape(
    json['type'] as String,
    (json['enum'] as List)?.map((e) => e as String)?.toList(),
    (json['required'] as List)?.map((e) => e as String)?.toList(),
    (json['members'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Member.fromJson(e as Map<String, dynamic>)),
    ),
    json['key'] == null
        ? null
        : Descriptor.fromJson(json['key'] as Map<String, dynamic>),
    json['value'] == null
        ? null
        : Descriptor.fromJson(json['value'] as Map<String, dynamic>),
    json['max'] as num,
    json['min'] as num,
    json['pattern'] as String,
    json['documentation'] as String,
    json['location'] as String,
    json['streaming'] as bool,
    json['deprecated'] as bool ?? false,
    json['member'] == null
        ? null
        : Descriptor.fromJson(json['member'] as Map<String, dynamic>),
  );
}

Member _$MemberFromJson(Map<String, dynamic> json) {
  return Member(
    json['shape'] as String,
    json['documentation'] as String,
    json['location'] as String,
    json['locationName'] as String,
    json['queryName'] as String,
    json['idempotencyToken'] as bool,
    json['hostLabel'] as bool,
  );
}
