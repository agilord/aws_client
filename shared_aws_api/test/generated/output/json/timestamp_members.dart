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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'timestamp_members.g.dart';

/// Timestamp members
class TimestampMembers {
  final _s.JsonProtocol _protocol;
  TimestampMembers({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'TimestampMembers',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'TimestampMembers.OperationName'
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OutputShape {
  @_s.JsonKey(name: 'StructMember')
  final TimeContainer structMember;
  @_s.JsonKey(
      name: 'TimeArg',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime timeArg;
  @_s.JsonKey(
      name: 'TimeCustom', fromJson: rfc822FromJson, toJson: rfc822ToJson)
  final DateTime timeCustom;
  @_s.JsonKey(
      name: 'TimeFormat', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime timeFormat;

  OutputShape({
    this.structMember,
    this.timeArg,
    this.timeCustom,
    this.timeFormat,
  });
  factory OutputShape.fromJson(Map<String, dynamic> json) =>
      _$OutputShapeFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TimeContainer {
  @_s.JsonKey(name: 'bar', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime bar;
  @_s.JsonKey(
      name: 'foo', fromJson: unixTimestampFromJson, toJson: unixTimestampToJson)
  final DateTime foo;

  TimeContainer({
    this.bar,
    this.foo,
  });
  factory TimeContainer.fromJson(Map<String, dynamic> json) =>
      _$TimeContainerFromJson(json);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
