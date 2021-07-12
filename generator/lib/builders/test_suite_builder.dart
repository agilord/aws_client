import 'dart:convert';

import 'package:aws_client.generator/builders/library_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/descriptor.dart';
import 'package:aws_client.generator/model/operation.dart';
import 'package:aws_client.generator/model/shape.dart';
import 'package:aws_client.generator/model/test_model.dart';

String buildTestSuite(TestSuite testSuite, Api api) {
  final code = StringBuffer('''
// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import '${api.fileBasename}.dart';

void main() {
  _s.idempotencyGeneratorOverride = () => '00000000-0000-4000-8000-000000000000';''');
  for (var i = 0; i < testSuite.cases.length; i++) {
    code.writeln("test('${testSuite.description} $i', () async {");

    final testCase = testSuite.cases[i];
    final operation = api.operations.values.elementAt(i);
    _writeTestCase(code, api, operation, testCase);

    final skip = testCase.skip ?? testSuite.skip;
    code.writeln('}${skip != null ? ", skip: r'''$skip'''" : ''});');
    code.writeln('');
  }
  code.writeln('}');

  return '$code';
}

void _writeTestCase(
    StringBuffer code, Api api, Operation operation, TestCase testCase) {
  code.writeln('final client = MockClient((request) async {');

  final request = testCase.serialized;
  if (request != null) {
    if (request.body != null) {
      var equalType = 'Json';
      if (api.usesQueryProtocol) {
        equalType = 'Query';
      } else if (api.usesRestXmlProtocol) {
        equalType = 'Xml';
      }
      code.writeln(
          "  expect(request.body, equals$equalType(r'''${request.body}'''));");
    }
    if (request.headers != null) {
      for (var header in request.headers.keys) {
        final headerValue = request.headers[header];
        var expectCode = "'$headerValue'";
        if (header == 'Content-Type') {
          expectCode = "startsWith('$headerValue')";
        }

        code.writeln("  expect(request.headers['$header'], $expectCode);");
      }
    }
    code.writeln("expect(request.url, equalsPathAndQuery('${request.uri}'));");
    if (request.host != null) {
      //TODO: to support that, we need to be able to pass hostPrefix to instantiate
      // the service
      code.writeln("  //expect(request.url.host, '${request.host}');");
    }
    if (request.method != null) {
      code.writeln(
          "expect(request.method, equalsIgnoringCase('${request.method}'));");
    }
  }

  final response = testCase.response;
  final body = response?.body;
  String bodyResponse;
  if (body != null) {
    bodyResponse = "r'''$body'''";
  } else {
    if (api.usesRestXmlProtocol || api.usesQueryProtocol) {
      bodyResponse = "'<Response></Response>'";
    } else {
      bodyResponse = "'{}'";
    }
  }

  code.writeln('''
      return Response(
          $bodyResponse, ${response?.statusCode ?? 200},
          headers: ${jsonEncode(response?.headers ?? {})});
    });

    final service = ${api.metadata.className}(client: client, region: 'us-east-1', 
        credentials: AwsClientCredentials(accessKey:'', secretKey:'',),);
''');

  final parameters = _buildParameters(
      operation.input?.shapeClass, null, testCase.params,
      isRoot: true);

  final methodCall = 'await service.${operation.methodName}($parameters);';
  if (operation.output == null) {
    code.writeln(methodCall);
  } else {
    code.writeln('final output = $methodCall');
    _visitExpect(
        code, 'output', operation.output.shapeClass, null, testCase.result);
  }

  code.writeln('/*');
  final jsonEncoder = const JsonEncoder.withIndent('  ');
  if (testCase.result != null) {
    code.writeln(jsonEncoder.convert(testCase.result));
  }
  if (testCase.params != null) {
    code.writeln(jsonEncoder.convert(testCase.params));
  }
  code.writeln('*/');
}

void _visitExpect(StringBuffer code, String memberTrail, Shape shape,
    Member member, Object results) {
  if (results == null) {
    code.writeln('expect(${_removeTrailingMark(memberTrail)}, isNull);');
    return;
  }

  if (shape.type == 'list') {
    final resultList = results as List;
    for (var i = 0; i < resultList.length; i++) {
      final listResult = resultList[i];
      if (listResult != null) {
        _visitExpect(code, '$memberTrail[$i]', shape.member.shapeClass, null,
            listResult);
      }
    }
  } else if (shape.type == 'map') {
    final resultMap = results as Map;
    for (var key in resultMap.keys) {
      _visitExpect(code, "$memberTrail['$key']?", shape.value.shapeClass, null,
          resultMap[key]);
    }
  } else if (shape.type == 'structure') {
    for (var member in shape.members) {
      final result = (results as Map<String, dynamic>)[member.name];
      _visitExpect(
          code,
          '$memberTrail.${member.fieldName}${member.isRequired ? '' : '?'}',
          member.shapeClass,
          member,
          result);
    }
  } else {
    String match;
    if (shape.enumeration != null) {
      match = '${shape.className}.${toEnumerationFieldName('$results')}';
    } else if (shape.type == 'blob' && results is String) {
      match = "utf8.encode('$results')";
    } else {
      match = jsonEncode(results);
    }

    if (shape.type == 'timestamp') {
      memberTrail = memberTrail.replaceAll('?', '!');
      memberTrail += '.millisecondsSinceEpoch ~/ 1000';
    }
    code.writeln('expect(${_removeTrailingMark(memberTrail)}, $match);');
  }
}

String _buildParameters(Shape shape, Member member, Object params,
    {bool isRoot, Descriptor descriptor}) {
  isRoot ??= false;

  if (shape == null) return '';
  if (params == null) return isRoot ? '' : 'null';

  if (shape.type == 'list') {
    final resultList = params as List;
    return '[${resultList.map((e) => _buildParameters(shape.member.shapeClass, null, e, descriptor: shape.member)).where((e) => e != 'null').join(', ')}]';
  } else if (shape.type == 'map') {
    final resultMap = params as Map;
    final buffer = StringBuffer('{');
    for (var key in resultMap.keys) {
      final value = resultMap[key];
      buffer.writeln('${_buildParameters(shape.key.shapeClass, null, key)}: '
          '${_buildParameters(shape.value.shapeClass, null, value)},');
    }
    buffer.writeln('}');
    return '$buffer';
  } else if (shape.type == 'structure') {
    final buffer = StringBuffer();
    if (!isRoot) {
      buffer.writeln('${shape.className}(');
    }
    for (var member in shape.members) {
      final paramsMap = params as Map;
      if (paramsMap.containsKey(member.name)) {
        buffer.writeln(
            '${member.fieldName}: ${_buildParameters(member.shapeClass, member, paramsMap[member.name])},');
      }
    }
    if (!isRoot) {
      buffer.writeln(')');
    }
    return '$buffer';
  } else {
    if (shape.enumeration != null) {
      if (params is String && params.isEmpty) return 'null';
      return '${shape.className}.${toEnumerationFieldName('$params')}';
    } else if (shape.type == 'blob' && params is String) {
      return "Uint8List.fromList('$params'.codeUnits)";
    } else if (shape.type == 'timestamp') {
      return 'DateTime.fromMillisecondsSinceEpoch($params * 1000)';
    } else {
      final value = jsonEncode(params);
      return value;
    }
  }
}

String _removeTrailingMark(String input) {
  if (input.endsWith('?') || input.endsWith('!')) {
    return input.substring(0, input.length - 1);
  }
  return input;
}
