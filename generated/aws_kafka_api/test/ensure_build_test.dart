@Tags(['presubmit-only'])
import 'package:aws_kafka_api/kafka-2018-11-14.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_kafka_api'));

  test('ensure_compilation', () {
    Kafka(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
