import 'package:aws_apigatewaymanagementapi_api/apigatewaymanagementapi-2018-11-29.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory:
              'generated/aws_apigatewaymanagementapi_api'));

  t.test('ensure_compilation', () {
    ApiGatewayManagementApi(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
