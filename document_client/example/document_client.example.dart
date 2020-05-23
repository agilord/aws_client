import 'dart:convert';

import 'package:document_client/document_client.dart';

void main() async {
  final dc = DocumentClient(region: 'eu-west-1');

  final getResponse = await dc.get(
    tableName: 'MyTable',
    key: {'Car': 'DudeWheresMyCar'},
  );

  print(jsonEncode(getResponse.item));
  // e.g. { "wheels": 24, "units": "inch" }

  final batchGetResponse = await dc.batchGet(
    requestItems: {
      'Table-1': KeysAndProjection(
        keys: [
          {
            'HashKey': 'hashkey',
            'NumberRangeKey': 1,
          }
        ],
      ),
      'Table-2': KeysAndProjection(
        keys: [
          {
            'foo': 'bar',
          }
        ],
      ),
    },
  );

  print(jsonEncode(batchGetResponse.responses));
}
