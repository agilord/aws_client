// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'structure_payload.dart';

void main() {
  test('Structure payload 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<foo><baz>bar</baz></foo>'''));
      expect(pathAndQuery(request.url), '/');
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = StructurePayload(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      foo: FooShape(
        baz: "bar",
      ),
    );
/*
{
  "foo": {
    "baz": "bar"
  }
}
*/
  });

  test('Structure payload 1', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r''''''));
      expect(pathAndQuery(request.url), '/');
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = StructurePayload(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName1();
/*
{}
*/
  });

  test('Structure payload 2', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<foo />'''));
      expect(pathAndQuery(request.url), '/');
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = StructurePayload(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName2(
      foo: FooShape(),
    );
/*
{
  "foo": {}
}
*/
  });

  test('Structure payload 3', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r''''''));
      expect(pathAndQuery(request.url), '/');
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = StructurePayload(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName3(
      foo: null,
    );
/*
{
  "foo": null
}
*/
  });
}
