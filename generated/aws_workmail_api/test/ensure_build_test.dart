@Tags(['presubmit-only'])
import 'package:aws_workmail_api/workmail-2017-10-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_workmail_api'));

  test('ensure_compilation', () {
    WorkMail(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
