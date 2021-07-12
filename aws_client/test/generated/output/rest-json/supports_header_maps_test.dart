// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'supports_header_maps.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Supports header maps 0', () async {
    final client = MockClient((request) async {
      return Response(r'''{}''', 200,
          headers: {"Content-Length": "10", "X-Foo": "bar", "X-Bam": "boo"});
    });

    final service = SupportsHeaderMaps(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    final output = await service.operationName0();
    expect(output.allHeaders?['Content-Length'], "10");
    expect(output.allHeaders?['X-Foo'], "bar");
    expect(output.allHeaders?['X-Bam'], "boo");
    expect(output.prefixedHeaders?['Foo'], "bar");
    expect(output.prefixedHeaders?['Bam'], "boo");
/*
{
  "AllHeaders": {
    "Content-Length": "10",
    "X-Foo": "bar",
    "X-Bam": "boo"
  },
  "PrefixedHeaders": {
    "Foo": "bar",
    "Bam": "boo"
  }
}
*/
  }, skip: r'''Not supported (and no API actually needs this)''');
}
