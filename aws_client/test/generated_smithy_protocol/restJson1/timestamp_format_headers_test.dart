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
  test('RestJsonTimestampFormatHeaders', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.headers['X-memberEpochSeconds'], '1576540098');
      expect(
          request.headers['X-memberHttpDate'], 'Mon, 16 Dec 2019 23:48:18 GMT');
      expect(request.headers['X-memberDateTime'], '2019-12-16T23:48:18Z');
      expect(
          request.headers['X-defaultFormat'], 'Mon, 16 Dec 2019 23:48:18 GMT');
      expect(request.headers['X-targetEpochSeconds'], '1576540098');
      expect(
          request.headers['X-targetHttpDate'], 'Mon, 16 Dec 2019 23:48:18 GMT');
      expect(request.headers['X-targetDateTime'], '2019-12-16T23:48:18Z');
      expect(request.url, equalsPathAndQuery('/TimestampFormatHeaders'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.timestampFormatHeaders(
      defaultFormat: DateTime.fromMillisecondsSinceEpoch(1576540098 * 1000),
      memberDateTime: DateTime.fromMillisecondsSinceEpoch(1576540098 * 1000),
      memberEpochSeconds:
          DateTime.fromMillisecondsSinceEpoch(1576540098 * 1000),
      memberHttpDate: DateTime.fromMillisecondsSinceEpoch(1576540098 * 1000),
      targetDateTime: DateTime.fromMillisecondsSinceEpoch(1576540098 * 1000),
      targetEpochSeconds:
          DateTime.fromMillisecondsSinceEpoch(1576540098 * 1000),
      targetHttpDate: DateTime.fromMillisecondsSinceEpoch(1576540098 * 1000),
    );
  });

  test('RestJsonTimestampFormatHeaders', () async {
    final client = MockClient((request) async {
      return Response('{}', 200, headers: {
        "X-memberEpochSeconds": "1576540098",
        "X-memberHttpDate": "Mon, 16 Dec 2019 23:48:18 GMT",
        "X-memberDateTime": "2019-12-16T23:48:18Z",
        "X-defaultFormat": "Mon, 16 Dec 2019 23:48:18 GMT",
        "X-targetEpochSeconds": "1576540098",
        "X-targetHttpDate": "Mon, 16 Dec 2019 23:48:18 GMT",
        "X-targetDateTime": "2019-12-16T23:48:18Z"
      });
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.timestampFormatHeaders();
    expect(output.defaultFormat!.millisecondsSinceEpoch / 1000, 1576540098);
    expect(output.memberDateTime!.millisecondsSinceEpoch / 1000, 1576540098);
    expect(
        output.memberEpochSeconds!.millisecondsSinceEpoch / 1000, 1576540098);
    expect(output.memberHttpDate!.millisecondsSinceEpoch / 1000, 1576540098);
    expect(output.targetDateTime!.millisecondsSinceEpoch / 1000, 1576540098);
    expect(
        output.targetEpochSeconds!.millisecondsSinceEpoch / 1000, 1576540098);
    expect(output.targetHttpDate!.millisecondsSinceEpoch / 1000, 1576540098);
  });
}
