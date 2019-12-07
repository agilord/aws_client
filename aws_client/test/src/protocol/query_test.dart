import 'package:test/test.dart';
import 'package:xml/xml.dart';

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

  group('xmlToMap', () {
    test('parse', () {
      final doc = parse('<?xml version="1.0"?>'
          '<ReceiveMessageResponse xmlns="http://queue.amazonaws.com/doc/2012-11-05/">'
          '<ReceiveMessageResult>'
          '<Message>'
          '<MessageId>00000000-0000-0000-0000-000000001234</MessageId>'
          '<ReceiptHandle>[base64]</ReceiptHandle>'
          '<MD5OfBody>[md5]</MD5OfBody>'
          '<Body>[body]</Body>'
          '</Message>'
          '</ReceiveMessageResult>'
          '<ResponseMetadata>'
          '<RequestId>00000000-0000-0000-0000-000000005678</RequestId>'
          '</ResponseMetadata>'
          '</ReceiveMessageResponse>');
      expect(xmlToMap(doc.rootElement), {
        'ReceiveMessageResponse': {
          'ReceiveMessageResult': {
            'Message': {
              'MessageId': '00000000-0000-0000-0000-000000001234',
              'ReceiptHandle': '[base64]',
              'MD5OfBody': '[md5]',
              'Body': '[body]'
            }
          },
          'ResponseMetadata': {
            'RequestId': '00000000-0000-0000-0000-000000005678'
          }
        }
      });
    });
  });
}
