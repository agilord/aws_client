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

import 'scalar_members.meta.dart';
export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// Scalar members
class ScalarMembers {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  ScalarMembers({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ScalarMembers',
          ),
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  Future<OutputShape> operationName0() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2020-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'OperationNameResult',
    );
    return OutputShape.fromXml($result);
  }
}

class OutputShape {
  final String? char;
  final double? doubleValue;
  final bool? falseBool;
  final double? float;
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
      long: json['Long'] as int?,
      num: json['FooNum'] as int?,
      str: json['Str'] as String?,
      timestamp: timeStampFromJson(json['Timestamp']),
      trueBool: json['TrueBool'] as bool?,
    );
  }

  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      char: _s.extractXmlStringValue(elem, 'Char'),
      doubleValue: _s.extractXmlDoubleValue(elem, 'Double'),
      falseBool: _s.extractXmlBoolValue(elem, 'FalseBool'),
      float: _s.extractXmlDoubleValue(elem, 'Float'),
      long: _s.extractXmlIntValue(elem, 'Long'),
      num: _s.extractXmlIntValue(elem, 'FooNum'),
      str: _s.extractXmlStringValue(elem, 'Str'),
      timestamp: _s.extractXmlDateTimeValue(elem, 'Timestamp'),
      trueBool: _s.extractXmlBoolValue(elem, 'TrueBool'),
    );
  }

  Map<String, dynamic> toJson() {
    final char = this.char;
    final doubleValue = this.doubleValue;
    final falseBool = this.falseBool;
    final float = this.float;
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
