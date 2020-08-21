@Tags(['presubmit-only'])
import 'package:aws_lex_runtime_api/runtime.lex-2016-11-28.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_lex_runtime_api'));

  test('ensure_compilation', () {
    LexRuntimeService(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
