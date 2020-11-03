// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'greedy_keys.dart';

void main() {
  test('Greedy keys 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r''''''));
      expect(pathAndQuery(request.url), '/my%2Fbucket/testing%20/123');
      expect(request.method, equalsIgnoringCase('GET'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = GreedyKeys(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      bucket: "my/bucket",
      key: "testing /123",
    );
/*
{
  "Key": "testing /123",
  "Bucket": "my/bucket"
}
*/
  });
}
