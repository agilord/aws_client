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
  test('InputAndOutputWithStringHeaders', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.headers['X-String'], 'Hello');
      expect(request.headers['X-StringList'], 'a, b, c');
      expect(request.headers['X-StringSet'], 'a, b, c');
      expect(request.url, equalsPathAndQuery('/InputAndOutputWithHeaders'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.inputAndOutputWithHeaders(
      headerString: "Hello",
      headerStringList: ["a", "b", "c"],
      headerStringSet: ["a", "b", "c"],
    );
  });

  test('InputAndOutputWithNumericHeaders', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.headers['X-Byte'], '1');
      expect(request.headers['X-Short'], '123');
      expect(request.headers['X-Integer'], '123');
      expect(request.headers['X-Long'], '123');
      expect(request.headers['X-Float'], '1.1');
      expect(request.headers['X-Double'], '1.1');
      expect(request.headers['X-IntegerList'], '1, 2, 3');
      expect(request.url, equalsPathAndQuery('/InputAndOutputWithHeaders'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.inputAndOutputWithHeaders(
      headerByte: 1,
      headerDouble: 1.1,
      headerFloat: 1.1,
      headerInteger: 123,
      headerIntegerList: [1, 2, 3],
      headerLong: 123,
      headerShort: 123,
    );
  });

  test('InputAndOutputWithBooleanHeaders', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.headers['X-Boolean1'], 'true');
      expect(request.headers['X-Boolean2'], 'false');
      expect(request.headers['X-BooleanList'], 'true, false, true');
      expect(request.url, equalsPathAndQuery('/InputAndOutputWithHeaders'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.inputAndOutputWithHeaders(
      headerBooleanList: [true, false, true],
      headerFalseBool: false,
      headerTrueBool: true,
    );
  });

  test('InputAndOutputWithTimestampHeaders', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.headers['X-TimestampList'],
          'Mon, 16 Dec 2019 23:48:18 GMT, Mon, 16 Dec 2019 23:48:18 GMT');
      expect(request.url, equalsPathAndQuery('/InputAndOutputWithHeaders'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.inputAndOutputWithHeaders(
      headerTimestampList: [
        DateTime.fromMillisecondsSinceEpoch(1576540098 * 1000),
        DateTime.fromMillisecondsSinceEpoch(1576540098 * 1000)
      ],
    );
  });

  test('InputAndOutputWithEnumHeaders', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.headers['X-Enum'], 'Foo');
      expect(request.headers['X-EnumList'], 'Foo, Bar, Baz');
      expect(request.url, equalsPathAndQuery('/InputAndOutputWithHeaders'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.inputAndOutputWithHeaders(
      headerEnum: FooEnum.foo,
      headerEnumList: [FooEnum.foo, FooEnum.bar, FooEnum.baz],
    );
  });

  test('RestXmlSupportsNaNFloatHeaderInputs', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.headers['X-Float'], 'NaN');
      expect(request.headers['X-Double'], 'NaN');
      expect(request.url, equalsPathAndQuery('/InputAndOutputWithHeaders'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.inputAndOutputWithHeaders(
      headerDouble: double.nan,
      headerFloat: double.nan,
    );
  });

  test('RestXmlSupportsInfinityFloatHeaderInputs', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.headers['X-Float'], 'Infinity');
      expect(request.headers['X-Double'], 'Infinity');
      expect(request.url, equalsPathAndQuery('/InputAndOutputWithHeaders'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.inputAndOutputWithHeaders(
      headerDouble: double.infinity,
      headerFloat: double.infinity,
    );
  });

  test('RestXmlSupportsNegativeInfinityFloatHeaderInputs', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r''''''));
      expect(request.headers['X-Float'], '-Infinity');
      expect(request.headers['X-Double'], '-Infinity');
      expect(request.url, equalsPathAndQuery('/InputAndOutputWithHeaders'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.inputAndOutputWithHeaders(
      headerDouble: double.negativeInfinity,
      headerFloat: double.negativeInfinity,
    );
  });

  test('InputAndOutputWithStringHeaders', () async {
    final client = MockClient((request) async {
      return Response(r'''''', 200,
          headers: {
            "X-String": "Hello",
            "X-StringList": "a, b, c",
            "X-StringSet": "a, b, c"
          });
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.inputAndOutputWithHeaders();
    expect(output.headerBooleanList, isNull);
    expect(output.headerByte, isNull);
    expect(output.headerDouble, isNull);
    expect(output.headerEnum, isNull);
    expect(output.headerEnumList, isNull);
    expect(output.headerFalseBool, isNull);
    expect(output.headerFloat, isNull);
    expect(output.headerInteger, isNull);
    expect(output.headerIntegerList, isNull);
    expect(output.headerLong, isNull);
    expect(output.headerShort, isNull);
    expect(output.headerString, "Hello");
    expect(output.headerStringList?[0], "a");
    expect(output.headerStringList?[1], "b");
    expect(output.headerStringList?[2], "c");
    expect(output.headerStringSet?[0], "a");
    expect(output.headerStringSet?[1], "b");
    expect(output.headerStringSet?[2], "c");
    expect(output.headerTimestampList, isNull);
    expect(output.headerTrueBool, isNull);
  });

  test('InputAndOutputWithNumericHeaders', () async {
    final client = MockClient((request) async {
      return Response(r'''''', 200,
          headers: {
            "X-Byte": "1",
            "X-Short": "123",
            "X-Integer": "123",
            "X-Long": "123",
            "X-Float": "1.1",
            "X-Double": "1.1",
            "X-IntegerList": "1, 2, 3"
          });
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.inputAndOutputWithHeaders();
    expect(output.headerBooleanList, isNull);
    expect(output.headerByte, 1);
    expect(output.headerDouble, 1.1);
    expect(output.headerEnum, isNull);
    expect(output.headerEnumList, isNull);
    expect(output.headerFalseBool, isNull);
    expect(output.headerFloat, 1.1);
    expect(output.headerInteger, 123);
    expect(output.headerIntegerList?[0], 1);
    expect(output.headerIntegerList?[1], 2);
    expect(output.headerIntegerList?[2], 3);
    expect(output.headerLong, 123);
    expect(output.headerShort, 123);
    expect(output.headerString, isNull);
    expect(output.headerStringList, isNull);
    expect(output.headerStringSet, isNull);
    expect(output.headerTimestampList, isNull);
    expect(output.headerTrueBool, isNull);
  });

  test('InputAndOutputWithBooleanHeaders', () async {
    final client = MockClient((request) async {
      return Response(r'''''', 200,
          headers: {
            "X-Boolean1": "true",
            "X-Boolean2": "false",
            "X-BooleanList": "true, false, true"
          });
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.inputAndOutputWithHeaders();
    expect(output.headerBooleanList?[0], true);
    expect(output.headerBooleanList?[1], false);
    expect(output.headerBooleanList?[2], true);
    expect(output.headerByte, isNull);
    expect(output.headerDouble, isNull);
    expect(output.headerEnum, isNull);
    expect(output.headerEnumList, isNull);
    expect(output.headerFalseBool, false);
    expect(output.headerFloat, isNull);
    expect(output.headerInteger, isNull);
    expect(output.headerIntegerList, isNull);
    expect(output.headerLong, isNull);
    expect(output.headerShort, isNull);
    expect(output.headerString, isNull);
    expect(output.headerStringList, isNull);
    expect(output.headerStringSet, isNull);
    expect(output.headerTimestampList, isNull);
    expect(output.headerTrueBool, true);
  });

  test('InputAndOutputWithTimestampHeaders', () async {
    final client = MockClient((request) async {
      return Response(r'''''', 200,
          headers: {
            "X-TimestampList":
                "Mon, 16 Dec 2019 23:48:18 GMT, Mon, 16 Dec 2019 23:48:18 GMT"
          });
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.inputAndOutputWithHeaders();
    expect(output.headerBooleanList, isNull);
    expect(output.headerByte, isNull);
    expect(output.headerDouble, isNull);
    expect(output.headerEnum, isNull);
    expect(output.headerEnumList, isNull);
    expect(output.headerFalseBool, isNull);
    expect(output.headerFloat, isNull);
    expect(output.headerInteger, isNull);
    expect(output.headerIntegerList, isNull);
    expect(output.headerLong, isNull);
    expect(output.headerShort, isNull);
    expect(output.headerString, isNull);
    expect(output.headerStringList, isNull);
    expect(output.headerStringSet, isNull);
    expect(output.headerTimestampList![0].millisecondsSinceEpoch / 1000,
        1576540098);
    expect(output.headerTimestampList![1].millisecondsSinceEpoch / 1000,
        1576540098);
    expect(output.headerTrueBool, isNull);
  });

  test('InputAndOutputWithEnumHeaders', () async {
    final client = MockClient((request) async {
      return Response(r'''''', 200,
          headers: {"X-Enum": "Foo", "X-EnumList": "Foo, Bar, Baz"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.inputAndOutputWithHeaders();
    expect(output.headerBooleanList, isNull);
    expect(output.headerByte, isNull);
    expect(output.headerDouble, isNull);
    expect(output.headerEnum, FooEnum.foo);
    expect(output.headerEnumList?[0], FooEnum.foo);
    expect(output.headerEnumList?[1], FooEnum.bar);
    expect(output.headerEnumList?[2], FooEnum.baz);
    expect(output.headerFalseBool, isNull);
    expect(output.headerFloat, isNull);
    expect(output.headerInteger, isNull);
    expect(output.headerIntegerList, isNull);
    expect(output.headerLong, isNull);
    expect(output.headerShort, isNull);
    expect(output.headerString, isNull);
    expect(output.headerStringList, isNull);
    expect(output.headerStringSet, isNull);
    expect(output.headerTimestampList, isNull);
    expect(output.headerTrueBool, isNull);
  });

  test('RestXmlSupportsNaNFloatHeaderOutputs', () async {
    final client = MockClient((request) async {
      return Response(r'''''', 200,
          headers: {"X-Float": "NaN", "X-Double": "NaN"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.inputAndOutputWithHeaders();
    expect(output.headerBooleanList, isNull);
    expect(output.headerByte, isNull);
    expect(output.headerDouble, isNaN);
    expect(output.headerEnum, isNull);
    expect(output.headerEnumList, isNull);
    expect(output.headerFalseBool, isNull);
    expect(output.headerFloat, isNaN);
    expect(output.headerInteger, isNull);
    expect(output.headerIntegerList, isNull);
    expect(output.headerLong, isNull);
    expect(output.headerShort, isNull);
    expect(output.headerString, isNull);
    expect(output.headerStringList, isNull);
    expect(output.headerStringSet, isNull);
    expect(output.headerTimestampList, isNull);
    expect(output.headerTrueBool, isNull);
  });

  test('RestXmlSupportsInfinityFloatHeaderOutputs', () async {
    final client = MockClient((request) async {
      return Response(r'''''', 200,
          headers: {"X-Float": "Infinity", "X-Double": "Infinity"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.inputAndOutputWithHeaders();
    expect(output.headerBooleanList, isNull);
    expect(output.headerByte, isNull);
    expect(output.headerDouble, double.infinity);
    expect(output.headerEnum, isNull);
    expect(output.headerEnumList, isNull);
    expect(output.headerFalseBool, isNull);
    expect(output.headerFloat, double.infinity);
    expect(output.headerInteger, isNull);
    expect(output.headerIntegerList, isNull);
    expect(output.headerLong, isNull);
    expect(output.headerShort, isNull);
    expect(output.headerString, isNull);
    expect(output.headerStringList, isNull);
    expect(output.headerStringSet, isNull);
    expect(output.headerTimestampList, isNull);
    expect(output.headerTrueBool, isNull);
  });

  test('RestXmlSupportsNegativeInfinityFloatHeaderOutputs', () async {
    final client = MockClient((request) async {
      return Response(r'''''', 200,
          headers: {"X-Float": "-Infinity", "X-Double": "-Infinity"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.inputAndOutputWithHeaders();
    expect(output.headerBooleanList, isNull);
    expect(output.headerByte, isNull);
    expect(output.headerDouble, double.negativeInfinity);
    expect(output.headerEnum, isNull);
    expect(output.headerEnumList, isNull);
    expect(output.headerFalseBool, isNull);
    expect(output.headerFloat, double.negativeInfinity);
    expect(output.headerInteger, isNull);
    expect(output.headerIntegerList, isNull);
    expect(output.headerLong, isNull);
    expect(output.headerShort, isNull);
    expect(output.headerString, isNull);
    expect(output.headerStringList, isNull);
    expect(output.headerStringSet, isNull);
    expect(output.headerTimestampList, isNull);
    expect(output.headerTrueBool, isNull);
  });
}
