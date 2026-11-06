import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:meta/meta.dart';

import '../../../shared/shared.dart';
import '../shared_config/shared_config_io.dart';

/// Source credentials from an IAM Identity Center (AWS SSO) profile.
///
/// Supports both the `sso_session` form and the legacy inline `sso_start_url`
/// form of the profile. The access token comes from the cache written by
/// `aws sso login` (`~/.aws/sso/cache`); an expired token is refreshed through
/// SSO OIDC when the cache holds a refresh token, otherwise the user has to log
/// in again. Returns `null` when the selected profile is not an SSO profile.
Future<AwsClientCredentials?> fromSso({
  Client? client,
  String? preferredProfile,
  @visibleForTesting Map<String, String>? environment,
}) async {
  final env = environment ?? Platform.environment;
  final config = SharedConfig.load(env);
  final profileName = preferredProfile ?? env['AWS_PROFILE'] ?? 'default';
  final profile = config.profiles[profileName];
  if (profile == null) {
    return null;
  }

  final sessionName = profile['sso_session'];
  if (sessionName == null && profile['sso_start_url'] == null) {
    return null;
  }

  final session =
      sessionName == null ? profile : config.ssoSessions[sessionName];
  if (session == null) {
    throw Exception(
        'profile [$profileName] refers to sso-session [$sessionName], which is not defined');
  }
  final startUrl = session['sso_start_url'];
  final ssoRegion = session['sso_region'];
  final accountId = profile['sso_account_id'];
  final roleName = profile['sso_role_name'];
  if (startUrl == null ||
      ssoRegion == null ||
      accountId == null ||
      roleName == null) {
    throw Exception(
        'profile [$profileName] needs sso_start_url, sso_region, sso_account_id and sso_role_name');
  }

  // `aws sso login` keys the cache on the session name, or on the start URL
  // for the legacy form.
  final cacheKey = sha1.convert(utf8.encode(sessionName ?? startUrl));
  final cacheFile = File('${homeDirectory(env)}/.aws/sso/cache/$cacheKey.json');
  final loginHint = 'run "aws sso login --profile $profileName"';
  if (!cacheFile.existsSync()) {
    throw Exception('No SSO token for profile [$profileName]; $loginHint');
  }
  var token =
      jsonDecode(await cacheFile.readAsString()) as Map<String, dynamic>;

  final manageHttpClient = client == null;
  final httpClient = client ?? Client();
  try {
    if (_isExpired(token)) {
      final refreshed = await _refreshToken(httpClient, token, ssoRegion);
      if (refreshed == null) {
        throw Exception(
            'The SSO token for profile [$profileName] has expired; $loginHint');
      }
      token = refreshed;
      await cacheFile.writeAsString(jsonEncode(token));
    }

    return await _getRoleCredentials(
      httpClient,
      region: ssoRegion,
      accessToken: token['accessToken'] as String,
      accountId: accountId,
      roleName: roleName,
    );
  } finally {
    if (manageHttpClient) {
      httpClient.close();
    }
  }
}

bool _isExpired(Map<String, dynamic> token) {
  final expiresAt = token['expiresAt'] as String?;
  return expiresAt == null ||
      !DateTime.parse(expiresAt).isAfter(DateTime.now());
}

/// Trades the cached refresh token for a new access token. Returns `null`
/// when the cache has nothing to refresh with or the OIDC service refuses.
Future<Map<String, dynamic>?> _refreshToken(
  Client client,
  Map<String, dynamic> token,
  String region,
) async {
  final clientId = token['clientId'];
  final clientSecret = token['clientSecret'];
  final refreshToken = token['refreshToken'];
  if (clientId == null || clientSecret == null || refreshToken == null) {
    return null;
  }

  final response = await client.post(
    Uri.parse('https://oidc.$region.amazonaws.com/token'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'clientId': clientId,
      'clientSecret': clientSecret,
      'grantType': 'refresh_token',
      'refreshToken': refreshToken,
    }),
  );
  if (response.statusCode > 299) {
    return null;
  }

  final body = jsonDecode(response.body) as Map<String, dynamic>;
  final expiresAt =
      DateTime.now().toUtc().add(Duration(seconds: body['expiresIn'] as int));
  return {
    ...token,
    'accessToken': body['accessToken'],
    'expiresAt': expiresAt.toIso8601String(),
    if (body['refreshToken'] != null) 'refreshToken': body['refreshToken'],
  };
}

Future<AwsClientCredentials> _getRoleCredentials(
  Client client, {
  required String region,
  required String accessToken,
  required String accountId,
  required String roleName,
}) async {
  final response = await client.get(
    Uri.https('portal.sso.$region.amazonaws.com', '/federation/credentials',
        {'account_id': accountId, 'role_name': roleName}),
    headers: {'x-amz-sso_bearer_token': accessToken},
  );
  if (response.statusCode > 299) {
    throw Exception(
        'SSO GetRoleCredentials failed - status code: ${response.statusCode}: ${response.body}');
  }

  final creds = (jsonDecode(response.body)
      as Map<String, dynamic>)['roleCredentials'] as Map<String, dynamic>;
  return AwsClientCredentials(
    accessKey: creds['accessKeyId'] as String,
    secretKey: creds['secretAccessKey'] as String,
    sessionToken: creds['sessionToken'] as String?,
    expiration: DateTime.fromMillisecondsSinceEpoch(creds['expiration'] as int,
        isUtc: true),
  );
}
