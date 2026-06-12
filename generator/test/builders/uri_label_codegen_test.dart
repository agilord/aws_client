import 'package:aws_client_generator/builders/library_builder.dart';
import 'package:aws_client_generator/smithy/ast.dart';
import 'package:aws_client_generator/smithy/from_smithy.dart';
import 'package:test/test.dart';

SmithyModel _model() => SmithyModel.fromJson({
      'smithy': '2.0',
      'shapes': {
        'example#Demo': {
          'type': 'service',
          'version': '2020-01-01',
          'operations': [
            {'target': 'example#Labels'}
          ],
          'traits': {
            'aws.protocols#restJson1': <String, Object?>{},
            'aws.api#service': {'sdkId': 'Demo', 'endpointPrefix': 'demo'},
            'aws.auth#sigv4': {'name': 'demo'},
          },
        },
        'example#Labels': {
          'type': 'operation',
          'input': {'target': 'example#LabelsInput'},
          'traits': {
            'smithy.api#http': {
              'method': 'GET',
              'uri': '/p/{doubleValue}/{flag}/{ts}',
              'code': 200,
            },
          },
        },
        'example#LabelsInput': {
          'type': 'structure',
          'members': {
            'doubleValue': {
              'target': 'smithy.api#Double',
              'traits': {
                'smithy.api#httpLabel': <String, Object?>{},
                'smithy.api#required': <String, Object?>{}
              },
            },
            'flag': {
              'target': 'smithy.api#Boolean',
              'traits': {
                'smithy.api#httpLabel': <String, Object?>{},
                'smithy.api#required': <String, Object?>{}
              },
            },
            'ts': {
              'target': 'smithy.api#Timestamp',
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
  group('URI label codegen for non-string scalars', () {
    final api = apiFromSmithy(_model(), uid: 'demo-2020-01-01');
    final code =
        buildService(api, sharedLibraryPath: 'package:aws_client/src/shared');

    test('double label is stringified', () {
      expect(
          code.contains('Uri.encodeComponent(doubleValue.toString())'), isTrue);
      expect(code.contains('Uri.encodeComponent(doubleValue)'), isFalse);
    });

    test('boolean label is stringified', () {
      expect(code.contains('Uri.encodeComponent(flag.toString())'), isTrue);
    });

    test('timestamp label is formatted (http-label default date-time)', () {
      expect(code.contains('Uri.encodeComponent(ts)'), isFalse);
      expect(code.contains('iso8601ToJson(ts)'), isTrue);
    });
  });
}
