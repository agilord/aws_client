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
            {'target': 'example#Q'}
          ],
          'traits': {
            'aws.protocols#restJson1': <String, Object?>{},
            'aws.api#service': {'sdkId': 'Demo', 'endpointPrefix': 'demo'},
            'aws.auth#sigv4': {'name': 'demo'},
          },
        },
        'example#Q': {
          'type': 'operation',
          'input': {'target': 'example#QInput'},
          'traits': {
            'smithy.api#http': {'method': 'GET', 'uri': '/q', 'code': 200},
          },
        },
        'example#QInput': {
          'type': 'structure',
          'members': {
            'boolList': {
              'target': 'example#BoolList',
              'traits': {'smithy.api#httpQuery': 'BoolList'},
            },
            'intList': {
              'target': 'example#IntList',
              'traits': {'smithy.api#httpQuery': 'IntList'},
            },
            'strList': {
              'target': 'example#StrList',
              'traits': {'smithy.api#httpQuery': 'StrList'},
            },
          },
          'traits': <String, Object?>{},
        },
        'example#BoolList': {
          'type': 'list',
          'member': {'target': 'smithy.api#Boolean'},
        },
        'example#IntList': {
          'type': 'list',
          'member': {'target': 'smithy.api#Integer'},
        },
        'example#StrList': {
          'type': 'list',
          'member': {'target': 'smithy.api#String'},
        },
      },
    });

void main() {
  group('query list codegen', () {
    final api = apiFromSmithy(_model(), uid: 'demo-2020-01-01');
    final code =
        buildService(api, sharedLibraryPath: 'package:aws_client/src/shared');

    test('boolean list elements are stringified', () {
      expect(
          code.contains('boolList.map((e) => e.toString()).toList()'), isTrue);
    });

    test('integer list elements are stringified', () {
      expect(
          code.contains('intList.map((e) => e.toString()).toList()'), isTrue);
    });

    test('string list is passed through unchanged', () {
      expect(code.contains("'StrList': strList,"), isTrue);
    });
  });
}
