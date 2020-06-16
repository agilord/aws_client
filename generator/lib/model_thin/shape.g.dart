// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shape.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shape _$ShapeFromJson(Map<String, dynamic> json) {
  return Shape(
    json['type'] as String,
    json['key'] == null
        ? null
        : Descriptor.fromJson(json['key'] as Map<String, dynamic>),
    json['value'] == null
        ? null
        : Descriptor.fromJson(json['value'] as Map<String, dynamic>),
    json['member'] == null
        ? null
        : Descriptor.fromJson(json['member'] as Map<String, dynamic>),
    json['flattened'] as bool ?? false,
    (json['members'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Member.fromJson(e as Map<String, dynamic>)),
    ),
    json['locationName'] as String,
    json['timestampFormat'] as String,
  );
}

Map<String, dynamic> _$ShapeToJson(Shape instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('members', instance.members);
  writeNotNull('member', instance.member);
  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  writeNotNull('locationName', instance.locationName);
  writeNotNull('timestampFormat', instance.timestampFormat);
  writeNotNull('flattened', instance.flattened);
  return val;
}

Member _$MemberFromJson(Map<String, dynamic> json) {
  return Member(
    json['shape'] as String,
    json['flattened'] as bool ?? false,
  );
}

Map<String, dynamic> _$MemberToJson(Member instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shape', instance.shape);
  writeNotNull('flattened', instance.flattened);
  return val;
}
