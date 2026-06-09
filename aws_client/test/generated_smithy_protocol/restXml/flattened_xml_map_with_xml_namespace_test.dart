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
  test('RestXmlFlattenedXmlMapWithXmlNamespace', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<FlattenedXmlMapWithXmlNamespaceOutput>
    <KVP xmlns="https://the-member.example.com">
        <K xmlns="https://the-key.example.com">a</K>
        <V xmlns="https://the-value.example.com">A</V>
    </KVP>
    <KVP xmlns="https://the-member.example.com">
        <K xmlns="https://the-key.example.com">b</K>
        <V xmlns="https://the-value.example.com">B</V>
    </KVP>
</FlattenedXmlMapWithXmlNamespaceOutput>''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.flattenedXmlMapWithXmlNamespace();
    expect(output.myMap?['a'], "A");
    expect(output.myMap?['b'], "B");
  });
}
