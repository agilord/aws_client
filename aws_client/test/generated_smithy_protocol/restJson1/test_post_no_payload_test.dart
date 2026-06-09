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
  test('RestJsonHttpPostWithNoModeledBody', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.url, equalsPathAndQuery('/no_payload'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.testPostNoPayload();
  });

  test('RestJsonHttpWithPostHeaderMemberNoModeledBody', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.headers['X-Amz-Test-Id'], 't-12345');
      expect(request.url, equalsPathAndQuery('/no_payload'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.testPostNoPayload(
      testId: "t-12345",
    );
  });
}
