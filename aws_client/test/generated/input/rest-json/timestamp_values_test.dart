// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'timestamp_values.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Timestamp values 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsJson(
              r'''{"TimeArg": 1422172800, "TimeCustom": "2015-01-25T08:00:00Z", "TimeFormat": "Sun, 25 Jan 2015 08:00:00 GMT"}'''));
      expect(request.headers['x-amz-timearg'], 'Sun, 25 Jan 2015 08:00:00 GMT');
      expect(request.headers['x-amz-timecustom-header'], '1422172800');
      expect(request.headers['x-amz-timeformat-header'], '1422172800');
      expect(
          request.url,
          equalsPathAndQuery(
              '/path?TimeQuery=2015-01-25T08%3A00%3A00Z&TimeCustomQuery=1422172800&TimeFormatQuery=1422172800'));
      return Response('{}', 200, headers: {});
    });

    final service = TimestampValues(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName0(
      timeArg: DateTime.fromMillisecondsSinceEpoch(1422172800 * 1000),
      timeArgInHeader: DateTime.fromMillisecondsSinceEpoch(1422172800 * 1000),
      timeArgInQuery: DateTime.fromMillisecondsSinceEpoch(1422172800 * 1000),
      timeCustom: DateTime.fromMillisecondsSinceEpoch(1422172800 * 1000),
      timeCustomInHeader:
          DateTime.fromMillisecondsSinceEpoch(1422172800 * 1000),
      timeCustomInQuery: DateTime.fromMillisecondsSinceEpoch(1422172800 * 1000),
      timeFormat: DateTime.fromMillisecondsSinceEpoch(1422172800 * 1000),
      timeFormatInHeader:
          DateTime.fromMillisecondsSinceEpoch(1422172800 * 1000),
      timeFormatInQuery: DateTime.fromMillisecondsSinceEpoch(1422172800 * 1000),
    );
/*
{
  "TimeArg": 1422172800,
  "TimeArgInQuery": 1422172800,
  "TimeArgInHeader": 1422172800,
  "TimeCustom": 1422172800,
  "TimeCustomInQuery": 1422172800,
  "TimeCustomInHeader": 1422172800,
  "TimeFormat": 1422172800,
  "TimeFormatInQuery": 1422172800,
  "TimeFormatInHeader": 1422172800
}
*/
  });
}
