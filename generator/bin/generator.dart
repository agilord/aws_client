import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:http/http.dart' as http;

Future<void> downloadJsSdk() async {
  print('Downloading JSON definitions from Github...');
  await fetchApiDefinitions();
  print('Definitions downloaded');
}

Future<void> fetchApiDefinitions() async {
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
