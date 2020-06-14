// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Api _$ApiFromJson(Map<String, dynamic> json) {
  return Api(
    (json['operations'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Operation.fromJson(e as Map<String, dynamic>)),
    ),
    (json['shapes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Shape.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$ApiToJson(Api instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('operations', instance.operations);
  writeNotNull('shapes', instance.shapes);
  return val;
}
