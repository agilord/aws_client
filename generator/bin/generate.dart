import 'package:args/command_runner.dart';
import 'package:aws_client_generator/download_command.dart';
import 'package:aws_client_generator/generate_command.dart';
import 'package:aws_client_generator/generate_single_package_command.dart';
import 'package:aws_client_generator/package_command.dart';

void main(List<String> arguments) async {
  final runner = CommandRunner(
    'dart bin/generate.dart',
    'Dart AWS API generator tool',
  )
    ..addCommand(DownloadCommand())
    ..addCommand(GenerateCommand())
    ..addCommand(GenerateSinglePackageCommand())
    ..addCommand(PackageCommand());
  await runner.run(arguments);
}
