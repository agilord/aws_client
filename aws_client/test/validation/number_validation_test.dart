import 'package:aws_client/src/shared/validation/utils.dart';
import 'package:test/test.dart';

void main() {
  group('validate number ranges', () {
    test('null name is ok', () {
      validateNumRange(null, 333, 1, 666);
    });

    test('null value is an ArgumentError', () {
      expect(() => validateNumRange('null', null, 3, 666, isRequired: true),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test('null min is an ArgumentError', () {
      expect(() => validateNumRange('name', 333, null, 666),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test('null max is an ArgumentError', () {
      expect(() => validateNumRange('name', 333, 0, null),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test('NaN is an ArgumentError', () {
      expect(() => validateNumRange('name', double.nan, 0, 1),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test('+inf is at most a RangeError', () {
      expect(() => validateNumRange('name', double.infinity, 0, 1),
          throwsA(TypeMatcher<RangeError>()));
    });

    test('-inf is at most a RangeError', () {
      expect(() => validateNumRange('name', double.negativeInfinity, 0, 1),
          throwsA(TypeMatcher<RangeError>()));
    });
  });
}
