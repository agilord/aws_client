// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'complex_map_values.dart';

void main() {
  test('Complex Map Values 0', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{"MapMember": {"a": 1398796238, "b": 1398796238}}''', 200,
          headers: {});
    });

    final service = ComplexMapValues(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    final output = await service.operationName0();
    expect(output.mapMember['a'].millisecondsSinceEpoch ~/ 1000, 1398796238);
    expect(output.mapMember['b'].millisecondsSinceEpoch ~/ 1000, 1398796238);
/*
{
  "MapMember": {
    "a": 1398796238,
    "b": 1398796238
  }
}
*/
  });
}
