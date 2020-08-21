@Tags(['presubmit-only'])
import 'package:aws_ram_api/ram-2018-01-04.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_ram_api'));

  test('ensure_compilation', () {
    RAM(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
