import 'package:json_annotation/json_annotation.dart';
import 'api.dart';
import 'descriptor.dart';

part 'operation.g.dart';

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class Operation {
  @JsonKey(ignore: true)
  Api api;
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
  final Map<String, dynamic> endpointdiscovery;
  @JsonKey(defaultValue: false)
  final bool endpointoperation;
  final bool internal;
  final bool internalonly;
  @JsonKey(defaultValue: false)
  final bool httpChecksumRequired;
  final String methodNameOverride;
  final Object httpChecksum;

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
    this.internal,
    this.internalonly,
    this.httpChecksumRequired,
    this.methodNameOverride,
    this.httpChecksum,
  );

  factory Operation.fromJson(Map<String, dynamic> json) =>
      _$OperationFromJson(json);

  void initReferences() {
    input?.api = api;
    output?.api = api;
    errors?.forEach((e) => e.api = api);
  }

  String get methodName {
    final name = methodNameOverride ?? this.name;
    return name.substring(0, 1).toLowerCase() + name.substring(1);
  }

  bool get hasReturnType => returnType != 'void';

  String get returnType {
    var returnType = output?.shape ?? 'void';
    final returnShape = api.shapes[returnType];
    if (returnShape != null &&
        returnShape?.type == 'structure' &&
        returnShape.hasEmptyMembers) {
      returnType = 'void';
    }
    return returnType;
  }

  String get parameterType => input?.shape;
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

  bool get bodyForbidden => method == 'GET' || method == 'HEAD';
}
