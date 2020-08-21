@Tags(['presubmit-only'])
import 'package:aws_kinesisanalytics_api/kinesisanalytics-2015-08-14.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_kinesisanalytics_api'));

  test('ensure_compilation', () {
    KinesisAnalytics(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
