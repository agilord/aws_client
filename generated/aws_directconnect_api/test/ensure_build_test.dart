@Tags(['presubmit-only'])
import 'package:aws_directconnect_api/directconnect-2012-10-25.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_directconnect_api'));

  test('ensure_compilation', () {
    DirectConnect(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
