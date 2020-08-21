@Tags(['presubmit-only'])
import 'package:aws_elasticache_api/elasticache-2015-02-02.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_elasticache_api'));

  test('ensure_compilation', () {
    ElastiCache(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
