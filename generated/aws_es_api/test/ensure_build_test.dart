import 'package:aws_es_api/es-2015-01-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test('ensure_build',
      () => expectBuildClean(packageRelativeDirectory: 'generated/aws_es_api'));

  t.test('ensure_compilation', () {
    ElasticsearchService(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
