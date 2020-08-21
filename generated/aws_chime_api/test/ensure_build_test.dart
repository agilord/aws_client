@Tags(['presubmit-only'])
import 'package:aws_chime_api/chime-2018-05-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_chime_api'));

  test('ensure_compilation', () {
    Chime(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
