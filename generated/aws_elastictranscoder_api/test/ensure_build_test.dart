import 'package:aws_elastictranscoder_api/elastictranscoder-2012-09-25.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_elastictranscoder_api'));

  t.test('ensure_compilation', () {
    ElasticTranscoder(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
