import 'package:test/test.dart';

import 'package:aws_client/src/protocol/query.dart';

void main() {
  group('flatQueryParams', () {
    test('string values', () {
      expect(flatQueryParams({'Version': ''}), {'Version': ''});
      expect(flatQueryParams({'Version': '1.2.3'}), {'Version': '1.2.3'});
    });

    test('empty list', () {
      expect(
        flatQueryParams({'List': []}),
        {
          'List': '',
        },
      );
    });

    test('list', () {
      expect(
        flatQueryParams({
          'List': ['a', 'b']
        }),
        {
          'List.1': 'a',
          'List.2': 'b',
        },
      );
    });

    test('empty map', () {
      expect(flatQueryParams({'Map': {}}), {});
    });

    test('map', () {
      expect(
        flatQueryParams({
          'Map': {'a': 'A', 'b': 'B'}
        }),
        {
          'Map.entry.1.key': 'a',
          'Map.entry.1.value': 'A',
          'Map.entry.2.key': 'b',
          'Map.entry.2.value': 'B',
        },
      );
    });
  });
}
