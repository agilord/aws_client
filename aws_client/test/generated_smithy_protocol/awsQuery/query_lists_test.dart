// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../utils.dart';
import 'v2020_01_08.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('QueryLists', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=QueryLists&Version=2020-01-08&ListArg.member.1=foo&ListArg.member.2=bar&ListArg.member.3=baz&ComplexListArg.member.1.hi=hello&ComplexListArg.member.2.hi=hola'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-www-form-urlencoded'));
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.queryLists(
      complexListArg: [
        GreetingStruct(
          hi: "hello",
        ),
        GreetingStruct(
          hi: "hola",
        )
      ],
      listArg: ["foo", "bar", "baz"],
    );
  });

  test('EmptyQueryLists', () async {
    final client = MockClient((request) async {
      expect(request.body,
          equalsQuery(r'''Action=QueryLists&Version=2020-01-08&ListArg='''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-www-form-urlencoded'));
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.queryLists(
      listArg: [],
    );
  });

  test('FlattenedQueryLists', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=QueryLists&Version=2020-01-08&FlattenedListArg.1=A&FlattenedListArg.2=B'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-www-form-urlencoded'));
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.queryLists(
      flattenedListArg: ["A", "B"],
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('QueryListArgWithXmlNameMember', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=QueryLists&Version=2020-01-08&ListArgWithXmlNameMember.item.1=A&ListArgWithXmlNameMember.item.2=B'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-www-form-urlencoded'));
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.queryLists(
      listArgWithXmlNameMember: ["A", "B"],
    );
  });

  test('QueryFlattenedListArgWithXmlName', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=QueryLists&Version=2020-01-08&Hi.1=A&Hi.2=B'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-www-form-urlencoded'));
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.queryLists(
      flattenedListArgWithXmlName: ["A", "B"],
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('QueryNestedStructWithList', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=QueryLists&Version=2020-01-08&NestedWithList.ListArg.member.1=A&NestedWithList.ListArg.member.2=B'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-www-form-urlencoded'));
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.queryLists(
      nestedWithList: NestedStructWithList(
        listArg: ["A", "B"],
      ),
    );
  });
}
