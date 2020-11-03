// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'no_parameters.dart';

void main() {
  test('No parameters 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(pathAndQuery(request.url), '/2014-01-01/jobs');
      return Response('{}', 200, headers: {});
    });

    final service = NoParameters(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0();
/*
*/
  });
}
