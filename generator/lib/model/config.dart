import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class Config {
  final String awsSdkJsReference;

  final String? awsSdkJsV3Reference;

  Config(this.awsSdkJsReference, {this.awsSdkJsV3Reference});

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
}
