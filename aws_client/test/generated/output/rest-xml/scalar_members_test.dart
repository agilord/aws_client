// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'scalar_members.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Scalar members 0', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<OperationNameResponse><Str>myname</Str><FooNum>123</FooNum><FalseBool>false</FalseBool><TrueBool>true</TrueBool><Float>1.2</Float><Double>1.3</Double><Long>200</Long><Char>a</Char><Timestamp>2015-01-25T08:00:00Z</Timestamp></OperationNameResponse>''',
          200,
          headers: {"ImaHeader": "test", "X-Foo": "abc"});
    });

    final service = ScalarMembers(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    final output = await service.operationName0();
    expect(output.char, "a");
    expect(output.doubleValue, 1.3);
    expect(output.falseBool, false);
    expect(output.float, 1.2);
    expect(output.imaHeader, "test");
    expect(output.imaHeaderLocation, "abc");
    expect(output.long, 200);
    expect(output.num, 123);
    expect(output.str, "myname");
    expect(output.timestamp!.millisecondsSinceEpoch ~/ 1000, 1422172800);
    expect(output.trueBool, true);
/*
{
  "ImaHeader": "test",
  "ImaHeaderLocation": "abc",
  "Str": "myname",
  "Num": 123,
  "FalseBool": false,
  "TrueBool": true,
  "Float": 1.2,
  "Double": 1.3,
  "Long": 200,
  "Char": "a",
  "Timestamp": 1422172800
}
*/
  });

  test('Scalar members 1', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<OperationNameResponse><Str></Str><FooNum>123</FooNum><FalseBool>false</FalseBool><TrueBool>true</TrueBool><Float>1.2</Float><Double>1.3</Double><Long>200</Long><Char>a</Char><Timestamp>2015-01-25T08:00:00Z</Timestamp></OperationNameResponse>''',
          200,
          headers: {"ImaHeader": "test", "X-Foo": "abc"});
    });

    final service = ScalarMembers(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    final output = await service.operationName1();
    expect(output.char, "a");
    expect(output.doubleValue, 1.3);
    expect(output.falseBool, false);
    expect(output.float, 1.2);
    expect(output.imaHeader, "test");
    expect(output.imaHeaderLocation, "abc");
    expect(output.long, 200);
    expect(output.num, 123);
    expect(output.str, "");
    expect(output.timestamp!.millisecondsSinceEpoch ~/ 1000, 1422172800);
    expect(output.trueBool, true);
/*
{
  "ImaHeader": "test",
  "ImaHeaderLocation": "abc",
  "Str": "",
  "Num": 123,
  "FalseBool": false,
  "TrueBool": true,
  "Float": 1.2,
  "Double": 1.3,
  "Long": 200,
  "Char": "a",
  "Timestamp": 1422172800
}
*/
  });
}
