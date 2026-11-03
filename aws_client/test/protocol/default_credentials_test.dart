import 'dart:io';

import 'package:test/test.dart';

// A client built without credentials must resolve them through the default
// provider chain. The chain reads the process environment and home directory,
// so each scenario runs default_credentials_script.dart in a child process
// with an environment stripped of any AWS configuration on this machine.
Future<Map<String, List<String>>> _run(
  String mode, {
  Map<String, String> environment = const {},
}) async {
  final env = {
    for (final e in Platform.environment.entries)
      if (!e.key.startsWith('AWS_')) e.key: e.value,
    // Hide ~/.aws without changing HOME, which the Dart tooling needs.
    'AWS_SHARED_CREDENTIALS_FILE': '${Directory.systemTemp.path}/no-such-file',
    ...environment,
  }..removeWhere((_, value) => value.isEmpty);
  final result = await Process.run(
    Platform.resolvedExecutable,
    ['run', 'test/protocol/default_credentials_script.dart', mode],
    environment: env,
    includeParentEnvironment: false,
  );
  expect(result.exitCode, 0, reason: result.stderr.toString());

  final seen = <String, List<String>>{};
  for (final line in (result.stdout as String).split('\n')) {
    if (line.isEmpty) continue;
    final space = line.indexOf(' ');
    seen
        .putIfAbsent(line.substring(0, space), () => [])
        .add(line.substring(space + 1));
  }
  return seen;
}

void main() {
  test('falls through to the instance metadata service', () async {
    final seen = await _run('imds');

    expect(seen['imds'], [
      'PUT /latest/api/token',
      'GET /latest/meta-data/iam/security-credentials/',
      'GET /latest/meta-data/iam/security-credentials/my-role',
    ]);
    expect(seen['authorization']!.single, contains('Credential=AKIAIMDS/'));
    expect(seen['session-token'], ['imds-session']);
    expect(seen['error'], isNull);
  });

  test('prefers the environment over the instance metadata service', () async {
    final seen = await _run(
      'imds',
      environment: {
        'AWS_ACCESS_KEY_ID': 'AKIAENV',
        'AWS_SECRET_ACCESS_KEY': 'secret',
      },
    );

    expect(seen['authorization']!.single, contains('Credential=AKIAENV/'));
    expect(seen['imds'], isNull, reason: 'the chain stops at the first hit');
  });

  test('exchanges a web identity token through STS', () async {
    final tokenFile = File(
      '${Directory.systemTemp.path}/web_identity_${DateTime.now().microsecondsSinceEpoch}',
    );
    await tokenFile.writeAsString('the-oidc-token');
    addTearDown(tokenFile.deleteSync);

    final seen = await _run(
      'imds',
      environment: {
        'AWS_WEB_IDENTITY_TOKEN_FILE': tokenFile.path,
        'AWS_ROLE_ARN': 'arn:aws:iam::123456789012:role/demo',
        'AWS_REGION': 'eu-west-1',
      },
    );

    expect(seen['sts'], ['https://sts.eu-west-1.amazonaws.com/']);
    expect(seen['authorization']!.single, contains('Credential=AKIAWEB/'));
    expect(seen['imds'], isNull);
  });

  test('reads the shared credentials file without a config file', () async {
    final home = Directory.systemTemp.createTempSync('aws_client_home_');
    addTearDown(() => home.deleteSync(recursive: true));
    File('${home.path}/.aws/credentials')
      ..createSync(recursive: true)
      ..writeAsStringSync(
        '[default]\n'
        'aws_access_key_id = AKIAINI\n'
        'aws_secret_access_key = secret\n',
      );

    final seen = await _run(
      'imds',
      environment: {
        'HOME': home.path,
        'USERPROFILE': home.path,
        'AWS_SHARED_CREDENTIALS_FILE': '',
      },
    );

    expect(seen['authorization']!.single, contains('Credential=AKIAINI/'));
    expect(seen['imds'], isNull);
  });

  test('fails fast when no source yields credentials', () async {
    final seen = await _run('unreachable');

    expect(
      seen['error']!.single,
      contains('credentials for signing request is null'),
    );
    expect(seen['authorization'], isNull);
    // One bounded token PUT plus one bounded metadata GET.
    expect(int.parse(seen['elapsed-ms']!.single), lessThan(5000));
  });
}
