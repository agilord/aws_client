// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'list_of_structures.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('List of structures 0', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<OperationNameResponse xmlns="https://service.amazonaws.com/doc/2010-05-08/"><OperationNameResult><List><member><Foo>firstfoo</Foo><Bar>firstbar</Bar><Baz>firstbaz</Baz></member><member><Foo>secondfoo</Foo><Bar>secondbar</Bar><Baz>secondbaz</Baz></member></List></OperationNameResult><ResponseMetadata><RequestId>requestid</RequestId></ResponseMetadata></OperationNameResponse>''',
          200,
          headers: {});
    });

    final service = ListOfStructures(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    final output = await service.operationName0();
    expect(output.list?[0].bar, "firstbar");
    expect(output.list?[0].baz, "firstbaz");
    expect(output.list?[0].foo, "firstfoo");
    expect(output.list?[1].bar, "secondbar");
    expect(output.list?[1].baz, "secondbaz");
    expect(output.list?[1].foo, "secondfoo");
/*
{
  "List": [
    {
      "Foo": "firstfoo",
      "Bar": "firstbar",
      "Baz": "firstbaz"
    },
    {
      "Foo": "secondfoo",
      "Bar": "secondbar",
      "Baz": "secondbaz"
    }
  ]
}
*/
  });
}
