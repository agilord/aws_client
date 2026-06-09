import 'dart:convert';
import '../model/api.dart';
import '../model/operation.dart';
import 'test_suite_common.dart';

// Scalars go into single-quoted literals, bodies into r'''...''' — assumes the
// corpus has no `'` in scalars nor `'''` in bodies (violation = invalid Dart).
String buildSmithyProtocolTestSuite(
  Api api,
  Operation operation,
  List<Map<String, dynamic>> requestTests,
  List<Map<String, dynamic>> responseTests, {
  String utilsImport = '../../utils.dart',
  Map<String, String> skipReasons = const {},
}) {
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

  for (final test in requestTests) {
    _writeRequestTest(code, api, operation, test, skipReasons);
  }
  for (final test in responseTests) {
    _writeResponseTest(code, api, operation, test, skipReasons);
  }

  code.writeln('}');
  return '$code';
}

String _emptyBody(Api api) {
  if (api.usesRestXmlProtocol || api.usesQueryProtocol) {
    return "'<Response></Response>'";
  }
  return "'{}'";
}

String _bodyEquality(String? bodyMediaType) {
  switch (bodyMediaType) {
    case 'application/xml':
      return 'equalsXml';
    case 'application/x-www-form-urlencoded':
      return 'equalsQuery';
    case 'application/json':
      return 'equalsJson';
    default:
      return 'equalsJson';
  }
}

String _skipSuffix(String id, Map<String, String> skipReasons) {
  final reason = skipReasons[id];
  return reason != null ? ", skip: r'''$reason'''" : '';
}

String _dartString(Object? v) {
  final s = '$v'
      .replaceAll(r'\', r'\\')
      .replaceAll("'", r"\'")
      .replaceAll(r'$', r'\$');
  return "'$s'";
}

void _writeRequestTest(StringBuffer code, Api api, Operation operation,
    Map<String, dynamic> test, Map<String, String> skipReasons) {
  final id = test['id'] as String;
  code.writeln("test('$id', () async {");
  code.writeln('final client = MockClient((request) async {');

  final body = test['body'] as String?;
  if (body != null) {
    final eq = _bodyEquality(test['bodyMediaType'] as String?);
    code.writeln("  expect(request.body, $eq(r'''$body'''));");
  }

  final headers = (test['headers'] as Map?)?.cast<String, dynamic>();
  if (headers != null) {
    for (final h in headers.keys) {
      final value = _dartString(headers[h]);
      final expectCode =
          h == 'Content-Type' ? 'startsWith($value)' : value;
      code.writeln("  expect(request.headers['$h'], $expectCode);");
    }
  }

  final uri = test['uri'] as String? ?? '/';
  final queryParams =
      (test['queryParams'] as List?)?.cast<String>() ?? const <String>[];
  final fullUri = queryParams.isEmpty ? uri : '$uri?${queryParams.join('&')}';
  code.writeln("  expect(request.url, equalsPathAndQuery('$fullUri'));");

  final method = test['method'] as String?;
  if (method != null) {
    code.writeln("  expect(request.method, equalsIgnoringCase('$method'));");
  }

  code.writeln('''
  return Response(${_emptyBody(api)}, 200);
});

final service = ${api.metadata.className}(client: client, region: 'us-east-1',
    credentials: AwsClientCredentials(accessKey: '', secretKey: ''),);
''');

  final params = test['params'] as Map<String, dynamic>?;
  final args =
      buildParameters(operation.input?.shapeClass, null, params, isRoot: true);
  code.writeln('await service.${operation.methodName}($args);');
  code.writeln('}${_skipSuffix(id, skipReasons)});');
  code.writeln('');
}

void _writeResponseTest(StringBuffer code, Api api, Operation operation,
    Map<String, dynamic> test, Map<String, String> skipReasons) {
  final id = test['id'] as String;
  code.writeln("test('$id', () async {");
  code.writeln('final client = MockClient((request) async {');

  final body = test['body'] as String?;
  final bodyResponse = body != null ? "r'''$body'''" : _emptyBody(api);
  final headers = (test['headers'] as Map?)?.cast<String, String>() ?? {};
  final codeStatus = test['code'] as int? ?? 200;
  code.writeln('''
  return Response($bodyResponse, $codeStatus,
      headers: ${jsonEncode(headers)});
});

final service = ${api.metadata.className}(client: client, region: 'us-east-1',
    credentials: AwsClientCredentials(accessKey: '', secretKey: ''),);
''');

  final params = test['params'] as Map<String, dynamic>?;
  if (!operation.hasReturnType) {
    code.writeln('await service.${operation.methodName}();');
  } else {
    final expectations = StringBuffer();
    visitExpect(
        expectations, 'output', operation.output!.shapeClass!, null, params);
    if (expectations.isEmpty) {
      code.writeln('await service.${operation.methodName}();');
    } else {
      code.writeln('final output = await service.${operation.methodName}();');
      code.write(expectations);
    }
  }
  code.writeln('}${_skipSuffix(id, skipReasons)});');
  code.writeln('');
}
