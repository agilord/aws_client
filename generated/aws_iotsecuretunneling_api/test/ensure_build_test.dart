import 'package:aws_iotsecuretunneling_api/iotsecuretunneling-2018-10-05.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_iotsecuretunneling_api'));

  t.test('ensure_compilation', () {
    IoTSecureTunneling(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
