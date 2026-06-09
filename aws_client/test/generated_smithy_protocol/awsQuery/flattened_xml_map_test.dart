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
  test('QueryQueryFlattenedXmlMap', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<FlattenedXmlMapResponse xmlns="https://example.com/">
    <FlattenedXmlMapResult>
        <myMap>
            <key>foo</key>
            <value>Foo</value>
        </myMap>
        <myMap>
            <key>baz</key>
            <value>Baz</value>
        </myMap>
    </FlattenedXmlMapResult>
</FlattenedXmlMapResponse>''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.flattenedXmlMap();
    expect(output.myMap?['foo'], FooEnum.foo);
    expect(output.myMap?['baz'], FooEnum.baz);
  });
}
