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
  test('RestJsonLists', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "stringList": [
        "foo",
        "bar"
    ],
    "stringSet": [
        "foo",
        "bar"
    ],
    "integerList": [
        1,
        2
    ],
    "booleanList": [
        true,
        false
    ],
    "timestampList": [
        1398796238,
        1398796238
    ],
    "enumList": [
        "Foo",
        "0"
    ],
    "intEnumList": [
        1,
        2
    ],
    "nestedStringList": [
        [
            "foo",
            "bar"
        ],
        [
            "baz",
            "qux"
        ]
    ],
    "myStructureList": [
        {
            "value": "1",
            "other": "2"
        },
        {
            "value": "3",
            "other": "4"
        }
    ]
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonLists'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonLists(
      booleanList: [true, false],
      enumList: [FooEnum.foo, FooEnum.$0],
      intEnumList: [1, 2],
      integerList: [1, 2],
      nestedStringList: [
        ["foo", "bar"],
        ["baz", "qux"]
      ],
      stringList: ["foo", "bar"],
      stringSet: ["foo", "bar"],
      structureList: [
        StructureListMember(
          a: "1",
          b: "2",
        ),
        StructureListMember(
          a: "3",
          b: "4",
        )
      ],
      timestampList: [
        DateTime.fromMillisecondsSinceEpoch(1398796238 * 1000),
        DateTime.fromMillisecondsSinceEpoch(1398796238 * 1000)
      ],
    );
  });

  test('RestJsonListsEmpty', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "stringList": []
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonLists'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonLists(
      stringList: [],
    );
  });

  test('RestJsonLists', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "stringList": [
        "foo",
        "bar"
    ],
    "stringSet": [
        "foo",
        "bar"
    ],
    "integerList": [
        1,
        2
    ],
    "booleanList": [
        true,
        false
    ],
    "timestampList": [
        1398796238,
        1398796238
    ],
    "enumList": [
        "Foo",
        "0"
    ],
    "intEnumList": [
        1,
        2
    ],
    "nestedStringList": [
        [
            "foo",
            "bar"
        ],
        [
            "baz",
            "qux"
        ]
    ],
    "myStructureList": [
        {
            "value": "1",
            "other": "2"
        },
        {
            "value": "3",
            "other": "4"
        }
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

    final output = await service.jsonLists();
    expect(output.booleanList?[0], true);
    expect(output.booleanList?[1], false);
    expect(output.enumList?[0], FooEnum.foo);
    expect(output.enumList?[1], FooEnum.$0);
    expect(output.intEnumList?[0], 1);
    expect(output.intEnumList?[1], 2);
    expect(output.integerList?[0], 1);
    expect(output.integerList?[1], 2);
    expect(output.nestedStringList?[0][0], "foo");
    expect(output.nestedStringList?[0][1], "bar");
    expect(output.nestedStringList?[1][0], "baz");
    expect(output.nestedStringList?[1][1], "qux");
    expect(output.stringList?[0], "foo");
    expect(output.stringList?[1], "bar");
    expect(output.stringSet?[0], "foo");
    expect(output.stringSet?[1], "bar");
    expect(output.structureList?[0].a, "1");
    expect(output.structureList?[0].b, "2");
    expect(output.structureList?[1].a, "3");
    expect(output.structureList?[1].b, "4");
    expect(output.timestampList![0].millisecondsSinceEpoch / 1000, 1398796238);
    expect(output.timestampList![1].millisecondsSinceEpoch / 1000, 1398796238);
  });

  test('RestJsonListsEmpty', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "stringList": []
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonLists();
    expect(output.booleanList, isNull);
    expect(output.enumList, isNull);
    expect(output.intEnumList, isNull);
    expect(output.integerList, isNull);
    expect(output.nestedStringList, isNull);
    expect(output.stringSet, isNull);
    expect(output.structureList, isNull);
    expect(output.timestampList, isNull);
  });
}
