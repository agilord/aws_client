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
  test('XmlNamespaces', () async {
    final client = MockClient((request) async {
      expect(request.body,
          equalsXml(r'''<XmlNamespacesRequest xmlns="http://foo.com">
    <nested>
        <foo xmlns:baz="http://baz.com">Foo</foo>
        <values xmlns="http://qux.com">
            <member xmlns="http://bux.com">Bar</member>
            <member xmlns="http://bux.com">Baz</member>
        </values>
    </nested>
</XmlNamespacesRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/XmlNamespaces'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.xmlNamespaces(
      nested: XmlNamespaceNested(
        foo: "Foo",
        values: ["Bar", "Baz"],
      ),
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('XmlNamespaces', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlNamespacesResponse xmlns="http://foo.com">
    <nested>
        <foo xmlns:baz="http://baz.com">Foo</foo>
        <values xmlns="http://qux.com">
            <member xmlns="http://bux.com">Bar</member>
            <member xmlns="http://bux.com">Baz</member>
        </values>
    </nested>
</XmlNamespacesResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlNamespaces();
    expect(output.nested?.foo, "Foo");
    expect(output.nested?.values?[0], "Bar");
    expect(output.nested?.values?[1], "Baz");
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');
}
