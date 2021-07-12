// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'json_value_trait.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('JSON value trait 0', () async {
    final client = MockClient((request) async {
      return Response(r'''{"BodyField":"{\"Foo\":\"Bar\"}"}''', 200,
          headers: {"X-Amz-Foo": "eyJGb28iOiJCYXIifQ=="});
    });

    final service = JsonValueTrait(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    final output = await service.operationName0();
    expect(output.bodyField, {"Foo": "Bar"});
    expect(output.bodyListField, isNull);
    expect(output.headerField, {"Foo": "Bar"});
/*
{
  "HeaderField": {
    "Foo": "Bar"
  },
  "BodyField": {
    "Foo": "Bar"
  }
}
*/
  });

  test('JSON value trait 1', () async {
    final client = MockClient((request) async {
      return Response(r'''{"BodyListField":["{\"Foo\":\"Bar\"}"]}''', 200,
          headers: {});
    });

    final service = JsonValueTrait(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    final output = await service.operationName1();
    expect(output.bodyField, isNull);
    expect(output.bodyListField?[0], {"Foo": "Bar"});
    expect(output.headerField, isNull);
/*
{
  "BodyListField": [
    {
      "Foo": "Bar"
    }
  ]
}
*/
  });
}
