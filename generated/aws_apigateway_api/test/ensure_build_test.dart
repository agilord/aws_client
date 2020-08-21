@Tags(['presubmit-only'])
import 'package:aws_apigateway_api/apigateway-2015-07-09.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_apigateway_api'));

  test('ensure_compilation', () {
    APIGateway(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
