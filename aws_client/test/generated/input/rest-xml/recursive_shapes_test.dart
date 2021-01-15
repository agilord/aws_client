// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'recursive_shapes.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Recursive shapes 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsXml(
              r'''<OperationRequest xmlns="https://foo/"><RecursiveStruct><NoRecurse>foo</NoRecurse></RecursiveStruct></OperationRequest>'''));
      expect(request.url, equalsPathAndQuery('/path'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = RecursiveShapes(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName0(
      recursiveStruct: RecursiveStructType(
        noRecurse: "foo",
      ),
    );
/*
{
  "RecursiveStruct": {
    "NoRecurse": "foo"
  }
}
*/
  });

  test('Recursive shapes 1', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsXml(
              r'''<OperationRequest xmlns="https://foo/"><RecursiveStruct><RecursiveStruct><NoRecurse>foo</NoRecurse></RecursiveStruct></RecursiveStruct></OperationRequest>'''));
      expect(request.url, equalsPathAndQuery('/path'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = RecursiveShapes(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName1(
      recursiveStruct: RecursiveStructType(
        recursiveStruct: RecursiveStructType(
          noRecurse: "foo",
        ),
      ),
    );
/*
{
  "RecursiveStruct": {
    "RecursiveStruct": {
      "NoRecurse": "foo"
    }
  }
}
*/
  });

  test('Recursive shapes 2', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsXml(
              r'''<OperationRequest xmlns="https://foo/"><RecursiveStruct><RecursiveStruct><RecursiveStruct><RecursiveStruct><NoRecurse>foo</NoRecurse></RecursiveStruct></RecursiveStruct></RecursiveStruct></RecursiveStruct></OperationRequest>'''));
      expect(request.url, equalsPathAndQuery('/path'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = RecursiveShapes(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName2(
      recursiveStruct: RecursiveStructType(
        recursiveStruct: RecursiveStructType(
          recursiveStruct: RecursiveStructType(
            recursiveStruct: RecursiveStructType(
              noRecurse: "foo",
            ),
          ),
        ),
      ),
    );
/*
{
  "RecursiveStruct": {
    "RecursiveStruct": {
      "RecursiveStruct": {
        "RecursiveStruct": {
          "NoRecurse": "foo"
        }
      }
    }
  }
}
*/
  });

  test('Recursive shapes 3', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsXml(
              r'''<OperationRequest xmlns="https://foo/"><RecursiveStruct><RecursiveList><member><NoRecurse>foo</NoRecurse></member><member><NoRecurse>bar</NoRecurse></member></RecursiveList></RecursiveStruct></OperationRequest>'''));
      expect(request.url, equalsPathAndQuery('/path'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = RecursiveShapes(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName3(
      recursiveStruct: RecursiveStructType(
        recursiveList: [
          RecursiveStructType(
            noRecurse: "foo",
          ),
          RecursiveStructType(
            noRecurse: "bar",
          )
        ],
      ),
    );
/*
{
  "RecursiveStruct": {
    "RecursiveList": [
      {
        "NoRecurse": "foo"
      },
      {
        "NoRecurse": "bar"
      }
    ]
  }
}
*/
  });

  test('Recursive shapes 4', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsXml(
              r'''<OperationRequest xmlns="https://foo/"><RecursiveStruct><RecursiveList><member><NoRecurse>foo</NoRecurse></member><member><RecursiveStruct><NoRecurse>bar</NoRecurse></RecursiveStruct></member></RecursiveList></RecursiveStruct></OperationRequest>'''));
      expect(request.url, equalsPathAndQuery('/path'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = RecursiveShapes(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName4(
      recursiveStruct: RecursiveStructType(
        recursiveList: [
          RecursiveStructType(
            noRecurse: "foo",
          ),
          RecursiveStructType(
            recursiveStruct: RecursiveStructType(
              noRecurse: "bar",
            ),
          )
        ],
      ),
    );
/*
{
  "RecursiveStruct": {
    "RecursiveList": [
      {
        "NoRecurse": "foo"
      },
      {
        "RecursiveStruct": {
          "NoRecurse": "bar"
        }
      }
    ]
  }
}
*/
  });

  test('Recursive shapes 5', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsXml(
              r'''<OperationRequest xmlns="https://foo/"><RecursiveStruct><RecursiveMap><entry><key>foo</key><value><NoRecurse>foo</NoRecurse></value></entry><entry><key>bar</key><value><NoRecurse>bar</NoRecurse></value></entry></RecursiveMap></RecursiveStruct></OperationRequest>'''));
      expect(request.url, equalsPathAndQuery('/path'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = RecursiveShapes(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName5(
      recursiveStruct: RecursiveStructType(
        recursiveMap: {
          "foo": RecursiveStructType(
            noRecurse: "foo",
          ),
          "bar": RecursiveStructType(
            noRecurse: "bar",
          ),
        },
      ),
    );
/*
{
  "RecursiveStruct": {
    "RecursiveMap": {
      "foo": {
        "NoRecurse": "foo"
      },
      "bar": {
        "NoRecurse": "bar"
      }
    }
  }
}
*/
  });
}
