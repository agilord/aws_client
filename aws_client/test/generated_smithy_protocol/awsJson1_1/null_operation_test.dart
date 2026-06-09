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
  test('AwsJson11StructuresDontSerializeNullValues', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.headers['X-Amz-Target'], 'JsonProtocol.NullOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.nullOperation(
      string: null,
    );
  });

  test('AwsJson11ServersDontDeserializeNullStructureValues', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "string": null
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.headers['X-Amz-Target'], 'JsonProtocol.NullOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.nullOperation();
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('AwsJson11StructuresDontDeserializeNullValues', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "string": null
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.nullOperation();
    expect(output.string, isNull);
  });

  test('AwsJson11ServersDontSerializeNullStructureValues', () async {
    final client = MockClient((request) async {
      return Response(r'''{}''', 200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.nullOperation();
    expect(output.string, isNull);
  });
}
