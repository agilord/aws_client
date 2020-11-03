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
          equalsXml(
              r'''<InputShape><FooEnum>foo</FooEnum><ListEnums><member>foo</member><member></member><member>bar</member></ListEnums></InputShape>'''));
      expect(request.headers['x-amz-enum'], 'baz');
      expect(pathAndQuery(request.url),
          '/Enum/bar?ListEnums=0&ListEnums=&ListEnums=1');
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = Enum(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      fooEnum: EnumType.foo,
      headerEnum: EnumType.baz,
      listEnums: ["foo", "", "bar"],
      uRIFooEnum: EnumType.bar,
      uRIListEnums: ["0", "", "1"],
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
      expect(pathAndQuery(request.url), '/path');
      return Response('<Response></Response>', 200, headers: {});
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
