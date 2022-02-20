// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_credential_providers/aws_credential_providers.dart';
import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Scalar members in headers
class ScalarMembersInHeaders {
  final _s.RestXmlProtocol _protocol;
  ScalarMembersInHeaders({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider = defaultProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ScalarMembersInHeaders',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  Future<OutputShape> operationName0() async {
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return OutputShape(
      char: _s.extractHeaderStringValue($result.headers, 'x-char'),
      doubleValue: _s.extractHeaderDoubleValue($result.headers, 'x-double'),
      falseBool: _s.extractHeaderBoolValue($result.headers, 'x-false-bool'),
      float: _s.extractHeaderDoubleValue($result.headers, 'x-float'),
      integer: _s.extractHeaderIntValue($result.headers, 'x-int'),
      long: _s.extractHeaderIntValue($result.headers, 'x-long'),
      str: _s.extractHeaderStringValue($result.headers, 'x-str'),
      timestamp: _s.extractHeaderDateTimeValue($result.headers, 'x-timestamp'),
      trueBool: _s.extractHeaderBoolValue($result.headers, 'x-true-bool'),
    );
  }
}

class OutputShape {
  final String? char;
  final double? doubleValue;
  final bool? falseBool;
  final double? float;
  final int? integer;
  final int? long;
  final String? str;
  final DateTime? timestamp;
  final bool? trueBool;

  OutputShape({
    this.char,
    this.doubleValue,
    this.falseBool,
    this.float,
    this.integer,
    this.long,
    this.str,
    this.timestamp,
    this.trueBool,
  });
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
