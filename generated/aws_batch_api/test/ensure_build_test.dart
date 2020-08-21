@Tags(['presubmit-only'])
import 'package:aws_batch_api/batch-2016-08-10.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_batch_api'));

  test('ensure_compilation', () {
    Batch(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
