import 'package:aws_client/credential_providers.dart';
import 'package:aws_client/src/shared/src/credentials.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';

AwsClientCredentials _creds(String key, {DateTime? expiration}) =>
    AwsClientCredentials(
        accessKey: key, secretKey: 'secret', expiration: expiration);

void main() {
  test('fetches once and reuses static credentials', () async {
    var calls = 0;
    final cached = CachedCredentialProvider(({Client? client}) async {
      calls++;
      return _creds('a');
    });

    await cached.cacheAndRefreshWhenNeeded();
    await cached.cacheAndRefreshWhenNeeded();

    expect(calls, 1);
  });

  test('reuses credentials still outside the refresh buffer', () async {
    var calls = 0;
    final cached = CachedCredentialProvider(
      ({Client? client}) async {
        calls++;
        return _creds('a',
            expiration: DateTime.now().add(const Duration(hours: 1)));
      },
      refreshBuffer: const Duration(minutes: 5),
    );

    await cached.cacheAndRefreshWhenNeeded();
    await cached.cacheAndRefreshWhenNeeded();

    expect(calls, 1);
  });

  test('refreshes before expiry, within the buffer', () async {
    var calls = 0;
    final cached = CachedCredentialProvider(
      ({Client? client}) async {
        calls++;
        // Expires in 2 minutes, inside the 5-minute refresh buffer.
        return _creds('a$calls',
            expiration: DateTime.now().add(const Duration(minutes: 2)));
      },
      refreshBuffer: const Duration(minutes: 5),
    );

    final first = await cached.cacheAndRefreshWhenNeeded();
    final second = await cached.cacheAndRefreshWhenNeeded();

    expect(calls, 2);
    expect(first!.accessKey, 'a1');
    expect(second!.accessKey, 'a2');
  });

  test('de-duplicates concurrent refreshes', () async {
    var calls = 0;
    final cached = CachedCredentialProvider(({Client? client}) async {
      calls++;
      await Future<void>.delayed(const Duration(milliseconds: 10));
      return _creds('a');
    });

    await Future.wait([
      cached.cacheAndRefreshWhenNeeded(),
      cached.cacheAndRefreshWhenNeeded(),
      cached.cacheAndRefreshWhenNeeded(),
    ]);

    expect(calls, 1, reason: 'concurrent callers share a single fetch');
  });

  test('de-duplicates concurrent refreshes of expiring credentials', () async {
    var calls = 0;
    final cached = CachedCredentialProvider(({Client? client}) async {
      calls++;
      await Future<void>.delayed(const Duration(milliseconds: 10));
      return _creds('a$calls',
          expiration: DateTime.now().add(const Duration(minutes: 2)));
    });

    await cached.cacheAndRefreshWhenNeeded();
    final refreshed = await Future.wait([
      cached.cacheAndRefreshWhenNeeded(),
      cached.cacheAndRefreshWhenNeeded(),
    ]);

    expect(calls, 2);
    expect(refreshed.map((c) => c!.accessKey), everyElement('a2'));
  });

  test('does not cache a failed fetch', () async {
    var calls = 0;
    final cached = CachedCredentialProvider(({Client? client}) async {
      calls++;
      if (calls == 1) throw StateError('imds down');
      return _creds('a');
    });

    await expectLater(cached.cacheAndRefreshWhenNeeded(), throwsStateError);
    final creds = await cached.cacheAndRefreshWhenNeeded();

    expect(calls, 2);
    expect(creds!.accessKey, 'a');
  });

  test('keeps serving valid credentials when an early refresh fails', () async {
    var calls = 0;
    final cached = CachedCredentialProvider(({Client? client}) async {
      calls++;
      if (calls > 1) throw StateError('sts down');
      return _creds('a',
          expiration: DateTime.now().add(const Duration(minutes: 2)));
    });

    final first = await cached.cacheAndRefreshWhenNeeded();
    final second = await cached.cacheAndRefreshWhenNeeded();

    expect(calls, 2);
    expect(second, same(first));
  });

  test('rethrows when a refresh fails and the credentials have expired',
      () async {
    var calls = 0;
    final cached = CachedCredentialProvider(({Client? client}) async {
      calls++;
      if (calls > 1) throw StateError('sts down');
      return _creds('a',
          expiration: DateTime.now().subtract(const Duration(seconds: 1)));
    });

    await cached.cacheAndRefreshWhenNeeded();
    await expectLater(cached.cacheAndRefreshWhenNeeded(), throwsStateError);
  });
}
