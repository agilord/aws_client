// Copyright (c) 2024, project contributors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:xml/xml.dart';

/// Called to wait between retry attempts; overridable so tests do not sleep.
typedef RetrySleeper = Future<void> Function(Duration duration);

Future<void> _defaultSleep(Duration duration) =>
    Future<void>.delayed(duration);

/// Configures how failed requests are retried.
///
/// The defaults mirror the `standard` retry mode of the official AWS SDKs:
/// three total attempts, full-jitter exponential backoff with a 100ms base and
/// a 20s cap, retrying transport failures, throttling responses and transient
/// server errors.
class RetryOptions {
  /// Total number of attempts, including the first. `1` disables retrying.
  final int maxAttempts;

  /// Base delay used to compute the exponential backoff.
  final Duration baseDelay;

  /// Upper bound for a single backoff delay.
  final Duration maxBackoff;

  /// HTTP status codes that are always retried regardless of the error code.
  final Set<int> retryableStatusCodes;

  final Random _random;
  final RetrySleeper _sleep;

  RetryOptions({
    this.maxAttempts = 3,
    this.baseDelay = const Duration(milliseconds: 100),
    this.maxBackoff = const Duration(seconds: 20),
    this.retryableStatusCodes = const {429, 500, 502, 503, 504},
    Random? random,
    RetrySleeper? sleeper,
  })  : assert(maxAttempts >= 1),
        _random = random ?? Random(),
        _sleep = sleeper ?? _defaultSleep;

  /// Retrying turned off: a single attempt, no backoff.
  RetryOptions.disabled() : this(maxAttempts: 1);

  /// Whether a buffered response should be retried (given attempts remain).
  bool _shouldRetryResponse(_BufferedResponse response) {
    if (retryableStatusCodes.contains(response.statusCode)) return true;
    final code = response.errorCode;
    return code != null && _isRetryableErrorCode(code);
  }

  /// The delay before the next attempt (0-based [attempt] index). Honors a
  /// server-provided `Retry-After` when present.
  Duration backoffFor(int attempt, {Duration? retryAfter}) {
    if (retryAfter != null && retryAfter > Duration.zero) {
      return retryAfter > maxBackoff ? maxBackoff : retryAfter;
    }
    final exponential = baseDelay.inMilliseconds * pow(2, attempt);
    final cap = min(maxBackoff.inMilliseconds, exponential).toInt();
    // Full jitter: a uniform delay in [0, cap].
    return Duration(milliseconds: _random.nextInt(cap + 1));
  }

  Future<void> sleep(Duration duration) => _sleep(duration);
}

// Error codes that are safe to retry: throttling and clock-skew signals that
// a fresh, re-signed attempt is likely to clear.
const _retryableErrorCodes = <String>{
  'throttling',
  'throttlingexception',
  'throttledexception',
  'requestthrottled',
  'requestthrottledexception',
  'toomanyrequestsexception',
  'provisionedthroughputexceededexception',
  'transactioninprogressexception',
  'requestlimitexceeded',
  'bandwidthlimitexceeded',
  'ec2throttledexception',
  'priorrequestnotcomplete',
  'slowdown',
  'requesttimeout',
  'requesttimeoutexception',
  // Clock-skew / expiry: re-signing with a current timestamp should fix these.
  'requestexpired',
  'requesttimetooskewed',
  'expiredtoken',
  'expiredtokenexception',
};

bool _isRetryableErrorCode(String code) {
  final normalized = code.toLowerCase();
  if (_retryableErrorCodes.contains(normalized)) return true;
  // Catch-all for the many service-specific throttling variants.
  return normalized.contains('throttl');
}

