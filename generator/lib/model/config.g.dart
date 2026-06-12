// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['awsSdkJsReference', 'awsSdkJsV3Reference'],
  );
  return Config(
    json['awsSdkJsReference'] as String,
    awsSdkJsV3Reference: json['awsSdkJsV3Reference'] as String?,
  );
}
