@Tags(['presubmit-only'])
import 'package:aws_s3_api/s3-2006-03-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test('ensure_build',
      () => expectBuildClean(packageRelativeDirectory: 'generated/aws_s3_api'));

  test('ensure_compilation', () {
    S3(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
