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

/// Scalar members
class ScalarMembers {
  final _s.RestXmlProtocol _protocol;
  ScalarMembers({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: 'ScalarMembers',
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

  Future<OutputShape> operationName1() async {
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
  final String imaHeader;
  final String imaHeaderLocation;
  final int long;
  final int num;
  final String str;
  final DateTime timestamp;
  final bool trueBool;

  OutputShape({
    this.char,
    this.doubleValue,
    this.falseBool,
    this.float,
    this.imaHeader,
    this.imaHeaderLocation,
    this.long,
    this.num,
    this.str,
    this.timestamp,
    this.trueBool,
  });
  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      char: _s.extractXmlStringValue(elem, 'Char'),
      doubleValue: _s.extractXmlDoubleValue(elem, 'Double'),
      falseBool: _s.extractXmlBoolValue(elem, 'FalseBool'),
      float: _s.extractXmlDoubleValue(elem, 'Float'),
      imaHeader: _s.extractXmlStringValue(elem, 'ImaHeader'),
      imaHeaderLocation: _s.extractXmlStringValue(elem, 'X-Foo'),
      long: _s.extractXmlIntValue(elem, 'Long'),
      num: _s.extractXmlIntValue(elem, 'FooNum'),
      str: _s.extractXmlStringValue(elem, 'Str'),
      timestamp: _s.extractXmlDateTimeValue(elem, 'Timestamp'),
      trueBool: _s.extractXmlBoolValue(elem, 'TrueBool'),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
