@Tags(['presubmit-only'])
import 'package:aws_clouddirectory_api/clouddirectory-2017-01-11.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_clouddirectory_api'));

  test('ensure_compilation', () {
    CloudDirectory(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
