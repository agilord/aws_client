// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'list_of_structures.dart';

void main() {
  test('List of structures 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsXml(
              r'''<OperationRequest xmlns="https://foo/"><item><value>one</value></item><item><value>two</value></item><item><value>three</value></item></OperationRequest>'''));
      expect(pathAndQuery(request.url), '/2014-01-01/hostedzone');
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = ListOfStructures(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    await service.operationName0(
      listParam: [
        SingleFieldStruct(
          element: "one",
        ),
        SingleFieldStruct(
          element: "two",
        ),
        SingleFieldStruct(
          element: "three",
        )
      ],
    );
/*
{
  "ListParam": [
    {
      "Element": "one"
    },
    {
      "Element": "two"
    },
    {
      "Element": "three"
    }
  ]
}
*/
  });
}
