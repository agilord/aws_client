import 'package:aws_client.generator/model/api.dart';

String buildTest(String packageRelativeDirectory, Api api) =>
    '''import 'package:${api.packageName}/${api.fileBasename}.dart';
import 'package:test/test.dart' as t;

@t.Tags(['presubmit-only'])
void main() {
  t.test('ensure_compilation', () {
    ${api.metadata.className}(
      region: '',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );
  });
}
''';
