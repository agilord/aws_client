import 'package:json_annotation/json_annotation.dart';
import 'package:shared_aws_api/src/model/descriptor.dart';
import 'package:shared_aws_api/src/model/shape.dart';

part 'test_model.g.dart';

@JsonSerializable(createToJson: false)
class TestSuite {
  final Map<String, Shape> shapes;
  final String description;
  final List<Case> cases;
  final Map<String, String> metadata;

  TestSuite(
    this.shapes,
    this.description,
    this.cases,
    this.metadata,
  );

  factory TestSuite.fromJson(Map<String, dynamic> json) =>
      _$TestSuiteFromJson(json);
}

@JsonSerializable(createToJson: false)
class Case {
  final Given given;
  final Map<String, dynamic> params;
  final Serialized serialized;

  Case(this.given, this.params, this.serialized);

  factory Case.fromJson(Map<String, dynamic> json) => _$CaseFromJson(json);
}

@JsonSerializable(createToJson: false)
class Given {
  final Descriptor input;
  final String name;
  final Http http;

  Given(
    this.input,
    this.name,
    this.http,
  );

  factory Given.fromJson(Map<String, dynamic> json) => _$GivenFromJson(json);
}

@JsonSerializable(createToJson: false)
class Http {
  final String method;

  Http(this.method);

  factory Http.fromJson(Map<String, dynamic> json) => _$HttpFromJson(json);
}

@JsonSerializable(createToJson: false)
class Serialized {
  final String uri;
  final String body;
  final Map<String, String> headers;

  Serialized(this.uri, this.body, this.headers);

  factory Serialized.fromJson(Map<String, dynamic> json) =>
      _$SerializedFromJson(json);
}
