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
  test('AwsJson11DateTimeWithNegativeOffset', () async {
    final client = MockClient((request) async {
      return Response(
          r'''      {
          "datetime": "2019-12-16T22:48:18-01:00"
      }
''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.datetimeOffsets();
    expect(output.datetime!.millisecondsSinceEpoch / 1000, 1576540098);
  });

  test('AwsJson11DateTimeWithPositiveOffset', () async {
    final client = MockClient((request) async {
      return Response(
          r'''      {
          "datetime": "2019-12-17T00:48:18+01:00"
      }
''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.datetimeOffsets();
    expect(output.datetime!.millisecondsSinceEpoch / 1000, 1576540098);
  });
}
