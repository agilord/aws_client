import 'package:aws_client.generator/model/api.dart';

String buildTest(String packageRelativeDirectory, Api api) =>
    '''@Tags(['presubmit-only'])
import 'package:${api.packageName}/${api.fileBasename}.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test('ensure_build',
      () => expectBuildClean(packageRelativeDirectory: '$packageRelativeDirectory'));

  test('ensure_compilation', () {
    ${api.metadata.className}(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
''';
