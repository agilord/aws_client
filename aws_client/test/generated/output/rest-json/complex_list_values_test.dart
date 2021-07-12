// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'complex_list_values.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Complex List Values 0', () async {
    final client = MockClient((request) async {
      return Response(r'''{"ListMember": [1398796238, 1398796238]}''', 200,
          headers: {});
    });

    final service = ComplexListValues(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    final output = await service.operationName0();
    expect(output.listMember![0].millisecondsSinceEpoch ~/ 1000, 1398796238);
    expect(output.listMember![1].millisecondsSinceEpoch ~/ 1000, 1398796238);
/*
{
  "ListMember": [
    1398796238,
    1398796238
  ]
}
*/
  });
}
