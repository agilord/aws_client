@Tags(['presubmit-only'])
import 'package:aws_s3control_api/s3control-2018-08-20.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_s3control_api'));

  test('ensure_compilation', () {
    S3Control(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
