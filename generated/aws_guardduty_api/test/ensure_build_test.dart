@Tags(['presubmit-only'])
import 'package:aws_guardduty_api/guardduty-2017-11-28.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_guardduty_api'));

  test('ensure_compilation', () {
    GuardDuty(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
