@Tags(['presubmit-only'])
import 'package:aws_personalize_runtime_api/personalize-runtime-2018-05-22.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_personalize_runtime_api'));

  test('ensure_compilation', () {
    PersonalizeRuntime(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
