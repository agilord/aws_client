import 'package:aws_alexaforbusiness_api/alexaforbusiness-2017-11-09.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_alexaforbusiness_api'));

  t.test('ensure_compilation', () {
    AlexaForBusiness(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
