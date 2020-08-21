@Tags(['presubmit-only'])
import 'package:aws_appmesh_api/appmesh-2019-01-25.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_appmesh_api'));

  test('ensure_compilation', () {
    AppMesh(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
