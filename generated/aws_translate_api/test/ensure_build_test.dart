@Tags(['presubmit-only'])
import 'package:aws_translate_api/translate-2017-07-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_translate_api'));

  test('ensure_compilation', () {
    Translate(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
