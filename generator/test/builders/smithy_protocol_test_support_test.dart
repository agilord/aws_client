import 'package:aws_client_generator/builders/smithy_protocol_test_support.dart';
import 'package:test/test.dart';

void main() {
  test('loadSkipList parses id->reason map', () {
    final map = parseSkipList('{"FooTest": "known gap"}');
    expect(map['FooTest'], 'known gap');
  });

  test('parseSkipList tolerates empty object', () {
    expect(parseSkipList('{}'), isEmpty);
  });

  test('renderReadiness produces per-protocol totals', () {
    final md = renderReadiness([
      ProtocolReadiness(
          protocol: 'restJson1',
          corpusVectors: 40,
          vectors: 10,
          skipped: 3,
          excludedOps: 1),
    ]);
    expect(md, contains('restJson1'));
    expect(md, contains('40'));
    expect(md, contains('10'));
    expect(md, contains('3'));
    expect(md, contains('1'));
    expect(md, contains('7'));
  });

  test('renderReadiness accumulates a totals row across protocols', () {
    final md = renderReadiness([
      ProtocolReadiness(
          protocol: 'restJson1',
          corpusVectors: 40,
          vectors: 10,
          skipped: 3,
          excludedOps: 1),
      ProtocolReadiness(
          protocol: 'awsJson1_0',
          corpusVectors: 20,
          vectors: 5,
          skipped: 1,
          excludedOps: 2),
    ]);
    expect(
        md,
        contains(
            '| **total** | **60** | **0** | **60** | **15** | **11** | **4** | **3** |'));
  });

  test('renderReadiness reports server vectors as out-of-scope, not skipped', () {
    final md = renderReadiness([
      ProtocolReadiness(
          protocol: 'restJson1',
          corpusVectors: 40,
          vectors: 10,
          skipped: 3,
          excludedOps: 1,
          outOfScope: 6),
    ]);
    // Corpus 40, Server 6, Applicable 34, Vectors 10, Passing 7, Skipped 3.
    expect(md, contains('| restJson1 | 40 | 6 | 34 | 10 | 7 | 3 | 1 |'));
  });

  test('renderReadiness marks a whole-client build failure distinctly', () {
    final md = renderReadiness([
      ProtocolReadiness(
          protocol: 'restXml',
          corpusVectors: 182,
          vectors: 0,
          skipped: 0,
          excludedOps: 69,
          buildFailed: true),
    ]);
    expect(md, contains('69 (whole client failed to build)'));
    expect(md, contains('182'));
  });

  test('staleSkipKeys finds ids not present among emitted ids', () {
    final stale = staleSkipKeys({'A': 'r', 'B': 'r'}, {'A'});
    expect(stale, ['B']);
  });
}
