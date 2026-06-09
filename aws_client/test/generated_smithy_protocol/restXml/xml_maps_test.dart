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
  test('XmlMaps', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<XmlMapsRequest>
    <myMap>
        <entry>
            <key>foo</key>
            <value>
                <hi>there</hi>
            </value>
        </entry>
        <entry>
            <key>baz</key>
            <value>
                <hi>bye</hi>
            </value>
        </entry>
    </myMap>
</XmlMapsRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/XmlMaps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.xmlMaps(
      myMap: {
        "foo": GreetingStruct(
          hi: "there",
        ),
        "baz": GreetingStruct(
          hi: "bye",
        ),
      },
    );
  });

  test('XmlMaps', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlMapsResponse>
    <myMap>
        <entry>
            <key>foo</key>
            <value>
                <hi>there</hi>
            </value>
        </entry>
        <entry>
            <key>baz</key>
            <value>
                <hi>bye</hi>
            </value>
        </entry>
    </myMap>
</XmlMapsResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlMaps();
    expect(output.myMap?['foo']?.hi, "there");
    expect(output.myMap?['baz']?.hi, "bye");
  });
}
