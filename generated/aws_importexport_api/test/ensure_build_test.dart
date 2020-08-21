@Tags(['presubmit-only'])
import 'package:aws_importexport_api/importexport-2010-06-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_importexport_api'));

  test('ensure_compilation', () {
    ImportExport(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
