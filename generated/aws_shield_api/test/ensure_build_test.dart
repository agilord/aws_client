@Tags(['presubmit-only'])
import 'package:aws_shield_api/shield-2016-06-02.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_shield_api'));

  test('ensure_compilation', () {
    Shield(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
