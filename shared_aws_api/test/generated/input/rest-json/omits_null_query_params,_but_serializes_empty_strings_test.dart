// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'omits_null_query_params,_but_serializes_empty_strings.dart';

void main() {
  test('Omits null query params, but serializes empty strings 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(pathAndQuery(request.url), '/path');
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200, headers: {});
    });

    final service = OmitsNullQueryParamsButSerializesEmptyStrings(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      foo: null,
    );
/*
{
  "foo": null
}
*/
  });

  test('Omits null query params, but serializes empty strings 1', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(pathAndQuery(request.url), '/path?abc=mno&param-name=');
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200, headers: {});
    });

    final service = OmitsNullQueryParamsButSerializesEmptyStrings(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName1(
      foo: "",
    );
/*
{
  "foo": ""
}
*/
  });
}
