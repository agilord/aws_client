@Tags(['presubmit-only'])
import 'package:aws_logs_api/logs-2014-03-28.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_logs_api'));

  test('ensure_compilation', () {
    CloudWatchLogs(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
