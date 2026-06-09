// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../utils.dart';
import 'v2019_12_16.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('RestJsonJsonIntEnums', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "integerEnum1": 1,
    "integerEnum2": 2,
    "integerEnum3": 3,
    "integerEnumList": [
        1,
        2,
        3
    ],
    "integerEnumSet": [
        1,
        2
    ],
    "integerEnumMap": {
        "abc": 1,
        "def": 2
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonIntEnums'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonIntEnums(
      integerEnum1: 1,
      integerEnum2: 2,
      integerEnum3: 3,
      integerEnumList: [1, 2, 3],
      integerEnumMap: {
        "abc": 1,
        "def": 2,
      },
      integerEnumSet: [1, 2],
    );
  });

  test('RestJsonJsonIntEnums', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "integerEnum1": 1,
    "integerEnum2": 2,
    "integerEnum3": 3,
    "integerEnumList": [
        1,
        2,
        3
    ],
    "integerEnumSet": [
        1,
        2
    ],
    "integerEnumMap": {
        "abc": 1,
        "def": 2
    }
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonIntEnums();
    expect(output.integerEnum1, 1);
    expect(output.integerEnum2, 2);
    expect(output.integerEnum3, 3);
    expect(output.integerEnumList?[0], 1);
    expect(output.integerEnumList?[1], 2);
    expect(output.integerEnumList?[2], 3);
    expect(output.integerEnumMap?['abc'], 1);
    expect(output.integerEnumMap?['def'], 2);
    expect(output.integerEnumSet?[0], 1);
    expect(output.integerEnumSet?[1], 2);
  });
}
