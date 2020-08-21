@Tags(['presubmit-only'])
import 'package:aws_kendra_api/kendra-2019-02-03.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_kendra_api'));

  test('ensure_compilation', () {
    Kendra(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
