@Tags(['presubmit-only'])
import 'package:aws_servicecatalog_api/servicecatalog-2015-12-10.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_servicecatalog_api'));

  test('ensure_compilation', () {
    ServiceCatalog(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
