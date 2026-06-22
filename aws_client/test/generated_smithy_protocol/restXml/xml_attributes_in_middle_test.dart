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
  test('XmlAttributesInMiddle', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsXml(
              r'''<XmlAttributesInMiddlePayloadRequest test="attributeValue">
    <foo>Foo</foo>
    <baz>Baz</baz>
</XmlAttributesInMiddlePayloadRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/XmlAttributesInMiddle'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.xmlAttributesInMiddle(
      payload: XmlAttributesInMiddlePayloadRequest(
        attr: "attributeValue",
        baz: "Baz",
        foo: "Foo",
      ),
    );
  });

  test('XmlAttributesInMiddle', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlAttributesInMiddlePayloadResponse test="attributeValue">
    <foo>Foo</foo>
    <baz>Baz</baz>
</XmlAttributesInMiddlePayloadResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlAttributesInMiddle();
    expect(output.payload?.attr, "attributeValue");
    expect(output.payload?.baz, "Baz");
    expect(output.payload?.foo, "Foo");
  });
}
