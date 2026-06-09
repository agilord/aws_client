// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../utils.dart';
import 'v2018_01_01.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('can_call_operation_with_no_input_or_output', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.headers['X-Amz-Target'],
          'JsonProtocol.OperationWithOptionalInputOutput');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.operationWithOptionalInputOutput();
  });

  test('can_call_operation_with_optional_input', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"Value":"Hi"}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.headers['X-Amz-Target'],
          'JsonProtocol.OperationWithOptionalInputOutput');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.operationWithOptionalInputOutput(
      value: "Hi",
    );
  });
}
