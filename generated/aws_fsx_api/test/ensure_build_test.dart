@Tags(['presubmit-only'])
import 'package:aws_fsx_api/fsx-2018-03-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_fsx_api'));

  test('ensure_compilation', () {
    FSx(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
