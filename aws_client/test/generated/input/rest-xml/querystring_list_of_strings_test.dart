// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'querystring_list_of_strings.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Querystring list of strings 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r''''''));
      expect(request.url, equalsPathAndQuery('/path?item=value1&item=value2'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = QuerystringListOfStrings(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName0(
      items: ["value1", "value2"],
    );
/*
{
  "Items": [
    "value1",
    "value2"
  ]
}
*/
  });
}
