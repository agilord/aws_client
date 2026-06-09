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
  test('HttpPrefixHeadersArePresent', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.headers['x-foo'], 'Foo');
      expect(request.headers['x-foo-abc'], 'Abc value');
      expect(request.headers['x-foo-def'], 'Def value');
      expect(request.url, equalsPathAndQuery('/HttpPrefixHeaders'));
      expect(request.method, equalsIgnoringCase('GET'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.httpPrefixHeaders(
      foo: "Foo",
      fooMap: {
        "abc": "Abc value",
        "def": "Def value",
      },
    );
  });

  test('HttpPrefixHeadersAreNotPresent', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.headers['x-foo'], 'Foo');
      expect(request.url, equalsPathAndQuery('/HttpPrefixHeaders'));
      expect(request.method, equalsIgnoringCase('GET'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.httpPrefixHeaders(
      foo: "Foo",
      fooMap: {},
    );
  });

  test('HttpPrefixEmptyHeaders', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.headers['x-foo-abc'], '');
      expect(request.url, equalsPathAndQuery('/HttpPrefixHeaders'));
      expect(request.method, equalsIgnoringCase('GET'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.httpPrefixHeaders(
      fooMap: {
        "abc": "",
      },
    );
  });

  test('HttpPrefixHeadersArePresent', () async {
    final client = MockClient((request) async {
      return Response(r'''''', 200,
          headers: {
            "x-foo": "Foo",
            "x-foo-abc": "Abc value",
            "x-foo-def": "Def value"
          });
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.httpPrefixHeaders();
    expect(output.foo, "Foo");
    expect(output.fooMap?['abc'], "Abc value");
    expect(output.fooMap?['def'], "Def value");
  });

  test('HttpPrefixHeadersAreNotPresent', () async {
    final client = MockClient((request) async {
      return Response(r'''''', 200, headers: {"x-foo": "Foo"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.httpPrefixHeaders();
    expect(output.foo, "Foo");
  });
}
