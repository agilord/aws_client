import 'package:json_annotation/json_annotation.dart';

import 'descriptor.dart';

part 'shape.g.dart';

@JsonSerializable(includeIfNull: false)
class Shape {
  final String type;
  final Map<String, Member> members;
  final Descriptor member;
  final Descriptor key;
  final Descriptor value;
  final String locationName;
  @JsonKey(defaultValue: false)
  final bool flattened;

  Shape(
    this.type,
    this.key,
    this.value,
    this.member,
    this.flattened,
    this.members,
    this.locationName,
  );

  factory Shape.fromJson(Map<String, dynamic> json) => _$ShapeFromJson(json);

  Map<String, dynamic> toJson() => _$ShapeToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Member {
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
