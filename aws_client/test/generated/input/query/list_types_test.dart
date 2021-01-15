// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'list_types.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('List types 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=OperationName&Version=2014-01-01&ListArg.member.1=foo&ListArg.member.2=bar&ListArg.member.3=baz'''));
      expect(request.url, equalsPathAndQuery('/'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = ListTypes(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName0(
      listArg: ["foo", "bar", "baz"],
    );
/*
{
  "ListArg": [
    "foo",
    "bar",
    "baz"
  ]
}
*/
  });

  test('List types 1', () async {
    final client = MockClient((request) async {
      expect(request.body,
          equalsQuery(r'''Action=OperationName&Version=2014-01-01&ListArg='''));
      expect(request.url, equalsPathAndQuery('/'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = ListTypes(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName1(
      listArg: [],
    );
/*
{
  "ListArg": []
}
*/
  });
}
