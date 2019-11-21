import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:archive/archive.dart';
import 'package:http/http.dart' as http;

class DownloadCommand extends Command {
  @override
  String get name => 'download';

  @override
  String get description => 'Downloads JSON definitions from GitHub.';

  @override
  Future<void> run() async {
    print('Downloading JSON definitions from Github...');
    await _fetchApiDefinitions();
    print('Definitions downloaded');
  }
}

Future<void> _fetchApiDefinitions() async {
  final response = await http
      .get('https://api.github.com/repos/aws/aws-sdk-js/zipball/master');
  final Archive archive = ZipDecoder().decodeBytes(response.bodyBytes);
  // Extract the contents of the Zip archive to disk.
  for (ArchiveFile file in archive) {
    final String filename = file.name;

    // Only keep the API definitions
    if (file.isFile &&
        filename.contains('apis') &&
        filename.endsWith('json') &&
        (filename.contains('.normal.') || filename.contains('.paginators.'))) {
      final String data = utf8.decode(file.content as List<int>);
      final Map<String, dynamic> json =
          jsonDecode(data) as Map<String, dynamic>;

      final zipFileUri = Uri.file(filename);
      final unzippedFileUri = Uri.file('apis/${zipFileUri.pathSegments.last}');
      final newfile = File(unzippedFileUri.path);

      if (newfile.existsSync()) {
        newfile.deleteSync();
      }

      newfile
        ..createSync(recursive: true)
        ..writeAsStringSync(jsonEncode(json));
    }
  }
}
