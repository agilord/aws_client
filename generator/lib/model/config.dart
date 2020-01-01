import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class Config {
  final Map<String, ProtocolConfig> protocols;

  final List<String> packages;

  Config({this.protocols, this.packages});

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
}

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class ProtocolConfig {
  final String shared;
  @JsonKey(defaultValue: false)
  final bool publish;

  ProtocolConfig({
    this.shared,
    this.publish,
  });

  factory ProtocolConfig.fromJson(Map<String, dynamic> json) =>
      _$ProtocolConfigFromJson(json);
}
