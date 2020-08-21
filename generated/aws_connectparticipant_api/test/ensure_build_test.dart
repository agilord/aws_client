@Tags(['presubmit-only'])
import 'package:aws_connectparticipant_api/connectparticipant-2018-09-07.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_connectparticipant_api'));

  test('ensure_compilation', () {
    ConnectParticipant(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
