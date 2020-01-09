import 'dart:io';
import 'dart:math';

import 'package:aws_client.generator/builders/protocols/ec2_builder.dart';
import 'package:aws_client.generator/builders/protocols/json_builder.dart';
import 'package:aws_client.generator/builders/protocols/query_builder.dart';
import 'package:aws_client.generator/builders/protocols/rest_json_builder.dart';
import 'package:aws_client.generator/builders/protocols/rest_xml_builder.dart';
import 'package:aws_client.generator/builders/protocols/service_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/dart_type.dart';
import 'package:aws_client.generator/model/descriptor.dart';
import 'package:aws_client.generator/model/operation.dart';
import 'package:aws_client.generator/model/shape.dart';

import '../utils/documentation_utils.dart';

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

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart' show Uint8ListConverter, Uint8ListListConverter;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;
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
${dartdocComment(api.documentation)}
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

    writeln(dartdocComment(operation.documentation ?? '', indent: 2));
    var firstError = true;
    operation?.errors?.map((d) => d.shape)?.forEach((e) {
      if (firstError) {
        firstError = false;
        writeln('  ///');
      }
      writeln('  /// May throw [$e].');
    });

    for (final member in parameterShape?.members ?? <Member>[]) {
      if (member.documentation != null) {
        writeln('///\n/// Parameter [${member.fieldName}] :');
        writeln(dartdocComment(member.documentation, indent: 2));
      }
    }

    if (operation.deprecated) {
      writeln("@Deprecated('Deprecated')");
    }

    operation.output?.shapeClass?.markUsed(false);
    write('  Future<${operation.returnType}> ${operation.methodName}(');
    if (useParameter) write('{');

    for (final member in parameterShape?.members ?? <Member>[]) {
      if (member.isRequired) {
        write('@_s.required ');
      }
      write('${member.dartType} ${member.fieldName}, ');
      member.shapeClass.markUsed(true);
    }

    if (useParameter) write('}');
    writeln(') async {');
    for (final member in parameterShape?.members ?? <Member>[]) {
      final name = member.fieldName;
      if (member.isRequired) {
        writeln('    ArgumentError.checkNotNull($name, \'$name\');');
      }

      if (member.shapeClass?.max != null || member.shapeClass?.min != null) {
        final max = member.shapeClass?.max ?? pow(2, 60).toInt();
        final min = member.shapeClass?.min ?? pow(2, -60).toInt();

        if (member.dartType == 'String') {
          writeln("_s.validateStringLength('$name', $name, $min, $max,);");
        } else if (member.dartType == 'int' || member.dartType == 'double') {
          writeln("_s.validateNumRange('$name', $name, $min, $max,);");
        }
      }

      final pattern = member.shapeClass?.pattern;

      if (pattern != null) {
        writeln("_s.validateStringPattern('$name', $name, r'$pattern',);");
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

    if (shape.enumeration != null) {
      writeln(dartdocComment(shape.documentation ?? ''));
      if (shape.deprecated) {
        writeln(r"@Deprecated('Deprecated')");
      }
      writeln('enum $name {');

      final enumFieldNames =
          shape.enumeration.where((s) => s.isNotEmpty).map((value) {
        var fieldName = value
            .replaceAll(RegExp(r'[^0-9a-zA-Z]'), '_')
            .replaceAll(RegExp(r'_+'), '_')
            .lowercaseName;
        if (fieldName.isReserved || fieldName.startsWith(RegExp(r'[0-9]'))) {
          fieldName = '\$$fieldName';
        }
        if (shape.api.generateJson) {
          writeln("  @_s.JsonValue('$value')");
        }
        writeln('  $fieldName,');
        return fieldName;
      }).toList();
      writeln('}');

      if (shape.api.generateToXml) {
        writeln("""extension on $name {
  String toValue() {
    switch (this) {
    ${shape.enumeration.mapIndexed<String, String>((index, value) => ''' case $name.${enumFieldNames[index]}:
    return '$value';
    ''').join()}
    }
    throw Exception('Unknown enum value: \$this');
  }
}
        """);
      }
      if (shape.api.generateFromXml) {
        writeln("""extension on String {
  $name to$name() {
    switch (this) {
    ${shape.enumeration.mapIndexed<String, String>((index, value) => ''' case '$value':
    return $name.${enumFieldNames[index]};
    ''').join()}
    }
    throw Exception('Unknown enum value: \$this');
  }
}
        """);
      }
    } else if (shape.type == 'structure') {
      writeln(dartdocComment(shape.documentation ?? ''));
      if (shape.deprecated) {
        writeln(r'@deprecated');
      }
      if (shape.api.generateJson) {
        writeln(
            '@_s.JsonSerializable(includeIfNull: false, explicitToJson: true, '
            'createFactory: ${shape.isUsedInOutput}, createToJson: ${shape.isUsedInInput})');
      }

      final extendsBlock = shape.exception ? 'implements _s.AwsException ' : '';

      writeln('class $name $extendsBlock{');
      for (final member in shape.members) {
        if (member.documentation != null) {
          writeln(dartdocComment(member.documentation));
        }

        final shapeClass = member.shapeClass;
        final valueEnum = shapeClass.enumeration;

        if (shape.api.generateJson) {
          if (member.dartType == 'Uint8List') {
            writeln('@Uint8ListConverter()');
          } else if (member.dartType == 'List<Uint8List>') {
            writeln('@Uint8ListListConverter()');
          }
          writeln("  @_s.JsonKey(name: '${member.name}')");
        }

        writeln('  final ${member.dartType} ${member.fieldName};');
      }

      final constructorMembers = shape.members.map((member) {
        return "${member.isRequired ? "@_s.required " : ""}this.${member.fieldName}, ";
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
            '\n  factory $name.fromXml(${lintComment}_s.XmlElement elem$params) {');
        final constructorParams = <String>[];
        for (final member in shape.members) {
          if (member.isQuery || member.isUri) {
            writeln(
                '// TODO: implement ${member.location} member: ${member.locationName ?? member.name}');
            writeln('if (1 == 1) throw UnimplementedError(),');
            continue;
          }
          String extractor;
          if (member.isHeader) {
            if (member.shapeClass.type == 'map') {
              extractor =
                  '_s.extractHeaderMapValues(headers, \'${member.locationName ?? member.name}\')';
            } else if (member.shapeClass.enumeration?.isNotEmpty ?? false) {
              extractor =
                  '_s.extractHeaderStringValue(headers, \'${member.locationName ?? member.name}\')?.to${_uppercaseName(member.dartType)}()';
            } else {
              extractor =
                  '_s.extractHeader${_uppercaseName(member.dartType)}Value(headers, \'${member.locationName ?? member.name}\')';
            }
          }

          extractor ??= _xmlExtractorFn(
            shape.api,
            elemVar: 'elem',
            shape: member.shape,
            elemName: member.locationName ?? member.name,
            flattened: member.flattened,
            parent: member.shapeClass,
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
        writeln('\n  _s.XmlElement toXml(String elemName) {');
        writeln('    final \$children = <_s.XmlNode>[');
        for (final member in shape.members) {
          if (member.isQuery || member.isUri || member.isHeader) {
            writeln(
                '// TODO: implement ${member.location} member: ${member.locationName ?? member.name}');
            writeln('if (1 == 1) throw UnimplementedError(),');
            continue;
          }
          final fn = _toXmlFn(
            shape.api,
            fieldName: member.fieldName,
            elemName: member.locationName ?? member.name,
            flattened: member.flattened,
            shapeRef: member.shapeClass,
          );
          writeln('      $fn,');
        }
        writeln('    ];');
        writeln(
            '    return _s.XmlElement(_s.XmlName(elemName), [], \$children.where((e) => e != null),);');
        writeln('  }');
      }

      writeln('}');
    }
  }

  void putExceptions(Api api) {
    for (final exception in api.exceptions) {
      if (api.shapes.containsKey(exception)) continue;
      writeln('\nclass $exception extends _s.GenericAwsException {');
      writeln('  $exception({String type, String message}) '
          ': super(type: type, code: \'$exception\', message: message);');
      writeln('}');
    }

    writeln('\nfinal _exceptionFns = <String, _s.AwsExceptionFn>{');
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
  Shape parent,
}) {
  final shapeRef = api.shapes[shape];
  flattened = flattened || shapeRef.flattened;
  final type = shapeRef.type;

  final enumeration = parent?.enumeration?.isNotEmpty ?? false;

  if (type.isBasicType()) {
    final dartType = type.getDartType();
    return '_s.extractXml${_uppercaseName(dartType)}Value($elemVar, \'$elemName\')${enumeration ? '?.to${parent.className}()' : ''}';
  } else if (type == 'list') {
    final memberShape = api.shapes[shapeRef.member.shape];
    final memberElemName = shapeRef.member.locationName ?? elemName;
    String fn;
    if (memberShape.type.isBasicType()) {
      fn =
          '_s.extractXml${_uppercaseName(memberShape.type.getDartType())}ListValues($elemVar, \'$memberElemName\')';
    } else {
      fn = '$elemVar.findElements(\'$memberElemName\')'
          '.map((c) => ${shapeRef.member.dartType}.fromXml(c)).toList()';
    }
    if (!flattened) {
      fn =
          '_s.extractXmlChild($elemVar, \'$elemName\')?.let(($elemVar) => $fn)';
    }
    return fn;
  } else if (type == 'map') {
    final keyExtractor = _xmlExtractorFn(
      api,
      elemVar: 'c',
      shape: shapeRef.key.shape,
      elemName: shapeRef.key.locationName,
      parent: shapeRef,
    );
    final valueExtractor = _xmlExtractorFn(api,
        elemVar: 'c',
        shape: shapeRef.value.shape,
        elemName: shapeRef.value.locationName,
        parent: shapeRef);
    return 'Map.fromEntries($elemVar.findElements(\'$elemName\')'
        '.map((c) => MapEntry($keyExtractor, $valueExtractor,),),)';
  } else {
    return '_s.extractXmlChild($elemVar, \'$elemName\')?.let((e)=>$shape.fromXml(e))';
  }
}

String _toXmlFn(
  Api api, {
  String fieldName,
  String elemName,
  bool flattened,
  Shape shapeRef,
}) {
  flattened = flattened || shapeRef.flattened;
  final type = shapeRef.type;

  final enumeration = shapeRef?.enumeration?.isNotEmpty ?? false;

  if (type.isBasicType()) {
    final dartType = type.getDartType();
    return '_s.encodeXml${_uppercaseName(dartType)}Value(\'$elemName\', $fieldName${enumeration ? '?.toValue()' : ''})';
  } else if (type == 'list') {
    final memberShape = api.shapes[shapeRef.member.shape];
    final en = shapeRef.member.locationName ?? elemName;
    String fn;
    if (memberShape.type.isBasicType()) {
      final mdt = memberShape.type.getDartType();
      fn =
          '...$fieldName.map((v) => _s.encodeXml${_uppercaseName(mdt)}Value(\'$en\', v))';
    } else {
      fn = '...$fieldName.map((v) => v.toXml(\'$elemName\'))';
    }
    if (!flattened) {
      fn = '_s.XmlElement(_s.XmlName(\'$elemName\'), [], <_s.XmlNode>[$fn])';
    }
    return 'if ($fieldName != null) $fn';
  } else if (type == 'map') {
    // TODO: implement
    return 'if ($fieldName != null) throw UnimplementedError(\'XML map: ${shapeRef.name}\')';
  } else {
    return '$fieldName.toXml(\'$elemName\')';
  }
}

String _uppercaseName(String value) =>
    value.substring(0, 1).toUpperCase() + value.substring(1);

extension Utils<T> on Iterable<T> {
  Iterable<E> mapIndexed<E, T>(
    E Function(int index, T item) f,
  ) sync* {
    var index = 0;

    for (final item in this) {
      yield f(index, item as T);
      index = index + 1;
    }
  }
}
