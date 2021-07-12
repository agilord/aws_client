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
          equalsXml(
              r'''<InputShape><FooEnum>foo</FooEnum><ListEnums><member>foo</member><member>bar</member></ListEnums></InputShape>'''));
      expect(request.headers['x-amz-enum'], 'baz');
      expect(
          request.url, equalsPathAndQuery('/Enum/bar?ListEnums=0&ListEnums=1'));
      return Response('<Response></Response>', 200, headers: {});
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
      uRIFooEnum: EnumType.bar,
      fooEnum: EnumType.foo,
      headerEnum: EnumType.baz,
      listEnums: [EnumType.foo, EnumType.bar],
      uRIListEnums: [EnumType.$0, EnumType.$1],
    );
/*
{
  "HeaderEnum": "baz",
  "FooEnum": "foo",
  "URIFooEnum": "bar",
  "ListEnums": [
    "foo",
    "",
    "bar"
  ],
  "URIListEnums": [
    "0",
    "",
    "1"
  ]
}
*/
  });

  test('Enum 1', () async {
    final client = MockClient((request) async {
      expect(request.url, equalsPathAndQuery('/path'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = Enum(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName1(
      uRIFooEnum: EnumType.bar,
    );
/*
{
  "URIFooEnum": "bar"
}
*/
  });
}
