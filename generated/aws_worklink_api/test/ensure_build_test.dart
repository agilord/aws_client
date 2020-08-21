@Tags(['presubmit-only'])
import 'package:aws_worklink_api/worklink-2018-09-25.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_worklink_api'));

  test('ensure_compilation', () {
    WorkLink(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
