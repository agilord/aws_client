import 'dart:io';

import 'package:ini/ini.dart';
import 'package:shared_aws_api/src/credentials.dart';

class CredentialsUtil {
  static AwsClientCredentials resolve() {
    return fromEnvironment ?? fromProfileFile;
  }

  static AwsClientCredentials get fromEnvironment {
    final environment = Platform.environment;
    final credentials = AwsClientCredentials(
      accessKey: environment['AWS_ACCESS_KEY_ID'],
      secretKey: environment['AWS_SECRET_ACCESS_KEY'],
      sessionToken: environment['AWS_SESSION_TOKEN'],
    );

    if (credentials.accessKey == null || credentials.secretKey == null) {
      return null;
    }

    return credentials;
  }

  static String get userHome =>
      Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];

  static AwsClientCredentials get fromProfileFile {
    final environment = Platform.environment;

    final credentialsFile = File(
      environment['AWS_SHARED_CREDENTIALS_FILE'] ??
          '$userHome/.aws/credentials',
    );

    if (!credentialsFile.existsSync()) {
      return null;
    }

    final credentialsString = credentialsFile.readAsStringSync();
    Config config;
    try {
      config = Config.fromString(credentialsString);
    } catch (e) {
      print('Parsing ${credentialsFile.path} failed: ${e.toString()}');
      return null;
    }

    final profile = environment['AWS_PROFILE'] ?? 'default';

    if (!config.hasSection(profile)) {
      print('${credentialsFile.path} does not contain [$profile] profile');
      return null;
    }

    final secretKey = config.get(profile, 'aws_secret_access_key') ??
        config.get(profile, 'aws_access_secret_key');
    if (secretKey == null) {
      print('profile [$profile] does not contain "aws_secret_access_key"');
      return null;
    }

    final accesskey = config.get(profile, 'aws_access_key_id');
    if (accesskey == null) {
      print('profile [$profile] does not contain "aws_access_key_id"');
      return null;
    }

    return AwsClientCredentials(accessKey: accesskey, secretKey: secretKey);
  }
}
