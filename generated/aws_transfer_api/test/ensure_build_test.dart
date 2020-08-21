@Tags(['presubmit-only'])
import 'package:aws_transfer_api/transfer-2018-11-05.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_transfer_api'));

  test('ensure_compilation', () {
    Transfer(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
