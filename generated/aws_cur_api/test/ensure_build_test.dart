@Tags(['presubmit-only'])
import 'package:aws_cur_api/cur-2017-01-06.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_cur_api'));

  test('ensure_compilation', () {
    CostandUsageReportService(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
