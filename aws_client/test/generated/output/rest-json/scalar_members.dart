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

export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

part 'scalar_members.g.dart';

/// Scalar members
class ScalarMembers {
  final _s.RestJsonProtocol _protocol;
  ScalarMembers({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
      char: $json['Char'] as String,
      doubleValue: $json['Double'] as double,
      falseBool: $json['FalseBool'] as bool,
      float: $json['Float'] as double,
      long: $json['Long'] as int,
      num: $json['Num'] as int,
      str: $json['Str'] as String,
      trueBool: $json['TrueBool'] as bool,
      imaHeader: _s.extractHeaderStringValue(response.headers, 'ImaHeader'),
      imaHeaderLocation: _s.extractHeaderStringValue(response.headers, 'X-Foo'),
      status: response.statusCode,
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OutputShape {
  @_s.JsonKey(name: 'Char')
  final String char;
  @_s.JsonKey(name: 'Double')
  final double doubleValue;
  @_s.JsonKey(name: 'FalseBool')
  final bool falseBool;
  @_s.JsonKey(name: 'Float')
  final double float;
  @_s.JsonKey(name: 'ImaHeader')
  final String imaHeader;
  @_s.JsonKey(name: 'X-Foo')
  final String imaHeaderLocation;
  @_s.JsonKey(name: 'Long')
  final int long;
  @_s.JsonKey(name: 'Num')
  final int num;
  @_s.JsonKey(name: 'Status')
  final int status;
  @_s.JsonKey(name: 'Str')
  final String str;
  @_s.JsonKey(name: 'TrueBool')
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
    this.status,
    this.str,
    this.trueBool,
  });
  factory OutputShape.fromJson(Map<String, dynamic> json) =>
      _$OutputShapeFromJson(json);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
