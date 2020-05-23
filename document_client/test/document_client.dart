import 'dart:convert';
import 'dart:typed_data';

import 'package:document_client/document_client.dart';
import 'package:test/test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart';

void main() {
  group('Calling methods on document client', () {
    test('calling get()', () async {
      final mockClient = MockClient(
        (req) async => Response(
          jsonEncode({
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
          }),
          200,
        ),
      );

      final dc = DocumentClient(
        region: 'foo',
        credentials: AwsClientCredentials(accessKey: '123', secretKey: '123'),
        client: mockClient,
      );

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
      final mockClient = MockClient(
        (req) async => Response(
          jsonEncode({
            'Responses': {
              'Table1': [
                {
                  'Key': {'S': 'Peele'}
                },
              ],
            }
          }),
          200,
        ),
      );

      final dc = DocumentClient(
        region: 'foo',
        credentials: AwsClientCredentials(accessKey: '123', secretKey: '123'),
        client: mockClient,
      );

      final ret = await dc.batchGet(requestItems: {
        'Table1': KeysAndProjection(
          keys: [
            {
              'Key': 'Peele',
            },
          ],
        ),
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
  });
}
