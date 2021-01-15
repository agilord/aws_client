// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'base64_encoded_blobs.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Base64 encoded Blobs 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=OperationName&Version=2014-01-01&BlobArg=Zm9v'''));
      expect(request.url, equalsPathAndQuery('/'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = Base64EncodedBlobs(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName0(
      blobArg: Uint8List.fromList('foo'.codeUnits),
    );
/*
{
  "BlobArg": "foo"
}
*/
  });
}
