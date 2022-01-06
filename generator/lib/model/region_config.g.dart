// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionConfigData _$RegionConfigDataFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const [
    'rules',
    'patterns',
    'fipsRules',
    'dualstackRules',
    'dualstackFipsRules'
  ]);
  return RegionConfigData(
    json['rules'] as Map<String, dynamic>,
    (json['patterns'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : RegionConfig.fromJson(e as Map<String, dynamic>)),
    ),
    json['fipsRules'] as Map<String, dynamic>,
    json['dualstackRules'] as Map<String, dynamic>,
    json['dualstackFipsRules'] as Map<String, dynamic>,
  );
}

RegionConfig _$RegionConfigFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const [
    'endpoint',
    'globalEndpoint',
    'signatureVersion',
    'signingRegion'
  ]);
  return RegionConfig(
    json['endpoint'] as String,
    json['globalEndpoint'] as bool,
    json['signatureVersion'] as String,
    json['signingRegion'] as String,
  );
}
