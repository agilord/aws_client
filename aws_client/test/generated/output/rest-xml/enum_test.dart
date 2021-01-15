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
      return Response(
          r'''<OperationNameResponse><FooEnum>foo</FooEnum><ListEnums><member>0</member><member>1</member></ListEnums></OperationNameResponse>''',
          200,
          headers: {"x-amz-enum": "baz"});
    });

    final service = Enum(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    final output = await service.operationName0();
    expect(output.fooEnum, RESTJSONEnumType.foo);
    expect(output.headerEnum, RESTJSONEnumType.baz);
    expect(output.listEnums[0], RESTJSONEnumType.$0);
    expect(output.listEnums[1], RESTJSONEnumType.$1);
/*
{
  "HeaderEnum": "baz",
  "FooEnum": "foo",
  "ListEnums": [
    "0",
    "1"
  ]
}
*/
  });

  test('Enum 1', () async {
    final client = MockClient((request) async {
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

    await service.operationName1();
/*
{}
*/
  });
}
