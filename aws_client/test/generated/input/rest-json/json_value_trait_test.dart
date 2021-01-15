// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'json_value_trait.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('JSON value trait 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body, equalsJson(r'''{"BodyField":"{\"Foo\":\"Bar\"}"}'''));
      expect(request.headers['X-Amz-Foo'], 'eyJGb28iOiJCYXIifQ==');
      expect(
          request.url, equalsPathAndQuery('/?Bar=%7B%22Foo%22%3A%22Bar%22%7D'));
      return Response('{}', 200, headers: {});
    });

    final service = JsonValueTrait(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName0(
      body: BodyStructure(
        bodyField: r'''{"Foo":"Bar"}''',
      ),
      headerField: r'''{"Foo":"Bar"}''',
      queryField: r'''{"Foo":"Bar"}''',
    );
/*
{
  "HeaderField": {
    "Foo": "Bar"
  },
  "QueryField": {
    "Foo": "Bar"
  },
  "Body": {
    "BodyField": {
      "Foo": "Bar"
    }
  }
}
*/
  });

  test('JSON value trait 1', () async {
    final client = MockClient((request) async {
      expect(request.body,
          equalsJson(r'''{"BodyListField":["{\"Foo\":\"Bar\"}"]}'''));
      expect(request.url, equalsPathAndQuery('/'));
      return Response('{}', 200, headers: {});
    });

    final service = JsonValueTrait(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName1(
      body: BodyStructure(
        bodyListField: [r'''{"Foo":"Bar"}'''],
      ),
    );
/*
{
  "Body": {
    "BodyListField": [
      {
        "Foo": "Bar"
      }
    ]
  }
}
*/
  });

  test('JSON value trait 2', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.url, equalsPathAndQuery('/'));
      return Response('{}', 200, headers: {});
    });

    final service = JsonValueTrait(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName2();
/*
{}
*/
  });
}
