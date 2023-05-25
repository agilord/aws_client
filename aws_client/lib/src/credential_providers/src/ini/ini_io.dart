import 'dart:io';

import '../../../../sts_2011_06_15.dart';
import '../../../shared/shared.dart';
import 'ini_file_loader.dart';

const _assumeRoleDefaultRegion = 'us-east-1';

/// Creates a credential provider that will read from ini files and supports
/// role assumption and multi-factor authentication.
Future<AwsClientCredentials?> fromIni({
  bool preferStaticCredentials = false,
  Client? client,
  String? preferredProfile,
}) async {
  final environment = Platform.environment;
  final profiles = _getProfilesFromSharedConfig();

  final profileName =
      preferredProfile ?? environment['AWS_PROFILE'] ?? 'default';

  final profile = profiles?[profileName];

  if (profile == null) {
    return null;
  }

  final secretKey =
      profile['aws_secret_access_key'] ?? profile['aws_access_secret_key'];
  final accessKey = profile['aws_access_key_id'];

  /*
    In the CLI, the presence of both a role_arn and static credentials have
    different meanings depending on how many profiles have been visited. For
    the first profile processed, role_arn takes precedence over any static
    credentials, but for all subsequent profiles, static credentials are
    used if present, and only in their absence will the profile's
    source_profile and role_arn keys be used to load another set of
    credentials. This var is intended to yield compatible behaviour in this
    sdk.
    */
  final preferStaticCredentialsToRoleArn =
      preferStaticCredentials && secretKey != null && accessKey != null;

  if (profile['role_arn'] != null && !preferStaticCredentialsToRoleArn) {
    return _loadRoleProfile(profiles!, profile, profileName, client);
  }

  if (secretKey == null) {
    print('profile [$profileName] does not contain "aws_secret_access_key"');
    return null;
  }

  if (accessKey == null) {
    print('profile [$profileName] does not contain "aws_access_key_id"');
    return null;
  }

  final sessionToken = profile['aws_session_token'];

  return AwsClientCredentials(
    accessKey: accessKey,
    secretKey: secretKey,
    sessionToken: sessionToken,
  );
}

Map<String, Map<String, String>>? _getProfilesFromSharedConfig() {
  final environment = Platform.environment;

  final configFile = File(
    environment['AWS_SHARED_CREDENTIALS_FILE'] ?? '$_userHome/.aws/config',
  );

  final credentialsFile = File(
    environment['AWS_SHARED_CREDENTIALS_FILE'] ?? '$_userHome/.aws/credentials',
  );

  if (!credentialsFile.existsSync()) {
    return null;
  }

  final profilesFromCredsString = credentialsFile.readAsStringSync();
  Map<String, Map<String, String>> profilesFromCreds;

  try {
    profilesFromCreds = Config.fromString(profilesFromCredsString).sections;
  } catch (e) {
    print('Parsing ${credentialsFile.path} failed: ${e.toString()}');
    return null;
  }

  final profilesFromConfigString = configFile.readAsStringSync();
  Map<String, Map<String, String>> profilesFromConfig;

  try {
    profilesFromConfig = Config.fromString(profilesFromConfigString)
        .sections
        .map((key, value) => MapEntry(key.replaceFirst('profile ', ''), value));
  } catch (e) {
    print('Parsing ${credentialsFile.path} failed: ${e.toString()}');
    return null;
  }

  profilesFromCreds.forEach((key, value) {
    if (profilesFromConfig[key] == null) {
      profilesFromConfig[key] = value;
    } else {
      profilesFromConfig[key] = {...?profilesFromConfig[key], ...value};
    }
  });

  return profilesFromConfig;
}

String? get _userHome =>
    Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];

Future<AwsClientCredentials> _loadRoleProfile(
  Map<String, Map<String, String>> profiles,
  Map<String, String> roleProfile,
  String profile,
  Client? client,
) async {
  final roleArn = roleProfile['role_arn'] as String;
  final roleSessionName = roleProfile['role_session_name'] ??
      'aws-sdk-js-${DateTime.now().millisecondsSinceEpoch}';
  final externalId = roleProfile['external_id'];
  final sourceProfileName = roleProfile['source_profile'];

  /* Jacked from aws-sdk-js:
    From experimentation, the following behavior mimics the AWS CLI:
    
    1. Use region from the profile if present.
    2. Otherwise fall back to N. Virginia (global endpoint).
    
    It is necessary to do the fallback explicitly, because if
    'AWS_STS_REGIONAL_ENDPOINTS=regional', the underlying STS client will
    otherwise throw an error if region is left 'undefined'.
    
    Experimentation shows that the AWS CLI (tested at version 1.18.136)
    ignores the following potential sources of a region for the purposes of
    this AssumeRole call:
    
    - The [default] profile
    - The AWS_REGION environment variable
    
    Ignoring the [default] profile for the purposes of AssumeRole is arguably
    a bug in the CLI since it does use the [default] region for service
    calls...  but right now we're matching behavior of the other tool.
    */
  final profileRegion = roleProfile['region'] ?? _assumeRoleDefaultRegion;

  if (sourceProfileName == null) {
    throw Exception('source_profile is not set using profile $profile');
  }

  if (profiles[sourceProfileName] == null) {
    throw Exception(
        'source_profile $sourceProfileName using profile $profile does not exist');
  }

  final sourceCredentials = await fromIni(
      preferStaticCredentials: true, preferredProfile: sourceProfileName);

  final sts = Sts(
      region: profileRegion, credentials: sourceCredentials!, client: client);

  final response = await sts.assumeRole(
    roleArn: roleArn,
    roleSessionName: roleSessionName,
    externalId: externalId,
  );

  final credentials = response.credentials!;

  return AwsClientCredentials(
    accessKey: credentials.accessKeyId,
    secretKey: credentials.secretAccessKey,
    expiration: credentials.expiration,
    sessionToken: credentials.sessionToken,
  );
}
