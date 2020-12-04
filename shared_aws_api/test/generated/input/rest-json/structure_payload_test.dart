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
      expect(request.body, equalsJson(r'''{"baz": "bar"}'''));
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200, headers: {});
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
      expect(request.body, equalsJson(r''''''));
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200, headers: {});
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
}
