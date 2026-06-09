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
  test('MediaTypeHeaderInputBase64', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.headers['X-Json'], 'dHJ1ZQ==');
      expect(request.url, equalsPathAndQuery('/MediaTypeHeader'));
      expect(request.method, equalsIgnoringCase('GET'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.mediaTypeHeader(
      json: jsonDecode("true"),
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('MediaTypeHeaderOutputBase64', () async {
    final client = MockClient((request) async {
      return Response('{}', 200, headers: {"X-Json": "dHJ1ZQ=="});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.mediaTypeHeader();
    expect(output.json, "true");
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');
}
