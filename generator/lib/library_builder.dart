import 'dart:io';

import 'package:aws_client.generator/builders/builder.dart';
import 'package:aws_client.generator/builders/ec2_builder.dart';
import 'package:aws_client.generator/builders/json_builder.dart';
import 'package:aws_client.generator/builders/rest_json_builder.dart';
import 'package:aws_client.generator/builders/rest_xml_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/dart_type.dart';
import 'package:aws_client.generator/model/descriptor.dart';
import 'package:aws_client.generator/model/operation.dart';
import 'package:aws_client.generator/model/shape.dart';

import 'builders/query_builder.dart';

File buildService(Api api) {
  api.initReferences();

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
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
${api.usesXml ? 'import \'package:xml/xml.dart\';' : ''}

import 'package:aws_client/src/credentials.dart';
import 'package:aws_client/src/protocol/shared.dart';
import 'package:aws_client/src/scoping_extensions.dart';
""");
  buf
    ..writeln(builder.imports())
    ..writeln("part '${api.metadata.uid}.g.dart';\n")
    ..putMainClass(api, builder)
    ..putShapes(api)
    ..putExceptions(api);

  return File(
      '../aws_client/lib/generated/${api.metadata.className}/${api.metadata.uid}.dart')
    ..createSync(recursive: true)
    ..writeAsStringSync(buf.toString());
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
    final input = operation.input;
    final parameterType = input?.shape;

    final parameterShape = api.shapes[parameterType];
    final useParameter = parameterShape != null && parameterShape.hasMembers;
    parameterShape?.isNotUsed = true;

    if (operation.deprecated) {
      writeln("@Deprecated('Deprecated')");
    }

    operation?.errors?.map((d) => d.shape)?.forEach((e) {
      writeln('  /// May throw [$e].');
    });

    write('  Future<${operation.returnType}> ${operation.methodName}(');
    if (useParameter) write('{');

    for (final member in parameterShape?.members ?? <Member>[]) {
      if (member.isRequired) {
        write('@required ');
      }
      write('${member.dartType} ${member.fieldName}, ');
    }

    if (useParameter) write('}');
    writeln(') async {');
    for (final member in parameterShape?.members ?? <Member>[]) {
      if (member.isRequired) {
        final name = member.fieldName;
        writeln('    ArgumentError.checkNotNull($name, \'$name\');');
      }
    }

    writeln(builder.operationContent(operation));

    writeln('  }');
  }

  void putShapes(Api api) =>
      api.shapes.keys.forEach((key) => putShape(key, api.shapes[key]));

  void putShape(String name, Shape shape) {
    // There is no reason to generate something empty or not used
    if (shape.hasEmptyMembers || shape.isNotUsed) return;

    if (shape.deprecated) {
      writeln(r"@Deprecated('Deprecated')");
    }

    if (shape.enumeration != null) {
      if (shape.type == 'string') {
        writeln('class $name {');
        shape.enumeration.forEach((value) => writeln(
            "  static const ${value.replaceAll(".", "_").replaceAll("-", "_")} = \"$value\";"));
        writeln('}');
      }
    } else {
      if (shape.type == 'structure') {
        writeln(
            '@JsonSerializable(includeIfNull: false, explicitToJson: true)');

        writeln('class $name {');
        for (final member in shape.members) {
          final valueEnum = shape.api.shapes[member.shape].enumeration;

          if (valueEnum?.isNotEmpty ?? false) {
            writeln("/// Possible values: [${valueEnum.join(", ")}]");
          }

          if (member.dartType == 'Uint8List') {
            writeln('@Uint8ListConverter()');
          } else if (member.dartType == 'List<Uint8List>') {
            writeln('@Uint8ListListConverter()');
          }

          writeln("  @JsonKey(name: '${member.name}')");
          writeln('  final ${member.dartType} ${member.fieldName};');
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

        if (shape.api.usesXml) {
          writeln('\n  factory $name.fromXml(XmlElement elem) {');
          final constructorParams = <String>[];
          for (final member in shape.members) {
            final extractor = _xmlExtractorFn(
              shape.api,
              elemName: 'elem',
              shape: member.shape,
              fieldName: member.locationName ?? member.name,
            );
            constructorParams.add('    ${member.fieldName}: $extractor,');
          }
          writeln('    return $name(${constructorParams.join('\n')});');
          writeln('  }');
        }

        writeln('\n  Map<String, dynamic> toJson() => _\$${name}ToJson(this);');
        writeln('}');
      }
    }
  }

  void putExceptions(Api api) {
    final exceptions = api.operations?.values
            ?.expand((o) => o.errors ?? <Descriptor>[])
            ?.map((d) => d.shape)
            ?.where((s) => s != null)
            ?.toSet() ??
        <String>{};

    for (final exception in exceptions) {
      writeln('\nclass $exception extends AwsException {');
      writeln('  $exception({String type, String message}) '
          ': super(type: type, code: \'$exception\', message: message);');
      writeln('}');
    }

    writeln('\nfinal _exceptionFns = <String, AwsExceptionFn>{');
    for (final exception in exceptions) {
      writeln(
          '  \'$exception\': (type, message) => $exception(type: type, message: message),');
    }
    writeln('};');
  }
}

String _xmlExtractorFn(
  Api api, {
  String elemName,
  String shape,
  String fieldName,
  bool insideMapper = false,
}) {
  final shapeRef = api.shapes[shape];
  final type = shapeRef.type;
  if (type.isBasicType()) {
    final dartType = type.getDartType();
    return 'extractXml${_uppercaseName(dartType)}Value($elemName, \'$fieldName\')';
  } else if (type == 'list') {
    final memberShape = api.shapes[shapeRef.member.shape];
    if (memberShape.type.isBasicType()) {
      return 'extractXml${_uppercaseName(memberShape.type.getDartType())}ListValues($elemName, \'${shapeRef.member.locationName}\')';
    } else {
      return '$elemName.findElements(\'${shapeRef.member.locationName}\')'
          '.map((c) => ${shapeRef.member.dartType}.fromXml(c)).toList()';
    }
  } else if (type == 'map') {
    final keyExtractor = _xmlExtractorFn(
      api,
      elemName: 'c',
      shape: shapeRef.key.shape,
      fieldName: shapeRef.key.locationName,
      insideMapper: true,
    );
    final valueExtractor = _xmlExtractorFn(
      api,
      elemName: 'c',
      shape: shapeRef.value.shape,
      fieldName: shapeRef.value.locationName,
      insideMapper: true,
    );
    return 'Map.fromEntries($elemName.findElements(\'$fieldName\')'
        '.map((c) => MapEntry($keyExtractor, $valueExtractor,),),)';
  } else if (insideMapper) {
    return '$shape.fromXml($elemName.findElements(\'$fieldName\').first)';
  } else {
    return '$shape.fromXml($elemName)';
  }
}

String _uppercaseName(String value) =>
    value.substring(0, 1).toUpperCase() + value.substring(1);
