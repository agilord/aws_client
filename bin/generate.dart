import 'dart:io';

import 'package:args/args.dart';

import 'generator.dart';

ArgParser downloadCommandArgParser() {
  return ArgParser()
    ..addOption('output-dir',
        abbr: 'o',
        help: 'Output directory of aws-sdk-js.',
        defaultsTo: 'aws-sdk-js');
}

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
    ..addCommand('download', downloadCommandArgParser())
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
  print("""
The 'download' subcommand downloads all API definitions.
It takes the following options: """);
  print('');
  print(downloadCommandArgParser().usage);
  print('');
  print("The 'generate' subcommand generates the API and "
      'It takes the following options:');
  print('');
  print(runGenerateCommandArgParser().usage);
  exit(1);
}

void main(List<String> arguments) {
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
      downloadJsSdk(commandOptions['output-dir'] as String);
      break;
    case 'generate':
      if (commandOptions.command == null ||
          !['download'].contains(commandOptions.command.name)) {
        dieWithUsage('The `generate` command has only one subcommand: '
            '`download`.');
      }

      switch (commandOptions.command.name) {
        case 'generate':
          print('Not implemented');
          break;
      }
      break;
  }
}
