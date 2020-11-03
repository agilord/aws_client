// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show Uint8ListConverter, Uint8ListListConverter;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Timestamp shapes
class TimestampShapes {
  final _s.RestXmlProtocol _protocol;
  TimestampShapes({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: 'TimestampShapes',
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
    final queryParams = <String, String>{};
    timeArgInQuery
        ?.let((v) => queryParams['TimeQuery'] = v.toUtc().toIso8601String());
    timeCustomInQuery?.let(
        (v) => queryParams['TimeCustomQuery'] = v.toUtc().toIso8601String());
    timeFormatInQuery?.let(
        (v) => queryParams['TimeFormatQuery'] = v.toUtc().toIso8601String());
    await _protocol.send(
      method: 'POST',
      requestUri: '/2014-01-01/hostedzone',
      queryParams: queryParams,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
