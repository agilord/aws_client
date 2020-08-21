@Tags(['presubmit-only'])
import 'package:aws_amplify_api/amplify-2017-07-25.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_amplify_api'));

  test('ensure_compilation', () {
    Amplify(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
