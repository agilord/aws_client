@Tags(['presubmit-only'])
import 'package:aws_dax_api/dax-2017-04-19.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_dax_api'));

  test('ensure_compilation', () {
    DAX(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
