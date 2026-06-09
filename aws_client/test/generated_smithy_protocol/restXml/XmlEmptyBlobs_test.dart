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
  test('XmlEmptyBlobs', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlEmptyBlobsResponse>
    <data></data>
</XmlEmptyBlobsResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlEmptyBlobs();
    expect(output.data, utf8.encode(''));
  });

  test('XmlEmptySelfClosedBlobs', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlEmptyBlobsResponse>
    <data/>
</XmlEmptyBlobsResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlEmptyBlobs();
    expect(output.data, utf8.encode(''));
  });
}
