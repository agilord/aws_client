import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:shared_aws_api/shared.dart';
import 'package:test/test.dart';

import '../test_model.dart';
import 'rest_json_test_data.dart';

void main() {
  group('rest-json protocol', () {
    for (final s in testSuites) {
      TestSuite testSuite;
      try {
        testSuite = TestSuite.fromJson(s);
      } catch (e) {
        print('${jsonEncode(s)} has malformed JSON');
        rethrow;
      }
      for (var i = 0; i < testSuite.cases.length; i++) {
        final testCase = testSuite.cases[i];

        test('${testSuite.description} case #$i', () {
          final client = MockClient((request) async {
            expect(tryJsonDecode(request.body),
                equals(tryJsonDecode(testCase.serialized.body)));
            testCase.serialized.headers?.forEach((key, value) {
              expect(request.headers, containsPair(key, value));
            });
            expect(request.url.path, testCase.serialized.uri);

            return Response('{}', 200, headers: {});
          });

          final protocol = RestJsonProtocol(
            client: client,
            credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
            endpointUrl: 'https://test.com',
            service: 'test',
            region: 'test',
          );
          protocol.send(
              payload: testCase.params,
              method: testCase.given.http?.method ?? 'get',
              requestUri: testCase.given.http?.requestUri ?? '/',
              exceptionFnMap: null,
              headers: {
                'X-Amz-Target':
                    '${testSuite.metadata['targetPrefix'] ?? ''}.${testCase.given.name}',
                'Content-Type':
                    'application/x-amz-json-${testSuite.metadata['jsonVersion']}',
              });
        });
      }
    }
  });
}

dynamic tryJsonDecode(String value) {
  try {
    return jsonDecode(value);
  } catch (e) {
    return value;
  }
}
