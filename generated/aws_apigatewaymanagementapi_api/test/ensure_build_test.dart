@Tags(['presubmit-only'])
import 'package:aws_apigatewaymanagementapi_api/apigatewaymanagementapi-2018-11-29.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory:
              'generated/aws_apigatewaymanagementapi_api'));

  test('ensure_compilation', () {
    ApiGatewayManagementApi(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
