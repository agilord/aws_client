import 'dart:io';

import 'package:args/command_runner.dart';

class TestCommand extends Command {
  @override
  String get name => 'test';

  @override
  String get description => 'Run tests in generated packages';

  @override
  void run() async {
    final packages = Directory('../generated').listSync();
    print('Running tests in generated packages.');
    final length = packages.length;
    for (var i = 0; i < length; i++) {
      final package = packages[i];
      print('$i/$length ${package.path}');
      await _getDependencies(package.path);
      await _runTests(package.path);
    }
  }

  Future<void> _getDependencies(String baseDir, {bool upgrade = true}) async {
    final pr = await Process.run(
      'pub',
      [
        if (upgrade) 'upgrade',
        if (!upgrade) 'get',
        '--no-precompile',
      ],
      workingDirectory: baseDir,
    );
    if (pr.exitCode != 0) {
      print(pr.stdout);
      print(pr.stderr);
      throw Exception('pub get failed at $baseDir');
    }
  }

  Future<void> _runTests(String baseDir) async {
    final pr = await Process.run(
      'pub',
      [
        'run',
        'test',
      ],
      workingDirectory: baseDir,
    );
    if (pr.exitCode != 0) {
      print(pr.stdout);
      print(pr.stderr);
      throw Exception('pub run test failed at $baseDir');
    }
  }
}
