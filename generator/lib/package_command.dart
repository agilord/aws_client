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
        help: 'Force a specific new version to use.',
      )
      ..addOption(
        'version-increment',
        help: 'The increment type to use (augments commit messages).',
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

      final pubspecFile = File('$pkgDir/pubspec.yaml');
      final pubspecString = pubspecFile.readAsStringSync();
      final pubspecMap = json.decode(json.encode(loadYaml(pubspecString)))
          as Map<String, dynamic>;

      final currentVersion = Version.parse(pubspecMap['version'] as String);
      Version newVersion;

      final changelogFile = File('$pkgDir/CHANGELOG.md');
      var changelogContent = '## $currentVersion\n- initial release';
      if (changelogFile.existsSync()) {
        changelogContent = changelogFile.readAsStringSync();
      }

      final oldCommit = allChanges.firstWhere(
          (c) => changelogContent.contains(c.hash),
          orElse: () => null);
      final currentChanges = oldCommit == null
          ? allChanges
          : allChanges.sublist(0, allChanges.indexOf(oldCommit));

      if (argResults['version'] == null) {
        final increment = argResults['version-increment'] as String;
        final changeMajor =
            increment == 'major' || currentChanges.any((c) => c.isMajor);
        final changeMinor =
            increment == 'minor' || currentChanges.any((c) => c.isMinor);
        final changePatch =
            increment == 'patch' || currentChanges.any((c) => c.isPatch);

        if (changeMajor) {
          newVersion = currentVersion.incrementMajor();
        } else if (changeMinor) {
          newVersion = currentVersion.incrementMinor();
        } else if (changePatch) {
          newVersion = currentVersion.incrementPatch();
        } else {
          newVersion = currentVersion;
        }
      } else {
        newVersion = Version.parse(argResults['version'] as String);
      }

      final protocolConfig = config.protocols[pubspecMap['protocol']];
      final newSharedVersion = protocolConfig.shared;
      final oldSharedVersion =
          pubspecMap['dependencies']['aws_client'] as String;

      // no change needed ?
      if (currentHash != null &&
          currentHash.trim().isNotEmpty &&
          changelogContent.contains(currentHash) &&
          oldSharedVersion == newSharedVersion) {
        print('$package will not be bumped');
        continue;
      }

      final updateLines = [
        '## $newVersion',
        if (currentHash?.trim()?.isNotEmpty == true) ...[
          '',
          '(git hash: $currentHash)',
          '',
        ],
        ...currentChanges
            .where((c) => c.isQualified)
            .map((c) => '- ${c.formattedMessage}'),
      ];

      // insert new entries in the beginning of the file
      final newChangelogContent =
          '${updateLines.join('\n')}\n\n$changelogContent';
      changelogFile.writeAsStringSync(newChangelogContent);

      final newPubspecString = pubspecString
          .replaceAll(
            RegExp(r'version: \d\.\d\.\d'),
            'version: $newVersion',
          )
          .replaceAll(
            RegExp(r'shared_aws_api: \d\.\d\.\d(.)*'),
            'shared_aws_api: $newSharedVersion',
          );
      pubspecFile.writeAsStringSync(newPubspecString);
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

  @override
  String toString() => '$hash $message';

  bool get isMajor => message.contains('[major]');
  bool get isMinor => message.contains('[minor]');
  bool get isPatch => message.contains('[patch]');

  bool get isQualified => isMajor || isMinor || isPatch;

  String get formattedMessage {
    // TODO: convert (#XYZ) to GitHub PR links.
    return message
        .replaceAll('[major]', '')
        .replaceAll('[minor]', '')
        .replaceAll('[patch]', '')
        .replaceAll('  ', ' ')
        .trim();
  }
}
