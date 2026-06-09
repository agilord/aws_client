// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../utils.dart';
import 'v2020_01_08.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('QueryProtocolIdempotencyTokenAutoFill', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=QueryIdempotencyTokenAutoFill&Version=2020-01-08&token=00000000-0000-4000-8000-000000000000'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-www-form-urlencoded'));
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.queryIdempotencyTokenAutoFill();
  });

  test('QueryProtocolIdempotencyTokenAutoFillIsSet', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=QueryIdempotencyTokenAutoFill&Version=2020-01-08&token=00000000-0000-4000-8000-000000000123'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-www-form-urlencoded'));
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.queryIdempotencyTokenAutoFill(
      token: "00000000-0000-4000-8000-000000000123",
    );
  });
}
