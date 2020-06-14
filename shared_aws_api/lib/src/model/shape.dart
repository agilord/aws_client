import 'package:json_annotation/json_annotation.dart';

import 'api.dart';
import 'descriptor.dart';

part 'shape.g.dart';

@JsonSerializable(includeIfNull: false)
class Shape {
  @JsonKey(ignore: true)
  Api _api;
  final String type;
  final Map<String, Member> members;
  final Descriptor member;
  final Descriptor key;
  final Descriptor value;
  @JsonKey(defaultValue: false)
  final bool flattened;

  Shape(
    this.type,
    this.key,
    this.value,
    this.member,
    this.flattened,
    this.members,
  );

  Api get api => _api;

  set api(Api api) {
    _api = api;
    members?.forEach((key, value) => value.api = api);
  }

  factory Shape.fromJson(Map<String, dynamic> json) => _$ShapeFromJson(json);

  Map<String, dynamic> toJson() => _$ShapeToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Member {
  @JsonKey(ignore: true)
  Api api;
  final String shape;
  @JsonKey(defaultValue: false)
  final bool flattened;

  Member(
    this.shape,
    this.flattened,
  );

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);
}
