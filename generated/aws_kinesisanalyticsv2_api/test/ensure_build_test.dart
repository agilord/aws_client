import 'package:aws_kinesisanalyticsv2_api/kinesisanalyticsv2-2018-05-23.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_kinesisanalyticsv2_api'));

  t.test('ensure_compilation', () {
    KinesisAnalyticsV2(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
