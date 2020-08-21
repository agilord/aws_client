@Tags(['presubmit-only'])
import 'package:aws_codeguruprofiler_api/codeguruprofiler-2019-07-18.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_codeguruprofiler_api'));

  test('ensure_compilation', () {
    CodeGuruProfiler(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
