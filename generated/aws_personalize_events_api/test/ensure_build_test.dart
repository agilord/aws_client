@Tags(['presubmit-only'])
import 'package:aws_personalize_events_api/personalize-events-2018-03-22.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_personalize_events_api'));

  test('ensure_compilation', () {
    PersonalizeEvents(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
