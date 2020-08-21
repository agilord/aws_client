@Tags(['presubmit-only'])
import 'package:aws_firehose_api/firehose-2015-08-04.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_firehose_api'));

  test('ensure_compilation', () {
    Firehose(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
