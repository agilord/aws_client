import 'dart:io';

import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';
import 'package:aws_client.generator/model/shape.dart';

//import 'package:html/parser.dart' as htmlparser;

Map<String, String> typeMap = {};
Map<String, String> uriArgsMap = {};

Map<String, Shape> shapes;
Metadata metadata;

File buildService(Api api) {
  metadata = api.metadata;
  String classname = metadata.serviceId;
  classname = classname.replaceAll(' ', '');

  shapes = api.shapes;

  final buf = StringBuffer()..writeln("""
// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

""");
  if (api.usesQueryProtocol) {
    buf.writeln('import \'package:aws_client/src/protocol/query.dart\';');
  }
  buf
    ..writeln("part '${metadata.uid}.g.dart';\n")
    ..putMainClass(api)
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
  void putMainClass(Api api) {
    final String className = metadata.className;

    final constructor = StringBuffer();
    if (api.usesQueryProtocol) {
      constructor
        ..writeln('  final QueryProtocol _protocol;')
        ..writeln('\n  $className({Client client}) '
            ': _protocol = QueryProtocol(client: client);');
    }

    writeln('''
${api.documentation.splitToComment()}
class $className {
$constructor
''');

    api.operations.values.forEach((op) => putOperation(api, op));

    writeln('}');
  }

  void putOperation(Api api, Operation operation) {
    final String docs = operation.documentation;
    final bool deprecated = operation.deprecated;

    String returnType = operation.output?.shape ?? 'void';
    final Shape returnShape = shapes[returnType];
    if (returnShape != null &&
        returnShape?.type == 'structure' &&
        returnShape.hasEmptyMembers) {
      returnType = 'void';
    }
    final hasReturnType = returnType != 'void';
    final input = operation.input;
    final parameterType = input?.shape;

    final parameterShape = shapes[parameterType];
    final useParameter = parameterShape != null && parameterShape.hasMembers;

    if (docs != null) {
      writeln(docs.splitToComment());
    }
    if (deprecated) {
      writeln("@Deprecated('Deprecated')");
    }

    write('  Future<$returnType> ${operation.methodName}(');
    if (useParameter) write('$parameterType input');
//    TODO: migrate to per-member input parameters
//    if (useParameter) write('{');
//    for (final member in parameterShape?.members ?? <Member>[]) {
//    }
//    if (useParameter) write('}');
    writeln(') async {');
    if (useParameter) {
      writeln('    ArgumentError.checkNotNull(input, \'input\');');
    }

    // final voidReturn = returnType == 'void';
    if (api.usesQueryProtocol) {
      writeln('    final \$request = <String, dynamic>{\n'
          '      \'Action\': \'${operation.name}\',\n'
          '      \'Version\': \'${api.metadata.apiVersion}\',');
      if (useParameter) {
        writeln('      ...input.toJson(),');
      }
      writeln('    };');
      final params = StringBuffer('\$request, '
          'method: \'${operation.http.method}\', '
          'requestUri: \'${operation.http.requestUri}\'');
      if (operation.output?.resultWrapper != null) {
        params.write(', resultWrapper: \'${operation.output.resultWrapper}\',');
      }
      if (hasReturnType) {
        writeln('    final \$result = await _protocol.send($params);');
        writeln('    return $returnType.fromJson(\$result);');
      } else {
        writeln('    await _protocol.send($params);');
      }
    } else if (api.metadata.protocol == 'rest-json') {
      writeln('    // TODO: implement rest-json');
      writeln('    throw UnimplementedError();');
    } else if (api.metadata.protocol == 'rest-xml') {
      // TODO: implement rest-xml protocol
      writeln('    // TODO: implement rest-xml');
      writeln('    throw UnimplementedError();');
    } else {
      // TODO: unknown protocol, investigate and implement
      writeln('    // TODO: implement ${api.metadata.protocol}');
      writeln('    throw UnimplementedError();');
    }

    writeln('  }');
  }

  void putShapes(Map<String, Shape> shapes) =>
      shapes.keys.forEach((key) => putShape(key, shapes[key]));

  void putShape(String name, Shape shape) {
    final String docs = shape.documentation;
    final bool deprecated = shape.deprecated;

    // There is no reason to generate something empty
    if (shape.hasEmptyMembers) return;

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
        writeln(
            '@JsonSerializable(includeIfNull: false, explicitToJson: true)');
        writeln('class $name {');
        for (final member in shape.members) {
          String shapename = member.shape;
          final Shape shape = shapes[shapename];

          final String type = shape.type;
          if (type.isBasicType()) {
            shapename = type.getDartType();
          } else if (type.isMapOrList()) {
            shapename = getListOrMapDartType(shape);
          }

          final String documentation = member.documentation;
          if (documentation != null) {
            writeln(documentation.splitToComment());
          }

          final List<String> valueEnum = shapes[member.shape].enumeration;

          if (valueEnum?.isNotEmpty ?? false) {
            writeln("/// Possible values: [${valueEnum.join(", ")}]");
          }

          if (shapename == 'blob') {
            writeln('  @Base64Converter()');
          } else if (shapename.contains('blob')) {
            writeln('  @Base64ListConverter()');
          }

          shapename = shapename.replaceAll('blob', 'String');
          writeln("  @JsonKey(name: '${member.name}')");
          writeln('  final $shapename ${member.fieldName};');
        }

        final constructorMembers = shape.members.map((member) {
          return "${member.isRequired ? "@required " : ""}this.${member.fieldName}, ";
        }).join();
        if (shape.hasEmptyMembers) {
          writeln('\n  $name();');
        } else {
          writeln('\n  $name({$constructorMembers});');
        }
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
