@Tags(['presubmit-only'])
import 'package:aws_detective_api/detective-2018-10-26.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_detective_api'));

  test('ensure_compilation', () {
    Detective(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
