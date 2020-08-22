import 'package:aws_client.generator/model/api.dart';

String buildTest(String packageRelativeDirectory, Api api) =>
    '''import 'package:${api.packageName}/${api.fileBasename}.dart';
import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test('ensure_build',
      () => expectBuildClean(packageRelativeDirectory: '$packageRelativeDirectory'));

  t.test('ensure_compilation', () {
    ${api.metadata.className}(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
''';
