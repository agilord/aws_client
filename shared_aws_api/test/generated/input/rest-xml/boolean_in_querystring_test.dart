// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'boolean_in_querystring.dart';

void main() {
  test('Boolean in querystring 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r''''''));
      expect(request.url, equalsPathAndQuery('/path?bool-query=true'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = BooleanInQuerystring(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      boolQuery: true,
    );
/*
{
  "BoolQuery": true
}
*/
  });

  test('Boolean in querystring 1', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r''''''));
      expect(request.url, equalsPathAndQuery('/path?bool-query=false'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = BooleanInQuerystring(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName1(
      boolQuery: false,
    );
/*
{
  "BoolQuery": false
}
*/
  });
}
