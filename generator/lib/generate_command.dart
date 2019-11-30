import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:json_annotation/json_annotation.dart';

import 'download_command.dart';
import 'library_builder.dart';

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

    final Map<String, dynamic> defJson =
        jsonDecode(def.readAsStringSync()) as Map<String, dynamic>;
    try {
      final Api api = Api.fromJson(defJson);
      buildService(api);
    } on UnrecognizedKeysException catch (e) {
      print('Error deserializing $service');
      print(e.message);
      rethrow;
    } catch (e) {
      print('Error "${e.runtimeType}" deserializing $service');
      rethrow;
    }
  });

  print('Dart classes generated');

  // Generate serialization classes
  print('Running build_runner...');
  final pr1 = await Process.run(
    'pub',
    ['run', 'build_runner', 'build'],
    workingDirectory: '../aws_client',
  );
  print(pr1.stdout);
  if (pr1.exitCode != 0 || (pr1.stderr as String).isNotEmpty) {
    throw StateError('pub build error:\n${pr1.stderr}');
  }

  // Format the generated classes
  print('Running dartfmt...');
  final pr2 = await Process.run(
    'dartfmt',
    ['--overwrite', '--fix', '.'],
    workingDirectory: '../aws_client/lib',
  );
  if (pr2.exitCode != 0 || (pr2.stderr as String).isNotEmpty) {
    throw StateError('dartfmt error:\n${pr2.stderr}');
  }
}
