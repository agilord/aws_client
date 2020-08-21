@Tags(['presubmit-only'])
import 'package:aws_networkmanager_api/networkmanager-2019-07-05.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_networkmanager_api'));

  test('ensure_compilation', () {
    NetworkManager(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
