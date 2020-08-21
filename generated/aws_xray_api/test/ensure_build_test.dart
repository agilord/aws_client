@Tags(['presubmit-only'])
import 'package:aws_xray_api/xray-2016-04-12.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_xray_api'));

  test('ensure_compilation', () {
    XRay(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
