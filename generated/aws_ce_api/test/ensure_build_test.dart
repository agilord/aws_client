@Tags(['presubmit-only'])
import 'package:aws_ce_api/ce-2017-10-25.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test('ensure_build',
      () => expectBuildClean(packageRelativeDirectory: 'generated/aws_ce_api'));

  test('ensure_compilation', () {
    CostExplorer(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
