@Tags(['presubmit-only'])
import 'package:aws_inspector_api/inspector-2016-02-16.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_inspector_api'));

  test('ensure_compilation', () {
    Inspector(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
