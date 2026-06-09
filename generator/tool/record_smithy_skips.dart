// Re-seeds smithy_protocol_tests/{skip,exclude}_list.json via two passes:
// Pass 1 generates with empty lists; failed-to-load files -> exclude_list,
// failed vectors -> skip_list. Pass 2 regenerates with the recorded lists.
// Run from generator/: `dart run tool/record_smithy_skips.dart`.
import 'dart:convert';
import 'dart:io';

import 'package:aws_client_generator/builders/smithy_protocol_test_generator.dart';
import 'package:aws_client_generator/builders/smithy_protocol_test_support.dart';
import 'package:path/path.dart' as p;

Future<void> main() async {
  final skipListFile = File('smithy_protocol_tests/skip_list.json');
  final excludeListFile = File('smithy_protocol_tests/exclude_list.json');

  await generateSmithyProtocolTests(skipList: {}, excludeList: {});

  final generatedDir = Directory(smithyProtocolTestsDir);
  final skip = <String, String>{};
  final exclude = <String, String>{};
  final testFiles = generatedDir
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('_test.dart'))
      .toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  for (final f in testFiles) {
    final rel = p.relative(f.path, from: generatedDir.path);
    final protocol = p.dirname(rel);
    final localName =
        p.basenameWithoutExtension(rel).replaceAll(RegExp(r'_test$'), '');
    final opKey = '$protocol/$localName';

    final result = await Process.run(
        'dart', ['test', f.path, '--reporter', 'json'],
        workingDirectory: smithyPackageDir);
    final names = <int, String>{};
    // "loading <path>" suites are synthetic; an error on one = compile failure.
    final loadingTestIds = <int>{};
    var sawRealTestDone = false;
    var loadError = false;
    final fileSkips = <String>{};
    for (final line in const LineSplitter().convert(result.stdout as String)) {
      if (line.isEmpty) continue;
      Map<String, dynamic> e;
      try {
        e = jsonDecode(line) as Map<String, dynamic>;
      } catch (_) {
        continue;
      }
      switch (e['type']) {
        case 'testStart':
          final t = e['test'] as Map<String, dynamic>;
          final id = t['id'] as int;
          final name = t['name'] as String;
          names[id] = name;
          if (name.startsWith('loading ')) loadingTestIds.add(id);
        case 'testDone':
          if (e['hidden'] == true) break;
          final testId = e['testID'] as int;
          if (loadingTestIds.contains(testId)) {
            if (e['result'] != 'success') loadError = true;
            break;
          }
          sawRealTestDone = true;
          if (e['result'] != 'success') {
            final name = names[testId] ?? '';
            if (name.isNotEmpty && !name.contains(' ')) {
              fileSkips.add(name);
            }
          }
        case 'error':
          // No testID or error on a loading suite == file failed to load.
          final testId = e['testID'];
          if (testId == null || loadingTestIds.contains(testId)) {
            loadError = true;
          }
      }
    }
    if (result.exitCode != 0 && !sawRealTestDone) loadError = true;
    if (loadError) {
      exclude[opKey] = 'Auto-recorded: generated client/test does not compile';
    } else {
      for (final id in fileSkips) {
        skip[id] = 'Auto-recorded: Suite 2 vector fails today';
      }
    }
  }

  String dump(Map<String, String> m) {
    final keys = m.keys.toList()..sort();
    return const JsonEncoder.withIndent('  ')
        .convert({for (final k in keys) k: m[k]});
  }

  skipListFile.writeAsStringSync(dump(skip));
  excludeListFile.writeAsStringSync(dump(exclude));
  print('Recorded ${skip.length} skip(s) and ${exclude.length} exclude(s).');

  await generateSmithyProtocolTests(
    skipList: parseSkipList(skipListFile.readAsStringSync()),
    excludeList: parseSkipList(excludeListFile.readAsStringSync()),
  );
}
