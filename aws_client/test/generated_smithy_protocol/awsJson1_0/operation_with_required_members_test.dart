// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../utils.dart';
import 'v2020_07_14.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('AwsJson10ClientErrorCorrectsWhenServerFailsToSerializeRequiredValues',
      () async {
    final client = MockClient((request) async {
      return Response(r'''{}''', 200,
          headers: {"Content-Type": "application/x-amz-json-1.0"});
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.operationWithRequiredMembers();
    expect(output.requiredBlob, utf8.encode(''));
    expect(output.requiredBoolean, false);
    expect(output.requiredByte, 0);
    expect(output.requiredDouble, 0.0);
    expect(output.requiredFloat, 0.0);
    expect(output.requiredInteger, 0);
    expect(output.requiredLong, 0);
    expect(output.requiredShort, 0);
    expect(output.requiredString, "");
    expect(output.requiredTimestamp.millisecondsSinceEpoch ~/ 1000, 0);
  }, skip: r'''client error-correction for required members not implemented''');
}
