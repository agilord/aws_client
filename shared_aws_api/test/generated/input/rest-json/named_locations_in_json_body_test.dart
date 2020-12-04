// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'named_locations_in_json_body.dart';

void main() {
  test('Named locations in JSON body 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body, equalsJson(r'''{"timestamp_location": 1422172800}'''));
      expect(request.url, equalsPathAndQuery('/path'));
      return Response('{}', 200, headers: {});
    });

    final service = NamedLocationsInJSONBody(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      timeArg: DateTime.fromMillisecondsSinceEpoch(1422172800 * 1000),
    );
/*
{
  "TimeArg": 1422172800
}
*/
  });
}
