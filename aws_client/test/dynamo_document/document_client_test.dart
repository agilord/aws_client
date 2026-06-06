import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_client/dynamo_document.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

DocumentClient mockedDocumentClient(dynamic mockData) => DocumentClient(
      region: 'foo',
      credentials: AwsClientCredentials(accessKey: '123', secretKey: '123'),
      client: MockClient(
        (req) async => Response(
          jsonEncode(mockData),
          200,
        ),
      ),
    );

void main() {
  group('Calling methods on document client', () {
    test('calling get()', () async {
      final dc = mockedDocumentClient({
        'Item': {
          'foo': {'BOOL': true},
          'bar': {'S': 'baz'},
          'fizz': {
            'M': {
              'buzz1': {'B': 'AA=='},
              'buzz2': {
                'L': [
                  {'S': 'stringyDingy'}
                ]
              },
              'buzz3': {
                'BS': ['AA==']
              },
              'buzz4': {
                'NS': ['1', '2', '3']
              }
            }
          },
          'noCreativity': {'NULL': true}
        },
      });

      final ret = await dc.get(tableName: 'täjbel', key: {'Key': 'Peele'});

      expect(
          ret.item,
          equals({
            'foo': true,
            'bar': 'baz',
            'fizz': {
              'buzz1': Uint8List(1),
              'buzz2': ['stringyDingy'],
              'buzz3': [Uint8List(1)],
              'buzz4': [1, 2, 3]
            },
            'noCreativity': null
          }));
    });

    test('calling batchGet()', () async {
      final dc = mockedDocumentClient({
        'Responses': {
          'Table1': [
            {
              'Key': {'S': 'Peele'}
            },
          ],
        }
      });

      final ret = await dc.batchGet(requestItems: {
        'Table1': KeysAndProjection(keys: [
          {
            'Key': 'Peele',
          }
        ])
      });

      expect(
        ret.responses,
        equals({
          'Table1': [
            {
              'Key': 'Peele',
            }
          ],
        }),
      );
    });

    test('calling batchWrite()', () async {
      final dc = mockedDocumentClient({
        'ItemCollectionMetrics': {
          'FooTable': [
            {
              'ItemCollectionKey': {
                'BarKey': {'S': 'Baz'},
              },
              'SizeEstimateRangeGB': [666.333]
            }
          ],
        },
        'UnprocessedItems': {
          'FizzTable': [
            {
              'DeleteRequest': {
                'Key': {
                  'FailureKey': {'S': ':-('}
                }
              }
            },
            {
              'PutRequest': {
                'Item': {
                  'FailureItem': {'S': ':-S'}
                }
              },
            },
          ],
        },
      });

      final batchRet = await dc.batchWrite(requestItems: {
        'TableBuzz': [
          Write(putItem: {'TotallyRealisticKey': 'StringData'}),
          Write(deleteKey: {'DeleteMe': 80085}),
        ],
      });

      expect(batchRet.unprocessedItems['FizzTable'], hasLength(2));
      expect(batchRet.itemCollectionMetrics['FooTable'], hasLength(1));
    });

    test('calling update()', () async {
      final dc = mockedDocumentClient({
        'Attributes': {
          'test': {'N': '1337'},
        },
        'ItemCollectionMetrics': {
          'testTable': [
            {
              'ItemCollectionKey': {
                'test': {'S': 'Baz'},
              },
              'SizeEstimateRangeGB': [666.333]
            }
          ],
        },
      });

      final updateRet = await dc.update(
        key: {'test': 6.66},
        tableName: 'foo',
      );

      expect(updateRet.attributes['test'], equals(1337));
    });

    test('number values keep their int/double type', () async {
      final dc = mockedDocumentClient({
        'Item': {
          'anInt': {'N': '42'},
          'aDouble': {'N': '42.5'},
          'scientific': {'N': '1e10'},
          'numberSet': {
            'NS': ['1', '2.5', '3']
          },
        },
      });

      final ret = await dc.get(tableName: 'foo', key: {'Key': 'bar'});
      final item = ret.item;

      expect(item['anInt'], isA<int>());
      expect(item['anInt'], equals(42));
      expect(item['aDouble'], isA<double>());
      expect(item['aDouble'], equals(42.5));
      // Scientific notation has no '.', but is not a valid int literal.
      expect(item['scientific'], isA<double>());
      expect(item['scientific'], equals(1e10));
      expect(item['numberSet'], equals([1, 2.5, 3]));
      expect((item['numberSet'] as List)[0], isA<int>());
      expect((item['numberSet'] as List)[1], isA<double>());
    });
  });
}
