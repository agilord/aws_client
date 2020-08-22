import 'package:aws_workspaces_api/workspaces-2015-04-08.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_workspaces_api'));

  t.test('ensure_compilation', () {
    WorkSpaces(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
