@Tags(['presubmit-only'])
import 'package:aws_resource_groups_api/resource-groups-2017-11-27.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_resource_groups_api'));

  test('ensure_compilation', () {
    ResourceGroups(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
