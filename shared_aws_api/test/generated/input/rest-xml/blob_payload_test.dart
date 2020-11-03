// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'blob_payload.dart';

void main() {
  test('Blob payload 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''bar'''));
      expect(pathAndQuery(request.url), '/');
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = BlobPayload(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      foo: Uint8List.fromList('bar'.codeUnits),
    );
/*
{
  "foo": "bar"
}
*/
  });

  test('Blob payload 1', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r''''''));
      expect(pathAndQuery(request.url), '/');
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = BlobPayload(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName1();
/*
{}
*/
  });
}
