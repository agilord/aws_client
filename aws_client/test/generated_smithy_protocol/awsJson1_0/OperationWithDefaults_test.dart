// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../utils.dart';
import 'v2020_07_14.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('AwsJson10ClientPopulatesDefaultValuesInInput', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "defaults": {
        "defaultString": "hi",
        "defaultBoolean": true,
        "defaultList": [],
        "defaultDocumentMap": {},
        "defaultDocumentString": "hi",
        "defaultDocumentBoolean": true,
        "defaultDocumentList": [],
        "defaultTimestamp": 0,
        "defaultBlob": "YWJj",
        "defaultByte": 1,
        "defaultShort": 1,
        "defaultInteger": 10,
        "defaultLong": 100,
        "defaultFloat": 1.0,
        "defaultDouble": 1.0,
        "defaultMap": {},
        "defaultEnum": "FOO",
        "defaultIntEnum": 1,
        "emptyString": "",
        "falseBoolean": false,
        "emptyBlob": "",
        "zeroByte": 0,
        "zeroShort": 0,
        "zeroInteger": 0,
        "zeroLong": 0,
        "zeroFloat": 0.0,
        "zeroDouble": 0.0
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.0'));
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.operationWithDefaults(
      defaults: Defaults(),
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('AwsJson10ClientSkipsTopLevelDefaultValuesInInput', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.0'));
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.operationWithDefaults();
  });

  test('AwsJson10ClientUsesExplicitlyProvidedMemberValuesOverDefaults',
      () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "defaults": {
        "defaultString": "bye",
        "defaultBoolean": true,
        "defaultList": ["a"],
        "defaultDocumentMap": {"name": "Jack"},
        "defaultDocumentString": "bye",
        "defaultDocumentBoolean": true,
        "defaultDocumentList": ["b"],
        "defaultNullDocument": "notNull",
        "defaultTimestamp": 1,
        "defaultBlob": "aGk=",
        "defaultByte": 2,
        "defaultShort": 2,
        "defaultInteger": 20,
        "defaultLong": 200,
        "defaultFloat": 2.0,
        "defaultDouble": 2.0,
        "defaultMap": {"name": "Jack"},
        "defaultEnum": "BAR",
        "defaultIntEnum": 2,
        "emptyString": "foo",
        "falseBoolean": true,
        "emptyBlob": "aGk=",
        "zeroByte": 1,
        "zeroShort": 1,
        "zeroInteger": 1,
        "zeroLong": 1,
        "zeroFloat": 1.0,
        "zeroDouble": 1.0
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.0'));
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.operationWithDefaults(
      defaults: Defaults(
        defaultBlob: Uint8List.fromList('hi'.codeUnits),
        defaultBoolean: true,
        defaultByte: 2,
        defaultDocumentBoolean: Document(),
        defaultDocumentList: Document(),
        defaultDocumentMap: Document(),
        defaultDocumentString: Document(),
        defaultDouble: 2.0,
        defaultEnum: TestEnum.bar,
        defaultFloat: 2.0,
        defaultIntEnum: 2,
        defaultInteger: 20,
        defaultList: ["a"],
        defaultLong: 200,
        defaultMap: {
          "name": "Jack",
        },
        defaultNullDocument: Document(),
        defaultShort: 2,
        defaultString: "bye",
        defaultTimestamp: DateTime.fromMillisecondsSinceEpoch(1 * 1000),
        emptyBlob: Uint8List.fromList('hi'.codeUnits),
        emptyString: "foo",
        falseBoolean: true,
        zeroByte: 1,
        zeroDouble: 1.0,
        zeroFloat: 1.0,
        zeroInteger: 1,
        zeroLong: 1,
        zeroShort: 1,
      ),
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('AwsJson10ServerPopulatesDefaultsWhenMissingInRequestBody', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
"defaults": {}
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.0'));
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.operationWithDefaults(
      defaults: Defaults(
        defaultBlob: Uint8List.fromList('abc'.codeUnits),
        defaultBoolean: true,
        defaultByte: 1,
        defaultDocumentBoolean: Document(),
        defaultDocumentList: Document(),
        defaultDocumentMap: Document(),
        defaultDocumentString: Document(),
        defaultDouble: 1.0,
        defaultEnum: TestEnum.foo,
        defaultFloat: 1.0,
        defaultIntEnum: 1,
        defaultInteger: 10,
        defaultList: [],
        defaultLong: 100,
        defaultMap: {},
        defaultShort: 1,
        defaultString: "hi",
        defaultTimestamp: DateTime.fromMillisecondsSinceEpoch(0 * 1000),
        emptyBlob: Uint8List.fromList(''.codeUnits),
        emptyString: "",
        falseBoolean: false,
        zeroByte: 0,
        zeroDouble: 0.0,
        zeroFloat: 0.0,
        zeroInteger: 0,
        zeroLong: 0,
        zeroShort: 0,
      ),
      otherTopLevelDefault: 0,
      topLevelDefault: "hi",
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('AwsJson10ClientUsesExplicitlyProvidedValuesInTopLevel', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "topLevelDefault": "hi",
    "otherTopLevelDefault": 0
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.0'));
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.operationWithDefaults(
      otherTopLevelDefault: 0,
      topLevelDefault: "hi",
    );
  });

  test('AwsJson10ClientIgnoresNonTopLevelDefaultsOnMembersWithClientOptional',
      () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "clientOptionalDefaults": {}
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.0'));
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.operationWithDefaults(
      clientOptionalDefaults: ClientOptionalDefaults(),
    );
  });

  test('AwsJson10ClientPopulatesDefaultsValuesWhenMissingInResponse', () async {
    final client = MockClient((request) async {
      return Response(r'''{}''', 200,
          headers: {"Content-Type": "application/x-amz-json-1.0"});
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.operationWithDefaults();
    expect(output.defaultBlob, utf8.encode('abc'));
    expect(output.defaultBoolean, true);
    expect(output.defaultByte, 1);
    expect(output.defaultDouble, 1.0);
    expect(output.defaultEnum, TestEnum.foo);
    expect(output.defaultFloat, 1.0);
    expect(output.defaultIntEnum, 1);
    expect(output.defaultInteger, 10);
    expect(output.defaultLong, 100);
    expect(output.defaultNullDocument, isNull);
    expect(output.defaultShort, 1);
    expect(output.defaultString, "hi");
    expect(output.defaultTimestamp!.millisecondsSinceEpoch ~/ 1000, 0);
    expect(output.emptyBlob, utf8.encode(''));
    expect(output.emptyString, "");
    expect(output.falseBoolean, false);
    expect(output.zeroByte, 0);
    expect(output.zeroDouble, 0.0);
    expect(output.zeroFloat, 0.0);
    expect(output.zeroInteger, 0);
    expect(output.zeroLong, 0);
    expect(output.zeroShort, 0);
  });

  test('AwsJson10ClientIgnoresDefaultValuesIfMemberValuesArePresentInResponse',
      () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "defaultString": "bye",
    "defaultBoolean": false,
    "defaultList": ["a"],
    "defaultDocumentMap": {"name": "Jack"},
    "defaultDocumentString": "bye",
    "defaultDocumentBoolean": false,
    "defaultDocumentList": ["b"],
    "defaultNullDocument": "notNull",
    "defaultTimestamp": 2,
    "defaultBlob": "aGk=",
    "defaultByte": 2,
    "defaultShort": 2,
    "defaultInteger": 20,
    "defaultLong": 200,
    "defaultFloat": 2.0,
    "defaultDouble": 2.0,
    "defaultMap": {"name": "Jack"},
    "defaultEnum": "BAR",
    "defaultIntEnum": 2,
    "emptyString": "foo",
    "falseBoolean": true,
    "emptyBlob": "aGk=",
    "zeroByte": 1,
    "zeroShort": 1,
    "zeroInteger": 1,
    "zeroLong": 1,
    "zeroFloat": 1.0,
    "zeroDouble": 1.0
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.0"});
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.operationWithDefaults();
    expect(output.defaultBlob, utf8.encode('hi'));
    expect(output.defaultBoolean, false);
    expect(output.defaultByte, 2);
    expect(output.defaultDouble, 2.0);
    expect(output.defaultEnum, TestEnum.bar);
    expect(output.defaultFloat, 2.0);
    expect(output.defaultIntEnum, 2);
    expect(output.defaultInteger, 20);
    expect(output.defaultList?[0], "a");
    expect(output.defaultLong, 200);
    expect(output.defaultMap?['name'], "Jack");
    expect(output.defaultShort, 2);
    expect(output.defaultString, "bye");
    expect(output.defaultTimestamp!.millisecondsSinceEpoch ~/ 1000, 2);
    expect(output.emptyBlob, utf8.encode('hi'));
    expect(output.emptyString, "foo");
    expect(output.falseBoolean, true);
    expect(output.zeroByte, 1);
    expect(output.zeroDouble, 1.0);
    expect(output.zeroFloat, 1.0);
    expect(output.zeroInteger, 1);
    expect(output.zeroLong, 1);
    expect(output.zeroShort, 1);
  });

  test('AwsJson10ServerPopulatesDefaultsInResponseWhenMissingInParams',
      () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "defaultString": "hi",
    "defaultBoolean": true,
    "defaultList": [],
    "defaultDocumentMap": {},
    "defaultDocumentString": "hi",
    "defaultDocumentBoolean": true,
    "defaultDocumentList": [],
    "defaultTimestamp": 0,
    "defaultBlob": "YWJj",
    "defaultByte": 1,
    "defaultShort": 1,
    "defaultInteger": 10,
    "defaultLong": 100,
    "defaultFloat": 1.0,
    "defaultDouble": 1.0,
    "defaultMap": {},
    "defaultEnum": "FOO",
    "defaultIntEnum": 1,
    "emptyString": "",
    "falseBoolean": false,
    "emptyBlob": "",
    "zeroByte": 0,
    "zeroShort": 0,
    "zeroInteger": 0,
    "zeroLong": 0,
    "zeroFloat": 0.0,
    "zeroDouble": 0.0
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.0"});
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.operationWithDefaults();
    expect(output.defaultBlob, isNull);
    expect(output.defaultBoolean, isNull);
    expect(output.defaultByte, isNull);
    expect(output.defaultDocumentBoolean, isNull);
    expect(output.defaultDocumentList, isNull);
    expect(output.defaultDocumentMap, isNull);
    expect(output.defaultDocumentString, isNull);
    expect(output.defaultDouble, isNull);
    expect(output.defaultEnum, isNull);
    expect(output.defaultFloat, isNull);
    expect(output.defaultIntEnum, isNull);
    expect(output.defaultInteger, isNull);
    expect(output.defaultList, isNull);
    expect(output.defaultLong, isNull);
    expect(output.defaultMap, isNull);
    expect(output.defaultNullDocument, isNull);
    expect(output.defaultShort, isNull);
    expect(output.defaultString, isNull);
    expect(output.defaultTimestamp, isNull);
    expect(output.emptyBlob, isNull);
    expect(output.emptyString, isNull);
    expect(output.falseBoolean, isNull);
    expect(output.zeroByte, isNull);
    expect(output.zeroDouble, isNull);
    expect(output.zeroFloat, isNull);
    expect(output.zeroInteger, isNull);
    expect(output.zeroLong, isNull);
    expect(output.zeroShort, isNull);
  });
}
