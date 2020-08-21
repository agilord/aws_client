@Tags(['presubmit-only'])
import 'package:aws_configservice_api/config-2014-11-12.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_configservice_api'));

  test('ensure_compilation', () {
    ConfigService(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
