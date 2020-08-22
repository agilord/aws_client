import 'package:aws_s3_api/s3-2006-03-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test('ensure_build',
      () => expectBuildClean(packageRelativeDirectory: 'generated/aws_s3_api'));

  t.test('ensure_compilation', () {
    S3(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
