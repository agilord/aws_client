import 'package:json_annotation/json_annotation.dart';

import 'descriptor.dart';

part 'operation.g.dart';

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class Operation {
  final String name;
  final Http http;
  @JsonKey(defaultValue: '')
  final String authtype;
  final Descriptor input;
  final Descriptor output;
  final List<Descriptor> errors;
  final String documentation;
  final String documentationUrl;
  @JsonKey(defaultValue: false)
  final bool idempotent;
  @JsonKey(defaultValue: false)
  final bool deprecated;
  final String deprecatedMessage;
  final EndPoint endpoint;
  final String alias;
  final Map<String, String> endpointdiscovery;
  @JsonKey(defaultValue: false)
  final bool endpointoperation;

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
    this.deprecatedMessage,
    this.endpoint,
    this.alias,
    this.endpointdiscovery,
    this.endpointoperation,
  );

  factory Operation.fromJson(Map<String, dynamic> json) =>
      _$OperationFromJson(json);
}

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class EndPoint {
  final String hostPrefix;

  EndPoint(this.hostPrefix);

  factory EndPoint.fromJson(Map<String, dynamic> json) =>
      _$EndPointFromJson(json);
}

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
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

  factory Http.fromJson(Map<String, dynamic> json) => _$HttpFromJson(json);
}
