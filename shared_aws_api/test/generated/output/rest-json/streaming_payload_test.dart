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
      return Response(r'''abc''', 200, headers: {});
    });

    final service = StreamingPayload(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    final output = await service.operationName0();
    expect(output.stream, utf8.encode('abc'));
/*
{
  "Stream": "abc"
}
*/
  });
}
