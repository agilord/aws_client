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

/// Scalar members
class ScalarMembers {
  final _s.RestXmlProtocol _protocol;
  ScalarMembers({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
  final String? char;
  final double? doubleValue;
  final bool? falseBool;
  final double? float;
  final String? imaHeader;
  final String? imaHeaderLocation;
  final int? long;
  final int? num;
  final String? str;
  final DateTime? timestamp;
  final bool? trueBool;

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

  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      char: json['Char'] as String?,
      doubleValue: json['Double'] as double?,
      falseBool: json['FalseBool'] as bool?,
      float: json['Float'] as double?,
      imaHeader: json['ImaHeader'] as String?,
      imaHeaderLocation: json['X-Foo'] as String?,
      long: json['Long'] as int?,
      num: json['FooNum'] as int?,
      str: json['Str'] as String?,
      timestamp: timeStampFromJson(json['Timestamp']),
      trueBool: json['TrueBool'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final char = this.char;
    final doubleValue = this.doubleValue;
    final falseBool = this.falseBool;
    final float = this.float;
    final imaHeader = this.imaHeader;
    final imaHeaderLocation = this.imaHeaderLocation;
    final long = this.long;
    final num = this.num;
    final str = this.str;
    final timestamp = this.timestamp;
    final trueBool = this.trueBool;
    return {
      if (char != null) 'Char': char,
      if (doubleValue != null) 'Double': doubleValue,
      if (falseBool != null) 'FalseBool': falseBool,
      if (float != null) 'Float': float,
      if (long != null) 'Long': long,
      if (num != null) 'FooNum': num,
      if (str != null) 'Str': str,
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
      if (trueBool != null) 'TrueBool': trueBool,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
