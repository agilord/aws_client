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
  test('QueryXmlMaps', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlMapsResponse xmlns="https://example.com/">
    <XmlMapsResult>
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
    </XmlMapsResult>
</XmlMapsResponse>
''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlMaps();
    expect(output.myMap?['foo']?.hi, "there");
    expect(output.myMap?['baz']?.hi, "bye");
  });
}
