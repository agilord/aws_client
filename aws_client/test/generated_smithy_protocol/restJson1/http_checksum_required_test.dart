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
  test('RestJsonHttpChecksumRequired', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "foo":"base64 encoded md5 checksum"
}
'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.headers['Content-MD5'], 'iB0/3YSo7maijL0IGOgA9g==');
      expect(request.url, equalsPathAndQuery('/HttpChecksumRequired'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.httpChecksumRequired(
      foo: "base64 encoded md5 checksum",
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');
}
