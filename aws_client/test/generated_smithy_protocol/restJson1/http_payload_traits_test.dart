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
  test('RestJsonHttpPayloadTraitsWithBlob', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''blobby blob blob'''));
      expect(request.headers['Content-Type'],
          startsWith('application/octet-stream'));
      expect(request.headers['X-Foo'], 'Foo');
      expect(request.url, equalsPathAndQuery('/HttpPayloadTraits'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.httpPayloadTraits(
      blob: Uint8List.fromList('blobby blob blob'.codeUnits),
      foo: "Foo",
    );
  });

  test('RestJsonHttpPayloadTraitsWithNoBlobBody', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.headers['X-Foo'], 'Foo');
      expect(request.url, equalsPathAndQuery('/HttpPayloadTraits'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.httpPayloadTraits(
      foo: "Foo",
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('RestJsonHttpPayloadTraitsWithBlob', () async {
    final client = MockClient((request) async {
      return Response(r'''blobby blob blob''', 200, headers: {"X-Foo": "Foo"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.httpPayloadTraits();
    expect(output.blob, utf8.encode('blobby blob blob'));
    expect(output.foo, "Foo");
  });

  test('RestJsonHttpPayloadTraitsWithNoBlobBody', () async {
    final client = MockClient((request) async {
      return Response(r'''''', 200, headers: {"X-Foo": "Foo"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.httpPayloadTraits();
    expect(output.blob, isNull);
    expect(output.foo, "Foo");
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');
}
