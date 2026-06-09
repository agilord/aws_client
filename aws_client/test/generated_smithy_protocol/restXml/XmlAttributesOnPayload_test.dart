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
  test('XmlAttributesOnPayload', () async {
    final client = MockClient((request) async {
      expect(
          request.body, equalsXml(r'''<XmlAttributesPayloadRequest test="test">
    <foo>hi</foo>
</XmlAttributesPayloadRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/XmlAttributesOnPayload'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.xmlAttributesOnPayload(
      payload: XmlAttributesPayloadRequest(
        attr: "test",
        foo: "hi",
      ),
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('XmlAttributesOnPayload', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlAttributesPayloadResponse test="test">
    <foo>hi</foo>
</XmlAttributesPayloadResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlAttributesOnPayload();
    expect(output.payload?.attr, "test");
    expect(output.payload?.foo, "hi");
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');
}
