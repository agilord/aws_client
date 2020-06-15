import 'package:shared_aws_api/shared.dart';
import 'package:test/test.dart';

import 'package:shared_aws_api/src/protocol/query.dart';

import '../test_model.dart';
import 'query_test_data.dart';

void main() {
  group('flatQueryParams', () {
    test('run test suites', () {
      for (final s in testSuites) {
        final testSuite = TestSuite.fromJson(s);

        for (var i = 0; i < testSuite.cases.length; i++) {
          final testCase = testSuite.cases[i];
          expect(
              canonical(flatQueryParams(
                {
                  ...testCase.params,
                  'Action': testCase.given.name,
                  'Version': testSuite.metadata['apiVersion']
                },
                testSuite.shapes[testCase.given.input.shape],
              )).split('&'),
              unorderedEquals(testCase.serialized?.body?.split('&')),
              reason: '${testSuite.description} #$i');
        }
      }
    });
  });
}
