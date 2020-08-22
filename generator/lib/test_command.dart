import 'dart:io';

import 'package:args/command_runner.dart';

class TestCommand extends Command {
  @override
  String get name => 'test';

  @override
  String get description => 'Run tests in generated packages';

  @override
  void run() async {
    final stopwatch = Stopwatch()..start();
    final packages =
        Directory('../generated').listSync().map((e) => e.path).toList();
    print('Running tests in generated packages.');

    final testFutures = List.generate(
        (Platform.numberOfProcessors - 1)
            .clamp(1, Platform.numberOfProcessors)
            .toInt(),
        (index) async => _runTests(packages));
    await Future.wait(testFutures);
    print('Tests finished in ${stopwatch.elapsed}');
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

  Future<void> _runTests(List<String> dirs) async {
    while (dirs.isNotEmpty) {
      final baseDir = dirs.removeLast();
      final dirsLeft = dirs.length;

      print('Running tests in $baseDir, dirs left: $dirsLeft');

      await _getDependencies(baseDir);

      final pr = await Process.run(
        'pub',
        [
          'run',
          'test',
          '-n',
          'ensure_compilation',
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
}
