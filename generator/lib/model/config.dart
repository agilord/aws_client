import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class Config {
  @JsonKey(name: 'shared_version')
  final Map<String, String> sharedVersions;
  final List<String> packages;

  Config({this.sharedVersions, this.packages});

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
}
