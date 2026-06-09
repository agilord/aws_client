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
  test('QueryXmlEnums', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlEnumsResponse xmlns="https://example.com/">
    <XmlEnumsResult>
        <fooEnum1>Foo</fooEnum1>
        <fooEnum2>0</fooEnum2>
        <fooEnum3>1</fooEnum3>
        <fooEnumList>
            <member>Foo</member>
            <member>0</member>
        </fooEnumList>
        <fooEnumSet>
            <member>Foo</member>
            <member>0</member>
        </fooEnumSet>
        <fooEnumMap>
            <entry>
                <key>hi</key>
                <value>Foo</value>
            </entry>
            <entry>
                <key>zero</key>
                <value>0</value>
            </entry>
        </fooEnumMap>
    </XmlEnumsResult>
</XmlEnumsResponse>
''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlEnums();
    expect(output.fooEnum1, FooEnum.foo);
    expect(output.fooEnum2, FooEnum.$0);
    expect(output.fooEnum3, FooEnum.$1);
    expect(output.fooEnumList?[0], FooEnum.foo);
    expect(output.fooEnumList?[1], FooEnum.$0);
    expect(output.fooEnumMap?['hi'], FooEnum.foo);
    expect(output.fooEnumMap?['zero'], FooEnum.$0);
    expect(output.fooEnumSet?[0], FooEnum.foo);
    expect(output.fooEnumSet?[1], FooEnum.$0);
  });
}
