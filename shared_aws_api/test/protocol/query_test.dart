import 'package:test/test.dart';

import 'package:shared_aws_api/src/protocol/query.dart';

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
          'Map.Entry.1.Key': 'a',
          'Map.Entry.1.Value': 'A',
          'Map.Entry.2.Key': 'b',
          'Map.Entry.2.Value': 'B',
        },
      );
    });

    test('map of maps', () {
      expect(
          flatQueryParams({
            'MapOfMap': {
              'x': {'a': 'A', 'b': 'B'},
              'y': {'c': 'C'},
            },
          }),
          {
            'MapOfMap.1.Name': 'x',
            'MapOfMap.1.Value.a': 'A',
            'MapOfMap.1.Value.b': 'B',
            'MapOfMap.2.Name': 'y',
            'MapOfMap.2.Value.c': 'C',
          });
    });
  });
}
