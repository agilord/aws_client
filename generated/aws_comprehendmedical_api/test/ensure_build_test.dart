import 'package:aws_comprehendmedical_api/comprehendmedical-2018-10-30.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_comprehendmedical_api'));

  t.test('ensure_compilation', () {
    ComprehendMedical(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
