// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'base64_encoded_blobs.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Base64 encoded Blobs 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"BlobArg": "Zm9v"}'''));
      expect(
          request.headers['X-Amz-Target'], 'com.amazonaws.foo.OperationName');
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.url, equalsPathAndQuery('/'));
      return Response('{}', 200, headers: {});
    });

    final service = Base64EncodedBlobs(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName0(
      blobArg: Uint8List.fromList('foo'.codeUnits),
    );
/*
{
  "BlobArg": "foo"
}
*/
  });

  test('Base64 encoded Blobs 1', () async {
    final client = MockClient((request) async {
      expect(request.body,
          equalsJson(r'''{"BlobMap": {"key1": "Zm9v", "key2": "YmFy"}}'''));
      expect(
          request.headers['X-Amz-Target'], 'com.amazonaws.foo.OperationName');
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.url, equalsPathAndQuery('/'));
      return Response('{}', 200, headers: {});
    });

    final service = Base64EncodedBlobs(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName1(
      blobMap: {
        "key1": Uint8List.fromList('foo'.codeUnits),
        "key2": Uint8List.fromList('bar'.codeUnits),
      },
    );
/*
{
  "BlobMap": {
    "key1": "foo",
    "key2": "bar"
  }
}
*/
  });
}
