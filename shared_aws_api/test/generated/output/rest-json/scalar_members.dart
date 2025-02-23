// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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
  final _s.RestJsonProtocol _protocol;
  ScalarMembers({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ScalarMembers',
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
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
