@Tags(['presubmit-only'])
import 'package:aws_forecast_api/forecast-2018-06-26.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_forecast_api'));

  test('ensure_compilation', () {
    ForecastService(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
