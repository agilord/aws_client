import 'dart:io';

import 'package:meta/meta.dart';

import '../../../shared/shared.dart';
import '../sts/sts_query.dart';

// STS requires a region; the global endpoint lives in us-east-1.
const _defaultRegion = 'us-east-1';

/// Source credentials by exchanging a web identity token for temporary
/// credentials via STS `AssumeRoleWithWebIdentity` (e.g. EKS IAM Roles for
/// Service Accounts, or CI OIDC such as GitHub Actions).
///
/// Returns `null` unless both `AWS_WEB_IDENTITY_TOKEN_FILE` and `AWS_ROLE_ARN`
/// are set. The STS call is unsigned, so no prior credentials are needed.
Future<AwsClientCredentials?> fromWebIdentity({
  Client? client,
  @visibleForTesting Map<String, String>? environment,
}) async {
  final env = environment ?? Platform.environment;
  final tokenFile = env['AWS_WEB_IDENTITY_TOKEN_FILE'];
  final roleArn = env['AWS_ROLE_ARN'];
  if (tokenFile == null || roleArn == null) {
    return null;
  }

  final token = (await File(tokenFile).readAsString()).trim();
  final region =
      env['AWS_REGION'] ?? env['AWS_DEFAULT_REGION'] ?? _defaultRegion;
  final sessionName = env['AWS_ROLE_SESSION_NAME'] ??
      'aws-client-dart-${DateTime.now().millisecondsSinceEpoch}';

  final sts = StsQuery(region: region, client: client);
  try {
    return await sts.assumeRoleWithWebIdentity(
      roleArn: roleArn,
      roleSessionName: sessionName,
      webIdentityToken: token,
    );
  } finally {
    sts.close();
  }
}
