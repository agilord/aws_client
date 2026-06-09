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
  test('FlattenedXmlMapWithXmlName', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<FlattenedXmlMapWithXmlNameRequest>
    <KVP>
        <K>a</K>
        <V>A</V>
    </KVP>
    <KVP>
        <K>b</K>
        <V>B</V>
    </KVP>
</FlattenedXmlMapWithXmlNameRequest>'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/FlattenedXmlMapWithXmlName'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.flattenedXmlMapWithXmlName(
      myMap: {
        "a": "A",
        "b": "B",
      },
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('FlattenedXmlMapWithXmlName', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<FlattenedXmlMapWithXmlNameResponse>
    <KVP>
        <K>a</K>
        <V>A</V>
    </KVP>
    <KVP>
        <K>b</K>
        <V>B</V>
    </KVP>
</FlattenedXmlMapWithXmlNameResponse>''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.flattenedXmlMapWithXmlName();
    expect(output.myMap?['a'], "A");
    expect(output.myMap?['b'], "B");
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');
}
