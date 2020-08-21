@Tags(['presubmit-only'])
import 'package:aws_es_api/es-2015-01-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test('ensure_build',
      () => expectBuildClean(packageRelativeDirectory: 'generated/aws_es_api'));

  test('ensure_compilation', () {
    ElasticsearchService(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
