// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show Uint8ListConverter, Uint8ListListConverter;

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
    return OutputShape.fromXml($result.body);
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
  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      char: _s.extractXmlStringValue(elem, 'x-char'),
      doubleValue: _s.extractXmlDoubleValue(elem, 'x-double'),
      falseBool: _s.extractXmlBoolValue(elem, 'x-false-bool'),
      float: _s.extractXmlDoubleValue(elem, 'x-float'),
      integer: _s.extractXmlIntValue(elem, 'x-int'),
      long: _s.extractXmlIntValue(elem, 'x-long'),
      str: _s.extractXmlStringValue(elem, 'x-str'),
      timestamp: _s.extractXmlDateTimeValue(elem, 'x-timestamp'),
      trueBool: _s.extractXmlBoolValue(elem, 'x-true-bool'),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
