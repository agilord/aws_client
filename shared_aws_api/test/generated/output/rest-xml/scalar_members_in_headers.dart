// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart' show Uint8ListConverter;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Scalar members in headers
class ScalarMembersInHeaders {
  final _s.RestXmlProtocol _protocol;
  ScalarMembersInHeaders({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: 'ScalarMembersInHeaders',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
    return OutputShape.fromXml($result.body, headers: $result.headers);
  }
}

class OutputShape {
  final String char;
  final double doubleValue;
  final bool falseBool;
  final double float;
  final int integer;
  final int long;
  final String str;
  final DateTime timestamp;
  final bool trueBool;

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
  factory OutputShape.fromXml(
    // ignore: avoid_unused_constructor_parameters
    _s.XmlElement elem, {
    Map<String, String> headers,
  }) {
    return OutputShape(
      char: _s.extractHeaderStringValue(headers, 'x-char'),
      doubleValue: _s.extractHeaderDoubleValue(headers, 'x-double'),
      falseBool: _s.extractHeaderBoolValue(headers, 'x-false-bool'),
      float: _s.extractHeaderDoubleValue(headers, 'x-float'),
      integer: _s.extractHeaderIntValue(headers, 'x-int'),
      long: _s.extractHeaderIntValue(headers, 'x-long'),
      str: _s.extractHeaderStringValue(headers, 'x-str'),
      timestamp: _s.extractHeaderDateTimeValue(headers, 'x-timestamp'),
      trueBool: _s.extractHeaderBoolValue(headers, 'x-true-bool'),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
