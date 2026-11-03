import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' show Response;
import 'package:meta/meta.dart';

import '../../../shared/shared.dart';

// The fixed link-local address ECS task roles are served from when only a
// relative URI is provided.
const _ecsCredentialsHost = 'http://169.254.170.2';
// Bounded like the official SDKs, so a stalled endpoint does not hang every
// request; a timeout yields null and the chain moves on.
const _requestTimeout = Duration(seconds: 1);

/// Source credentials from the ECS / EKS container credentials endpoint.
///
/// Returns `null` unless `AWS_CONTAINER_CREDENTIALS_RELATIVE_URI` or
/// `AWS_CONTAINER_CREDENTIALS_FULL_URI` is set, so it is safe to keep in a
/// provider chain outside a container. When present, any token from
/// `AWS_CONTAINER_AUTHORIZATION_TOKEN` or `AWS_CONTAINER_AUTHORIZATION_TOKEN_FILE`
/// is sent as the `Authorization` header.
Future<AwsClientCredentials?> fromContainer({
  Client? client,
  @visibleForTesting Map<String, String>? environment,
}) async {
  if (client == null) {
    return null;
  }
  final env = environment ?? Platform.environment;

  final relativeUri = env['AWS_CONTAINER_CREDENTIALS_RELATIVE_URI'];
  final fullUri = env['AWS_CONTAINER_CREDENTIALS_FULL_URI'];

  final Uri uri;
  if (relativeUri != null) {
    uri = Uri.parse('$_ecsCredentialsHost$relativeUri');
  } else if (fullUri != null) {
    uri = Uri.parse(fullUri);
    if (!_isAllowedFullUri(uri)) {
      throw ArgumentError.value(fullUri, 'AWS_CONTAINER_CREDENTIALS_FULL_URI',
          'must use https or a loopback/link-local host');
    }
  } else {
    return null;
  }

  final headers = <String, String>{};
  final tokenFile = env['AWS_CONTAINER_AUTHORIZATION_TOKEN_FILE'];
  final token = env['AWS_CONTAINER_AUTHORIZATION_TOKEN'];
  if (tokenFile != null) {
    headers['Authorization'] = (await File(tokenFile).readAsString()).trim();
  } else if (token != null) {
    headers['Authorization'] = token;
  }

  final Response result;
  try {
    result = await client.get(uri, headers: headers).timeout(_requestTimeout);
  } on TimeoutException {
    print('Timed out fetching credentials from the container credentials'
        ' endpoint at $uri');
    return null;
  }
  if (result.statusCode > 299) {
    print('Could not get credentials from the container credentials endpoint'
        ' - status code: ${result.statusCode}');
    return null;
  }

  final creds = jsonDecode(result.body);
  return AwsClientCredentials(
    accessKey: creds['AccessKeyId'] as String,
    secretKey: creds['SecretAccessKey'] as String,
    sessionToken: creds['Token'] as String,
    expiration: DateTime.parse(creds['Expiration'] as String),
  );
}

// A full URI may only point at an https endpoint or a loopback / known
// link-local address, mirroring the official SDKs' guard against exfiltrating
// the authorization token to an arbitrary host.
bool _isAllowedFullUri(Uri uri) {
  if (uri.scheme == 'https') return true;
  final host = uri.host;
  return host == 'localhost' ||
      host == '::1' ||
      host.startsWith('127.') ||
      host == '169.254.170.2' ||
      host == '169.254.170.23' ||
      host == 'fd00:ec2::23';
}
