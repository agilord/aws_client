@Tags(['presubmit-only'])
import 'package:aws_sqs_api/sqs-2012-11-05.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_sqs_api'));

  test('ensure_compilation', () {
    SQS(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