/// Sends [buildRequest]'s output through [client], retrying per [options].
///
/// [buildRequest] is invoked once per attempt and must return a freshly signed
/// request: re-signing refreshes the timestamp and signature, which is what
/// makes retries of throttling and clock-skew failures effective. Errors thrown
/// by [buildRequest] (e.g. missing credentials) are never retried.
///
/// The returned [StreamedResponse] is backed by the fully buffered body, so the
/// caller parses it exactly as it would a live response.
Future<StreamedResponse> sendWithRetry({
  required Client client,
  required RetryOptions options,
  required Future<Request> Function() buildRequest,
}) async {
  var attempt = 0;
  while (true) {
    final request = await buildRequest();
    final isLastAttempt = attempt + 1 >= options.maxAttempts;

    _BufferedResponse buffered;
    try {
      buffered = await _BufferedResponse.read(await client.send(request));
    } on ClientException {
      // Transport-level failure (connection reset, DNS, timeout, ...).
      if (isLastAttempt) rethrow;
      await options.sleep(options.backoffFor(attempt));
      attempt++;
      continue;
    }

    if (!isLastAttempt && options._shouldRetryResponse(buffered)) {
      await options.sleep(
          options.backoffFor(attempt, retryAfter: buffered.retryAfter));
      attempt++;
      continue;
    }

    return buffered.toStreamedResponse(request);
  }
}

/// A response whose body has been read into memory so it can be inspected for
/// retry classification and then replayed to the caller.
class _BufferedResponse {
  final int statusCode;
  final Map<String, String> headers;
  final String? reasonPhrase;
  final Uint8List bodyBytes;

  _BufferedResponse({
    required this.statusCode,
    required this.headers,
    required this.reasonPhrase,
    required this.bodyBytes,
  });

  static Future<_BufferedResponse> read(StreamedResponse response) async {
    final bytes = await response.stream.toBytes();
    return _BufferedResponse(
      statusCode: response.statusCode,
      headers: response.headers,
      reasonPhrase: response.reasonPhrase,
      bodyBytes: bytes,
    );
  }

  StreamedResponse toStreamedResponse(BaseRequest request) => StreamedResponse(
        ByteStream.fromBytes(bodyBytes),
        statusCode,
        headers: headers,
        reasonPhrase: reasonPhrase,
        request: request,
      );

  Duration? get retryAfter {
    final value = headers['retry-after'];
    if (value == null) return null;
    final seconds = int.tryParse(value.trim());
    if (seconds != null) return Duration(seconds: seconds);
    final date = DateTime.tryParse(value.trim());
    if (date != null) {
      final delta = date.toUtc().difference(DateTime.now().toUtc());
      return delta > Duration.zero ? delta : Duration.zero;
    }
    return null;
  }

  /// The AWS error code from the response, checking the `x-amzn-errortype`
  /// header first, then a JSON `__type`/`code` field, then an XML `<Code>`.
  String? get errorCode {
    if (statusCode >= 200 && statusCode < 300) return null;

    final header = headers['x-amzn-errortype'];
    if (header != null && header.isNotEmpty) {
      return _stripCode(header);
    }

    if (bodyBytes.isEmpty) return null;
    final String body;
    try {
      body = utf8.decode(bodyBytes);
    } catch (_) {
      return null;
    }

    final trimmed = body.trimLeft();
    if (trimmed.startsWith('{')) {
      try {
        final decoded = jsonDecode(body);
        if (decoded is Map) {
          final raw = decoded['__type'] ?? decoded['code'] ?? decoded['Code'];
          if (raw is String) return _stripCode(raw);
        }
      } catch (_) {
        // not JSON after all
      }
    } else if (trimmed.startsWith('<')) {
      try {
        final codeElements = XmlDocument.parse(body)
            .rootElement
            .descendantElements
            .where((e) => e.name.local == 'Code');
        if (codeElements.isNotEmpty) {
          final code = codeElements.first.innerText;
          if (code.isNotEmpty) return _stripCode(code);
        }
      } catch (_) {
        // not parseable XML
      }
    }
    return null;
  }

  // AWS error identifiers may be namespaced ("com.amazon...#Code") and/or carry
  // a trailing ":..." qualifier; keep just the bare code.
  static String _stripCode(String value) =>
      value.split('#').last.split(':').first.trim();
}
