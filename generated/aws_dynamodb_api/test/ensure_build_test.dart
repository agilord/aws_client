@Tags(['presubmit-only'])
import 'package:aws_dynamodb_api/dynamodb-2012-08-10.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_dynamodb_api'));

  test('ensure_compilation', () {
    DynamoDB(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
