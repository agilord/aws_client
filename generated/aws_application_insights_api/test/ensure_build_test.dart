@Tags(['presubmit-only'])
import 'package:aws_application_insights_api/application-insights-2018-11-25.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_application_insights_api'));

  test('ensure_compilation', () {
    ApplicationInsights(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
