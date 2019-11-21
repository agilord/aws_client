import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:html/parser.dart' as html;

import 'generator.dart';
import 'library_builder.dart';

void main(List<String> arguments) async {
  final runner = CommandRunner('generator', 'AWS API generator tool')
    ..addCommand(DownloadCommand())
    ..addCommand(GenerateCommand());
  await runner.run(arguments);
}

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
      );
  }

  @override
  Future<void> run() async {
    if (argResults['download'] == true) {
      await DownloadCommand().run();
    }
    await _generateClasses();
  }
}

Future _generateClasses() async {
  print('Generating Dart classes...');

  final dir = Directory('./apis');
  final files = dir.listSync();
  final Set<String> services = {};

  files.forEach((ent) {
    final parts = ent.uri.pathSegments.last.split('.')
      ..removeLast()
      ..removeLast();
    services.add(parts.join('.'));
  });

  services.forEach((service) {
    final def = File('./apis/$service.normal.json');
    final pag = File('./apis/$service.paginators.json');

    final Map<String, dynamic> defJson =
        jsonDecode(def.readAsStringSync()) as Map<String, dynamic>;

    Map<String, dynamic> pagJson;
    if (pag.existsSync()) {
      pagJson = jsonDecode(pag.readAsStringSync()) as Map<String, dynamic>;
    }

    final serviceFile = buildService(
      defJson,
      pagJson,
    );

    final serviceDirectory = serviceFile.parent;
    final metadataFile = File(
        '${serviceDirectory.path}/${defJson['metadata']['uid']}.meta.dart');
    cleanJson(defJson);
    metadataFile
      ..createSync(recursive: true)
      ..writeAsStringSync('final Map<String, dynamic> meta = ')
      ..writeAsStringSync(jsonEncode(defJson), mode: FileMode.append)
      ..writeAsStringSync(';', mode: FileMode.append);

    if (pagJson != null) {
      final paginatorsFile = File(
          '${serviceDirectory.path}/${defJson['metadata']['uid']}.paginators.dart');
      paginatorsFile
        ..createSync(recursive: true)
        ..writeAsStringSync('final Map<String, dynamic> paginators = ')
        ..writeAsStringSync(jsonEncode(pagJson), mode: FileMode.append)
        ..writeAsStringSync(';', mode: FileMode.append);
    }
  });

  print('Dart classes generated');

  // Generate serialization classes
  print('Running build_runner...');
  await Process.run(
    'pub',
    ['run', 'build_runner', 'build'],
    workingDirectory: '..',
  ).then((result) {
    stdout.write(result.stdout);
    stderr.write(result.stderr);
  });

  // Format the generated classes
  print('Running dartfmt...');
  await Process.run(
    'dartfmt',
    ['--overwrite', '--fix', '.'],
    workingDirectory: '..',
  ).then((result) {
    File('dartfmtErrors.txt')
      ..createSync()
      ..writeAsStringSync(result.stderr.toString());
    stderr.write(result.stderr);
  });
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
