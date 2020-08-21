@Tags(['presubmit-only'])
import 'package:aws_cloudwatch_api/monitoring-2010-08-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_cloudwatch_api'));

  test('ensure_compilation', () {
    CloudWatch(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
