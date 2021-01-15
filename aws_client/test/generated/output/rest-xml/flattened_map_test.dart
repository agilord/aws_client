// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'flattened_map.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Flattened map 0', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<OperationNameResult><Map><key>qux</key><value>bar</value></Map><Map><key>baz</key><value>bam</value></Map></OperationNameResult>''',
          200,
          headers: {});
    });

    final service = FlattenedMap(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    final output = await service.operationName0();
    expect(output.map['qux'], "bar");
    expect(output.map['baz'], "bam");
/*
{
  "Map": {
    "qux": "bar",
    "baz": "bam"
  }
}
*/
  });
}
