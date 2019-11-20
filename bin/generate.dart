import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:html/parser.dart' as html;

import 'generator.dart';
import 'library_builder.dart';

ArgParser runGenerateCommandArgParser() {
  return ArgParser()
    ..addFlag(
      'download',
      abbr: 'd',
      help: 'Downloads the definitions first before generating',
    );
}

ArgParser globalArgParser() {
  return ArgParser()
    ..addCommand('download')
    ..addCommand('generate', runGenerateCommandArgParser())
    ..addFlag('help', abbr: 'h', help: 'Displays usage information.');
}

ArgResults parseArguments(ArgParser parser, List<String> arguments) {
  try {
    return parser.parse(arguments);
  } on FormatException catch (e) {
    dieWithUsage('Error parsing arguments:\n${e.message}\n');
    return null;
  }
}

void dieWithUsage([String message]) {
  if (message != null) {
    print(message);
  }
  print('Usage:');
  print('The AWS Dart SDK generator has the following sub-commands:');
  print('');
  print('  download');
  print('  generate');
  print('');
  print("""The 'download' subcommand downloads all API definitions.""");
  print('');
  print("The 'generate' subcommand generates the API and "
      'It takes the following options:');
  print('');
  print(runGenerateCommandArgParser().usage);
  exit(1);
}

void main(List<String> arguments) async {
  final parser = globalArgParser();
  final options = parseArguments(parser, arguments);
  final commandOptions = options.command;
  final subCommands = ['download', 'generate'];

  if (options['help'] == true) {
    dieWithUsage();
  } else if (commandOptions == null ||
      !subCommands.contains(commandOptions.name)) {
    dieWithUsage('Invalid command');
  }

  switch (commandOptions.name) {
    case 'download':
      await downloadJsSdk();
      break;
    case 'generate':
      if (commandOptions['download'] as bool ?? false) {
        await downloadJsSdk();
      }

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

      break;
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
