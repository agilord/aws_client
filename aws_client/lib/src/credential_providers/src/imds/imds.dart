import 'dart:convert';

import '../../../shared/shared.dart';

const _imdsBaseUrl = 'http://169.254.169.254';
const _securityCredentialsPath = '/latest/meta-data/iam/security-credentials/';
const _tokenPath = '/latest/api/token';
const _tokenHeader = 'x-aws-ec2-metadata-token';
const _tokenTtlHeader = 'x-aws-ec2-metadata-token-ttl-seconds';
// Containers with a hop limit of 1 silently drop the PUT instead of
// rejecting it, so a bounded wait is what makes the v1 fallback reachable.
const _tokenTimeout = Duration(seconds: 1);

/// A credential provider that will source credentials from the EC2
/// Instance Metadata Service.
///
/// Uses IMDSv2 (fetches a session token first and sends it on each request),
/// falling back to IMDSv1 when the token endpoint is unavailable.
Future<AwsClientCredentials?> fromInstanceMetaDataService(
    {Client? client}) async {
  // See https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html#instance-metadata-security-credentials
  //   Sample credentials response:
  // {
  //   "Code" : "Success",
  //   "AccessKeyId" : "ASIXXXXXXXXX",
  //   "SecretAccessKey" : "<...>",
  //   "Token" : "xxxxxxxx",
  //   "Expiration" : "2022-01-22T23:53:55Z"
  // }
  if (client == null) {
    return null;
  }

  final headers = <String, String>{};
  try {
    final tokenResult = await client.put(
      Uri.parse('$_imdsBaseUrl$_tokenPath'),
      headers: {_tokenTtlHeader: '21600'},
    ).timeout(_tokenTimeout);
    if (tokenResult.statusCode <= 299 && tokenResult.body.isNotEmpty) {
      headers[_tokenHeader] = tokenResult.body;
    }
  } catch (_) {
    // Fall back to IMDSv1: proceed without a token.
  }

  // Profile response
  final profileResult = await client.get(
      Uri.parse('$_imdsBaseUrl$_securityCredentialsPath'),
      headers: headers);
  if (profileResult.statusCode > 299) {
    print(
        'Could not get profile from instance metadata service - status code: ${profileResult.statusCode}');
    return null;
  }

  final profileName = profileResult.body;

  final credsResult = await client.get(
      Uri.parse('$_imdsBaseUrl$_securityCredentialsPath$profileName'),
      headers: headers);
  if (credsResult.statusCode > 299) {
    print(
        'Could not get credentials from instance metadata service - status code: ${credsResult.statusCode}');
    return null;
  }

  final creds = jsonDecode(credsResult.body);
  return AwsClientCredentials(
    accessKey: creds['AccessKeyId'] as String,
    secretKey: creds['SecretAccessKey'] as String,
    sessionToken: creds['Token'] as String,
    expiration: DateTime.parse(creds['Expiration'] as String),
  );
}
