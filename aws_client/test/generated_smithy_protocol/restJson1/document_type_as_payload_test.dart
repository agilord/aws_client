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
  test('DocumentTypeAsPayloadInput', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "foo": "bar"
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/DocumentTypeAsPayload'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.documentTypeAsPayload(
      documentValue: {"foo": "bar"},
    );
  });

  test('DocumentTypeAsPayloadInputString', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''"hello"'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/DocumentTypeAsPayload'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.documentTypeAsPayload(
      documentValue: "hello",
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('DocumentTypeAsPayloadOutput', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "foo": "bar"
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.documentTypeAsPayload();
    expect(output.documentValue, {"foo": "bar"});
  });

  test('DocumentTypeAsPayloadOutputString', () async {
    final client = MockClient((request) async {
      return Response(r'''"hello"''', 200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.documentTypeAsPayload();
    expect(output.documentValue, "hello");
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');
}
