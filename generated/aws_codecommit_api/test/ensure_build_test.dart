@Tags(['presubmit-only'])
import 'package:aws_codecommit_api/codecommit-2015-04-13.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_codecommit_api'));

  test('ensure_compilation', () {
    CodeCommit(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
