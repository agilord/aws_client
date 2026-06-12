// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmithyModel _$SmithyModelFromJson(Map<String, dynamic> json) => SmithyModel(
      json['smithy'] as String,
      (json['shapes'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, SmithyShape.fromJson(e as Map<String, dynamic>)),
      ),
    );

SmithyShape _$SmithyShapeFromJson(Map<String, dynamic> json) => SmithyShape(
      json['type'] as String,
      json['version'] as String?,
      (json['operations'] as List<dynamic>?)
          ?.map((e) => ShapeRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['resources'] as List<dynamic>?)
          ?.map((e) => ShapeRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['create'] == null
          ? null
          : ShapeRef.fromJson(json['create'] as Map<String, dynamic>),
      json['put'] == null
          ? null
          : ShapeRef.fromJson(json['put'] as Map<String, dynamic>),
      json['read'] == null
          ? null
          : ShapeRef.fromJson(json['read'] as Map<String, dynamic>),
      json['update'] == null
          ? null
          : ShapeRef.fromJson(json['update'] as Map<String, dynamic>),
      json['delete'] == null
          ? null
          : ShapeRef.fromJson(json['delete'] as Map<String, dynamic>),
      json['list'] == null
          ? null
          : ShapeRef.fromJson(json['list'] as Map<String, dynamic>),
      (json['collectionOperations'] as List<dynamic>?)
          ?.map((e) => ShapeRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['input'] == null
          ? null
          : ShapeRef.fromJson(json['input'] as Map<String, dynamic>),
      json['output'] == null
          ? null
          : ShapeRef.fromJson(json['output'] as Map<String, dynamic>),
      (json['errors'] as List<dynamic>?)
          ?.map((e) => ShapeRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['members'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, ShapeRef.fromJson(e as Map<String, dynamic>)),
      ),
      json['member'] == null
          ? null
          : ShapeRef.fromJson(json['member'] as Map<String, dynamic>),
      json['key'] == null
          ? null
          : ShapeRef.fromJson(json['key'] as Map<String, dynamic>),
      json['value'] == null
          ? null
          : ShapeRef.fromJson(json['value'] as Map<String, dynamic>),
      (json['mixins'] as List<dynamic>?)
          ?.map((e) => ShapeRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['traits'] as Map<String, dynamic>? ?? {},
    );

ShapeRef _$ShapeRefFromJson(Map<String, dynamic> json) => ShapeRef(
      json['target'] as String,
      json['traits'] as Map<String, dynamic>? ?? {},
    );
