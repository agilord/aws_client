@Tags(['presubmit-only'])
import 'package:aws_pi_api/pi-2018-02-27.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test('ensure_build',
      () => expectBuildClean(packageRelativeDirectory: 'generated/aws_pi_api'));

  test('ensure_compilation', () {
    PI(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
