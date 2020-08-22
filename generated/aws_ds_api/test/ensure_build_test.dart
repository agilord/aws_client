import 'package:aws_ds_api/ds-2015-04-16.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test('ensure_build',
      () => expectBuildClean(packageRelativeDirectory: 'generated/aws_ds_api'));

  t.test('ensure_compilation', () {
    DirectoryService(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
