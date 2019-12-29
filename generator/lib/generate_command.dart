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

    final config =
        loadYaml(File(argResults['config-file'] as String).readAsStringSync());
    final packagesToGenerate = config['packages'] as YamlList;

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

    services.forEach((service) {
      final def = File('./apis/$service.normal.json');

      final defJson =
          jsonDecode(def.readAsStringSync()) as Map<String, dynamic>;

      try {
        final api = Api.fromJson(defJson);
        if (api.isRecognized && packagesToGenerate.contains(api.packageName)) {
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

          dynamic pubspecJson;
          final sharedVersion =
              config['shared_version'][api.metadata.protocol] as String;

          if (pubspecFile.existsSync() && !devMode) {
            String oldServiceText;

            if (serviceFile.existsSync()) {
              oldServiceText = serviceFile.readAsStringSync();
            }

            pubspecJson = jsonDecode(pubspecFile.readAsStringSync());
            final version = Version.parse(pubspecJson['version'] as String);
            final bumpedVersion = version.incrementPatch().toString();
            final shouldBump =
                pubspecJson['dependencies']['aws_client'] != sharedVersion ||
                    oldServiceText != serviceText;

            if (shouldBump && argResults['bump'] == true) {
              print(
                  'Bumping ${api.packageName} from $version to $bumpedVersion');

              pubspecJson['version'] = bumpedVersion;
            }

            pubspecJson['dependencies']['aws_client'] = sharedVersion;
          } else {
            pubspecJson = {
              'environment': {'sdk': '>=2.6.0 <3.0.0'},
              'version': '0.0.1',
              'name': 'aws_client.${api.packageName}',
              'dependencies': {
                'json_annotation': '^3.0.0',
                'aws_client': sharedVersion,
                'http_client': '>=0.5.0 <2.0.0',
              },
              if (devMode)
                'dependency_overrides': {
                  'aws_client': {'path': '../../aws_client'},
                },
              'dev_dependencies': {
                'build_runner': '^1.7.2',
                'json_serializable': '^3.2.0'
              },
              'publish_to': 'none',
            };
          }

          pubspecFile.writeAsStringSync(jsonEncode(pubspecJson));
          serviceFile.writeAsStringSync(serviceText);
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
    });

    print('Dart classes generated');
  }
}
