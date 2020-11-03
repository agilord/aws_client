// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'string_to_string_maps_in_querystring.dart';

void main() {
  test('String to string maps in querystring 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(pathAndQuery(request.url),
          '/2014-01-01/jobsByPipeline/foo?bar=baz&fizz=buzz');
      return Response('{}', 200, headers: {});
    });

    final service = StringToStringMapsInQuerystring(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      pipelineId: "foo",
      queryDoc: {
        "bar": "baz",
        "fizz": "buzz",
      },
    );
/*
{
  "PipelineId": "foo",
  "QueryDoc": {
    "bar": "baz",
    "fizz": "buzz"
  }
}
*/
  });
}
