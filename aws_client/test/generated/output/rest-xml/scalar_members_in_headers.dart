// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:aws_client/src/shared/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// Scalar members in headers
class ScalarMembersInHeaders {
  final _s.RestXmlProtocol _protocol;
  ScalarMembersInHeaders({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ScalarMembersInHeaders',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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

  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      char: json['x-char'] as String?,
      doubleValue: json['x-double'] as double?,
      falseBool: json['x-false-bool'] as bool?,
      float: json['x-float'] as double?,
      integer: json['x-int'] as int?,
      long: json['x-long'] as int?,
      str: json['x-str'] as String?,
      timestamp: timeStampFromJson(json['x-timestamp']),
      trueBool: json['x-true-bool'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final char = this.char;
    final doubleValue = this.doubleValue;
    final falseBool = this.falseBool;
    final float = this.float;
    final integer = this.integer;
    final long = this.long;
    final str = this.str;
    final timestamp = this.timestamp;
    final trueBool = this.trueBool;
    return {};
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
