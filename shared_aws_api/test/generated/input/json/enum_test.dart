// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'enum.dart';

void main() {
  test('Enum 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsJson(
              r'''{"FooEnum": "foo", "ListEnums": ["foo", "", "bar"]}'''));
      expect(pathAndQuery(request.url), '/');
      return Response('{}', 200, headers: {});
    });

    final service = Enum(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      fooEnum: EnumType.foo,
      listEnums: [EnumType.foo, null, EnumType.bar],
    );
/*
{
  "FooEnum": "foo",
  "ListEnums": [
    "foo",
    "",
    "bar"
  ]
}
*/
  });

  test('Enum 1', () async {
    final client = MockClient((request) async {
      expect(pathAndQuery(request.url), '/');
      return Response('{}', 200, headers: {});
    });

    final service = Enum(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName1();
/*
{}
*/
  });
}
