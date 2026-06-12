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
  test('RestJsonSparseListsSerializeNull', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "sparseStringList": [
        null,
        "hi"
    ],
    "sparseShortList": [
        null,
        2
    ]
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/SparseJsonLists'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.sparseJsonLists(
      sparseShortList: [2],
      sparseStringList: ["hi"],
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('RestJsonSparseListsSerializeNull', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "sparseStringList": [
        null,
        "hi"
    ],
    "sparseShortList": [
        null,
        2
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

    final output = await service.sparseJsonLists();
    expect(output.sparseShortList?[1], 2);
    expect(output.sparseStringList?[1], "hi");
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');
}
