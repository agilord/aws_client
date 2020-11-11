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
  final _s.JsonProtocol _protocol;
  TimestampValues({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'TimestampValues',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    DateTime timeArg,
    DateTime timeCustom,
    DateTime timeFormat,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'com.amazonaws.foo.OperationName'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: InputShape(
        timeArg: timeArg,
        timeCustom: timeCustom,
        timeFormat: timeFormat,
      ),
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
      name: 'TimeCustom', fromJson: rfc822FromJson, toJson: rfc822ToJson)
  final DateTime timeCustom;
  @_s.JsonKey(
      name: 'TimeFormat', fromJson: rfc822FromJson, toJson: rfc822ToJson)
  final DateTime timeFormat;

  InputShape({
    this.timeArg,
    this.timeCustom,
    this.timeFormat,
  });
  Map<String, dynamic> toJson() => _$InputShapeToJson(this);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
