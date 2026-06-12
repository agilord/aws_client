import 'package:aws_client_generator/builders/library_builder.dart';
import 'package:aws_client_generator/smithy/ast.dart';
import 'package:aws_client_generator/smithy/from_smithy.dart';
import 'package:dart_style/dart_style.dart';
import 'package:test/test.dart';

SmithyModel _model() => SmithyModel.fromJson({
      'smithy': '2.0',
      'shapes': {
        'example#Demo': {
          'type': 'service',
          'version': '2020-01-01',
          'operations': [
            {'target': 'example#DocOp'},
            {'target': 'example#DocPayload'},
          ],
          'traits': {
            'aws.protocols#restJson1': <String, Object?>{},
            'aws.api#service': {'sdkId': 'Demo', 'endpointPrefix': 'demo'},
          },
        },
        'example#DocOp': {
          'type': 'operation',
          'input': {'target': 'example#DocIo'},
          'output': {'target': 'example#DocIo'},
          'traits': {
            'smithy.api#http': {'method': 'PUT', 'uri': '/doc', 'code': 200},
          },
        },
        'example#DocIo': {
          'type': 'structure',
          'members': {
            'stringValue': {'target': 'smithy.api#String'},
            'documentValue': {'target': 'example#Document'},
            'docMap': {'target': 'example#DocMap'},
          },
        },
        'example#DocMap': {
          'type': 'map',
          'key': {'target': 'smithy.api#String'},
          'value': {'target': 'example#Document'},
        },
        'example#DocPayload': {
          'type': 'operation',
          'input': {'target': 'example#DocPayloadIo'},
          'output': {'target': 'example#DocPayloadIo'},
          'traits': {
            'smithy.api#http': {
              'method': 'PUT',
              'uri': '/payload',
              'code': 200
            },
          },
        },
        'example#DocPayloadIo': {
          'type': 'structure',
          'members': {
            'documentValue': {
              'target': 'example#Document',
              'traits': {'smithy.api#httpPayload': <String, Object?>{}},
            },
          },
        },
        'example#Document': {'type': 'document'},
      },
    });

void main() {
  late String code;

  setUp(() {
    final api = apiFromSmithy(_model(), uid: 'demo-2020-01-01');
    code =
        buildService(api, sharedLibraryPath: 'package:aws_client/src/shared');
  });

  group('document codegen', () {
    test('produces parseable Dart (formats without error)', () {
      expect(() => DartFormatter().format(code), returnsNormally);
    });

    test('models a document member as Object?, not a generated class', () {
      expect(code, contains('Object? documentValue'));
      expect(code, isNot(contains('class Document')));
    });

    test('models a document-valued map as Map<String, Object>', () {
      expect(code, contains('Map<String, Object>? docMap'));
    });

    test('round-trips a document member verbatim (no .toJson()/.fromJson())',
        () {
      expect(code, isNot(contains('documentValue.toJson()')));
      expect(code, isNot(contains('Document.fromJson')));
    });
  });
}
