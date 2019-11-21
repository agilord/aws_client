import 'dart:io';

//import 'package:html/parser.dart' as htmlparser;

Map<String, String> typeMap = {};
Map<String, String> uriArgsMap = {};

Map<String, dynamic> shapes;
Map<String, String> metadata;
Map<String, dynamic> definition;

File buildService(Map<String, dynamic> def, Map<String, dynamic> paginators) {
  definition = def;
  metadata = (def['metadata'] as Map).cast<String, String>();
  String classname = definition['metadata']['serviceId'] as String;
  classname = classname.replaceAll(' ', '');

  shapes = definition['shapes'] as Map<String, dynamic>;

  final buf = StringBuffer()
    ..writeln("""
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '${metadata['uid']}.meta.dart';
${paginators == null ? '' : "import '${metadata['uid']}.paginators.dart';"}

""")
    ..writeln("part '${metadata['uid']}.g.dart';\n")
    ..putMainClass(definition)
    ..putShapes(shapes)
    ..putBase64Converter();

  return File('../aws_client/lib/generated/$classname/${metadata['uid']}.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync(buf.toString());
}

String getListOrMapDartType(Map<String, dynamic> shape) {
  final StringBuffer buf = StringBuffer();
  if (shape['type'] == 'list') {
    buf.write('List<');

    final String memberShape = shape['member']['shape'] as String;
    final String memberType = shapes[memberShape]['type'] as String;

    if (memberType.isBasicType()) {
      buf.write(memberType.getDartType());
    } else if (memberType.isMapOrList()) {
      final String type =
          getListOrMapDartType(shapes[memberShape] as Map<String, dynamic>);
      buf.write(type);
    } else {
      buf.write(memberShape);
    }
    buf.write('>');
  } else if (shape['type'] == 'map') {
    buf.write('Map<');

    final String memberKey = shape['key']['shape'] as String;
    final String memberKeyType = shapes[memberKey]['type'] as String;

    if (memberKeyType.isBasicType()) {
      buf.write(memberKeyType.getDartType());
    } else if (memberKeyType.isMapOrList()) {
      final String type =
          getListOrMapDartType(shapes[memberKey] as Map<String, dynamic>);
      buf.write(type);
    } else {
      buf.write(memberKey);
    }
    buf.write(', ');

    final String memberValue = shape['value']['shape'] as String;
    final String memberValueType = shapes[memberValue]['type'] as String;

    if (memberValueType.isBasicType()) {
      buf.write(memberValueType.getDartType());
    } else if (memberValueType.isMapOrList()) {
      final String type =
          getListOrMapDartType(shapes[memberValue] as Map<String, dynamic>);
      buf.write(type);
    } else {
      buf.write(memberValue);
    }

    buf.write('>');
  } else {
    throw Exception('No type found');
  }

  return buf.toString();
}

extension Casting on dynamic {
  T cast<T>() => this is T ? this as T : null;
}

extension StringStuff on String {
  String splitToComment() {
    return '';
    // Making commented code from JSON is basically impossible, don' try it
    /*if (this != null) {
      String toSplit = this;
      final document = htmlparser.parse(this);
      String body = document.body.text;
      if (body != null) {
        body = htmlparser.parse(body).documentElement.text;
        if (body != null) {
          toSplit = body;
        }
      }

      toSplit.replaceAll('\n', '');

      return "/** \n ${RegExp(r"(.{70,}?\s)|(.+)", dotAll: true).allMatches(toSplit).map((match) => match[0]).join("\n")}\n*/";
    }
    return "";*/
  }

  bool isBasicType() =>
      this == 'string' ||
      this == 'boolean' ||
      this == 'double' ||
      this == 'integer' ||
      this == 'long' ||
      this == 'blob' ||
      this == 'timestamp';

  bool isMapOrList() => this == 'list' || this == 'map';

  String getDartType() {
    switch (this) {
      case 'string':
        return 'String';
      case 'boolean':
        return 'bool';
      case 'double':
        return this;
      case 'integer':
        return 'int';
      case 'long':
        return 'int';
      case 'blob':
        return 'blob';
      case 'timestamp':
        return 'String';
      default:
        return '???';
    }
  }
}

extension StringBufferStuff on StringBuffer {
  void putMainClass(dynamic contents) {
    final String className = metadata['serviceId'].replaceAll(' ', '');

    writeln("""
${(contents["documentation"] as String).splitToComment()}
class $className {""");

    (contents['operations'] as Map<String, dynamic>)
        .values
        .cast<Map<String, dynamic>>()
        .forEach(putOperation);

    writeln('}');
  }

