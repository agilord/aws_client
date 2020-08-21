@Tags(['presubmit-only'])
import 'package:aws_qldb_session_api/qldb-session-2019-07-11.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_qldb_session_api'));

  test('ensure_compilation', () {
    QLDBSession(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
