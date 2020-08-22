import 'package:args/command_runner.dart';
import 'package:aws_client.generator/download_command.dart';
import 'package:aws_client.generator/generate_command.dart';
import 'package:aws_client.generator/package_command.dart';
import 'package:aws_client.generator/test_command.dart';

void main(List<String> arguments) async {
  final runner = CommandRunner(
    'dart bin/generate.dart',
    'Dart AWS API generator tool',
  )
    ..addCommand(DownloadCommand())
    ..addCommand(GenerateCommand())
    ..addCommand(PackageCommand())
    ..addCommand(TestCommand());
  await runner.run(arguments);
}
