import 'package:aws_client.generator/model/descriptor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shape.g.dart';

@JsonSerializable(createToJson: false)
class Shape {
  final String type;
  @JsonKey(name: 'enum')
  final List<String> enumeration;
  final List<String> required;
  final Map<String, Member> members;
  final Descriptor member;
  final Descriptor key;
  final Descriptor value;
  final num max;
  final num min;
  final String pattern;
  final String documentation;
  final String location;
  final bool streaming;
  @JsonKey(defaultValue: false)
  final bool deprecated;

  Shape(
    this.type,
    this.enumeration,
    this.required,
    this.members,
    this.key,
    this.value,
    this.max,
    this.min,
    this.pattern,
    this.documentation,
    this.location,
    this.streaming,
    this.deprecated,
    this.member,
  );

  factory Shape.fromJson(Map<String, dynamic> json) => _$ShapeFromJson(json);
}

@JsonSerializable(createToJson: false)
class Member {
  final String shape;
  final String documentation;
  final String location;
  final String locationName;
  final String queryName;
  final bool idempotencyToken;
  final bool hostLabel;

  Member(
    this.shape,
    this.documentation,
    this.location,
    this.locationName,
    this.queryName,
    this.idempotencyToken,
    this.hostLabel,
  );

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}
