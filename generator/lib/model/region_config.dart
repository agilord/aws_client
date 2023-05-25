import 'package:json_annotation/json_annotation.dart';

part 'region_config.g.dart';

@JsonSerializable(createToJson: false)
class RegionConfigData {
  final Map<String, Object> rules;
  final Map<String, RegionConfig> patterns;

  RegionConfigData(this.rules, this.patterns);

  static RegionConfigData fromJson(Map<String, dynamic> json) =>
      _$RegionConfigDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class RegionConfig {
  final String endpoint;
  final bool? globalEndpoint;
  final String? signatureVersion;
  final String? signingRegion;

  RegionConfig(this.endpoint, this.globalEndpoint, this.signatureVersion,
      this.signingRegion);

  static RegionConfig fromJson(Map<String, dynamic> json) =>
      _$RegionConfigFromJson(json);
}
