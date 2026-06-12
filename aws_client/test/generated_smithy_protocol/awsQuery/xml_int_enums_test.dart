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
  test('QueryXmlIntEnums', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlIntEnumsResponse xmlns="https://example.com/">
    <XmlIntEnumsResult>
        <intEnum1>1</intEnum1>
        <intEnum2>2</intEnum2>
        <intEnum3>3</intEnum3>
        <intEnumList>
            <member>1</member>
            <member>2</member>
        </intEnumList>
        <intEnumSet>
            <member>1</member>
            <member>2</member>
        </intEnumSet>
        <intEnumMap>
            <entry>
                <key>a</key>
                <value>1</value>
            </entry>
            <entry>
                <key>b</key>
                <value>2</value>
            </entry>
        </intEnumMap>
    </XmlIntEnumsResult>
</XmlIntEnumsResponse>
''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlIntEnums();
    expect(output.intEnum1, 1);
    expect(output.intEnum2, 2);
    expect(output.intEnum3, 3);
    expect(output.intEnumList?[0], 1);
    expect(output.intEnumList?[1], 2);
    expect(output.intEnumMap?['a'], 1);
    expect(output.intEnumMap?['b'], 2);
    expect(output.intEnumSet?[0], 1);
    expect(output.intEnumSet?[1], 2);
  });
}
