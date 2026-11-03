import 'dart:convert';
import 'dart:io';

import 'package:aws_client/src/credential_providers/src/sso/sso_io.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

late Directory home;

const _sessionConfig = '''
[profile dev]
sso_session = corp
sso_account_id = 123456789012
sso_role_name = Admin
region = eu-west-1

[sso-session corp]
sso_start_url = https://corp.awsapps.com/start
sso_region = us-east-2
''';

const _roleCredentials = {
  'roleCredentials': {
    'accessKeyId': 'ASIA',
    'secretAccessKey': 'secret',
    'sessionToken': 'session',
    'expiration': 1893456000000,
  }
};

Map<String, String> _env({String profile = 'dev'}) =>
    {'HOME': home.path, 'AWS_PROFILE': profile};

void _writeConfig(String content) =>
    File('${home.path}/.aws/config').writeAsStringSync(content);

File _cacheFile(String key) =>
    File('${home.path}/.aws/sso/cache/${sha1.convert(utf8.encode(key))}.json');

void _writeToken(String key, Map<String, dynamic> token) =>
    _cacheFile(key).writeAsStringSync(jsonEncode(token));

String _inOneHour() =>
    DateTime.now().toUtc().add(const Duration(hours: 1)).toIso8601String();

String _oneHourAgo() =>
    DateTime.now().toUtc().subtract(const Duration(hours: 1)).toIso8601String();

void main() {
  setUp(() {
    home = Directory.systemTemp.createTempSync('sso_test');
    Directory('${home.path}/.aws/sso/cache').createSync(recursive: true);
  });

  tearDown(() => home.deleteSync(recursive: true));

  test('returns null for a profile without SSO settings', () async {
    _writeConfig('[profile dev]\nregion = eu-west-1\n');
    final client = MockClient((_) async => Response('', 500));

    expect(await fromSso(client: client, environment: _env()), isNull);
  });

  test('returns null when the profile does not exist', () async {
    final client = MockClient((_) async => Response('', 500));

    expect(await fromSso(client: client, environment: _env()), isNull);
  });

  test('exchanges the cached token for role credentials', () async {
    _writeConfig(_sessionConfig);
    _writeToken('corp', {'accessToken': 'cached', 'expiresAt': _inOneHour()});

    late Request seen;
    final client = MockClient((rq) async {
      seen = rq;
      return Response(jsonEncode(_roleCredentials), 200);
    });

    final creds = await fromSso(client: client, environment: _env());

    expect(seen.method, 'GET');
    expect(seen.url.host, 'portal.sso.us-east-2.amazonaws.com');
    expect(seen.url.path, '/federation/credentials');
    expect(seen.url.queryParameters,
        {'account_id': '123456789012', 'role_name': 'Admin'});
    expect(seen.headers['x-amz-sso_bearer_token'], 'cached');
    expect(creds!.accessKey, 'ASIA');
    expect(creds.secretKey, 'secret');
    expect(creds.sessionToken, 'session');
    expect(creds.expiration, DateTime.utc(2030));
  });

  test('supports the legacy inline sso_start_url form', () async {
    _writeConfig('''
[profile dev]
sso_start_url = https://legacy.awsapps.com/start
sso_region = us-west-2
sso_account_id = 123456789012
sso_role_name = ReadOnly
''');
    _writeToken('https://legacy.awsapps.com/start',
        {'accessToken': 'legacy', 'expiresAt': _inOneHour()});

    late Request seen;
    final client = MockClient((rq) async {
      seen = rq;
      return Response(jsonEncode(_roleCredentials), 200);
    });

    final creds = await fromSso(client: client, environment: _env());

    expect(seen.url.host, 'portal.sso.us-west-2.amazonaws.com');
    expect(seen.headers['x-amz-sso_bearer_token'], 'legacy');
    expect(creds!.accessKey, 'ASIA');
  });

  test('refreshes an expired token and rewrites the cache', () async {
    _writeConfig(_sessionConfig);
    _writeToken('corp', {
      'accessToken': 'stale',
      'expiresAt': _oneHourAgo(),
      'clientId': 'cid',
      'clientSecret': 'csecret',
      'refreshToken': 'refresh-1',
    });

    final requests = <Request>[];
    final client = MockClient((rq) async {
      requests.add(rq);
      if (rq.url.host.startsWith('oidc.')) {
        return Response(
            jsonEncode({
              'accessToken': 'fresh',
              'expiresIn': 3600,
              'refreshToken': 'refresh-2',
            }),
            200);
      }
      return Response(jsonEncode(_roleCredentials), 200);
    });

    final creds = await fromSso(client: client, environment: _env());

    final refresh = requests.first;
    expect(refresh.method, 'POST');
    expect(
        refresh.url.toString(), 'https://oidc.us-east-2.amazonaws.com/token');
    expect(jsonDecode(refresh.body), {
      'clientId': 'cid',
      'clientSecret': 'csecret',
      'grantType': 'refresh_token',
      'refreshToken': 'refresh-1',
    });
    expect(requests.last.headers['x-amz-sso_bearer_token'], 'fresh');
    expect(creds!.accessKey, 'ASIA');

    final cache = jsonDecode(_cacheFile('corp').readAsStringSync())
        as Map<String, dynamic>;
    expect(cache['accessToken'], 'fresh');
    expect(cache['refreshToken'], 'refresh-2');
    expect(cache['clientId'], 'cid');
    expect(DateTime.parse(cache['expiresAt'] as String).isAfter(DateTime.now()),
        isTrue);
  });

  test('tells the user to log in when the token expired without a refresh',
      () async {
    _writeConfig(_sessionConfig);
    _writeToken('corp', {'accessToken': 'stale', 'expiresAt': _oneHourAgo()});
    final client = MockClient((_) async => Response('', 500));

    await expectLater(
      fromSso(client: client, environment: _env()),
      throwsA(predicate<Exception>(
          (e) => e.toString().contains('aws sso login --profile dev'))),
    );
  });

  test('tells the user to log in when there is no cached token', () async {
    _writeConfig(_sessionConfig);
    final client = MockClient((_) async => Response('', 500));

    await expectLater(
      fromSso(client: client, environment: _env()),
      throwsA(predicate<Exception>(
          (e) => e.toString().contains('aws sso login --profile dev'))),
    );
  });
}
