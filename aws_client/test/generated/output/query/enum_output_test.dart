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
          r'''<OperationNameResponse><FooEnum>foo</FooEnum><ListEnums><member>foo</member><member>bar</member></ListEnums></OperationNameResponse>''',
          200,
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
    expect(output.fooEnum, EC2EnumType.foo);
    expect(output.listEnums[0], EC2EnumType.foo);
    expect(output.listEnums[1], EC2EnumType.bar);
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
