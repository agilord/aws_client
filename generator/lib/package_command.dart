import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:yaml/yaml.dart';

import 'model/config.dart';

class PackageCommand extends Command {
  @override
  String get name => 'package';

  @override
  String get description => 'Handles tasks related to the generated packages.';

  PackageCommand() {
    addSubcommand(BumpVersionCommand());
    // TODO: add sub-command for releasing the packages
  }
}

class BumpVersionCommand extends Command {
  @override
  String get name => 'bump';

  @override
  String get description => 'Checks git log, updates changelog and version.';

  BumpVersionCommand() {
    argParser
      ..addOption(
        'version',
        help: 'The new version to use.',
      )
      ..addOption(
        'version-increment',
        help: 'The increment type to use.',
        allowed: ['major', 'minor', 'patch'],
        defaultsTo: 'patch',
      )
      ..addOption(
        'config-file',
        help: 'Configuration file describing package generation.',
        defaultsTo: 'config.yaml',
      );
  }

  @override
  Future<void> run() async {
    final config = Config.fromJson(json.decode(json.encode(loadYaml(
            File(argResults['config-file'] as String).readAsStringSync())))
        as Map<String, dynamic>);

    // TODO: scan ../generated/ directory for packages if config.packages is empty
    final packages = config.packages;
    for (final package in packages) {
      final pkgDir = '../generated/$package';
      final allChanges = await _listChanges(pkgDir);
      final currentHash = allChanges.isEmpty ? null : allChanges.first.hash;

      final changelogFile = File('$pkgDir/CHANGELOG.md');
      String changelogContent;
      if (changelogFile.existsSync()) {
        changelogContent = changelogFile.readAsStringSync();
      } else {
        changelogContent = '';
      }

      // no change needed ?
      if (currentHash != null && changelogContent.contains(currentHash)) {
        continue;
      }

      // TODO: read current version
      // TODO: increment version per the command line arguments

      // TODO: filter out changelog-related commits
      final oldCommit = allChanges.firstWhere(
          (c) => changelogContent.contains(c.hash),
          orElse: () => null);
      final currentChanges = oldCommit == null
          ? allChanges
          : allChanges.sublist(0, allChanges.indexOf(oldCommit));

      final updateLines = [
        // TODO: use the correct version
        '## 0.0.1',
        '',
        '(git hash: $currentHash)',
        '',
        ...currentChanges.map((c) => '- ${c.message}'),
      ];

      // insert new entries in the beginning of the file
      final newChangelogContent =
          '${updateLines.join('\n')}\n\n$changelogContent';
      changelogFile.writeAsStringSync(newChangelogContent);

      // TODO: update pubspec.yaml with the new version
      // TODO: commit new changelog and pubspec.yaml with the updates (+ push?)
    }
  }
}

Future<List<_Commit>> _listChanges(String dir) async {
  final pr = await Process.run('git', ['log', '--format=oneline', '--', dir]);
  if (pr.exitCode != 0) {
    throw Exception('Error while running git log in $dir: ${pr.stderr}');
  }
  final lines = pr.stdout.toString().split('\n');
  return lines.map((line) => _Commit.parse(line)).toList();
}

class _Commit {
  final String hash;
  final String message;

  _Commit(this.hash, this.message);

  factory _Commit.parse(String line) {
    final hash = line.split(' ').first;
    final message = line.substring(hash.length).trim();
    return _Commit(hash, message);
  }
}
