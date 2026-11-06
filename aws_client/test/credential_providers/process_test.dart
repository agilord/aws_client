import 'dart:io';

import 'package:aws_client/src/credential_providers/src/process/process_io.dart';
import 'package:test/test.dart';

late Directory home;

Map<String, String> _env() => {'HOME': home.path, 'AWS_PROFILE': 'dev'};

void _writeConfig(String content) =>
    File('${home.path}/.aws/config').writeAsStringSync(content);

void main() {
  setUp(() {
    home = Directory.systemTemp.createTempSync('process_test');
    Directory('${home.path}/.aws').createSync();
  });

  tearDown(() => home.deleteSync(recursive: true));

  test('returns null without a credential_process', () async {
    _writeConfig('[profile dev]\nregion = eu-west-1\n');

    expect(await fromProcess(environment: _env()), isNull);
  });

  test('runs the command and parses its output', () async {
    _writeConfig('''
[profile dev]
credential_process = echo '{"Version": 1, "AccessKeyId": "AKIA", "SecretAccessKey": "secret", "SessionToken": "session", "Expiration": "2030-01-01T00:00:00Z"}'
''');

    final creds = await fromProcess(environment: _env());

    expect(creds!.accessKey, 'AKIA');
    expect(creds.secretKey, 'secret');
    expect(creds.sessionToken, 'session');
    expect(creds.expiration, DateTime.utc(2030));
  });

  test('accepts output without session token and expiration', () async {
    _writeConfig('''
[profile dev]
credential_process = echo '{"Version": 1, "AccessKeyId": "AKIA", "SecretAccessKey": "secret"}'
''');

    final creds = await fromProcess(environment: _env());

    expect(creds!.sessionToken, isNull);
    expect(creds.expiration, isNull);
  });

  test('throws when the command fails', () async {
    _writeConfig('''
[profile dev]
credential_process = echo boom >&2; exit 3
''');

    await expectLater(
      fromProcess(environment: _env()),
      throwsA(predicate<Exception>((e) =>
          e.toString().contains('exit code 3') &&
          e.toString().contains('boom'))),
    );
  });

  test('rejects an unsupported Version', () async {
    _writeConfig('''
[profile dev]
credential_process = echo '{"Version": 2, "AccessKeyId": "AKIA", "SecretAccessKey": "secret"}'
''');

    await expectLater(
      fromProcess(environment: _env()),
      throwsA(predicate<Exception>(
          (e) => e.toString().contains('unsupported Version 2'))),
    );
  });
}
