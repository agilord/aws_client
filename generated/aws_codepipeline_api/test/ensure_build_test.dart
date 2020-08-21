@Tags(['presubmit-only'])
import 'package:aws_codepipeline_api/codepipeline-2015-07-09.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_codepipeline_api'));

  test('ensure_compilation', () {
    CodePipeline(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
