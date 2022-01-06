import 'package:json_annotation/json_annotation.dart';

part 'region_config.g.dart';

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class RegionConfigData {
  final Map<String, Object> rules;
  final Map<String, RegionConfig> patterns;
  final Map<String, Object> fipsRules;
  final Map<String, Object> dualstackRules;
  final Map<String, Object> dualstackFipsRules;

  RegionConfigData(this.rules, this.patterns, this.fipsRules,
      this.dualstackRules, this.dualstackFipsRules);

  static RegionConfigData fromJson(Map<String, dynamic> json) =>
      _$RegionConfigDataFromJson(json);
}

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class RegionConfig {
  final String endpoint;
  final bool globalEndpoint;
  final String signatureVersion;
  final String signingRegion;

  RegionConfig(this.endpoint, this.globalEndpoint, this.signatureVersion,
      this.signingRegion);

  static RegionConfig fromJson(Map<String, dynamic> json) =>
      _$RegionConfigFromJson(json);
}
