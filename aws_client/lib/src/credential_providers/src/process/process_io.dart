import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';

import '../../../shared/shared.dart';
import '../shared_config/shared_config_io.dart';

/// Source credentials from the `credential_process` command of the selected
/// profile. The command must print the JSON document described in the AWS CLI
/// documentation (`Version`, `AccessKeyId`, `SecretAccessKey`, optional
/// `SessionToken` and `Expiration`). Returns `null` when the profile has no
/// `credential_process` key.
Future<AwsClientCredentials?> fromProcess({
  Client? client,
  String? preferredProfile,
  @visibleForTesting Map<String, String>? environment,
}) async {
  final env = environment ?? Platform.environment;
  final profileName = preferredProfile ?? env['AWS_PROFILE'] ?? 'default';
  final command =
      SharedConfig.load(env).profiles[profileName]?['credential_process'];
  if (command == null) {
    return null;
  }

  // Run through the shell like the official SDKs, so quoting and paths in the
  // profile behave as they do in the CLI.
  final result = Platform.isWindows
      ? await Process.run('cmd.exe', ['/c', command])
      : await Process.run('/bin/sh', ['-c', command]);
  if (result.exitCode != 0) {
    throw Exception(
        'credential_process of profile [$profileName] failed (exit code ${result.exitCode}): ${result.stderr}');
  }

  final output = jsonDecode(result.stdout as String) as Map<String, dynamic>;
  if (output['Version'] != 1) {
    throw Exception(
        'credential_process of profile [$profileName] returned unsupported Version ${output['Version']}');
  }
  final expiration = output['Expiration'] as String?;
  return AwsClientCredentials(
    accessKey: output['AccessKeyId'] as String,
    secretKey: output['SecretAccessKey'] as String,
    sessionToken: output['SessionToken'] as String?,
    expiration: expiration == null ? null : DateTime.parse(expiration),
  );
}
