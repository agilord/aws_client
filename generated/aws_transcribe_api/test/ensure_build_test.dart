@Tags(['presubmit-only'])
import 'package:aws_transcribe_api/transcribe-2017-10-26.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_transcribe_api'));

  test('ensure_compilation', () {
    TranscribeService(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
