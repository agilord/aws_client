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
  test('QueryQueryXmlMapsXmlName', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlMapsXmlNameResponse xmlns="https://example.com/">
    <XmlMapsXmlNameResult>
        <myMap>
            <entry>
                <Attribute>foo</Attribute>
                <Setting>
                    <hi>there</hi>
                </Setting>
            </entry>
            <entry>
                <Attribute>baz</Attribute>
                <Setting>
                    <hi>bye</hi>
                </Setting>
            </entry>
        </myMap>
    </XmlMapsXmlNameResult>
</XmlMapsXmlNameResponse>
''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlMapsXmlName();
    expect(output.myMap?['foo']?.hi, "there");
    expect(output.myMap?['baz']?.hi, "bye");
  });
}
