// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:aws_client/src/shared/shared.dart'
    show Uint8ListConverter, Uint8ListListConverter;

export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

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
          service: _s.ServiceMetadata(
            endpointPrefix: 'ScalarMembers',
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
      char: _s.extractXmlStringValue($elem, 'Char'),
      doubleValue: _s.extractXmlDoubleValue($elem, 'Double'),
      falseBool: _s.extractXmlBoolValue($elem, 'FalseBool'),
      float: _s.extractXmlDoubleValue($elem, 'Float'),
      long: _s.extractXmlIntValue($elem, 'Long'),
      num: _s.extractXmlIntValue($elem, 'FooNum'),
      str: _s.extractXmlStringValue($elem, 'Str'),
      timestamp: _s.extractXmlDateTimeValue($elem, 'Timestamp'),
      trueBool: _s.extractXmlBoolValue($elem, 'TrueBool'),
      imaHeader: _s.extractHeaderStringValue($result.headers, 'ImaHeader'),
      imaHeaderLocation: _s.extractHeaderStringValue($result.headers, 'X-Foo'),
    );
  }

  Future<OutputShape> operationName1() async {
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return OutputShape(
      char: _s.extractXmlStringValue($elem, 'Char'),
      doubleValue: _s.extractXmlDoubleValue($elem, 'Double'),
      falseBool: _s.extractXmlBoolValue($elem, 'FalseBool'),
      float: _s.extractXmlDoubleValue($elem, 'Float'),
      long: _s.extractXmlIntValue($elem, 'Long'),
      num: _s.extractXmlIntValue($elem, 'FooNum'),
      str: _s.extractXmlStringValue($elem, 'Str'),
      timestamp: _s.extractXmlDateTimeValue($elem, 'Timestamp'),
      trueBool: _s.extractXmlBoolValue($elem, 'TrueBool'),
      imaHeader: _s.extractHeaderStringValue($result.headers, 'ImaHeader'),
      imaHeaderLocation: _s.extractHeaderStringValue($result.headers, 'X-Foo'),
    );
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
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
