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
  test('QuerySimpleQueryMaps', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=QueryMaps&Version=2020-01-08&MapArg.entry.1.key=bar&MapArg.entry.1.value=Bar&MapArg.entry.2.key=foo&MapArg.entry.2.value=Foo'''));
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

    await service.queryMaps(
      mapArg: {
        "bar": "Bar",
        "foo": "Foo",
      },
    );
  });

  test('QuerySimpleQueryMapsWithXmlName', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=QueryMaps&Version=2020-01-08&Foo.entry.1.key=foo&Foo.entry.1.value=Foo'''));
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

    await service.queryMaps(
      renamedMapArg: {
        "foo": "Foo",
      },
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('QueryComplexQueryMaps', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=QueryMaps&Version=2020-01-08&ComplexMapArg.entry.1.key=bar&ComplexMapArg.entry.1.value.hi=Bar&ComplexMapArg.entry.2.key=foo&ComplexMapArg.entry.2.value.hi=Foo'''));
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

    await service.queryMaps(
      complexMapArg: {
        "bar": GreetingStruct(
          hi: "Bar",
        ),
        "foo": GreetingStruct(
          hi: "Foo",
        ),
      },
    );
  });

  test('QueryEmptyQueryMaps', () async {
    final client = MockClient((request) async {
      expect(request.body,
          equalsQuery(r'''Action=QueryMaps&Version=2020-01-08'''));
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

    await service.queryMaps(
      mapArg: {},
    );
  });

  test('QueryQueryMapWithMemberXmlName', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=QueryMaps&Version=2020-01-08&MapWithXmlMemberName.entry.1.K=bar&MapWithXmlMemberName.entry.1.V=Bar&MapWithXmlMemberName.entry.2.K=foo&MapWithXmlMemberName.entry.2.V=Foo'''));
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

    await service.queryMaps(
      mapWithXmlMemberName: {
        "bar": "Bar",
        "foo": "Foo",
      },
    );
  });

  test('QueryFlattenedQueryMaps', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=QueryMaps&Version=2020-01-08&FlattenedMap.1.key=bar&FlattenedMap.1.value=Bar&FlattenedMap.2.key=foo&FlattenedMap.2.value=Foo'''));
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

    await service.queryMaps(
      flattenedMap: {
        "bar": "Bar",
        "foo": "Foo",
      },
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('QueryFlattenedQueryMapsWithXmlName', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=QueryMaps&Version=2020-01-08&Hi.1.K=bar&Hi.1.V=Bar&Hi.2.K=foo&Hi.2.V=Foo'''));
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

    await service.queryMaps(
      flattenedMapWithXmlName: {
        "bar": "Bar",
        "foo": "Foo",
      },
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('QueryQueryMapOfLists', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=QueryMaps&Version=2020-01-08&MapOfLists.entry.1.key=bar&MapOfLists.entry.1.value.member.1=C&MapOfLists.entry.1.value.member.2=D&MapOfLists.entry.2.key=foo&MapOfLists.entry.2.value.member.1=A&MapOfLists.entry.2.value.member.2=B'''));
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

    await service.queryMaps(
      mapOfLists: {
        "bar": ["C", "D"],
        "foo": ["A", "B"],
      },
    );
  });

  test('QueryNestedStructWithMap', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=QueryMaps&Version=2020-01-08&NestedStructWithMap.MapArg.entry.1.key=bar&NestedStructWithMap.MapArg.entry.1.value=Bar&NestedStructWithMap.MapArg.entry.2.key=foo&NestedStructWithMap.MapArg.entry.2.value=Foo'''));
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

    await service.queryMaps(
      nestedStructWithMap: NestedStructWithMap(
        mapArg: {
          "bar": "Bar",
          "foo": "Foo",
        },
      ),
    );
  });
}
