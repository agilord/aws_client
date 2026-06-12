// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shape.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shape _$ShapeFromJson(Map<String, dynamic> json) => Shape(
      type: json['type'] as String,
      enumeration:
          (json['enum'] as List<dynamic>?)?.map((e) => e as String).toList(),
      required: (json['required'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      membersMap: (json['members'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Member.fromJson(e as Map<String, dynamic>)),
      ),
      key: json['key'] == null
          ? null
          : Descriptor.fromJson(json['key'] as Map<String, dynamic>),
      value: json['value'] == null
          ? null
          : Descriptor.fromJson(json['value'] as Map<String, dynamic>),
      max: json['max'] as num?,
      min: json['min'] as num?,
      pattern: json['pattern'] as String?,
      documentation: json['documentation'] as String?,
      location: json['location'] as String?,
      streaming: json['streaming'] as bool?,
      deprecated: json['deprecated'] as bool? ?? false,
      deprecatedMessage: json['deprecatedMessage'] as String?,
      member: json['member'] == null
          ? null
          : Descriptor.fromJson(json['member'] as Map<String, dynamic>),
      xmlOrder: (json['xmlOrder'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      sensitive: json['sensitive'] as bool? ?? false,
      payload: json['payload'] as String?,
      box: json['box'] as bool? ?? false,
      error: json['error'] == null
          ? null
          : HttpError.fromJson(json['error'] as Map<String, dynamic>),
      exception: json['exception'] as bool? ?? false,
      wrapper: json['wrapper'] as bool? ?? false,
      timestampFormat: json['timestampFormat'] as String?,
      fault: json['fault'] as bool? ?? false,
      flattened: json['flattened'] as bool? ?? false,
      locationName: json['locationName'] as String?,
      event: json['event'] as bool? ?? false,
      xmlNamespace: json['xmlNamespace'] == null
          ? null
          : XmlNamespace.fromJson(json['xmlNamespace'] as Map<String, dynamic>),
      eventstream: json['eventstream'] as bool? ?? false,
      union: json['union'] as bool? ?? false,
      requiresLength: json['requiresLength'] as bool? ?? false,
    );

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      shape: json['shape'] as String,
      documentation: json['documentation'] as String?,
      enumeration:
          (json['enum'] as List<dynamic>?)?.map((e) => e as String).toList(),
      location: json['location'] as String?,
      locationName: json['locationName'] as String?,
      queryName: json['queryName'] as String?,
      idempotencyToken: json['idempotencyToken'] as bool? ?? false,
      hostLabel: json['hostLabel'] as bool? ?? false,
      deprecated: json['deprecated'] as bool? ?? false,
      xmlNamespace: json['xmlNamespace'] == null
          ? null
          : XmlNamespace.fromJson(json['xmlNamespace'] as Map<String, dynamic>),
      deprecatedMessage: json['deprecatedMessage'] as String?,
      box: json['box'] as bool? ?? false,
      jsonvalue: json['jsonvalue'] as bool? ?? false,
      flattened: json['flattened'] as bool? ?? false,
      streaming: json['streaming'] as bool? ?? false,
      xmlAttribute: json['xmlAttribute'] as bool? ?? false,
      eventpayload: json['eventpayload'] as bool? ?? false,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      timestampFormat: json['timestampFormat'] as String?,
    );
