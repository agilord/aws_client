@Tags(['presubmit-only'])
import 'package:aws_quicksight_api/quicksight-2018-04-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_quicksight_api'));

  test('ensure_compilation', () {
    QuickSight(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
