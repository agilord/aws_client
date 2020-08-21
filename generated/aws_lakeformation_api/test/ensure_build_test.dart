@Tags(['presubmit-only'])
import 'package:aws_lakeformation_api/lakeformation-2017-03-31.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_lakeformation_api'));

  test('ensure_compilation', () {
    LakeFormation(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
