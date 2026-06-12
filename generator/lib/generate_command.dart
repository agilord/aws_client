import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dart_style/dart_style.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';

import 'builders/endpoint_config_builder.dart';
import 'builders/library_builder.dart';
import 'builders/test_all_builder.dart';
import 'builders/test_suite_builder.dart';
import 'download_command.dart';
import 'model/api.dart';
import 'model/config.dart';
import 'model/region_config.dart';
import 'model/test_model.dart';
import 'smithy/ast.dart';
import 'smithy/from_smithy.dart';
import 'utils/progress.dart';

/// Path to the single package, relative to the generator's working directory.
const _packageDir = '../aws_client';

/// Import prefix used by the generated code to reference the bundled shared
/// runtime that lives inside the single package.
const _sharedLibraryPath = 'package:aws_client/src/shared';

class GenerateCommand extends Command {
  final _formatter = DartFormatter(fixes: StyleFix.all);

  @override
  String get name => 'generate';

  @override
  String get description =>
      '''Generates the single `aws_client` package containing all the AWS APIs
from the downloaded models, plus the protocol conformance test suite.''';

  GenerateCommand() {
    argParser
      ..addFlag(
        'download',
        abbr: 'd',
        help: 'Downloads the API models first before generating',
        defaultsTo: false,
      )
      ..addFlag(
        'test-suite',
        help: 'Generates the protocol conformance test suite in aws_client',
        defaultsTo: true,
        negatable: true,
      )
      ..addFlag(
        'smithy',
        help: 'Experimental: generate the clients from the Smithy models in '
            'smithy_apis/ (via apiFromSmithy) instead of the legacy apis/. '
            'Run `download --smithy` first to populate the models.',
        defaultsTo: false,
      );
  }

  final _configDataFile = File('./apis/config/region_config_data.json');

  @override
  Future<void> run() async {
    final stopwatch = Stopwatch()..start();

    if (argResults!['download'] == true ||
        [Directory('./apis'), _configDataFile].any((e) => !e.existsSync())) {
      final config = Config.fromJson(json.decode(
              json.encode(loadYaml(File('config.yaml').readAsStringSync())))
          as Map<String, dynamic>);
      await DownloadCommand(config).run();
    }

    // The Smithy models are not auto-downloaded (they're large and the path is
    // experimental); require an explicit `download --smithy` first.
    if (argResults!['smithy'] == true &&
        !Directory('./smithy_apis').existsSync()) {
      throw StateError('smithy_apis/ not found. Run '
          '`dart bin/generate.dart download --smithy` first.');
    }

    await _generateClasses();
    await _generateConfigFiles();
    if (argResults!['test-suite'] == true) {
      await _generateTestSuite();
    }

    print('Generator finished in ${stopwatch.elapsed}');
  }