  void putOperation(Map<String, dynamic> method) {
    final String docs = method['documentation'] as String;
    final bool deprecated = (method['deprecated'] ?? false) as bool;

    var returnType = (method['output'] ?? {})['shape'] ?? 'void';
    final Map returnShape = (shapes[returnType] as Map) ?? {};
    final Map<String, dynamic> returnMembers =
        returnShape['members'] as Map<String, dynamic>;
    if (returnShape != null &&
        returnShape['type'] == 'structure' &&
        returnMembers.isEmpty) {
      returnType = 'void';
    }
    final input = method['input'] ?? {};
    final parameterType = input['shape'];

    final parameterShape = shapes[parameterType] ?? <String, dynamic>{};
    final Map<String, dynamic> parameterMembers = (parameterShape['members'] ??
        <String, dynamic>{}) as Map<String, dynamic>;

    if (docs != null) {
      writeln(docs.splitToComment());
    }
    if (deprecated) {
      writeln("@Deprecated('Deprecated')");
    }

    final String methodName = method['name'] as String;

    writeln(
        "  Future<$returnType> $methodName(${parameterMembers.isNotEmpty ? "$parameterType param" : ""}) async {");

    writeln('// TODO');

    final bool voidReturn = returnType == 'void';

    if (!voidReturn) {
      writeln('    return null;');
    }
    writeln('  }');
  }

  void putShapes(Map<String, dynamic> shapes) => shapes.keys
      .forEach((key) => putShape(key, shapes[key] as Map<String, dynamic>));

  void putShape(String name, Map<String, dynamic> shape) {
    final String docs = shape['documentation'] as String;
    final bool deprecated = (shape['deprecated'] ?? false) as bool;
    final Map<String, dynamic> members =
        shape['members'] as Map<String, dynamic>;

    // There is no reason to generate something empty
    if (members?.isEmpty ?? true) return;

    if (docs != null) writeln(docs.splitToComment());
    if (deprecated) {
      writeln(r"@Deprecated('Deprecated')");
    }

    if (shape['enum'] != null) {
      if (shape['type'] == 'string') {
        writeln('class $name {');
        final List<String> enumValues =
            shape['enum'].cast<String>() as List<String>;
        enumValues.forEach((value) => writeln(
            "  static const ${value.replaceAll(".", "_").replaceAll("-", "_")} = \"$value\";"));
        writeln('}');
      }
    } else {
      if (shape['type'] == 'structure') {
        writeln('@JsonSerializable(includeIfNull: false)');
        writeln('class $name {');
        final List<String> required =
            shape['required']?.cast<String>() as List<String>;
        final memberNames = members.keys.toList();

        if (required?.isNotEmpty ?? false) {
          memberNames.sort((a, b) {
            if (required.contains(a) && !required.contains(b)) {
              return -1;
            } else if (!required.contains(a) && required.contains(b)) {
              return 1;
            }
            return 0;
          });
        }

        memberNames.forEach((memberName) {
          final memberStruct = members[memberName];
          String shapename = memberStruct['shape'] as String;
          final Map<String, dynamic> shape =
              shapes[shapename] as Map<String, dynamic>;

          final String type = shape['type'] as String;
          if (type.isBasicType()) {
            shapename = type.getDartType();
          } else if (type.isMapOrList()) {
            shapename = getListOrMapDartType(shape);
          }

          final String documentation = memberStruct['documentation'] as String;
          if (documentation != null) {
            writeln(documentation.splitToComment());
          }

          final List valueEnum = shapes[memberStruct['shape']]['enum'] as List;

          if (valueEnum?.isNotEmpty ?? false) {
            writeln("/// Possible values: [${valueEnum.join(", ")}]");
          }

          if (shapename == 'blob') {
            writeln('  @Base64Converter()');
          } else if (shapename.contains('blob')) {
            writeln('  @Base64ListConverter()');
          }

          shapename = shapename.replaceAll('blob', 'String');
          writeln("  @JsonKey(name: '$memberName')");
          writeln('  final $shapename m$memberName;');
        });

        writeln(
            "\n  $name(${memberNames.isNotEmpty ? "{" : ""}${memberNames.map((name) => "${(required?.contains(name) ?? false) ? "@required " : ""}this.m$name, ").join()}${memberNames.isNotEmpty ? "}" : ""});");
        writeln(
            '  factory $name.fromJson(Map<String, dynamic> json) => _\$${name}FromJson(json);');
        writeln('  Map<String, dynamic> toJson() => _\$${name}ToJson(this);');
        writeln('}');
      }
    }
  }

  void putBase64Converter() {
    writeln('''
class Base64Converter implements JsonConverter<String, String> {
  const Base64Converter();

  @override
  String fromJson(String json) => utf8.decode(base64Decode(json));

  @override
  String toJson(String object) => base64Encode(utf8.encode(object));
}

class Base64ListConverter implements JsonConverter<List<String>, List<String>> {
  const Base64ListConverter();

  @override
  List<String> fromJson(List<String> json) =>
      json.map((x) => utf8.decode(base64Decode(x))).toList(growable: false);

  @override
  List<String> toJson(List<String> object) =>
      object.map((x) => base64Encode(utf8.encode(x))).toList(growable: false);
}
    ''');
  }
}
