import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:aws_client.generator/builders/endpoint_config_builder.dart';
import 'package:aws_client.generator/builders/example_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model_thin/api.dart' as thin;
import 'package:dart_style/dart_style.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:version/version.dart';
import 'package:yaml/yaml.dart';

import 'builders/library_builder.dart';
import 'builders/pubspec_builder.dart';
import 'builders/readme_builder.dart';
import 'builders/changelog_builder.dart'
import 'builders/test_builder.dart';
import 'download_command.dart';
import 'model/config.dart';
import 'model/region_config.dart';

class GenerateCommand extends Command {
  final _formatter = DartFormatter(fixes: StyleFix.all);

  @override
  String get name => 'generate';

  @override
  String get description =>
      '''Downloads API models (optional) and generates Dart clients, specified
in the config file, from the downloaded models.''';

  Config config;

  GenerateCommand() {
    argParser
      ..addFlag(
        'download',
        abbr: 'd',
        help: 'Downloads the definitions first before generating',
        defaultsTo: false,
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
      )
      ..addOption(
        'protocol',
        help: 'Generate only services with a specific protocol',
        allowed: ['json', 'rest-json', 'rest-xml', 'query', 'ec2'],
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

    if (argResults['download'] == true ||
        [Directory('./apis'), _configDataFile].any((e) => !e.existsSync())) {
      await DownloadCommand(config).run();
    }
    await _generateClasses();
    await _generateConfigFiles();

    print('Generator finished in ${stopwatch.elapsed}');
  }

  Future _generateClasses() async {
    print('Generating Dart classes...');
    final devMode = argResults['dev'] == true;
    final protocol = argResults['protocol'];

    final dir = Directory('./apis');
    final files = dir.listSync().whereType<File>();
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

    void registerNotGenerated(Api api) {
      notGeneratedApis[api.metadata.protocol] ??= {};
      notGeneratedApis[api.metadata.protocol]
          [api.packageBaseName ?? 'NO_PACKAGE_BASENAME'] ??= [];
      notGeneratedApis[api.metadata.protocol]
              [api.packageBaseName ?? 'NO_PACKAGE_BASENAME']
          .add(api.fileBasename);
    }

    for (var i = 0; i < services.length; i++) {
      final service = services.elementAt(i);
      final def = File('./apis/$service.normal.json');

      final defJson =
          jsonDecode(def.readAsStringSync()) as Map<String, dynamic>;

      try {
        final api = Api.fromJson(defJson);
        final thinApi = thin.Api.fromJson(defJson);
        final protocolConfig = config.protocols[api.metadata.protocol];

        if (!(api.isRecognized &&
            (config.packages == null ||
                config.packages.contains(api.packageName)))) {
          registerNotGenerated(api);
          continue;
        }

        if (protocol != null && api.metadata.protocol != protocol) {
          registerNotGenerated(api);
          continue;
        }

        final percentage = i * 100 ~/ services.length;

        printPercentageInPlace(percentage,
            'Generating ${api.fileBasename} for package:${api.packageName}');

        // create directories
        final baseDir = '../generated/${api.packageName}';
        final serviceFile = File('$baseDir/lib/${api.fileBasename}.dart');
        final pubspecFile = File('$baseDir/pubspec.yaml');
        final readmeFile = File('$baseDir/README.md');
        final changelogFile = File('$baseDir/CHANGELOG.md')
        final exampleFile = File('$baseDir/example/README.md');

        serviceFile.parent.createSync(recursive: true);
        exampleFile.createSync(recursive: true);

        var metaContents =
            '''const Map<String, Map<String, dynamic>> shapesJson = ${jsonEncode(thinApi.toJson()['shapes'])};''';

        var serviceText = buildService(api);
        if (argResults['format'] == true) {
          serviceText = _formatter.format(serviceText, uri: serviceFile.uri);
          metaContents = _formatter.format(metaContents);
        }

        if (api.usesQueryProtocol) {
          File('$baseDir/lib/${api.fileBasename}.meta.dart')
            ..writeAsStringSync(metaContents);
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
          changelogFile.writeAsStringSync(buildChanglogMd(api));
          exampleFile.writeAsStringSync(buildExampleReadme(api));
        }

        touchedDirs.add(baseDir);
        generatedApis[api.packageName] = api.metadata.serviceFullName;

        final pathParts = baseDir.split('/')..removeAt(0);
        final ensureBuildTestContent =
            _formatter.format(buildTest(pathParts.join('/'), api));
        File('$baseDir/test/ensure_build_test.dart')
          ..createSync(recursive: true)
          ..writeAsStringSync(ensureBuildTestContent);
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
      print('\nRunning build_runner in generated projects');

      final finalDirsList = touchedDirs.toList();

      final buildRunnerFutures = List.generate(
          // (processors - 1) makes my operating system freeze - Jonathan
          (Platform.numberOfProcessors - 2)
              .clamp(1, Platform.numberOfProcessors)
              .toInt(),
          (index) async => await _runBuildRunner(
              finalDirsList,
              argResults['optimize-build'] as bool,
              argResults['upgrade-dep'] as bool));
      await Future.wait(buildRunnerFutures, eagerError: true);
    }

    final monoPkgFile = File('mono_pkg.yaml');
    // Downloaded from: https://raw.githubusercontent.com/aws/aws-sdk-js/master/LICENSE.txt
    final licenseFile = File('aws-sdk-js-license.txt');

    for (final baseDir in touchedDirs) {
      monoPkgFile.copySync('$baseDir/mono_pkg.yaml');
      licenseFile.copySync('$baseDir/LICENSE');
    }

    print('\nAPIs not generated:');
    printPretty(notGeneratedApis);
  }

  Future<void> _getDependencies(String baseDir, {bool upgrade = true}) async {
    final pr = await Process.run(
      'dart',
      [
        'pub',
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

  Future<void> _runBuildRunner(
      List<String> dirs, bool optimize, bool upgrade) async {
    while (dirs.isNotEmpty) {
      final baseDir = dirs.removeLast();
      final dirsLeft = dirs.length;
      if (!optimize || await _directoryHasChanges(baseDir)) {
        print('Running build_runner in $baseDir, dirs left: $dirsLeft');
        await _getDependencies(baseDir, upgrade: upgrade);

        final pr = await Process.run(
          'dart',
          [
            'pub',
            'run',
            'build_runner',
            'build',
            '--delete-conflicting-outputs'
          ],
          workingDirectory: baseDir,
        );

        if (pr.exitCode != 0) {
          print(pr.stdout);
          print(pr.stderr);
          throw Exception('build_runner failed at $baseDir');
        }
      }
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

  final _configDataFile = File('./apis/config/region_config_data.json');
  Future<void> _generateConfigFiles() async {
    final jsonContent =
        jsonDecode(await _configDataFile.readAsString()) as Map<String, Object>;
    final configData = RegionConfigData.fromJson(jsonContent);
    final endpointConfigCode =
        _formatter.format(buildEndpointConfig(configData));

    File('../shared_aws_api/lib/src/protocol/endpoint_config_data.dart')
      ..createSync(recursive: true)
      ..writeAsStringSync(endpointConfigCode);

    print('Generated endpoint_config_data file');
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
