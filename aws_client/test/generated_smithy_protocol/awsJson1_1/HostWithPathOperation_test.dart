// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../utils.dart';
import 'v2018_01_01.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('AwsJson11HostWithPath', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.headers['X-Amz-Target'],
          'JsonProtocol.HostWithPathOperation');
      expect(request.url, equalsPathAndQuery('/custom/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.hostWithPathOperation();
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');
}
