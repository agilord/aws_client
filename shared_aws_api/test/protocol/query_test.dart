import 'dart:convert';

import 'package:shared_aws_api/shared.dart';
import 'package:test/test.dart';

import 'package:shared_aws_api/src/protocol/query.dart';

import '../test_model.dart';
import 'query_test_data.dart';

void main() {
  group('flatQueryParams', () {
    test('run test suites', () {
      for (final s in testSuites) {
        TestSuite testSuite;
        try {
          testSuite = TestSuite.fromJson(s);
        } catch (e) {
          printOnFailure('${jsonEncode(s)} has malformed JSON');
          rethrow;
        }

        for (var i = 0; i < testSuite.cases.length; i++) {
          final testCase = testSuite.cases[i];
          expect(
              canonical(flatQueryParams(
                      testCase.params,
                      testSuite.shapes[testCase.given.input.shape],
                      testSuite.shapes,
                      testSuite.metadata['apiVersion'],
                      testCase.given.name))
                  .split('&'),
              unorderedEquals(testCase.serialized?.body?.split('&')),
              reason: '${testSuite.description} case #$i');
        }
      }
    });
  });
}
