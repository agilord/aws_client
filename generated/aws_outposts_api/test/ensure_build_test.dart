@Tags(['presubmit-only'])
import 'package:aws_outposts_api/outposts-2019-12-03.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_outposts_api'));

  test('ensure_compilation', () {
    Outposts(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
