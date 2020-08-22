import 'package:aws_datasync_api/datasync-2018-11-09.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_datasync_api'));

  t.test('ensure_compilation', () {
    DataSync(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
