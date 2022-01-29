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

import 'scalar_members.meta.dart';
export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Scalar members
class ScalarMembers {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  ScalarMembers({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ScalarMembers',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

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
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
