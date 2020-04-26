import 'dart:convert';
import 'dart:typed_data';

import 'package:document_client/src/translator.dart';
import 'package:test/test.dart';

void main() {
  group('Translator', () {
    test('translate back and forth between JSON and DynamoDB Input/Output', () {
      final jsonPayload = {
        'foo': true,
        'bar': 'baz',
        'fizz': {
          'buzz1': Uint8List(1),
          'buzz2': ['stringyDingy'],
          'buzz3': [Uint8List(1)],
          'buzz4': [1, 2, 3]
        },
        'noCreativity': null
      };
      final fromJsonToAttributeValue = jsonPayload.fromJsonToAttributeValue();

      final midCheck = {
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
            'buzz4': {'NS': ['1', '2', '3']}
          }
        },
        'noCreativity': {'NULL': true}
      };

      expect(jsonDecode(jsonEncode(fromJsonToAttributeValue)), equals(midCheck));

      final fromAttributeValueToJson = fromJsonToAttributeValue.toJson();

      expect(fromAttributeValueToJson, equals(jsonPayload));
    });
  });
}
