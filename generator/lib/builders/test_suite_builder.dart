import 'dart:convert';
import '../model/api.dart';
import '../model/operation.dart';
import '../model/test_model.dart';
import 'test_suite_common.dart';

String buildTestSuite(TestSuite testSuite, Api api,
    {String utilsImport = '../../../utils.dart', String? skipReason}) {
  final code = StringBuffer('''
// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '$utilsImport';
import '${api.fileBasename}.dart';

void main() {
  _s.idempotencyGeneratorOverride = () => '00000000-0000-4000-8000-000000000000';''');
  for (var i = 0; i < testSuite.cases.length; i++) {
    code.writeln("test('${testSuite.description} $i', () async {");

    final testCase = testSuite.cases[i];
    final operation = api.operations.values.elementAt(i);
    _writeTestCase(code, api, operation, testCase);

    final skip = skipReason ?? testCase.skip ?? testSuite.skip;
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
      for (var header in request.headers!.keys) {
        final headerValue = request.headers![header];
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

  final parameters = buildParameters(
      operation.input?.shapeClass, null, testCase.params,
      isRoot: true);

  final methodCall = 'await service.${operation.methodName}($parameters);';
  if (operation.output == null) {
    code.writeln(methodCall);
  } else {
    code.writeln('final output = $methodCall');
    visitExpect(
        code, 'output', operation.output!.shapeClass!, null, testCase.result);
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
