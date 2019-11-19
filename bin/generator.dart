import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:html/parser.dart' as html;
import 'package:http/http.dart' as http;

Future<void> downloadJsSdk(String outputDir) async {
  await fetchApiDefinitions();
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
        filename.endsWith('json') && (filename.contains('.normal.') || filename.contains('.paginators.'))) {

      final String data = utf8.decode(file.content as List<int>);
      final Map<String, dynamic> json =
          jsonDecode(data) as Map<String, dynamic>;
      cleanJson(json);

      final zipFileUri = Uri.file(filename);
      final unzippedFileUri = Uri.file('apis/${zipFileUri.pathSegments.last}');
      final newfile = File(unzippedFileUri.path.replaceAll('json', 'dart'));

      if (newfile.existsSync()) {
        newfile.deleteSync();
      }

      newfile
        ..createSync(recursive: true)
        ..writeAsStringSync('final Map<String, dynamic> definition = ')
        ..writeAsStringSync(jsonEncode(json), mode: FileMode.append)
        ..writeAsStringSync(';', mode: FileMode.append);
    }
  }
}

Map<String, dynamic> cleanJson(Map<String, dynamic> json) => json
  ..keys.forEach((key) {
    final value = json[key];
    if (value is Map) {
      cleanJson(value as Map<String, dynamic>);
    } else if (value is String) {
      if (key == 'documentation') {
        final document = html.parse(value);
        json[key] = html
            .parse(document.body.text)
            .documentElement
            .text
            .replaceAll(r'$', '');
      } else if (key == 'pattern') {
        // TODO: keep the regexes, but parse the string to be valid Dart Strings
        json[key] = null;
      } else {
        String temp = value.replaceAll(RegExp(r'((?<=[^\\]+)\$)'), r'\$');
        if (temp.startsWith(r'$')) {
          temp = temp.replaceFirst(r'$', r'\$');
        }
        json[key] = temp;
      }
    }
  });
