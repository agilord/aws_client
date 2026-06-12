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
  test('QueryXmlNamespaces', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlNamespacesResponse xmlns="https://example.com/">
    <XmlNamespacesResult>
        <nested>
            <foo xmlns:baz="http://baz.com">Foo</foo>
            <values xmlns="http://qux.com">
                <member xmlns="http://bux.com">Bar</member>
                <member xmlns="http://bux.com">Baz</member>
            </values>
        </nested>
    </XmlNamespacesResult>
</XmlNamespacesResponse>
''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlNamespaces();
    expect(output.nested?.foo, "Foo");
    expect(output.nested?.values?[0], "Bar");
    expect(output.nested?.values?[1], "Baz");
  });
}
