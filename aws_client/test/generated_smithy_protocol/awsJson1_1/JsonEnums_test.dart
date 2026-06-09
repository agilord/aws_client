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
  test('AwsJson11Enums', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "fooEnum1": "Foo",
    "fooEnum2": "0",
    "fooEnum3": "1",
    "fooEnumList": [
        "Foo",
        "0"
    ],
    "fooEnumSet": [
        "Foo",
        "0"
    ],
    "fooEnumMap": {
        "hi": "Foo",
        "zero": "0"
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.headers['X-Amz-Target'], 'JsonProtocol.JsonEnums');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonEnums(
      fooEnum1: FooEnum.foo,
      fooEnum2: FooEnum.$0,
      fooEnum3: FooEnum.$1,
      fooEnumList: [FooEnum.foo, FooEnum.$0],
      fooEnumMap: {
        "hi": FooEnum.foo,
        "zero": FooEnum.$0,
      },
      fooEnumSet: [FooEnum.foo, FooEnum.$0],
    );
  });

  test('AwsJson11Enums', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "fooEnum1": "Foo",
    "fooEnum2": "0",
    "fooEnum3": "1",
    "fooEnumList": [
        "Foo",
        "0"
    ],
    "fooEnumSet": [
        "Foo",
        "0"
    ],
    "fooEnumMap": {
        "hi": "Foo",
        "zero": "0"
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonEnums();
    expect(output.fooEnum1, FooEnum.foo);
    expect(output.fooEnum2, FooEnum.$0);
    expect(output.fooEnum3, FooEnum.$1);
    expect(output.fooEnumList?[0], FooEnum.foo);
    expect(output.fooEnumList?[1], FooEnum.$0);
    expect(output.fooEnumMap?['hi'], FooEnum.foo);
    expect(output.fooEnumMap?['zero'], FooEnum.$0);
    expect(output.fooEnumSet?[0], FooEnum.foo);
    expect(output.fooEnumSet?[1], FooEnum.$0);
  });
}
