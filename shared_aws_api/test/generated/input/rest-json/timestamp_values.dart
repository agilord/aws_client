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
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'timestamp_values.g.dart';

/// Timestamp values
class TimestampValues {
  final _s.RestJsonProtocol _protocol;
  TimestampValues({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'TimestampValues',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    DateTime timeArg,
    DateTime timeArgInHeader,
    DateTime timeArgInQuery,
    DateTime timeCustom,
    DateTime timeCustomInHeader,
    DateTime timeCustomInQuery,
    DateTime timeFormat,
    DateTime timeFormatInHeader,
    DateTime timeFormatInQuery,
  }) async {
    final headers = <String, String>{};
    timeArgInHeader
        ?.let((v) => headers['x-amz-timearg'] = v.toUtc().toIso8601String());
    timeCustomInHeader?.let((v) =>
        headers['x-amz-timecustom-header'] = v.toUtc().toIso8601String());
    timeFormatInHeader?.let((v) =>
        headers['x-amz-timeformat-header'] = v.toUtc().toIso8601String());
    var _query = '';
    _query = '?${[
      if (timeArgInQuery != null) _s.toQueryParam('TimeQuery', timeArgInQuery),
      if (timeCustomInQuery != null)
        _s.toQueryParam('TimeCustomQuery', timeCustomInQuery),
      if (timeFormatInQuery != null)
        _s.toQueryParam('TimeFormatQuery', timeFormatInQuery),
    ].where((e) => e != null).join('&')}';
    final $payload = InputShape(
      timeArg: timeArg,
      timeArgInHeader: timeArgInHeader,
      timeArgInQuery: timeArgInQuery,
      timeCustom: timeCustom,
      timeCustomInHeader: timeCustomInHeader,
      timeCustomInQuery: timeCustomInQuery,
      timeFormat: timeFormat,
      timeFormatInHeader: timeFormatInHeader,
      timeFormatInQuery: timeFormatInQuery,
    );
    await _protocol.send(
      payload: $payload,
      headers: headers,
      method: 'POST',
      requestUri: '/path$_query',
      exceptionFnMap: _exceptionFns,
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputShape {
  @_s.JsonKey(
      name: 'TimeArg',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime timeArg;
  @_s.JsonKey(
      name: 'x-amz-timearg',
      fromJson: rfc822FromJson,
      toJson: rfc822ToJson,
      ignore: true)
  final DateTime timeArgInHeader;
  @_s.JsonKey(
      name: 'TimeQuery',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson,
      ignore: true)
  final DateTime timeArgInQuery;
  @_s.JsonKey(
      name: 'TimeCustom', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime timeCustom;
  @_s.JsonKey(
      name: 'x-amz-timecustom-header',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson,
      ignore: true)
  final DateTime timeCustomInHeader;
  @_s.JsonKey(
      name: 'TimeCustomQuery',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson,
      ignore: true)
  final DateTime timeCustomInQuery;
  @_s.JsonKey(
      name: 'TimeFormat', fromJson: rfc822FromJson, toJson: rfc822ToJson)
  final DateTime timeFormat;
  @_s.JsonKey(
      name: 'x-amz-timeformat-header',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson,
      ignore: true)
  final DateTime timeFormatInHeader;
  @_s.JsonKey(
      name: 'TimeFormatQuery',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson,
      ignore: true)
  final DateTime timeFormatInQuery;

  InputShape({
    this.timeArg,
    this.timeArgInHeader,
    this.timeArgInQuery,
    this.timeCustom,
    this.timeCustomInHeader,
    this.timeCustomInQuery,
    this.timeFormat,
    this.timeFormatInHeader,
    this.timeFormatInQuery,
  });
  Map<String, dynamic> toJson() => _$InputShapeToJson(this);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
