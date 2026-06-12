import 'package:aws_client_generator/builders/test_suite_common.dart';
import 'package:aws_client_generator/model/shape.dart';
import 'package:aws_client_generator/smithy/ast.dart';
import 'package:aws_client_generator/smithy/from_smithy.dart';
import 'package:test/test.dart';

// Smithy encodes NaN/Infinity/-Infinity as JSON strings; codegen must convert
// them to Dart double literals / matchers instead of emitting the raw string.
SmithyModel _model() => SmithyModel.fromJson({
      'smithy': '2.0',
      'shapes': {
        'example#Demo': {
          'type': 'service',
          'version': '2020-01-01',
          'operations': [
            {'target': 'example#Floats'}
          ],
          'traits': {
            'aws.protocols#awsJson1_0': <String, Object?>{},
            'aws.api#service': {'sdkId': 'Demo', 'endpointPrefix': 'demo'},
          },
        },
        'example#Floats': {
          'type': 'operation',
          'input': {'target': 'example#FloatsIo'},
          'output': {'target': 'example#FloatsIo'},
          'traits': <String, Object?>{},
        },
        'example#FloatsIo': {
          'type': 'structure',
          'members': {
            'doubleValue': {'target': 'smithy.api#Double'},
            'floatValue': {'target': 'smithy.api#Float'},
          },
        },
      },
    });

void main() {
  late Shape ioShape;

  setUp(() {
    final api = apiFromSmithy(_model(), uid: 'demo');
    api.initReferences();
    ioShape = api.operations['Floats']!.output!.shapeClass!;
  });

  group('special float visitExpect', () {
    String expectFor(Object? results) {
      final code = StringBuffer();
      visitExpect(code, 'output', ioShape, null, results);
      return '$code';
    }

    test('Infinity becomes double.infinity', () {
      final code = expectFor({'doubleValue': 'Infinity'});
      expect(code, contains('expect(output.doubleValue, double.infinity);'));
    });

    test('-Infinity becomes double.negativeInfinity', () {
      final code = expectFor({'floatValue': '-Infinity'});
      expect(code,
          contains('expect(output.floatValue, double.negativeInfinity);'));
    });

    test('NaN uses the isNaN matcher (NaN != NaN under ==)', () {
      final code = expectFor({'doubleValue': 'NaN'});
      expect(code, contains('expect(output.doubleValue, isNaN);'));
    });

    test('does not emit a string literal for a special float', () {
      final code = expectFor({'doubleValue': 'NaN', 'floatValue': 'Infinity'});
      expect(code, isNot(contains('"NaN"')));
      expect(code, isNot(contains('"Infinity"')));
    });
  });

  group('special float buildParameters', () {
    String paramsFor(Object? params) =>
        buildParameters(ioShape, null, params, isRoot: true);

    test('Infinity becomes double.infinity', () {
      expect(paramsFor({'doubleValue': 'Infinity'}),
          contains('doubleValue: double.infinity'));
    });

    test('-Infinity becomes double.negativeInfinity', () {
      expect(paramsFor({'floatValue': '-Infinity'}),
          contains('floatValue: double.negativeInfinity'));
    });

    test('NaN becomes double.nan', () {
      expect(paramsFor({'doubleValue': 'NaN'}),
          contains('doubleValue: double.nan'));
    });
  });
}
