// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'uri_parameter_querystring_params_headers_and_json_body.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('URI parameter, querystring params, headers and JSON body 0', () async {
    final client = MockClient((request) async {
      expect(request.body,
          equalsJson(r'''{"Config": {"A": "one", "B": "two"}}'''));
      expect(request.headers['x-amz-checksum'], '12345');
      expect(
          request.url,
          equalsPathAndQuery(
              '/2014-01-01/jobsByPipeline/foo?Ascending=true&PageToken=bar'));
      return Response('{}', 200, headers: {});
    });

    final service = UriParameterQuerystringParamsHeadersAndJsonBody(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName0(
      pipelineId: "foo",
      ascending: "true",
      checksum: "12345",
      config: StructType(
        a: "one",
        b: "two",
      ),
      pageToken: "bar",
    );
/*
{
  "PipelineId": "foo",
  "Ascending": "true",
  "Checksum": "12345",
  "PageToken": "bar",
  "Config": {
    "A": "one",
    "B": "two"
  }
}
*/
  });
}
