// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['protocols', 'packages', 'awsSdkJsReference'],
  );
  return Config(
    json['awsSdkJsReference'] as String,
    protocols: (json['protocols'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, ProtocolConfig.fromJson(e as Map<String, dynamic>)),
    ),
    packages:
        (json['packages'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

ProtocolConfig _$ProtocolConfigFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['shared', 'credentialProviders', 'publish'],
  );
  return ProtocolConfig(
    shared: json['shared'] as String,
    publish: json['publish'] as bool? ?? false,
    credentialProviders: json['credentialProviders'] as String,
  );
}
