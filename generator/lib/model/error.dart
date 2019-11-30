import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class HttpError {
  final String code;
  final int httpStatusCode;
  @JsonKey(defaultValue: false)
  final bool senderFault;

  HttpError(this.code, this.httpStatusCode, this.senderFault);

  factory HttpError.fromJson(Map<String, dynamic> json) => _$HttpErrorFromJson(json);
}
