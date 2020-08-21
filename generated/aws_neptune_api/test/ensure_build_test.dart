@Tags(['presubmit-only'])
import 'package:aws_neptune_api/neptune-2014-10-31.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_neptune_api'));

  test('ensure_compilation', () {
    Neptune(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
