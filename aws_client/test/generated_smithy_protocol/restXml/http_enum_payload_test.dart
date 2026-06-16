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
  test('RestXmlEnumPayloadRequest', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''enumvalue'''));
      expect(request.headers['Content-Type'], startsWith('text/plain'));
      expect(request.url, equalsPathAndQuery('/EnumPayload'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.httpEnumPayload(
      payload: StringEnum.enumvalue,
    );
  });

  test('RestXmlEnumPayloadResponse', () async {
    final client = MockClient((request) async {
      return Response(r'''enumvalue''', 200,
          headers: {"Content-Type": "text/plain"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.httpEnumPayload();
    expect(output.payload, StringEnum.enumvalue);
  });
}
