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
  test('RestJsonClientPopulatesDefaultValuesInInput', () async {
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
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/OperationWithDefaults'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.operationWithDefaults(
      defaults: Defaults(),
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('RestJsonClientSkipsTopLevelDefaultValuesInInput', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/OperationWithDefaults'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.operationWithDefaults();
  });

  test('RestJsonClientUsesExplicitlyProvidedMemberValuesOverDefaults',
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
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/OperationWithDefaults'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.operationWithDefaults(
      defaults: Defaults(
        defaultBlob: Uint8List.fromList('hi'.codeUnits),
        defaultBoolean: true,
        defaultByte: 2,
        defaultDocumentBoolean: true,
        defaultDocumentList: ["b"],
        defaultDocumentMap: {"name": "Jack"},
        defaultDocumentString: "bye",
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
        defaultNullDocument: "notNull",
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

  test('RestJsonClientUsesExplicitlyProvidedValuesInTopLevel', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "topLevelDefault": "hi",
    "otherTopLevelDefault": 0
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/OperationWithDefaults'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.operationWithDefaults(
      otherTopLevelDefault: 0,
      topLevelDefault: "hi",
    );
  });

  test('RestJsonClientIgnoresNonTopLevelDefaultsOnMembersWithClientOptional',
      () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "clientOptionalDefaults": {}
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/OperationWithDefaults'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.operationWithDefaults(
      clientOptionalDefaults: ClientOptionalDefaults(),
    );
  });

  test('RestJsonClientPopulatesDefaultsValuesWhenMissingInResponse', () async {
    final client = MockClient((request) async {
      return Response(r'''{}''', 200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.operationWithDefaults();
    expect(output.defaultBlob, utf8.encode('abc'));
    expect(output.defaultBoolean, true);
    expect(output.defaultByte, 1);
    expect(output.defaultDocumentBoolean, true);
    expect(output.defaultDocumentList, []);
    expect(output.defaultDocumentMap, {});
    expect(output.defaultDocumentString, "hi");
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
  }, skip: r'''@default not implemented''');

  test('RestJsonClientIgnoresDefaultValuesIfMemberValuesArePresentInResponse',
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
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.operationWithDefaults();
    expect(output.defaultBlob, utf8.encode('hi'));
    expect(output.defaultBoolean, false);
    expect(output.defaultByte, 2);
    expect(output.defaultDocumentBoolean, false);
    expect(output.defaultDocumentList, ["b"]);
    expect(output.defaultDocumentMap, {"name": "Jack"});
    expect(output.defaultDocumentString, "bye");
    expect(output.defaultDouble, 2.0);
    expect(output.defaultEnum, TestEnum.bar);
    expect(output.defaultFloat, 2.0);
    expect(output.defaultIntEnum, 2);
    expect(output.defaultInteger, 20);
    expect(output.defaultList?[0], "a");
    expect(output.defaultLong, 200);
    expect(output.defaultMap?['name'], "Jack");
    expect(output.defaultNullDocument, "notNull");
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
}
