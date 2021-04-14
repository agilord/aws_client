// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Scalar members
class ScalarMembers {
  final _s.JsonProtocol _protocol;
  ScalarMembers({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ScalarMembers',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ScalarMembers.OperationName'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return OutputShape.fromJson(jsonResponse.body);
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
  final bool? trueBool;

  OutputShape({
    this.char,
    this.doubleValue,
    this.falseBool,
    this.float,
    this.long,
    this.num,
    this.str,
    this.trueBool,
  });
  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      char: json['Char'] as String?,
      doubleValue: json['Double'] as double?,
      falseBool: json['FalseBool'] as bool?,
      float: json['Float'] as double?,
      long: json['Long'] as int?,
      num: json['Num'] as int?,
      str: json['Str'] as String?,
      trueBool: json['TrueBool'] as bool?,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
