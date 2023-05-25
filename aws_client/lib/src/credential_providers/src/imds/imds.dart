import 'dart:convert';

import '../../../shared/shared.dart';

const _imdsV1BaseSecurityCredentialsUrl =
    'http://169.254.169.254/latest/meta-data/iam/security-credentials/';

/// A credential provider that will source credentials from the EC2
/// Instance Metadata Service
Future<AwsClientCredentials?> fromInstanceMetaDataService(
    {Client? client}) async {
  // See https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html#instance-metadata-security-credentials
  //   - IMDSv1
  //   Sample response from IMDSv1:
  //   http://169.254.169.254/latest/meta-data/iam/security-credentials/<profile-name>
  // {
  //   "Code" : "Success",
  //   "LastUpdated" : "2022-01-22T17:42:11Z",
  //   "Type" : "AWS-HMAC",
  //   "AccessKeyId" : "ASIXXXXXXXXX",
  //   "SecretAccessKey" : "<...>",
  //   "Token" : "xxxxxxxx",
  //   "Expiration" : "2022-01-22T23:53:55Z"
  // }
  if (client == null) {
    return null;
  }

  // Profile response
  final profileResult =
      await client.get(Uri.parse(_imdsV1BaseSecurityCredentialsUrl));
  if (profileResult.statusCode > 299) {
    print(
        'Could not get profile from instance metadata service - status code: ${profileResult.statusCode}');
    return null;
  }

  final profileName = profileResult.body;

  final credsResult = await client
      .get(Uri.parse('$_imdsV1BaseSecurityCredentialsUrl$profileName'));
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
