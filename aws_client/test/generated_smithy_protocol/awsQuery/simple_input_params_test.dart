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
  test('QuerySimpleInputParamsStrings', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=SimpleInputParams&Version=2020-01-08&Foo=val1&Bar=val2'''));
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

    await service.simpleInputParams(
      bar: "val2",
      foo: "val1",
    );
  });

  test('QuerySimpleInputParamsStringAndBooleanTrue', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=SimpleInputParams&Version=2020-01-08&Foo=val1&Baz=true'''));
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

    await service.simpleInputParams(
      baz: true,
      foo: "val1",
    );
  });

  test('QuerySimpleInputParamsStringsAndBooleanFalse', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=SimpleInputParams&Version=2020-01-08&Baz=false'''));
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

    await service.simpleInputParams(
      baz: false,
    );
  });

  test('QuerySimpleInputParamsInteger', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=SimpleInputParams&Version=2020-01-08&Bam=10'''));
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

    await service.simpleInputParams(
      bam: 10,
    );
  });

  test('QuerySimpleInputParamsFloat', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=SimpleInputParams&Version=2020-01-08&Boo=10.8'''));
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

    await service.simpleInputParams(
      boo: 10.8,
    );
  });

  test('QuerySimpleInputParamsBlob', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=SimpleInputParams&Version=2020-01-08&Qux=dmFsdWU%3D'''));
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

    await service.simpleInputParams(
      qux: Uint8List.fromList('value'.codeUnits),
    );
  });

  test('QueryEnums', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=SimpleInputParams&Version=2020-01-08&FooEnum=Foo'''));
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

    await service.simpleInputParams(
      fooEnum: FooEnum.foo,
    );
  });

  test('QueryIntEnums', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=SimpleInputParams&Version=2020-01-08&IntegerEnum=1'''));
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

    await service.simpleInputParams(
      integerEnum: 1,
    );
  });

  test('AwsQuerySupportsNaNFloatInputs', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=SimpleInputParams&Version=2020-01-08&FloatValue=NaN&Boo=NaN'''));
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

    await service.simpleInputParams(
      boo: double.nan,
      floatValue: double.nan,
    );
  });

  test('AwsQuerySupportsInfinityFloatInputs', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=SimpleInputParams&Version=2020-01-08&FloatValue=Infinity&Boo=Infinity'''));
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

    await service.simpleInputParams(
      boo: double.infinity,
      floatValue: double.infinity,
    );
  });

  test('AwsQuerySupportsNegativeInfinityFloatInputs', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=SimpleInputParams&Version=2020-01-08&FloatValue=-Infinity&Boo=-Infinity'''));
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

    await service.simpleInputParams(
      boo: double.negativeInfinity,
      floatValue: double.negativeInfinity,
    );
  });
}
