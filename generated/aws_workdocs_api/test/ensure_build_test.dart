@Tags(['presubmit-only'])
import 'package:aws_workdocs_api/workdocs-2016-05-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_workdocs_api'));

  test('ensure_compilation', () {
    WorkDocs(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
