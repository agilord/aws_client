import 'dart:io';

import 'package:aws_client.generator/builders/builder.dart';
import 'package:aws_client.generator/builders/ec2_builder.dart';
import 'package:aws_client.generator/builders/json_builder.dart';
import 'package:aws_client.generator/builders/rest_json_builder.dart';
import 'package:aws_client.generator/builders/rest_xml_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';
import 'package:aws_client.generator/model/shape.dart';

import 'builders/query_builder.dart';

File buildService(Api api) {
  ServiceBuilder builder;

  if (api.usesQueryProtocol) {
    builder = QueryServiceBuilder(api);
  } else if (api.usesJsonProtocol) {
    builder = JsonServiceBuilder(api);
  } else if (api.usesRestJsonProtocol) {
    builder = RestJsonServiceBuilder(api);
  } else if (api.usesRestXmlProtocol) {
    builder = RestXmlServiceBuilder(api);
  } else if (api.usesEc2Protocol) {
    builder = Ec2ServiceBuilder(api);
  } else {
    throw UnimplementedError(
        'Protocol not implemented: ${api.metadata.protocol}');
  }

  final buf = StringBuffer()..writeln("""
import 'dart:convert';

import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

""");
  buf
    ..writeln(builder.imports())
    ..writeln("part '${api.metadata.uid}.g.dart';\n")
    ..putMainClass(api, builder)
    ..putShapes(api)
    ..putBase64Converter();

  return File(
      '../aws_client/lib/generated/${api.metadata.className}/${api.metadata.uid}.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync(buf.toString());
}

String getListOrMapDartType(Shape shape, Api api) {
  final StringBuffer buf = StringBuffer();
  if (shape.type == 'list') {
    buf.write('List<');

    final String memberShape = shape.member?.shape;
    final String memberType = api.shapes[memberShape].type;

    if (memberType.isBasicType()) {
      buf.write(memberType.getDartType());
    } else if (memberType.isMapOrList()) {
      final String type = getListOrMapDartType(api.shapes[memberShape], api);
      buf.write(type);
    } else {
      buf.write(memberShape);
    }
    buf.write('>');
  } else if (shape.type == 'map') {
    buf.write('Map<');

    final String memberKey = shape.key.shape;
    final String memberKeyType = api.shapes[memberKey].type;

    if (memberKeyType.isBasicType()) {
      buf.write(memberKeyType.getDartType());
    } else if (memberKeyType.isMapOrList()) {
      final String type = getListOrMapDartType(api.shapes[memberKey], api);
      buf.write(type);
    } else {
      buf.write(memberKey);
    }
    buf.write(', ');

    final String memberValue = shape.value.shape;
    final String memberValueType = api.shapes[memberValue].type;

    if (memberValueType.isBasicType()) {
      buf.write(memberValueType.getDartType());
    } else if (memberValueType.isMapOrList()) {
      final String type = getListOrMapDartType(api.shapes[memberValue], api);
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
  void putMainClass(Api api, ServiceBuilder builder) {
    writeln('''
class ${api.metadata.className} {
${builder.constructor()}
''');

    api.operations.values.forEach((op) => putOperation(api, op, builder));

    writeln('}');
  }

  void putOperation(Api api, Operation operation, ServiceBuilder builder) {
    final bool deprecated = operation.deprecated;

    String returnType = operation.output?.shape ?? 'void';
    final Shape returnShape = api.shapes[returnType];
    if (returnShape != null &&
        returnShape?.type == 'structure' &&
        returnShape.hasEmptyMembers) {
      returnType = 'void';
    }

    final input = operation.input;
    final parameterType = input?.shape;

    final parameterShape = api.shapes[parameterType];
    final useParameter = parameterShape != null && parameterShape.hasMembers;

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

    writeln(builder.operationContent(operation));

    writeln('  }');
  }

  void putShapes(Api api) =>
      api.shapes.keys.forEach((key) => putShape(key, api.shapes[key], api));

  void putShape(String name, Shape shape, Api api) {
    final bool deprecated = shape.deprecated;

    // There is no reason to generate something empty
    if (shape.hasEmptyMembers) return;

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
          final Shape shape = api.shapes[shapename];

          final String type = shape.type;
          if (type.isBasicType()) {
            shapename = type.getDartType();
          } else if (type.isMapOrList()) {
            shapename = getListOrMapDartType(shape, api);
          }

          final List<String> valueEnum = api.shapes[member.shape].enumeration;

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
