import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:aws_client.generator/builders/endpoint_config_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model_thin/api.dart' as thin;
import 'package:dart_style/dart_style.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:path/path.dart' as p;
import 'package:process_runner/process_runner.dart';
import 'package:yaml/yaml.dart';

import 'builders/library_builder.dart';
import 'builders/test_suite_builder.dart';
import 'download_command.dart';
import 'model/config.dart';
import 'model/region_config.dart';
import 'model/test_model.dart';

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
        help: 'Gets dependencies and runs build_runner in all_apis',
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
        'test-suite',
        help: 'Generates a test suite from some fixture files',
        defaultsTo: true,
        negatable: true,
      )
      ..addFlag(
        'test-suite-only',
        help: 'Only generates the test suite',
        defaultsTo: false,
        negatable: true,
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

    if (argResults['download'] == true ||
        [Directory('./apis'), _configDataFile].any((e) => !e.existsSync())) {
      await DownloadCommand(config).run();
    }
    if (argResults['test-suite-only'] != true) {
      await _generateClasses();
    }
    await _generateConfigFiles();
    if (argResults['test-suite'] == true) {
      await _generateTestSuite();
    }

    print('Generator finished in ${stopwatch.elapsed}');
  }

  Future _generateClasses() async {
    print('Generating Dart classes...');
    final protocol = argResults['protocol'];

    final dir = Directory('./apis');
    final files = dir.listSync().whereType<File>().toList();
    files.sort((a, b) => a.path.compareTo(b.path));
    final services = <String>{};

    files.forEach((ent) {
      final parts = ent.uri.pathSegments.last.split('.')
        ..removeLast()
        ..removeLast();
      services.add(parts.join('.'));
    });

    final notGeneratedApis = <String, Map<String, List<String>>>{};
    final generatedApis = <String, String>{};

    void registerNotGenerated(Api api) {
      notGeneratedApis[api.metadata.protocol] ??= {};
      notGeneratedApis[api.metadata.protocol]
          [api.metadata.serviceFullName ?? 'NO_PACKAGE_BASENAME'] ??= [];
      notGeneratedApis[api.metadata.protocol]
              [api.metadata.serviceFullName ?? 'NO_PACKAGE_BASENAME']
          .add(api.version);
    }

    final libDir = '../aws_client/lib';
    final apisDir = '$libDir/apis';
    final generatedDir = '$libDir/src/generated';

    _clearDir(apisDir);
    _clearDir(generatedDir);

    for (var i = 0; i < services.length; i++) {
      final service = services.elementAt(i);
      final def = File('./apis/$service.normal.json');

      final defJson =
          jsonDecode(def.readAsStringSync()) as Map<String, dynamic>;

      try {
        final api = Api.fromJson(defJson);
        final thinApi = thin.Api.fromJson(defJson);

        if (!api.isRecognized) {
          registerNotGenerated(api);
          continue;
        }

        if (protocol != null && api.metadata.protocol != protocol) {
          registerNotGenerated(api);
          continue;
        }

        final percentage = i * 100 ~/ services.length;

        printPercentageInPlace(percentage, 'Generating API ${api.baseName}');

        // create directories
        final baseDir = '$generatedDir/${api.directoryName}';
        final serviceFile = File('$baseDir/${api.fileBasename}.dart');
        final entryFile =
            File('$apisDir/${api.directoryName}/${api.fileBasename}.dart');

        serviceFile.parent.createSync(recursive: true);
        entryFile.parent.createSync(recursive: true);

        var metaContents = '''
// ignore_for_file: prefer_single_quotes
const Map<String, Map<String, dynamic>> shapesJson = ${jsonEncode(thinApi.toJson()['shapes'])};''';

        var entryContent = '''
export '../../src/generated/${api.directoryName}/${api.fileBasename}.dart';
''';

        var serviceText = buildService(api, sharedLibraryPath: '../../shared');
        if (argResults['format'] == true) {
          serviceText = _formatter.format(serviceText, uri: serviceFile.uri);
          metaContents = _formatter.format(metaContents);
          entryContent = _formatter.format(entryContent);
        }

        if (api.usesQueryProtocol) {
          File('$baseDir/${api.fileBasename}.meta.dart')
            ..writeAsStringSync(metaContents);
        }

        serviceFile.writeAsStringSync(serviceText);
        entryFile.writeAsStringSync(entryContent);

        generatedApis[api.baseName] = api.metadata.serviceFullName;
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
    print('\n');

    if (argResults['build'] == true) {
      await _runBuildRunner('../aws_client');
    }

    print('\nGenerated APIs:');

    (generatedApis.entries.toList()..sort((a, b) => a.value.compareTo(b.value)))
        .forEach((e) => print('- ${e.value}'));

    print('\nAPIs not generated:');
    printPretty(notGeneratedApis);
  }

  void _clearDir(String path) {
    final directory = Directory(path);
    if (directory.existsSync()) {
      directory.deleteSync(recursive: true);
    }
  }

  Future<void> _runBuildRunner(String baseDir) async {
    await ProcessRunner(printOutputDefault: true).runProcess(
      [
        'dart',
        'pub',
        'run',
        'build_runner',
        'build',
        '--delete-conflicting-outputs'
      ],
      workingDirectory: Directory(baseDir),
    );
  }

  final _configDataFile = File('./apis/config/region_config_data.json');
  Future<void> _generateConfigFiles() async {
    final jsonContent =
        jsonDecode(await _configDataFile.readAsString()) as Map<String, Object>;
    final configData = RegionConfigData.fromJson(jsonContent);
    final endpointConfigCode =
        _formatter.format(buildEndpointConfig(configData));

    File('../aws_client/lib/src/shared/protocol/endpoint_config_data.dart')
      ..createSync(recursive: true)
      ..writeAsStringSync(endpointConfigCode);

    print('Generated endpoint_config_data file');
  }

  Future<void> _generateTestSuite() async {
    final sharedLibDir = '../aws_client';
    final testDir = '$sharedLibDir/test/fixtures';
    final generatedDir = Directory('$sharedLibDir/test/generated');
    const protocols = {'json', 'query', 'rest-json', 'rest-xml'};
    final formatter = DartFormatter(fixes: StyleFix.all);
    if (generatedDir.existsSync()) {
      generatedDir.deleteSync(recursive: true);
    }

    for (var type in {'input', 'output'}) {
      for (var protocol in protocols) {
        final testFile = File('$testDir/$type/$protocol.json');
        final testSuites = TestSuite.decode(testFile.readAsStringSync());
        for (var testSuite in testSuites) {
          final apiDef = testSuite.toApiDefinition();

          final api = Api.fromJson(apiDef);
          api.fileBasename = api.metadata.uid;
          final thinApi = thin.Api.fromJson(apiDef);

          var serviceCode = buildService(api);

          serviceCode = formatter.format(serviceCode);

          final baseDir = '${generatedDir.path}/$type/$protocol';
          if (api.usesQueryProtocol) {
            final metaContents = '''
              // ignore_for_file: prefer_single_quotes
              const Map<String, Map<String, dynamic>> shapesJson = ${jsonEncode(thinApi.toJson()['shapes'])};''';

            File('$baseDir/${api.metadata.uid}.meta.dart')
              ..createSync(recursive: true)
              ..writeAsStringSync(formatter.format(metaContents));
          }

          File('$baseDir/${api.metadata.uid}.dart')
            ..createSync(recursive: true)
            ..writeAsStringSync(serviceCode);

          final testCode = buildTestSuite(testSuite, api);
          File('$baseDir/${api.metadata.uid}_test.dart')
              .writeAsStringSync(formatter.format(testCode));
        }
      }
    }

    _generateTestAllFile(generatedDir);
    await _runBuildRunner(sharedLibDir);
  }

  // Generates a "test_all.dart" file with an import to all the generated tests.
  // This is a lot faster to run this file than all the separate tests.
  void _generateTestAllFile(Directory root) {
    final allFiles = root
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => f.path.endsWith('_test.dart'))
        .map((file) => p.relative(file.path, from: root.path))
        .toList();
    allFiles.sort();

    final buffer = StringBuffer();
    buffer.writeln("import 'package:test/test.dart';");
    for (var i = 0; i < allFiles.length; i++) {
      final file = allFiles[i];
      buffer.writeln("import '$file' as _i$i;");
    }

    buffer.writeln('void main() {');
    for (var i = 0; i < allFiles.length; i++) {
      final file = allFiles[i].replaceAll('.dart', '');
      buffer.writeln("group('$file', _i$i.main);");
    }
    buffer.writeln('}');

    File('${root.path}/test_all.dart')
        .writeAsStringSync(DartFormatter().format(buffer.toString()));
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
  final progress =
      '${loadingBar(percentage)} ${percentage.toString().padLeft(3)}% $message';
  if (stdout.hasTerminal) {
    stdout.write('\r${' ' * stdout.terminalColumns}');
    stdout.write('\r$progress'.truncateTo(stdout.terminalColumns));
  } else {
    print(progress);
  }
}

String loadingBar(int percentage) {
  final chars = '#' * ((percentage ~/ 10) + 1);
  return '[${chars.padRight(10)}]';
}

extension StringExtension on String {
  String truncateTo(int maxLength) =>
      (length <= maxLength) ? this : '${substring(0, maxLength - 3)}...';
}
