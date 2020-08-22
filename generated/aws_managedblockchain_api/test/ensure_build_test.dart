import 'package:aws_managedblockchain_api/managedblockchain-2018-09-24.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_managedblockchain_api'));

  t.test('ensure_compilation', () {
    ManagedBlockchain(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
