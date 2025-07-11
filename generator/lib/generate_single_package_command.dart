import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dart_style/dart_style.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:path/path.dart' as p;

import 'builders/endpoint_config_builder.dart';
import 'builders/library_builder.dart';
import 'generate_command.dart';
import 'model/api.dart';
import 'model/region_config.dart';
import 'utils/fix_absolute_import.dart';

class GenerateSinglePackageCommand extends Command {
  final _formatter = DartFormatter(fixes: StyleFix.all);

  @override
  String get name => 'generate-single-package';

  @override
  String get description =>
      '''Generate a single package containing all the AWS APIs.''';

  GenerateSinglePackageCommand();

  @override
  Future<void> run() async {
    final stopwatch = Stopwatch()..start();

    await _generateClasses();
    await _generateConfigFiles();

    print('Generator finished in ${stopwatch.elapsed}');
  }

  Future _generateClasses() async {
    print('Generating Dart classes...');

    Api.isGeneratingSinglePackage = true;
    final dir = Directory('./apis');
    final files = dir.listSync().whereType<File>().toList();
    files.sort((a, b) => a.path.compareTo(b.path));
    final services = <String>{};
    final readmeDescriptions = <String>{};

    for (var ent in files) {
      final parts = ent.uri.pathSegments.last.split('.')
        ..removeLast()
        ..removeLast();
      services.add(parts.join('.'));
    }

    final generatedApis = <String, String>{};

    final packageDir = '../aws_client';
    final libDir = p.join(packageDir, 'lib');
    final generatedDir = '$libDir/src/generated';

    _clearDir(libDir);

    _copyPackages();

    for (var i = 0; i < services.length; i++) {
      final service = services.elementAt(i);
      final def = File('./apis/$service.normal.json');

      final defJson =
          jsonDecode(def.readAsStringSync()) as Map<String, dynamic>;

      try {
        final api = Api.fromJson(defJson);
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
        File(p.join(packageDir, 'README.template.md')).readAsStringSync();
    readmeTemplate = readmeTemplate.replaceAll('<!-- INSERT API LIST -->',
        readmeDescriptions.map((d) => '- $d').join('\n'));
    File(p.join(packageDir, 'README.md')).writeAsStringSync(readmeTemplate);

    printPercentageInPlace(100, 'Done');
    print('\n');

    print('\nGenerated APIs:');

    for (var e in (generatedApis.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value)))) {
      print('- ${e.value}');
    }
  }

  void _clearDir(String path) {
    final directory = Directory(path);
    if (directory.existsSync()) {
      directory.deleteSync(recursive: true);
    }
  }

  final _configDataFile = File('./apis/config/region_config_data.json');
  Future<void> _generateConfigFiles() async {
    final jsonContent = jsonDecode(await _configDataFile.readAsString())
        as Map<String, dynamic>;
    final configData = RegionConfigData.fromJson(jsonContent);
    final endpointConfigCode =
        _formatter.format(buildEndpointConfig(configData));

    File('../aws_client/lib/src/shared/src/protocol/endpoint_config_data.dart')
      ..createSync(recursive: true)
      ..writeAsStringSync(endpointConfigCode);

    print('Generated endpoint_config_data file');
  }

  void _copyPackages() {
    final packagePath = '../aws_client';

    _copy('../shared_aws_api/lib', '$packagePath/lib/src/shared');
    _copy('../document_client/lib', '$packagePath/lib/src/dynamo_document');
    _copy('../aws_credential_providers/lib',
        '$packagePath/lib/src/credential_providers');

    final replaceRoot = '$packagePath/lib/src';
    _searchAndReplace(replaceRoot, {
      'package:aws_dynamodb_api/dynamodb-2012-08-10.dart':
          'package:aws_client/dynamo_db_2012_08_10.dart',
      'package:aws_sts_api/sts-2011-06-15.dart':
          'package:aws_client/sts_2011_06_15.dart',
      'package:shared_aws_api/shared.dart':
          'package:aws_client/src/shared/shared.dart',
    });
    _replaceInFile(
        File('$packagePath/lib/src/credential_providers/src/ini/ini_io.dart'),
        {'STS(': 'Sts('});

    for (var file in Directory(replaceRoot)
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => f.path.endsWith('.dart'))) {
      final path = p.relative(file.path, from: '../aws_client');
      final fileContent = replaceAbsoluteImports(file.readAsStringSync(),
          filePath: path, packageName: 'aws_client');
      file.writeAsStringSync(fileContent);
    }
  }

  void _copy(String source, String destination) {
    _clearDir(destination);
    _copyDirectory(Directory(source), Directory(destination));
  }
}

void _copyDirectory(Directory source, Directory destination) {
  for (var entity in source.listSync(recursive: false)) {
    if (entity is Directory) {
      final newDirectory =
          Directory(p.join(destination.absolute.path, p.basename(entity.path)));
      newDirectory.createSync(recursive: true);

      _copyDirectory(entity.absolute, newDirectory);
    } else if (entity is File) {
      final destPath = p.join(destination.path, p.basename(entity.path));
      File(destPath).parent.createSync(recursive: true);
      entity.copySync(destPath);
    }
  }
}

void _searchAndReplace(String directory, Map<String, String> terms) {
  for (var file in Directory(directory)
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart'))) {
    _replaceInFile(file, terms);
  }
}

void _replaceInFile(File file, Map<String, String> terms) {
  var content = file.readAsStringSync();
  for (var term in terms.entries) {
    content = content.replaceAll(term.key, term.value);
  }
  file.writeAsStringSync(content);
}

void _fixApi(Api api) {
  if (api.directoryName == 's3') {
    final checksum = api.shapes['ChecksumAlgorithm']!;
    checksum.enumeration!.add('CRC64NVME');
  } else if (api.directoryName == 'lambda' &&
      api.metadata.apiVersion == '2015-03-31') {
    api.shapes['LastUpdateStatusReasonCode']!.enumeration!.add('Creating');
  }
}
