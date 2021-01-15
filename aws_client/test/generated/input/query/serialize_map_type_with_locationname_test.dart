// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'serialize_map_type_with_locationname.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Serialize map type with locationName 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=OperationName&Version=2014-01-01&MapArg.entry.1.TheKey=key1&MapArg.entry.1.TheValue=val1&MapArg.entry.2.TheKey=key2&MapArg.entry.2.TheValue=val2'''));
      expect(request.url, equalsPathAndQuery('/'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = SerializeMapTypeWithLocationName(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName0(
      mapArg: {
        "key1": "val1",
        "key2": "val2",
      },
    );
/*
{
  "MapArg": {
    "key1": "val1",
    "key2": "val2"
  }
}
*/
  });
}
