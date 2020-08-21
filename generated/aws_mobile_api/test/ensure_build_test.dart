@Tags(['presubmit-only'])
import 'package:aws_mobile_api/mobile-2017-07-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_mobile_api'));

  test('ensure_compilation', () {
    Mobile(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
