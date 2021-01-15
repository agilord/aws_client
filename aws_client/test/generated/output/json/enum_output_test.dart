// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'enum_output.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Enum output 0', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{"FooEnum": "foo", "ListEnums": ["foo", "bar"]}''', 200,
          headers: {});
    });

    final service = EnumOutput(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    final output = await service.operationName0();
    expect(output.fooEnum, JSONEnumType.foo);
    expect(output.listEnums[0], JSONEnumType.foo);
    expect(output.listEnums[1], JSONEnumType.bar);
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
