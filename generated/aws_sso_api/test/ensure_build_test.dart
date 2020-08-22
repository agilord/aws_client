import 'package:aws_sso_api/sso-2019-06-10.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_sso_api'));

  t.test('ensure_compilation', () {
    SSO(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
