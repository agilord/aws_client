@Tags(['presubmit-only'])
import 'package:aws_support_api/support-2013-04-15.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_support_api'));

  test('ensure_compilation', () {
    Support(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
