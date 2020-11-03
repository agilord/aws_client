// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'blob.dart';

void main() {
  test('Blob 0', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<OperationNameResult><Blob>dmFsdWU=</Blob></OperationNameResult>''',
          200,
          headers: {});
    });

    final service = Blob(
        client: client,
        region: 'us-east-1',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''));

    final output = await service.operationName0();
    expect(output.blob, utf8.encode('value'));
/*
{
  "Blob": "value"
}
*/
  });
}
