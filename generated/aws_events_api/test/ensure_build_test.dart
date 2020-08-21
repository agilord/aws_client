@Tags(['presubmit-only'])
import 'package:aws_events_api/events-2015-10-07.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_events_api'));

  test('ensure_compilation', () {
    CloudWatchEvents(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
