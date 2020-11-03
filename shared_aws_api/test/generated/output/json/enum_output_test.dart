// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'enum_output.dart';

void main() {
  test('Enum output 0', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{"FooEnum": "foo", "ListEnums": ["foo", "bar"]}''', 200,
          headers: {});
    });

    final service = EnumOutput(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    final output = await service.operationName0();
    expect(output.fooEnum, JSONEnumType.foo);
    expect(output.listEnums[0], "foo");
    expect(output.listEnums[1], "bar");
/*
{
  "FooEnum": "foo",
  "ListEnums": [
    "foo",
    "bar"
  ]
}
*/
  });
}
