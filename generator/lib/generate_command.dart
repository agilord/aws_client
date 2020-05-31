import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:aws_client.generator/builders/example_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:dart_style/dart_style.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:version/version.dart';
import 'package:yaml/yaml.dart';

import 'builders/library_builder.dart';
import 'builders/pubspec_builder.dart';
import 'builders/readme_builder.dart';
import 'builders/test_builder.dart';
import 'download_command.dart';
import 'model/config.dart';

class GenerateCommand extends Command {
  @override
  String get name => 'generate';

  @override
  String get description =>
      'Generates the API from the downloaded API definitions.';

  Config config;

  GenerateCommand() {
    argParser
      ..addFlag(
        'download',
        abbr: 'd',
        help: 'Downloads the definitions first before generating',
      )
      ..addFlag(
        'build',
        help: 'Gets dependencies and runs build_runner in generated packages',
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
      ..addFlag(
        'dev',
        help: 'Generates packages in dev mode with dependency overrides',
      )
      ..addFlag(
        'upgrade-dep',
        help:
            'Whether pub should run "upgrade" instead of "get" in generated packages',
        defaultsTo: true,
        negatable: true,
      )
      ..addFlag(
        'optimize-build',
        help:
            'Only run pub and build_runner in packages that have file changes according to git',
        defaultsTo: true,
        negatable: true,
      )
      ..addMultiOption(
        'packages',
        abbr: 'p',
        help: 'Override config file on which packages to generate',
      )
      ..addOption(
        'config-file',
        help: 'Configuration file describing package generation.',
        defaultsTo: 'config.yaml',
      );
  }

  @override
  Future<void> run() async {
    final stopwatch = Stopwatch()..start();

    config = Config.fromJson(json.decode(json.encode(loadYaml(
            File(argResults['config-file'] as String).readAsStringSync())))
        as Map<String, dynamic>);

    final argPackages = argResults['packages'] as List<String>;

    if (argPackages.isNotEmpty) {
      config = config.copyWith(packages: argPackages);
    }

    if (argResults['download'] == true) {
      await DownloadCommand(config).run();
    }
    await _generateClasses();

    print('Generator finished in ${stopwatch.elapsed}');
  }

  Future _generateClasses() async {
    print('Generating Dart classes...');
    final devMode = argResults['dev'] == true;

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
    final notGeneratedApis = <String, Map<String, List<String>>>{};
    final latestBuiltApi = <String, String>{};
    final generatedApis = <String, String>{};

    for (var i = 0; i < services.length; i++) {
      final service = services.elementAt(i);
      final def = File('./apis/$service.normal.json');

      final defJson =
          jsonDecode(def.readAsStringSync()) as Map<String, dynamic>;

      try {
        final api = Api.fromJson(defJson);
        final protocolConfig = config.protocols[api.metadata.protocol];
        if (api.isRecognized &&
            (config.packages == null ||
                config.packages.contains(api.packageName))) {
          final percentage = i * 100 ~/ services.length;

          printPercentageInPlace(percentage,
              'Generating ${api.fileBasename} for package:${api.packageName}');

          // create directories
          final baseDir = '../generated/${api.packageName}';
          final serviceFile = File('$baseDir/lib/${api.fileBasename}.dart');
          final pubspecFile = File('$baseDir/pubspec.yaml');
          final readmeFile = File('$baseDir/README.md');
          final exampleFile = File('$baseDir/example/README.md');

          serviceFile.parent.createSync(recursive: true);
          exampleFile.createSync(recursive: true);

          var serviceText = buildService(api);
          if (argResults['format'] == true) {
            serviceText = formatter.format(serviceText, uri: serviceFile.uri);
          }

          String pubspecYaml;

          if (pubspecFile.existsSync() && !devMode) {
            String oldServiceText;

            if (serviceFile.existsSync()) {
              oldServiceText = serviceFile.readAsStringSync();
            }

            final pubspecJson = loadYaml(pubspecFile.readAsStringSync());
            final version = Version.parse(pubspecJson['version'] as String);
            var newVersion = version.toString();
            final shouldBump = pubspecJson['dependencies']['shared_aws_api'] !=
                    protocolConfig.shared ||
                oldServiceText != serviceText;

            if (shouldBump && argResults['bump'] == true) {
              newVersion = version.incrementPatch().toString();
              print('Bumping ${api.packageName} from $version to $newVersion');
            }

            pubspecYaml = buildPubspecYaml(
              api,
              packageVersion: newVersion,
              isDevMode: devMode,
              protocolConfig: protocolConfig,
            );
          } else {
            pubspecYaml = buildPubspecYaml(
              api,
              packageVersion: '0.0.1',
              isDevMode: devMode,
              protocolConfig: protocolConfig,
            );
          }

          pubspecFile.writeAsStringSync(pubspecYaml);
          serviceFile.writeAsStringSync(serviceText);

          final latestBuiltApiVersion = latestBuiltApi[api.metadata.serviceId];

          if (latestBuiltApiVersion == null ||
              latestBuiltApiVersion.compareTo(api.metadata.apiVersion) < 0) {
            latestBuiltApi[api.metadata.serviceId] = api.metadata.apiVersion;
            readmeFile.writeAsStringSync(buildReadmeMd(api));
            exampleFile.writeAsStringSync(buildExampleReadme(api));
          }

          touchedDirs.add(baseDir);
          generatedApis[api.packageName] = api.metadata.serviceFullName;
        } else {
          notGeneratedApis[api.metadata.protocol] ??= {};
          notGeneratedApis[api.metadata.protocol]
              [api.packageBaseName ?? 'NO_PACKAGE_BASENAME'] ??= [];
          notGeneratedApis[api.metadata.protocol]
                  [api.packageBaseName ?? 'NO_PACKAGE_BASENAME']
              .add(api.fileBasename);
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

    printPercentageInPlace(100, 'Done');

    print('\nGenerated packages:');

    (generatedApis.entries.toList()..sort((a, b) => a.value.compareTo(b.value)))
        .forEach(
            (e) => print('- [${e.value}](https://pub.dev/packages/${e.key})'));

    if (argResults['build'] == true) {
      final stopwatch = Stopwatch()..start();
      var latestMessage = '';

      var latestPercentage = 1;

      Timer timer;

      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        printPercentageInPlace(latestPercentage,
            '${estimatedTimeLeft(latestPercentage, stopwatch.elapsed)} $latestMessage');
      });

      print('\nRunning build_runner in generated projects');

      for (var i = 0; i < touchedDirs.length; i++) {
        latestPercentage = i * 100 ~/ touchedDirs.length + 1;
        final baseDir = touchedDirs.elementAt(i);

        if (!(argResults['optimize-build'] as bool) ||
            await _directoryHasChanges(baseDir)) {
          latestMessage = '- Running pub get in $baseDir';
          printPercentageInPlace(latestPercentage,
              '${estimatedTimeLeft(latestPercentage, stopwatch.elapsed)} $latestMessage');

          await _getDependencies(baseDir,
              upgrade: argResults['upgrade-dep'] as bool);

          latestMessage = '- Running build_runner in $baseDir';
          printPercentageInPlace(latestPercentage,
              '${estimatedTimeLeft(latestPercentage, stopwatch.elapsed)} $latestMessage');

          await _runBuildRunner(baseDir);
        }
      }

      timer.cancel();
      printPercentageInPlace(100, 'Done');
    }

    final monoPkgFile = File('mono_pkg.yaml');
    // Downloaded from: https://raw.githubusercontent.com/aws/aws-sdk-js/master/LICENSE.txt
    final licenseFile = File('aws-sdk-js-license.txt');

    for (final baseDir in touchedDirs) {
      final pathParts = baseDir.split('/')..removeAt(0);
      final ensureBuildTestContent =
          formatter.format(buildTest(pathParts.join('/')));
      File('$baseDir/test/ensure_build_test.dart')
        ..createSync(recursive: true)
        ..writeAsStringSync(ensureBuildTestContent);

      monoPkgFile.copySync('$baseDir/mono_pkg.yaml');
      licenseFile.copySync('$baseDir/LICENSE.txt');
    }

    print('\nAPIs not generated:');
    printPretty(notGeneratedApis);
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

  Future<void> _runBuildRunner(String baseDir) async {
    final pr = await Process.run(
      'pub',
      ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
      workingDirectory: baseDir,
    );
    if (pr.exitCode != 0) {
      print(pr.stdout);
      print(pr.stderr);
      throw Exception('build_runner failed at $baseDir');
    }
  }

  Future<bool> _directoryHasChanges(String dir) async {
    final pr = await Process.run(
      'git',
      ['status', '.'],
      workingDirectory: dir,
    );

    if (pr.exitCode != 0) {
      print(pr.stdout);
      print(pr.stderr);
      throw Exception('git failed at $dir');
    }

    return !(pr.stdout as String).contains('working tree clean');
  }
}

void printPretty(Map<String, Map<String, List<String>>> foo) {
  for (final protocol in foo.keys.toList()..sort()) {
    print('$protocol:');
    for (final service in foo[protocol].keys.toList()..sort()) {
      print('  - $service: ${foo[protocol][service]}');
    }
  }
}

String formattedDuration(Duration d) =>
    d.toString().split('.').first.padLeft(8, '0');

String estimatedTimeLeft(int percentage, Duration elapsed) {
  final estimatedTotal = elapsed * (1 / (percentage.toDouble() / 100));
  final estimatedLeft = estimatedTotal - elapsed;
  return 'Elapsed time: ${formattedDuration(elapsed)} - estimated time left: ${formattedDuration(estimatedLeft)}';
}

void printPercentageInPlace(int percentage, String message) {
  stdout.write('\r${' ' * stdout.terminalColumns}');
  stdout.write(
      '\r${loadingBar(percentage)} ${percentage.toString().padLeft(3)}% $message');
}

String loadingBar(int percentage) {
  final chars = '#' * ((percentage ~/ 10) + 1);
  return '[${chars.padRight(10)}]';
}
