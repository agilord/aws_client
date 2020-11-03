// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'json_payload.dart';

void main() {
  test('JSON payload 0', () async {
    final client = MockClient((request) async {
      return Response(r'''{"Foo": "abc"}''', 200, headers: {"X-Foo": "baz"});
    });

    final service = JSONPayload(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    final output = await service.operationName0();
    expect(output.data.foo, "abc");
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
