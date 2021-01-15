// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:aws_client/src/shared/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

import 'scalar_members.meta.dart';
export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// Scalar members
class ScalarMembers {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  ScalarMembers({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
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
  final String char;
  final double doubleValue;
  final bool falseBool;
  final double float;
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
