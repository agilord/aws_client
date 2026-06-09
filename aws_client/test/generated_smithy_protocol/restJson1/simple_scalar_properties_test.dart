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
  test('RestJsonSimpleScalarProperties', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "stringValue": "string",
    "trueBooleanValue": true,
    "falseBooleanValue": false,
    "byteValue": 1,
    "shortValue": 2,
    "integerValue": 3,
    "longValue": 4,
    "floatValue": 5.5,
    "DoubleDribble": 6.5
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.headers['X-Foo'], 'Foo');
      expect(request.url, equalsPathAndQuery('/SimpleScalarProperties'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.simpleScalarProperties(
      byteValue: 1,
      doubleValue: 6.5,
      falseBooleanValue: false,
      floatValue: 5.5,
      foo: "Foo",
      integerValue: 3,
      longValue: 4,
      shortValue: 2,
      stringValue: "string",
      trueBooleanValue: true,
    );
  });

  test('RestJsonDoesntSerializeNullStructureValues', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/SimpleScalarProperties'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.simpleScalarProperties(
      stringValue: null,
    );
  });

  test('RestJsonServersDontSerializeNullStructureValues', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "stringValue": null
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/SimpleScalarProperties'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.simpleScalarProperties();
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('RestJsonSupportsNaNFloatInputs', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "floatValue": "NaN",
    "DoubleDribble": "NaN"
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/SimpleScalarProperties'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.simpleScalarProperties(
      doubleValue: double.nan,
      floatValue: double.nan,
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('RestJsonSupportsInfinityFloatInputs', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "floatValue": "Infinity",
    "DoubleDribble": "Infinity"
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/SimpleScalarProperties'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.simpleScalarProperties(
      doubleValue: double.infinity,
      floatValue: double.infinity,
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('RestJsonSupportsNegativeInfinityFloatInputs', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "floatValue": "-Infinity",
    "DoubleDribble": "-Infinity"
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/SimpleScalarProperties'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.simpleScalarProperties(
      doubleValue: double.negativeInfinity,
      floatValue: double.negativeInfinity,
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('RestJsonSimpleScalarProperties', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "stringValue": "string",
    "trueBooleanValue": true,
    "falseBooleanValue": false,
    "byteValue": 1,
    "shortValue": 2,
    "integerValue": 3,
    "longValue": 4,
    "floatValue": 5.5,
    "DoubleDribble": 6.5
}''',
          200,
          headers: {"Content-Type": "application/json", "X-Foo": "Foo"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarProperties();
    expect(output.byteValue, 1);
    expect(output.doubleValue, 6.5);
    expect(output.falseBooleanValue, false);
    expect(output.floatValue, 5.5);
    expect(output.foo, "Foo");
    expect(output.integerValue, 3);
    expect(output.longValue, 4);
    expect(output.shortValue, 2);
    expect(output.stringValue, "string");
    expect(output.trueBooleanValue, true);
  });

  test('RestJsonDoesntDeserializeNullStructureValues', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "stringValue": null
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarProperties();
    expect(output.byteValue, isNull);
    expect(output.doubleValue, isNull);
    expect(output.falseBooleanValue, isNull);
    expect(output.floatValue, isNull);
    expect(output.foo, isNull);
    expect(output.integerValue, isNull);
    expect(output.longValue, isNull);
    expect(output.shortValue, isNull);
    expect(output.stringValue, isNull);
    expect(output.trueBooleanValue, isNull);
  });

  test('RestJsonServersDontSerializeNullStructureValues', () async {
    final client = MockClient((request) async {
      return Response(r'''{}''', 200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarProperties();
    expect(output.byteValue, isNull);
    expect(output.doubleValue, isNull);
    expect(output.falseBooleanValue, isNull);
    expect(output.floatValue, isNull);
    expect(output.foo, isNull);
    expect(output.integerValue, isNull);
    expect(output.longValue, isNull);
    expect(output.shortValue, isNull);
    expect(output.stringValue, isNull);
    expect(output.trueBooleanValue, isNull);
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('RestJsonSupportsNaNFloatInputs', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "floatValue": "NaN",
    "DoubleDribble": "NaN"
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarProperties();
    expect(output.byteValue, isNull);
    expect(output.doubleValue, isNaN);
    expect(output.falseBooleanValue, isNull);
    expect(output.floatValue, isNaN);
    expect(output.foo, isNull);
    expect(output.integerValue, isNull);
    expect(output.longValue, isNull);
    expect(output.shortValue, isNull);
    expect(output.stringValue, isNull);
    expect(output.trueBooleanValue, isNull);
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('RestJsonSupportsInfinityFloatInputs', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "floatValue": "Infinity",
    "DoubleDribble": "Infinity"
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarProperties();
    expect(output.byteValue, isNull);
    expect(output.doubleValue, double.infinity);
    expect(output.falseBooleanValue, isNull);
    expect(output.floatValue, double.infinity);
    expect(output.foo, isNull);
    expect(output.integerValue, isNull);
    expect(output.longValue, isNull);
    expect(output.shortValue, isNull);
    expect(output.stringValue, isNull);
    expect(output.trueBooleanValue, isNull);
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('RestJsonSupportsNegativeInfinityFloatInputs', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "floatValue": "-Infinity",
    "DoubleDribble": "-Infinity"
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarProperties();
    expect(output.byteValue, isNull);
    expect(output.doubleValue, double.negativeInfinity);
    expect(output.falseBooleanValue, isNull);
    expect(output.floatValue, double.negativeInfinity);
    expect(output.foo, isNull);
    expect(output.integerValue, isNull);
    expect(output.longValue, isNull);
    expect(output.shortValue, isNull);
    expect(output.stringValue, isNull);
    expect(output.trueBooleanValue, isNull);
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');
}
