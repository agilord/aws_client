@Tags(['presubmit-only'])
import 'package:aws_mediatailor_api/mediatailor-2018-04-23.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_mediatailor_api'));

  test('ensure_compilation', () {
    MediaTailor(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
