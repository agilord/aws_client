import 'dart:io';

import '../ini/ini_file_loader.dart';

/// The profiles and `sso-session` sections of the shared AWS config and
/// credentials files.
class SharedConfig {
  final Map<String, Map<String, String>> profiles;
  final Map<String, Map<String, String>> ssoSessions;

  SharedConfig({required this.profiles, required this.ssoSessions});

  /// Reads `AWS_CONFIG_FILE` and `AWS_SHARED_CREDENTIALS_FILE`, defaulting to
  /// `~/.aws/config` and `~/.aws/credentials`. A missing file is treated as
  /// empty and values from the credentials file win over the config file.
  static SharedConfig load(Map<String, String> environment) {
    final home = homeDirectory(environment);
    final config = _read(environment['AWS_CONFIG_FILE'] ?? '$home/.aws/config');
    final credentials = _read(
        environment['AWS_SHARED_CREDENTIALS_FILE'] ?? '$home/.aws/credentials');

    final profiles = <String, Map<String, String>>{};
    final ssoSessions = <String, Map<String, String>>{};
    config.forEach((name, values) {
      if (name.startsWith('sso-session ')) {
        ssoSessions[name.substring('sso-session '.length).trim()] = values;
      } else if (name.startsWith('profile ')) {
        profiles[name.substring('profile '.length).trim()] = values;
      } else {
        profiles[name] = values;
      }
    });
    credentials.forEach((name, values) {
      profiles.update(name, (existing) => {...existing, ...values},
          ifAbsent: () => values);
    });

    return SharedConfig(profiles: profiles, ssoSessions: ssoSessions);
  }

  static Map<String, Map<String, String>> _read(String path) {
    final file = File(path);
    if (!file.existsSync()) {
      return const {};
    }
    try {
      return Config.fromString(file.readAsStringSync()).sections;
    } catch (e) {
      print('Parsing $path failed: $e');
      return const {};
    }
  }
}

String homeDirectory(Map<String, String> environment) =>
    environment['HOME'] ?? environment['USERPROFILE'] ?? '';
