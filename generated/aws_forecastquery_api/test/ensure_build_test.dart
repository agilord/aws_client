@Tags(['presubmit-only'])
import 'package:aws_forecastquery_api/forecastquery-2018-06-26.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_forecastquery_api'));

  test('ensure_compilation', () {
    ForecastQueryService(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
