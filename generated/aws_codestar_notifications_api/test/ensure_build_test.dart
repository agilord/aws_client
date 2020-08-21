import 'package:aws_codestar_notifications_api/codestar-notifications-2019-10-15.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory:
              'generated/aws_codestar_notifications_api'));

  t.test('ensure_compilation', () {
    CodeStarNotifications(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
