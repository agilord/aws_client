import 'package:aws_organizations_api/organizations-2016-11-28.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_organizations_api'));

  t.test('ensure_compilation', () {
    Organizations(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
