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
  test('RestJsonJsonBlobs', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "data": "dmFsdWU="
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonBlobs'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonBlobs(
      data: Uint8List.fromList('value'.codeUnits),
    );
  });

  test('RestJsonJsonBlobs', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "data": "dmFsdWU="
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonBlobs();
    expect(output.data, utf8.encode('value'));
  });
}
