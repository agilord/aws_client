@Tags(['presubmit-only'])
import 'package:aws_lex_models_api/lex-models-2017-04-19.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_lex_models_api'));

  test('ensure_compilation', () {
    LexModelBuildingService(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
