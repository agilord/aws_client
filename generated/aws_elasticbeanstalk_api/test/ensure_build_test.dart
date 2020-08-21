import 'package:aws_elasticbeanstalk_api/elasticbeanstalk-2010-12-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_elasticbeanstalk_api'));

  t.test('ensure_compilation', () {
    ElasticBeanstalk(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
