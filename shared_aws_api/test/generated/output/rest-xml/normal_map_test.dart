// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:shared_aws_api/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'normal_map.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Normal map 0', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<OperationNameResult><Map><entry><key>qux</key><value><foo>bar</foo></value></entry><entry><key>baz</key><value><foo>bam</foo></value></entry></Map></OperationNameResult>''',
          200,
          headers: {});
    });

    final service = NormalMap(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    final output = await service.operationName0();
    expect(output.map?['qux']?.foo, "bar");
    expect(output.map?['baz']?.foo, "bam");
/*
{
  "Map": {
    "qux": {
      "foo": "bar"
    },
    "baz": {
      "foo": "bam"
    }
  }
}
*/
  });
}
