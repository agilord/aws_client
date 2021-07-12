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
  bool isUsedInInput = false;
  @JsonKey(ignore: true)
  bool isTopLevelInputEnum = false;
  @JsonKey(ignore: true)
  bool isTopLevelOutputEnum = false;
  @JsonKey(ignore: true)
  bool isUsedInOutput = false;
  @JsonKey(ignore: true)
  bool excludeFactoryMethod = false;
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
  @JsonKey(defaultValue: false)
  final bool union;
  @JsonKey(defaultValue: false)
  final bool requiresLength;
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
    this.union,
    this.requiresLength,
  ) {
    membersMap?.entries?.forEach((e) {
      e.value.name = e.key;
    });
    _members = membersMap?.values?.toList() ?? <Member>[];
    required?.forEach((name) {
      _members.firstWhere((m) => m.name == name)._isRequired = true;
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

  bool get hasHeaderMembers => headerMembers.isNotEmpty;

  bool get hasUriMembers => uriMembers.isNotEmpty;

  bool get hasQueryMembers => queryMembers.isNotEmpty;

  bool get hasBodyMembers => _members.any((m) => m.isBody);

  Iterable<Member> get headerMembers => _members.where((m) => m.isHeader);

  Iterable<Member> get uriMembers => _members.where((m) => m.isUri);

  Iterable<Member> get queryMembers => _members.where((m) => m.isQuery);

  bool get requiresJson {
    if (type.isBasicType()) {
      return false;
    }
    if (member != null && !member.shapeClass.requiresJson) {
      return false;
    }
    if (value != null && !value.shapeClass.requiresJson) {
      return false;
    }
    return generateFromJson || generateToJson;
  }

  bool get generateFromJson =>
      isUsedInOutput && api.generateFromJson && !excludeFactoryMethod;

  bool get generateToJson => isUsedInInput && api.generateJson;

  bool get generateFromXml =>
      api.generateFromXml && isUsedInOutput && !excludeFactoryMethod;

  bool get generateToXml => api.generateToXml && isUsedInInput;

  String get className {
    var cn = name.substring(0, 1).toUpperCase() + name.substring(1);
    if (cn == 'Function') cn = '\$$cn';

    cn = cn.replaceAll(RegExp(r'^_+'), '');

    return cn;
  }

  void markUsed(bool isInput) {
    if (isInput && isUsedInInput) return;
    if (!isInput && isUsedInOutput) return;
    if (isInput) {
      isUsedInInput = true;
    } else {
      isUsedInOutput = true;
    }
    members.forEach((m) => m.shapeClass.markUsed(isInput));
    member?.shapeClass?.markUsed(isInput);
    key?.shapeClass?.markUsed(isInput);
    value?.shapeClass?.markUsed(isInput);
  }
}

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class Member {
  @JsonKey(ignore: true)
  Api api;
  @JsonKey(ignore: true)
  String name;
  @JsonKey(ignore: true)
  bool _isRequired = false;
  final String shape;
  final String documentation;
  @JsonKey(name: 'enum')
  final List<String> enumeration;
  final String location;
  final String locationName;
  // queryName is only defined in EC2
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
  final List<String> tags;
  final String timestampFormat;
  final String pattern;

  Member(
    this.shape,
    this.documentation,
    this.enumeration,
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
    this.tags,
    this.timestampFormat,
    this.pattern,
  ) {
    _isRequired = location == 'uri';
  }

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  bool get isRequired => _isRequired && !idempotencyToken;

  Shape get shapeClass => api.shapes[shape];

  String get fieldName {
    final lc = name.lowercaseName;
    if (lc.isFieldReserved) {
      return '${lc}Value';
    } else {
      return lc;
    }
  }

  String get dartType {
    final dartType = shape;
    final type = shapeClass.type;

    if (jsonvalue || shapeClass.member?.jsonvalue == true) {
      if (shapeClass.type == 'list') {
        return 'List<Object>';
      } else {
        return 'Object';
      }
    }
    // There should be an enum for enumerated parameters
    else if (shapeClass.enumeration != null) {
      return shapeClass.className;
    } else if (type.isBasicType()) {
      return type.getDartType(api);
    } else if (type.isMapOrList()) {
      return getListOrMapDartType(shapeClass);
    }

    return dartType;
  }

  bool get isHeader =>
      (location ?? shapeClass.location) == 'header' ||
      (location ?? shapeClass.location) == 'headers';

  bool get isUri => (location ?? shapeClass.location) == 'uri';

  bool get isQuery => (location ?? shapeClass.location) == 'querystring';

  bool get isStatusCode => (location ?? shapeClass.location) == 'statusCode';

  bool get isBody => !isHeader && !isUri && !isQuery && !isStatusCode;
}

extension NameStuff on String {
  bool get isAllUpperCase => toUpperCase() == this;

  bool get isReserved => <String>{
        'bool',
        'break',
        'case',
        'continue',
        'default',
        'do',
        'enum',
        'false',
        'for',
        'if',
        'in',
        'is',
        'new',
        'null',
        'return',
        'true',
      }.contains(this);

  bool get isEnumReserved =>
      isReserved ||
      <String>{
        'index',
        'values',
      }.contains(this);

  bool get isFieldReserved =>
      isReserved ||
      <String>{
        'bool',
        'double',
        'int',
      }.contains(this);

  String get lowercaseName {
    if (this == null) return this;
    var value = this;
    value = value.split('_').where((s) => s.isNotEmpty).map((s) {
      // convert only if all characters are the same case
      if (s.toLowerCase() == s || s.toUpperCase() == s) {
        return s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
      } else {
        // otherwise uppercase the first, and keep the rest the same
        return s.substring(0, 1).toUpperCase() + s.substring(1);
      }
    }).map((s) {
      if (s.startsWith(RegExp('[0-9]'))) {
        return '_$s';
      } else {
        return s;
      }
    }).join('');
    if (value.startsWith('_')) value = value.substring(1);
    if (value.isEmpty) return this;
    if (value.isAllUpperCase) value = value.toLowerCase();
    if (value.startsWith('AWS')) value = value.replaceFirst('AWS', 'aws');
    return value.substring(0, 1).toLowerCase() + value.substring(1);
  }
}
