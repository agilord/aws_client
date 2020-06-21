import 'dart:convert';

import 'package:shared_aws_api/shared.dart';
import 'package:shared_aws_api/src/protocol/query.dart';
import 'package:test/test.dart';

import '../test_model.dart';
import 'query_test_data.dart';

void main() {
  group('query protocol', () {
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
          expect(
            canonical(flatQueryParams(
                    testCase.params,
                    testSuite.shapes[testCase.given.input.shape],
                    testSuite.shapes,
                    testSuite.metadata['apiVersion'],
                    testCase.given.name))
                .split('&'),
            unorderedEquals(testCase.serialized?.body?.split('&')),
          );
        });
      }
    }
  });
}
