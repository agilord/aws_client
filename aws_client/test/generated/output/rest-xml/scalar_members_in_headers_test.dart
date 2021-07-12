// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'scalar_members_in_headers.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Scalar members in headers 0', () async {
    final client = MockClient((request) async {
      return Response(r'''''', 200,
          headers: {
            "x-str": "string",
            "x-int": "1",
            "x-true-bool": "true",
            "x-false-bool": "false",
            "x-float": "1.5",
            "x-double": "1.5",
            "x-long": "100",
            "x-char": "a",
            "x-timestamp": "Sun, 25 Jan 2015 08:00:00 GMT"
          });
    });

    final service = ScalarMembersInHeaders(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    final output = await service.operationName0();
    expect(output.char, "a");
    expect(output.doubleValue, 1.5);
    expect(output.falseBool, false);
    expect(output.float, 1.5);
    expect(output.integer, 1);
    expect(output.long, 100);
    expect(output.str, "string");
    expect(output.timestamp!.millisecondsSinceEpoch ~/ 1000, 1422172800);
    expect(output.trueBool, true);
/*
{
  "Str": "string",
  "Integer": 1,
  "TrueBool": true,
  "FalseBool": false,
  "Float": 1.5,
  "Double": 1.5,
  "Long": 100,
  "Char": "a",
  "Timestamp": 1422172800
}
*/
  });
}
