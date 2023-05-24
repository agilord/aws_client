import 'dart:io';

import '../credentials.dart';
import 'ini_config.dart';

class CredentialsUtil {
  static AwsClientCredentials? resolve() {
    return fromEnvironment ?? fromProfileFile();
  }

  static AwsClientCredentials? get fromEnvironment {
    final environment = Platform.environment;
    final accessKey = environment['AWS_ACCESS_KEY_ID'];
    final secretKey = environment['AWS_SECRET_ACCESS_KEY'];
    final sessionToken = environment['AWS_SESSION_TOKEN'];

    if (accessKey == null || secretKey == null) {
      return null;
    }

    return AwsClientCredentials(
      accessKey: accessKey,
      secretKey: secretKey,
      sessionToken: sessionToken,
    );
  }

  static String? get userHome =>
      Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];

  static AwsClientCredentials? fromProfileFile({String? profile}) {
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

    profile ??= environment['AWS_PROFILE'] ?? 'default';

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

    final accessKey = config.get(profile, 'aws_access_key_id');
    if (accessKey == null) {
      print('profile [$profile] does not contain "aws_access_key_id"');
      return null;
    }

    final sessionToken = config.get(profile, 'aws_session_token');

    return AwsClientCredentials(
        accessKey: accessKey, secretKey: secretKey, sessionToken: sessionToken);
  }
}
