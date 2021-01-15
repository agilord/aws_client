// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'flattened_list.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Flattened List 0', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<OperationNameResult><ListMember>abc</ListMember><ListMember>123</ListMember></OperationNameResult>''',
          200,
          headers: {});
    });

    final service = FlattenedList(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    final output = await service.operationName0();
    expect(output.listMember[0], "abc");
    expect(output.listMember[1], "123");
/*
{
  "ListMember": [
    "abc",
    "123"
  ]
}
*/
  });
}
