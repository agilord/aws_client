@Tags(['presubmit-only'])
import 'package:aws_budgets_api/budgets-2016-10-20.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_budgets_api'));

  test('ensure_compilation', () {
    Budgets(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
