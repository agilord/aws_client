@Tags(['presubmit-only'])
import 'package:aws_athena_api/athena-2017-05-18.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_athena_api'));

  test('ensure_compilation', () {
    Athena(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
