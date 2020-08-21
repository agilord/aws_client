@Tags(['presubmit-only'])
import 'package:aws_cloudsearchdomain_api/cloudsearchdomain-2013-01-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_cloudsearchdomain_api'));

  test('ensure_compilation', () {
    CloudSearchDomain(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
