import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:args/command_runner.dart';
import 'package:aws_client.generator/model/config.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart';

class DownloadCommand extends Command {
  Config config;

  DownloadCommand([this.config]) {
    argParser.addOption(
      'config-file',
      help: 'Configuration file describing package generation.',
      defaultsTo: 'config.yaml',
    );
  }

  @override
  String get name => 'download';

  @override
  String get description => 'Downloads JSON definitions from GitHub.';

  @override
  Future<void> run() async {
    config ??= Config.fromJson(json.decode(json.encode(loadYaml(
            File(argResults['config-file'] as String).readAsStringSync())))
        as Map<String, dynamic>);
    print('Downloading JSON definitions from Github...');
    await _fetchApiDefinitions(config.awsSdkJsReference);
    print('Definitions downloaded');
  }
}

Future<void> _fetchApiDefinitions(String reference) async {
  final response = await http
      .get('https://api.github.com/repos/aws/aws-sdk-js/zipball/$reference');
  final archive = ZipDecoder().decodeBytes(response.bodyBytes);
  // Extract the contents of the Zip archive to disk.
  for (final file in archive) {
    final filename = file.name.split('/').skip(1).join('/');

    // Only keep the API definitions & config files
    if (file.isFile &&
        filename.contains('apis') &&
        filename.endsWith('json') &&
        (filename.contains('.normal.') || filename.contains('.paginators.'))) {
      final data = utf8.decode(file.content as List<int>);
      final json = jsonDecode(data) as Map<String, dynamic>;

      final zipFileUri = Uri.file(filename);
      final unzippedFileUri = Uri.file('apis/${zipFileUri.pathSegments.last}');
      final newfile = File(unzippedFileUri.path);

      if (newfile.existsSync()) {
        newfile.deleteSync();
      }

      newfile
        ..createSync(recursive: true)
        ..writeAsStringSync(const JsonEncoder.withIndent('  ').convert(json));
    } else if (file.isFile &&
        const ['lib/region_config_data.json', 'apis/metadata.json']
            .contains(filename)) {
      File(path.join('apis/config', path.basename(filename)))
        ..createSync(recursive: true)
        ..writeAsBytesSync(file.content as List<int>);
    }
  }
}
