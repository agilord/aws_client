import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class Config {
  final Map<String, ProtocolConfig> protocols;

  final List<String>? packages;

  final String awsSdkJsReference;

  Config(this.awsSdkJsReference,
      {required this.protocols, required this.packages});

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  Config copyWith({
    String? awsSdkJsReference,
    Map<String, ProtocolConfig>? protocols,
    List<String>? packages,
  }) =>
      Config(
        awsSdkJsReference ?? this.awsSdkJsReference,
        protocols: protocols ?? this.protocols,
        packages: packages ?? this.packages,
      );
}

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class ProtocolConfig {
  final String shared;
  final String credentialProviders;

  @JsonKey(defaultValue: false)
  final bool publish;

  ProtocolConfig({
    required this.shared,
    required this.publish,
    required this.credentialProviders,
  });

  factory ProtocolConfig.fromJson(Map<String, dynamic> json) =>
      _$ProtocolConfigFromJson(json);
}
