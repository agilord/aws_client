import 'dart:math';

import 'package:aws_client.generator/builders/builder_utils.dart';
import 'package:aws_client.generator/builders/protocols/ec2_builder.dart';
import 'package:aws_client.generator/builders/protocols/json_builder.dart';
import 'package:aws_client.generator/builders/protocols/query_builder.dart';
import 'package:aws_client.generator/builders/protocols/rest_json_builder.dart';
import 'package:aws_client.generator/builders/protocols/rest_xml_builder.dart';
import 'package:aws_client.generator/builders/protocols/service_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/dart_type.dart';
import 'package:aws_client.generator/model/operation.dart';
import 'package:aws_client.generator/model/shape.dart';
import 'package:aws_client.generator/model/xml_namespace.dart';
import 'package:aws_client.generator/utils/string_utils.dart';

import '../utils/documentation_utils.dart';

String buildService(Api api,
    {String sharedLibraryPath = 'package:aws_client/src/shared'}) {
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

import '$sharedLibraryPath/shared.dart' as _s;
import '$sharedLibraryPath/shared.dart'
  show Uint8ListConverter, Uint8ListListConverter ${api.generateJson ? ', rfc822ToJson, iso8601ToJson, unixTimestampToJson, timeStampFromJson, RfcDateTimeConverter, IsoDateTimeConverter, UnixDateTimeConverter, StringJsonConverter, Base64JsonConverter' : ''};
""");
  buf.writeln(builder.imports());
  buf.writeln(
      "export '$sharedLibraryPath/shared.dart' show AwsClientCredentials;\n");

  final body = StringBuffer()
    ..putMainClass(api, builder)
    ..putShapes(api)
    ..putExceptions(api);

  if (api.requiresJsonMethods) {
    buf.writeln("part '${api.fileBasename}.g.dart';\n");
  }
  buf.writeln(body);
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
          final isRequired = member.isRequired ? 'isRequired: true,' : '';
          writeln(
              "_s.validateStringLength('$name', $name, $min, $max, $isRequired);");
        } else if (member.dartType == 'int' || member.dartType == 'double') {
          final isRequired = member.isRequired ? 'isRequired: true,' : '';
          writeln(
              "_s.validateNumRange('$name', $name, $min, $max, $isRequired);");
        }
      }

      final pattern = member.shapeClass?.pattern;

      if (pattern != null) {
        var variable = name;
        if (member.enumeration != null ||
            member.shapeClass.enumeration != null) {
          variable = '$name${member.isRequired ? '' : '?'}.toValue()';
        }
        final isRequired = member.isRequired ? 'isRequired: true,' : '';
        writeln(
            "_s.validateStringPattern('$name', $variable, r'''$pattern''', $isRequired);");
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
        final fieldName = toEnumerationFieldName(value);
        if (shape.api.generateJson) {
          writeln("  @_s.JsonValue('$value')");
        }
        writeln('  $fieldName,');
        return fieldName;
      }).toList();
      writeln('}');

      if (shape.api.generateToXml || shape.isTopLevelInputEnum) {
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
      if (shape.api.generateFromXml || shape.isTopLevelOutputEnum) {
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
      if (shape.requiresJson) {
        writeln(
            '@_s.JsonSerializable(includeIfNull: false, explicitToJson: true, '
            'createFactory: ${shape.generateFromJson},'
            'createToJson: ${shape.generateToJson})');
      }

      final extendsBlock = shape.exception ? 'implements _s.AwsException ' : '';

      writeln('class $name $extendsBlock{');
      for (final member in shape.members) {
        if (member.documentation != null) {
          writeln(dartdocComment(member.documentation));
        }

        if (shape.requiresJson) {
          if (member.dartType == 'Uint8List') {
            writeln('@Uint8ListConverter()');
          } else if (member.dartType == 'List<Uint8List>') {
            writeln('@Uint8ListListConverter()');
          } else if (member.dartType == 'DateTime' ||
              (member.shapeClass.type == 'list' &&
                  member.shapeClass.member.shapeClass.type == 'timestamp') ||
              (member.shapeClass.type == 'map' &&
                  member.shapeClass.value.shapeClass.type == 'timestamp')) {
            var prefix = 'ThisShouldNotBeAPossibleValue';
            final ret = calculateDateTimeToJson(member);

            if (ret.startsWith('rfc')) {
              prefix = 'Rfc';
            } else if (ret.startsWith('iso')) {
              prefix = 'Iso';
            } else if (ret.startsWith('unix')) {
              prefix = 'Unix';
            } else {
              throw Exception('Unknown time format "$ret"');
            }
            write('@${prefix}DateTimeConverter()');
          } else if (member.jsonvalue &&
              member.location?.contains('header') == true) {
            write('@Base64JsonConverter()');
          }
          writeln(
              "  @_s.JsonKey(name: '${member.locationName ?? member.name}')");
        }
        var dartType = member.dartType;

        if (member.jsonvalue || member.shapeClass.member?.jsonvalue == true) {
          if (member.shapeClass.type == 'list') {
            dartType = 'List<Object>';
          } else {
            dartType = 'Object';
          }
        }

        writeln('  final $dartType ${member.fieldName};');
      }

      final constructorMembers = shape.members.map((member) {
        return "${member.isRequired ? "@_s.required " : ""}this.${member.fieldName}, ";
      }).toList();

      if (constructorMembers.isEmpty) {
        write('\n  $name();');
      } else {
        write('\n  $name({${constructorMembers.join()}});');
      }

      if (shape.generateFromJson) {
        writeln(
            '\n  factory $name.fromJson(Map<String, dynamic> json) => _\$${name}FromJson(json);');
      }

      if (shape.generateFromXml && !shape.hasHeaderMembers) {
        final lintComment = !shape.hasBodyMembers
            ? '\n    // ignore: avoid_unused_constructor_parameters\n    '
            : '';
        writeln(
            '\n  factory $name.fromXml(${lintComment}_s.XmlElement elem) {');
        final constructorParams = <String>[];
        for (final member in shape.members) {
          if (!member.isBody) {
            continue;
          }
          final extractor = extractXmlCode(
            member.shapeClass,
            elemVar: 'elem',
            elemName: member.locationName ??
                member.shapeClass.locationName ??
                member.name,
            flattened: member.flattened,
            container: shape,
            member: member,
          );
          constructorParams.add('    ${member.fieldName}: $extractor,');
        }
        writeln('    return $name(${constructorParams.join('\n')});');
        writeln('  }');
      }

      if (shape.generateToJson) {
        writeln('\n  Map<String, dynamic> toJson() => _\$${name}ToJson(this);');
      }

      if (shape.generateToXml) {
        writeln(
            '\n  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {');
        writeln('    final \$children = <_s.XmlNode>[');
        for (final member
            in shape.membersMap.values.where((e) => !e.xmlAttribute)) {
          if (!member.isBody) {
            continue;
          }
          final fn = encodeXmlCode(
            member.shapeClass,
            member.fieldName,
            structureMember: member,
            maybeNull: member.isRequired,
          );
          if (!member.isRequired) {
            writeln('if (${member.fieldName} != null)');
          }
          writeln('      $fn,');
        }
        writeln('    ];');

        final membersToAttribute =
            shape.members.where((e) => e.xmlAttribute).toList();
        writeln('final \$attributes = <_s.XmlAttribute>[...?attributes,');
        if (shape.xmlNamespace != null) {
          writeln(
              "${xmlNamespaceToCode(shape.xmlNamespace, importPrefix: '_s.')},");
        }
        for (final member in membersToAttribute) {
          final nsPrefix = member.xmlNamespace?.prefix ?? '';
          final namespaceCode = nsPrefix.isNotEmpty ? ", '$nsPrefix'" : '';
          final isEnum = member.shapeClass.enumeration?.isNotEmpty ?? false;
          writeln('if (${member.fieldName} != null)');
          writeln(
              "_s.XmlAttribute(_s.XmlName('${member.locationName ?? member.name}'$namespaceCode), ${member.fieldName}${isEnum ? '.toValue()' : ''}),");
        }
        writeln('];');
        writeln(
            '    return _s.XmlElement(_s.XmlName(elemName), \$attributes, \$children.where((e) => e != null),);');
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

String calculateDateTimeToJson(Member member) {
  var timeStampFormat = 'unixTimestamp';

  if (member.timestampFormat != null) {
    timeStampFormat = member.timestampFormat;
  } else if (member.shapeClass.timestampFormat != null) {
    timeStampFormat = member.shapeClass.timestampFormat;
  } else if (member.location == 'header') {
    timeStampFormat = 'rfc822';
  } else if (member.location == 'querystring') {
    timeStampFormat = 'iso8601';
  } else {
    switch (member.api.metadata.protocol) {
      case 'json':
      case 'rest-json':
        timeStampFormat = 'unixTimestamp';
        break;
      case 'rest-xml':
      case 'query':
      case 'ec2':
        timeStampFormat = 'iso8601';
        break;
    }
  }
  return timeStampFormat;
}

String extractXmlCode(
  Shape shapeRef, {
  String elemVar,
  String elemName,
  bool flattened = false,
  Member member,
  Shape container,
}) {
  final api = shapeRef.api;
  flattened = flattened || shapeRef.flattened;
  final type = shapeRef.type;

  final enumeration = shapeRef?.enumeration?.isNotEmpty ?? false;

  if (type.isBasicType()) {
    final dartType = type.getDartType(api);
    var extraParameters = '';
    if (shapeRef.timestampFormat != null || member?.timestampFormat != null) {
      extraParameters = ', parser: _s.timeStampFromJson';
    }
    var functionSuffix = 'Value';
    if (member?.xmlAttribute == true) {
      functionSuffix = 'Attribute';
    }
    return '_s.extractXml${uppercaseName(dartType)}$functionSuffix($elemVar, \'$elemName\'$extraParameters)${enumeration ? '?.to${shapeRef.className}()' : ''}';
  } else if (type == 'list') {
    final memberShape = api.shapes[shapeRef.member.shape];
    var memberElemName = shapeRef.member.locationName;
    if (flattened || shapeRef.flattened) {
      memberElemName ??= elemName;
    } else {
      memberElemName ??= 'member';
    }

    String fn;
    if (memberShape.type.isBasicType()) {
      fn =
          '_s.extractXml${uppercaseName(memberShape.type.getDartType(api))}ListValues($elemVar, \'$memberElemName\')';
      if (memberShape.enumeration != null) {
        fn += '.map((s) => s.to${uppercaseName(memberShape.name)}()).toList()';
      }
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
    final keyExtractor = extractXmlCode(
      shapeRef.key.shapeClass,
      elemVar: 'c',
      elemName: shapeRef.key.locationName ?? 'key',
      container: container,
    );
    final valueExtractor = extractXmlCode(
      shapeRef.value.shapeClass,
      elemVar: 'c',
      elemName: shapeRef.value.locationName ?? 'value',
    );
    var getElementCode = '';
    var subElementName = elemName;
    if (!flattened) {
      getElementCode = ".getElement('$elemName')";
      subElementName = 'entry';
    }

    return 'Map.fromEntries($elemVar$getElementCode.findElements(\'$subElementName\')'
        '.map((c) => MapEntry($keyExtractor, $valueExtractor,),),)';
  } else {
    final fromXmlCode = '?.let((e)=>${shapeRef.className}.fromXml(e))';
    if (container?.payload == elemName) {
      return '$elemVar$fromXmlCode';
    } else {
      return '_s.extractXmlChild($elemVar, \'$elemName\')$fromXmlCode';
    }
  }
}

String toEnumerationFieldName(String value) {
  var fieldName = value
      .replaceAll(RegExp(r'[^0-9a-zA-Z]'), '_')
      .replaceAll(RegExp(r'_+'), '_')
      .lowercaseName;
  if (fieldName.isEnumReserved || fieldName.startsWith(RegExp(r'[0-9]'))) {
    fieldName = '\$$fieldName';
  }
  return fieldName;
}

String xmlNamespaceToCode(XmlNamespace namespace, {String importPrefix = ''}) {
  final nameCode =
      namespace.prefix != null ? "'${namespace.prefix}', 'xmlns'" : "'xmlns'";
  return "${importPrefix}XmlAttribute(${importPrefix}XmlName($nameCode), '${namespace.uri}')";
}

String extractHeaderCode(Member member, String variable) {
  if (member.shapeClass.type == 'map') {
    return '_s.extractHeaderMapValues($variable, \'${member.locationName ?? member.name}\')';
  } else if (member.shapeClass.enumeration?.isNotEmpty ?? false) {
    member.shapeClass.isTopLevelOutputEnum = true;
    return '_s.extractHeaderStringValue($variable, \'${member.locationName ?? member.name}\')?.to${uppercaseName(member.dartType)}()';
  } else if (member.jsonvalue) {
    return '_s.extractHeaderJsonValue($variable, \'${member.locationName ?? member.name}\')';
  } else {
    var extraParameters = '';
    if (member.timestampFormat != null ||
        member.shapeClass.timestampFormat != null) {
      extraParameters = ', parser: _s.timeStampFromJson';
    }
    return '_s.extractHeader${uppercaseName(member.dartType)}Value($variable, \'${member.locationName ?? member.name}\'$extraParameters)';
  }
}

extension Utils<T> on Iterable<T> {
  Iterable<E> mapIndexed<E, TYPE>(
    E Function(int index, TYPE item) f,
  ) sync* {
    var index = 0;

    for (final item in this) {
      yield f(index, item as TYPE);
      index = index + 1;
    }
  }
}
