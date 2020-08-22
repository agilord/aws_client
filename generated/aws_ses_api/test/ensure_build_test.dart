import 'package:aws_ses_api/email-2010-12-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_ses_api'));

  t.test('ensure_compilation', () {
    SES(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
