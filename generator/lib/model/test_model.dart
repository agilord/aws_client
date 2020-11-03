import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'test_model.g.dart';

@JsonSerializable(createToJson: false)
class TestSuite {
  final String description;
  final String skip;
  final Map<String, Object> metadata;
  final Map<String, Object> shapes;
  final List<TestCase> cases;

  TestSuite(
      this.description, this.skip, this.metadata, this.shapes, this.cases);

  static TestSuite fromJson(Map<String, Object> json) =>
      _$TestSuiteFromJson(json);

  static List<TestSuite> decode(String json) {
    return (jsonDecode(json) as List<Object>)
        .map((j) => fromJson(j as Map<String, Object>))
        .toList();
  }

  Map<String, Object> toApiDefinition() {
    final serviceName = description
        .split(' ')
        .map((s) => s.substring(0, 1).toUpperCase() + s.substring(1))
        .join('');
    final fileName = description.toLowerCase().replaceAll(RegExp(r'\s'), '_');

    final operations = cases.map((c) => c.given).toList();
    final operationsDefinition = <String, Map<String, Object>>{};
    for (var i = 0; i < operations.length; i++) {
      final operation = operations[i];
      final operationName = operation['name'] as String;
      operationsDefinition['$operationName$i'] = {
        'http': {'responseCode': 200},
        ...operation,
        'methodNameOverride': '$operationName$i'
      };
    }

    return {
      'metadata': {
        'serviceFullName': serviceName,
        'uid': fileName,
        'targetPrefix': serviceName,
        'endpointPrefix': serviceName,
        'apiVersion': '2020-01-01',
        ...?metadata,
      },
      'operations': operationsDefinition,
      'shapes': shapes,
      'version': '1.0',
      'documentation': description,
    };
  }
}

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class TestCase {
  final Map<String, Object> given;
  final String skip;
  final Map<String, Object> result;
  final OutputResponse response;
  final Map<String, Object> params;
  final Serialized serialized;

  TestCase(this.given, this.skip, this.result, this.response, this.params,
      this.serialized);

  static TestCase fromJson(Map<String, Object> json) =>
      _$TestCaseFromJson(json);
}

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class OutputResponse {
  final String body;
  @JsonKey(name: 'status_code')
  final int statusCode;
  final Map<String, String> headers;

  OutputResponse(this.body, this.statusCode, this.headers)
      : assert(statusCode != null);

  static OutputResponse fromJson(Map<String, Object> json) =>
      _$OutputResponseFromJson(json);
}

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class Serialized {
  final String uri;
  final String host;
  final String method;
  final String body;
  final Map<String, String> headers;

  Serialized(this.uri, this.host, this.method, this.body, this.headers);

  factory Serialized.fromJson(Map<String, dynamic> json) =>
      _$SerializedFromJson(json);
}
