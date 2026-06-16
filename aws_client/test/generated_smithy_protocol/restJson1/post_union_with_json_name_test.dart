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
  test('PostUnionWithJsonNameRequest1', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "value": {
        "FOO": "hi"
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/PostUnionWithJsonName'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.postUnionWithJsonName(
      value: UnionWithJsonName(
        foo: "hi",
      ),
    );
  });

  test('PostUnionWithJsonNameRequest2', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "value": {
        "_baz": "hi"
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/PostUnionWithJsonName'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.postUnionWithJsonName(
      value: UnionWithJsonName(
        baz: "hi",
      ),
    );
  });

  test('PostUnionWithJsonNameRequest3', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "value": {
        "bar": "hi"
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/PostUnionWithJsonName'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.postUnionWithJsonName(
      value: UnionWithJsonName(
        bar: "hi",
      ),
    );
  });

  test('PostUnionWithJsonNameResponse1', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "value": {
        "FOO": "hi"
    }
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.postUnionWithJsonName();
    expect(output.value.bar, isNull);
    expect(output.value.baz, isNull);
    expect(output.value.foo, "hi");
  });

  test('PostUnionWithJsonNameResponse2', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "value": {
        "_baz": "hi"
    }
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.postUnionWithJsonName();
    expect(output.value.bar, isNull);
    expect(output.value.baz, "hi");
    expect(output.value.foo, isNull);
  });

  test('PostUnionWithJsonNameResponse3', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "value": {
        "bar": "hi"
    }
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.postUnionWithJsonName();
    expect(output.value.bar, "hi");
    expect(output.value.baz, isNull);
    expect(output.value.foo, isNull);
  });
}
