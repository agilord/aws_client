// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:shared_aws_api/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'serialize_blobs_in_body.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Serialize blobs in body 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"Bar": "QmxvYiBwYXJhbQ=="}'''));
      expect(request.url, equalsPathAndQuery('/2014-01-01/foo_name'));
      return Response('{}', 200, headers: {});
    });

    final service = SerializeBlobsInBody(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName0(
      foo: "foo_name",
      bar: Uint8List.fromList('Blob param'.codeUnits),
    );
/*
{
  "Foo": "foo_name",
  "Bar": "Blob param"
}
*/
  });
}
