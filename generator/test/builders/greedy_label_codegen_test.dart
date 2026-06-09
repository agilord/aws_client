import 'package:aws_client_generator/builders/library_builder.dart';
import 'package:aws_client_generator/smithy/ast.dart';
import 'package:aws_client_generator/smithy/from_smithy.dart';
import 'package:test/test.dart';

// Greedy label ({baz+}) contains '/' which the per-segment loop re-encoded into
// garbage (%24%7B...). Encoding must happen before expression substitution.
SmithyModel _model() => SmithyModel.fromJson({
      'smithy': '2.0',
      'shapes': {
        'example#Demo': {
          'type': 'service',
          'version': '2020-01-01',
          'operations': [
            {'target': 'example#Greedy'}
          ],
          'traits': {
            'aws.protocols#restJson1': <String, Object?>{},
            'aws.api#service': {'sdkId': 'Demo', 'endpointPrefix': 'demo'},
            'aws.auth#sigv4': {'name': 'demo'},
          },
        },
        'example#Greedy': {
          'type': 'operation',
          'input': {'target': 'example#GreedyInput'},
          'traits': {
            'smithy.api#http': {
              'method': 'GET',
              'uri': '/path/{foo}/baz/{baz+}',
              'code': 200,
            },
          },
        },
        'example#GreedyInput': {
          'type': 'structure',
          'members': {
            'foo': {
              'target': 'smithy.api#String',
              'traits': {
                'smithy.api#httpLabel': <String, Object?>{},
                'smithy.api#required': <String, Object?>{}
              },
            },
            'baz': {
              'target': 'smithy.api#String',
              'traits': {
                'smithy.api#httpLabel': <String, Object?>{},
                'smithy.api#required': <String, Object?>{}
              },
            },
          },
          'traits': <String, Object?>{},
        },
      },
    });

void main() {
  group('greedy URI label codegen', () {
    final api = apiFromSmithy(_model(), uid: 'demo-2020-01-01');
    final code =
        buildService(api, sharedLibraryPath: 'package:aws_client/src/shared');

    test('the normal label is substituted', () {
      expect(code.contains(r'${Uri.encodeComponent(foo)}'), isTrue);
    });

    test('the greedy label expands without being re-encoded/mangled', () {
      expect(
          code.contains(
              r"${baz.split('/').map(Uri.encodeComponent).join('/')}"),
          isTrue);
    });

    test('no URL-encoded dollar/brace leaked into the uri expression', () {
      expect(code.contains('%24%7B'), isFalse); // encoded '${'
      expect(code.contains(".split(' /"), isFalse); // mangled split
    });
  });
}
