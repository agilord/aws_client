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

String buildService(Api api) {
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
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart' as _meta;

import 'package:aws_client/shared.dart' as shared;
import 'package:aws_client/shared.dart' show Uint8ListConverter, Uint8ListListConverter;
""");
  buf.writeln(builder.imports());
  if (api.generateJson) {
    buf.writeln("part '${api.fileBasename}.g.dart';\n");
  }
  buf
    ..putMainClass(api, builder)
    ..putShapes(api)
    ..putExceptions(api);

  return buf.toString();
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

    if (operation.deprecated) {
      writeln("@Deprecated('Deprecated')");
    }

    operation?.errors?.map((d) => d.shape)?.forEach((e) {
      writeln('  /// May throw [$e].');
    });

    operation.output?.shapeClass?.markUsed(false);
    write('  Future<${operation.returnType}> ${operation.methodName}(');
    if (useParameter) write('{');

    for (final member in parameterShape?.members ?? <Member>[]) {
      if (member.isRequired) {
        write('@_meta.required ');
      }
      write('${member.dartType} ${member.fieldName}, ');
      member.shapeClass.markUsed(true);
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
      api.shapes.keys.forEach((key) => putShape(api.shapes[key]));

  void putShape(Shape shape) {
    final name = shape.className;
    // There is no reason to generate something not used
    if (!shape.isUsedInInput && !shape.isUsedInOutput) return;
    // Flattened shapes are typically not used.
    if (shape.flattened) return;

    if (shape.type == 'string' && shape.enumeration != null) {
      if (shape.deprecated) {
        writeln(r"@Deprecated('Deprecated')");
      }
      writeln('abstract class $name {');
      shape.enumeration.forEach((value) {
        var fieldName = value
            .replaceAll(RegExp(r'[^0-9a-zA-Z]'), '_')
            .replaceAll(RegExp(r'_+'), '_')
            .lowercaseName;
        if (fieldName.isEmpty) return;
        if (fieldName.isReserved || fieldName.startsWith(RegExp(r'[0-9]'))) {
          fieldName = '\$$fieldName';
        }
        writeln("  static const $fieldName = \'$value\';");
      });
      writeln('}');
    } else if (shape.type == 'structure') {
      if (shape.deprecated) {
        writeln(r'@deprecated');
      }
      if (shape.api.generateJson) {
        writeln('@JsonSerializable(includeIfNull: false, explicitToJson: true, '
            'createFactory: ${shape.isUsedInOutput}, createToJson: ${shape.isUsedInInput})');
      }

      final extendsBlock =
          shape.exception ? 'implements shared.AwsException ' : '';

      writeln('class $name $extendsBlock{');
      for (final member in shape.members) {
        final valueEnum = shape.api.shapes[member.shape].enumeration;

        if (valueEnum?.isNotEmpty ?? false) {
          writeln("/// Possible values: [${valueEnum.join(", ")}]");
        }

        if (shape.api.generateJson) {
          if (member.dartType == 'Uint8List') {
            writeln('@Uint8ListConverter()');
          } else if (member.dartType == 'List<Uint8List>') {
            writeln('@Uint8ListListConverter()');
          }
          writeln("  @JsonKey(name: '${member.name}')");
        }

        writeln('  final ${member.dartType} ${member.fieldName};');
      }

      final constructorMembers = shape.members.map((member) {
        return "${member.isRequired ? "@_meta.required " : ""}this.${member.fieldName}, ";
      }).toList();

      if (constructorMembers.isEmpty) {
        write('\n  $name();');
      } else {
        write('\n  $name({${constructorMembers.join()}});');
      }

      if (shape.api.generateFromJson && shape.isUsedInOutput) {
        writeln(
            '\n  factory $name.fromJson(Map<String, dynamic> json) => _\$${name}FromJson(json);');
      }

      if (shape.api.generateFromXml && shape.isUsedInOutput) {
        final lintComment = shape.hasNoBodyMembers
            ? '\n    // ignore: avoid_unused_constructor_parameters\n    '
            : '';
        var params = '';
        if (shape.hasHeaderMembers) {
          params += 'Map<String, String> headers,';
        }
        if (params.isNotEmpty) {
          params = ', {$params}';
        }
        writeln(
            '\n  factory $name.fromXml(${lintComment}XmlElement elem$params) {');
        final constructorParams = <String>[];
        for (final member in shape.members) {
          if (member.isQuery || member.isUri) {
            writeln(
                '// TODO: implement ${member.location} member: ${member.locationName ?? member.name}');
            writeln('if (1 == 1) throw UnimplementedError();');
            continue;
          }
          String extractor;
          if (member.isHeader) {
            if (member.shapeClass.type == 'map') {
              extractor =
                  'shared.extractHeaderMapValues(headers, \'${member.locationName ?? member.name}\')';
            } else {
              extractor =
                  'shared.extractHeader${_uppercaseName(member.dartType)}Value(headers, \'${member.locationName ?? member.name}\')';
            }
          }

          extractor ??= _xmlExtractorFn(
            shape.api,
            elemVar: 'elem',
            shape: member.shape,
            elemName: member.locationName ?? member.name,
            flattened: member.flattened,
          );
          constructorParams.add('    ${member.fieldName}: $extractor,');
        }
        writeln('    return $name(${constructorParams.join('\n')});');
        writeln('  }');
      }

      if (shape.api.generateToJson && shape.isUsedInInput) {
        writeln('\n  Map<String, dynamic> toJson() => _\$${name}ToJson(this);');
      }

      if (shape.api.generateToXml && shape.isUsedInInput) {
        writeln('\n  XmlElement toXml(String elemName) {');
        writeln('    final \$children = <XmlNode>[');
        for (final member in shape.members) {
          if (member.isQuery || member.isUri || member.isHeader) {
            writeln(
                '// TODO: implement ${member.location} member: ${member.locationName ?? member.name}');
            writeln('if (1 == 1) throw UnimplementedError();');
            continue;
          }
          final fn = _toXmlFn(
            shape.api,
            shape: member.shape,
            fieldName: member.fieldName,
            elemName: member.locationName ?? member.name,
            flattened: member.flattened,
          );
          writeln('      $fn,');
        }
        writeln('    ];');
        writeln(
            '    return XmlElement(XmlName(elemName), [], \$children.where((e) => e != null),);');
        writeln('  }');
      }

      writeln('}');
    }
  }

  void putExceptions(Api api) {
    for (final exception in api.exceptions) {
      if (api.shapes.containsKey(exception)) continue;
      writeln('\nclass $exception extends shared.GenericAwsException {');
      writeln('  $exception({String type, String message}) '
          ': super(type: type, code: \'$exception\', message: message);');
      writeln('}');
    }

    writeln('\nfinal _exceptionFns = <String, shared.AwsExceptionFn>{');
    for (final exception in api.exceptions) {
      final shape = api.shapes[exception];
      final hasMessage = shape != null &&
          shape.members
              .any((m) => m.fieldName == 'message' && m.dartType == 'String');

      if (shape == null) {
        writeln(
            '  \'$exception\': (type, message) => $exception(type: type, message: message),');
      } else if (hasMessage) {
        writeln(
            '  \'$exception\': (type, message) => $exception(message: message),');
      } else {
        writeln('  \'$exception\': (type, message) => $exception(),');
      }
    }
    writeln('};');
  }
}

String _xmlExtractorFn(
  Api api, {
  String elemVar,
  String shape,
  String elemName,
  bool flattened = false,
}) {
  final shapeRef = api.shapes[shape];
  flattened = flattened || shapeRef.flattened;
  final type = shapeRef.type;
  if (type.isBasicType()) {
    final dartType = type.getDartType();
    return 'shared.extractXml${_uppercaseName(dartType)}Value($elemVar, \'$elemName\')';
  } else if (type == 'list') {
    final memberShape = api.shapes[shapeRef.member.shape];
    final memberElemName = shapeRef.member.locationName ?? elemName;
    String fn;
    if (memberShape.type.isBasicType()) {
      fn =
          'shared.extractXml${_uppercaseName(memberShape.type.getDartType())}ListValues($elemVar, \'$memberElemName\')';
    } else {
      fn = '$elemVar.findElements(\'$memberElemName\')'
          '.map((c) => ${shapeRef.member.dartType}.fromXml(c)).toList()';
    }
    if (!flattened) {
      fn =
          'shared.extractXmlChild($elemVar, \'$elemName\')?.let(($elemVar) => $fn)';
    }
    return fn;
  } else if (type == 'map') {
    final keyExtractor = _xmlExtractorFn(
      api,
      elemVar: 'c',
      shape: shapeRef.key.shape,
      elemName: shapeRef.key.locationName,
    );
    final valueExtractor = _xmlExtractorFn(
      api,
      elemVar: 'c',
      shape: shapeRef.value.shape,
      elemName: shapeRef.value.locationName,
    );
    return 'Map.fromEntries($elemVar.findElements(\'$elemName\')'
        '.map((c) => MapEntry($keyExtractor, $valueExtractor,),),)';
  } else {
    return 'shared.extractXmlChild($elemVar, \'$elemName\')?.let((e)=>$shape.fromXml(e))';
  }
}

String _toXmlFn(
  Api api, {
  String shape,
  String fieldName,
  String elemName,
  bool flattened,
}) {
  final shapeRef = api.shapes[shape];
  flattened = flattened || shapeRef.flattened;
  final type = shapeRef.type;
  if (type.isBasicType()) {
    final dartType = type.getDartType();
    return 'shared.encodeXml${_uppercaseName(dartType)}Value(\'$elemName\', $fieldName)';
  } else if (type == 'list') {
    final memberShape = api.shapes[shapeRef.member.shape];
    final en = shapeRef.member.locationName ?? elemName;
    String fn;
    if (memberShape.type.isBasicType()) {
      final mdt = memberShape.type.getDartType();
      fn =
          '...$fieldName.map((v) => shared.encodeXml${_uppercaseName(mdt)}Value(\'$en\', v))';
    } else {
      fn = '...$fieldName.map((v) => v.toXml(\'$elemName\'))';
    }
    if (!flattened) {
      fn = 'XmlElement(XmlName(\'$elemName\'), [], <XmlNode>[$fn])';
    }
    return 'if ($fieldName != null) $fn';
  } else if (type == 'map') {
    // TODO: implement
    return 'if (true == true) throw UnimplementedError(\'XML map: $shape\')';
  } else {
    return '$fieldName.toXml(\'$elemName\')';
  }
}

String _uppercaseName(String value) =>
    value.substring(0, 1).toUpperCase() + value.substring(1);
