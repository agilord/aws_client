@Tags(['presubmit-only'])
import 'package:aws_docdb_api/docdb-2014-10-31.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_docdb_api'));

  test('ensure_compilation', () {
    DocDB(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
