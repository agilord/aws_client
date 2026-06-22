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
  test('QueryHostWithPath', () async {
    final client = MockClient((request) async {
      expect(request.body,
          equalsJson(r'''Action=HostWithPathOperation&Version=2020-01-08'''));
      expect(request.url, equalsPathAndQuery('/custom/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      endpointUrl: 'https://example.com/custom',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.hostWithPathOperation();
  });
}
