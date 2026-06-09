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
  test('DocumentTypeAsMapValueInput', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "docValuedMap": {
        "foo": { "f": 1, "o": 2 },
        "bar": [ "b", "a", "r" ],
        "baz": "BAZ"
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/DocumentTypeAsMapValue'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.documentTypeAsMapValue(
      docValuedMap: {
        "foo": {"f": 1, "o": 2},
        "bar": ["b", "a", "r"],
        "baz": "BAZ",
      },
    );
  });

  test('DocumentTypeAsMapValueOutput', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "docValuedMap": {
        "foo": { "f": 1, "o": 2 },
        "bar": [ "b", "a", "r" ],
        "baz": "BAZ"
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

    final output = await service.documentTypeAsMapValue();
    expect(output.docValuedMap?['foo'], {"f": 1, "o": 2});
    expect(output.docValuedMap?['bar'], ["b", "a", "r"]);
    expect(output.docValuedMap?['baz'], "BAZ");
  });
}
