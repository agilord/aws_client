// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'string_to_string_list_maps_in_querystring.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('String to string list maps in querystring 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(
          request.url,
          equalsPathAndQuery(
              '/2014-01-01/jobsByPipeline/id?foo=bar&foo=baz&fizz=buzz&fizz=pop'));
      return Response('{}', 200, headers: {});
    });

    final service = StringToStringListMapsInQuerystring(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName0(
      pipelineId: "id",
      queryDoc: {
        "foo": ["bar", "baz"],
        "fizz": ["buzz", "pop"],
      },
    );
/*
{
  "PipelineId": "id",
  "QueryDoc": {
    "foo": [
      "bar",
      "baz"
    ],
    "fizz": [
      "buzz",
      "pop"
    ]
  }
}
*/
  });
}
