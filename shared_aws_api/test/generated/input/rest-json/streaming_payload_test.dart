// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'streaming_payload.dart';

void main() {
  test('Streaming payload 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''contents'''));
      expect(request.headers['x-amz-sha256-tree-hash'], 'foo');
      expect(pathAndQuery(request.url), '/2014-01-01/vaults/name/archives');
      return Response('{}', 200, headers: {});
    });

    final service = StreamingPayload(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      vaultName: "name",
      body: Uint8List.fromList('contents'.codeUnits),
      checksum: "foo",
    );
/*
{
  "vaultName": "name",
  "checksum": "foo",
  "body": "contents"
}
*/
  });
}
