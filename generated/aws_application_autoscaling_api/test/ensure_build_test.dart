import 'package:aws_application_autoscaling_api/application-autoscaling-2016-02-06.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory:
              'generated/aws_application_autoscaling_api'));

  t.test('ensure_compilation', () {
    ApplicationAutoScaling(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
