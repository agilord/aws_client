@Tags(['presubmit-only'])

import 'dart:io';

import 'package:path/path.dart';
import 'package:test/test.dart';

void main() {
  test('Generated pubspec.yaml should not have dev mode artifacts.', () async {
    final generatedDir = Directory('../generated');
    await generatedDir.create(recursive: true);
    final pubspecFiles = await generatedDir
        .list(recursive: true)
        .where((f) => f is File)
        .cast<File>()
        .where((f) => basename(f.path) == 'pubspec.yaml')
        .toList();
    for (final file in pubspecFiles) {
      final content = await file.readAsString();
      expect(content, isNot(contains('dependency_overrides')));
      expect(content, isNot(contains('../../shared_aws_api')));
    }
  });
}
