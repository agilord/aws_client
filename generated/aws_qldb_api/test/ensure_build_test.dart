@Tags(['presubmit-only'])
import 'package:aws_qldb_api/qldb-2019-01-02.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () =>
          expectBuildClean(packageRelativeDirectory: 'generated/aws_qldb_api'));

  test('ensure_compilation', () {
    QLDB(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
