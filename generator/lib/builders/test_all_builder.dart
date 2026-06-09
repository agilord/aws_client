import 'dart:io';

import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' as p;

void generateTestAllFile(Directory root) {
  final allFiles = root
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('_test.dart'))
      .map((file) =>
          p.relative(file.path, from: root.path).replaceAll(p.separator, '/'))
      .toList();
  allFiles.sort();

  final buffer = StringBuffer();
  buffer.writeln("import 'package:test/test.dart';");
  for (var i = 0; i < allFiles.length; i++) {
    final file = allFiles[i];
    buffer.writeln("import '$file' as _i$i;");
  }

  buffer.writeln('void main() {');
  for (var i = 0; i < allFiles.length; i++) {
    final file = allFiles[i].replaceAll('.dart', '');
    buffer.writeln("group('$file', _i$i.main);");
  }
  buffer.writeln('}');

  File('${root.path}/test_all.dart')
      .writeAsStringSync(DartFormatter().format(buffer.toString()));
}
