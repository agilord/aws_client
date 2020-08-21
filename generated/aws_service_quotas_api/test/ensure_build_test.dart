@Tags(['presubmit-only'])
import 'package:aws_service_quotas_api/service-quotas-2019-06-24.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_service_quotas_api'));

  test('ensure_compilation', () {
    ServiceQuotas(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
