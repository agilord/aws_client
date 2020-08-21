@Tags(['presubmit-only'])
import 'package:aws_polly_api/polly-2016-06-10.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_polly_api'));

  test('ensure_compilation', () {
    Polly(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
