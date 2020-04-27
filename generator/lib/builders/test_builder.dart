String buildVerifyTest(String packageRelativeDirectory) =>
    '''@Tags(['presubmit-only'])

import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test('ensure_build',
      () => expectBuildClean(packageRelativeDirectory: '$packageRelativeDirectory'));
}
''';

String buildCompileTest({String className, String importPath}) =>
    '''import 'package:test/test.dart';
import 'package:$importPath.dart';

void main() {
  test('ensure_compilation', () {
    final instance = $className(region: '');
    print(instance);
  });
}
''';
