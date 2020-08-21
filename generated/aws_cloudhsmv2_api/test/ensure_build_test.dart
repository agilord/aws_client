@Tags(['presubmit-only'])
import 'package:aws_cloudhsmv2_api/cloudhsmv2-2017-04-28.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_cloudhsmv2_api'));

  test('ensure_compilation', () {
    CloudHSMV2(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
