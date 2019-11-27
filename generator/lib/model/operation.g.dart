// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Operation _$OperationFromJson(Map<String, dynamic> json) {
  return Operation(
    json['name'] as String,
    Http.fromJsonOrDefault(json['http']),
    json['authtype'] as String ?? '',
    json['input'] == null
        ? null
        : Descriptor.fromJson(json['input'] as Map<String, dynamic>),
    json['output'] == null
        ? null
        : Descriptor.fromJson(json['output'] as Map<String, dynamic>),
    (json['errors'] as List)
        ?.map((e) =>
            e == null ? null : Descriptor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['documentation'] as String,
    json['documentationUrl'] as String,
    json['idempotent'] as bool,
    json['deprecated'] as bool ?? false,
  );
}

Http _$HttpFromJson(Map<String, dynamic> json) {
  return Http(
    json['method'] as String ?? 'POST',
    json['requestUri'] as String ?? '/',
    json['responseCode'] as int,
  );
}
