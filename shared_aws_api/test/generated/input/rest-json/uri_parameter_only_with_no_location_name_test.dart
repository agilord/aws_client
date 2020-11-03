// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'uri_parameter_only_with_no_location_name.dart';

void main() {
  test('URI parameter only with no location name 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(pathAndQuery(request.url), '/2014-01-01/jobsByPipeline/foo');
      return Response('{}', 200, headers: {});
    });

    final service = URIParameterOnlyWithNoLocationName(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      pipelineId: "foo",
    );
/*
{
  "PipelineId": "foo"
}
*/
  });
}
