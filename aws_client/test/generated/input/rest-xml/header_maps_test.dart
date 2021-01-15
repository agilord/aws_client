// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'header_maps.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Header maps 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r''''''));
      expect(request.headers['x-foo-a'], 'b');
      expect(request.headers['x-foo-c'], 'd');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = HeaderMaps(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName0(
      foo: {
        "a": "b",
        "c": "d",
      },
    );
/*
{
  "foo": {
    "a": "b",
    "c": "d"
  }
}
*/
  });
}
