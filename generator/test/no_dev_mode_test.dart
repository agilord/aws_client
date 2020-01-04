@Tags(['presubmit-only'])

import 'dart:io';

import 'package:path/path.dart';
import 'package:test/test.dart';

void main() {
  test('Generated pubspec.yaml should not have dev mode artifacts.', () async {
    final generatedDir = Directory('../generated');
    await generatedDir.create(recursive: true);
    await generatedDir
        .list(recursive: true)
        .where((f) => f is File)
        .cast<File>()
        .where((f) => basename(f.path) == 'pubspec.yaml')
        .forEach(
      (file) {
        final content = file.readAsStringSync();
        expect(content, isNot(contains('dependency_overrides')));
        expect(content, isNot(contains('../../shared_aws_api')));
      },
    );
  });
}
