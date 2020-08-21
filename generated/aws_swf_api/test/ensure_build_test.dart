@Tags(['presubmit-only'])
import 'package:aws_swf_api/swf-2012-01-25.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_swf_api'));

  test('ensure_compilation', () {
    SWF(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
