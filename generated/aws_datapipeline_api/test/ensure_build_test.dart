@Tags(['presubmit-only'])
import 'package:aws_datapipeline_api/datapipeline-2012-10-29.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_datapipeline_api'));

  test('ensure_compilation', () {
    DataPipeline(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
