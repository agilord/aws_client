import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:http/http.dart';
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
    addSubcommand(PublishCommand());
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
      )
      ..addOption(
        'config-file',
        help: 'Configuration file describing package generation.',
        defaultsTo: 'config.yaml',
      );
  }

  @override
  Future<void> run() async {
    final config = _loadConfig(argResults['config-file'] as String);
    final packages = await _scanPackages(config);

    for (final package in packages) {
      final pkgDir = '../generated/$package';
      final allChanges = await _listChanges(pkgDir);
      final currentHash = allChanges.isEmpty ? null : allChanges.first.hash;

      final pubspecFile = File('$pkgDir/pubspec.yaml');
      final pubspecString = pubspecFile.readAsStringSync();
      final pubspecMap = json.decode(json.encode(loadYaml(pubspecString)))
          as Map<String, dynamic>;
      final protocolConfig = config.protocols[pubspecMap['protocol']];
      if (!protocolConfig.publish) continue;

      final currentVersion = Version.parse(pubspecMap['version'] as String);
      Version newVersion;

      final changelogFile = File('$pkgDir/CHANGELOG.md');
      final changelogExists = changelogFile.existsSync();
      var changelogContent = '';
      if (changelogExists) {
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

      final newSharedVersion = protocolConfig.shared;
      final oldSharedVersion =
          pubspecMap['dependencies']['shared_aws_api'] as String;

      // no change needed ?
      if (currentHash != null &&
          currentHash.trim().isNotEmpty &&
          changelogContent.contains(currentHash) &&
          oldSharedVersion == newSharedVersion) {
        print('$package will not be bumped');
        continue;
      }

      if (oldSharedVersion == newSharedVersion &&
          currentVersion == newVersion) {
        continue;
      }

      final updateLines = [
        '## $newVersion',
        if (currentHash?.trim()?.isNotEmpty == true) ...[
          '',
          '(git hash: $currentHash)',
          '',
        ],
        if (!currentChanges.any((c) => c.isQualified)) '- initial release',
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
            RegExp(r'shared_aws_api: \^*\d\.\d\.\d(.)*'),
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
        .replaceAll(' . (', '. (') // xyz [patch]. (#XX)
        .trim();
  }
}

Config _loadConfig(String configFilePath) {
  return Config.fromJson(json.decode(
          json.encode(loadYaml(File(configFilePath).readAsStringSync())))
      as Map<String, dynamic>);
}

Future<List<String>> _scanPackages(Config config) async {
  // TODO: scan ../generated/ directory for packages if config.packages is empty
  return config.packages;
}

class PublishCommand extends Command {
  @override
  String get name => 'publish';

  @override
  String get description =>
      'Publish the packages that are not yet published with their last commited version.';

  PublishCommand() {
    argParser
      ..addFlag(
        'dry-run',
        abbr: 'n',
        help: 'Do not actually publish the packages.',
      )
      ..addOption(
        'config-file',
        help: 'Configuration file describing package generation.',
        defaultsTo: 'config.yaml',
      );
  }

  @override
  Future<void> run() async {
    final isDryRun = argResults['dry-run'] as bool;
    final config = _loadConfig(argResults['config-file'] as String);
    final packages = await _scanPackages(config);

    final client = Client();

    for (final package in packages) {
      final pkgDir = '../generated/$package';

      final pubspecFile = File('$pkgDir/pubspec.yaml');
      final pubspecString = pubspecFile.readAsStringSync();
      final pubspecMap = json.decode(json.encode(loadYaml(pubspecString)))
          as Map<String, dynamic>;
      final version = pubspecMap['version'] as String;
      final protocol = pubspecMap['protocol'] as String;
      final protocolConfig = config.protocols[protocol];
      assert(protocolConfig != null);

      if (!protocolConfig.publish) continue;

      final currentPublishedVersion =
          await _currentPublishedVersion(client, package);

      if (version == currentPublishedVersion) {
        print('Version $version of $package is already published.');
        continue;
      }

      print('$package: $currentPublishedVersion -> $version.');
      if (!isDryRun) {
        final pr = await Process.run(
          'pub',
          ['publish', '--force'],
          workingDirectory: pkgDir,
        );
        print(pr.stdout
            .toString()
            .split('\n')
            .map((l) => '  [OUT] $l')
            .join('\n'));
        print(pr.stderr
            .toString()
            .split('\n')
            .map((l) => '  [ERR] $l')
            .join('\n'));
        if (pr.exitCode != 0) {
          throw Exception('Unable to publish.');
        }
      }
    }

    client.close();
  }

  Future<String> _currentPublishedVersion(Client client, String package) async {
    final rs = await client.get('https://pub.dev/api/packages/$package');
    if (rs.statusCode == 404) return null;
    if (rs.statusCode == 200) {
      final body = json.decode(rs.body);
      final latest = body['latest'] as Map<String, dynamic>;
      return latest['version'] as String;
    }
    throw Exception('Unexpected status code: ${rs.statusCode}');
  }
}
