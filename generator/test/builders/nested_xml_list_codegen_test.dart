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
            {'target': 'example#GetNested'}
          ],
          'traits': {
            'aws.protocols#awsQuery': <String, Object?>{},
            'aws.api#service': {'sdkId': 'Demo', 'endpointPrefix': 'demo'},
            'aws.auth#sigv4': {'name': 'demo'},
          },
        },
        'example#GetNested': {
          'type': 'operation',
          'output': {'target': 'example#GetNestedOutput'},
          'traits': <String, Object?>{},
        },
        'example#GetNestedOutput': {
          'type': 'structure',
          'members': {
            'nestedStringList': {'target': 'example#NestedStringList'},
          },
          'traits': <String, Object?>{},
        },
        'example#NestedStringList': {
          'type': 'list',
          'member': {'target': 'example#StringList'},
        },
        'example#StringList': {
          'type': 'list',
          'member': {'target': 'smithy.api#String'},
        },
      },
    });

void main() {
  group('nested XML list codegen', () {
    final api = apiFromSmithy(_model(), uid: 'demo-2020-01-01');
    final code =
        buildService(api, sharedLibraryPath: 'package:aws_client/src/shared');

    test('produces parseable Dart (formats without error)', () {
      expect(() => DartFormatter().format(code), returnsNormally);
    });

    test('does not emit List<T>.fromXml for a nested list member', () {
      expect(code.contains('List<String>.fromXml'), isFalse);
    });

    test('parses the inner list with extractXmlStringListValues', () {
      expect(code.contains('extractXmlStringListValues'), isTrue);
    });
  });
}
