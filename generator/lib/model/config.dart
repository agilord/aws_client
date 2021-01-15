import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class Config {
  final String awsSdkJsReference;

  Config(this.awsSdkJsReference);

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  Config copyWith({String awsSdkJsReference}) => Config(
        awsSdkJsReference ?? this.awsSdkJsReference,
      );
}
