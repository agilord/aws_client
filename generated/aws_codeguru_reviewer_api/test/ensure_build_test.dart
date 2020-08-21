@Tags(['presubmit-only'])
import 'package:aws_codeguru_reviewer_api/codeguru-reviewer-2019-09-19.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_codeguru_reviewer_api'));

  test('ensure_compilation', () {
    CodeGuruReviewer(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
