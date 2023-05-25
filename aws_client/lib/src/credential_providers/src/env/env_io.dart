import 'dart:io';

import '../../../shared/shared.dart';

/// Source AWS credentials from known environment variables. If either the
///`AWS_ACCESS_KEY_ID` or `AWS_SECRET_ACCESS_KEY` environment variable is not
/// set in this process, the provider will return null.
Future<AwsClientCredentials?> fromEnvironment({Client? client}) async {
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
