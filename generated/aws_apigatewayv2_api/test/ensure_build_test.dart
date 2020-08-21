@Tags(['presubmit-only'])
import 'package:aws_apigatewayv2_api/apigatewayv2-2018-11-29.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_apigatewayv2_api'));

  test('ensure_compilation', () {
    ApiGatewayV2(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
