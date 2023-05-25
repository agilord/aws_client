// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shape.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shape _$ShapeFromJson(Map<String, dynamic> json) => Shape(
      json['type'] as String,
      (json['enum'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['required'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['members'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Member.fromJson(e as Map<String, dynamic>)),
      ),
      json['key'] == null
          ? null
          : Descriptor.fromJson(json['key'] as Map<String, dynamic>),
      json['value'] == null
          ? null
          : Descriptor.fromJson(json['value'] as Map<String, dynamic>),
      json['max'] as num?,
      json['min'] as num?,
      json['pattern'] as String?,
      json['documentation'] as String?,
      json['location'] as String?,
      json['streaming'] as bool?,
      json['deprecated'] as bool? ?? false,
      json['deprecatedMessage'] as String?,
      json['member'] == null
          ? null
          : Descriptor.fromJson(json['member'] as Map<String, dynamic>),
      (json['xmlOrder'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['sensitive'] as bool? ?? false,
      json['payload'] as String?,
      json['box'] as bool? ?? false,
      json['error'] == null
          ? null
          : HttpError.fromJson(json['error'] as Map<String, dynamic>),
      json['exception'] as bool? ?? false,
      json['wrapper'] as bool? ?? false,
      json['timestampFormat'] as String?,
      json['fault'] as bool? ?? false,
      json['flattened'] as bool? ?? false,
      json['locationName'] as String?,
      json['event'] as bool? ?? false,
      json['xmlNamespace'] == null
          ? null
          : XmlNamespace.fromJson(json['xmlNamespace'] as Map<String, dynamic>),
      json['eventstream'] as bool? ?? false,
      json['union'] as bool? ?? false,
      json['requiresLength'] as bool? ?? false,
    );

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      json['shape'] as String,
      json['documentation'] as String?,
      (json['enum'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['location'] as String?,
      json['locationName'] as String?,
      json['queryName'] as String?,
      json['idempotencyToken'] as bool? ?? false,
      json['hostLabel'] as bool? ?? false,
      json['deprecated'] as bool? ?? false,
      json['xmlNamespace'] == null
          ? null
          : XmlNamespace.fromJson(json['xmlNamespace'] as Map<String, dynamic>),
      json['deprecatedMessage'] as String?,
      json['box'] as bool? ?? false,
      json['jsonvalue'] as bool? ?? false,
      json['flattened'] as bool? ?? false,
      json['streaming'] as bool? ?? false,
      json['xmlAttribute'] as bool? ?? false,
      json['eventpayload'] as bool? ?? false,
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['timestampFormat'] as String?,
    );
