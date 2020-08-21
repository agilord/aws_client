@Tags(['presubmit-only'])
import 'package:aws_deploy_api/codedeploy-2014-10-06.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_deploy_api'));

  test('ensure_compilation', () {
    CodeDeploy(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
