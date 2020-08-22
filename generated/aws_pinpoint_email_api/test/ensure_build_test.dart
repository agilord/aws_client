import 'package:aws_pinpoint_email_api/pinpoint-email-2018-07-26.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_pinpoint_email_api'));

  t.test('ensure_compilation', () {
    PinpointEmail(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
