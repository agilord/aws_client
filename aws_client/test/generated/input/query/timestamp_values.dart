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

import 'timestamp_values.meta.dart';
export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// Timestamp values
class TimestampValues {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  TimestampValues({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'TimestampValues',
          ),
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  Future<void> operationName0({
    DateTime timeArg,
    DateTime timeCustom,
    DateTime timeFormat,
  }) async {
    final $request = <String, dynamic>{};
    timeArg?.also((arg) => $request['TimeArg'] = _s.iso8601ToJson(arg));
    timeCustom?.also((arg) =>
        $request['TimeCustom'] = _s.unixTimestampToJson(arg).toString());
    timeFormat?.also((arg) =>
        $request['TimeFormat'] = _s.unixTimestampToJson(arg).toString());
    await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['InputShape'],
      shapes: shapes,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
