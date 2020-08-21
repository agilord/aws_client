@Tags(['presubmit-only'])
import 'package:aws_discovery_api/discovery-2015-11-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_discovery_api'));

  test('ensure_compilation', () {
    ApplicationDiscoveryService(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
