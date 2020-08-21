@Tags(['presubmit-only'])
import 'package:aws_iot1click_projects_api/iot1click-projects-2018-05-14.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_iot1click_projects_api'));

  test('ensure_compilation', () {
    IoT1ClickProjects(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
