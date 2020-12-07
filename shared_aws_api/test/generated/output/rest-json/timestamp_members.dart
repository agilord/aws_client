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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'timestamp_members.g.dart';

/// Timestamp members
class TimestampMembers {
  final _s.RestJsonProtocol _protocol;
  TimestampMembers({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'TimestampMembers',
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
      structMember:
          TimeContainer.fromJson($json['StructMember'] as Map<String, dynamic>),
      timeArg: timeStampFromJson($json['TimeArg']),
      timeCustom: timeStampFromJson($json['TimeCustom']),
      timeFormat: timeStampFromJson($json['TimeFormat']),
      timeArgInHeader:
          _s.extractHeaderDateTimeValue(response.headers, 'x-amz-timearg'),
      timeCustomInHeader: _s.extractHeaderDateTimeValue(
          response.headers, 'x-amz-timecustom',
          parser: _s.timeStampFromJson),
      timeFormatInHeader: _s.extractHeaderDateTimeValue(
          response.headers, 'x-amz-timeformat',
          parser: _s.timeStampFromJson),
    );
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
      name: 'TimeArg', fromJson: timeStampFromJson, toJson: unixTimestampToJson)
  final DateTime timeArg;
  @_s.JsonKey(
      name: 'x-amz-timearg', fromJson: timeStampFromJson, toJson: rfc822ToJson)
  final DateTime timeArgInHeader;
  @_s.JsonKey(
      name: 'TimeCustom', fromJson: timeStampFromJson, toJson: rfc822ToJson)
  final DateTime timeCustom;
  @_s.JsonKey(
      name: 'x-amz-timecustom',
      fromJson: timeStampFromJson,
      toJson: unixTimestampToJson)
  final DateTime timeCustomInHeader;
  @_s.JsonKey(
      name: 'TimeFormat', fromJson: timeStampFromJson, toJson: iso8601ToJson)
  final DateTime timeFormat;
  @_s.JsonKey(
      name: 'x-amz-timeformat',
      fromJson: timeStampFromJson,
      toJson: iso8601ToJson)
  final DateTime timeFormatInHeader;

  OutputShape({
    this.structMember,
    this.timeArg,
    this.timeArgInHeader,
    this.timeCustom,
    this.timeCustomInHeader,
    this.timeFormat,
    this.timeFormatInHeader,
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
  @_s.JsonKey(name: 'bar', fromJson: timeStampFromJson, toJson: iso8601ToJson)
  final DateTime bar;
  @_s.JsonKey(
      name: 'foo', fromJson: timeStampFromJson, toJson: unixTimestampToJson)
  final DateTime foo;

  TimeContainer({
    this.bar,
    this.foo,
  });
  factory TimeContainer.fromJson(Map<String, dynamic> json) =>
      _$TimeContainerFromJson(json);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
