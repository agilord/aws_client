@Tags(['presubmit-only'])
import 'package:aws_pinpoint_api/pinpoint-2016-12-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_pinpoint_api'));

  test('ensure_compilation', () {
    Pinpoint(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
