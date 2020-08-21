@Tags(['presubmit-only'])
import 'package:aws_sns_api/sns-2010-03-31.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_sns_api'));

  test('ensure_compilation', () {
    SNS(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
