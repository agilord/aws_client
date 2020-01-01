import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:version/version.dart';
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
    final allChanges = await _listChanges();
    final currentHash = allChanges.isEmpty ? null : allChanges.first.hash;

    for (final package in packages) {
      final pkgDir = '../generated/$package';

      final pubspecFile = File('$pkgDir/pubspec.yaml');
      final pubspecString = pubspecFile.readAsStringSync();
      final pubspecMap = json.decode(json.encode(loadYaml(pubspecString)))
          as Map<String, dynamic>;

      final currentVersion = Version.parse(pubspecMap['version'] as String);
      Version newVersion;
      switch (argResults['version-increment'] as String) {
        case 'major':
          newVersion = currentVersion.incrementMajor();
          break;
        case 'minor':
          newVersion = currentVersion.incrementMinor();
          break;
        case 'patch':
          newVersion = currentVersion.incrementPatch();
          break;
        default:
          throw ArgumentError('Unknown "--version-increment" argument');
      }

      final changelogFile = File('$pkgDir/CHANGELOG.md');
      String changelogContent;
      if (changelogFile.existsSync()) {
        changelogContent = changelogFile.readAsStringSync();
      } else {
        changelogFile.createSync();
        // Beginning of package generation
        changelogContent =
            '## 0.0.0\n\n(git hash: 174403e7de7d5e7b96f987f34481209b3c3ee265)';
      }

      // no change needed ?
      if (currentHash != null && changelogContent.contains(currentHash)) {
        continue;
      }

      // TODO: filter out changelog-related commits
      final oldCommit = allChanges.firstWhere(
          (c) => changelogContent.contains(c.hash),
          orElse: () => null);
      final currentChanges = oldCommit == null
          ? allChanges
          : allChanges.sublist(0, allChanges.indexOf(oldCommit));

      final updateLines = [
        '## $newVersion',
        '',
        '(git hash: $currentHash)',
        '',
        ...currentChanges.map((c) => '- ${c.message}'),
      ];

      // insert new entries in the beginning of the file
      final newChangelogContent =
          '${updateLines.join('\n')}\n\n$changelogContent';
      changelogFile.writeAsStringSync(newChangelogContent);

      final newPubspecString = pubspecString.replaceAll(
        RegExp(r'version: \d\.\d\.\d'),
        'version: $newVersion',
      );
      pubspecFile.writeAsStringSync(newPubspecString);
      // TODO: commit new changelog and pubspec.yaml with the updates (+ push?)
    }
  }
}

Future<List<_Commit>> _listChanges() async {
  final pr = await Process.run('git', ['log', '--format=oneline', '--']);
  if (pr.exitCode != 0) {
    throw Exception('Error while running git log: ${pr.stderr}');
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

  @override
  String toString() => '$hash $message';
}
