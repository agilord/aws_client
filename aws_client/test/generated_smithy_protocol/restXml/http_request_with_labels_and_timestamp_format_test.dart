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
  test('HttpRequestWithLabelsAndTimestampFormat', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(
          request.url,
          equalsPathAndQuery(
              '/HttpRequestWithLabelsAndTimestampFormat/1576540098/Mon%2C%2016%20Dec%202019%2023%3A48%3A18%20GMT/2019-12-16T23%3A48%3A18Z/2019-12-16T23%3A48%3A18Z/1576540098/Mon%2C%2016%20Dec%202019%2023%3A48%3A18%20GMT/2019-12-16T23%3A48%3A18Z'));
      expect(request.method, equalsIgnoringCase('GET'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.httpRequestWithLabelsAndTimestampFormat(
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
}
