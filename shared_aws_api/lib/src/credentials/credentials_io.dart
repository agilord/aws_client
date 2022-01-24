import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:shared_aws_api/src/credentials.dart';
import 'package:shared_aws_api/src/credentials/ini_config.dart';

class CredentialsUtil {
  static Future<AwsClientCredentials?> resolve(Client? client) {
    final localCredentials = fromEnvironment ?? fromProfileFile;
    if (localCredentials != null) {
      return Future.value(localCredentials);
    }

    return fromInstanceMetaDataService(client);
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

  static AwsClientCredentials? get fromProfileFile {
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

    final accessKey = config.get(profile, 'aws_access_key_id');
    if (accessKey == null) {
      print('profile [$profile] does not contain "aws_access_key_id"');
      return null;
    }

    return AwsClientCredentials(accessKey: accessKey, secretKey: secretKey);
  }

  static const _imdsV1BaseSecurityCredentialsUrl =
      'http://169.254.169.254/latest/meta-data/iam/security-credentials/';
  static Future<AwsClientCredentials?> fromInstanceMetaDataService(
      Client? client) async {
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
}
