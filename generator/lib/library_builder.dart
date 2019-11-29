import 'dart:io';

import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';
import 'package:aws_client.generator/model/shape.dart';

//import 'package:html/parser.dart' as htmlparser;

Map<String, String> typeMap = {};
Map<String, String> uriArgsMap = {};

Map<String, Shape> shapes;
Metadata metadata;
Api definition;

File buildService(Api def) {
  definition = def;
  metadata = def.metadata;
  String classname = metadata.serviceId;
  classname = classname.replaceAll(' ', '');

  shapes = def.shapes;

  final buf = StringBuffer()
    ..writeln("""
// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

""")
    ..writeln("part '${metadata.uid}.g.dart';\n")
    ..putMainClass(definition)
    ..putShapes(shapes)
    ..putBase64Converter();

  return File('../aws_client/lib/generated/$classname/${metadata.uid}.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync(buf.toString());
}

String getListOrMapDartType(Shape shape) {
  final StringBuffer buf = StringBuffer();
  if (shape.type == 'list') {
    buf.write('List<');

    final String memberShape = shape.member?.shape;
    final String memberType = shapes[memberShape].type;

    if (memberType.isBasicType()) {
      buf.write(memberType.getDartType());
    } else if (memberType.isMapOrList()) {
      final String type = getListOrMapDartType(shapes[memberShape]);
      buf.write(type);
    } else {
      buf.write(memberShape);
    }
    buf.write('>');
  } else if (shape.type == 'map') {
    buf.write('Map<');

    final String memberKey = shape.key.shape;
    final String memberKeyType = shapes[memberKey].type;

    if (memberKeyType.isBasicType()) {
      buf.write(memberKeyType.getDartType());
    } else if (memberKeyType.isMapOrList()) {
      final String type = getListOrMapDartType(shapes[memberKey]);
      buf.write(type);
    } else {
      buf.write(memberKey);
    }
    buf.write(', ');

    final String memberValue = shape.value.shape;
    final String memberValueType = shapes[memberValue].type;

    if (memberValueType.isBasicType()) {
      buf.write(memberValueType.getDartType());
    } else if (memberValueType.isMapOrList()) {
      final String type = getListOrMapDartType(shapes[memberValue]);
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
        return 'DateTime';
      default:
        return '???';
    }
  }
}

extension StringBufferStuff on StringBuffer {
  void putMainClass(Api contents) {
    final String className = metadata.className;

    writeln('''
${contents.documentation.splitToComment()}
class $className {''');

    contents.operations.values.forEach(putOperation);

    writeln('}');
  }

  void putOperation(Operation method) {
    final String docs = method.documentation;
    final bool deprecated = method.deprecated;

    var returnType = method.output?.shape ?? 'void';
    final Shape returnShape = shapes[returnType];
    final Map<String, Member> returnMembers = returnShape?.members;
    if (returnShape != null &&
        returnShape?.type == 'structure' &&
        returnMembers.isEmpty) {
      returnType = 'void';
    }
    final input = method.input;
    final parameterType = input?.shape;

    final Map<String, Member> parameterMembers =
        (shapes[parameterType]?.members ?? <String, Member>{});

    if (docs != null) {
      writeln(docs.splitToComment());
    }
    if (deprecated) {
      writeln("@Deprecated('Deprecated')");
    }

    final String methodName = method.name;

    writeln(
        "  Future<$returnType> $methodName(${parameterMembers.isNotEmpty ? "$parameterType param" : ""}) async {");

    writeln('// TODO');

    final bool voidReturn = returnType == 'void';

    if (!voidReturn) {
      writeln('    return null;');
    }
    writeln('  }');
  }

  void putShapes(Map<String, Shape> shapes) =>
      shapes.keys.forEach((key) => putShape(key, shapes[key]));

  void putShape(String name, Shape shape) {
    final String docs = shape.documentation;
    final bool deprecated = shape.deprecated;
    final Map<String, Member> members = shape.members;

    // There is no reason to generate something empty
    if (members?.isEmpty ?? true) return;

    if (docs != null) writeln(docs.splitToComment());
    if (deprecated) {
      writeln(r"@Deprecated('Deprecated')");
    }

    if (shape.enumeration != null) {
      if (shape.type == 'string') {
        writeln('class $name {');
        final List<String> enumValues = shape.enumeration;
        enumValues.forEach((value) => writeln(
            "  static const ${value.replaceAll(".", "_").replaceAll("-", "_")} = \"$value\";"));
        writeln('}');
      }
    } else {
      if (shape.type == 'structure') {
        writeln('@JsonSerializable(includeIfNull: false)');
        writeln('class $name {');
        final List<String> required = shape.required;
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
          String shapename = memberStruct.shape;
          final Shape shape = shapes[shapename];

          final String type = shape.type;
          if (type.isBasicType()) {
            shapename = type.getDartType();
          } else if (type.isMapOrList()) {
            shapename = getListOrMapDartType(shape);
          }

          final String documentation = memberStruct.documentation;
          if (documentation != null) {
            writeln(documentation.splitToComment());
          }

          final List<String> valueEnum = shapes[memberStruct.shape].enumeration;

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
          writeln('  final $shapename ${_lowercaseName(memberName)};');
        });

        writeln(
            "\n  $name(${memberNames.isNotEmpty ? "{" : ""}${memberNames.map((name) => "${(required?.contains(name) ?? false) ? "@required " : ""}this.${_lowercaseName(name)}, ").join()}${memberNames.isNotEmpty ? "}" : ""});");
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

// TODO: refactor members and move this method inside Member (e.g. Member.fieldName)
String _lowercaseName(String name) {
  if (name == null || name.isEmpty) return name;
  return name.substring(0, 1).toLowerCase() + name.substring(1);
}
