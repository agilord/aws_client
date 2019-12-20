import 'package:json_annotation/json_annotation.dart';

import 'api.dart';
import 'dart_type.dart';
import 'descriptor.dart';
import 'error.dart';
import 'xml_namespace.dart';

part 'shape.g.dart';

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class Shape {
  @JsonKey(ignore: true)
  Api api;
  @JsonKey(ignore: true)
  String name;
  @JsonKey(ignore: true)
  bool isUsed = false;
  final String type;
  @JsonKey(name: 'enum')
  final List<String> enumeration;
  final List<String> required;
  @JsonKey(name: 'members')
  final Map<String, Member> membersMap;
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
  List<Member> _members;

  Shape(
    this.type,
    this.enumeration,
    this.required,
    this.membersMap,
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
  ) {
    membersMap?.entries?.forEach((e) {
      e.value.name = e.key;
    });
    _members = membersMap?.values?.toList() ?? <Member>[];
    required?.forEach((name) {
      _members.firstWhere((m) => m.name == name).isRequired = true;
    });
    _members.sort((a, b) {
      if (a.isRequired && !b.isRequired) return -1;
      if (!a.isRequired && b.isRequired) return 1;
      return a.name.compareTo(b.name);
    });
  }

  factory Shape.fromJson(Map<String, dynamic> json) => _$ShapeFromJson(json);

  void initReferences() {
    member?.api = api;
    key?.api = api;
    value?.api = api;
    members.forEach((m) => m.api = api);
  }

  List<Member> get members => _members;

  bool get hasMembers => _members.isNotEmpty;

  bool get hasEmptyMembers => _members.isEmpty;

  Member get payloadMember =>
      _members.firstWhere((mem) => mem.name == payload, orElse: () => null);

  String get className {
    var cn = name.substring(0, 1).toUpperCase() + name.substring(1);
    if (cn == 'Function') cn = '\$$cn';
    return cn;
  }

  void markUsed() {
    if (isUsed) return;
    isUsed = true;
    members.forEach((m) => m.shapeClass.markUsed());
    member?.shapeClass?.markUsed();
    key?.shapeClass?.markUsed();
    value?.shapeClass?.markUsed();
  }
}

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class Member {
  @JsonKey(ignore: true)
  Api api;
  @JsonKey(ignore: true)
  String name;
  @JsonKey(ignore: true)
  bool isRequired = false;
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

  Shape get shapeClass => api.shapes[shape];

  String get fieldName {
    final lc = name.lowercaseName;
    if (lc.isReserved) {
      return '${lc}Value';
    } else {
      return lc;
    }
  }

  String get dartType {
    var dartType = shape;
    final type = shapeClass.type;
    if (type.isBasicType()) {
      dartType = type.getDartType();
    } else if (type.isMapOrList()) {
      dartType = getListOrMapDartType(shapeClass);
    }
    return dartType;
  }
}

extension NameStuff on String {
  bool get isAllUpperCase => toUpperCase() == this;

  bool get isReserved => <String>{
        'bool',
        'break',
        'continue',
        'default',
        'do',
        'enum',
        'false',
        'if',
        'in',
        'is',
        'new',
        'null',
        'return',
        'true',
      }.contains(this);

  String get lowercaseName {
    if (this == null || isEmpty) return this;
    if (isAllUpperCase) return toLowerCase();
    if (startsWith('AWS')) return replaceFirst('AWS', 'aws');
    return substring(0, 1).toLowerCase() + substring(1);
  }
}
