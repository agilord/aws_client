// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../utils.dart';
import 'v2019_12_16.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('HttpPrefixHeadersResponse', () async {
    final client = MockClient((request) async {
      return Response('{}', 200, headers: {"x-foo": "Foo", "hello": "Hello"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.httpPrefixHeadersInResponse();
    expect(output.prefixHeaders?['x-foo'], "Foo");
    expect(output.prefixHeaders?['hello'], "Hello");
  });
}
