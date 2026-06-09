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
  test('DocumentTypeInputWithObject', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "stringValue": "string",
    "documentValue": {
        "foo": "bar"
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/DocumentType'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.documentType(
      documentValue: {"foo": "bar"},
      stringValue: "string",
    );
  });

  test('DocumentInputWithString', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "stringValue": "string",
    "documentValue": "hello"
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/DocumentType'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.documentType(
      documentValue: "hello",
      stringValue: "string",
    );
  });

  test('DocumentInputWithNumber', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "stringValue": "string",
    "documentValue": 10
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/DocumentType'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.documentType(
      documentValue: 10,
      stringValue: "string",
    );
  });

  test('DocumentInputWithBoolean', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "stringValue": "string",
    "documentValue": true
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/DocumentType'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.documentType(
      documentValue: true,
      stringValue: "string",
    );
  });

  test('DocumentInputWithList', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "stringValue": "string",
    "documentValue": [
        true,
        "hi",
        [
            1,
            2
        ],
        {
            "foo": {
                "baz": [
                    3,
                    4
                ]
            }
        }
    ]
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/DocumentType'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.documentType(
      documentValue: [
        true,
        "hi",
        [1, 2],
        {
          "foo": {
            "baz": [3, 4]
          }
        }
      ],
      stringValue: "string",
    );
  });

  test('DocumentOutput', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "stringValue": "string",
    "documentValue": {
        "foo": "bar"
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

    final output = await service.documentType();
    expect(output.documentValue, {"foo": "bar"});
    expect(output.stringValue, "string");
  });

  test('DocumentOutputString', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "stringValue": "string",
    "documentValue": "hello"
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.documentType();
    expect(output.documentValue, "hello");
    expect(output.stringValue, "string");
  });

  test('DocumentOutputNumber', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "stringValue": "string",
    "documentValue": 10
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.documentType();
    expect(output.documentValue, 10);
    expect(output.stringValue, "string");
  });

  test('DocumentOutputBoolean', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "stringValue": "string",
    "documentValue": false
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.documentType();
    expect(output.documentValue, false);
    expect(output.stringValue, "string");
  });

  test('DocumentOutputArray', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "stringValue": "string",
    "documentValue": [
        true,
        false
    ]
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.documentType();
    expect(output.documentValue, [true, false]);
    expect(output.stringValue, "string");
  });
}
