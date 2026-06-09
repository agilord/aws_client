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
  test('RestJsonRecursiveShapes', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "nested": {
        "foo": "Foo1",
        "nested": {
            "bar": "Bar1",
            "recursiveMember": {
                "foo": "Foo2",
                "nested": {
                    "bar": "Bar2"
                }
            }
        }
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/RecursiveShapes'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
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

  test('RestJsonRecursiveShapes', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "nested": {
        "foo": "Foo1",
        "nested": {
            "bar": "Bar1",
            "recursiveMember": {
                "foo": "Foo2",
                "nested": {
                    "bar": "Bar2"
                }
            }
        }
    }
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
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
