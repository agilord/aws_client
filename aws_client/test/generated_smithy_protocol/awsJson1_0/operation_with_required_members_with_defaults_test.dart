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
  test(
      'AwsJson10ClientErrorCorrectsWithDefaultValuesWhenServerFailsToSerializeRequiredValues',
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

    final output = await service.operationWithRequiredMembersWithDefaults();
    expect(output.requiredBlob, utf8.encode('blob'));
    expect(output.requiredBoolean, true);
    expect(output.requiredByte, 1);
    expect(output.requiredDouble, 1.0);
    expect(output.requiredEnum, RequiredEnum.foo);
    expect(output.requiredFloat, 1.0);
    expect(output.requiredIntEnum, 1);
    expect(output.requiredInteger, 10);
    expect(output.requiredLong, 100);
    expect(output.requiredShort, 1);
    expect(output.requiredString, "hi");
    expect(output.requiredTimestamp.millisecondsSinceEpoch / 1000, 1);
  }, skip: r'''client error-correction for required members not implemented''');
}
