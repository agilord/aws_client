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
  final _s.RestJsonProtocol _protocol;
  ScalarMembers({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ScalarMembers',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return OutputShape(
      char: $json['Char'] as String?,
      doubleValue: $json['Double'] as double?,
      falseBool: $json['FalseBool'] as bool?,
      float: $json['Float'] as double?,
      long: $json['Long'] as int?,
      num: $json['Num'] as int?,
      str: $json['Str'] as String?,
      trueBool: $json['TrueBool'] as bool?,
      imaHeader: _s.extractHeaderStringValue(response.headers, 'ImaHeader'),
      imaHeaderLocation: _s.extractHeaderStringValue(response.headers, 'X-Foo'),
      status: response.statusCode,
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
  final int? status;
  final String? str;
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
    this.status,
    this.str,
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
      num: json['Num'] as int?,
      status: json['Status'] as int?,
      str: json['Str'] as String?,
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
    final status = this.status;
    final str = this.str;
    final trueBool = this.trueBool;
    return {
      if (char != null) 'Char': char,
      if (doubleValue != null) 'Double': doubleValue,
      if (falseBool != null) 'FalseBool': falseBool,
      if (float != null) 'Float': float,
      if (long != null) 'Long': long,
      if (num != null) 'Num': num,
      if (str != null) 'Str': str,
      if (trueBool != null) 'TrueBool': trueBool,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
