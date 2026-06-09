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
  test('serializes_string_shapes', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"String":"abc xyz"}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      string: "abc xyz",
    );
  });

  test('serializes_string_shapes_with_jsonvalue_trait', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsJson(
              r'''{"JsonValue":"{\"string\":\"value\",\"number\":1234.5,\"boolTrue\":true,\"boolFalse\":false,\"array\":[1,2,3,4],\"object\":{\"key\":\"value\"},\"null\":null}"}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      jsonValue: jsonDecode(
          "{\"string\":\"value\",\"number\":1234.5,\"boolTrue\":true,\"boolFalse\":false,\"array\":[1,2,3,4],\"object\":{\"key\":\"value\"},\"null\":null}"),
    );
  });

  test('serializes_integer_shapes', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"Integer":1234}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      integer: 1234,
    );
  });

  test('serializes_long_shapes', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"Long":999999999999}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      long: 999999999999,
    );
  });

  test('serializes_float_shapes', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"Float":1234.5}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      float: 1234.5,
    );
  });

  test('serializes_double_shapes', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"Double":1234.5}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      doubleValue: 1234.5,
    );
  });

  test('serializes_blob_shapes', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"Blob":"YmluYXJ5LXZhbHVl"}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      blob: Uint8List.fromList('binary-value'.codeUnits),
    );
  });

  test('serializes_boolean_shapes_true', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"Boolean":true}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      boolean: true,
    );
  });

  test('serializes_boolean_shapes_false', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"Boolean":false}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      boolean: false,
    );
  });

  test('serializes_timestamp_shapes', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"Timestamp":946845296}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      timestamp: DateTime.fromMillisecondsSinceEpoch(946845296 * 1000),
    );
  });

  test('serializes_timestamp_shapes_with_iso8601_timestampformat', () async {
    final client = MockClient((request) async {
      expect(request.body,
          equalsJson(r'''{"Iso8601Timestamp":"2000-01-02T20:34:56Z"}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      iso8601Timestamp: DateTime.fromMillisecondsSinceEpoch(946845296 * 1000),
    );
  });

  test('serializes_timestamp_shapes_with_httpdate_timestampformat', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsJson(
              r'''{"HttpdateTimestamp":"Sun, 02 Jan 2000 20:34:56 GMT"}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      httpdateTimestamp: DateTime.fromMillisecondsSinceEpoch(946845296 * 1000),
    );
  });

  test('serializes_timestamp_shapes_with_unixtimestamp_timestampformat',
      () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"UnixTimestamp":946845296}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      unixTimestamp: DateTime.fromMillisecondsSinceEpoch(946845296 * 1000),
    );
  });

  test('serializes_list_shapes', () async {
    final client = MockClient((request) async {
      expect(request.body,
          equalsJson(r'''{"ListOfStrings":["abc","mno","xyz"]}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      listOfStrings: ["abc", "mno", "xyz"],
    );
  });

  test('serializes_empty_list_shapes', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"ListOfStrings":[]}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      listOfStrings: [],
    );
  });

  test('serializes_list_of_map_shapes', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsJson(
              r'''{"ListOfMapsOfStrings":[{"foo":"bar"},{"abc":"xyz"},{"red":"blue"}]}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      listOfMapsOfStrings: [
        {
          "foo": "bar",
        },
        {
          "abc": "xyz",
        },
        {
          "red": "blue",
        }
      ],
    );
  });

  test('serializes_list_of_structure_shapes', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsJson(
              r'''{"ListOfStructs":[{"Value":"abc"},{"Value":"mno"},{"Value":"xyz"}]}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      listOfStructs: [
        SimpleStruct(
          value: "abc",
        ),
        SimpleStruct(
          value: "mno",
        ),
        SimpleStruct(
          value: "xyz",
        )
      ],
    );
  });

  test('serializes_list_of_recursive_structure_shapes', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsJson(
              r'''{"RecursiveList":[{"RecursiveList":[{"RecursiveList":[{"Integer":123}]}]}]}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      recursiveList: [
        KitchenSink(
          recursiveList: [
            KitchenSink(
              recursiveList: [
                KitchenSink(
                  integer: 123,
                )
              ],
            )
          ],
        )
      ],
    );
  });

  test('serializes_map_shapes', () async {
    final client = MockClient((request) async {
      expect(request.body,
          equalsJson(r'''{"MapOfStrings":{"abc":"xyz","mno":"hjk"}}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      mapOfStrings: {
        "abc": "xyz",
        "mno": "hjk",
      },
    );
  });

  test('serializes_empty_map_shapes', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"MapOfStrings":{}}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      mapOfStrings: {},
    );
  });

  test('serializes_map_of_list_shapes', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsJson(
              r'''{"MapOfListsOfStrings":{"abc":["abc","xyz"],"mno":["xyz","abc"]}}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      mapOfListsOfStrings: {
        "abc": ["abc", "xyz"],
        "mno": ["xyz", "abc"],
      },
    );
  });

  test('serializes_map_of_structure_shapes', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsJson(
              r'''{"MapOfStructs":{"key1":{"Value":"value-1"},"key2":{"Value":"value-2"}}}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      mapOfStructs: {
        "key1": SimpleStruct(
          value: "value-1",
        ),
        "key2": SimpleStruct(
          value: "value-2",
        ),
      },
    );
  });

  test('serializes_map_of_recursive_structure_shapes', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsJson(
              r'''{"RecursiveMap":{"key1":{"RecursiveMap":{"key2":{"RecursiveMap":{"key3":{"Boolean":false}}}}}}}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      recursiveMap: {
        "key1": KitchenSink(
          recursiveMap: {
            "key2": KitchenSink(
              recursiveMap: {
                "key3": KitchenSink(
                  boolean: false,
                ),
              },
            ),
          },
        ),
      },
    );
  });

  test('serializes_structure_shapes', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"SimpleStruct":{"Value":"abc"}}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      simpleStruct: SimpleStruct(
        value: "abc",
      ),
    );
  });

  test('serializes_structure_members_with_locationname_traits', () async {
    final client = MockClient((request) async {
      expect(request.body,
          equalsJson(r'''{"StructWithJsonName":{"Value":"some-value"}}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      structWithJsonName: StructWithJsonName(
        value: "some-value",
      ),
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('serializes_empty_structure_shapes', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"SimpleStruct":{}}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      simpleStruct: SimpleStruct(),
    );
  });

  test('serializes_structure_which_have_no_members', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"EmptyStruct":{}}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      emptyStruct: EmptyStruct(),
    );
  });

  test('serializes_recursive_structure_shapes', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsJson(
              r'''{"String":"top-value","Boolean":false,"RecursiveStruct":{"String":"nested-value","Boolean":true,"RecursiveList":[{"String":"string-only"},{"RecursiveStruct":{"MapOfStrings":{"color":"red","size":"large"}}}]}}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(
          request.headers['X-Amz-Target'], 'JsonProtocol.KitchenSinkOperation');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.kitchenSinkOperation(
      boolean: false,
      recursiveStruct: KitchenSink(
        boolean: true,
        recursiveList: [
          KitchenSink(
            string: "string-only",
          ),
          KitchenSink(
            recursiveStruct: KitchenSink(
              mapOfStrings: {
                "color": "red",
                "size": "large",
              },
            ),
          )
        ],
        string: "nested-value",
      ),
      string: "top-value",
    );
  });

  test('parses_operations_with_empty_json_bodies', () async {
    final client = MockClient((request) async {
      return Response(r'''{}''', 200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output, isNull);
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('parses_string_shapes', () async {
    final client = MockClient((request) async {
      return Response(r'''{"String":"string-value"}''', 200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, isNull);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs, isNull);
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, "string-value");
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_integer_shapes', () async {
    final client = MockClient((request) async {
      return Response(r'''{"Integer":1234}''', 200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, isNull);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, 1234);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs, isNull);
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_long_shapes', () async {
    final client = MockClient((request) async {
      return Response(r'''{"Long":1234567890123456789}''', 200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, isNull);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs, isNull);
    expect(output.long, 1234567890123456789);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_float_shapes', () async {
    final client = MockClient((request) async {
      return Response(r'''{"Float":1234.5}''', 200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, isNull);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, 1234.5);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs, isNull);
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_double_shapes', () async {
    final client = MockClient((request) async {
      return Response(r'''{"Double":123456789.12345679}''', 200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, isNull);
    expect(output.doubleValue, 123456789.12345679);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs, isNull);
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_boolean_shapes_true', () async {
    final client = MockClient((request) async {
      return Response(r'''{"Boolean":true}''', 200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, true);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs, isNull);
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_boolean_false', () async {
    final client = MockClient((request) async {
      return Response(r'''{"Boolean":false}''', 200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, false);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs, isNull);
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_blob_shapes', () async {
    final client = MockClient((request) async {
      return Response(r'''{"Blob":"YmluYXJ5LXZhbHVl"}''', 200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, utf8.encode('binary-value'));
    expect(output.boolean, isNull);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs, isNull);
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_timestamp_shapes', () async {
    final client = MockClient((request) async {
      return Response(r'''{"Timestamp":946845296}''', 200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, isNull);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs, isNull);
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp!.millisecondsSinceEpoch ~/ 1000, 946845296);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_iso8601_timestamps', () async {
    final client = MockClient((request) async {
      return Response(r'''{"Iso8601Timestamp":"2000-01-02T20:34:56Z"}''', 200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, isNull);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp!.millisecondsSinceEpoch ~/ 1000, 946845296);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs, isNull);
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_httpdate_timestamps', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{"HttpdateTimestamp":"Sun, 02 Jan 2000 20:34:56 GMT"}''', 200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, isNull);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp!.millisecondsSinceEpoch ~/ 1000, 946845296);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs, isNull);
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_list_shapes', () async {
    final client = MockClient((request) async {
      return Response(r'''{"ListOfStrings":["abc","mno","xyz"]}''', 200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, isNull);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings?[0], "abc");
    expect(output.listOfStrings?[1], "mno");
    expect(output.listOfStrings?[2], "xyz");
    expect(output.listOfStructs, isNull);
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_list_of_map_shapes', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{"ListOfMapsOfStrings":[{"size":"large"},{"color":"red"}]}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, isNull);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings?[0]['size'], "large");
    expect(output.listOfMapsOfStrings?[1]['color'], "red");
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs, isNull);
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_list_of_list_shapes', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{"ListOfLists":[["abc","mno","xyz"],["hjk","qrs","tuv"]]}''', 200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, isNull);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists?[0][0], "abc");
    expect(output.listOfLists?[0][1], "mno");
    expect(output.listOfLists?[0][2], "xyz");
    expect(output.listOfLists?[1][0], "hjk");
    expect(output.listOfLists?[1][1], "qrs");
    expect(output.listOfLists?[1][2], "tuv");
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs, isNull);
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_list_of_structure_shapes', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{"ListOfStructs":[{"Value":"value-1"},{"Value":"value-2"}]}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, isNull);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs?[0].value, "value-1");
    expect(output.listOfStructs?[1].value, "value-2");
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_list_of_recursive_structure_shapes', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{"RecursiveList":[{"RecursiveList":[{"RecursiveList":[{"String":"value"}]}]}]}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, isNull);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs, isNull);
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList?[0].blob, isNull);
    expect(output.recursiveList?[0].boolean, isNull);
    expect(output.recursiveList?[0].doubleValue, isNull);
    expect(output.recursiveList?[0].emptyStruct, isNull);
    expect(output.recursiveList?[0].float, isNull);
    expect(output.recursiveList?[0].httpdateTimestamp, isNull);
    expect(output.recursiveList?[0].integer, isNull);
    expect(output.recursiveList?[0].iso8601Timestamp, isNull);
    expect(output.recursiveList?[0].jsonValue, isNull);
    expect(output.recursiveList?[0].listOfLists, isNull);
    expect(output.recursiveList?[0].listOfMapsOfStrings, isNull);
    expect(output.recursiveList?[0].listOfStrings, isNull);
    expect(output.recursiveList?[0].listOfStructs, isNull);
    expect(output.recursiveList?[0].long, isNull);
    expect(output.recursiveList?[0].mapOfListsOfStrings, isNull);
    expect(output.recursiveList?[0].mapOfMaps, isNull);
    expect(output.recursiveList?[0].mapOfStrings, isNull);
    expect(output.recursiveList?[0].mapOfStructs, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].blob, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].boolean, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].doubleValue, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].emptyStruct, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].float, isNull);
    expect(
        output.recursiveList?[0].recursiveList?[0].httpdateTimestamp, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].integer, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].iso8601Timestamp, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].jsonValue, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].listOfLists, isNull);
    expect(
        output.recursiveList?[0].recursiveList?[0].listOfMapsOfStrings, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].listOfStrings, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].listOfStructs, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].long, isNull);
    expect(
        output.recursiveList?[0].recursiveList?[0].mapOfListsOfStrings, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].mapOfMaps, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].mapOfStrings, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].mapOfStructs, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].recursiveList?[0].blob,
        isNull);
    expect(output.recursiveList?[0].recursiveList?[0].recursiveList?[0].boolean,
        isNull);
    expect(
        output
            .recursiveList?[0].recursiveList?[0].recursiveList?[0].doubleValue,
        isNull);
    expect(
        output
            .recursiveList?[0].recursiveList?[0].recursiveList?[0].emptyStruct,
        isNull);
    expect(output.recursiveList?[0].recursiveList?[0].recursiveList?[0].float,
        isNull);
    expect(
        output.recursiveList?[0].recursiveList?[0].recursiveList?[0]
            .httpdateTimestamp,
        isNull);
    expect(output.recursiveList?[0].recursiveList?[0].recursiveList?[0].integer,
        isNull);
    expect(
        output.recursiveList?[0].recursiveList?[0].recursiveList?[0]
            .iso8601Timestamp,
        isNull);
    expect(
        output.recursiveList?[0].recursiveList?[0].recursiveList?[0].jsonValue,
        isNull);
    expect(
        output
            .recursiveList?[0].recursiveList?[0].recursiveList?[0].listOfLists,
        isNull);
    expect(
        output.recursiveList?[0].recursiveList?[0].recursiveList?[0]
            .listOfMapsOfStrings,
        isNull);
    expect(
        output.recursiveList?[0].recursiveList?[0].recursiveList?[0]
            .listOfStrings,
        isNull);
    expect(
        output.recursiveList?[0].recursiveList?[0].recursiveList?[0]
            .listOfStructs,
        isNull);
    expect(output.recursiveList?[0].recursiveList?[0].recursiveList?[0].long,
        isNull);
    expect(
        output.recursiveList?[0].recursiveList?[0].recursiveList?[0]
            .mapOfListsOfStrings,
        isNull);
    expect(
        output.recursiveList?[0].recursiveList?[0].recursiveList?[0].mapOfMaps,
        isNull);
    expect(
        output
            .recursiveList?[0].recursiveList?[0].recursiveList?[0].mapOfStrings,
        isNull);
    expect(
        output
            .recursiveList?[0].recursiveList?[0].recursiveList?[0].mapOfStructs,
        isNull);
    expect(
        output.recursiveList?[0].recursiveList?[0].recursiveList?[0]
            .recursiveList,
        isNull);
    expect(
        output
            .recursiveList?[0].recursiveList?[0].recursiveList?[0].recursiveMap,
        isNull);
    expect(
        output.recursiveList?[0].recursiveList?[0].recursiveList?[0]
            .recursiveStruct,
        isNull);
    expect(
        output
            .recursiveList?[0].recursiveList?[0].recursiveList?[0].simpleStruct,
        isNull);
    expect(output.recursiveList?[0].recursiveList?[0].recursiveList?[0].string,
        "value");
    expect(
        output.recursiveList?[0].recursiveList?[0].recursiveList?[0]
            .structWithJsonName,
        isNull);
    expect(
        output.recursiveList?[0].recursiveList?[0].recursiveList?[0].timestamp,
        isNull);
    expect(
        output.recursiveList?[0].recursiveList?[0].recursiveList?[0]
            .unixTimestamp,
        isNull);
    expect(output.recursiveList?[0].recursiveList?[0].recursiveMap, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].recursiveStruct, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].simpleStruct, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].string, isNull);
    expect(
        output.recursiveList?[0].recursiveList?[0].structWithJsonName, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].timestamp, isNull);
    expect(output.recursiveList?[0].recursiveList?[0].unixTimestamp, isNull);
    expect(output.recursiveList?[0].recursiveMap, isNull);
    expect(output.recursiveList?[0].recursiveStruct, isNull);
    expect(output.recursiveList?[0].simpleStruct, isNull);
    expect(output.recursiveList?[0].string, isNull);
    expect(output.recursiveList?[0].structWithJsonName, isNull);
    expect(output.recursiveList?[0].timestamp, isNull);
    expect(output.recursiveList?[0].unixTimestamp, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_map_shapes', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{"MapOfStrings":{"size":"large","color":"red"}}''', 200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, isNull);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs, isNull);
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings?['size'], "large");
    expect(output.mapOfStrings?['color'], "red");
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_map_of_list_shapes', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{"MapOfListsOfStrings":{"sizes":["large","small"],"colors":["red","green"]}}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, isNull);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs, isNull);
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings?['sizes']?[0], "large");
    expect(output.mapOfListsOfStrings?['sizes']?[1], "small");
    expect(output.mapOfListsOfStrings?['colors']?[0], "red");
    expect(output.mapOfListsOfStrings?['colors']?[1], "green");
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_map_of_map_shapes', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{"MapOfMaps":{"sizes":{"large":"L","medium":"M"},"colors":{"red":"R","blue":"B"}}}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, isNull);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs, isNull);
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps?['sizes']?['large'], "L");
    expect(output.mapOfMaps?['sizes']?['medium'], "M");
    expect(output.mapOfMaps?['colors']?['red'], "R");
    expect(output.mapOfMaps?['colors']?['blue'], "B");
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_map_of_structure_shapes', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{"MapOfStructs":{"size":{"Value":"small"},"color":{"Value":"red"}}}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, isNull);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs, isNull);
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs?['size']?.value, "small");
    expect(output.mapOfStructs?['color']?.value, "red");
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_map_of_recursive_structure_shapes', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{"RecursiveMap":{"key-1":{"RecursiveMap":{"key-2":{"RecursiveMap":{"key-3":{"String":"value"}}}}}}}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output.blob, isNull);
    expect(output.boolean, isNull);
    expect(output.doubleValue, isNull);
    expect(output.emptyStruct, isNull);
    expect(output.float, isNull);
    expect(output.httpdateTimestamp, isNull);
    expect(output.integer, isNull);
    expect(output.iso8601Timestamp, isNull);
    expect(output.jsonValue, isNull);
    expect(output.listOfLists, isNull);
    expect(output.listOfMapsOfStrings, isNull);
    expect(output.listOfStrings, isNull);
    expect(output.listOfStructs, isNull);
    expect(output.long, isNull);
    expect(output.mapOfListsOfStrings, isNull);
    expect(output.mapOfMaps, isNull);
    expect(output.mapOfStrings, isNull);
    expect(output.mapOfStructs, isNull);
    expect(output.recursiveList, isNull);
    expect(output.recursiveMap?['key-1']?.blob, isNull);
    expect(output.recursiveMap?['key-1']?.boolean, isNull);
    expect(output.recursiveMap?['key-1']?.doubleValue, isNull);
    expect(output.recursiveMap?['key-1']?.emptyStruct, isNull);
    expect(output.recursiveMap?['key-1']?.float, isNull);
    expect(output.recursiveMap?['key-1']?.httpdateTimestamp, isNull);
    expect(output.recursiveMap?['key-1']?.integer, isNull);
    expect(output.recursiveMap?['key-1']?.iso8601Timestamp, isNull);
    expect(output.recursiveMap?['key-1']?.jsonValue, isNull);
    expect(output.recursiveMap?['key-1']?.listOfLists, isNull);
    expect(output.recursiveMap?['key-1']?.listOfMapsOfStrings, isNull);
    expect(output.recursiveMap?['key-1']?.listOfStrings, isNull);
    expect(output.recursiveMap?['key-1']?.listOfStructs, isNull);
    expect(output.recursiveMap?['key-1']?.long, isNull);
    expect(output.recursiveMap?['key-1']?.mapOfListsOfStrings, isNull);
    expect(output.recursiveMap?['key-1']?.mapOfMaps, isNull);
    expect(output.recursiveMap?['key-1']?.mapOfStrings, isNull);
    expect(output.recursiveMap?['key-1']?.mapOfStructs, isNull);
    expect(output.recursiveMap?['key-1']?.recursiveList, isNull);
    expect(output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.blob, isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.boolean, isNull);
    expect(output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.doubleValue,
        isNull);
    expect(output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.emptyStruct,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.float, isNull);
    expect(
        output
            .recursiveMap?['key-1']?.recursiveMap?['key-2']?.httpdateTimestamp,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.integer, isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.iso8601Timestamp,
        isNull);
    expect(output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.jsonValue,
        isNull);
    expect(output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.listOfLists,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.listOfMapsOfStrings,
        isNull);
    expect(output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.listOfStrings,
        isNull);
    expect(output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.listOfStructs,
        isNull);
    expect(output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.long, isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.mapOfListsOfStrings,
        isNull);
    expect(output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.mapOfMaps,
        isNull);
    expect(output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.mapOfStrings,
        isNull);
    expect(output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.mapOfStructs,
        isNull);
    expect(output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.recursiveList,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.blob,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.boolean,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.doubleValue,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.emptyStruct,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.float,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.httpdateTimestamp,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.integer,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.iso8601Timestamp,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.jsonValue,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.listOfLists,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.listOfMapsOfStrings,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.listOfStrings,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.listOfStructs,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.long,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.mapOfListsOfStrings,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.mapOfMaps,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.mapOfStrings,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.mapOfStructs,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.recursiveList,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.recursiveMap,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.recursiveStruct,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.simpleStruct,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.string,
        "value");
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.structWithJsonName,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.timestamp,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']
            ?.recursiveMap?['key-3']?.unixTimestamp,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.recursiveStruct,
        isNull);
    expect(output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.simpleStruct,
        isNull);
    expect(
        output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.string, isNull);
    expect(
        output
            .recursiveMap?['key-1']?.recursiveMap?['key-2']?.structWithJsonName,
        isNull);
    expect(output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.timestamp,
        isNull);
    expect(output.recursiveMap?['key-1']?.recursiveMap?['key-2']?.unixTimestamp,
        isNull);
    expect(output.recursiveMap?['key-1']?.recursiveStruct, isNull);
    expect(output.recursiveMap?['key-1']?.simpleStruct, isNull);
    expect(output.recursiveMap?['key-1']?.string, isNull);
    expect(output.recursiveMap?['key-1']?.structWithJsonName, isNull);
    expect(output.recursiveMap?['key-1']?.timestamp, isNull);
    expect(output.recursiveMap?['key-1']?.unixTimestamp, isNull);
    expect(output.recursiveStruct, isNull);
    expect(output.simpleStruct, isNull);
    expect(output.string, isNull);
    expect(output.structWithJsonName, isNull);
    expect(output.timestamp, isNull);
    expect(output.unixTimestamp, isNull);
  });

  test('parses_the_request_id_from_the_response', () async {
    final client = MockClient((request) async {
      return Response(r'''{}''', 200,
          headers: {
            "X-Amzn-Requestid": "amazon-uniq-request-id",
            "Content-Type": "application/x-amz-json-1.1"
          });
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.kitchenSinkOperation();
    expect(output, isNull);
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');
}
