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
            {'target': 'example#GetHeaders'}
          ],
          'traits': {
            'aws.protocols#restJson1': <String, Object?>{},
            'aws.api#service': {'sdkId': 'Demo', 'endpointPrefix': 'demo'},
            'aws.auth#sigv4': {'name': 'demo'},
          },
        },
        'example#GetHeaders': {
          'type': 'operation',
          'output': {'target': 'example#GetHeadersOutput'},
          'traits': {
            'smithy.api#http': {'method': 'GET', 'uri': '/h', 'code': 200},
          },
        },
        'example#GetHeadersOutput': {
          'type': 'structure',
          'members': {
            'strings': {
              'target': 'example#StringList',
              'traits': {'smithy.api#httpHeader': 'X-StringList'},
            },
            'ints': {
              'target': 'example#IntegerList',
              'traits': {'smithy.api#httpHeader': 'X-IntegerList'},
            },
            'bools': {
              'target': 'example#BooleanList',
              'traits': {'smithy.api#httpHeader': 'X-BooleanList'},
            },
            'times': {
              'target': 'example#TimestampList',
              'traits': {'smithy.api#httpHeader': 'X-TimestampList'},
            },
            'enums': {
              'target': 'example#FooEnumList',
              'traits': {'smithy.api#httpHeader': 'X-EnumList'},
            },
          },
          'traits': <String, Object?>{},
        },
        'example#StringList': {
          'type': 'list',
          'member': {'target': 'smithy.api#String'},
        },
        'example#IntegerList': {
          'type': 'list',
          'member': {'target': 'smithy.api#Integer'},
        },
        'example#BooleanList': {
          'type': 'list',
          'member': {'target': 'smithy.api#Boolean'},
        },
        'example#TimestampList': {
          'type': 'list',
          'member': {'target': 'smithy.api#Timestamp'},
        },
        'example#FooEnumList': {
          'type': 'list',
          'member': {'target': 'example#FooEnum'},
        },
        'example#FooEnum': {
          'type': 'enum',
          'members': {
            'FOO': {
              'target': 'smithy.api#Unit',
              'traits': {'smithy.api#enumValue': 'Foo'}
            },
            'BAR': {
              'target': 'smithy.api#Unit',
              'traits': {'smithy.api#enumValue': 'Bar'}
            },
          },
        },
      },
    });

void main() {
  group('header-list response codegen', () {
    final api = apiFromSmithy(_model(), uid: 'demo-2020-01-01');
    final code =
        buildService(api, sharedLibraryPath: 'package:aws_client/src/shared');

    test('produces parseable Dart (formats without error)', () {
      expect(() => DartFormatter().format(code), returnsNormally);
    });

    test('does not emit the malformed extractHeaderList<T>Value', () {
      expect(code.contains('extractHeaderList<'), isFalse);
    });

    test('uses the extractHeaderListValues runtime helper', () {
      expect(code.contains('extractHeaderListValues'), isTrue);
    });
  });
}
