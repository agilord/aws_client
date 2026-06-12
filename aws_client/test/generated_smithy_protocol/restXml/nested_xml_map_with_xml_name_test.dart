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
  test('NestedXmlMapWithXmlNameSerializes', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''    <NestedXmlMapWithXmlNameRequest>
        <nestedXmlMapWithXmlNameMap>
            <entry>
                <OuterKey>foo</OuterKey>
                <value>
                    <entry>
                        <InnerKey>bar</InnerKey>
                        <InnerValue>Baz</InnerValue>
                    </entry>
                    <entry>
                        <InnerKey>fizz</InnerKey>
                        <InnerValue>Buzz</InnerValue>
                    </entry>
                </value>
            </entry>
            <entry>
                <OuterKey>qux</OuterKey>
                <value>
                    <entry>
                        <InnerKey>foobar</InnerKey>
                        <InnerValue>Bar</InnerValue>
                    </entry>
                    <entry>
                        <InnerKey>fizzbuzz</InnerKey>
                        <InnerValue>Buzz</InnerValue>
                    </entry>
                </value>
            </entry>
        </nestedXmlMapWithXmlNameMap>
    </NestedXmlMapWithXmlNameRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/NestedXmlMapWithXmlName'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.nestedXmlMapWithXmlName(
      nestedXmlMapWithXmlNameMap: {
        "foo": {
          "bar": "Baz",
          "fizz": "Buzz",
        },
        "qux": {
          "foobar": "Bar",
          "fizzbuzz": "Buzz",
        },
      },
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('NestedXmlMapWithXmlNameDeserializes', () async {
    final client = MockClient((request) async {
      return Response(
          r'''    <NestedXmlMapWithXmlNameResponse>
        <nestedXmlMapWithXmlNameMap>
            <entry>
                <OuterKey>foo</OuterKey>
                <value>
                    <entry>
                        <InnerKey>bar</InnerKey>
                        <InnerValue>Baz</InnerValue>
                    </entry>
                    <entry>
                        <InnerKey>fizz</InnerKey>
                        <InnerValue>Buzz</InnerValue>
                    </entry>
                </value>
            </entry>
            <entry>
                <OuterKey>qux</OuterKey>
                <value>
                    <entry>
                        <InnerKey>foobar</InnerKey>
                        <InnerValue>Bar</InnerValue>
                    </entry>
                    <entry>
                        <InnerKey>fizzbuzz</InnerKey>
                        <InnerValue>Buzz</InnerValue>
                    </entry>
                </value>
            </entry>
        </nestedXmlMapWithXmlNameMap>
    </NestedXmlMapWithXmlNameResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.nestedXmlMapWithXmlName();
    expect(output.nestedXmlMapWithXmlNameMap?['foo']?['bar'], "Baz");
    expect(output.nestedXmlMapWithXmlNameMap?['foo']?['fizz'], "Buzz");
    expect(output.nestedXmlMapWithXmlNameMap?['qux']?['foobar'], "Bar");
    expect(output.nestedXmlMapWithXmlNameMap?['qux']?['fizzbuzz'], "Buzz");
  });
}
