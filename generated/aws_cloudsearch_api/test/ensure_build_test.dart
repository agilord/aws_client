@Tags(['presubmit-only'])
import 'package:aws_cloudsearch_api/cloudsearch-2011-02-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_cloudsearch_api'));

  test('ensure_compilation', () {
    CloudSearch(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
