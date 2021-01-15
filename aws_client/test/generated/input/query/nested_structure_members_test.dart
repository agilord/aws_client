// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'nested_structure_members.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Nested structure members 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=OperationName&Version=2014-01-01&StructArg.ScalarArg=foo'''));
      expect(request.url, equalsPathAndQuery('/'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = NestedStructureMembers(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName0(
      structArg: StructType(
        scalarArg: "foo",
      ),
    );
/*
{
  "StructArg": {
    "ScalarArg": "foo"
  }
}
*/
  });
}
