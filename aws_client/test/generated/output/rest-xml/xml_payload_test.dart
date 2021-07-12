// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'xml_payload.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('XML payload 0', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<OperationNameResponse><Foo>abc</Foo></OperationNameResponse>''',
          200,
          headers: {"X-Foo": "baz"});
    });

    final service = XmlPayload(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    final output = await service.operationName0();
    expect(output.data?.foo, "abc");
    expect(output.header, "baz");
/*
{
  "Header": "baz",
  "Data": {
    "Foo": "abc"
  }
}
*/
  });
}
