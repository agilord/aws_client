import 'dart:io';

import 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;
import 'package:test/test.dart';

export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

final String testEndpoint =
    Platform.environment['AWS_ENDPOINT'] ?? 'http://localhost:4566';

const String testRegion = 'us-east-1';

final AwsClientCredentials testCredentials =
    AwsClientCredentials(accessKey: 'test', secretKey: 'test');

T localClient<T>(
  T Function({
    required String region,
    AwsClientCredentials? credentials,
    String? endpointUrl,
  }) constructor,
) =>
    constructor(
      region: testRegion,
      credentials: testCredentials,
      endpointUrl: testEndpoint,
    );

String uniqueName([String prefix = 'smoke']) =>
    '$prefix-${DateTime.now().millisecondsSinceEpoch}';

void expectRecent(DateTime? timestamp) {
  expect(timestamp, isNotNull);
  expect(timestamp!.difference(DateTime.now()).abs(),
      lessThan(const Duration(days: 1)));
}
