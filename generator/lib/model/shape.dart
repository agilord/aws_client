import 'package:json_annotation/json_annotation.dart';

import 'descriptor.dart';
import 'error.dart';
import 'xml_namespace.dart';

part 'shape.g.dart';

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
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
  final List<String> xmlOrder;
  final String pattern;
  final String documentation;
  final String location;
  final bool streaming;
  @JsonKey(defaultValue: false)
  final bool deprecated;
  final String deprecatedMessage;
  @JsonKey(defaultValue: false)
  final bool sensitive;
  final String payload;
  @JsonKey(defaultValue: false)
  final bool box;
  final HttpError error;
  @JsonKey(defaultValue: false)
  final bool exception;
  @JsonKey(defaultValue: false)
  final bool wrapper;
  final String timestampFormat;
  @JsonKey(defaultValue: false)
  final bool fault;
  @JsonKey(defaultValue: false)
  final bool flattened;
  final String locationName;
  @JsonKey(defaultValue: false)
  final bool event;
  final XmlNamespace xmlNamespace;
  @JsonKey(defaultValue: false)
  final bool eventstream;

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
    this.deprecatedMessage,
    this.member,
    this.xmlOrder,
    this.sensitive,
    this.payload,
    this.box,
    this.error,
    this.exception,
    this.wrapper,
    this.timestampFormat,
    this.fault,
    this.flattened,
    this.locationName,
    this.event,
    this.xmlNamespace,
    this.eventstream,
  );

  factory Shape.fromJson(Map<String, dynamic> json) => _$ShapeFromJson(json);
}

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class Member {
  final String shape;
  final String documentation;
  final String location;
  final String locationName;
  final String queryName;
  @JsonKey(defaultValue: false)
  final bool idempotencyToken;
  @JsonKey(defaultValue: false)
  final bool hostLabel;
  @JsonKey(defaultValue: false)
  final bool deprecated;
  final XmlNamespace xmlNamespace;
  final String deprecatedMessage;
  @JsonKey(defaultValue: false)
  final bool box;
  @JsonKey(defaultValue: false)
  final bool jsonvalue;
  @JsonKey(defaultValue: false)
  final bool flattened;
  @JsonKey(defaultValue: false)
  final bool streaming;
  @JsonKey(defaultValue: false)
  final bool xmlAttribute;
  @JsonKey(defaultValue: false)
  final bool eventpayload;

  Member(
    this.shape,
    this.documentation,
    this.location,
    this.locationName,
    this.queryName,
    this.idempotencyToken,
    this.hostLabel,
    this.deprecated,
    this.xmlNamespace,
    this.deprecatedMessage,
    this.box,
    this.jsonvalue,
    this.flattened,
    this.streaming,
    this.xmlAttribute,
    this.eventpayload,
  );

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}
