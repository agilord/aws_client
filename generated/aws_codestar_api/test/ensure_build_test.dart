@Tags(['presubmit-only'])
import 'package:aws_codestar_api/codestar-2017-04-19.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_codestar_api'));

  test('ensure_compilation', () {
    CodeStar(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
