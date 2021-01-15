// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'enum.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Enum 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsJson(
              r'''{"FooEnum": "foo", "ListEnums": ["foo", "", "bar"]}'''));
      expect(request.headers['x-amz-enum'], 'baz');
      expect(request.url,
          equalsPathAndQuery('/path?Enum=bar&List=0&List=1&List='));
      return Response('{}', 200, headers: {});
    });

    final service = Enum(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName0(
      fooEnum: EnumType.foo,
      headerEnum: EnumType.baz,
      listEnums: [EnumType.foo, null, EnumType.bar],
      queryFooEnum: EnumType.bar,
      queryListEnums: [EnumType.$0, EnumType.$1, null],
    );
/*
{
  "HeaderEnum": "baz",
  "FooEnum": "foo",
  "QueryFooEnum": "bar",
  "ListEnums": [
    "foo",
    "",
    "bar"
  ],
  "QueryListEnums": [
    "0",
    "1",
    ""
  ]
}
*/
  });

  test('Enum 1', () async {
    final client = MockClient((request) async {
      expect(request.url, equalsPathAndQuery('/path'));
      return Response('{}', 200, headers: {});
    });

    final service = Enum(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName1();
/*
{}
*/
  });
}
