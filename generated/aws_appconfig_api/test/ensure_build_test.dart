@Tags(['presubmit-only'])
import 'package:aws_appconfig_api/appconfig-2019-10-09.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_appconfig_api'));

  test('ensure_compilation', () {
    AppConfig(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
