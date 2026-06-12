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
            {'target': 'example#Str'},
            {'target': 'example#En'},
          ],
          'traits': {
            'aws.protocols#restJson1': <String, Object?>{},
            'aws.api#service': {'sdkId': 'Demo', 'endpointPrefix': 'demo'},
            'aws.auth#sigv4': {'name': 'demo'},
          },
        },
        'example#Str': {
          'type': 'operation',
          'output': {'target': 'example#StrOutput'},
          'traits': {
            'smithy.api#http': {'method': 'GET', 'uri': '/s', 'code': 200},
          },
        },
        'example#StrOutput': {
          'type': 'structure',
          'members': {
            'payload': {
              'target': 'smithy.api#String',
              'traits': {'smithy.api#httpPayload': <String, Object?>{}},
            },
          },
          'traits': <String, Object?>{},
        },
        'example#En': {
          'type': 'operation',
          'output': {'target': 'example#EnOutput'},
          'traits': {
            'smithy.api#http': {'method': 'GET', 'uri': '/e', 'code': 200},
          },
        },
        'example#EnOutput': {
          'type': 'structure',
          'members': {
            'payload': {
              'target': 'example#StringEnum',
              'traits': {'smithy.api#httpPayload': <String, Object?>{}},
            },
          },
          'traits': <String, Object?>{},
        },
        'example#StringEnum': {
          'type': 'enum',
          'members': {
            'V': {
              'target': 'smithy.api#Unit',
              'traits': {'smithy.api#enumValue': 'v'}
            },
          },
        },
      },
    });

void main() {
  group('non-structure httpPayload codegen', () {
    final api = apiFromSmithy(_model(), uid: 'demo-2020-01-01');
    final code =
        buildService(api, sharedLibraryPath: 'package:aws_client/src/shared');

    test('string payload reads the raw body, not String.fromJson', () {
      expect(code.contains('String.fromJson'), isFalse);
      expect(code.contains('payload: await response.stream.bytesToString()'),
          isTrue);
    });

    test('enum payload uses fromString on the raw body, not fromJson', () {
      expect(code.contains('StringEnum.fromJson'), isFalse);
      expect(
          code.contains(
              'StringEnum.fromString(await response.stream.bytesToString())'),
          isTrue);
    });
  });

  group('non-structure httpPayload codegen (restXml)', () {
    final xmlModel = SmithyModel.fromJson({
      'smithy': '2.0',
      'shapes': {
        'example#Demo': {
          'type': 'service',
          'version': '2020-01-01',
          'operations': [
            {'target': 'example#En'}
          ],
          'traits': {
            'aws.protocols#restXml': <String, Object?>{},
            'aws.api#service': {'sdkId': 'Demo', 'endpointPrefix': 'demo'},
            'aws.auth#sigv4': {'name': 'demo'},
          },
        },
        'example#En': {
          'type': 'operation',
          'output': {'target': 'example#EnOutput'},
          'traits': {
            'smithy.api#http': {'method': 'GET', 'uri': '/e', 'code': 200},
          },
        },
        'example#EnOutput': {
          'type': 'structure',
          'members': {
            'payload': {
              'target': 'example#StringEnum',
              'traits': {'smithy.api#httpPayload': <String, Object?>{}},
            },
          },
          'traits': <String, Object?>{},
        },
        'example#StringEnum': {
          'type': 'enum',
          'members': {
            'V': {
              'target': 'smithy.api#Unit',
              'traits': {'smithy.api#enumValue': 'v'}
            },
          },
        },
      },
    });
    final code = buildService(apiFromSmithy(xmlModel, uid: 'demo-2020-01-01'),
        sharedLibraryPath: 'package:aws_client/src/shared');

    test('enum payload uses fromString on the raw body, not fromXml', () {
      expect(code.contains('StringEnum.fromXml'), isFalse);
      expect(
          code.contains(
              'StringEnum.fromString(await \$result.stream.bytesToString())'),
          isTrue);
    });
  });
}
