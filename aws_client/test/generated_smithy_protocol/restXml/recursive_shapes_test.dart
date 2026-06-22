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
  test('RecursiveShapes', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<RecursiveShapesRequest>
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
</RecursiveShapesRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/RecursiveShapes'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.recursiveShapes(
      nested: RecursiveShapesInputOutputNested1(
        foo: "Foo1",
        nested: RecursiveShapesInputOutputNested2(
          bar: "Bar1",
          recursiveMember: RecursiveShapesInputOutputNested1(
            foo: "Foo2",
            nested: RecursiveShapesInputOutputNested2(
              bar: "Bar2",
            ),
          ),
        ),
      ),
    );
  });

  test('RecursiveShapes', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<RecursiveShapesResponse>
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
</RecursiveShapesResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.recursiveShapes();
    expect(output.nested?.foo, "Foo1");
    expect(output.nested?.nested?.bar, "Bar1");
    expect(output.nested?.nested?.recursiveMember?.foo, "Foo2");
    expect(output.nested?.nested?.recursiveMember?.nested?.bar, "Bar2");
    expect(output.nested?.nested?.recursiveMember?.nested?.recursiveMember,
        isNull);
  });
}
