import 'package:aws_client.generator/model/descriptor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'operation.g.dart';

@JsonSerializable(createToJson: false)
class Operation {
  final String name;
  @JsonKey(fromJson: Http.fromJsonOrDefault)
  final Http http;
  @JsonKey(defaultValue: '')
  final String authtype;
  final Descriptor input;
  final Descriptor output;
  final List<Descriptor> errors;
  final String documentation;
  final String documentationUrl;
  final bool idempotent;
  @JsonKey(defaultValue: false)
  final bool deprecated;

  Operation(
    this.name,
    this.http,
    this.authtype,
    this.input,
    this.output,
    this.errors,
    this.documentation,
    this.documentationUrl,
    this.idempotent,
    this.deprecated,
  );

  factory Operation.fromJson(Map<String, dynamic> json) =>
      _$OperationFromJson(json);
}

@JsonSerializable(createToJson: false)
class Http {
  @JsonKey(defaultValue: 'POST')
  final String method;
  @JsonKey(defaultValue: '/')
  final String requestUri;
  final int responseCode;

  const Http(
    this.method,
    this.requestUri,
    this.responseCode,
  );

  static Http fromJsonOrDefault(wut) {
    return wut == null ? Http('POST', '/', null) : null;
  }

  factory Http.fromJson(Map<String, dynamic> json) => _$HttpFromJson(json);
}
