@Tags(['presubmit-only'])
import 'package:aws_pinpoint_sms_voice_api/pinpoint-sms-voice-2018-09-05.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_pinpoint_sms_voice_api'));

  test('ensure_compilation', () {
    PinpointSMSVoice(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
