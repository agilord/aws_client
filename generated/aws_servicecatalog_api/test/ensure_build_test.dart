import 'package:aws_servicecatalog_api/servicecatalog-2015-12-10.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_servicecatalog_api'));

  t.test('ensure_compilation', () {
    ServiceCatalog(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
