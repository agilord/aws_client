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
  test('QuerySimpleScalarProperties', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<SimpleScalarXmlPropertiesResponse xmlns="https://example.com/">
    <SimpleScalarXmlPropertiesResult>
        <stringValue>string</stringValue>
        <emptyStringValue/>
        <trueBooleanValue>true</trueBooleanValue>
        <falseBooleanValue>false</falseBooleanValue>
        <byteValue>1</byteValue>
        <shortValue>2</shortValue>
        <integerValue>3</integerValue>
        <longValue>4</longValue>
        <floatValue>5.5</floatValue>
        <DoubleDribble>6.5</DoubleDribble>
    </SimpleScalarXmlPropertiesResult>
</SimpleScalarXmlPropertiesResponse>
''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarXmlProperties();
    expect(output.byteValue, 1);
    expect(output.doubleValue, 6.5);
    expect(output.emptyStringValue, "");
    expect(output.falseBooleanValue, false);
    expect(output.floatValue, 5.5);
    expect(output.integerValue, 3);
    expect(output.longValue, 4);
    expect(output.shortValue, 2);
    expect(output.stringValue, "string");
    expect(output.trueBooleanValue, true);
  });

  test('AwsQuerySupportsNaNFloatOutputs', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<SimpleScalarXmlPropertiesResponse xmlns="https://example.com/">
    <SimpleScalarXmlPropertiesResult>
        <floatValue>NaN</floatValue>
        <DoubleDribble>NaN</DoubleDribble>
    </SimpleScalarXmlPropertiesResult>
</SimpleScalarXmlPropertiesResponse>
''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarXmlProperties();
    expect(output.byteValue, isNull);
    expect(output.doubleValue, isNaN);
    expect(output.emptyStringValue, isNull);
    expect(output.falseBooleanValue, isNull);
    expect(output.floatValue, isNaN);
    expect(output.integerValue, isNull);
    expect(output.longValue, isNull);
    expect(output.shortValue, isNull);
    expect(output.stringValue, isNull);
    expect(output.trueBooleanValue, isNull);
  });

  test('AwsQuerySupportsInfinityFloatOutputs', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<SimpleScalarXmlPropertiesResponse xmlns="https://example.com/">
    <SimpleScalarXmlPropertiesResult>
        <floatValue>Infinity</floatValue>
        <DoubleDribble>Infinity</DoubleDribble>
    </SimpleScalarXmlPropertiesResult>
</SimpleScalarXmlPropertiesResponse>
''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarXmlProperties();
    expect(output.byteValue, isNull);
    expect(output.doubleValue, double.infinity);
    expect(output.emptyStringValue, isNull);
    expect(output.falseBooleanValue, isNull);
    expect(output.floatValue, double.infinity);
    expect(output.integerValue, isNull);
    expect(output.longValue, isNull);
    expect(output.shortValue, isNull);
    expect(output.stringValue, isNull);
    expect(output.trueBooleanValue, isNull);
  });

  test('AwsQuerySupportsNegativeInfinityFloatOutputs', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<SimpleScalarXmlPropertiesResponse xmlns="https://example.com/">
    <SimpleScalarXmlPropertiesResult>
        <floatValue>-Infinity</floatValue>
        <DoubleDribble>-Infinity</DoubleDribble>
    </SimpleScalarXmlPropertiesResult>
</SimpleScalarXmlPropertiesResponse>
''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarXmlProperties();
    expect(output.byteValue, isNull);
    expect(output.doubleValue, double.negativeInfinity);
    expect(output.emptyStringValue, isNull);
    expect(output.falseBooleanValue, isNull);
    expect(output.floatValue, double.negativeInfinity);
    expect(output.integerValue, isNull);
    expect(output.longValue, isNull);
    expect(output.shortValue, isNull);
    expect(output.stringValue, isNull);
    expect(output.trueBooleanValue, isNull);
  });
}
