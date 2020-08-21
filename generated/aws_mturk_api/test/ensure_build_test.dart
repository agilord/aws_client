@Tags(['presubmit-only'])
import 'package:aws_mturk_api/mturk-requester-2017-01-17.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_mturk_api'));

  test('ensure_compilation', () {
    MTurk(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
