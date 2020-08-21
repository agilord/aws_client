@Tags(['presubmit-only'])
import 'package:aws_rekognition_api/rekognition-2016-06-27.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_rekognition_api'));

  test('ensure_compilation', () {
    Rekognition(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
