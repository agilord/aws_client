@Tags(['presubmit-only'])

import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
      'ensure_build',
      () => expectBuildClean(
          packageRelativeDirectory: 'generated/aws_neptune_api'));
}
