@Tags(['presubmit-only'])
import 'package:aws_storagegateway_api/storagegateway-2013-06-30.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_storagegateway_api'));

  test('ensure_compilation', () {
    StorageGateway(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
