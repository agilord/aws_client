import 'package:aws_globalaccelerator_api/globalaccelerator-2018-08-08.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_globalaccelerator_api'));

  t.test('ensure_compilation', () {
    GlobalAccelerator(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
