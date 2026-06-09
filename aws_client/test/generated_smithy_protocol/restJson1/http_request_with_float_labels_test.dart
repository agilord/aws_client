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
  test('RestJsonSupportsNaNFloatLabels', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.url, equalsPathAndQuery('/FloatHttpLabels/NaN/NaN'));
      expect(request.method, equalsIgnoringCase('GET'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.httpRequestWithFloatLabels(
      doubleValue: double.nan,
      float: double.nan,
    );
  });

  test('RestJsonSupportsInfinityFloatLabels', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.url,
          equalsPathAndQuery('/FloatHttpLabels/Infinity/Infinity'));
      expect(request.method, equalsIgnoringCase('GET'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.httpRequestWithFloatLabels(
      doubleValue: double.infinity,
      float: double.infinity,
    );
  });

  test('RestJsonSupportsNegativeInfinityFloatLabels', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.url,
          equalsPathAndQuery('/FloatHttpLabels/-Infinity/-Infinity'));
      expect(request.method, equalsIgnoringCase('GET'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.httpRequestWithFloatLabels(
      doubleValue: double.negativeInfinity,
      float: double.negativeInfinity,
    );
  });
}
