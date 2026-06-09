// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../utils.dart';
import 'v2018_01_01.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('AwsJson11IntEnums', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "intEnum1": 1,
    "intEnum2": 2,
    "intEnum3": 3,
    "intEnumList": [
        1,
        2
    ],
    "intEnumSet": [
        1,
        2
    ],
    "intEnumMap": {
        "a": 1,
        "b": 2
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.headers['X-Amz-Target'], 'JsonProtocol.JsonIntEnums');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonIntEnums(
      intEnum1: 1,
      intEnum2: 2,
      intEnum3: 3,
      intEnumList: [1, 2],
      intEnumMap: {
        "a": 1,
        "b": 2,
      },
      intEnumSet: [1, 2],
    );
  });

  test('AwsJson11IntEnums', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "intEnum1": 1,
    "intEnum2": 2,
    "intEnum3": 3,
    "intEnumList": [
        1,
        2
    ],
    "intEnumSet": [
        1,
        2
    ],
    "intEnumMap": {
        "a": 1,
        "b": 2
    }
}''',
          200,
          headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "JsonProtocol.JsonIntEnums"
          });
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonIntEnums();
    expect(output.intEnum1, 1);
    expect(output.intEnum2, 2);
    expect(output.intEnum3, 3);
    expect(output.intEnumList?[0], 1);
    expect(output.intEnumList?[1], 2);
    expect(output.intEnumMap?['a'], 1);
    expect(output.intEnumMap?['b'], 2);
    expect(output.intEnumSet?[0], 1);
    expect(output.intEnumSet?[1], 2);
  });
}
