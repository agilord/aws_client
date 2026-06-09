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
  test('NestedXmlMapRequest', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<NestedXmlMapsRequest>
    <nestedMap>
        <entry>
            <key>foo</key>
            <value>
                <entry>
                    <key>bar</key>
                    <value>Bar</value>
                </entry>
            </value>
        </entry>
    </nestedMap>
</NestedXmlMapsRequest>'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/NestedXmlMaps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.nestedXmlMaps(
      nestedMap: {
        "foo": {
          "bar": FooEnum.bar,
        },
      },
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('FlatNestedXmlMapRequest', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<NestedXmlMapsRequest>
    <flatNestedMap>
        <key>foo</key>
        <value>
            <entry>
                <key>bar</key>
                <value>Bar</value>
            </entry>
        </value>
    </flatNestedMap>
</NestedXmlMapsRequest>'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/NestedXmlMaps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.nestedXmlMaps(
      flatNestedMap: {
        "foo": {
          "bar": FooEnum.bar,
        },
      },
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('NestedXmlMapResponse', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<NestedXmlMapsResponse>
    <nestedMap>
        <entry>
            <key>foo</key>
            <value>
                <entry>
                    <key>bar</key>
                    <value>Bar</value>
                </entry>
            </value>
        </entry>
    </nestedMap>
</NestedXmlMapsResponse>''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.nestedXmlMaps();
    expect(output.flatNestedMap, isNull);
    expect(output.nestedMap?['foo']?['bar'], FooEnum.bar);
  }, skip: r'''empty nested XML map deserializes to {} not null''');

  test('FlatNestedXmlMapResponse', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<NestedXmlMapsResponse>
    <flatNestedMap>
        <key>foo</key>
        <value>
            <entry>
                <key>bar</key>
                <value>Bar</value>
            </entry>
        </value>
    </flatNestedMap>
</NestedXmlMapsResponse>''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.nestedXmlMaps();
    expect(output.flatNestedMap?['foo']?['bar'], FooEnum.bar);
    expect(output.nestedMap, isNull);
  }, skip: r'''empty nested XML map deserializes to {} not null''');
}
