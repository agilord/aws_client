// Copyright (c) 2024, project contributors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'dart:math';

import 'package:http/http.dart';

import 'shared.dart';

/// Called to wait between retry attempts; overridable so tests do not sleep.
typedef RetrySleeper = Future<void> Function(Duration duration);

Future<void> _defaultSleep(Duration duration) => Future<void>.delayed(duration);

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

  /// Whether [exception] should be retried (given attempts remain).
  bool _isRetryable(GenericAwsException exception) {
    final statusCode = exception.statusCode;
    if (statusCode != null && retryableStatusCodes.contains(statusCode)) {
      return true;
    }
    // Error codes land in `code` (typed and XML errors) or `type` (JSON
    // errors), so check both.
    return _isRetryableErrorCode(exception.code) ||
        _isRetryableErrorCode(exception.type);
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

/// Runs [attempt] and retries it according to [options].
///
/// [attempt] performs one full request — build, sign, send and parse — and
/// either returns the result or throws. It is invoked once per try, so a fresh
/// request is signed each time and a long backoff never replays an expired
/// signature.
///
/// A [GenericAwsException] whose status or error code is retryable, and a
/// transport-level [ClientException], are retried until [RetryOptions.maxAttempts]
/// is reached. Any other error (including a non-retryable AWS error) propagates
/// immediately.
Future<T> sendWithRetry<T>({
  required RetryOptions options,
  required Future<T> Function() attempt,
}) async {
  var attemptIndex = 0;
  while (true) {
    final isLastAttempt = attemptIndex + 1 >= options.maxAttempts;
    try {
      return await attempt();
    } on GenericAwsException catch (e) {
      if (isLastAttempt || !options._isRetryable(e)) rethrow;
      await options
          .sleep(options.backoffFor(attemptIndex, retryAfter: e.retryAfter));
    } on ClientException {
      // Transport-level failure (connection reset, DNS, timeout, ...).
      if (isLastAttempt) rethrow;
      await options.sleep(options.backoffFor(attemptIndex));
    }
    attemptIndex++;
  }
}

// Throttling and transient-error codes the official AWS SDKs retry. Mirrors
// aws-sdk-js-v3's `@aws-sdk/service-error-classification` constants:
// https://github.com/aws/aws-sdk-js-v3/blob/main/packages/service-error-classification/src/constants.ts
// Matched case-insensitively (canonical spelling is PascalCase).
const _throttlingErrorCodes = <String>{
  'bandwidthlimitexceeded',
  'ec2throttledexception',
  'limitexceededexception',
  'priorrequestnotcomplete',
  'provisionedthroughputexceededexception',
  'requestlimitexceeded',
  'requestthrottled',
  'requestthrottledexception',
  'slowdown',
  'throttledexception',
  'throttling',
  'throttlingexception',
  'toomanyrequestsexception',
  'transactioninprogressexception',
};

// Transient service errors. The client-side timeout names the JS SDK also lists
// here surface in Dart as a ClientException, which is handled separately.
const _transientErrorCodes = <String>{
  'requesttimeout',
  'requesttimeoutexception',
};

bool _isRetryableErrorCode(String? code) {
  if (code == null) return false;
  final normalized = code.toLowerCase();
  return _throttlingErrorCodes.contains(normalized) ||
      _transientErrorCodes.contains(normalized);
}
