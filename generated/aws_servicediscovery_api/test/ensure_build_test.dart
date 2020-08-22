import 'package:aws_servicediscovery_api/servicediscovery-2017-03-14.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_servicediscovery_api'));

  t.test('ensure_compilation', () {
    ServiceDiscovery(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
