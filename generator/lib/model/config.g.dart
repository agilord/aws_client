// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['shared_version', 'packages']);
  return Config(
    sharedVersions: (json['shared_version'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    packages: (json['packages'] as List)?.map((e) => e as String)?.toList(),
  );
}
