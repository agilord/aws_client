@TestOn('vm')
library;

import 'package:aws_client/app_sync_2017_07_25.dart';
import 'package:test/test.dart';

void main() {
  group('open enums', () {
    test('known values round-trip and are canonical', () {
      expect(ApiCacheStatus.fromString('AVAILABLE'), ApiCacheStatus.available);
      expect(
          identical(
              ApiCacheStatus.fromString('AVAILABLE'), ApiCacheStatus.available),
          isTrue);
      expect(ApiCacheStatus.available.value, 'AVAILABLE');
    });

    test('unknown values do not throw and preserve the wire value', () {
      final unknown = ApiCacheStatus.fromString('SOMETHING_NEW');
      expect(unknown.value, 'SOMETHING_NEW');
      expect(unknown, isNot(ApiCacheStatus.available));
    });

    test('unknown values compare equal by value (usable in sets/maps)', () {
      expect(ApiCacheStatus.fromString('SOMETHING_NEW'),
          ApiCacheStatus.fromString('SOMETHING_NEW'));
      final set = {
        ApiCacheStatus.fromString('SOMETHING_NEW'),
        ApiCacheStatus.fromString('SOMETHING_NEW'),
      };
      expect(set, hasLength(1));
    });

    test('known values still work in a switch', () {
      String describe(ApiCacheStatus s) {
        switch (s) {
          case ApiCacheStatus.available:
            return 'available';
          default:
            return 'other:${s.value}';
        }
      }

      expect(describe(ApiCacheStatus.available), 'available');
      expect(describe(ApiCacheStatus.fromString('SOMETHING_NEW')),
          'other:SOMETHING_NEW');
    });
  });
}
