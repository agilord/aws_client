// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'basic_xml_serialization.dart';

void main() {
  test('Basic XML serialization 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsXml(
              r'''<OperationRequest xmlns="https://foo/"><Name>foo</Name><Description>bar</Description></OperationRequest>'''));
      expect(pathAndQuery(request.url), '/2014-01-01/hostedzone');
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = BasicXMLSerialization(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      description: "bar",
      name: "foo",
    );
/*
{
  "Name": "foo",
  "Description": "bar"
}
*/
  });

  test('Basic XML serialization 1', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsXml(
              r'''<OperationRequest xmlns="https://foo/"><Name>foo</Name><Description>bar</Description></OperationRequest>'''));
      expect(pathAndQuery(request.url), '/2014-01-01/hostedzone');
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = BasicXMLSerialization(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName1(
      description: "bar",
      name: "foo",
    );
/*
{
  "Name": "foo",
  "Description": "bar"
}
*/
  });

  test('Basic XML serialization 2', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r''''''));
      expect(pathAndQuery(request.url), '/2014-01-01/hostedzone');
      expect(request.method, equalsIgnoringCase('GET'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = BasicXMLSerialization(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName2();
/*
{}
*/
  });
}
