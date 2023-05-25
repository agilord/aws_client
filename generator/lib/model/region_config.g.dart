// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionConfigData _$RegionConfigDataFromJson(Map<String, dynamic> json) =>
    RegionConfigData(
      (json['rules'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
      (json['patterns'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, RegionConfig.fromJson(e as Map<String, dynamic>)),
      ),
    );

RegionConfig _$RegionConfigFromJson(Map<String, dynamic> json) => RegionConfig(
      json['endpoint'] as String,
      json['globalEndpoint'] as bool?,
      json['signatureVersion'] as String?,
      json['signingRegion'] as String?,
    );
