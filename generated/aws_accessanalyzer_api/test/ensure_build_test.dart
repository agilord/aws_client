import 'package:aws_accessanalyzer_api/accessanalyzer-2019-11-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_accessanalyzer_api'));

  t.test('ensure_compilation', () {
    AccessAnalyzer(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