  Future _generateClasses() async {
    print('Generating Dart classes...');

    final smithy = argResults!['smithy'] == true;
    final dir = Directory(smithy ? './smithy_apis' : './apis');
    final files = dir.listSync().whereType<File>().toList();
    files.sort((a, b) => a.path.compareTo(b.path));
    final services = <String>{};
    final readmeDescriptions = <String>{};

    for (var ent in files) {
      final name = ent.uri.pathSegments.last;
      if (smithy) {
        services.add(name.substring(0, name.length - '.json'.length));
      } else {
        final parts = name.split('.')
          ..removeLast()
          ..removeLast();
        services.add(parts.join('.'));
      }
    }

    final generatedApis = <String, String>{};

    final libDir = p.join(_packageDir, 'lib');
    final generatedDir = '$libDir/src/generated';

    _clearGeneratedSources(libDir);

    for (var i = 0; i < services.length; i++) {
      final service = services.elementAt(i);

      final Api api;
      if (smithy) {
        final model = SmithyModel.fromJson(
            jsonDecode(File('./smithy_apis/$service.json').readAsStringSync())
                as Map<String, dynamic>);
        try {
          api = apiFromSmithy(model, uid: service);
        } on UnsupportedError {
          continue; // protocol not yet supported by the Smithy transform
        }
      } else {
        api = Api.fromJson(
            jsonDecode(File('./apis/$service.normal.json').readAsStringSync())
                as Map<String, dynamic>);
      }

      try {
        _fixApi(api);

        final percentage = i * 100 ~/ services.length;

        printPercentageInPlace(
            percentage, 'Generating API ${api.metadata.serviceFullName}');

        readmeDescriptions.add(
            '${api.metadata.serviceFullName} (`package:aws_client/${api.directoryName}`)');

        // create directories
        final baseDir = '$generatedDir/${api.directoryName}';
        final serviceFile = File('$baseDir/${api.fileBasename}.dart');
        final entryFile = File(
            '$libDir/${api.directoryName}_${api.fileBasename.substring(1)}.dart');

        serviceFile.parent.createSync(recursive: true);
        entryFile.parent.createSync(recursive: true);

        var entryContent = '''
export '../src/generated/${api.directoryName}/${api.fileBasename}.dart';
''';

        var serviceText = buildService(api, sharedLibraryPath: '../../shared');
        serviceText = _formatter.format(serviceText, uri: serviceFile.uri);
        entryContent = _formatter.format(entryContent);

        serviceFile.writeAsStringSync(serviceText);
        entryFile.writeAsStringSync(entryContent);

        generatedApis[api.directoryName] = api.metadata.serviceFullName;
      } on UnrecognizedKeysException catch (e) {
        print('Error deserializing $service');
        print(e.message);
        rethrow;
      } catch (e) {
        print('Error "${e.runtimeType}" deserializing $service');
        rethrow;
      }
    }

    File(p.join(libDir, 'dynamo_document.dart')).writeAsStringSync('''
export 'src/dynamo_document/document_client.dart';
export 'src/dynamo_document/src/translator.dart';
''');

    File(p.join(libDir, 'credential_providers.dart')).writeAsStringSync('''
export 'src/credential_providers/aws_credential_providers.dart';
''');

    var readmeTemplate =
        File(p.join(_packageDir, 'README.template.md')).readAsStringSync();
    readmeTemplate = readmeTemplate.replaceAll('<!-- INSERT API LIST -->',
        readmeDescriptions.map((d) => '- $d').join('\n'));
    File(p.join(_packageDir, 'README.md')).writeAsStringSync(readmeTemplate);

    printPercentageInPlace(100, 'Done');
    print('\n');

    print('\nGenerated APIs:');

    for (var e in (generatedApis.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value)))) {
      print('- ${e.value}');
    }
  }

  /// Removes only the generated sources, leaving the hand-maintained
  /// `lib/src/{shared,dynamo_document,credential_providers}` in place.
  ///
  /// Invariant: everything directly under `lib/` (the per-API barrels plus
  /// `dynamo_document.dart` and `credential_providers.dart`) is generated, and
  /// `lib/src/generated/` is fully generated. Hand-written code must live under
  /// `lib/src/{shared,dynamo_document,credential_providers}/`, which is never
  /// touched here. Do not add hand-written libraries at the root of `lib/`.
  void _clearGeneratedSources(String libDir) {
    // The per-API entry barrels at the root of lib/ (non-recursive: never
    // descends into lib/src/, so the hand-maintained trees are preserved).
    for (var file in Directory(libDir)
        .listSync()
        .whereType<File>()
        .where((f) => f.path.endsWith('.dart'))) {
      file.deleteSync();
    }
    // The generated service implementations.
    final generated = Directory('$libDir/src/generated');
    if (generated.existsSync()) {
      generated.deleteSync(recursive: true);
    }
  }

  Future<void> _generateConfigFiles() async {
    final jsonContent = jsonDecode(await _configDataFile.readAsString())
        as Map<String, dynamic>;
    final configData = RegionConfigData.fromJson(jsonContent);
    final endpointConfigCode =
        _formatter.format(buildEndpointConfig(configData));

    File('$_packageDir/lib/src/shared/src/protocol/endpoint_config_data.dart')
      ..createSync(recursive: true)
      ..writeAsStringSync(endpointConfigCode);

    print('Generated endpoint_config_data file');
  }

  Future<void> _generateTestSuite() async {
    final testDir = '$_packageDir/test/fixtures';
    final generatedDir = Directory('$_packageDir/test/generated');
    const protocols = {'json', 'query', 'rest-json', 'rest-xml'};
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

          var serviceCode =
              buildService(api, sharedLibraryPath: _sharedLibraryPath);

          try {
            serviceCode = _formatter.format(serviceCode);
          } catch (e) {
            print('Error when formatting type: $type, protocol: $protocol:');
            print(serviceCode);
            rethrow;
          }

          final baseDir = '${generatedDir.path}/$type/$protocol';

          File('$baseDir/${api.fileBasename}.dart')
            ..createSync(recursive: true)
            ..writeAsStringSync(serviceCode);

          final testCode = buildTestSuite(testSuite, api);
          File('$baseDir/${api.fileBasename}_test.dart')
              .writeAsStringSync(_formatter.format(testCode));
        }
      }
    }

    generateTestAllFile(generatedDir);
    print('Generated protocol conformance test suite');
  }
}

void _fixApi(Api api) {
  void addEnumValue(String shape, String value) {
    final enumeration = api.shapes[shape]?.enumeration;
    if (enumeration != null && !enumeration.contains(value)) {
      enumeration.add(value);
    }
  }

  if (api.directoryName == 's3') {
    addEnumValue('ChecksumAlgorithm', 'CRC64NVME');
  } else if (api.directoryName == 'lambda' &&
      api.metadata.apiVersion == '2015-03-31') {
    addEnumValue('LastUpdateStatusReasonCode', 'Creating');
  }
}
