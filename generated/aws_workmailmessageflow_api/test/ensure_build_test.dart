import 'package:aws_workmailmessageflow_api/workmailmessageflow-2019-05-01.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_workmailmessageflow_api'));

  t.test('ensure_compilation', () {
    WorkMailMessageFlow(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
