import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:dart_style/dart_style.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:version/version.dart';
import 'package:yaml/yaml.dart';

import 'download_command.dart';
import 'library_builder.dart';
import 'model/config.dart';
import 'pubspec_builder.dart';

class GenerateCommand extends Command {
  @override
  String get name => 'generate';

  @override
  String get description =>
      'Generates the API from the downloaded API definitions.';

  GenerateCommand() {
    argParser
      ..addFlag(
        'download',
        abbr: 'd',
        help: 'Downloads the definitions first before generating',
      )
      ..addFlag(
        'build',
        help: 'Runs pub get and build_runner on the generated code',
        defaultsTo: true,
        negatable: true,
      )
      ..addFlag(
        'format',
        abbr: 'f',
        help: 'Runs dartfmt on the generated code',
        defaultsTo: true,
        negatable: true,
      )
      ..addFlag(
        'bump',
        abbr: 'b',
        help: 'Automatically bump package versions on code changes',
      )
      ..addFlag('dev',
          help: 'Generates packages in dev mode with dependency overrides')
      ..addOption(
        'config-file',
        help: 'Configuration file describing package generation.',
        defaultsTo: 'config.yaml',
      );
  }

  @override
  Future<void> run() async {
    final stopwatch = Stopwatch()..start();
    if (argResults['download'] == true) {
      await DownloadCommand().run();
    }
    await _generateClasses();

    print('Generator finished in ${stopwatch.elapsed}');
  }

  Future _generateClasses() async {
    print('Generating Dart classes...');
    final devMode = argResults['dev'] == true;

    final config = Config.fromJson(json.decode(json.encode(loadYaml(
            File(argResults['config-file'] as String).readAsStringSync())))
        as Map<String, dynamic>);

    final formatter = DartFormatter(fixes: StyleFix.all);
    final dir = Directory('./apis');
    final files = dir.listSync();
    final services = <String>{};

    files.forEach((ent) {
      final parts = ent.uri.pathSegments.last.split('.')
        ..removeLast()
        ..removeLast();
      services.add(parts.join('.'));
    });

    final touchedDirs = <String>{};

    for (final service in services) {
      final def = File('./apis/$service.normal.json');

      final defJson =
          jsonDecode(def.readAsStringSync()) as Map<String, dynamic>;

      try {
        final api = Api.fromJson(defJson);
        if (api.isRecognized &&
            (config.packages == null ||
                config.packages.contains(api.packageName))) {
          print(
              'Generating ${api.fileBasename} for package:${api.packageName}');
          // create directories
          final baseDir = '../generated/${api.packageName}';
          final serviceFile = File('$baseDir/lib/${api.fileBasename}.dart');
          final pubspecFile = File('$baseDir/pubspec.yaml');
          serviceFile.parent.createSync(recursive: true);

          var serviceText = buildService(api);
          if (argResults['format'] == true) {
            serviceText = formatter.format(serviceText, uri: serviceFile.uri);
          }

          String pubspecYaml;
          final sharedVersion = config.sharedVersions[api.metadata.protocol];

          if (pubspecFile.existsSync() && !devMode) {
            String oldServiceText;

            if (serviceFile.existsSync()) {
              oldServiceText = serviceFile.readAsStringSync();
            }

            final pubspecJson = loadYaml(pubspecFile.readAsStringSync());
            final version = Version.parse(pubspecJson['version'] as String);
            var newVersion = version.toString();
            final shouldBump =
                pubspecJson['dependencies']['aws_client'] != sharedVersion ||
                    oldServiceText != serviceText;

            if (shouldBump && argResults['bump'] == true) {
              newVersion = version.incrementPatch().toString();
              print('Bumping ${api.packageName} from $version to $newVersion');
            }

            pubspecYaml = buildPubspecYaml(
              api,
              packageVersion: newVersion,
              sharedVersion: sharedVersion,
              isDevMode: devMode,
            );
          } else {
            pubspecYaml = buildPubspecYaml(
              api,
              packageVersion: '0.0.1',
              sharedVersion: sharedVersion,
              isDevMode: devMode,
            );
          }

          pubspecFile.writeAsStringSync(pubspecYaml);
          serviceFile.writeAsStringSync(serviceText);
          touchedDirs.add(baseDir);
        } else {
          print('API in ${def.path} was not recognized.');
        }
      } on UnrecognizedKeysException catch (e) {
        print('Error deserializing $service');
        print(e.message);
        rethrow;
      } catch (e) {
        print('Error "${e.runtimeType}" deserializing $service');
        rethrow;
      }
    }

    if (argResults['build'] == true) {
      for (final baseDir in touchedDirs) {
        // TODO: once in git, detect if there was no change, and skip when not needed
        await _runPubGet(baseDir);
        // TODO: once in git, detect if there was no change, and skip when not needed
        await _runBuildRunner(baseDir);
      }
    }

    print('Dart classes generated');
  }

  Future<void> _runPubGet(String baseDir) async {
    print('Running pub get in $baseDir ...');
    final pr = await Process.run(
      'pub',
      ['get'],
      workingDirectory: baseDir,
    );
    if (pr.exitCode != 0) {
      print(pr.stdout);
      print(pr.stderr);
      throw Exception('pub get failed at $baseDir');
    }
  }

  Future<void> _runBuildRunner(String baseDir) async {
    print('Running build_runner in $baseDir ...');
    final pr = await Process.run(
      'pub',
      ['run', 'build_runner', 'build'],
      workingDirectory: baseDir,
    );
    if (pr.exitCode != 0) {
      print(pr.stdout);
      print(pr.stderr);
      throw Exception('build_runner failed at $baseDir');
    }
  }
}
