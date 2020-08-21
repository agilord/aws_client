@Tags(['presubmit-only'])
import 'package:aws_autoscaling_api/autoscaling-2011-01-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_autoscaling_api'));

  test('ensure_compilation', () {
    AutoScaling(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
