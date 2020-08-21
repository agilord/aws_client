@Tags(['presubmit-only'])
import 'package:aws_textract_api/textract-2018-06-27.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_textract_api'));

  test('ensure_compilation', () {
    Textract(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
