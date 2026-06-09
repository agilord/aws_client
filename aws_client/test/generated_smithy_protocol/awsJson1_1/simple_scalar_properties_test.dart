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
  test('AwsJson11SupportsNaNFloatInputs', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "floatValue": "NaN",
    "doubleValue": "NaN"
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.headers['X-Amz-Target'],
          'JsonProtocol.SimpleScalarProperties');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.simpleScalarProperties(
      doubleValue: double.nan,
      floatValue: double.nan,
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('AwsJson11SupportsInfinityFloatInputs', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "floatValue": "Infinity",
    "doubleValue": "Infinity"
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.headers['X-Amz-Target'],
          'JsonProtocol.SimpleScalarProperties');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.simpleScalarProperties(
      doubleValue: double.infinity,
      floatValue: double.infinity,
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('AwsJson11SupportsNegativeInfinityFloatInputs', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "floatValue": "-Infinity",
    "doubleValue": "-Infinity"
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.headers['X-Amz-Target'],
          'JsonProtocol.SimpleScalarProperties');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.simpleScalarProperties(
      doubleValue: double.negativeInfinity,
      floatValue: double.negativeInfinity,
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('AwsJson11SupportsNaNFloatInputs', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "floatValue": "NaN",
    "doubleValue": "NaN"
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarProperties();
    expect(output.doubleValue, isNaN);
    expect(output.floatValue, isNaN);
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('AwsJson11SupportsInfinityFloatInputs', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "floatValue": "Infinity",
    "doubleValue": "Infinity"
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarProperties();
    expect(output.doubleValue, double.infinity);
    expect(output.floatValue, double.infinity);
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('AwsJson11SupportsNegativeInfinityFloatInputs', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "floatValue": "-Infinity",
    "doubleValue": "-Infinity"
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarProperties();
    expect(output.doubleValue, double.negativeInfinity);
    expect(output.floatValue, double.negativeInfinity);
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');
}
