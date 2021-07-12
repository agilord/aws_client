// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'lists.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Lists 0', () async {
    final client = MockClient((request) async {
      return Response(r'''{"ListMember": ["a", "b"]}''', 200, headers: {});
    });

    final service = Lists(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    final output = await service.operationName0();
    expect(output.listMember?[0], "a");
    expect(output.listMember?[1], "b");
    expect(output.listMemberMap, isNull);
    expect(output.listMemberStruct, isNull);
/*
{
  "ListMember": [
    "a",
    "b"
  ]
}
*/
  });

  test('Lists 1', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{"ListMember": ["a", null], "ListMemberMap": [{}, null, null, {}], "ListMemberStruct": [{}, null, null, {}]}''',
          200,
          headers: {});
    });

    final service = Lists(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    final output = await service.operationName1();
    expect(output.listMember?[0], "a");
/*
{
  "ListMember": [
    "a",
    null
  ],
  "ListMemberMap": [
    {},
    null,
    null,
    {}
  ],
  "ListMemberStruct": [
    {},
    null,
    null,
    {}
  ]
}
*/
  });
}
