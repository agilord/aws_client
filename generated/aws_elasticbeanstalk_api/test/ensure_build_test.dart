@Tags(['presubmit-only'])
import 'package:aws_elasticbeanstalk_api/elasticbeanstalk-2010-12-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_elasticbeanstalk_api'));

  test('ensure_compilation', () {
    ElasticBeanstalk(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
