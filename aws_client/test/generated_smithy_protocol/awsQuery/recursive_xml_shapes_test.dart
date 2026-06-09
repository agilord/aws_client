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
  test('QueryRecursiveShapes', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<RecursiveXmlShapesResponse xmlns="https://example.com/">
    <RecursiveXmlShapesResult>
        <nested>
            <foo>Foo1</foo>
            <nested>
                <bar>Bar1</bar>
                <recursiveMember>
                    <foo>Foo2</foo>
                    <nested>
                        <bar>Bar2</bar>
                    </nested>
                </recursiveMember>
            </nested>
        </nested>
    </RecursiveXmlShapesResult>
</RecursiveXmlShapesResponse>
''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.recursiveXmlShapes();
    expect(output.nested?.foo, "Foo1");
    expect(output.nested?.nested?.bar, "Bar1");
    expect(output.nested?.nested?.recursiveMember?.foo, "Foo2");
    expect(output.nested?.nested?.recursiveMember?.nested?.bar, "Bar2");
    expect(output.nested?.nested?.recursiveMember?.nested?.recursiveMember,
        isNull);
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');
}
